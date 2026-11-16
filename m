Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871174;
	b=EVnIGcITNJxcjm7KxKL+SqO9Ig6hZRzGrrw5GjlXwUJ84E2IMkrApVclxylN/v0/tmJS
	 Ml6T7i3fl1hFrchEsudLpChPG5KQJCUfw/j/W9sCwXduSNV8uw2z5feaXbo0iTQvVSaY8
	 7EsR8w24LsrXeGJH1qkQ0ecMBorlNrJBu0JoPNmKUbjl6H1rbiLP52VUDQ/9FHti3ibvT
	 WYxqp4sLUQfQuo5TB6313sXA+jJx+/gAWpBwMFb+UVSELJl5OndH4h4oJUWSRw6PLA5/8
	 Yd4tSHviaYkdH7pkuwP1IAnxphWSB93rOBeC/tXguDPMnGSnIPUwfYK1Y1Iu9Vr9zHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jw2CbGEioaYFyvgvzlTesDNeS0REYhiPWP30MLKwFJk=;
	b=I/33TiPT+JOLxQPxu+UwZu0ZiHR98bdj/meBILaVE3k/k0rgs6rIoL0L1YnPT4upQVJx
	 Px2ryqGPUivj8RWuvc/Ijz9lXEN6oIY8iFLBOI8RCCgAgCaSL4UHMpMPIbODQyPq+UBa6
	 o9HRC9RqEItLNja4JHkY9G3DkYtmYwDNPyePyi1oM0fb+lM03cNj2XB4uMrb4pyFvtTGB
	 L2ZlqHCaOf1b31DPDCepnQd9qMB36uTSjSWzzqq4dAHMRM+XdwoUMhaRzY9xdV4juPh5E
	 b3ZtIP5BOvp3xIkFUtjk0jFbBwJnq5OuItdSDXppT/7NF51OXNCjiYCKD+Y9DOFK3PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K0VBv9+u;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADF4606A334
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 23:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ADF4606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K0VBv9+u
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so5244384eec.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 15:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794871173; x=1795475973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jw2CbGEioaYFyvgvzlTesDNeS0REYhiPWP30MLKwFJk=;
        b=K0VBv9+uEAW3U1m3nHj/RhxFnyVzTfOxeu0Dug6e00X2cDNWWUuJ3l0jnxg6MfLDtP
         bAEUS/hKP74/CzEouyE5o2qene3PrbGhHbIICN+6+HyuVl6q0Ak7ZGaAl4G60yQOMKU3
         oT1jyVcoX9d3U+HDGhXNt4IZGknaIykItdV0VytANiydDs8+873IlJXCio8TLAIdWaZX
         0LLoJTq+V5z0as8wxa14ak6qgB02H3JszpBRUrpWTCZx03Q6t9ASYq+CKYW5WX03o+hw
         SLwIqAJzLCawiTLUHvtSAFuq5VelxQhCJYVGxrfxVRbWBw3ra8VIJmJ2R+KORynNsDNw
         TATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871173; x=1795475973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jw2CbGEioaYFyvgvzlTesDNeS0REYhiPWP30MLKwFJk=;
        b=JZVQ+Aysyl+JC8ea4MzjiBcJpb/zVxKbjbkO8omsUbybyC87LsYMoDH86mvq6yLvCx
         xPF0t/hzG/7QnxHVBclmAT590PQ3oYQve4nPGif/4Pt1s2pECJ2F+ix+PT3+Btu7roRQ
         70iaY/U+zX3j6f17WWib5lo8a8ZQZKuPqgxUAM6WhbSDuRpogKc8AmhGBB+I/+CUQGEg
         wlsxZUvl7ow2knoQi6YIlrzbz+n+q6E2tlPkTAJt1QWgLkkVc4R8hvhBhLOXewoNeVmj
         J/Xa4Csy8U5ose59E1DEJSXAuZI+W32iXaex0UZNwy3KNNgrSiyf4zljCazYPxO2Bt6L
         sQNA==
X-Forwarded-Encrypted: i=1; AL+hErGu71A0LDpgzJBYsD1/Tq8Yhq1KQ2X6EVV4P27yYYPbmzOCwkQGjHP7PuCRcL3hf9RNc8nvPARuW2I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/x5kVFwjEevnzYc5/9c0MrwYf4JHrtOcMD/CSA+hxrqo1cUf9U
	yPR9cBMntqLuETT7yA5MuzY7qzwP7coUh2Dr+/CMUQ5APfNlH+w86hqGoODj
X-Gm-Gg: AZFdTZdmkRSg21F2hy9qxPmYzA7EzSmmzhQDWYysU27nq+DmepZiivl4oicCr8PoO4V
	kCHpUMjZHRGfW5nt5riKWuiYF6Y2r7Ucy9midK+dapCGJHXilEKSsZeFR8H+eu1jc/Uh8Ya3osQ
	xs0CUSfielVlAFMv93nLS8mDqvddvrXBFzIu5IqLBpatAd6qnawgcOoUyxcVUy/Hyre1wGB2dd+
	14OWHCDrzvJH9CiWbrCAIOQMkyf70kH1s3/6ZQpaSCgwzj09fGpC3LZqGbLbC9N6oHiC1eIcy/7
	lqmNWKCzUscirWOCRzLuFMafmru34dn1I6aGI84NvX5z+hzYYB1T7NcqxfF7/UA+RQPJ1buOx6G
	BHOKMVKATtac4LwRF/TuJ/UuTlkxuQ1zhhgmgKzsgwQXvY0exOdmk5oiLBnODFKmoQnJkXL8+2q
	yYsTJKjeSWS7v90ANd18vZuh9DMOV07cmrgVHohT0Xy5oP2AnOMoTlg3bnb/XM+K8zaHXlrce/t
	+r7GL4KYdIjez3McO7qJS9Pn02Nqxn2RdrLKN8vRqiMQeNH0FywI8MRXQH9xS/ghdnBHpL5UNn+
	N5W63B959SkI6kefXmKa8e7SAnVSh5xnjOOT3JIH/BrBs/EqB8dmaqbegsEJODR5Pyw=
X-Received: by 2002:a05:7301:4d07:b0:375:87f5:ccee with SMTP id 5a478bee46e88-379684b56e7mr12857126eec.29.1794871173283;
        Mon, 16 Nov 2026 15:19:33 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.202.127.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm56940788eec.8.2026.11.16.15.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:19:32 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org (open list:USB XHCI DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] usb: xhci-pci: Add Power handling for Card readers on Apple systems
Date: Mon, 16 Nov 2026 18:19:24 -0500
Message-ID: <20261116231926.5891-1-atharvatiwarilinuxdev@gmail.com>
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
the card reader, on newer systems SPWR just write a variable in EC.
On previous systems it writes to GPIO pins.

It also used by the macOS driver with the function
AppleUSB30XHCICardReaderPort::setDevicePower in AppleUSBXHCIPCI.kext.

(This should fix https://bugzilla.kernel.org/show_bug.cgi?id=111201
 But thats not confirmed)

(Tested on iMac20,1)

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/usb/host/xhci-pci.c | 17 +++++++++++++++++
 drivers/usb/host/xhci.h     |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index e278db940..0cbecbbbb 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -15,6 +15,7 @@
 #include <linux/reset.h>
 #include <linux/suspend.h>
 #include <linux/bitfield.h>
+#include <linux/platform_data/x86/apple.h>
 
 #include "xhci.h"
 #include "xhci-trace.h"
@@ -517,6 +518,16 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	if (xhci->hci_version >= 0x120)
 		xhci->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;
 
+	/* On Apple Machine with Card readers, we have to use SPWR(0/1) to turn
+	 * off/on the card reader, And on boot the card reader is off, so we turn
+	 * it on.
+	 */
+	if (x86_apple_machine && ACPI_HANDLE(&pdev->dev) &&
+			acpi_has_method(ACPI_HANDLE(&pdev->dev), "SPWR")) {
+		acpi_execute_simple_method(ACPI_HANDLE(&pdev->dev), "SPWR", 1);
+		xhci->quirks |= XHCI_APPLE_CARD_READER_POWER;
+	}
+
 	if (xhci->quirks & XHCI_RESET_ON_RESUME)
 		xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
 				"QUIRK: Resetting on resume");
@@ -853,6 +864,9 @@ static int xhci_pci_suspend(struct usb_hcd *hcd, bool do_wakeup)
 	/* synchronize irq when using MSI-X */
 	xhci_msix_sync_irqs(xhci);
 
+	if (xhci->quirks & XHCI_APPLE_CARD_READER_POWER)
+		acpi_execute_simple_method(ACPI_HANDLE(&pdev->dev), "SPWR", 0);
+
 	if (ret && (xhci->quirks & XHCI_SSIC_PORT_UNUSED))
 		xhci_ssic_port_unused_quirk(hcd, false);
 
@@ -895,6 +909,9 @@ static int xhci_pci_resume(struct usb_hcd *hcd, pm_message_t msg)
 	if (xhci->quirks & XHCI_PME_STUCK_QUIRK)
 		xhci_pme_quirk(hcd);
 
+	if (xhci->quirks & XHCI_APPLE_CARD_READER_POWER)
+		acpi_execute_simple_method(ACPI_HANDLE(&pdev->dev), "SPWR", 1);
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

