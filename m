Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61B547799D;
	Wed, 15 Jul 2026 12:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118575; cv=none; b=B6l23gARsM5mhiKLC/wVwfa/sADEcXGQGWRd05iCbuNEuUt2hpezglOD01YF+saoxMRbEhHdfSIdL9rTKxXm6XuUbtOCsJi6076s42KVgi0icyjj4ERrLgg2vlsUysrMexC06pqL/KXvO+kCmSouhjkq+wYXoH3CzUPbl99OPn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118575; c=relaxed/simple;
	bh=qSxNWf6MIzbhnYzzLNxmTOymg1b4f5RHpxGb0Jzg19c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JPVrt9BYC1ZfuJPQZKsapZDNrNKel3iZ190GdTu6H9xxFk/ZsJ2I6Y3iSg+PBtyXBNx5gcXIC2ZN17DLKUooHn73dGocyMGDQBxjL+U2l1MAKVLznFf7/Uy5mV6vNegCY/BXE/6clcx0NGip+ZTQ6HuG/T0NxNegfVarnhcsXmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e7NeL1/5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e7NeL1/5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC73B1F000E9;
	Wed, 15 Jul 2026 12:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784118573;
	bh=RoX8MQp0qLu8G6fZPJ9b0uECHYzY30JyPm9d0hNLiTU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=e7NeL1/5N7DuycY2AMMIYsnx46RsV0D0w61m6w4pJdhg6Wta3YmkKFnpB5zr7DNA1
	 g8IQv7DTPtVEhmjZRNFUMLqPxp756gZ+Tnxvvi0JffpK6sAE0EUUYXGJUG/pCXBDL0
	 hoSk1Vn6V0AYJjFct2v20ecIzw4w3U4cFApIIuXQ3MeFYdAIQvnkDv9LVBiRf38S8i
	 vNJa0jI8cZ57kIIfYK+NHV5xJBAYvHRnJa8uVPKHkMw/vDk/NFPVGhMu6wLLKlW4Vl
	 pRLli9Nhn2MWp7Jm6cDkXwEeFXMwkzFNKBsSedVlZNqJmriDPfKh5sAz7Opij0lGuo
	 sWRBc3t8BLBGw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 15 Jul 2026 14:29:18 +0200
Subject: [PATCH v2 2/4] usb: xhci: Honor PORTSC.TM if valid
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-topic-dwc3_tunneling_state-v2-2-026487a08119@oss.qualcomm.com>
References: <20260715-topic-dwc3_tunneling_state-v2-0-026487a08119@oss.qualcomm.com>
In-Reply-To: <20260715-topic-dwc3_tunneling_state-v2-0-026487a08119@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784118563; l=3149;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=XYB11jOh3frUfE41Fc73kAvDy4enEucjLEH8YX7jbf4=;
 b=U2cMbF+9UHXNrATnVZuDHR2hAiCgziXjbO+7kaXlXyBKkYBGYNzIAbapGSrJPTRTqFHJ8K6s/
 +5sOXjsdfaSCLkVBN/kDM7sYoWJwC+tpggG98JWpPwGXSfCJu0xoPXN
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Currently, the only way for the USB core to determine whether the link
is native or tunneled is via an Intel vendor-specific Extended
Capability.

The XHCI specification v1.2 and newer expose a common ext_cap,
indicating whether BIT(2) of PORTSC can be interpreted as the tunneling
status.

Make use of that and fall back to the existing Intel-specific path if
the ext_cap is absent.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/usb/host/xhci-ext-caps.h |  3 +++
 drivers/usb/host/xhci-hub.c      | 19 ++++++++++++++++---
 drivers/usb/host/xhci-port.h     |  3 ++-
 3 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ext-caps.h b/drivers/usb/host/xhci-ext-caps.h
index 22e53a750e2a..af7d624cd38e 100644
--- a/drivers/usb/host/xhci-ext-caps.h
+++ b/drivers/usb/host/xhci-ext-caps.h
@@ -66,6 +66,9 @@
 #define XHCI_HLC               (1 << 19)
 #define XHCI_BLC               (1 << 20)
 
+/* USB3 tunneling support capability - section 7.11 */
+#define XHCI_USB3_TUNNELING_SUPPORTED	BIT(16)
+
 /* Intel SPR shadow capability */
 #define XHCI_INTEL_SPR_ESS_PORT_OFFSET  0x8ac4	/* SuperSpeed port control */
 #define XHCI_INTEL_SPR_TUNEN	BIT(4)		/* Tunnel mode enabled */
diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index b0264bd8577a..402e98ab95ee 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -766,17 +766,30 @@ static int xhci_exit_test_mode(struct xhci_hcd *xhci)
 enum usb_link_tunnel_mode xhci_port_is_tunneled(struct xhci_hcd *xhci,
 						struct xhci_port *port)
 {
+	void __iomem *base = &xhci->cap_regs->hc_capbase;
 	struct usb_hcd *hcd;
-	void __iomem *base;
 	u32 offset;
+	u32 val;
 
-	/* Don't try and probe this capability for non-Intel hosts */
+	/* Prefer the XHCI v1.2 ext_cap if advertised */
+	offset = xhci_find_next_ext_cap(base, 0, XHCI_EXT_CAPS_USB3_TUNNELING);
+	if (offset) {
+		if (!(readl(base + offset) & XHCI_USB3_TUNNELING_SUPPORTED))
+			return USB_LINK_NATIVE;
+
+		val = xhci_portsc_readl(port);
+		if (val & PORT_TM)
+			return USB_LINK_TUNNELED;
+
+		return USB_LINK_NATIVE;
+	}
+
+	/* Fall back to the legacy Intel-specific ext_cap */
 	hcd = xhci_to_hcd(xhci);
 	if (!dev_is_pci(hcd->self.controller) ||
 	    to_pci_dev(hcd->self.controller)->vendor != PCI_VENDOR_ID_INTEL)
 		return USB_LINK_UNKNOWN;
 
-	base = &xhci->cap_regs->hc_capbase;
 	offset = xhci_find_next_ext_cap(base, 0, XHCI_EXT_CAPS_INTEL_SPR_SHADOW);
 
 	if (offset && offset <= XHCI_INTEL_SPR_ESS_PORT_OFFSET) {
diff --git a/drivers/usb/host/xhci-port.h b/drivers/usb/host/xhci-port.h
index 889b5fb0fcd8..215c9cadbc34 100644
--- a/drivers/usb/host/xhci-port.h
+++ b/drivers/usb/host/xhci-port.h
@@ -5,7 +5,8 @@
 #define PORT_CONNECT	(1 << 0)
 /* true: port enabled */
 #define PORT_PE		(1 << 1)
-/* bit 2 reserved and zeroed */
+/* true: port is tunneling traffic over USB4 */
+#define PORT_TM		(1 << 2)
 /* true: port has an over-current condition */
 #define PORT_OC		(1 << 3)
 /* true: port reset signaling asserted */

-- 
2.55.0

