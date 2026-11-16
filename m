Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810668;
	b=2Gl+JE8W7HUFR9SdNFIH6g1KbkwKnqbZRESmsAdwdDYoDsaO1KN8J0QbidhmkruXLpiC
	 CRC1O7d4Qm7YUnjjXZMJHsPwJa8bsCLOTWjJ+0jCIJHTHFGTQcgfg1D3RbVQxlEmzYYSW
	 PUenmrba4nRUmCfo1hFyuUzHlHNrssWBlVsRanstyn7d1QiKdjP2hD7fSosfdG1B7y4WL
	 sC2pnNfr4whp+A7x8FQeZlU8yp7zoL9DgYEqlKA8wOOqReW+EGQYCxyw2tBznShwh7oLB
	 FqDdB7L94FMuMaY8pV3A81ZCrkKO7Ex4flKgiYBa9CXFeCi4WrjMoK9o5U0C4mA6Q1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1781s8QsZSAD5YDP2EWvZHZDwaJdMMZnVfV8pdQz5DQ=;
	b=ZKuAl4R+Z7JSfxFS3jFNL2PTFTGhFqFznB4bL+7EZrcpsApbp75BhhU9FcdTjQlqz9AM
	 fstnlMW6R6jPfEp6g1U89/vPxhkpO1SV2ME6euJGNqyTVw4BujcLjIfXXMIDgsc1NitGR
	 O6gzJGgODQyBvq1GWiPnZY2d96dusdgSXjAQCI6hHpNJVkIIh2esH7SceJuQeIwoiQtoX
	 RTxbDLnpWGA9jCxfPIwEPsDPERXhJqioZhQTy2cyJMudTAC0q1D11cdwJeDQixCnnpRpR
	 WxbyCVBmvGqHiLuY+Yu7IS5KOWIgbCeIzoiLs9CxC89VaS9A4CStZ7iwcWA9KOjte9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=wkennington.com;
	spf=none smtp.mailfrom=wkennington.com;
	dkim=pass header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=U7Q758hW;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9410C606A33F
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 06:31:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9410C606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=U7Q758hW
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ed0890476fso26325885ad.0
        for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 22:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20260707.gappssmtp.com; s=20260707; t=1794810667; x=1795415467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1781s8QsZSAD5YDP2EWvZHZDwaJdMMZnVfV8pdQz5DQ=;
        b=U7Q758hWO6hJAFfinRXD/gGa7xl8G78+m4MdD0mfpl16Uc9ay3X7a6+O0Y20ylw0LR
         nMRm7v5bmS7jWYzY9M7xaQF3sGkokklrS81dcBHRKF4pD9xJYbKHWsa+kAAoDhWt+msS
         JiXwe2Gs6TcTELgGVggZtHNXvIhe6zLpaUj52TWQHZ36y8I6IOE8NQFt68HlA9nfBFgh
         GqUIZBOd5glxs0uuoTAGcn0M1njrkhoZErDuybb1l0a5f+wKqYLVe2pZudwn+dktGmAU
         ydMQcYyjWP5wjaUQkAewNvvPlivudT2xjzwE/8DnwowGLxWwdi7lHcy6rhpScalq+6BS
         BeYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810667; x=1795415467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1781s8QsZSAD5YDP2EWvZHZDwaJdMMZnVfV8pdQz5DQ=;
        b=PES5BC1jqMJaRAYXsm8xbN1jnRWDZCqBru/lbPRDXCujR7feJVjb+j1co3mnNRrdGw
         QhnE7nXafBL9Jncx+LT1YsgBvEA4BdgYSdn3AvZp51BJerTCdliLvQJdQSvCsw7Ztxcv
         YSa8+mRZ3wVyUlRyTrUfejHOoZi1VHQJvlhPsmsZu2KuKQcIh+reSUUL4VNfVNI9DUnm
         IsEP+JuhzZm9Zm/huhmviJiy3xtRtS88Ko6bV2a9iWjEGs5iz6zrgDrW70T71KEdZdVA
         VNW3ZWF/7nzam9zwEa2uUSZvR8mjZbdV2MTjINb2fr/GvCu+/a0m37l3ISCTnbRNc0eO
         w50w==
X-Forwarded-Encrypted: i=1; AL+hErHLiDiHzP2L1KYrsIEPSQWsvUCWHH+RqVwZXi5IIOJEwRJzAgCL1+u8/lmw7U9uJON3klP2/V8oiTw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MXUaf2f2xeoY0rOFWJcMH1gqvJZbXMBlYwAPtd8RUjsaxoqkK
	KD6Djn/zWs8HOBAUoLcgQuXvfUxPR/I8shn5J5iZeeZvFZ5ZruaB/Zt+rsHPHtOHwKYI9HzVCKx
	BXmX1RTk=
X-Gm-Gg: AZFdTZeAnf33p5xof03sBBWYnboxZmjNxSSX42W/LQkQB2XOP2xmzxEOEKVqscexWEz
	W1rBiZ4AUJzZBZDB4HP66MyQb1qNg1hUmr/ETfOJWFvoiGC5Gnk8MixVwpFMq4xLKrUKA6OMDID
	l2Ui3AfTUFmRehHch0PzApBuiiVwptCTgXPpqNbdtV5DLhJvP3ftgbsQsxFv27GeVD89LfEpLeP
	3ViU78DryY7KMgZR5yTGo9dOuC66SRebFu4w/3gnA7CLwX2qXaV2Ellna/uncyzSBLt0nvoRNQd
	lRnLvu2+fNDhhkepVXGwYyT4cFjDELuc7DQAIp9X4kTosHw/VigiAOfdiIl3S+EM4LeadazwRjf
	cmw8Wn5CKzErjTKbfvCZEEodxUCcxaQLgI3Hzkgw+yzND2AXqi+G3IE8V8dc8Zz81N53BAJ6j/K
	87z2BxDl6F9Qp4NEgxV++hLU4MDkjZ0CG6gyr/AHsZeogyfRAjCRb7fv+HSweHhNWAu0FSHFDFV
	XvIoLT0Hjp8INBR0sfolvX5LQA3jk8JJrDgE7DQTjWMtFiiKcLQsIbbUQLoNruaTdpw+YO5BrYl
	OPh0JUfmIbn5XD32IhfeDZGuOb3f0kEI7yiF1KUjMtviWJzkgc89piwMMzxGfa3YWIU8onGbGtH
	J7np85cyR1Be4aKJFMrA/+7hjaJTLsYVZP2A=
X-Received: by 2002:a17:902:db08:b0:2ed:3be3:c648 with SMTP id d9443c01a7336-2ee0dd9f13emr100875765ad.22.1794810666732;
        Sun, 15 Nov 2026 22:31:06 -0800 (PST)
Received: from wak.c.googlers.com.com (246.21.127.34.bc.googleusercontent.com. [34.127.21.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f76007bsm33453735ad.24.2026.11.15.22.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:31:06 -0800 (PST)
From: "William A. Kennington III" <william@wkennington.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH v2] usb: ehci: skip companion handoff when no companion exists
Date: Mon, 16 Nov 2026 06:31:04 +0000
Message-ID: <20261116063104.1018358-1-william@wkennington.com>
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

Check during ehci_setup() whether the root hub has an integrated
transaction translator (ehci_is_TDI()), HCSPARAMS reports zero
companions (HCS_N_CC == 0), both CONFIG_USB_OHCI_HCD and
CONFIG_USB_UHCI_HCD are disabled in Kconfig (such as in
aspeed_g4_defconfig, aspeed_g5_defconfig, and BMC builds without UHCI
or OHCI), or a Device Tree companion phandle points to a disabled node.
Runtime companion binding is intentionally not checked at setup time so
modular or later-probing companion drivers still receive handoffs.

When no companion is available, set ehci->no_companion so the handoff
and companion sysfs paths check a single flag, keeping port ownership
on EHCI when no companion exists. USB 1.1 full- and low-speed devices
still cannot enumerate without an integrated TT or companion controller
and will fail usbcore's normal reset retries instead of triggering a
PORT_OWNER handoff.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
Changes in v2:
- Fold ehci_is_TDI() and its comment into ehci_has_companion() so all
  handoff and sysfs sites check ehci->no_companion alone (Michal Pecio).
- Drop Alan Stern's v1 Acked-by due to the refactored check.
- Link to v1: https://lore.kernel.org/linux-usb/20261114051653.1353346-1-william@wkennington.com/

 drivers/usb/host/ehci-hcd.c   | 35 +++++++++++++++++++++++++++++++++++
 drivers/usb/host/ehci-hub.c   | 20 ++++++++------------
 drivers/usb/host/ehci-sysfs.c |  6 ++----
 drivers/usb/host/ehci.h       |  1 +
 4 files changed, 46 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
index 75f780ec3ba0..2a9b25a5a94d 100644
--- a/drivers/usb/host/ehci-hcd.c
+++ b/drivers/usb/host/ehci-hcd.c
@@ -26,6 +26,7 @@
 #include <linux/moduleparam.h>
 #include <linux/dma-mapping.h>
 #include <linux/debugfs.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
@@ -679,6 +680,37 @@ static int ehci_run (struct usb_hcd *hcd)
 	return 0;
 }
 
+static bool ehci_has_companion(struct ehci_hcd *ehci)
+{
+	struct device *dev = ehci_to_hcd(ehci)->self.controller;
+
+	/* with integrated TT there is no companion! */
+	if (ehci_is_TDI(ehci))
+		return false;
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
@@ -691,6 +723,9 @@ int ehci_setup(struct usb_hcd *hcd)
 
 	/* cache this readonly data; minimize chip reads */
 	ehci->hcs_params = ehci_readl(ehci, &ehci->caps->hcs_params);
+	ehci->no_companion = !ehci_has_companion(ehci);
+	if (ehci->no_companion)
+		ehci_dbg(ehci, "no companion controller, disabling port handoff\n");
 
 	ehci->sbrn = HCD_USB2;
 
diff --git a/drivers/usb/host/ehci-hub.c b/drivers/usb/host/ehci-hub.c
index e676c98b6baa..23644acda144 100644
--- a/drivers/usb/host/ehci-hub.c
+++ b/drivers/usb/host/ehci-hub.c
@@ -617,19 +617,16 @@ static int check_reset_complete (
 
 	/* if reset finished and it's still not enabled -- handoff */
 	if (!(port_status & PORT_PE)) {
-
-		/* with integrated TT, there's nobody to hand it to! */
-		if (ehci_is_TDI(ehci)) {
-			ehci_dbg (ehci,
-				"Failed to enable port %d on root hub TT\n",
-				index+1);
+		if (ehci->no_companion) {
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
@@ -1145,9 +1142,8 @@ int ehci_hub_control(
 			 * which can be fine if this root hub has a
 			 * transaction translator built in.
 			 */
-			if ((temp & (PORT_PE|PORT_CONNECT)) == PORT_CONNECT
-					&& !ehci_is_TDI(ehci)
-					&& PORT_USB11 (temp)) {
+			if ((temp & (PORT_PE | PORT_CONNECT)) == PORT_CONNECT &&
+			    !ehci->no_companion && PORT_USB11(temp)) {
 				ehci_dbg (ehci,
 					"port %d low speed --> companion\n",
 					wIndex + 1);
@@ -1244,7 +1240,7 @@ static void ehci_relinquish_port(struct usb_hcd *hcd, int portnum)
 {
 	struct ehci_hcd		*ehci = hcd_to_ehci(hcd);
 
-	if (ehci_is_TDI(ehci))
+	if (ehci->no_companion)
 		return;
 	set_owner(ehci, --portnum, PORT_OWNER);
 }
@@ -1254,7 +1250,7 @@ static int ehci_port_handed_over(struct usb_hcd *hcd, int portnum)
 	struct ehci_hcd		*ehci = hcd_to_ehci(hcd);
 	u32 __iomem		*reg;
 
-	if (ehci_is_TDI(ehci))
+	if (ehci->no_companion)
 		return 0;
 	reg = ehci_portsc(ehci, portnum - 1);
 	return ehci_readl(ehci, reg) & PORT_OWNER;
diff --git a/drivers/usb/host/ehci-sysfs.c b/drivers/usb/host/ehci-sysfs.c
index 5e6b545c30e6..d6db2b818a9f 100644
--- a/drivers/usb/host/ehci-sysfs.c
+++ b/drivers/usb/host/ehci-sysfs.c
@@ -145,8 +145,7 @@ static inline int create_sysfs_files(struct ehci_hcd *ehci)
 	struct device	*controller = ehci_to_hcd(ehci)->self.controller;
 	int	i = 0;
 
-	/* with integrated TT there is no companion! */
-	if (!ehci_is_TDI(ehci))
+	if (!ehci->no_companion)
 		i = device_create_file(controller, &dev_attr_companion);
 	if (i)
 		goto out;
@@ -160,8 +159,7 @@ static inline void remove_sysfs_files(struct ehci_hcd *ehci)
 {
 	struct device	*controller = ehci_to_hcd(ehci)->self.controller;
 
-	/* with integrated TT there is no companion! */
-	if (!ehci_is_TDI(ehci))
+	if (!ehci->no_companion)
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

