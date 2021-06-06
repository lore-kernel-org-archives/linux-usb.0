Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36D55C4743E
	for <linux-usb@archiver.kernel.org>; Sun,  6 Jun 2021 20:11:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03CE0613AD
	for <linux-usb@archiver.kernel.org>; Sun,  6 Jun 2021 20:11:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbhFFUMx (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 6 Jun 2021 16:12:53 -0400
Received: from fgw23-7.mail.saunalahti.fi ([62.142.5.84]:57733 "EHLO
        fgw23-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229813AbhFFUMx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 6 Jun 2021 16:12:53 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw23.mail.saunalahti.fi (Halon) with ESMTP
        id 5087b670-c703-11eb-8ccd-005056bdfda7;
        Sun, 06 Jun 2021 23:11:01 +0300 (EEST)
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v1 1/3] usb: typec: intel_pmc_mux: Put fwnode in error case during ->probe()
Date:   Sun,  6 Jun 2021 23:09:09 +0300
Message-Id: <20210606200911.32076-1-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

device_get_next_child_node() bumps a reference counting of a returned variable.
We have to balance it whenever we return to the caller.

Fixes: 6701adfa9693 ("usb: typec: driver for Intel PMC mux control")
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/usb/typec/mux/intel_pmc_mux.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
index 46a25b8db72e..134325444e6a 100644
--- a/drivers/usb/typec/mux/intel_pmc_mux.c
+++ b/drivers/usb/typec/mux/intel_pmc_mux.c
@@ -645,6 +645,7 @@ static int pmc_usb_probe(struct platform_device *pdev)
 	return 0;
 
 err_remove_ports:
+	fwnode_handle_put(fwnode);
 	for (i = 0; i < pmc->num_ports; i++) {
 		typec_switch_unregister(pmc->port[i].typec_sw);
 		typec_mux_unregister(pmc->port[i].typec_mux);
-- 
2.31.1

