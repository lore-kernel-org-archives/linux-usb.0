Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB9B42BEBC;
	Tue, 14 Jul 2026 19:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057189; cv=none; b=eGLQLyJhQIN4MkyaTNmbqW1+DOV0CmPMDIMDMa8B9wB58Xtq0G4EtB25njyFnEAF+2rd0+te6UZfEAAaWQlNjuMiLMfxvJ2Qlqf5LBQYMLLfiOfbIYDe6wP96R4FqY+M53vmybAQq3GvD0M78rbrqz8cbkSBWNthUgehlto25Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057189; c=relaxed/simple;
	bh=sGR/xKZxEhjIJC4vVaUHGAPO06PcCKvHDSoYH+Om2rc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=teZx0boWAcrtSOJDv0fXkrwiXz5ScYYTrJAEhgFbkApghbvUBTjQQX09GU9kS9JozhirYZ6RVgZHhnA9HCDvJ0hlEb2Uve6rK/cOCKNsFQ3TycZk2/LKqVeFtO9muPfk4y+YWtyY+L8zqKyAZaOFyhG33eukiCGaD7G/W4id36w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=U8nWrS/J; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="U8nWrS/J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057170;
	bh=sGR/xKZxEhjIJC4vVaUHGAPO06PcCKvHDSoYH+Om2rc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=U8nWrS/JJPfVpIrrmXeIIvssIx9Ka1ZW8PRr7nUWOQRe8XnF2phAQxItaoBY3MaAy
	 m1GS8WsUEGl3Xp9lbUsxKktyhHUkyuKHu5tN8vSHqG8zJXuvTlvNlfzr6S5SMUh4yv
	 WG1XDP3yQf/ochLkCIhGI8YRHl5K2gBwpOlIoGqJ9KXCl9BFk5rYwu0AORtqmZ2bA7
	 73SxPGJjSviBU3PhNdt8dc6vDMvwPVOiL44ACW0P38ALb3BxvhqNTQ0iq0yWJQ0qjL
	 +3p+pnBxSznneZt6EAC8uebwDMQewwHUIOMeELCpk92YRvIa+DHgRvaQuNHMF/khFd
	 aLMwZk+nYh7vw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2386217E121B;
	Tue, 14 Jul 2026 21:26:10 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 06382480071; Tue, 14 Jul 2026 21:26:09 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:30 +0200
Subject: [PATCH v13 29/35] usb: dwc3: core: support PHY reset notifications
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-29-6cb3e769d4c5@collabora.com>
References: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
In-Reply-To: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6739;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=sGR/xKZxEhjIJC4vVaUHGAPO06PcCKvHDSoYH+Om2rc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjVBzYPowTDn8H5UUQqK8nJqW5cFMh8nbO
 V3jpExVLAQMiIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1QAAoJENju1/PI
 O/qaIrUP/24ZoPVdXMXcnceNUPR+zis7WWPqhLF6mHjIw4uWfb7wuJ6VMKv2oMPjWebIwn2OpF3
 U67/h4kymI423pITNi2PloiFsViR1I/vweiBMRBQ8D2Of54+GQrjCbbm8AliAKuYFfgzQzUKOEs
 tITZXH2yw3DDSEA/x+lezVY3axdNMMKfChP536wnstHQx2Ve6PZbDxFfaJv81UJriHI6uQWZQlb
 FDr4ATgF+wCz/+tBN7H4EbDCPatI8EyBhUwOa7/ee4XcFZZDIGA5qPHkXyRznGd+cM9oLWj9IS4
 Z6giXcyw2lqFAxGlhYjdaVvKhIQN4p70ncTD2UQEzZVHjxpf2qMcsczuQ/PtAebKoEst0wYgTCu
 EdKB/1jkDAVsZIU8GC8pfEvMUqAYKZBFwv8ie6vQYEeaPdwRjyDsQ+Z3o7s7jehOHi+zZ5LSwP9
 MkHlKH58PF9TcrwbUfnBySUHnc+5jRa8DtSBq6nZenAMnFFU3jGSpVhrWmCuqhjgPhA9dwxs6Zf
 gqW5rvRLSsd2mfxAIRhswLVcP0+k5VV/5ycpQ1EtZWhk4YhzaEghhlUMO+QHmXixAj6veZjwrst
 HIpJy6DlR7MrpqZOkc9llYYbMtOG9hfaOhks3uBv8ViYAzpOXPN8NvuMEMlkGhPb/ONbwdfJQIm
 RVPDrenM6dtCLlUAp+wo4NA==
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
 drivers/usb/dwc3/core.c | 101 ++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/dwc3/core.h |  18 +++++++++
 2 files changed, 119 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 517aa7f1486d..10678dd63419 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -30,6 +30,7 @@
 #include <linux/pinctrl/devinfo.h>
 #include <linux/reset.h>
 #include <linux/bitfield.h>
+#include <linux/phy/phy.h>
 
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
@@ -880,6 +881,103 @@ static int dwc3_phy_init(struct dwc3 *dwc)
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
+	int ret;
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
+		 *
+		 * pm_runtime_get_if_active() returns 0 when suspended (skip),
+		 * 1 when active (ref held), or -EINVAL when PM is disabled
+		 * (device always active). In the -EINVAL case PM ref counting
+		 * is a no-op, so the unconditional put in POST_RESET is safe.
+		 */
+		ret = pm_runtime_get_if_active(dwc->dev);
+		if (!ret)
+			return NOTIFY_OK;
+
+		/*
+		 * Assert USB3 PHY soft reset within DWC3 before the external
+		 * PHY resets. This disconnects the PIPE interface, preventing
+		 * the DWC3 from interfering with PHY reinitialization and
+		 * avoiding LCPLL lock failures.
+		 */
+		spin_lock_irqsave(&dwc->lock, flags);
+		dwc->phy_reset_active |= BIT(port);
+		reg = dwc3_readl(dwc, DWC3_GUSB3PIPECTL(port));
+		reg |= DWC3_GUSB3PIPECTL_PHYSOFTRST;
+		dwc3_writel(dwc, DWC3_GUSB3PIPECTL(port), reg);
+		spin_unlock_irqrestore(&dwc->lock, flags);
+		break;
+
+	case PHY_NOTIFY_POST_RESET:
+		spin_lock_irqsave(&dwc->lock, flags);
+		if (!(dwc->phy_reset_active & BIT(port))) {
+			spin_unlock_irqrestore(&dwc->lock, flags);
+			return NOTIFY_OK;
+		}
+
+		dwc->phy_reset_active &= ~BIT(port);
+
+		/*
+		 * Deassert PHY soft reset to reconnect the PIPE interface
+		 * after PHY reinitialization.
+		 */
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
+
+	/* Release any PM references from in-flight resets */
+	for (i = 0; i < dwc->num_usb3_ports; i++) {
+		if (dwc->phy_reset_active & BIT(i))
+			pm_runtime_put_autosuspend(dwc->dev);
+	}
+	dwc->phy_reset_active = 0;
+}
+
 static void dwc3_phy_exit(struct dwc3 *dwc)
 {
 	int i;
@@ -2341,6 +2439,7 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
 
 	dwc3_check_params(dwc);
 	dwc3_debugfs_init(dwc);
+	dwc3_phy_register_notifiers(dwc);
 
 	if (!data->skip_core_init_mode) {
 		ret = dwc3_core_init_mode(dwc);
@@ -2355,6 +2454,7 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
 	return 0;
 
 err_exit_debugfs:
+	dwc3_phy_unregister_notifiers(dwc);
 	dwc3_debugfs_exit(dwc);
 	dwc3_event_buffers_cleanup(dwc);
 	dwc3_phy_power_off(dwc);
@@ -2412,6 +2512,7 @@ void dwc3_core_remove(struct dwc3 *dwc)
 
 	dwc3_core_exit_mode(dwc);
 	dwc3_debugfs_exit(dwc);
+	dwc3_phy_unregister_notifiers(dwc);
 
 	dwc3_core_exit(dwc);
 	dwc3_ulpi_exit(dwc);
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index e0dee9d28740..4e1791ecb591 100644
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
+	u8			phy_reset_active;
 
 	u8			num_usb2_ports;
 	u8			num_usb3_ports;

-- 
2.53.0

