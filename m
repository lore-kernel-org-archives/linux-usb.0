Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5543B38A1;
	Tue,  5 May 2026 08:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777971316; cv=none; b=bbGzfNJcACi0SMy5RdpVaX9dB7g09LQqbntql5iULqBig6r5yzS8ztIVqLmEsoUy9QbzVOsJAft5z8MWZ7+JiSE/1jXzE8B7kgeYNUGTjLb7fcueJlT4R/c5QSnFA/EAp5togYW6JRinaECQkngeHm8SpQSNMdYhk5UxhLuaN50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777971316; c=relaxed/simple;
	bh=ge4pkAOya53sKi420BgmHloYNuYZYRbHmHvB+ihmSUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QuvlhcdNRkppuXYP7/ZNtSCcMRh6P7aBoPNK3SIghcUAsKBq2/EWzwtomTYSdbNT3beM39ontmTtAZEGO8lDI/p86cCc+VYKfk61NUEu7COwfqL76fseoxuU1UgvKfhhbLP/INDJHIV9K98qY/t6SMh3C9qJjtYPtTNSg91eB/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t76ydVen; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t76ydVen"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 563BEC2BCB9;
	Tue,  5 May 2026 08:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777971315;
	bh=ge4pkAOya53sKi420BgmHloYNuYZYRbHmHvB+ihmSUk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=t76ydVengSaCK/ow/xm4uBSidHUbsjec3Vfzwa+UTJy8aGS6cWOxjr/JSerBOcusr
	 LtH4G7hLOraYKRwhIoQSNI2LdeOI4zyM8Qzy6RCrn7hS6FCYaJ1ReAjOuMnasF4nI0
	 UUmHhlZNOKuxoB0yTB8FL5mmWDKhttRinSYoYl3OzHC/pWg8TZ1+aTTJKyrc5heUxB
	 f1bS9XYSDWGOcq3/xVTGsVHwb3VgZA5TCNiqM3mU9OMmL3ePsDxpr106wPVLauL3b6
	 OK+2yXTTZ5yTbFOpyhFUAbec2PUO1fgG4FYtB9sAduy/hpPwJ6JHFBOPd60kRZgjZY
	 h73cS+WMtvAHg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 05 May 2026 10:55:04 +0200
Subject: [PATCH 1/2] usb: host: xhci: Allow non-Intel usb_link_tunnel_mode
 reporting
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-topic-dwc3_tunneling_state-v1-1-4aaa6c3c14cb@oss.qualcomm.com>
References: <20260505-topic-dwc3_tunneling_state-v1-0-4aaa6c3c14cb@oss.qualcomm.com>
In-Reply-To: <20260505-topic-dwc3_tunneling_state-v1-0-4aaa6c3c14cb@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777971309; l=4304;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=E5Zkzk+vTBZmmLs94/SV7GnDzfzywTgaRXPrNAY7yVQ=;
 b=vuwob+6aa8lSzvEW7AnJ/MiA77Ae2huI7jHGSJi/lVVm6VCPl8Tr+L6xJgrLHJD3ltQdZq/My
 Vhpx9RgmxvCCZXefBMiqkR8ZOykEEbx0gyPYwysBuWKTokFGtbnIndA
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
 drivers/usb/host/xhci-hub.c  | 4 ++--
 drivers/usb/host/xhci-plat.c | 2 ++
 drivers/usb/host/xhci-plat.h | 1 +
 drivers/usb/host/xhci.c      | 6 +++++-
 drivers/usb/host/xhci.h      | 5 ++++-
 5 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index bacd0ddd0d09..09e5da912066 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -750,7 +750,7 @@ static int xhci_exit_test_mode(struct xhci_hcd *xhci)
 }
 
 /**
- * xhci_port_is_tunneled() - Check if USB3 connection is tunneled over USB4
+ * xhci_port_tunnel_mode() - Check if USB3 connection is tunneled over USB4
  * @xhci: xhci host controller
  * @port: USB3 port to be checked.
  *
@@ -764,7 +764,7 @@ static int xhci_exit_test_mode(struct xhci_hcd *xhci)
  * detecting USB3 over USB4 tunnels. USB_LINK_NATIVE or USB_LINK_TUNNELED
  * otherwise.
  */
-enum usb_link_tunnel_mode xhci_port_is_tunneled(struct xhci_hcd *xhci,
+enum usb_link_tunnel_mode xhci_port_tunnel_mode(struct xhci_hcd *xhci,
 						struct xhci_port *port)
 {
 	struct usb_hcd *hcd;
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
index a54f5b57f205..90a6751b5c69 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4754,7 +4754,11 @@ static int xhci_update_device(struct usb_hcd *hcd, struct usb_device *udev)
 	if (hcd->speed >= HCD_USB3 && !udev->parent->parent) {
 		port = xhci->usb3_rhub.ports[udev->portnum - 1];
 
-		udev->tunnel_mode = xhci_port_is_tunneled(xhci, port);
+		if (xhci->tunnel_mode)
+			udev->tunnel_mode = xhci->tunnel_mode(hcd, port->hcd_portnum);
+		else
+			udev->tunnel_mode = xhci_port_tunnel_mode(xhci, port);
+
 		if (udev->tunnel_mode == USB_LINK_UNKNOWN)
 			dev_dbg(&udev->dev, "link tunnel state unknown\n");
 		else if (udev->tunnel_mode == USB_LINK_TUNNELED)
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index aeecd301f207..59cc5797d5d2 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1672,6 +1672,9 @@ struct xhci_hcd {
 	struct list_head	regset_list;
 
 	void			*dbc;
+
+	enum usb_link_tunnel_mode (*tunnel_mode)(struct usb_hcd *hcd, int portnum);
+
 	/* platform-specific data -- must come last */
 	unsigned long		priv[] __aligned(sizeof(s64));
 };
@@ -1977,7 +1980,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue, u16 wIndex,
 int xhci_hub_status_data(struct usb_hcd *hcd, char *buf);
 int xhci_find_raw_port_number(struct usb_hcd *hcd, int port1);
 struct xhci_hub *xhci_get_rhub(struct usb_hcd *hcd);
-enum usb_link_tunnel_mode xhci_port_is_tunneled(struct xhci_hcd *xhci,
+enum usb_link_tunnel_mode xhci_port_tunnel_mode(struct xhci_hcd *xhci,
 						struct xhci_port *port);
 void xhci_hc_died(struct xhci_hcd *xhci);
 

-- 
2.54.0

