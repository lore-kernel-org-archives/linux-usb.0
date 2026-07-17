Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343663ECBC4;
	Fri, 17 Jul 2026 10:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784284016; cv=none; b=NVDL8ccDAI7qpbu57n6bQO94/weiGBUDatceeK+G/CFQxFeUVpl+dbrdK40+CD1PKo3aOHabyGYNUrsCMtt8iEzu+lU0qLwhUVpQCrGHFl4xi4Fv7A3oN/J2UwnOnXdDBBTa06Y5/7PYPJHfbVR6L+IW7cNyugv1daGLCFxxbDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784284016; c=relaxed/simple;
	bh=ruGA/S07N+ySzaerz9AV3uF9UjUXHVPnaqN609WVLgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zq3ztRJdOd4XDc2vhbaUf6Tthmy/P0tps7cYe7Ia+23P65cQJArnjgCSvzYCTeQlyswQog9cJral1f0+7KKLeNnaWpfYGUIZTcdu2HPx4puScQd2HKhnUxOfKS6M7JSqW8tBhrBvrQLnzZJ8TU21wQ7OZSBmur8OLTrxcK0fbTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kKNjjqRP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kKNjjqRP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01FAEC2BCF4;
	Fri, 17 Jul 2026 10:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784284014;
	bh=ruGA/S07N+ySzaerz9AV3uF9UjUXHVPnaqN609WVLgE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kKNjjqRPvLds9QF1NYY+mROjWyPepsHYM6OT54LNMVb6KgskGP1i59kujGR5vvv0Y
	 Q+qKFkcsVzgJFhIDzP+fhqbLcluUT4j/7xIKyIKf3WkwS+0YSgBe0msftjnXkc+8AO
	 hfoQblxyQdXZfV0Hh+Y3UFXbp3vNYm8Od6b60p12y717qr8612DKbTrcjhK6+p8Lwd
	 OoycvwiOkCMo68fXp57K+TcTshMBJp5rCkGR4Dx63ALrfu9s/ln1VnpP1ZXbTQTLjO
	 Kcptocwc5unhq4RJtPLw4v9XM6hSdzHzW1dfcYlJ0V4c5S7L6BHOi5ghXRe0QTWLj0
	 m0yvUObO8eqHQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D688CC44507;
	Fri, 17 Jul 2026 10:26:53 +0000 (UTC)
From: Pawel Laszczak via B4 Relay <devnull+pawell.cadence.com@kernel.org>
Date: Fri, 17 Jul 2026 12:44:15 +0200
Subject: [PATCH 2/3] usb: gadget: composite: Support eUSB2v2 bulk MPS
 update request
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-eusb2v2-packet-size-v1-2-67c611bd0c5b@cadence.com>
References: <20260717-eusb2v2-packet-size-v1-0-67c611bd0c5b@cadence.com>
In-Reply-To: <20260717-eusb2v2-packet-size-v1-0-67c611bd0c5b@cadence.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pawel Laszczak <pawell@cadence.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784285103; l=4930;
 i=pawell@cadence.com; h=from:subject:message-id;
 bh=BinsopW6J/BJzPhINKchDQl5qlxVOPT1dCsHQoufo9s=;
 b=oRplN9glS7CnNkMYW7suoV3GQopKgyXSB/iq9eO1ojSik5QaZ9d/OiPelyBkpH4lVH2LTyj/S
 qvtbOUejU3/C599lzN7feIVEe5jgGZkEy1ietqklrbsV5AhcSjUH1Du
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
 drivers/usb/gadget/composite.c | 67 ++++++++++++++++++++++++++++++++++++++----
 include/linux/usb/gadget.h     |  2 ++
 2 files changed, 63 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index dc3664374596..e009f8c4281c 100644
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
@@ -2005,12 +2053,18 @@ composite_setup(struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
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
+
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
@@ -2303,6 +2357,7 @@ static void __composite_disconnect(struct usb_gadget *gadget)
 
 void composite_disconnect(struct usb_gadget *gadget)
 {
+	eusb2_update_mps_bulk(get_gadget_data(gadget), false);
 	usb_gadget_vbus_draw(gadget, 0);
 	__composite_disconnect(gadget);
 }
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


