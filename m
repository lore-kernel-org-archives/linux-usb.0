Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1468E44C65F;
	Wed, 15 Jul 2026 12:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118580; cv=none; b=hHMj7/FHCzgZDnZOL7VxbdJp/+DdSfYRaq0iyQIVow1Zp1HimRNmWxsaqbr4sXQ7Jp5ASKFlggnJggaPgdLq75R730yrlLSitMJYO/h1JBami5wKtFMVt7uCqHO5vitHS8C1RptINVvSMvZg67E+JZ/iiOEn/GaP+qdZNWmZ7/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118580; c=relaxed/simple;
	bh=4Kk6b4/vz0h4Gjsr/nZ8/Xz23vBs29in/Hsf0/gUgrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hZt3cHPVRhiPpyhkKJ5UyZqeKGB4v+x26bnwRoJwvauVQbjoyMggr8YkUXKMBDI/Cmu0WsHHr2brqjalNYbTENuvfNb8LbBV0cltY4ojfnbIEubjZq3vxKQ82j8BaTqvkJLciEPhxJaCar8FhSIa9yP5ysR74Ko2of0sggxfG7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YQPpecKb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YQPpecKb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD9C1F00A3A;
	Wed, 15 Jul 2026 12:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784118575;
	bh=A6rv0IwEL2hDqWeDBZt5LAD/agoi0mUBl9rn+7nCO40=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YQPpecKbPO5G1wgHYZVNP/5IcWH2kzS446yaZYryVyLLE0PogtBWi/cVK4YLRD3aK
	 gRdX+pII3UHv1Flf5CAF+QNvaYNdEBsUZCpjgOACJUNIiSZeJMD3TMBQOOYkjP+4Fd
	 HUxyiP3puAAXVOOXbwRUzKJtS/lSkBA9YKj2FNm+LsaFyBmQJO5SNTwBuGdLobyvUE
	 vOvTeK16snvtDzKfaYQV5uLB0lnmaTgrmixwcqEnJSMsc32Xye/utdQFlcHZne6JI8
	 N0/G233yjncIlCIG7jcaapwlRXvGWr5bcrV73msHoK8IexfR5A0LrR+q2gZ0A5Qvn+
	 19GO8tsipc8lA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 15 Jul 2026 14:29:19 +0200
Subject: [PATCH v2 3/4] usb: xhci: Allow custom op for usb_link_tunnel_mode
 reporting
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-topic-dwc3_tunneling_state-v2-3-026487a08119@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784118563; l=4937;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=oVbAFb5eDhRwKHU8ADd6kiDFDzRRmIyAoVjPPciW2Rk=;
 b=wIqlqpTP5g6PHVAeDVp6h8IAhHF/Qb1FvoOFb1FsfN6nbqSvOXDptc+rHZvpu3ESuF/vlFTxF
 VNcgmRkCa8rCjB9toiQ2uO96wdji3gm83t7afAcrtHtb7gB+5/YQKwq
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The Thunderbolt framework relies on the USB core to create device links
for tunneled ports, so that the USB3 controller is only kept
runtime-resumed for the duration of the tunneling.

Currently, retrieving that information is only possibe on Intel XHCI
hosts, through a vendor-specific capability. Extend xhci-plat to allow
plumbing a custom one.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/usb/host/xhci-hub.c  | 13 +++++++++----
 drivers/usb/host/xhci-plat.c |  2 ++
 drivers/usb/host/xhci-plat.h |  1 +
 drivers/usb/host/xhci.c      |  3 ++-
 drivers/usb/host/xhci.h      |  5 ++++-
 5 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 402e98ab95ee..9964cbd154ab 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -749,7 +749,7 @@ static int xhci_exit_test_mode(struct xhci_hcd *xhci)
 }
 
 /**
- * xhci_port_is_tunneled() - Check if USB3 connection is tunneled over USB4
+ * xhci_port_tunnel_mode() - Check if USB3 connection is tunneled over USB4
  * @xhci: xhci host controller
  * @port: USB3 port to be checked.
  *
@@ -763,7 +763,7 @@ static int xhci_exit_test_mode(struct xhci_hcd *xhci)
  * detecting USB3 over USB4 tunnels. USB_LINK_NATIVE or USB_LINK_TUNNELED
  * otherwise.
  */
-enum usb_link_tunnel_mode xhci_port_is_tunneled(struct xhci_hcd *xhci,
+enum usb_link_tunnel_mode xhci_port_tunnel_mode(struct xhci_hcd *xhci,
 						struct xhci_port *port)
 {
 	void __iomem *base = &xhci->cap_regs->hc_capbase;
@@ -787,8 +787,13 @@ enum usb_link_tunnel_mode xhci_port_is_tunneled(struct xhci_hcd *xhci,
 	/* Fall back to the legacy Intel-specific ext_cap */
 	hcd = xhci_to_hcd(xhci);
 	if (!dev_is_pci(hcd->self.controller) ||
-	    to_pci_dev(hcd->self.controller)->vendor != PCI_VENDOR_ID_INTEL)
-		return USB_LINK_UNKNOWN;
+	    to_pci_dev(hcd->self.controller)->vendor != PCI_VENDOR_ID_INTEL) {
+		/* Last chance - if the controller has a custom tunnel_mode op, try that */
+		if (xhci->tunnel_mode)
+			return xhci->tunnel_mode(xhci_to_hcd(xhci), port->hcd_portnum);
+		else
+			return USB_LINK_UNKNOWN;
+	}
 
 	offset = xhci_find_next_ext_cap(base, 0, XHCI_EXT_CAPS_INTEL_SPR_SHADOW);
 
diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 074d9c731639..dbaca694baa2 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -244,6 +244,8 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 		priv = hcd_to_xhci_priv(hcd);
 		/* Just copy data for now */
 		*priv = *priv_match;
+
+		xhci->tunnel_mode = priv->tunnel_mode;
 	}
 
 	device_set_wakeup_capable(&pdev->dev, true);
diff --git a/drivers/usb/host/xhci-plat.h b/drivers/usb/host/xhci-plat.h
index 00751d851831..c5042766a486 100644
--- a/drivers/usb/host/xhci-plat.h
+++ b/drivers/usb/host/xhci-plat.h
@@ -22,6 +22,7 @@ struct xhci_plat_priv {
 	int (*suspend_quirk)(struct usb_hcd *);
 	int (*resume_quirk)(struct usb_hcd *);
 	int (*post_resume_quirk)(struct usb_hcd *);
+	enum usb_link_tunnel_mode (*tunnel_mode)(struct usb_hcd *hcd, int portnum);
 };
 
 #define hcd_to_xhci_priv(h) ((struct xhci_plat_priv *)hcd_to_xhci(h)->priv)
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 091c82ca8ee2..118401a74244 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4760,7 +4760,8 @@ static int xhci_update_device(struct usb_hcd *hcd, struct usb_device *udev)
 	if (hcd->speed >= HCD_USB3 && !udev->parent->parent) {
 		port = xhci->usb3_rhub.ports[udev->portnum - 1];
 
-		udev->tunnel_mode = xhci_port_is_tunneled(xhci, port);
+		udev->tunnel_mode = xhci_port_tunnel_mode(xhci, port);
+
 		if (udev->tunnel_mode == USB_LINK_UNKNOWN)
 			dev_dbg(&udev->dev, "link tunnel state unknown\n");
 		else if (udev->tunnel_mode == USB_LINK_TUNNELED)
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 2d3941b5e1e3..a85968008a94 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1675,6 +1675,9 @@ struct xhci_hcd {
 	struct list_head	regset_list;
 
 	void			*dbc;
+
+	enum usb_link_tunnel_mode (*tunnel_mode)(struct usb_hcd *hcd, int portnum);
+
 	/* platform-specific data -- must come last */
 	unsigned long		priv[] __aligned(sizeof(s64));
 };
@@ -1981,7 +1984,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue, u16 wIndex,
 int xhci_hub_status_data(struct usb_hcd *hcd, char *buf);
 int xhci_find_raw_port_number(struct usb_hcd *hcd, int port1);
 struct xhci_hub *xhci_get_rhub(struct usb_hcd *hcd);
-enum usb_link_tunnel_mode xhci_port_is_tunneled(struct xhci_hcd *xhci,
+enum usb_link_tunnel_mode xhci_port_tunnel_mode(struct xhci_hcd *xhci,
 						struct xhci_port *port);
 void xhci_hc_died(struct xhci_hcd *xhci);
 

-- 
2.55.0

