Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B35BC07E9A
	for <linux-usb@archiver.kernel.org>; Wed, 14 Jul 2021 06:18:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 62B25613AB
	for <linux-usb@archiver.kernel.org>; Wed, 14 Jul 2021 06:18:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238028AbhGNGVj (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 14 Jul 2021 02:21:39 -0400
Received: from comms.puri.sm ([159.203.221.185]:52022 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237948AbhGNGVj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 14 Jul 2021 02:21:39 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id E9A2DE0092;
        Tue, 13 Jul 2021 23:18:17 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id r9lEnboJPJ-W; Tue, 13 Jul 2021 23:18:16 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     saravanak@google.com, grandmaster@al2klimov.de,
        gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com,
        rjw@rjwysocki.net
Cc:     kernel@puri.sm, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, martin.kepplinger@puri.sm
Subject: [PATCH v2] usb: typec: tipd: Don't block probing of consumer of "connector" nodes
Date:   Wed, 14 Jul 2021 08:18:07 +0200
Message-Id: <20210714061807.5737-1-martin.kepplinger@puri.sm>
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Similar as with tcpm this patch lets fw_devlink know not to wait on the
fwnode to be populated as a struct device.

Without this patch, USB functionality can be broken on some previously
supported boards.

Fixes: 28ec344bb891 ("usb: typec: tcpm: Don't block probing of consumers of "connector" nodes")
Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---

revision history
----------------
v2: (thank you Saravana)
* add a code-comment why the call is needed.

v1:
https://lore.kernel.org/linux-usb/20210713073946.102501-1-martin.kepplinger@puri.sm/



 drivers/usb/typec/tipd/core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 938219bc1b4b..21b3ae25c76d 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -629,6 +629,15 @@ static int tps6598x_probe(struct i2c_client *client)
 	if (!fwnode)
 		return -ENODEV;
 
+	/*
+	 * This fwnode has a "compatible" property, but is never populated as a
+	 * struct device. Instead we simply parse it to read the properties.
+	 * This breaks fw_devlink=on. To maintain backward compatibility
+	 * with existing DT files, we work around this by deleting any
+	 * fwnode_links to/from this fwnode.
+	 */
+	fw_devlink_purge_absent_suppliers(fwnode);
+
 	tps->role_sw = fwnode_usb_role_switch_get(fwnode);
 	if (IS_ERR(tps->role_sw)) {
 		ret = PTR_ERR(tps->role_sw);
-- 
2.30.2

