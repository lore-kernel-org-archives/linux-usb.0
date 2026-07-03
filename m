Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C2E366051;
	Fri,  3 Jul 2026 23:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783121864; cv=none; b=D89M6OQKUSfq5xkV9b2hyG422mXymkJV1pZKTMKU4y5FPDXYJ9/p2N6LTju5S6oKh0dJGIlMGc9c6TE+DpIk5NZCdkbbzD6Tns3uBLMfj0hyIvkBq5zXFJyuhlf+9hXTP4+kbfqxoFhDkNmCbcf6xR2gX7XJBT1NGW4nqz2JoSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783121864; c=relaxed/simple;
	bh=vVqgoKOMD3JSf3scA6Zf4hlmZ3rksSqlhaua5XNUzTk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aC8hUIFQaJAMKL9vWs5pBH3jB7SZ8OwVECX125aws+SzQSarnAPTmIcmGG0F66zYeKn09k/+Jc1IaK3IVTRlMtA469vUAqoU7qTY9EUFpbQCVqGt3J4OxBzOc7bpv74t2cVQIi8KvcK/dX66IWEbWmi8bu47nmJbQXJ09qIcxzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HP7XrAME; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HP7XrAME"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783121858;
	bh=vVqgoKOMD3JSf3scA6Zf4hlmZ3rksSqlhaua5XNUzTk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HP7XrAMEnfrnLY1JzPVZFkrlXFvW1+nblZS/ZqiI6EuN1SVHMk5nNKIS1vaH84diu
	 z+ixUmOjnbYb/yMd1vUNL3jguTgxog+zQxZUnIiGSOPVD24reSw7H2cG/c5ZKUkvPG
	 VdpySK4HlC3ncCu0v1o8HHJWLA5wACykjg622MPG+WxnHiqg0l6jUoN3vgKc3YrfNh
	 riQ7+CLB65sQAY8iA2K5BzkWZQ7yWkOvCJ8juNI/qYkUhiLhBLveKfEO+aUrZ5L5qF
	 3JSSgyfYH/K3FGuWZx5KPekHwkj/QwSBUcFafy1fNnXNeXKjyFczd7Ixp8NLAQVxf3
	 le6ZyaFVfoeWA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9E53E17E1064;
	Sat,  4 Jul 2026 01:37:38 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A6A6D480074; Fri, 03 Jul 2026 20:13:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 03 Jul 2026 20:13:46 +0200
Subject: [PATCH v10 30/36] usb: dwc3: core: support PHY reset notifications
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rockchip-usbdp-cleanup-v10-30-a392711ca8a9@collabora.com>
References: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
In-Reply-To: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5365;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=vVqgoKOMD3JSf3scA6Zf4hlmZ3rksSqlhaua5XNUzTk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpH+8zJ6xtV8Hi4tUKfjUQM0eqFKKiU8JJ0j
 BrBomcSzzEmRYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqR/vMAAoJENju1/PI
 O/qay8gP/jJo/t1sAgS0i57NEjTeBwBawFxWoOI41kcqvwinE0IXMLjJui+o2DmfeuXwIcDQVsW
 e5yRVw89ijnhqBtRPxxIkIn/rYKkpKPO6LccCFpKGT+hx2LT2AfgVPQr8eYVgJQQ7feR8Oc+iSF
 7nZben/pXO1d98AtxeF2D+WoPIeSp8kcBUI7CFakWy0ls6MPt9IRmiStfCTfiaBQuAEMIik77K1
 TMoCbmoEcmFVm/HcXGeCTt9E9OT4NmkVtZHIJhAcmvSnFeRuumxlf+h1FCOsltTwDNDPuSvWkoq
 r0EVGo7qxGf8JrkhqIjXpdd6ppTAfhmS2lyuagahINFzN30dq7leX26KNt1s32FuYYBctEyqhVn
 3acX6dyuPIh8ABqjzjyfITqli2+nojPiSwCOTV43OgwKvQX3Jiy3T5euDP/QVzSoF8LYvkCpv1y
 mxF+DQFcGezsbFwi8cIqOCAitNv5WL5v8aVmfyURBcWlNVlcPPrwTc2Qri5B8s0JsSO2/oNgc7s
 0n9yJQB2x7gD2oSuqy9Pso+eO5bjVDRt8xyRzy19VjMU2JAYYEgKDco0fQFw2M+48UZriyuJ0Uj
 JkcROeLFEoY0XWhtakLLN/Hoetq/dB2D4DWgg2eNMroMHYBj0x8mnWzrRQOQTxv8OQ/Ml9KbkFK
 YdPvKNbYhVTWeG2lxGY0sLA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

On recent Rockchip platforms (at least RK3588 & RK3576), DWC3 IP is used
with a USBDP PHY providing USB3 and DP. This PHY needs to be reset when
the mode changes, which may happen when plugging in different USB-C
devices.

If the USBDP PHY resets with the DWC3 IP running, its internal state
corrupts resulting in the USBDP PHY not being able to lock some PLL
clocks, which effectively renders USB3 unusable.

To fix the issue this adds handling for the new PHY framework reset
notifications, which will assert PHYSOFTRST before the actual PHY
is disabled and will deassert it once the PHY returns.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/dwc3/core.c | 74 +++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/dwc3/core.h | 16 +++++++++++
 2 files changed, 90 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 517aa7f1486d..899decbd0da0 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -30,6 +30,7 @@
 #include <linux/pinctrl/devinfo.h>
 #include <linux/reset.h>
 #include <linux/bitfield.h>
+#include <linux/phy/phy.h>
 
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
@@ -660,6 +661,9 @@ static int dwc3_core_ulpi_init(struct dwc3 *dwc)
 	return ret;
 }
 
+static void dwc3_phy_register_notifiers(struct dwc3 *dwc);
+static void dwc3_phy_unregister_notifiers(struct dwc3 *dwc);
+
 static int dwc3_ss_phy_setup(struct dwc3 *dwc, int index)
 {
 	u32 reg;
@@ -845,6 +849,8 @@ static int dwc3_phy_init(struct dwc3 *dwc)
 			goto err_exit_usb3_phy;
 	}
 
+	dwc3_phy_register_notifiers(dwc);
+
 	/*
 	 * Above DWC_usb3.0 1.94a, it is recommended to set
 	 * DWC3_GUSB3PIPECTL_SUSPHY and DWC3_GUSB2PHYCFG_SUSPHY to '0' during
@@ -880,10 +886,78 @@ static int dwc3_phy_init(struct dwc3 *dwc)
 	return ret;
 }
 
+static int dwc3_usb3_phy_notify(struct notifier_block *nb,
+				unsigned long action, void *data)
+{
+	struct dwc3_phy_nb *pnb = container_of(nb, struct dwc3_phy_nb, nb);
+	struct dwc3 *dwc = pnb->dwc;
+	int port = pnb->port_index;
+	unsigned long flags;
+	u32 reg;
+
+	switch (action) {
+	case PHY_NOTIFY_PRE_RESET:
+		pm_runtime_get_sync(dwc->dev);
+
+		/*
+		 * Assert USB3 PHY soft reset within DWC3 before the external
+		 * PHY resets. This disconnects the PIPE interface, preventing
+		 * the DWC3 from interfering with PHY reinitialization and
+		 * avoiding LCPLL lock failures.
+		 */
+		spin_lock_irqsave(&dwc->lock, flags);
+		reg = dwc3_readl(dwc, DWC3_GUSB3PIPECTL(port));
+		reg |= DWC3_GUSB3PIPECTL_PHYSOFTRST;
+		dwc3_writel(dwc, DWC3_GUSB3PIPECTL(port), reg);
+		spin_unlock_irqrestore(&dwc->lock, flags);
+		break;
+
+	case PHY_NOTIFY_POST_RESET:
+		/*
+		 * Deassert PHY soft reset to reconnect the PIPE interface
+		 * after PHY reinitialization.
+		 */
+		spin_lock_irqsave(&dwc->lock, flags);
+		reg = dwc3_readl(dwc, DWC3_GUSB3PIPECTL(port));
+		reg &= ~DWC3_GUSB3PIPECTL_PHYSOFTRST;
+		dwc3_writel(dwc, DWC3_GUSB3PIPECTL(port), reg);
+		spin_unlock_irqrestore(&dwc->lock, flags);
+
+		pm_runtime_put_autosuspend(dwc->dev);
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
+static void dwc3_phy_register_notifiers(struct dwc3 *dwc)
+{
+	int i;
+
+	for (i = 0; i < dwc->num_usb3_ports; i++) {
+		dwc->usb3_phy_nb[i].nb.notifier_call = dwc3_usb3_phy_notify;
+		dwc->usb3_phy_nb[i].dwc = dwc;
+		dwc->usb3_phy_nb[i].port_index = i;
+		phy_register_notifier(dwc->usb3_generic_phy[i],
+				      &dwc->usb3_phy_nb[i].nb);
+	}
+}
+
+static void dwc3_phy_unregister_notifiers(struct dwc3 *dwc)
+{
+	int i;
+
+	for (i = 0; i < dwc->num_usb3_ports; i++)
+		phy_unregister_notifier(dwc->usb3_generic_phy[i],
+					&dwc->usb3_phy_nb[i].nb);
+}
+
 static void dwc3_phy_exit(struct dwc3 *dwc)
 {
 	int i;
 
+	dwc3_phy_unregister_notifiers(dwc);
+
 	for (i = 0; i < dwc->num_usb3_ports; i++)
 		phy_exit(dwc->usb3_generic_phy[i]);
 
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index e0dee9d28740..8250d96262ed 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1002,6 +1002,20 @@ struct dwc3_glue_ops {
 	void	(*pre_run_stop)(struct dwc3 *dwc, bool is_on);
 };
 
+struct dwc3;
+
+/**
+ * struct dwc3_phy_nb - wrapper for PHY notifier block
+ * @nb: notifier block
+ * @dwc: back-pointer to the DWC3 controller
+ * @port_index: USB3 port index this notifier is registered for
+ */
+struct dwc3_phy_nb {
+	struct notifier_block	nb;
+	struct dwc3		*dwc;
+	u8			port_index;
+};
+
 /**
  * struct dwc3 - representation of our controller
  * @drd_work: workqueue used for role swapping
@@ -1065,6 +1079,7 @@ struct dwc3_glue_ops {
  * @usb3_phy: pointer to USB3 PHY
  * @usb2_generic_phy: pointer to array of USB2 PHYs
  * @usb3_generic_phy: pointer to array of USB3 PHYs
+ * @usb3_phy_nb: notifier blocks for USB3 PHY reset events
  * @num_usb2_ports: number of USB2 ports
  * @num_usb3_ports: number of USB3 ports
  * @phys_ready: flag to indicate that PHYs are ready
@@ -1229,6 +1244,7 @@ struct dwc3 {
 
 	struct phy		*usb2_generic_phy[DWC3_USB2_MAX_PORTS];
 	struct phy		*usb3_generic_phy[DWC3_USB3_MAX_PORTS];
+	struct dwc3_phy_nb	usb3_phy_nb[DWC3_USB3_MAX_PORTS];
 
 	u8			num_usb2_ports;
 	u8			num_usb3_ports;

-- 
2.53.0

