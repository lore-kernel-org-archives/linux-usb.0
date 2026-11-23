Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795412358;
	b=31qudSMWYmBB5gsgAAF97OehYudlB7+au+JCCnBZAkPrz+kikq7wUdq2LnEbnTCwLqwF
	 ah2OcEdmJonVcpeetA8X6rIo/RFtmWiT0AmKtnJrJ/SbUOY0h2FS2zXoasDSryCabSQUG
	 1zU8d52rfcetIYq8FL15lDh8n3WpkrCzX5wAmD140SZLpnovl6AySqBWMZrHHcdkZKgPN
	 JvGPfaFT9ggXq+TNI90ZPZtvPqFjofCM7EYdOA5cTPUyRcPHIBU2B/zf8+RW1hgE/cetG
	 B76V4ge/0Tov42zuMa9Qt570mGh4Mw/8SuUhP6Wl2mk21Lh0HtnrViZgXncrc7YRi3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795412358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BxLsp/7fm7vmE3YeyIg1YDl2+7NAVmPu9zSe0GsblOY=;
	b=b7dNQvcaRT+EdWe8kMxcpuMOTX50+uBV/19bg9gva4Y1HM90u2tJxS2mkw9LYb6IpT6p
	 i1XSFKRgB9soBLjkraZ9yx7EkjP3GDPLlURdKP+477bGCWW4P5L9nZijAxVPir6aIQzOG
	 bqYAfgE7cdl7+YxXzWHdHHDJmwXHWiaVvYPyNIBdNEkVcVxFM0C5VaOcXH4fshy9qrFrK
	 Hjj13RXFOigqwape+KKsh3DpOLvzD/XpDMp+m6xwN+UcjOLqGbPcvqgEqC6pNqlWrvzcm
	 QiJlL8R2lfdoxFk0RwXN8GcTeoQcBt7SaTXu3bA5Y7EcLvBmrXipc4XZueSlviHTEXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gbQI1Zl0;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A71606A31E
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 05:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04A71606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gbQI1Zl0
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-380b40312e2so7024746eec.1
        for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 21:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795412357; x=1796017157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BxLsp/7fm7vmE3YeyIg1YDl2+7NAVmPu9zSe0GsblOY=;
        b=gbQI1Zl0FifLwxaooOLPhwIjqB8LPOC0Jddug8zX8RiPxZ5ePa0rj6oM+cqp6Sx0dj
         p9ditWCx484cXa3BSOKvlYyHLnntVHcjM74B1rjl39drnqm/Qr4T51GvVasw32BM3bN7
         3Qy06ctUfezuD0XBu1BrTNRYlC7g6jGKtGqlysn4Wf8cp/m65zyJ+Ia5d5dCKhNgBVsu
         Px9/dQzhBO7PRM4+hz/R4Nwqm8ff7HcY8GlRg3x1x5Z9Ghh8aefuWM4l3sYtLs+1R+Os
         aKAOP9/b9ApVZrts+jR1SigdqTLbhmNxOn5Rl/+Q3YDi4agxIjKxkwycjAtTOOGMlowl
         qClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795412357; x=1796017157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BxLsp/7fm7vmE3YeyIg1YDl2+7NAVmPu9zSe0GsblOY=;
        b=st8kUFKCmLlPCxXwO8PfAyOzgC74mxHD1Cv+2EKyo5xP9MLH863SStTukUKHAraFh8
         im9lWZOwf5oRa8BPZbrKZtxOKyE3VkWSmBlm/xTTzSuZm8Jrpmg61cvEze46Wtr5uucg
         gJEio5psC+1oRBx4ENsu7aimYmyiRFbrHJ8jNqDvL1tJ/otb9Cn+dMgqs9+Tsk6XmZQR
         rx9xaY689hNI8WBMuLVo/qaGZs+7eQlsjZ3a2VriTe7AVvnTESy4qFi3EGcFSY4Elq69
         SghV2j25NoKnh6/Wqv8k3Jc/aadWVrRsPk5A543l5deWbq85lJgZatAfo99yXTQHWr0/
         MmVg==
X-Forwarded-Encrypted: i=1; AL+hErHgpVVMMwJIRLsoM6GkruFyQ1q57Gn/1i6dN38rVUiiJ82yPV5cmWFMIocXE60nxSFrRNZ8SCIleTI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8k2dQVvgrAq51LPZllcLjc92qfYJTVaAtptr+8f9BNKrAXZ2IE
	XNH48E+q5c4lXu9MHec4bQpEUvml/nnVX3kq+50hxPV87pOGW5clavE=
X-Gm-Gg: AZFdTZeC7N51Zv6g/YgGAk2xIbQRljEjczuPuUflpRPB0Emp8jqJHdLZn8aS9/vwNr+
	qMD8BJqB941TL7q9YviWNP09YbEL8g6mdF/lcP1dErgkWde6FdQc29Nvv5w4YEsigxP/LHvdMKl
	85BWB+2dmN550o7yRMfYwmK+J+RLkptg4ZUf7RGw8qJY4NfGLuVcKyVdGaBo8NohduXFdzmzlxP
	Ht+MCGendP0wook3uwunKhW0RDyk7958cWs0/F+mEXvnPpQX1RVzmHQbmo7Ei1R4CyOgrGSRC4V
	7yROECEDVnYnmR2XN9T5gP5fpm8tYSD3F5VzEv+5TxhD7rvCRVGkY8K/cKaKPMAG5L39jQhE/cR
	TRcwyGdBw2fwwwKh0SJmUfO3wJ8Q10sVveduYhW26Qhf5BgbHgTp71u18l4zN6uqZ4ODJ65vdKg
	hQYJRgDLlUHyar1aKTIHLPYli4G6Pm+/6yRrH4X4kUBoKgjq8NaoefFgmHUPQWV9grJA6BD0t8j
	fD4mSYDx8/PeQokDOrzK5Isw47v+p9YuMxbmRDh4Vt6aUDwSNbcUlnLPVCaw0OFXgsrdzXfoG5r
	YHmcv7891dOgIcJdd8tcAOl1OxD3ntlgyCzgT/NoZXn1BMYwkH28PnGXw2KYQMqh6VaDg0pWDGz
	M4whSinTy3xvycf3cY7W+O99RVgukiw==
X-Received: by 2002:a05:7300:de05:b0:385:a2b5:94d2 with SMTP id 5a478bee46e88-385a2b596e3mr9867119eec.25.1795412356996;
        Sun, 22 Nov 2026 21:39:16 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009.tailbdca44.ts.net ([27.60.27.67])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm28519017eec.8.2026.11.22.21.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:39:16 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] usb: acpi: Get correct location data for Apple macs
Date: Mon, 23 Nov 2026 00:39:09 -0500
Message-ID: <20261123053911.9856-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In All macs, the _PLD values in ACPI is just garbage values
and provide no real data, and that may cause errors like:

usb: port power management may be unreliable

On Internal controllers, with multiple USB2.0 and USB3.0.

To fix this we use Apple's own location methods called SSD
for USB2.0, and they use _ADR for USB3.0.

With this patch we get proper location and peering:

[    0.280281] usb usb2-port2: peered to usb1-port10
[    0.280298] usb usb2-port3: peered to usb1-port3
[    0.280311] usb usb2-port4: peered to usb1-port14
[    0.280325] usb usb2-port5: peered to usb1-port8
[    0.280354] usb usb2-port9: peered to usb1-port9

NOTE: All USB controller has bad _PLD values but SSD is only available
      on internal USB controller, and even only new intel macs has SSD
      method, so we check for SSD and XHC1 before using apple's methods.

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/usb/core/usb-acpi.c | 71 +++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
index 489dbdc96..b5c61a2ea 100644
--- a/drivers/usb/core/usb-acpi.c
+++ b/drivers/usb/core/usb-acpi.c
@@ -12,6 +12,7 @@
 #include <linux/acpi.h>
 #include <linux/pci.h>
 #include <linux/usb/hcd.h>
+#include <linux/platform_data/x86/apple.h>
 
 #include "hub.h"
 
@@ -199,6 +200,66 @@ static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
  */
 #define USB_ACPI_LOCATION_VALID (1 << 31)
 
+/*
+ * Set at registration time on x86 Apple Macs whose internal XHC1 controller
+ * has ports exposing an SSP object. Apple reports the port location through
+ * SSP (USB 2.0) and _ADR (USB 3.x) instead of _PLD.
+ */
+static bool is_apple_location;
+
+static acpi_status
+usb_acpi_apple_ssp_cb(acpi_handle handle, u32 level, void *ctx, void **ret)
+{
+	if (!acpi_has_method(handle, "SSP"))
+		return AE_OK;
+
+	*(bool *)ctx = true;
+	return AE_CTRL_TERMINATE;
+}
+
+static void usb_acpi_apple_detect_ssp(acpi_handle xhc1)
+{
+	bool found = false;
+
+	acpi_walk_namespace(ACPI_TYPE_DEVICE, xhc1, ACPI_UINT32_MAX,
+			    usb_acpi_apple_ssp_cb, NULL, &found, NULL);
+	is_apple_location = found;
+}
+
+static void
+usb_acpi_apple_get_location(struct usb_port *port_dev, struct acpi_device *adev)
+{
+	struct usb_device *hdev = to_usb_device(port_dev->dev.parent->parent);
+	struct acpi_device *hc = ACPI_COMPANION(hdev->bus->sysdev);
+	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *ssp;
+	acpi_status status;
+
+	/* Only applies to the CPU's internal XHCI controller. */
+	if (!hc || strncmp(acpi_device_bid(hc), "XHC1", ACPI_NAMESEG_SIZE))
+		return;
+
+	/* USB 3.x ports use _ADR as the location. */
+	if (hdev->speed >= USB_SPEED_SUPER) {
+		port_dev->location = USB_ACPI_LOCATION_VALID |
+				     adev->pnp.bus_address;
+		return;
+	}
+
+	/* USB 2.0 ports: SSP = { "XHCn", <companion SuperSpeed port> } */
+	status = acpi_evaluate_object_typed(adev->handle, "SSP", NULL, &buffer,
+					    ACPI_TYPE_PACKAGE);
+	if (ACPI_FAILURE(status))
+		return;
+
+	ssp = buffer.pointer;
+	if (ssp->package.count >= 2 &&
+	    ssp->package.elements[1].type == ACPI_TYPE_INTEGER)
+		port_dev->location = USB_ACPI_LOCATION_VALID |
+				     ssp->package.elements[1].integer.value;
+	kfree(buffer.pointer);
+}
+
 static void
 usb_acpi_get_connect_type(struct usb_port *port_dev, acpi_handle *handle)
 {
@@ -289,6 +350,10 @@ usb_acpi_find_companion_for_port(struct usb_port *port_dev)
 
 	usb_acpi_get_connect_type(port_dev, adev->handle);
 
+	/* Apple's location overrides the _PLD derived one */
+	if (is_apple_location)
+		usb_acpi_apple_get_location(port_dev, adev);
+
 	return adev;
 }
 
@@ -377,6 +442,12 @@ static struct acpi_bus_type usb_acpi_bus = {
 
 int usb_acpi_register(void)
 {
+	acpi_handle xhc1;
+
+	if (x86_apple_machine &&
+	    ACPI_SUCCESS(acpi_get_handle(NULL, "\\_SB.PCI0.XHC1", &xhc1)))
+		usb_acpi_apple_detect_ssp(xhc1);
+
 	return register_acpi_bus_type(&usb_acpi_bus);
 }
 
-- 
2.55.0

