Received: from smtp-relay-4.sys.kth.se (smtp-relay-4.sys.kth.se [130.237.48.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B6D11CAF
	for <linux-usb@vger.kernel.org>; Sun, 22 Feb 2026 17:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.237.48.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771780278; cv=none; b=ksSP/eZMfadzvNcca0ZsqfL9EkHumYfhlAlfQeod16zCDVB0/ugqkFhga66LLla8HrPS4IIMlLgvQto5XYI1QzDdaslmD6FzvSo43xGI733bnvQ7cGDRDMVJpxAf9RFSYIu9QJ7lOjx1/OWdJZqXAsC/KYRCp1BG1H4bJ4dt6Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771780278; c=relaxed/simple;
	bh=BneFa3G627awMSyC3tbPbkD6T+tS7k7U0N5K+XSJNeE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qfu6uaFQuPdG/Rt31x13BUIHFgsbdC4LzPG2x4vFYjNbb69y/OJRJaD4VMTF3F1n4aVRX+Synv6vs7T5Ekv80MpiBcPeNGMUDzn1C4JTDQA6h21ewc0WLCa84KbdjulLNHmctSQ1rB0RdQbcNXU7p9Jvkk0yd320JUoWb0boUnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=stacken.kth.se; spf=pass smtp.mailfrom=stacken.kth.se; dkim=pass (2048-bit key) header.d=stacken.kth.se header.i=@stacken.kth.se header.b=uvNvHXY6; arc=none smtp.client-ip=130.237.48.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=stacken.kth.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stacken.kth.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stacken.kth.se header.i=@stacken.kth.se header.b="uvNvHXY6"
Received: from mail-2.stacken.kth.se (mail-2.stacken.kth.se [IPv6:2001:6b0:1:ea:5054:ff:fe3a:40f3])
	by smtp-relay-4.sys.kth.se (Postfix) with ESMTP id 4fJqxZ6SD0zPNQL;
	Sun, 22 Feb 2026 18:00:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp-relay-4.sys.kth.se 4fJqxZ6SD0zPNQL
Authentication-Results: smtp-relay-4.sys.kth.se;
	dkim=pass (2048-bit key, unprotected) header.d=stacken.kth.se header.i=@stacken.kth.se header.a=rsa-sha256 header.s=mail header.b=uvNvHXY6
Received: from betty.fdsoft.se (h-212-116-76-53.A498.priv.bahnhof.se [212.116.76.53])
	by mail-2.stacken.kth.se (Postfix) with ESMTPSA id A3AA68043B;
	Sun, 22 Feb 2026 18:00:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stacken.kth.se;
	s=mail; t=1771779650;
	bh=BneFa3G627awMSyC3tbPbkD6T+tS7k7U0N5K+XSJNeE=;
	h=From:To:Cc:Subject:Date:From;
	b=uvNvHXY6+dHVy5vckVhhs/jh3b8AjWitj9dan6JZ/QuMwJoxTpZR+Bht/WWUZHXvv
	 EOyngr6EpYU6zZEh+06+990vj3Wod3uPXdrZxTyS9kvmrp073Z6OYXbhoj0wFR/MN1
	 LRo7rImerzeca7+6TbbOm9VbjQpRY22Bd5iR+045Kllgm8QH0KV9x9Wn062FLbpDfK
	 LeEqpIiF9nRbr6mb3fuPC6TCst3xuzdQLqUyWYTG0QlGKqi6WsKfLTUBPwI0CZKLhi
	 Kkrfa+ChGaT/FrGDavG+h9nikRY7Ww+nbXkq03atPmLS83n/wgDLLBzKUHmfEwebDw
	 WSFwnSAclgq0Q==
Received: from ester.fdsoft.se ([192.168.1.2])
	by betty.fdsoft.se with esmtp (Exim 4.98.2)
	(envelope-from <frej@stacken.kth.se>)
	id 1vuCp8-000000003ry-1V1D;
	Sun, 22 Feb 2026 18:00:50 +0100
From: frej@stacken.kth.se
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	Frej Drejhammar <frej@stacken.kth.se>
Subject: [PATCH] USB: serial: Add support for Blackbox IC135A to Edgeport driver
Date: Sun, 22 Feb 2026 18:00:42 +0100
Message-ID: <20260222170042.353042-1-frej@stacken.kth.se>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Frej Drejhammar <frej@stacken.kth.se>

The Blackbox 724-746-5500 USB Director USB-RS-232 HUB, part number
IC135A, is a rebadged Edgeport/4 with its own USB device id.

Signed-off-by: Frej Drejhammar <frej@stacken.kth.se>
---
 drivers/usb/serial/io_edgeport.c | 3 +++
 drivers/usb/serial/io_usbvend.h  | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/usb/serial/io_edgeport.c b/drivers/usb/serial/io_edgeport.c
index 1fffda7647f9..ad73040b30c8 100644
--- a/drivers/usb/serial/io_edgeport.c
+++ b/drivers/usb/serial/io_edgeport.c
@@ -73,6 +73,7 @@ static const struct usb_device_id edgeport_4port_id_table[] = {
 	{ USB_DEVICE(USB_VENDOR_ID_ION, ION_DEVICE_ID_EDGEPORT_22I) },
 	{ USB_DEVICE(USB_VENDOR_ID_ION, ION_DEVICE_ID_EDGEPORT_412_4) },
 	{ USB_DEVICE(USB_VENDOR_ID_ION, ION_DEVICE_ID_EDGEPORT_COMPATIBLE) },
+	{ USB_DEVICE(USB_VENDOR_ID_ION, ION_DEVICE_ID_BLACKBOX_IC135A) },
 	{ }
 };
 
@@ -121,6 +122,7 @@ static const struct usb_device_id id_table_combined[] = {
 	{ USB_DEVICE(USB_VENDOR_ID_ION, ION_DEVICE_ID_EDGEPORT_8R) },
 	{ USB_DEVICE(USB_VENDOR_ID_ION, ION_DEVICE_ID_EDGEPORT_8RR) },
 	{ USB_DEVICE(USB_VENDOR_ID_ION, ION_DEVICE_ID_EDGEPORT_412_8) },
+	{ USB_DEVICE(USB_VENDOR_ID_ION, ION_DEVICE_ID_BLACKBOX_IC135A) },
 	{ USB_DEVICE(USB_VENDOR_ID_NCR, NCR_DEVICE_ID_EPIC_0202) },
 	{ USB_DEVICE(USB_VENDOR_ID_NCR, NCR_DEVICE_ID_EPIC_0203) },
 	{ USB_DEVICE(USB_VENDOR_ID_NCR, NCR_DEVICE_ID_EPIC_0310) },
@@ -470,6 +472,7 @@ static void get_product_info(struct edgeport_serial *edge_serial)
 	case ION_DEVICE_ID_EDGEPORT_2_DIN:
 	case ION_DEVICE_ID_EDGEPORT_4_DIN:
 	case ION_DEVICE_ID_EDGEPORT_16_DUAL_CPU:
+	case ION_DEVICE_ID_BLACKBOX_IC135A:
 		product_info->IsRS232 = 1;
 		break;
 
diff --git a/drivers/usb/serial/io_usbvend.h b/drivers/usb/serial/io_usbvend.h
index 9a6f742ad3ab..648b9e23b3cd 100644
--- a/drivers/usb/serial/io_usbvend.h
+++ b/drivers/usb/serial/io_usbvend.h
@@ -213,6 +213,7 @@
 // Definitions for other product IDs
 #define ION_DEVICE_ID_MT4X56USB			0x1403	// OEM device
 #define ION_DEVICE_ID_E5805A			0x1A01  // OEM device (rebranded Edgeport/4)
+#define ION_DEVICE_ID_BLACKBOX_IC135A		0x0801	// OEM device (rebranded Edgeport/4)
 
 
 #define	GENERATION_ID_FROM_USB_PRODUCT_ID(ProductId)				\

base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
-- 
2.53.0

