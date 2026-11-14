Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794633417;
	b=xcVnZIElzlzSyvt+iJ1jo2zMzUyEuiXhrVsf0HqZ0uPZiHGEjq6G+c9iId+CmMyUZPDL
	 yJWuS8lBz+Z+KzqngXHQn3q5qHh8QbQc6UuyXStal4c7y0rnCR8reFRy4FfFFYsE9da8L
	 g1FbaZM3SWQAuKs01wVy1Tz8j1iLSRNy6/8saYSW6Uu+JPxlzRqgCpg81EfIRyNIh+SFH
	 EwSf8i5W/3vr5L3nECy2rg07w8qHB6gkjh5FpUSvT7x0hmhxqODSUSqPlGcWaMgNm8H3z
	 5jaOw24JHxc4RNLoj0mhPDQUHsVWTiizNN4zxMP19zF3SB5Y4uCKgZrTSC6CA/fL/Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794633417;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ll7jhLZgwMwLpIUdadEteFwGCdAM3v9q3dzDrOrzFVc=;
	b=MFsL87k/V0IMdzcnQ2IVSFDZJ2HovjzWJyxNpo9n5H9Arex/H+tIeIuV8Ih51IAxudUd
	 Qvve9Xe80d09IWuXisizl3F+ZdrfFqoanzB8kR8CpZVZRjQVl+69WQucZJFNzH19C8EXF
	 MM1Fxm/GHe4vcqoG3gJ8KES75bKZH2xEgCEW7eewYKaImt/rW2Dx8siRmcFTnsNmoTyFx
	 ana3ctom/vssvPaueKjZ+DurjXOw7PBIDKzb0D7q6IyMIey6qogdIZJAXQSqVlzg6t8e3
	 1SHtZxn1j8MYqm8WuwReC0lhYLkgKLuG8HH4enSzRrdPqdx7crqWGWitSoSya4HVSTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=wkennington.com;
	spf=none smtp.mailfrom=wkennington.com;
	dkim=pass header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Q2cPYHkE;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92D7606A330
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 05:16:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D92D7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Q2cPYHkE
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so1384167a91.1
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 21:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20260707.gappssmtp.com; s=20260707; t=1794633416; x=1795238216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ll7jhLZgwMwLpIUdadEteFwGCdAM3v9q3dzDrOrzFVc=;
        b=Q2cPYHkEpNV1LyzjQlmgMsMJJ0fxIfGK0C8BXWsine5b4wYSJK55dhGjG6v8lsrF9w
         /Fba20TwkJtE0LUUiPiLrVVOQx3xTlFaE9EsdLi7bb5LelToet7ntiNXVoGHceNj8p7k
         KfwmhlSyugQj+Qtk89hAMY+Apr4f5plpOWq66C0CxKv09ey2tbHUa4HX2NcVFPcgMq2u
         4ACGBvE36vJ62TeHP6//oB/L3g5jI/k5rBBZoIOa6zjxRJRnotlLhAS6lspvwiXDXdgb
         kEhwO0gPE+ZEvoTrMajfyskcEL5fu2EARPGVU4MGI5FE2ESJuqnSVcLjjiCPUR3ByI1z
         njFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794633416; x=1795238216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ll7jhLZgwMwLpIUdadEteFwGCdAM3v9q3dzDrOrzFVc=;
        b=w4nA2Gt7ckbqGE6ZnNPgCSUZ8IbelNPi8HtcNTIF0jwsoHV2sCLCU0OHMFhx+j9F2h
         WcGTnaOiV2TzIqtj4tbsGmFns4B1Gr3FHIbyJ1wLy8LrTKlNSi+xvZXVrG1I8hlkkbwo
         yt26H8HNiTF418XU+bWERpUJdsBusQZsMWESLhvukx1RHu2+WX03USPFH67FigAUCbbM
         cVxUxnSuC1ZcHRwHWLIsEwVbpTNPu4cWz6KBn+OaT5CIMSgO70l6UWGop8DUbBmukU8c
         rurRuiug4tqWs7dJk3GTSnOZf1dkpohiPHGPIA4w2GmaFcjYY5fgDXD0cT7r9aw8AV3E
         PGiQ==
X-Forwarded-Encrypted: i=1; AL+hErHKuxfQ+Uw3oW/NJCq7ffu0FxI4wTHTIX103w1lUeFRdV6erdd3VtRxFZf+R3aPqtD06Y0yeHKwLG8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nSwrYoM2hG7TFBfIOvu2RN6XncyP0a0kAx7JqAsY4ja5HRhzs
	UiD/VOGLFdAlFi3k3H5NRp+KUdY6z0s68Wn+xOxIaNC5uOAYWDySUZ72FAJaesur6Tu4ctJwKfn
	m9kc5
X-Gm-Gg: AYBFou2qJqXNCuRiYtDqGMBLb0qse+UkjJT+3/L/Gc4O/iRpEwX1rVVFBGmNlRS6wv4
	11OItarU8E7yHYPHFCkOxL0O18AOk74rPHi6w7tgcRfursMKT8uTzqshllIU16NvQScbNeEfgIy
	hIPz+Tq4BpEqUYPGNH6bvFZwxq71MTrohRjyw12QRnGJz2yN7V1hkbrUdzqzCCeDPrzJTE8J4Ut
	9GxMVsoJD9y4J/dF5nHNvr4ZxebvX+JSqJJFo1RtBM59hSKMNaFQB97wKtKQtyonduAMqX2qTT3
	Fv4urW73mw2xQ1qKkME3go5aSe2ZB/npl0thgJQakTkhlT7vfiE5kSkL8/viGHqQuChoK4Xy6yH
	60cmcH26V1+z71j8JQGQtA29EakcdjPHBZGv3SVETmyY8mUCxhE/bVJ3EG6+eFcFpsUupkS1u7G
	A+iFa6yCTcK6+PzcA2aW+vUJsHx9fKDmnIoq8epwC3jHVcQkGUgFoHxG/FPCpJHxBFqMzw2wXjJ
	ujzwl1i/u4thjClqXvJcHFUMLhA/WJMI0lcZN0/4EgjvvBW4aTt+5hTx86wChDuhcW5HMdO+awi
	Nl16R/Kx5mK7tOQnvzzfVdW82nnnOp7gQbPOhAG3IsVu2GpCiOwGG9EBmFMz+MDW8sagZe5IiGE
	1zf4s7RH2HT04vA==
X-Received: by 2002:a17:90b:2e06:b0:3ac:8897:7bab with SMTP id 98e67ed59e1d1-3b1b07e1cd4mr4285508a91.6.1794633415987;
        Fri, 13 Nov 2026 21:16:55 -0800 (PST)
Received: from wak.c.googlers.com.com (246.21.127.34.bc.googleusercontent.com. [34.127.21.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae981c55sm7582410a91.1.2026.11.13.21.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 21:16:55 -0800 (PST)
From: "William A. Kennington III" <william@wkennington.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH] usb: ehci: skip companion handoff when no companion exists
Date: Sat, 14 Nov 2026 05:16:53 +0000
Message-ID: <20261114051653.1353346-1-william@wkennington.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
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

EHCI controllers without an integrated root-hub transaction translator
unconditionally set PORT_OWNER whenever a root port sees low-speed line
state before reset, finishes reset without enabling High-Speed mode, or
is relinquished by usbcore after enumeration fails. When no companion
controller is present or enabled, setting PORT_OWNER routes the port
away from EHCI to a nonexistent or disabled controller. A single missed
High-Speed chirp or transient D+/D- bounce during reset then strands
downstream USB 2.0 hubs until EHCI is rebound, and connecting a USB 1.1
device leaves the port dead to later USB 2.0 devices.

Check during ehci_setup() whether HCSPARAMS reports zero companions
(HCS_N_CC == 0), both CONFIG_USB_OHCI_HCD and CONFIG_USB_UHCI_HCD are
disabled in Kconfig (such as in aspeed_g4_defconfig,
aspeed_g5_defconfig, and BMC builds without UHCI or OHCI), or a Device
Tree companion phandle points to a disabled node. Runtime companion
binding is intentionally not checked at setup time so modular or
later-probing companion drivers still receive handoffs.

When no companion is available, set ehci->no_companion to skip
PORT_OWNER handoffs and omit the companion sysfs attribute, matching
the integrated-TT path so usbcore keeps port ownership on EHCI. USB 1.1
full- and low-speed devices still cannot enumerate without an
integrated TT or companion controller and will fail usbcore's normal
reset retries instead of triggering a PORT_OWNER handoff.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
 drivers/usb/host/ehci-hcd.c   | 31 +++++++++++++++++++++++++++++++
 drivers/usb/host/ehci-hub.c   | 21 ++++++++++-----------
 drivers/usb/host/ehci-sysfs.c |  8 ++++----
 drivers/usb/host/ehci.h       |  1 +
 4 files changed, 46 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
index 75f780ec3ba0..1e813ac5f0cb 100644
--- a/drivers/usb/host/ehci-hcd.c
+++ b/drivers/usb/host/ehci-hcd.c
@@ -26,6 +26,7 @@
 #include <linux/moduleparam.h>
 #include <linux/dma-mapping.h>
 #include <linux/debugfs.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
@@ -679,6 +680,33 @@ static int ehci_run (struct usb_hcd *hcd)
 	return 0;
 }
 
+static bool ehci_has_companion(struct ehci_hcd *ehci)
+{
+	struct device *dev = ehci_to_hcd(ehci)->self.controller;
+
+	if (HCS_N_CC(ehci->hcs_params) == 0)
+		return false;
+
+	if (!IS_ENABLED(CONFIG_USB_OHCI_HCD) &&
+	    !IS_ENABLED(CONFIG_USB_UHCI_HCD))
+		return false;
+
+	if (dev && dev->of_node) {
+		struct device_node *node;
+
+		node = of_parse_phandle(dev->of_node, "companion", 0);
+		if (node) {
+			bool avail = of_device_is_available(node);
+
+			of_node_put(node);
+			if (!avail)
+				return false;
+		}
+	}
+
+	return true;
+}
+
 int ehci_setup(struct usb_hcd *hcd)
 {
 	struct ehci_hcd *ehci = hcd_to_ehci(hcd);
@@ -691,6 +719,9 @@ int ehci_setup(struct usb_hcd *hcd)
 
 	/* cache this readonly data; minimize chip reads */
 	ehci->hcs_params = ehci_readl(ehci, &ehci->caps->hcs_params);
+	ehci->no_companion = !ehci_has_companion(ehci);
+	if (ehci->no_companion)
+		ehci_dbg(ehci, "no companion controller, disabling port handoff\n");
 
 	ehci->sbrn = HCD_USB2;
 
diff --git a/drivers/usb/host/ehci-hub.c b/drivers/usb/host/ehci-hub.c
index e676c98b6baa..1f69d9fc93c7 100644
--- a/drivers/usb/host/ehci-hub.c
+++ b/drivers/usb/host/ehci-hub.c
@@ -618,18 +618,17 @@ static int check_reset_complete (
 	/* if reset finished and it's still not enabled -- handoff */
 	if (!(port_status & PORT_PE)) {
 
-		/* with integrated TT, there's nobody to hand it to! */
-		if (ehci_is_TDI(ehci)) {
-			ehci_dbg (ehci,
-				"Failed to enable port %d on root hub TT\n",
-				index+1);
+		/* with integrated TT or no companion, there's nobody to hand it to! */
+		if (ehci_is_TDI(ehci) || ehci->no_companion) {
+			ehci_dbg(ehci, "Failed to enable port %d%s\n",
+				 index + 1,
+				 ehci_is_TDI(ehci) ? " on root hub TT" : "");
 			return port_status;
 		}
 
 		ehci_dbg (ehci, "port %d full speed --> companion\n",
 			index + 1);
 
-		// what happens if HCS_N_CC(params) == 0 ?
 		port_status |= PORT_OWNER;
 		port_status &= ~PORT_RWC_BITS;
 		ehci_writel(ehci, port_status, status_reg);
@@ -1145,9 +1144,9 @@ int ehci_hub_control(
 			 * which can be fine if this root hub has a
 			 * transaction translator built in.
 			 */
-			if ((temp & (PORT_PE|PORT_CONNECT)) == PORT_CONNECT
-					&& !ehci_is_TDI(ehci)
-					&& PORT_USB11 (temp)) {
+			if ((temp & (PORT_PE | PORT_CONNECT)) == PORT_CONNECT &&
+			    !ehci_is_TDI(ehci) && !ehci->no_companion &&
+			    PORT_USB11(temp)) {
 				ehci_dbg (ehci,
 					"port %d low speed --> companion\n",
 					wIndex + 1);
@@ -1244,7 +1243,7 @@ static void ehci_relinquish_port(struct usb_hcd *hcd, int portnum)
 {
 	struct ehci_hcd		*ehci = hcd_to_ehci(hcd);
 
-	if (ehci_is_TDI(ehci))
+	if (ehci_is_TDI(ehci) || ehci->no_companion)
 		return;
 	set_owner(ehci, --portnum, PORT_OWNER);
 }
@@ -1254,7 +1253,7 @@ static int ehci_port_handed_over(struct usb_hcd *hcd, int portnum)
 	struct ehci_hcd		*ehci = hcd_to_ehci(hcd);
 	u32 __iomem		*reg;
 
-	if (ehci_is_TDI(ehci))
+	if (ehci_is_TDI(ehci) || ehci->no_companion)
 		return 0;
 	reg = ehci_portsc(ehci, portnum - 1);
 	return ehci_readl(ehci, reg) & PORT_OWNER;
diff --git a/drivers/usb/host/ehci-sysfs.c b/drivers/usb/host/ehci-sysfs.c
index 5e6b545c30e6..1dcca19b544b 100644
--- a/drivers/usb/host/ehci-sysfs.c
+++ b/drivers/usb/host/ehci-sysfs.c
@@ -145,8 +145,8 @@ static inline int create_sysfs_files(struct ehci_hcd *ehci)
 	struct device	*controller = ehci_to_hcd(ehci)->self.controller;
 	int	i = 0;
 
-	/* with integrated TT there is no companion! */
-	if (!ehci_is_TDI(ehci))
+	/* with integrated TT or no_companion there is no companion! */
+	if (!ehci_is_TDI(ehci) && !ehci->no_companion)
 		i = device_create_file(controller, &dev_attr_companion);
 	if (i)
 		goto out;
@@ -160,8 +160,8 @@ static inline void remove_sysfs_files(struct ehci_hcd *ehci)
 {
 	struct device	*controller = ehci_to_hcd(ehci)->self.controller;
 
-	/* with integrated TT there is no companion! */
-	if (!ehci_is_TDI(ehci))
+	/* with integrated TT or no_companion there is no companion! */
+	if (!ehci_is_TDI(ehci) && !ehci->no_companion)
 		device_remove_file(controller, &dev_attr_companion);
 
 	device_remove_file(controller, &dev_attr_uframe_periodic_max);
diff --git a/drivers/usb/host/ehci.h b/drivers/usb/host/ehci.h
index 855a9d08b019..8ab5c696717a 100644
--- a/drivers/usb/host/ehci.h
+++ b/drivers/usb/host/ehci.h
@@ -238,6 +238,7 @@ struct ehci_hcd {			/* one per controller */
 	unsigned		no_configured_flag:1;
 	unsigned		no_tdi_mode:1;
 	unsigned		no_fsls_isoc:1;
+	unsigned		no_companion:1;
 
 	/* required for usb32 quirk */
 	#define OHCI_CTRL_HCFS          (3 << 6)
-- 
2.56.0.611.g1030f0b940-goog

