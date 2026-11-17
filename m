Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873646;
	b=eikVq2B3ZhypMYVfj00J4BzHhNDvcNWrSRvuU715Y/fFbtrJPb5nJbyLwR7Jpk6yUWVI
	 rM2xzYJP7nDcWz4vI9/QOVnZvlMl899khkNaHPtk1xfWfnWq6gFKAc7dqLlsIKPx9yaPu
	 15E1r/oKSsJEY5AZb2k5cRzC3aq7cuhP+RN/gXXM3fp1Adb6KK8ILcGCHBQ5gcCqR8zih
	 d2villPwvxi/hSQoa0oUSe6pvHWN6oBzUFXOcS1PyKZ4/S6GxySrGW40aZgzGkE+vqpe0
	 S2Ce8fc4A0G7VJQy1c3a6WvhNYoBGP7mgUbf6rdU8EUy/N015p9h2//PE3nq8uh59ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8/84fIsnYNevTgT8Tyj3fXtgY4rv5SdcHrjwauikJg0=;
	b=FJll9JmX8sOhEpovLlX4IBPUouM7lYWs8tlp8DzFM41MuuiBBZ5k87erEMFhDon1n1ek
	 f2jUAp7mVPnRwVR3hOFQOz3qKf8p6mSZ961xCjOI5B6Cw7wsKHMriXhnTMsQHvOHYyIMn
	 daSQyAPW+hXrO9OLCqueOczqUeW3pDNwwGoKaxfxbBYLR/MxAadinmEI2wsE3Sbh6OL3s
	 peQcJrMAv/sCf8r9tk3FYb+Zsz+bqPx+gkuBnTIKunaYFM45ek1T+xn9TlhndwQuTqZ+A
	 SebJfwfBoGB+N51iO2xaeSfJpVWyq6tq5RWCoz8XiNTaD5YzetfmXD6Ozv6wkc23CFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DVjHUOSH;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FAA606A329
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 00:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1FAA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DVjHUOSH
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-372bdb942dbso3638901eec.1
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 16:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794873641; x=1795478441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8/84fIsnYNevTgT8Tyj3fXtgY4rv5SdcHrjwauikJg0=;
        b=DVjHUOSH7KOs9wtDV7NDv6hTj0w600gwishdrCZ12ZLMkcHEtn0cTAAPoueNJe284F
         msTNBOggHrbkHsTlX6XC6ZHeCebifdfS5KNU5HUUK/UyN3mf77e7kmki2QUcUg/VKSwm
         SEo4QGPNg8mjjhnHX9AlCX/l8BOCRJgKR9wCxdNWpF/MAmHOQnQ9wh4WUrztwqN5bcMW
         HQ+D7JSpH1ufQ5x4P5YD0XcvRYBOxXmfuUhQtn5GqJhXzgG4KmNDZUurtdLgSpSlDtle
         jTOJRC3nTnmsHGKSiVUlfGn9S9Dzp14ahVY8wMKmFihnKwQE7mUbA9bXuh9WMcy9beY0
         kSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873641; x=1795478441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8/84fIsnYNevTgT8Tyj3fXtgY4rv5SdcHrjwauikJg0=;
        b=XKHKTgjdXHRlL3rmagBgakPUkKyYSkpwgkPb4DgusYnzrKuw1YC9F9/1KQTqdXR7LO
         Be+0+zrll6XMPP/CdFXmjAOSO6M79DaN9iJuAnpLvSregCnQ+jtkTKvUCCvigfM/dC78
         i11QAEir0Wj187hIDzOKit4iHkpv6NR4ucGpEtBjXHKZJ4411CmZy/LX/d+xSvkjXrBy
         eSxQv0Ow0vOtfca0reHY7cQBjITA83pFENuOGSgzHdQi9ozWyNzaOnZWwpWh2bLa4hh1
         M/H5G0qZkQiedWIAGarNyRUQyLZQyd+UB1+Q55ZQjRqOzXNWyg4+AoOpXwUKmUt8FThE
         hPew==
X-Forwarded-Encrypted: i=1; AL+hErH8t3zj7/QYNeOgeEN22zxwo78aPvmEY938YcEH5bh74uCOil0C1Xau54gPmKibxMHtTHiuV5atcB4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JKi6AFH8JzEtiLGJMpi39DpcSkL+MRp12ygaHLH6xE5cxeDZs
	Q4E4l0mxgrVzhoTvLhuduPmuix8Bq8ylpVX5imL3MH14rEd1spZrB4QsWKX6
X-Gm-Gg: AZFdTZdr1HJGJSJiibKFhek0y86/CuHUzJtpF3NM6fBERm2kGXlYH1hzy5AssTEMwsb
	/llU5WeeJ16QRBpE6wLhGNEudsO/Km1fUJvbMbBzqbpw/OZyGUUiKTtIoPq61qDduD4xK4k+Nxw
	oWt1UvQI1xquXea4PSJdZhmgjIt8Ky/S0xz8dWEpSKdc6g8kYEVFkbWPrdZoPn5uOO4pcSLXzOs
	dobNdW9HidQJJtozXbFgqOvQxZeNZ56I0asDQamvc+k5YaGjnpdpX4U6eeh33ON4EcTQKVH2jCB
	mu2dklWeKJUt3feXu40Z2JU3+vW8MWCn6ZcefiJ1mVvekWZ8iu10FZCdUQvrqO76c57EixLeZpV
	7OGBQz9i1QycCZCNmgLZK/WVHXjSwISaKA9SAT6CY2uvqfXZk5CCaPVcu7OY3WLhIRxXWwXQjmc
	gYQo2gXDXi6spvkExiEr/P0nGf/ydNt1zqpa0lbY7HVJ4wUIijuR/8tMj4sd5qa/MiT9Kf5n0kt
	DrICwRQbpHWZjqVUTDki762ajDU9Lh9Y5CdOqMKQLGfqK5ZlBOKIp9NZf8KQ1mIgqsMgOTJTgUC
	rnRAwXjhdxdfcdWlz2n+LR22GbWy9JD2lHpz4PAn01eFbOHTqCG1WcyGcUlCUt6szw==
X-Received: by 2002:a05:693c:8206:b0:36f:f3b7:6dee with SMTP id 5a478bee46e88-37966e3ab88mr13204369eec.7.1794873640677;
        Mon, 16 Nov 2026 16:00:40 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.202.127.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3815045b90esm854224eec.13.2026.11.16.16.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 16:00:40 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org (open list:USB XHCI DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] usb: xhci-pci: Add Power handling for Card readers on Apple systems
Date: Mon, 16 Nov 2026 19:00:32 -0500
Message-ID: <20261117000034.7641-1-atharvatiwarilinuxdev@gmail.com>
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
 drivers/usb/host/xhci-pci.c | 25 ++++++++++++++++++++++++-
 drivers/usb/host/xhci.h     |  1 +
 2 files changed, 25 insertions(+), 1 deletion(-)

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

