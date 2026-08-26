Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71A53F44F4;
	Wed, 26 Aug 2026 11:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787742319; cv=none; b=LzhRLTI4NqObvoXLOwuLrJR0xgOE+YEwaaKfSYMZpHIPr2ONZZ/fvbaVDlZTssLgka+VSchmt9yD4mp/fXk7z16Auonnt9ZgZnQQ/no7ElG2jSVrbndPmBvYih4tP1zf3WUvf7lB0ounErF0mLRDi7i1kMVuSeh6CToeydt+jao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787742319; c=relaxed/simple;
	bh=7/Y9XZ5qIwUjf+u7QQqudzX1t75NIVQ/MCF+ZqoRVR4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cbQZ8SrAZr/JHvwzFbtxOb21raPdXJ3cVOndQ4eVMIG8GWXPSS5DOBiyop6Jw13T2QESBx66znzBe/B3KeYDuP+whG8ciFSzDM1Gd23uJd3+5sEnnaJ82mH7sVSRoI5TSQQ777wcduS0TA9aIZ9nTug9Lv7thMfDXWc0GAwGaxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HGcOrgIx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HGcOrgIx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3CAE3C2BCFF;
	Wed, 26 Aug 2026 11:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787742318;
	bh=7/Y9XZ5qIwUjf+u7QQqudzX1t75NIVQ/MCF+ZqoRVR4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HGcOrgIxFwPBvdMekb0RkTIdq/831EZLYxtU/msUOGQPKAI8HqF7FJBqG8wD8u5qm
	 5myUcZNXIv9M3pkPlkxEIW8AB98U+rMUF2DxtZOr4pF36Mjkv5IgJEgIlIIHwiU+/2
	 ZMyDOL/yuo+75wGfvtMQY75VbtLxgh1GR5kep+HPg6PmMLDg1/xRq69HBIYwzgDjI3
	 uSKzHcbD45ud5cLDNMirAHU/nE9PqZxG3j+jip66E0Xp1Kg69psO9YMINJ537g+WJg
	 pty+327l5Gmz5RLiuyL39WqT7tbFyNvu01qO7rsGdWe9Mp9oy3bjeftXkTwQO2NZXA
	 70WOppIwpRIug==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18BF6C61DC2;
	Wed, 26 Aug 2026 11:05:18 +0000 (UTC)
From: Pawel Laszczak via B4 Relay <devnull+pawell.cadence.com@kernel.org>
Date: Wed, 26 Aug 2026 13:24:37 +0200
Subject: [PATCH v2 2/3] usb: gadget: composite: Support eUSB2v2 bulk MPS
 update request
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-eusb2v2-packet-size-v2-2-950f19f38ef0@cadence.com>
References: <20260826-eusb2v2-packet-size-v2-0-950f19f38ef0@cadence.com>
In-Reply-To: <20260826-eusb2v2-packet-size-v2-0-950f19f38ef0@cadence.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pawel Laszczak <pawell@cadence.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787743495; l=5196;
 i=pawell@cadence.com; h=from:subject:message-id;
 bh=+Vgq/zHgap/LYmFpRV7EEJ5RdXoqLEH7MZOSzzbXWI8=;
 b=dBfN2BXKb9YNLzbz0NF/O5d2ZEEu1SCzk9xxftMLJYdG3BVJBGavzvtCvk9/bAq53TZEP9qPc
 dCPdWhL1ImRDrcxU6rd/XMxlbP9mzc+cJ5HdMdXSp7KJngmCMJhcwXk
X-Developer-Key: i=pawell@cadence.com; a=ed25519;
 pk=EUPBvLO9CDg7j6defeDl2iqi+z5Ivqu4Z46aiqe7dYc=
X-Endpoint-Received: by B4 Relay for pawell@cadence.com/default with
 auth_id=707
X-Original-From: Pawel Laszczak <pawell@cadence.com>
Reply-To: pawell@cadence.com

From: Pawel Laszczak <pawell@cadence.com>

Add support for eUSB2v2 1024-byte Bulk MPS negotiation to the Gadget
Composite framework.

If 'gadget->is_eusb2v2' is set, force bcdUSB to 0x0230 and bMaxPacketSize0
to 64 bytes. Handle the USB_DEVICE_BULK_MAX_PACKET_UPDATE feature request
by introducing eusb2_update_mps_bulk(), which dynamically updates the
wMaxPacketSize of all HS Bulk endpoint descriptors to 1024 bytes before
the device is configured.

Signed-off-by: Pawel Laszczak <pawell@cadence.com>
---
Changes in v2:
- composite.c: CLEAR_FEATURE(BULK_MAX_PACKET_UPDATE) is not defined in the
  eUSB2v2 spec; stall it instead of incorrectly setting 1024-byte mode.
- restore MPS in __composite_disconnect
---
 drivers/usb/gadget/composite.c | 68 ++++++++++++++++++++++++++++++++++++++----
 include/linux/usb/gadget.h     |  2 ++
 2 files changed, 64 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index dc3664374596..f0246e25f2b5 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -924,6 +924,48 @@ static void device_qual(struct usb_composite_dev *cdev)
 }
 
 /*-------------------------------------------------------------------------*/
+static void eusb2_update_ep_mps(struct usb_descriptor_header *header, __le16 mps)
+{
+	struct usb_endpoint_descriptor *epd;
+
+	if (header->bDescriptorType != USB_DT_ENDPOINT)
+		return;
+
+	epd = (void *)header;
+	if (usb_endpoint_xfer_bulk(epd))
+		epd->wMaxPacketSize = mps;
+}
+
+static int eusb2_update_mps_bulk(struct usb_composite_dev *cdev, bool set)
+{
+	__le16 mps = cpu_to_le16(set ? 1024 : 512);
+	struct usb_gadget *gadget = cdev->gadget;
+	struct usb_configuration *config;
+	struct usb_function *f;
+
+	if (!gadget->is_eusb2v2)
+		return -EINVAL;
+
+	if (set && gadget->state >= USB_STATE_CONFIGURED)
+		return -EINVAL;
+
+	list_for_each_entry(config, &cdev->configs, list) {
+		if (!config->highspeed)
+			continue;
+
+		list_for_each_entry(f, &config->functions, list) {
+			struct usb_descriptor_header **desc = f->hs_descriptors;
+
+			if (!desc)
+				continue;
+
+			for (; *desc; desc++)
+				eusb2_update_ep_mps(*desc, mps);
+		}
+	}
+
+	return 0;
+}
 
 static void reset_config(struct usb_composite_dev *cdev)
 {
@@ -971,8 +1013,10 @@ static int set_config(struct usb_composite_dev *cdev,
 		if (result < 0)
 			goto done;
 	} else { /* Zero configuration value - need to reset the config */
-		if (cdev->config)
+		if (cdev->config) {
 			reset_config(cdev);
+			eusb2_update_mps_bulk(cdev, false);
+		}
 		result = 0;
 	}
 
@@ -1807,7 +1851,11 @@ composite_setup(struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
 				count_configs(cdev, USB_DT_DEVICE);
 			cdev->desc.bMaxPacketSize0 =
 				cdev->gadget->ep0->maxpacket;
-			if (gadget_is_superspeed(gadget)) {
+
+			if (gadget->is_eusb2v2) {
+				cdev->desc.bcdUSB = cpu_to_le16(0x0230);
+				cdev->desc.bMaxPacketSize0 = 64;
+			} else if (gadget_is_superspeed(gadget)) {
 				if (gadget->speed >= USB_SPEED_SUPER) {
 					cdev->desc.bcdUSB = cpu_to_le16(0x0320);
 					cdev->desc.bMaxPacketSize0 = 9;
@@ -2005,12 +2053,19 @@ composite_setup(struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
 	 */
 	case USB_REQ_CLEAR_FEATURE:
 	case USB_REQ_SET_FEATURE:
-		if (!gadget_is_superspeed(gadget))
-			goto unknown;
-		if (ctrl->bRequestType != (USB_DIR_OUT | USB_RECIP_INTERFACE))
-			goto unknown;
 		switch (w_value) {
+		case USB_DEVICE_BULK_MAX_PACKET_UPDATE:
+			if (ctrl->bRequestType != (USB_DIR_OUT | USB_RECIP_DEVICE))
+				goto unknown;
+			if (ctrl->bRequest != USB_REQ_SET_FEATURE)
+				goto unknown;
+			value = eusb2_update_mps_bulk(cdev, true);
+			break;
 		case USB_INTRF_FUNC_SUSPEND:
+			if (!gadget_is_superspeed(gadget))
+				goto unknown;
+			if (ctrl->bRequestType != (USB_DIR_OUT | USB_RECIP_INTERFACE))
+				goto unknown;
 			if (!cdev->config || intf >= MAX_CONFIG_INTERFACES)
 				break;
 			f = cdev->config->interface[intf];
@@ -2293,6 +2348,7 @@ static void __composite_disconnect(struct usb_gadget *gadget)
 	 * disconnect callbacks?
 	 */
 	spin_lock_irqsave(&cdev->lock, flags);
+	eusb2_update_mps_bulk(cdev, false);
 	cdev->suspended = 0;
 	if (cdev->config)
 		reset_config(cdev);
diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index 8285b19a25e0..3c554fe95f87 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -420,6 +420,7 @@ struct usb_gadget_ops {
  * @wakeup_armed: True if gadget is armed by the host for remote wakeup.
  * @irq: the interrupt number for device controller.
  * @id_number: a unique ID number for ensuring that gadget names are distinct
+ * @is_eusb2v2: True if controller is Embedded usb2.
  *
  * Gadgets have a mostly-portable "gadget driver" implementing device
  * functions, handling all usb configurations and interfaces.  Gadget
@@ -483,6 +484,7 @@ struct usb_gadget {
 	unsigned			lpm_capable:1;
 	unsigned			wakeup_capable:1;
 	unsigned			wakeup_armed:1;
+	unsigned			is_eusb2v2:1;
 	int				irq;
 	int				id_number;
 };

-- 
2.43.0


