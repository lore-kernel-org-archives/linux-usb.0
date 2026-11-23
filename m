Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795473107;
	b=W8KH0Yi0ND7NjvNaIryeMqzgoNwXW8tx4v+UOhk5MRwZG58lJrHmCHE3hUR6KecOo8cu
	 7n6LzKh9ctyp5aSw9ceBtA+r62jyP6xYqKaXWdbPKDX3T8sGpRMuKYIQrYlyBET006lHT
	 1G0rvfJJgIFNOAJLgjMhzJzw+BaTUX+EvORgRTSPWv8p82T6sp4IXisFv4O20P61kii3M
	 vmEgQY8fCy5XTqk+zVG72/Vea8Slx2PPF2UZeJGpIqkPYCTk/PvfoGqkEQGLLX9MDQzy2
	 67Eg/+GHo1+WxADpMkmIXYsPcQPmax23Cd/gggdpC4KtGVW1tBxp5S2XBp45K0zPq1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795473107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vxMGbe5FaOFrEGMfmq39YEeJbVxbtwlJMdZhgTQG6dE=;
	b=fXl+RglskIyRv/dZu0CUU49ztRqTz5EmmRi7Wndhw3HX/n4f3pPX2UlpN19TvGdbYuJB
	 owKpNZYM6PuwhQk+dbWlPjaTQADGHZxasQt6sQfH+7lOp+6gCDPJQJuJPqdIo3OCNHL5r
	 TWX/KYKLXyf13IcpJCh9nD2JuvXhBFSYbsRSPFjIWdAb8/jUKB2/ipVKYGAQJDTnA+YAU
	 hT2ON/VreNGGG4DYIoyptpxVha+f4ZbdyngIUUp5mc4hXoHPvZfmLccp26sYU7oKeZK6s
	 RAc58vZ9upDWmb+Uvw7hCCRQ/J+BngGYivHkbdTzuNlJZ7T9S4YjG8P5FmvMoeYUIig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KzPlHuKZ;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157AE606A31E
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 22:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 157AE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KzPlHuKZ
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36a315ed211so4842398eec.0
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 14:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795473105; x=1796077905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vxMGbe5FaOFrEGMfmq39YEeJbVxbtwlJMdZhgTQG6dE=;
        b=KzPlHuKZisnZAqTv8PHS9cRJ9AEMo7rOicyFQdHLLDJFPtSRAOWQ/kZ7LfHPfr73xx
         qfgQMovLzYwCEjfu0qZDlHlvLvlrrafNdg+Bn0fH0qXkBtJGwxmZiBl9pvIhnqlv0rdL
         tIKseaEwTPr0qq1EuLMENYWfRaos+q8jY1b80GVixfVhmVN7kTpWHmOuQRfgeJXa4NRi
         3spGX5deR32vpKv++FCTheF2Gw1d4Y8t0mk7vQTkFVJAIDjyKJql32L0zpFSVHItx/Vc
         KM4I+3OAAC5uEKIvK4Jnk7sVWAl70DHYZkPwaMZCNYOTxu10rnr7pVO2/EmRm9ewR06W
         7frQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795473105; x=1796077905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vxMGbe5FaOFrEGMfmq39YEeJbVxbtwlJMdZhgTQG6dE=;
        b=QFDpumvdaFaVmSpihEltpVZrtN7LdKPPayC4MXZIEZAPL2mr++Y1cKTBjYQtB77jVl
         EdMWj4jPIHHJMOBk06+CUyIwRKbLKyVbeol5lXZ2nve61VsUxPTqHeYp3dLxhUv81xtg
         OnLNJtcm1oAms6bQwM9E7iZyDWV5N6YpCJwbGYybEceAaFVLybf5GHX/SwFdrlnAPsf+
         XL+NwVYFNcO/kMks6486YvjsURaHScAY5YUiAGpDAoHoJ2QqcOJmTRYKrGdjkmvGyGYq
         j6CRUuSblkDpCD8KYY03TipzGS2W7C3b6lSYG72NolJM5Nj501D5XRlXmAI+MNpn3PBR
         Wx8g==
X-Forwarded-Encrypted: i=1; AL+hErFx9/rsOmqkx/f/c9c9/IJ/hq4irH1LUSn9PfembxLXrQV8OUtIcv1E6Vb+iZ4GveQQ1Ihz4DIEivA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bJWZ1a+eJ11rEoRQCrkARyrDmnuoI7NKzJuWZLqTc7paZS8Hg
	fIG5zog5RS2eAbF6Bk9GU2YZ5Yb9D17YX0A8eRlYNpkoe+G8n359PEo=
X-Gm-Gg: AZFdTZeFc34vxdvw5LF+CcRYN0pBJkV6J3RIlE4t1s3fY8SdLzFaQrQnpaQsz+rpb6F
	i74dYKeUiYSqBtfjVbL3f7xx2sbdzzuQ7qSTZuTE6nVc8IGxt+Fvc2hW5t+w3Uek3bQtrtQaD9e
	8dQNxIQoBAARtpNZy2dLByefgo2ebSAGLXKIRn2x5ReHUUTntz1QiwdxFprbwWdsqVpuoz/1ohk
	GQM2ksloz2EfLMk3GPfAwRvaAGUWEcmujeldcw8bCQT0/b5E3IJhAGxwqfktUfBOwLIn0IX0cq+
	hKE7TM3D4qJSasEjSNx6B7VpYoTqIYdv96GhjFIX865oKUiUbHpdTUVFQMhqbL8P0BWZuUL0pa9
	BrDlP0ole3CghMB8Ud6Cv5/aDed3TIO9Rn6TYWXbKRrSXoTQEXb+3DJ/C6iyQe/6tsnZ45uHv3x
	Sjt+1Mpcao7XON4emsGaZY9wemjveg3gSRl/jDkls7AjZWY7WtdPAv8SvUb34NoM84OHjqe5jru
	UmqqPcvCKDlXnwJ+Av7bNfUgqu4g6mhvMlaKhHM755ehM+S9b2N6p8LGe3tsns14Ybj0ssS8KSp
	AvEPJpAdo06Mi3jbVJNqWltJtIFK87hTj/bGYrr/fkr4PdTMMyIoEM5+ka7HW/S3G1mRcepOi09
	EllSo8v4LonMphg==
X-Received: by 2002:a05:7300:6b0a:b0:382:75b5:e77 with SMTP id 5a478bee46e88-384b4a80eeemr15380222eec.25.1795473104914;
        Mon, 23 Nov 2026 14:31:44 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009.tailbdca44.ts.net ([106.205.242.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm45787611eec.10.2026.11.23.14.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 14:31:44 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org (open list:USB XHCI DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4] usb: xhci-pci: Add Power handling for Card readers on Apple systems
Date: Mon, 23 Nov 2026 17:31:36 -0500
Message-ID: <20261123223138.1165-1-atharvatiwarilinuxdev@gmail.com>
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

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
Changes in v4:
- Check for !do_wakeup in suspend to prevent breaking sd card in
  runtime pm
- Set card reader power to 0 on xhci_pci_remove
- Added blank line
- Fixed comment style

Changes in v3:
- Added changes at correct location
- Removed accidental usb-acpi code.

Changes in v2:
- Fixed grammatical errors.
- Added CONFIG_ACPI check
- Checked for xhci_suspend success before turning off power

Link to v3:
https://lore.kernel.org/all/20261123051459.9581-1-atharvatiwarilinuxdev@gmail.com/

Link to v2:
https://lore.kernel.org/all/20261123044412.8721-1-atharvatiwarilinuxdev@gmail.com/

Link to v1:
https://lore.kernel.org/all/20261116231926.5891-1-atharvatiwarilinuxdev@gmail.com/

 drivers/usb/host/xhci-pci.c | 28 ++++++++++++++++++++++++++++
 drivers/usb/host/xhci.h     |  1 +
 2 files changed, 29 insertions(+)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index e278db940..b89dd83ec 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -15,6 +15,7 @@
 #include <linux/reset.h>
 #include <linux/suspend.h>
 #include <linux/bitfield.h>
+#include <linux/platform_data/x86/apple.h>
 
 #include "xhci.h"
 #include "xhci-trace.h"
@@ -517,6 +518,19 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	if (xhci->hci_version >= 0x120)
 		xhci->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;
 
+#ifdef CONFIG_ACPI
+	/*
+	 * On Apple machines with a card reader, the reader is powered
+	 * off at boot. Evaluate SPWR(1) to turn it on, so it works at
+	 * boot. SPWR(0) turns it off again.
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
@@ -563,9 +577,14 @@ static void xhci_find_lpm_incapable_ports(struct usb_hcd *hcd, struct usb_device
 	}
 }
 
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
@@ -750,6 +769,9 @@ void xhci_pci_remove(struct pci_dev *dev)
 
 	usb_hcd_pci_remove(dev);
 
+	if (xhci->quirks & XHCI_APPLE_CARD_READER_POWER)
+		xhci_apple_card_reader_power(dev, 0);
+
 	/* Workaround for spurious wakeups at shutdown with HSW */
 	if (set_power_d3)
 		pci_set_power_state(dev, PCI_D3hot);
@@ -853,6 +875,9 @@ static int xhci_pci_suspend(struct usb_hcd *hcd, bool do_wakeup)
 	/* synchronize irq when using MSI-X */
 	xhci_msix_sync_irqs(xhci);
 
+	if (!ret && (xhci->quirks & XHCI_APPLE_CARD_READER_POWER) && !do_wakeup)
+		xhci_apple_card_reader_power(pdev, 0);
+
 	if (ret && (xhci->quirks & XHCI_SSIC_PORT_UNUSED))
 		xhci_ssic_port_unused_quirk(hcd, false);
 
@@ -895,6 +920,9 @@ static int xhci_pci_resume(struct usb_hcd *hcd, pm_message_t msg)
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

