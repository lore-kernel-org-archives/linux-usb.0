Return-Path: <SRS0=e+xf=S2=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A53DC10F11
	for <linux-usb@archiver.kernel.org>; Wed, 24 Apr 2019 09:29:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E5EBC20878
	for <linux-usb@archiver.kernel.org>; Wed, 24 Apr 2019 09:29:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727435AbfDXJ31 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 24 Apr 2019 05:29:27 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:42799 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726176AbfDXJ31 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Apr 2019 05:29:27 -0400
X-IronPort-AV: E=Sophos;i="5.60,389,1549897200"; 
   d="scan'208";a="13992920"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 24 Apr 2019 18:29:23 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4050242A01A9;
        Wed, 24 Apr 2019 18:29:20 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <jun.li@nxp.com>, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH V5 2/9] usb: roles: add API to get usb_role_switch by node
Date:   Wed, 24 Apr 2019 10:22:16 +0100
Message-Id: <1556097743-12717-3-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556097743-12717-1-git-send-email-biju.das@bp.renesas.com>
References: <1556097743-12717-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190424092216.Ez_-JjvbIsFisH8OdF3WPft8NlXtRsucgpQoS9cl2Yk@z>

From: Chunfeng Yun <chunfeng.yun@mediatek.com>

Add fwnode_usb_role_switch_get() to make easier to get
usb_role_switch by fwnode which register it.
It's useful when there is not device_connection registered
between two drivers and only knows the fwnode which register
usb_role_switch.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 * Rebased on top of patch1 in this series. Incorporated Heikki's review comments
   (https://patchwork.kernel.org/patch/10882555/)

 Note:- This patch is added to this series to avoid compilation issues.
---
 drivers/usb/roles/class.c | 25 +++++++++++++++++++++++++
 include/linux/usb/role.h  |  8 ++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index f45d8df..a0847a8 100644
--- a/drivers/usb/roles/class.c
+++ b/drivers/usb/roles/class.c
@@ -136,6 +136,31 @@ struct usb_role_switch *usb_role_switch_get(struct device *dev)
 EXPORT_SYMBOL_GPL(usb_role_switch_get);
 
 /**
+ * fwnode_usb_role_switch_get - Find USB role switch by it's parent fwnode
+ * @fwnode: The fwnode that register USB role switch
+ *
+ * Finds and returns role switch registered by @fwnode. The reference count
+ * for the found switch is incremented.
+ */
+struct usb_role_switch *
+fwnode_usb_role_switch_get(struct fwnode_handle *fwnode)
+{
+	struct usb_role_switch *sw;
+	struct device *dev;
+
+	dev = class_find_device(role_class, NULL, fwnode,
+				switch_fwnode_match);
+	if (!dev)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	sw = to_role_switch(dev);
+	WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
+
+	return sw;
+}
+EXPORT_SYMBOL_GPL(fwnode_usb_role_switch_get);
+
+/**
  * usb_role_switch_put - Release handle to a switch
  * @sw: USB Role Switch
  *
diff --git a/include/linux/usb/role.h b/include/linux/usb/role.h
index da2b964..0f6e2829 100644
--- a/include/linux/usb/role.h
+++ b/include/linux/usb/role.h
@@ -47,6 +47,8 @@ struct usb_role_switch_desc {
 int usb_role_switch_set_role(struct usb_role_switch *sw, enum usb_role role);
 enum usb_role usb_role_switch_get_role(struct usb_role_switch *sw);
 struct usb_role_switch *usb_role_switch_get(struct device *dev);
+struct usb_role_switch *
+fwnode_usb_role_switch_get(struct fwnode_handle *fwnode);
 void usb_role_switch_put(struct usb_role_switch *sw);
 
 struct usb_role_switch *
@@ -70,6 +72,12 @@ static inline struct usb_role_switch *usb_role_switch_get(struct device *dev)
 	return ERR_PTR(-ENODEV);
 }
 
+struct usb_role_switch *
+fwnode_usb_role_switch_get(struct fwnode_handle *fwnode)
+{
+	return ERR_PTR(-ENODEV);
+}
+
 static inline void usb_role_switch_put(struct usb_role_switch *sw) { }
 
 static inline struct usb_role_switch *
-- 
2.7.4

