Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6006C43B3EC;
	Thu, 13 Aug 2026 20:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654329; cv=none; b=bC+6ihMvTG2XIMdOTIqygkbd0w04djrafa0G4LlyPLvUesd9b+OBpbY+JLj30o1Tosn3V5Dky1/KKyp2kqNNREtEqjfukWSPqpt3WA7OMce4cuj96EiPYpDT1FxnpYVt7Sw/y3XTIdBkkg+FqPaeRd98wK4aBQ1wxK9OoId0Wyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654329; c=relaxed/simple;
	bh=spmEcyu0k2MKd0qFutZPYWVRo/y0CcX0idupQElCsbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dg37eCWWXfcSpk4IWQy0HkxOX41d9XEoAYGg/9DsSia8KYD/2HbNgZ3z74MlFfP7Shq7atnQiNVzR7ZTZEIuR+uNRDdRN4d0mY6h7vxJY6RgNIRrcNo2WlnwYQa19aB8q6NB7di/lYhT8yiIWwKSoItl8XgrQbCeFliWT5iDn04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=S+MRqUfO; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="S+MRqUfO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654311;
	bh=spmEcyu0k2MKd0qFutZPYWVRo/y0CcX0idupQElCsbw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=S+MRqUfO7DD5gbCC5qWahySKuVXZplJWRGZbml2Sj4rVc6g4ge964/MyOArJVHfE7
	 UB50xan7f8w9p4brNFsB1m7SV4rMDNadtFbGl5yJciAlGwYpxWmeS37kdjRIs27XFr
	 vp76DUv3wRqyDtNDwTJkA6uDjuhCZEKcWOjuB1OkNvWA950vTX5BPxcSkI6TSDeCi0
	 yYeB9p9SmY2SKZxuo+7Se0G6B8b8qBRGPoIH9Mrvmhuz+ZYb1KByUbjXXN5npwhpc1
	 48Z9HEx6qNoal20rMlTnBApmRNSY/W3ENdtZszSAHj/57dVEzG9z9bc8ETWmJhh+5v
	 br+73SiYWIEyA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0616C17E15A5;
	Thu, 13 Aug 2026 22:51:51 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C830D480077; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:52:16 +0200
Subject: [PATCH v14 33/38] phy: rockchip: usbdp: Add phy reset notification
 support
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-33-b5ad9c68fa11@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2051;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=spmEcyu0k2MKd0qFutZPYWVRo/y0CcX0idupQElCsbw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmUiDe07eDCnaZ5KbEnAis6ILxTW+4ylp
 e7mb3mS/ca6EIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5lAAoJENju1/PI
 O/qadqMP/jNqqMAC6NZiBIRANjgie+u8VGHTTTFrHYl1wYztaRtRiCA1NSd3zUFXhToldmRKCpA
 eTHbd1rotrkR1kRh+qmpeORZ7pgrgPWT+03PFGzBaIHAaclP/6PtZCNPbIvECky6Ne8qq8aZEUl
 hKJxkj96uvVdZcb3ibdhd+M6HNAlt7Kgpcm+2Pm7LKSy0IExhTeR9AYWaVCLgWvJUefDlsC7uVA
 /mdYQELqxbaVZU3dLOTzMPXEdkkC0aWTqdSYqRjuSpemHdsd+YpmGpkiX/oFIxjAfvBW6fRtdaM
 sFZCg+nUFDUgG0b8twyfFGJrdHx8legewT1OFooi4V3yqb+lGuu/yH3MW50RNv/7U7gWTbIfddA
 HEZtwki3kT+9D2nNC3vtWOA6qhhv/fseKx5/TZerTGdWp1cUziFNsTxNGQ8HwDMSg6bxJEZIHvj
 NHWNYCjeXt8VsAxv7ujExQliXfmGFBVFE4RfanUDFXGmz+aTwyDlZ96otrJvCSccfQfIlasQvtH
 C8+3muijy3Hn/5XiGifPxmiak+uQLw9yabqSZFGbuYGW5fyY+E3WKiez2OgB9oLlOjJ015HDZkZ
 M1VS1fCVFpba2TZrDutdhtszU66cYAUy50RaVpG2Xl3vZKxHVZi1mPBu9vRD+dlERgTYOVCLGAj
 9Flgn3xp5Rz21y7td6+kjGg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

To resolve issues with running into permanent "cmn ana lcpll lock
timeout" errors after a few device replugs, add support for reset
notifications, which will be handled by the DWC3 driver to gracefully
handle the PHY being disabled. This avoids corrupting the controller's
internal state and the PIPE interface between the USB3 controller and
the PHY, thus fixing the issue.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 59b836a3796c..21f282216aef 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1005,24 +1005,39 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 	}
 
 	if (udphy->status == UDPHY_MODE_NONE) {
+		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_PRE_RESET);
+
+		rk_udphy_u3_port_disable(udphy, true);
+		udelay(10);
+
 		ret = rk_udphy_setup(udphy);
-		if (ret)
+		if (ret) {
+			phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 			return ret;
+		}
 
 		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
+
+		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 	} else if (udphy->phy_needs_reinit) {
+		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_PRE_RESET);
+
 		rk_udphy_u3_port_disable(udphy, true);
 		udelay(10);
 
 		ret = rk_udphy_init(udphy);
-		if (ret)
+		if (ret) {
+			phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 			return ret;
+		}
 
 		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
+
+		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 	}
 
 	udphy->status |= mode;

-- 
2.53.0

