Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795409059;
	b=qXRQaDSEakU5fab5Xm6MgxrVaCPcfHcNCeIA4L2xuF6z7uoBcUDy4QtbGRzYTuH3HjFS
	 OSRvNzoQWL9VsxUZaXlzXpatmh4oZDq+g5+zQgo9yZ5hPDYhilCie25tXUVZDSBH/FNBP
	 CxsvkUi3etUMJLaCTLbQJfYxajJJaeaRGZFf+/JyFpOCVXGJJuKKk27xbBNg/TYkMGyOt
	 MZ7mxjDeTjP4JeowZ944sgh2TF8kOhm2gSX/qTsT1qeiN8Aw6xQVkJKPL+JySPA9WLGFn
	 998lSTFRgbPHHUVGftMae3DytNctQ7fQ5gjhtXTXTfje0zn6vXxO5dae55Jfc6lM7dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795409059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WFWQtd86yNkuC9tkkWvizcMlouBBSzOlV36p9Bto29A=;
	b=1VOtJcqsI+9HpOAm5cYIvzY1Vl2ZBGsApjtV/C7LUOIBJBy7nxXZARqYQDYJT/5U9jVU
	 Re5NpF1FSx73UaJ/5nKrcrQmc7ClHErYRwT61+oFTIqCnjwh1MZPxK32v9oWGVbeslVSz
	 SRY/Qad6s3/pEzjgTJ7ZAyX2kcCUg8hpGRAvEDCbXkHxrItYtZToen+W9+fdk8aKMHLAu
	 RBdtNW+pTPckorsgScjGchArstkrHs3rI0C7wwDx2wGNfKlj8PHq+yoHtM2cu9/LckvUb
	 /PHGYKW9KNjFSzbrRv1mMxs825ZzuAc1dQhdE5sdx1BhzsrDVoXJ090FyusygYEVY3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LeQ7m8UJ;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78608606A31A
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 04:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78608606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LeQ7m8UJ
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b546061d58so6525234c88.1
        for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 20:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795409058; x=1796013858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WFWQtd86yNkuC9tkkWvizcMlouBBSzOlV36p9Bto29A=;
        b=LeQ7m8UJUwumbqbaO8qllsDV3Ju+XAZVl1OPvg9NpZKO6lFxpnID3/yqoveeH9Ps/U
         G0ZWL+cV9tTZV/3oZLKevL/ENld3tMEz7xBIG/rWwlwrOEXyimr31LfOkwbGhOQUqysi
         J4FfpJMSxAYPYrnB7hb1S/veqjEcydA+pZ8vOR0t1T6GcgC8w2ysbTBIhUEN8SU+GYsK
         HT6HxVaVxSoNgRoPdb9G47RApr/CADGtdqdshEwSF2C1cmCmQdnh/a0G6Fw/lA6db1L8
         BGrJ0tpxgeFyA+etBw+lZz9epRFt6A6rzqxIPtlMdhGtE5ZGN8+QqgiVvu5iGBEoWWD3
         2Pcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795409058; x=1796013858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFWQtd86yNkuC9tkkWvizcMlouBBSzOlV36p9Bto29A=;
        b=CXwv3lXFcWYXQVFvWLYuyaO6U/SySyMpoMt90S6ZIXP+tIDNmJlsEnk9ff6x+zhSRz
         LfpyRlmOd7FHzXJXAeKL+CiPCg44Cq9f+CiixeOWTdWDkzQNz4pSUt11p/SQ0xQVcplA
         5zgUYPAgUXwglvjGf+vPiCW7cIm16zrBCQaoNGzcA0/7tf2C7bUGUC3ABTwI85OiiG0B
         /lOI7xO0ArDieA9J4Ryr8vM0Y4UFS/GQuzcUnXy05r93L18lxGStz9GgWxGKLjVUkPXu
         0I3bPpP90T3iNVQMmET2LoLOsLJjyN8rmbBUsy1msUrKVUOAw4yCqp+rBoRds2eG1Mjm
         5mIQ==
X-Forwarded-Encrypted: i=1; AL+hErGR/oS1OHNhKReYF+k0ArjFWUqzx+5tYuuJ9PXVhBfVBmw2DTNY2PqNpOIo3sIu9mAQFyDkh5WhZoQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+K7MjTxY2gTtF8CbCz2gc9TCbrD6p0+QO0h+4QOyzBY88LXtaJ
	+rQqMxebv1PYOMDa7hOjkSmoIFGtH4ZELjuFx5/R9Etnd+HOC37f0c8=
X-Gm-Gg: AZFdTZdEuJZ8zDas7sOE5HKpbKEpsaJ+NOjyYjnQdYLJ7jjmInAGAdgkLoVzl+dpIZ9
	2QC1TvQQhzOqFZc+oufht0f81hC8OmjxlJXOHr9jnGyLtKZ3F45V4qf74iFM73MEXAo6GA9r7Nj
	w5ue3UiKPtjFz4Bncx57SxdUC6h2lAGQIVAkULcg2kOFqdvh8NIQIURLPvg5kOZ/3CuFHaNKfNR
	L+mxflFe0ZUm9aDfIhvJFjed4WmLgHic+txSMdgM43XgAl2SHye46OdZ+/4uURNkdGQaRZ8m9Wd
	8ZUi8ZQUVUIkbqhaOm/iyMeJvYRhJeBZ4EcNS7tx+ryzRWV7er3rYSFNztCM5uKgyHHpADGu6JU
	3qfBSayKhxRTDZtuIM1sGWG83pvz6uDKc620LXM4yhzmh8CyCc5+y5HW39KRfJK5LshDdyZi2re
	ckgFSEgsA6fT7aKal+v4TaqQpSn82rGJLjFsGvV7yxu/uoBDjIUpcCf94XniyUwaBGl5UV01Suj
	mYeV3xHMYA2MTdk6m7M4DpNEwRHd5J4wHqdU9ZtNO2OdjeFNm6J+cnv7bWS0lNk3CVU/po+R7mR
	sCfdpGy94cDZ2P36abuauJ9RpFz097KQ+1sB72CBxkNuIvtSbOZa4pGEf5njITOfBsqii0JNEfG
	HifpZd28e
X-Received: by 2002:a05:7023:a8b:b0:1b3:af3a:e784 with SMTP id a92af1059eb24-1b5568fe775mr11992061c88.32.1795409058483;
        Sun, 22 Nov 2026 20:44:18 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009.tailbdca44.ts.net ([27.60.27.67])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm24684252c88.1.2026.11.22.20.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 20:44:18 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH RESEND v2] usb: xhci-pci: Add Power handling for Card readers on Apple systems
Date: Sun, 22 Nov 2026 23:44:09 -0500
Message-ID: <20261123044412.8721-1-atharvatiwarilinuxdev@gmail.com>
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

Add Power handling for Card readers on Apple systems using SPWR
ACPI method, SPWR(1) turns on the card reader, SPWR(0) turns off
the card reader, on newer systems SPWR just writes a variable in EC.
On previous systems it writes to GPIO pins.

Its also used by the macOS driver with the function
AppleUSB30XHCICardReaderPort::setDevicePower in AppleUSBXHCIPCI.kext.

(This should fix https://bugzilla.kernel.org/show_bug.cgi?id=111201
 But thats not confirmed)

(Tested on iMac20,1)

Changes in v2:
- Fixed grammatical errors.
- Added CONFIG_ACPI check
- Checked for xhci_suspend success before turning off power

Link to v1:
https://lore.kernel.org/all/20261116231926.5891-1-atharvatiwarilinuxdev@gmail.com/

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/usb/core/usb-acpi.c | 34 ++++++++++++++++++++++++++++++++++
 drivers/usb/host/xhci-pci.c | 25 ++++++++++++++++++++++++-
 drivers/usb/host/xhci.h     |  1 +
 3 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
index 489dbdc96..69f86b2b6 100644
--- a/drivers/usb/core/usb-acpi.c
+++ b/drivers/usb/core/usb-acpi.c
@@ -12,6 +12,7 @@
 #include <linux/acpi.h>
 #include <linux/pci.h>
 #include <linux/usb/hcd.h>
+#include <linux/platform_data/x86/apple.h>
 
 #include "hub.h"
 
@@ -199,6 +200,34 @@ static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
  */
 #define USB_ACPI_LOCATION_VALID (1 << 31)
 
+static void
+usb_acpi_apple_get_location(struct usb_port *port_dev, acpi_handle handle)
+{
+	struct usb_device *hdev = to_usb_device(port_dev->dev.parent->parent);
+	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL } ;
+	acpi_status status;
+
+	/* The function only applies to CPU's internal XHCI controller. */
+	if (strncmp(acpi_device_bid(ACPI_COMPANION(to_usb_device(
+					port_dev->dev.parent->parent)->bus->sysdev)),
+					"XHC1", ACPI_NAMESEG_SIZE))
+		return;
+
+	if (hdev->speed >= USB_SPEED_SUPER) {
+		port_dev->location = USB_ACPI_LOCATION_VALID |
+				acpi_fetch_acpi_dev(handle)->pnp.bus_address;
+		return;
+	}
+
+	status = acpi_evaluate_object_typed(handle, "SSP", NULL, &buffer, ACPI_TYPE_PACKAGE);
+	if (ACPI_FAILURE(status))
+		return;
+
+	port_dev->location = USB_ACPI_LOCATION_VALID |
+		((union acpi_object *)buffer.pointer)->package.elements[1].integer.value;
+	kfree(buffer.pointer);
+}
+
 static void
 usb_acpi_get_connect_type(struct usb_port *port_dev, acpi_handle *handle)
 {
@@ -221,6 +250,11 @@ usb_acpi_get_connect_type(struct usb_port *port_dev, acpi_handle *handle)
 		port_dev->location = USB_ACPI_LOCATION_VALID |
 			pld->group_token << 8 | pld->group_position;
 
+	/* On x86 apple macs, Apple exposes location via SSD method
+	 * instead of _PLD On USB 2.0, and on USB 3.0 it uses _ADR
+	 */
+	if (x86_apple_machine)
+		usb_acpi_apple_get_location(port_dev, handle);
 	status = acpi_evaluate_object(handle, "_UPC", NULL, &buffer);
 	if (ACPI_FAILURE(status))
 		goto out;
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index e278db940..31961de97 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -15,6 +15,7 @@
 #include <linux/reset.h>
 #include <linux/suspend.h>
 #include <linux/bitfield.h>
+#include <linux/platform_data/x86/apple.h>
 
 #include "xhci.h"
 #include "xhci-trace.h"
@@ -517,6 +518,18 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	if (xhci->hci_version >= 0x120)
 		xhci->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;
 
+#ifdef CONFIG_ACPI
+	/* On Apple Machine with Card readers, we have to use SPWR(0/1) to turn
+	 * off/on the card reader, And on boot the card reader is off, so we turn
+	 * it on.
+	 */
+	if (x86_apple_machine && ACPI_HANDLE(&pdev->dev) &&
+			acpi_has_method(ACPI_HANDLE(&pdev->dev), "SPWR")) {
+		acpi_execute_simple_method(ACPI_HANDLE(&pdev->dev), "SPWR", 1);
+		xhci->quirks |= XHCI_APPLE_CARD_READER_POWER;
+	}
+#endif /* CONFIG_ACPI */
+
 	if (xhci->quirks & XHCI_RESET_ON_RESUME)
 		xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
 				"QUIRK: Resetting on resume");
@@ -562,10 +575,14 @@ static void xhci_find_lpm_incapable_ports(struct usb_hcd *hcd, struct usb_device
 		}
 	}
 }
-
+static void xhci_apple_card_reader_power(struct pci_dev *pdev, u64 on)
+{
+	acpi_execute_simple_method(ACPI_HANDLE(&pdev->dev), "SPWR", on);
+}
 #else
 static void xhci_pme_acpi_rtd3_enable(struct pci_dev *dev) { }
 static void xhci_find_lpm_incapable_ports(struct usb_hcd *hcd, struct usb_device *hdev) { }
+static void xhci_apple_card_reader_power(struct pci_dev *pdev, u64 on) { }
 #endif /* CONFIG_ACPI */
 
 /* called during probe() after chip reset completes */
@@ -853,6 +870,9 @@ static int xhci_pci_suspend(struct usb_hcd *hcd, bool do_wakeup)
 	/* synchronize irq when using MSI-X */
 	xhci_msix_sync_irqs(xhci);
 
+	if (!ret && (xhci->quirks & XHCI_APPLE_CARD_READER_POWER))
+		xhci_apple_card_reader_power(pdev, 0);
+
 	if (ret && (xhci->quirks & XHCI_SSIC_PORT_UNUSED))
 		xhci_ssic_port_unused_quirk(hcd, false);
 
@@ -895,6 +915,9 @@ static int xhci_pci_resume(struct usb_hcd *hcd, pm_message_t msg)
 	if (xhci->quirks & XHCI_PME_STUCK_QUIRK)
 		xhci_pme_quirk(hcd);
 
+	if (xhci->quirks & XHCI_APPLE_CARD_READER_POWER)
+		xhci_apple_card_reader_power(pdev, 1);
+
 	return xhci_resume(xhci, power_lost, is_auto_resume);
 }
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index ec4bfeb48..579ddea52 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1652,6 +1652,7 @@ struct xhci_hcd {
 #define XHCI_CDNS_SCTX_QUIRK	BIT_ULL(48)
 #define XHCI_ETRON_HOST	BIT_ULL(49)
 #define XHCI_LIMIT_ENDPOINT_INTERVAL_9 BIT_ULL(50)
+#define XHCI_APPLE_CARD_READER_POWER	BIT_ULL(51)
 
 	unsigned int		num_active_eps;
 	unsigned int		limit_active_eps;
-- 
2.55.0

