Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE6E43CEF4;
	Fri, 10 Jul 2026 16:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701996; cv=none; b=M8j8pvO+CtvA8GBLiubxJ7oVZuR6X0WrjoUZpkMbGr/vPz+oc5J+3qNqbq9hth09/vLZpx1Gmow5LShud2WRR6U3FU6FKaxRSTvSkBDGppyRxCgj0e/Jm6pOdCeTImRMrsBh51Bb58R5ebIEV6iFc3tgXOc2ax+CqPhokgcunfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701996; c=relaxed/simple;
	bh=GEsY+o/vFhiMeETwhVFNZdEAI/oRGdUPv26C5awo0qY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VQ7wcCLMBmQ2JdLqhbABXMMWR5Ui49lGMivAL8vgGO/MppVFOPVJ0vloaHPE+/hyz3a5bani4qg2lXRk6Kl0qqJaLvBtwYCr7fvCQqnSnUowtXzV1uZIb8lh3NnLgaeq6Y6f4hANY2Q7hVF4CJD0QCnWoXGf+wNicHL3bSYf8qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=h+eZagOE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="h+eZagOE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783701979;
	bh=GEsY+o/vFhiMeETwhVFNZdEAI/oRGdUPv26C5awo0qY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=h+eZagOELloB6uZPBGk8Yn7GJ5zxE7iKcOHt6Lg4fEcjWY5W/A65YeOppTDmXJKdm
	 jwFxwez0lj8PCpmJXMdVb7rdJ0Cl3aN/Pa7OBBMZ7OM5RgNd7tkxOoyMAa0p8RRJ1q
	 QEthG0x0AZn9C4f9scoj/dTJwfjSE/gENO5rrvNBILl6Mr2wNnQUo2FDOtmIFlnmxw
	 1vnJCEdRsctyqQ2FAIzh3bHmlPZQPwf9XiPeSDVWYm/hkz9zTj9VeOupyYCxD+/1ED
	 aXVvU7WVcwyhC9ZXNiI7wbai/fvfup0nfN5lOhc+OoIgYcXUtf6eN20U5J4fN3z2sO
	 IPHhirfqG6R5w==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3FF8E17E12B9;
	Fri, 10 Jul 2026 18:46:19 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 14FF8480074; Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:45:08 +0200
Subject: [PATCH v12 30/36] usb: dwc3: core: support PHY reset notifications
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-30-8b41a9a9bef0@collabora.com>
References: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
In-Reply-To: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6305;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=GEsY+o/vFhiMeETwhVFNZdEAI/oRGdUPv26C5awo0qY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdl+dKJm/2sSostUc9IaxCspsBAmnUpiJ
 jZhhKhOuljA7IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHZAAoJENju1/PI
 O/qa7rUP/2DBSpg7ZljsZS7H1GRrZAgRGC5IhT212E3PScgxUJZEpFm4dEbhGNX/uDVzPut0qOb
 EPxbEMB/DnS+Gw2DlYHOp1Ef4EcWUkU75jCOa0WwhgD926smV65v5niHCLIzb7jxg+hLhbNn16u
 ljOC5lxZUTMYiAVY7hgh0ZFmFoebE+zhkRn7KEIzoOR/hhZjIyathATSKeJBsyFpIhTaMR9F+S3
 o+0we+K3TGTgl03bGS+HRf8l4L2OhqUI6Tgcu521p6aHpol9QTdP48rLyvo/iYUqVmeZa8HNMgp
 tIuPcHjZgumrXkSsUhfrLReXy3vTdWrIY5bC243NZs7q6E/scakBGJd1GT8uV3nTQz++uDBO24f
 pcq28LhpT1qbXxPjre9ak0dmQq5ZXiiN/EIviR9uG/tz4pUcEU6F7sMwptQLyq+2nHqxmeOLBap
 SiWKnLLGpljAydtYropHbNNB7ZYMD4d+EbgUDnFk+uiiNzmKjzgyqQ9E7CBc5WiqzhRXZ/2W5JY
 eikXAsZ/qnSV3Td9sMEbn56jwA1L7YcPxPudb5LSnRgH3dLLorGZTxQdGH57UWX2IcMnGej+3qa
 NGyYdOsGgBqaNNFQM1OvJN82AnD6C3WDSi0yMJfv3NWH3Jf/1oma6wxnOqtu7amehVMlXr3Y0ZI
 o8i5cA7WtBgyJ+yVkS4AwXA==
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
 drivers/usb/dwc3/core.c | 88 +++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/dwc3/core.h | 18 ++++++++++
 2 files changed, 106 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 517aa7f1486d..4d0b4c1c73f1 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -30,6 +30,7 @@
 #include <linux/pinctrl/devinfo.h>
 #include <linux/reset.h>
 #include <linux/bitfield.h>
+#include <linux/phy/phy.h>
 
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
@@ -880,6 +881,90 @@ static int dwc3_phy_init(struct dwc3 *dwc)
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
+		/*
+		 * If already suspended, the resume path will reinit GUSB3PIPECTL
+		 * via dwc3_core_init(). A forced resume is not possible as that
+		 * would call phy_init() resulting in a deadlock. Due to the
+		 * phy_init() in the resume path there is also no need to block
+		 * async RPM resume on our side, since the PHY synchronizes it
+		 * for us.
+		 */
+		if (pm_runtime_get_if_active(dwc->dev) <= 0)
+			return NOTIFY_OK;
+
+		atomic_inc(&dwc->phy_reset_count);
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
+		if (!atomic_read(&dwc->phy_reset_count))
+			return NOTIFY_OK;
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
+		atomic_dec(&dwc->phy_reset_count);
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
+
+	for (i = atomic_read(&dwc->phy_reset_count); i > 0; i--)
+		pm_runtime_put_autosuspend(dwc->dev);
+	atomic_set(&dwc->phy_reset_count, 0);
+}
+
 static void dwc3_phy_exit(struct dwc3 *dwc)
 {
 	int i;
@@ -2341,6 +2426,7 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
 
 	dwc3_check_params(dwc);
 	dwc3_debugfs_init(dwc);
+	dwc3_phy_register_notifiers(dwc);
 
 	if (!data->skip_core_init_mode) {
 		ret = dwc3_core_init_mode(dwc);
@@ -2355,6 +2441,7 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
 	return 0;
 
 err_exit_debugfs:
+	dwc3_phy_unregister_notifiers(dwc);
 	dwc3_debugfs_exit(dwc);
 	dwc3_event_buffers_cleanup(dwc);
 	dwc3_phy_power_off(dwc);
@@ -2412,6 +2499,7 @@ void dwc3_core_remove(struct dwc3 *dwc)
 
 	dwc3_core_exit_mode(dwc);
 	dwc3_debugfs_exit(dwc);
+	dwc3_phy_unregister_notifiers(dwc);
 
 	dwc3_core_exit(dwc);
 	dwc3_ulpi_exit(dwc);
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index e0dee9d28740..a7a2baf85015 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -11,6 +11,7 @@
 #ifndef __DRIVERS_USB_DWC3_CORE_H
 #define __DRIVERS_USB_DWC3_CORE_H
 
+#include <linux/atomic.h>
 #include <linux/device.h>
 #include <linux/spinlock.h>
 #include <linux/mutex.h>
@@ -1002,6 +1003,20 @@ struct dwc3_glue_ops {
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
@@ -1065,6 +1080,7 @@ struct dwc3_glue_ops {
  * @usb3_phy: pointer to USB3 PHY
  * @usb2_generic_phy: pointer to array of USB2 PHYs
  * @usb3_generic_phy: pointer to array of USB3 PHYs
+ * @usb3_phy_nb: notifier blocks for USB3 PHY reset events
  * @num_usb2_ports: number of USB2 ports
  * @num_usb3_ports: number of USB3 ports
  * @phys_ready: flag to indicate that PHYs are ready
@@ -1229,6 +1245,8 @@ struct dwc3 {
 
 	struct phy		*usb2_generic_phy[DWC3_USB2_MAX_PORTS];
 	struct phy		*usb3_generic_phy[DWC3_USB3_MAX_PORTS];
+	struct dwc3_phy_nb	usb3_phy_nb[DWC3_USB3_MAX_PORTS];
+	atomic_t		phy_reset_count;
 
 	u8			num_usb2_ports;
 	u8			num_usb3_ports;

-- 
2.53.0

