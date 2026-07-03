Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F36E341068;
	Fri,  3 Jul 2026 18:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783102425; cv=none; b=FzcXUdNPp++jjmzPL/g/QkeqAA8yMnI97NPviJc52193u9OWb5YaKACRhIN+fwX2LcWTsBpwsCCgquDrMmz9sfigSPq9e2EFHSNGY2o0roRu990NLeKZFQGHP1Xz8R7CELGN99YAFhXEYdpDUI+/+72PFqZAG1ALWLlOiVuwkBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783102425; c=relaxed/simple;
	bh=DD06F9UGdc4fStpWJrHPhAmDgKde7njpjXBETGCLvWw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o0+EbYRdkwlJtm8UCW14tcfI/VoLnVUT9wsgLZmaMqvDI8LrmbWha5qfLoNPE2xLYEkG1jNXnUzZ3+HVThj+dNLTBCKjgjyaeej4nvB/dxPJgKEvVWqigWbAlOVD+El4ctJtW7Nghgw/1r7bMvQNR//RjgAOW3t7ZjToqGfByBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oVHfqpGh; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oVHfqpGh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783102414;
	bh=DD06F9UGdc4fStpWJrHPhAmDgKde7njpjXBETGCLvWw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oVHfqpGhidNfd+LaO0v0f3GAyKgJwr8VZMK/+N5LNeLmoQqWQVya3BeCCZh6mAShb
	 I7MROnLWoBkCmPK+vl26ESGllGKb0bg0oDe7z5yFvwr48WuVqi8zwDRWITJvLPH4k6
	 l+bSGYLcmPBKEj71/mEPHdHWNprEGQZvYIWh4WrrkyvFv/18eoreD/F9m0exPYsxwk
	 m6qoo6B+FEzwbaKZeFSitaKTM8/xgJuyIPMLccyCtPaECgnL6I1uI0CKoohC9ioI6q
	 p6wFF3hZ4WQd84uW+tAW0oo5Rrvdleu9tnJhKydy1+vLOfI3MP+3d7EQEo7uF68S8d
	 CO14joGFz+hOA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EA44717E1562;
	Fri,  3 Jul 2026 20:13:33 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A827D480075; Fri, 03 Jul 2026 20:13:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 03 Jul 2026 20:13:47 +0200
Subject: [PATCH v10 31/36] phy: rockchip: usbdp: Add phy reset notification
 support
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rockchip-usbdp-cleanup-v10-31-a392711ca8a9@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1856;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=DD06F9UGdc4fStpWJrHPhAmDgKde7njpjXBETGCLvWw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpH+8xAS6PGqYMynmSZUaydQu/RENozONUHN
 2qJ7l/pk4kgLYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqR/vMAAoJENju1/PI
 O/qa9+UP/i0jXUDHYyE9gzA5MafW/BBe7ac2BHM1SIT+a/QQp8KNINX5MSxjniuBjCML/ROla0B
 pjsHJQ0b3hp6PinpJ2mAKDqi1T4gQ0FpcSYisAFtQvg2V0R2XTFcTGdIYzPYHE8x1ZSYiwfSHdN
 8jnNL7nbi8rK6j+ZwXR7/UfHyyGAGuwYfStDq3PeqkVRnLH3hC5KlRxJAs1LqqATWuw/fOR3paq
 Pdwv0qTeCJC2ruApvsp4OOppbv/newiMRCI3oGRKaJFlZQaJQAzLRh1MJgGZ+obQnM6/Xg2BI4s
 ZyZHlM8pgrIh5e139cBuPIxuhdilXjxW0isLuzzOujAm/wnjW04IczxnL3Nk9wUfZHU5pRLPgnq
 nCuTXRbNAOYAsnwoTiIjysC8wWOhKTrURyffhFyPPKoq4d8H25fdHg0GfZtygtxaHoaFSPcvCjn
 dDwrnnNOpwXOUXTc9dEXCuu8lGZpi30BqBg71yR+8ikdz5ZAO1BIUXdR58ODvsCshoqVpTJUYek
 VErucrYi9ZljE2LkufadoN7IDEbwCifK8Nzzdq1KLOEMddYmd+n4BwaXfdse2l2kZQoMJGeA7uH
 B8Sjnl49+JTtlZI13LvWwzrnOididwfq8Pvpztr43EnxRhNIbxtpsTjAhqP3mXFOmgL9nhRFdmu
 LGqljx4xzRvFx0eE3sX8tEg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

To resolve issues with running into permanent "cmn ana lcpll lock
timeout" errors after a few device replugs, add support for reset
notifications, which will be handled by the DWC3 driver to gracefully
handle the PHY being disabled. This avoids corrupting the controller's
internal state and the PIPE interface between the USB3 controller and
the PHY, thus fixing the issue.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 694688ed387f..5d151fff9eeb 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1005,6 +1005,11 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 	}
 
 	if (udphy->status == UDPHY_MODE_NONE) {
+		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_PRE_RESET);
+
+		rk_udphy_u3_port_disable(udphy, true);
+		udelay(10);
+
 		ret = rk_udphy_setup(udphy);
 		if (ret)
 			return ret;
@@ -1012,13 +1017,22 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
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
+
+		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
+
 		udphy->phy_needs_reinit = false;
 	}
 

-- 
2.53.0

