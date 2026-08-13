Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807FE432E6C;
	Thu, 13 Aug 2026 20:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654331; cv=none; b=SBv+SVo2KHaWZgYUZ8RQ9LeljWY8ObdCZlQPSm37PGmAvCSEzefROeiLss3z2ED0ucHqTmMspVPY4KqKHnlDVWrA23yMpu2MLQ7uOiLaChLobmg+UHEb5bW9htvH1mSm8mH0nNugz7wx/eygLAUs3tG3t7iGAhq4/d9pbzZJJAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654331; c=relaxed/simple;
	bh=UernfhZx0JYe3iXoCAiTVzwM/QAARPlfYy6ZBB10VvY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A3WfLsxkWXgmX0a8rcfK18gY0+jkZlPeNZL/XRwCSrKkyeeKX+naVTrLBr/1PJAoU4Ogn/mISykqpTvSK795/rF1LrmygYJI/RVIgTdM++pmV5veGyMeV78rlHBbzMRdYoXXiNi4ftEYJRtV7YzRe8wL7jGd5x5xjfB2tGK4b+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=iiVz0kr3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="iiVz0kr3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654311;
	bh=UernfhZx0JYe3iXoCAiTVzwM/QAARPlfYy6ZBB10VvY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iiVz0kr33b+IyEogMs/8JPeLyruZJbQaFaMDSi4By8Pa9JtWGUuOmQbQJuCo5niRz
	 ZRiuQRbviWFtgYk4IxrWGa9mVQwXVC2nNtASMY9HM9Q5oRP3JZRyoAUo6RhDFgR0gn
	 rvzmXwvjFqlT2tO/Lh6tnjs0vFyvgKUZHE1MrJwTAQdj9va7J1YC4rbIj+nmgurXwa
	 1r8aGQDJ/xZRp0rpRbL9OSe4pRnaK5i2ecqtGxqjWt2zzPZYJkCE8OIbRv2SaxwMbL
	 z9xZubZgyQPn84G9fUCeNLYFERz4UDtFEdvUtlSdnKETJVjiAdvejLt6dwC7u3ccFN
	 I7OFb3d2EEJTQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F054217E157A;
	Thu, 13 Aug 2026 22:51:50 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C692F480076; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:52:15 +0200
Subject: [PATCH v14 32/38] usb: dwc3: rockchip: fix USB-C reconnect in
 gadget mode
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-32-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2823;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=UernfhZx0JYe3iXoCAiTVzwM/QAARPlfYy6ZBB10VvY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmWt8532Lg/5dPP2v2wQ5BiB5YCJCJADx
 fWfrfVUCwbRX4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5lAAoJENju1/PI
 O/qa3zMP/29YAZehz0zofVJuH2Ernkpt4yYq0AX6+aym1zdc79vYvq8xFCr1sZLlO+PmXEh0FFO
 SMc3I1PqAkodM06CEcZ/MaG/FH/394NxbCzl4XEW+EET+rewxLI5I+sqI2meceu/FS5ThrUMr+e
 XM3fYN//zbsqg5xXpB4RINC8fcGPciRV/Zpq2F67tcuNQHPFU2SmZx8Tt7Y0VR1IiE+ntoONPlp
 lTmN+ZtApxAP1ZBgk+6NkDWUKTJ9ROtJDvMQlipVj/MFlcdmu0sKk19PcxXCaC+zqkfEKwrs9JL
 zzR69bO34aPXzaxjJRKruvv/UkWnUc6eM6l+E3Hfp/HxpIXF5xkym/tJ/7cpAJ83QuRS9poQMlv
 fGjWz9mbz6FtbtMr46BAgT9n3ilC+k1VwcCfAubixBhJeiVJY2qDYckeKVaAywm3KKoQCVFufaa
 +0mGcLyFg1bIuDWK/23cHoWERc1yPhMl8ZLs0LzrU8OcOIWGp6cIK1D+8R9jPqBPFbvDFOy9hnl
 j5qmq/YQzzN2eJojvek6ug7lP11cqdpeoqRAiNDiiUAwTLuGPnmZaYg8BQJJ8n+2MoKrEW7GRn1
 vhTXoi02DxJ8jL01qFXY92fbXFHLpuTRzQXnrcjJj8eFHhchPH9stfHy14frM4/G0rd7K9WDYo/
 IMdHaFB6+hOSUdHE/ttg9GQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

When USB-C is configured in gadget mode and the cable is unplugged
the USB controller is suspended. After plugging in the cable again,
the USB controller stays suspended and thus the port status remains
not-attached.

Fix this by triggering a runtime PM resume when the role is changed.
The Runtime PM reference counter is immediately decreased again - the
auto-suspend time is big enough to detect the connection status, which
will then keep its own reference.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/dwc3/dwc3-rockchip.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-rockchip.c b/drivers/usb/dwc3/dwc3-rockchip.c
index 9e91e5f7e53d..246d7dcafc68 100644
--- a/drivers/usb/dwc3/dwc3-rockchip.c
+++ b/drivers/usb/dwc3/dwc3-rockchip.c
@@ -25,8 +25,17 @@ struct dwc3_rockchip {
 	struct dwc3		dwc;
 	struct dwc3_rk_phy_nb	usb3_phy_nb[DWC3_USB3_MAX_PORTS];
 	u8			phy_reset_active;
+	enum usb_role		role;
 };
 
+static void dwc3_rockchip_vbus_handler(struct dwc3 *dwc, bool present)
+{
+	if (!dwc->gadget || !dwc->gadget_driver)
+		return;
+
+	usb_udc_vbus_handler(dwc->gadget, present);
+}
+
 static int dwc3_usb3_phy_notify(struct notifier_block *nb,
 				unsigned long action, void *data)
 {
@@ -57,6 +66,8 @@ static int dwc3_usb3_phy_notify(struct notifier_block *nb,
 		if (!ret)
 			return NOTIFY_OK;
 
+		dwc3_rockchip_vbus_handler(dwc, false);
+
 		/*
 		 * Assert USB3 PHY soft reset within DWC3 before the external
 		 * PHY resets. This disconnects the PIPE interface, preventing
@@ -69,6 +80,7 @@ static int dwc3_usb3_phy_notify(struct notifier_block *nb,
 		reg |= DWC3_GUSB3PIPECTL_PHYSOFTRST;
 		dwc3_writel(dwc, DWC3_GUSB3PIPECTL(port), reg);
 		spin_unlock_irqrestore(&dwc->lock, flags);
+
 		break;
 
 	case PHY_NOTIFY_POST_RESET:
@@ -89,6 +101,8 @@ static int dwc3_usb3_phy_notify(struct notifier_block *nb,
 		dwc3_writel(dwc, DWC3_GUSB3PIPECTL(port), reg);
 		spin_unlock_irqrestore(&dwc->lock, flags);
 
+		dwc3_rockchip_vbus_handler(dwc, dwc_rk->role == USB_ROLE_DEVICE);
+
 		pm_runtime_put_autosuspend(dwc->dev);
 		break;
 	}
@@ -130,7 +144,16 @@ static int dwc3_rk_phy_register_notifiers(struct dwc3 *dwc)
 	return devm_add_action_or_reset(dwc->dev, dwc3_rk_phy_unregister_notifiers, dwc_rk);
 }
 
+static void dwc3_rockchip_set_role(struct dwc3 *dwc, enum usb_role role)
+{
+	struct dwc3_rockchip *dwc_rk = container_of(dwc, struct dwc3_rockchip, dwc);
+
+	dwc_rk->role = role;
+	dwc3_rockchip_vbus_handler(dwc, role == USB_ROLE_DEVICE);
+}
+
 static struct dwc3_glue_ops dwc3_rockchip_glue_ops = {
+	.pre_set_role = dwc3_rockchip_set_role,
 	.post_phy_registration = dwc3_rk_phy_register_notifiers,
 };
 

-- 
2.53.0

