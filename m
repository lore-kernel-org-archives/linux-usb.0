Return-Path: <SRS0=e+xf=S2=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82257C10F11
	for <linux-usb@archiver.kernel.org>; Wed, 24 Apr 2019 09:29:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5984E20878
	for <linux-usb@archiver.kernel.org>; Wed, 24 Apr 2019 09:29:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727875AbfDXJ3V (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 24 Apr 2019 05:29:21 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:57182 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726176AbfDXJ3V (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Apr 2019 05:29:21 -0400
X-IronPort-AV: E=Sophos;i="5.60,389,1549897200"; 
   d="scan'208";a="14200184"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 24 Apr 2019 18:29:19 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D56DA42A01A9;
        Wed, 24 Apr 2019 18:29:16 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yu Chen <chenyu56@huawei.com>
Cc:     linux-usb@vger.kernel.org,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        John Stultz <john.stultz@linaro.org>
Subject: [PATCH V5 1/9] usb: roles: Introduce stubs for the exiting functions in role.h.
Date:   Wed, 24 Apr 2019 10:22:15 +0100
Message-Id: <1556097743-12717-2-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556097743-12717-1-git-send-email-biju.das@bp.renesas.com>
References: <1556097743-12717-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190424092215.6jRFXN8Q639zvERD4YbDK8N8y9p5blJabZNR8OQSsdk@z>

From: Yu Chen <chenyu56@huawei.com>

This patch adds stubs for the exiting functions while
CONFIG_USB_ROLE_SWITCH does not enabled.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: John Stultz <john.stultz@linaro.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Yu Chen <chenyu56@huawei.com>
---
 * This is a dependency patch for the next patch in this series
   Ref:(https://patchwork.kernel.org/patch/10909971/)
 
 Note:- This patch is added to this series to avoid compilation issues.
---
 include/linux/usb/role.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/linux/usb/role.h b/include/linux/usb/role.h
index c05ffa6..da2b964 100644
--- a/include/linux/usb/role.h
+++ b/include/linux/usb/role.h
@@ -42,6 +42,8 @@ struct usb_role_switch_desc {
 	bool allow_userspace_control;
 };
 
+
+#if IS_ENABLED(CONFIG_USB_ROLE_SWITCH)
 int usb_role_switch_set_role(struct usb_role_switch *sw, enum usb_role role);
 enum usb_role usb_role_switch_get_role(struct usb_role_switch *sw);
 struct usb_role_switch *usb_role_switch_get(struct device *dev);
@@ -51,5 +53,33 @@ struct usb_role_switch *
 usb_role_switch_register(struct device *parent,
 			 const struct usb_role_switch_desc *desc);
 void usb_role_switch_unregister(struct usb_role_switch *sw);
+#else
+static inline int usb_role_switch_set_role(struct usb_role_switch *sw,
+		enum usb_role role)
+{
+	return 0;
+}
+
+static inline enum usb_role usb_role_switch_get_role(struct usb_role_switch *sw)
+{
+	return USB_ROLE_NONE;
+}
+
+static inline struct usb_role_switch *usb_role_switch_get(struct device *dev)
+{
+	return ERR_PTR(-ENODEV);
+}
+
+static inline void usb_role_switch_put(struct usb_role_switch *sw) { }
+
+static inline struct usb_role_switch *
+usb_role_switch_register(struct device *parent,
+			 const struct usb_role_switch_desc *desc)
+{
+	return ERR_PTR(-ENODEV);
+}
+
+static inline void usb_role_switch_unregister(struct usb_role_switch *sw) { }
+#endif
 
 #endif /* __LINUX_USB_ROLE_H */
-- 
2.7.4

