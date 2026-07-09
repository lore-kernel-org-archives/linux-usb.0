Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839663B7A8;
	Thu,  9 Jul 2026 19:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783623880; cv=none; b=PA+or4nYn0L8/mdCgMCLonLVwhz/rtY2v7cFjWD9Pfnp5r7lU5Bea6O0jS2jpJTekMvQ0pQ6Jpf4UgZp5u0Sa+ffKN8NqpSD/J4dKAXscsrMnFuNlHLtQmEUYvsNCPRwqN8kISj7Z0UlTrNYs8mX2t41tG4onb1Aq33MRBk6ULo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783623880; c=relaxed/simple;
	bh=jyka63U/GjjUhb5TWMLQN8i44A0dSjRl6GzINFUtTsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tVZrHI2odkplNAupJ98pGG2Oo28/iOBaYG7Dym/1fHntuJH9re2Okzequ+I/SSXbgKKfgfCMctqfQuFMWUz9WL0pv9DvwgfgzsEOC/PyJGvMB9o8Vdbb8o7fLBw61n30Hh3xGsLoCr8Cr0bBCmhD2V+U3YGY8aNOQtY5Ugh5MR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cNh/ojD3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cNh/ojD3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623874;
	bh=jyka63U/GjjUhb5TWMLQN8i44A0dSjRl6GzINFUtTsU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cNh/ojD3Xg+qQmK1ZD6hpMhiFiKF8DH2cOp/rMowPfVHoK6IQSGWh5BcFAkHNAaaA
	 C5vq4saBO2gQYUldQCKWc5l2mVxKPgW+qGAdsarRJz0bxE8414QsoSKVOLMzqcKifb
	 yP3nQQAqGBLXNbHxPjb/Cc1A4ycf9iOivXJ8pHAbxpwX0bFbxDoK7Tws08RPW+HcUz
	 rf/QY7sWuf4/QDvB5/q7NE2VWmH5G4un2lRN+vOXglQxsycalu7IWENaRI/UAaYjys
	 wx50GVdWkHQg76JsxlZs5jMdZxWul1b5UdFFNc4B5Qqc4G+8HFHP6rLg+pIOR2W805
	 w7eT65iRkuQtQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6681A17E0DFB;
	Thu, 09 Jul 2026 21:04:34 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id CF925480074; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:53 +0200
Subject: [PATCH v11 30/36] usb: dwc3: core: support PHY reset notifications
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-30-a149ac60f76c@collabora.com>
References: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
In-Reply-To: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5906;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=jyka63U/GjjUhb5TWMLQN8i44A0dSjRl6GzINFUtTsU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8EUp6wNudKoEmpYu+VN9TPKaZXgC0tJqS
 W3dZOaswJwLT4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BFAAoJENju1/PI
 O/qasPgP/1xwm6zUM1B7R2h6iEv62Zr03qXI8VaL3x0L6l2CNFr5qIBgFIjRKPI3wZUGgOuF7A5
 IBo9+dvUnIeBXPBV7V532JZGWD9bv74Lo7q4n64Nph8yc5Vc467KvOjvLjeCkK/UAqp2OJ/m7PQ
 koG0H6CKgfDJRLS8PSEq2lChc2UT2E+szmPclO7xOuQtzM+76l1f5dp7EATApiCAxPCt/47UJqW
 MGSpyukkDSdNus+y1ViY8aVq08+1kwUvZiAJtqXqCWdiyubPI43SWmD2yDAgDRVtJ5xgs9ip84w
 zF+fGO0Om57ajLhlVGDGSRkP9pWNzasAHvfLWYKWpO5jeS8/NocOD1CZAaC2OZDslKN5nCmmuiY
 JfPRE9T47qaqwlunsSUSMqlx9HNyGa4pk4Qn1DyOsNxNKTBUuSM9GlidD+0IX5UdEkyJqM0tt2h
 s3gHARtF69ODlRvbYQCfKFeaNVsvHZxmIed+FlzDv6UW2wl+FyuWhtT9fD2N7FuGQS+04C5DMw3
 Ufn8D30uVrfZo5zVbCx96+ylO3wgFT09pl5hMyFYo8knP1OyaeaE9jLr1TwIU0Los1yvfHkBnTd
 SyuJ3mRuFnFRnPZfK+Hi8IpREgo2rzg4n4aZcQ/VSjhupgaQh5Ys9eEk+Fq7TClVeVFfy6ox/ea
 MRkis6C0NF8Y+//TVXE4ziA==
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
 drivers/usb/dwc3/core.c | 80 +++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/dwc3/core.h | 18 +++++++++++
 2 files changed, 98 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 517aa7f1486d..ae469183cf15 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -30,6 +30,7 @@
 #include <linux/pinctrl/devinfo.h>
 #include <linux/reset.h>
 #include <linux/bitfield.h>
+#include <linux/phy/phy.h>
 
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
@@ -880,6 +881,82 @@ static int dwc3_phy_init(struct dwc3 *dwc)
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
+		ret = pm_runtime_resume_and_get(dwc->dev);
+		if (ret)
+			return notifier_from_errno(ret);
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
@@ -2341,6 +2418,7 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
 
 	dwc3_check_params(dwc);
 	dwc3_debugfs_init(dwc);
+	dwc3_phy_register_notifiers(dwc);
 
 	if (!data->skip_core_init_mode) {
 		ret = dwc3_core_init_mode(dwc);
@@ -2355,6 +2433,7 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
 	return 0;
 
 err_exit_debugfs:
+	dwc3_phy_unregister_notifiers(dwc);
 	dwc3_debugfs_exit(dwc);
 	dwc3_event_buffers_cleanup(dwc);
 	dwc3_phy_power_off(dwc);
@@ -2412,6 +2491,7 @@ void dwc3_core_remove(struct dwc3 *dwc)
 
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

