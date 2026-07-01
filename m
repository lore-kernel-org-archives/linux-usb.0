Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A53A42847F;
	Wed,  1 Jul 2026 23:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782948960; cv=none; b=RZPW2mTkkZweSpZdu1GTlDjYqITe6yamg1QNOk1Uiv7etmLIZkoT2nB0tnUZgOqUlkhZ5zulknMxlF8rf4Sdg2J/IVd/eeb7dHvdr1VTD2LDR+v1exZ/HAytBgY5RmIniLDdv8nyZCS3foRW9mftBDUX5G/1ZgFLVh61gcJXHHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782948960; c=relaxed/simple;
	bh=np2J43IcHBPq7RBBOFbcW7f507/36/KZRoRU4RyhKMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ierxJmotHNes9MyruXJjiyegi0EgP/k+Vt4PTz0EnUeW6RwY4tWzQog5tUAsGZ8S5m83+r+sfMxk/CkjuqTLdrTj//5TyhZzpJtsDs7wZKANAwcIRboT52fov+aBnc5n68uJ5P2Ju0FlUC2Mp1MbERDQmfNTUkK33N0kWStc3ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=U2trjkur; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="U2trjkur"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948950;
	bh=np2J43IcHBPq7RBBOFbcW7f507/36/KZRoRU4RyhKMM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=U2trjkurvlWVRSQjI+m65sHxWQR9bigHjhBKW5z+WVRCcoA/59vH8ssFeZTOVHWBD
	 5+ibWapwhu0y4iuHvglZYWWCTollvczfENsuzZ5ODa+cYNqdtxZvAUarfgWi3in1oE
	 FIknKUuzNwUy9d/SMPGfElHk6OzrirZBE4tjDJ+zd6wKd1ehIsNXR9GYhsokd1UvmM
	 eXwakQ9Vvbo3JaLoZofF9lBhMSIXeWbCewOH/cqeesaICdUSo9WvwfH50xdGh34l8r
	 e297iEaqJGQi4ngk45cuVyWdgsnb7q+UUUHqSiaGQce6DNyy4PBT1PA4Wf6S9cd50h
	 12zIm2zdC4SHg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2E33D17E35FE;
	Thu,  2 Jul 2026 01:35:50 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id DC3E7480076; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:36:10 +0200
Subject: [PATCH v9 32/38] usb: dwc3: core: support PHY reset notifications
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-32-e31efbb62d2e@collabora.com>
References: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
In-Reply-To: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6018;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=np2J43IcHBPq7RBBOFbcW7f507/36/KZRoRU4RyhKMM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFQaADYzy+H1U2MVBcvmVgrz/Ohh1r0WA
 621tmEzbjJxhIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRUAAoJENju1/PI
 O/qa1l0P/0QluI8keuml/NJRxub5jsIRwmkwHhPY44VRDIhQaL3oCCCPCwBD1nDcRIZCDG3yI/R
 L0/z33sIbjBCODHkpGkMEvdkqr1sXIEtLx7VMjV0Ng5rbGS0hMTwm7bHB+RQdlLqSCGK5QMGBhX
 BV1+wr/TMhhdiYb3Qb0xPmh0ZtNTBzyeaopAMYbmGKKbqMFHK69fkHFWMWSFOK2y+BNylkeM7l1
 NKzhdqDybxkNSbuG+lpOrQlvvkY1p8oznwWHjuiYVUtoI1DQ5FcphWbmdfnLeY/dsNsmd/gaDWd
 EQ6Gt+ScOMkcylwjgMRAAnKlnQAIY0KSXYFDUxUTz8soOH8Rho6zqyNKveI1vq2tooj9JFH82Dl
 PwbcX8yO04A8tT7GJVyBfdqurEdwxZGEmSBgUtACehRG+dKv1/DtOxUY+s0WBgMO91dX+RgX80I
 jXtEJt4gaRn7rMramHcsXRzyuS6SXkxe+qtm4JZ7vIoVaa+bIG6slGhF2OXy5JewpCfDI+5Rrcv
 csgric6kKxbScWbLO3PgVKWUodZ130mI7DwCues6sGDZqqpNSZtX9NUpAGWMtg6jji/vFKXqsih
 ZzJQBoTR2T+7yMJeBU0bwT1vmx6HcPt/oZl+LdKB3lepRkR/Q3UWsZRvtnZ5KB1zsXjvzAOHMmD
 OSzGPrCo+064lXVKePz4m1A==
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
 drivers/usb/dwc3/core.c | 82 +++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/dwc3/core.h | 16 ++++++++++
 2 files changed, 98 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 517aa7f1486d..fdc92c22381a 100644
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
@@ -880,10 +886,86 @@ static int dwc3_phy_init(struct dwc3 *dwc)
 	return ret;
 }
 
+static int dwc3_usb3_phy_notify(struct notifier_block *nb,
+				unsigned long action, void *data)
+{
+	struct dwc3 *dwc = container_of(nb, struct dwc3_phy_nb, nb)->dwc;
+	int i;
+
+	switch (action) {
+	case PHY_NOTIFY_PRE_RESET:
+		/*
+		 * If the controller is already suspended (e.g. runtime PM),
+		 * there is no internal state to clean up.
+		 */
+		if (pm_runtime_suspended(dwc->dev))
+			return NOTIFY_OK;
+
+		dwc->phy_reset_in_progress = true;
+
+		/*
+		 * Assert USB3 PHY soft reset within DWC3 before the external
+		 * PHY resets. This disconnects the PIPE interface, preventing
+		 * the DWC3 from interfering with PHY reinitialization and
+		 * avoiding LCPLL lock failures.
+		 */
+		for (i = 0; i < dwc->num_usb3_ports; i++) {
+			u32 reg = dwc3_readl(dwc, DWC3_GUSB3PIPECTL(i));
+
+			reg |= DWC3_GUSB3PIPECTL_PHYSOFTRST;
+			dwc3_writel(dwc, DWC3_GUSB3PIPECTL(i), reg);
+		}
+		break;
+
+	case PHY_NOTIFY_POST_RESET:
+		if (!dwc->phy_reset_in_progress)
+			return NOTIFY_OK;
+
+		dwc->phy_reset_in_progress = false;
+
+		/*
+		 * Deassert PHY soft reset and reconfigure the PIPE interface
+		 * settings after PHY reinitialization.
+		 */
+		for (i = 0; i < dwc->num_usb3_ports; i++) {
+			u32 reg = dwc3_readl(dwc, DWC3_GUSB3PIPECTL(i));
+
+			reg &= ~DWC3_GUSB3PIPECTL_PHYSOFTRST;
+			dwc3_writel(dwc, DWC3_GUSB3PIPECTL(i), reg);
+		}
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
index e0dee9d28740..79d833d00137 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1002,6 +1002,18 @@ struct dwc3_glue_ops {
 	void	(*pre_run_stop)(struct dwc3 *dwc, bool is_on);
 };
 
+struct dwc3;
+
+/**
+ * struct dwc3_phy_nb - wrapper for PHY notifier block
+ * @nb: notifier block
+ * @dwc: back-pointer to the DWC3 controller
+ */
+struct dwc3_phy_nb {
+	struct notifier_block	nb;
+	struct dwc3		*dwc;
+};
+
 /**
  * struct dwc3 - representation of our controller
  * @drd_work: workqueue used for role swapping
@@ -1065,6 +1077,7 @@ struct dwc3_glue_ops {
  * @usb3_phy: pointer to USB3 PHY
  * @usb2_generic_phy: pointer to array of USB2 PHYs
  * @usb3_generic_phy: pointer to array of USB3 PHYs
+ * @usb3_phy_nb: notifier blocks for USB3 PHY reset events
  * @num_usb2_ports: number of USB2 ports
  * @num_usb3_ports: number of USB3 ports
  * @phys_ready: flag to indicate that PHYs are ready
@@ -1171,6 +1184,7 @@ struct dwc3_glue_ops {
  * @suspended: set to track suspend event due to U3/L2.
  * @susphy_state: state of DWC3_GUSB2PHYCFG_SUSPHY + DWC3_GUSB3PIPECTL_SUSPHY
  *		  before PM suspend.
+ * @phy_reset_in_progress: set if a PHY reset notification is being handled
  * @imod_interval: set the interrupt moderation interval in 250ns
  *			increments or 0 to disable.
  * @max_cfg_eps: current max number of IN eps used across all USB configs.
@@ -1229,6 +1243,7 @@ struct dwc3 {
 
 	struct phy		*usb2_generic_phy[DWC3_USB2_MAX_PORTS];
 	struct phy		*usb3_generic_phy[DWC3_USB3_MAX_PORTS];
+	struct dwc3_phy_nb	usb3_phy_nb[DWC3_USB3_MAX_PORTS];
 
 	u8			num_usb2_ports;
 	u8			num_usb3_ports;
@@ -1415,6 +1430,7 @@ struct dwc3 {
 	unsigned		wakeup_configured:1;
 	unsigned		suspended:1;
 	unsigned		susphy_state:1;
+	unsigned		phy_reset_in_progress:1;
 
 	u16			imod_interval;
 

-- 
2.53.0

