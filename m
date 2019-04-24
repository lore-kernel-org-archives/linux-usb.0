Return-Path: <SRS0=e+xf=S2=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5183C282CE
	for <linux-usb@archiver.kernel.org>; Wed, 24 Apr 2019 09:29:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF58C20878
	for <linux-usb@archiver.kernel.org>; Wed, 24 Apr 2019 09:29:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728208AbfDXJ3k (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 24 Apr 2019 05:29:40 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:41990 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726176AbfDXJ3j (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Apr 2019 05:29:39 -0400
X-IronPort-AV: E=Sophos;i="5.60,389,1549897200"; 
   d="scan'208";a="13992947"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 24 Apr 2019 18:29:38 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1201C42A01A9;
        Wed, 24 Apr 2019 18:29:34 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Kees Cook <keescook@chromium.org>, linux-usb@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH V5 6/9] usb: gadget: udc: renesas_usb3: Use usb_role_switch framework
Date:   Wed, 24 Apr 2019 10:22:20 +0100
Message-Id: <1556097743-12717-7-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556097743-12717-1-git-send-email-biju.das@bp.renesas.com>
References: <1556097743-12717-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190424092220.ZLmisoa8Ym_nqUP-b3eeiXzCvvpoPNPgMQI0R7G4-28@z>

RZ/G2E cat874 board is capable of detecting cable connect and disconnect
events. Add support for renesas_usb3 to receive connect and disconnect
events and support dual-role switch using usb-role-switch framework.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 V4-->V5
   * Incorporated Shimoda-san's review comment
    (https://patchwork.kernel.org/patch/10902537/)
 V3-->V4
   * No Change
 V2-->V3
   * Incorporated Shimoda-san's review comment
     (https://patchwork.kernel.org/patch/10852507/)
   * Used renesas,usb-role-switch property for differentiating USB
     role switch associated with Type-C port controller driver.
 V1-->V2
   * Driver uses usb role clas for handling dual role switch and handling
     connect/disconnect events instead of extcon.
---
 drivers/usb/gadget/udc/renesas_usb3.c | 92 ++++++++++++++++++++++++++++++++---
 1 file changed, 85 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 7dc2485..230f5a5 100644
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
@@ -699,8 +702,11 @@ static void usb3_mode_config(struct renesas_usb3 *usb3, bool host, bool a_dev)
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
@@ -716,7 +722,9 @@ static void usb3_check_id(struct renesas_usb3 *usb3)
 {
 	usb3->extcon_host = usb3_is_a_device(usb3);
 
-	if (usb3->extcon_host && !usb3->forced_b_device)
+	if ((!usb3->usb_role_switch_property &&
+	     usb3->extcon_host && !usb3->forced_b_device) ||
+	     usb3->connection_state == USB_ROLE_HOST)
 		usb3_mode_config(usb3, true, true);
 	else
 		usb3_mode_config(usb3, false, false);
@@ -2343,14 +2351,65 @@ static enum usb_role renesas_usb3_role_switch_get(struct device *dev)
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
@@ -2361,6 +2420,20 @@ static int renesas_usb3_role_switch_set(struct device *dev,
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
@@ -2650,7 +2723,7 @@ static const unsigned int renesas_usb3_cable[] = {
 	EXTCON_NONE,
 };
 
-static const struct usb_role_switch_desc renesas_usb3_role_switch_desc = {
+static struct usb_role_switch_desc renesas_usb3_role_switch_desc = {
 	.set = renesas_usb3_role_switch_set,
 	.get = renesas_usb3_role_switch_get,
 	.allow_userspace_control = true,
@@ -2741,6 +2814,11 @@ static int renesas_usb3_probe(struct platform_device *pdev)
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

