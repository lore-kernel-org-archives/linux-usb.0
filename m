Return-Path: <SRS0=sojL=SO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE93C10F0E
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 10:23:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8A7E72083E
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 10:23:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbfDLKXJ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 12 Apr 2019 06:23:09 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:7316 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726327AbfDLKXJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Apr 2019 06:23:09 -0400
X-IronPort-AV: E=Sophos;i="5.60,340,1549897200"; 
   d="scan'208";a="13075825"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 12 Apr 2019 19:23:07 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 679C542F9426;
        Fri, 12 Apr 2019 19:23:04 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Kees Cook <keescook@chromium.org>, linux-usb@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH V3 4/7] usb: gadget: udc: renesas_usb3: Use usb_role_switch framework
Date:   Fri, 12 Apr 2019 11:16:16 +0100
Message-Id: <1555064179-15626-5-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555064179-15626-1-git-send-email-biju.das@bp.renesas.com>
References: <1555064179-15626-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190412101616.JLkPkwmpVL9QiV3gOcmHJbmuSrDZfP1cziwBp35KuRg@z>

RZ/G2E cat874 board is capable of detecting cable connect and disconnect
events. Add support for renesas_usb3 to receive connect and disconnect
events and support dual-role switch using usb-role-switch framework.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 V2-->V3
   * Incorporated Shimoda-san's review comment
     (https://patchwork.kernel.org/patch/10852507/)
   * Used renesas,usb-role-switch property for differentiating USB
     role switch associated with Type-C port controller driver.
 V1-->V2
   * Driver uses usb role clas for handling dual role switch and handling
     connect/disconnect events instead of extcon.
---
 drivers/usb/gadget/udc/renesas_usb3.c | 126 ++++++++++++++++++++++++++++------
 1 file changed, 104 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 7dc2485..efee047 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -351,6 +351,8 @@ struct renesas_usb3 {
 	int disabled_count;
 
 	struct usb_request *ep0_req;
+
+	enum usb_role connection_state;
 	u16 test_mode;
 	u8 ep0_buf[USB3_EP0_BUF_SIZE];
 	bool softconnect;
@@ -359,6 +361,7 @@ struct renesas_usb3 {
 	bool extcon_usb;		/* check vbus and set EXTCON_USB */
 	bool forced_b_device;
 	bool start_to_connect;
+	bool usb_role_switch_property;
 };
 
 #define gadget_to_renesas_usb3(_gadget)	\
@@ -644,22 +647,6 @@ static void usb3_disconnect(struct renesas_usb3 *usb3)
 		usb3->driver->disconnect(&usb3->gadget);
 }
 
-static void usb3_check_vbus(struct renesas_usb3 *usb3)
-{
-	if (usb3->workaround_for_vbus) {
-		usb3_connect(usb3);
-	} else {
-		usb3->extcon_usb = !!(usb3_read(usb3, USB3_USB_STA) &
-							USB_STA_VBUS_STA);
-		if (usb3->extcon_usb)
-			usb3_connect(usb3);
-		else
-			usb3_disconnect(usb3);
-
-		schedule_work(&usb3->extcon_work);
-	}
-}
-
 static void renesas_usb3_role_work(struct work_struct *work)
 {
 	struct renesas_usb3 *usb3 =
@@ -699,8 +686,11 @@ static void usb3_mode_config(struct renesas_usb3 *usb3, bool host, bool a_dev)
 	unsigned long flags;
 
 	spin_lock_irqsave(&usb3->lock, flags);
-	usb3_set_mode_by_role_sw(usb3, host);
-	usb3_vbus_out(usb3, a_dev);
+	if (!usb3->usb_role_switch_property ||
+	    usb3->connection_state != USB_ROLE_NONE) {
+		usb3_set_mode_by_role_sw(usb3, host);
+		usb3_vbus_out(usb3, a_dev);
+	}
 	/* for A-Peripheral or forced B-device mode */
 	if ((!host && a_dev) || usb3->start_to_connect)
 		usb3_connect(usb3);
@@ -724,6 +714,28 @@ static void usb3_check_id(struct renesas_usb3 *usb3)
 	schedule_work(&usb3->extcon_work);
 }
 
+static void usb3_check_vbus(struct renesas_usb3 *usb3)
+{
+	if (usb3->workaround_for_vbus) {
+		if (usb3->usb_role_switch_property) {
+			if (usb3->connection_state == USB_ROLE_DEVICE) {
+				usb3_mode_config(usb3, false, false);
+				usb3_connect(usb3);
+			}
+		} else
+			usb3_connect(usb3);
+	} else {
+		usb3->extcon_usb = !!(usb3_read(usb3, USB3_USB_STA) &
+							USB_STA_VBUS_STA);
+		if (usb3->extcon_usb)
+			usb3_connect(usb3);
+		else
+			usb3_disconnect(usb3);
+
+		schedule_work(&usb3->extcon_work);
+	}
+}
+
 static void renesas_usb3_init_controller(struct renesas_usb3 *usb3)
 {
 	usb3_init_axi_bridge(usb3);
@@ -2343,14 +2355,65 @@ static enum usb_role renesas_usb3_role_switch_get(struct device *dev)
 	return cur_role;
 }
 
-static int renesas_usb3_role_switch_set(struct device *dev,
-					enum usb_role role)
+static void handle_ext_role_switch_states(struct device *dev,
+					    enum usb_role role)
+{
+	struct renesas_usb3 *usb3 = dev_get_drvdata(dev);
+	struct device *host = usb3->host_dev;
+	enum usb_role cur_role = renesas_usb3_role_switch_get(dev);
+
+	switch (role) {
+	case USB_ROLE_NONE:
+		usb3->connection_state = USB_ROLE_NONE;
+		if (usb3->driver)
+			usb3_disconnect(usb3);
+		usb3_vbus_out(usb3, false);
+		break;
+	case USB_ROLE_DEVICE:
+		if (usb3->connection_state == USB_ROLE_NONE) {
+			usb3->connection_state = USB_ROLE_DEVICE;
+			usb3_set_mode(usb3, false);
+			if (usb3->driver)
+				usb3_connect(usb3);
+		} else if (cur_role == USB_ROLE_HOST)  {
+			device_release_driver(host);
+			usb3_set_mode(usb3, false);
+			if (usb3->driver)
+				usb3_connect(usb3);
+		}
+		usb3_vbus_out(usb3, false);
+		break;
+	case USB_ROLE_HOST:
+		if (usb3->connection_state == USB_ROLE_NONE) {
+			if (usb3->driver)
+				usb3_disconnect(usb3);
+
+			usb3->connection_state = USB_ROLE_HOST;
+			usb3_set_mode(usb3, true);
+			usb3_vbus_out(usb3, true);
+			if (device_attach(host) < 0)
+				dev_err(dev, "device_attach(host) failed\n");
+		} else if (cur_role == USB_ROLE_DEVICE) {
+			usb3_disconnect(usb3);
+			/* Must set the mode before device_attach of the host */
+			usb3_set_mode(usb3, true);
+			/* This device_attach() might sleep */
+			if (device_attach(host) < 0)
+				dev_err(dev, "device_attach(host) failed\n");
+		}
+		break;
+	default:
+		break;
+	}
+}
+
+static void handle_role_switch_states(struct device *dev,
+					    enum usb_role role)
 {
 	struct renesas_usb3 *usb3 = dev_get_drvdata(dev);
 	struct device *host = usb3->host_dev;
 	enum usb_role cur_role = renesas_usb3_role_switch_get(dev);
 
-	pm_runtime_get_sync(dev);
 	if (cur_role == USB_ROLE_HOST && role == USB_ROLE_DEVICE) {
 		device_release_driver(host);
 		usb3_set_mode(usb3, false);
@@ -2361,6 +2424,20 @@ static int renesas_usb3_role_switch_set(struct device *dev,
 		if (device_attach(host) < 0)
 			dev_err(dev, "device_attach(host) failed\n");
 	}
+}
+
+static int renesas_usb3_role_switch_set(struct device *dev,
+					enum usb_role role)
+{
+	struct renesas_usb3 *usb3 = dev_get_drvdata(dev);
+
+	pm_runtime_get_sync(dev);
+
+	if (usb3->usb_role_switch_property)
+		handle_ext_role_switch_states(dev, role);
+	else
+		handle_role_switch_states(dev, role);
+
 	pm_runtime_put(dev);
 
 	return 0;
@@ -2650,7 +2727,7 @@ static const unsigned int renesas_usb3_cable[] = {
 	EXTCON_NONE,
 };
 
-static const struct usb_role_switch_desc renesas_usb3_role_switch_desc = {
+static struct usb_role_switch_desc renesas_usb3_role_switch_desc = {
 	.set = renesas_usb3_role_switch_set,
 	.get = renesas_usb3_role_switch_get,
 	.allow_userspace_control = true,
@@ -2741,6 +2818,11 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_dev_create;
 
+	if (device_property_read_bool(&pdev->dev, "renesas,usb-role-switch")) {
+		usb3->usb_role_switch_property = true;
+		renesas_usb3_role_switch_desc.fwnode = dev_fwnode(&pdev->dev);
+	}
+
 	INIT_WORK(&usb3->role_work, renesas_usb3_role_work);
 	usb3->role_sw = usb_role_switch_register(&pdev->dev,
 					&renesas_usb3_role_switch_desc);
-- 
2.7.4

