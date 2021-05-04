Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C44ECC433B4
	for <linux-usb@archiver.kernel.org>; Tue,  4 May 2021 22:39:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8BEEE613D4
	for <linux-usb@archiver.kernel.org>; Tue,  4 May 2021 22:39:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231441AbhEDWkv (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 4 May 2021 18:40:51 -0400
Received: from fgw21-7.mail.saunalahti.fi ([62.142.5.82]:57658 "EHLO
        fgw21-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229705AbhEDWku (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 May 2021 18:40:50 -0400
X-Greylist: delayed 965 seconds by postgrey-1.27 at vger.kernel.org; Tue, 04 May 2021 18:40:46 EDT
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw21.mail.saunalahti.fi (Halon) with ESMTP
        id 62d009b2-ad27-11eb-9eb8-005056bdd08f;
        Wed, 05 May 2021 01:23:44 +0300 (EEST)
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v1 1/1] usb: typec: ucsi: Put fwnode in any case during ->probe()
Date:   Wed,  5 May 2021 01:23:37 +0300
Message-Id: <20210504222337.3151726-1-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

device_for_each_child_node() bumps a reference counting of a returned variable.
We have to balance it whenever we return to the caller.

Fixes: c1b0bc2dabfa ("usb: typec: Add support for UCSI interface")
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 282c3c825c13..0e1cec346e0f 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -999,6 +999,7 @@ static const struct typec_operations ucsi_ops = {
 	.pr_set = ucsi_pr_swap
 };
 
+/* Caller must call fwnode_handle_put() after use */
 static struct fwnode_handle *ucsi_find_fwnode(struct ucsi_connector *con)
 {
 	struct fwnode_handle *fwnode;
@@ -1033,7 +1034,7 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 	command |= UCSI_CONNECTOR_NUMBER(con->num);
 	ret = ucsi_send_command(ucsi, command, &con->cap, sizeof(con->cap));
 	if (ret < 0)
-		goto out;
+		goto out_unlock;
 
 	if (con->cap.op_mode & UCSI_CONCAP_OPMODE_DRP)
 		cap->data = TYPEC_PORT_DRD;
@@ -1151,6 +1152,8 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 	trace_ucsi_register_port(con->num, &con->status);
 
 out:
+	fwnode_handle_put(cap->fwnode);
+out_unlock:
 	mutex_unlock(&con->lock);
 	return ret;
 }
-- 
2.31.1

