Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A487743F4A7;
	Fri, 10 Jul 2026 16:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701994; cv=none; b=PqfHXkbq43QE1mb9VgbTU/Pr3mbwAJXLVpqeBeWSCn5ESSV6Ko46BEzw5ABzs7Stf0/qm7W4uAsgs6ne0x15SjzljIsSBgRgcGieUS+etm1yztPytbUeiNyWdSRK9IDK1pobV9/1T+Uig+/z4dJIjWkbF8MCC20MbeLcPUXFzuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701994; c=relaxed/simple;
	bh=JEzDlofvAuUDkbxOysD5mFj1UY3uEY+FfXEJ0lIXwmg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bW2Q18JL2aDDM7/KAQu5mh8G81ZumKIXIuGDFeShC7re0Iu6Dwc7USf2X3YaLbbav7SPt3Q5z/O54o6abeW1ZMUrdMhMlHBqQqzSGxnw1Kqnnzayqvem69poKkA5bfooQvx/le2q+EiBF3WgGbU6On91PgptQDLo+4BsZ1KBAi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=U8g2Mj+f; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="U8g2Mj+f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783701979;
	bh=JEzDlofvAuUDkbxOysD5mFj1UY3uEY+FfXEJ0lIXwmg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=U8g2Mj+f1FZitaV5pScXtnHTG7ZNY9qYA+zyaVkHXcdHHRrgmZipcGdDixmjMGo9J
	 bmc5z8e56PMn2/nK9mMJ+Ru+NzsyWZFNjn5zasTbHGIDAyGfAxP6neIGO/isTMxp/n
	 ESUrSgKVmrG4ICCWwZ3QRhxy2LpZcW3UdlHV7ptWi8VVHMJiQXH7wGaHC5xVoeDEOa
	 NFBllvHJ808ctGZwF+7ZDFJuncm7OUqG23U01xRdIum9bxBDK/4a8lTyyt9q4ostN9
	 x7bAz+kn1jCKggd/5WKY/85OaFNI14aoD51O8Hfcc6GCmrCoQxpJuVcAQsgglI6x7K
	 w6o61yu3ggxfg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1F98017E127A;
	Fri, 10 Jul 2026 18:46:19 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0ED7748006D; Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:45:04 +0200
Subject: [PATCH v12 26/36] phy: rockchip: usbdp: Avoid xHCI SErrors
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-26-8b41a9a9bef0@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1963;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=JEzDlofvAuUDkbxOysD5mFj1UY3uEY+FfXEJ0lIXwmg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdnmuK2Hp8wMpumqAEsjEu40uZWt0IHM+
 JE797gyAXISRokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHZAAoJENju1/PI
 O/qa2iEQAIlsYPItJFo798GBS5QVmJq96VPvRVoNfXyGbNXifYZUj/w9zzV0ybrjzMSThSD/TPm
 zQnCZfVEmrxdHSw8Ii1ZowTFFksBIgpphsnLs2rfGIMgSGpxaQ0hmyIIYMAgUvb6/OJ2o01fBnu
 fvUGviICa2bFZ3ptymKlvYNjeWFmmS/2DXahXSOYmscaK9Ifbp5b1qd/ousF/eGWUNULJLn2DrM
 74alvkI6Xb62+uhz4b+p7I3nx0HgMZUw7IA3N2jIqfdmvlX6SitCB+fho+X0y/6aKiuysRhNrMO
 5YO1AQs3MV8zyljzzH0MxZjp0vCzAZHyHNnFYeo8UoIr5ukTTVIIhoTO8ppjbPLvslSxXyeaKq+
 vDcwZtoLCIxCn97asfKPasrVeFIha3H/l7LFo++xxrlhePKek+mpC35svVFkKru+79++GkW/TDJ
 ryzV13pwyO1MsEmrHhwk5Uvp4M17hEBo2URSenO6cUMfVE2BjlO+ndE7M5Czv8eWWw4H9OIuCKo
 wgOGJcRVjga8erlEbo8njMl92xtS2Om+bFOAKx18MtwpZatsRPJUUDjxqRMvjzPiPx5AQbadwoQ
 oxj5PDj2lkthV1zhSw8LwK0HKcF0sPZ3JvGtwYTEwlCrQPEfURskX+EGIP3Z3+lI30EEdtOo61B
 wgNeoYtt9PPg9cKpx2nY4Zw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The USBDP PHY provides the PIPE clock to the USB3 controller, which
means the PHY must be fully running when anything tries to access
the xHCI registers.

When switching between USB3-only, USB3 + DP and DP-only mode, the
PHY must be re-initialized resulting in a short period of the PHY
being disabled. If the DWC3 driver decides to access the xHCI at
this point the system will fail with an SError.

This patch avoids the problems by disabling the USB3 port before
re-initializing it. This does a couple of things:

- forces phystatus to 0 from GRF (not from PHY)
- switches PIPE clock source from PHY to UTMI (safe fallback clock)
- num_u3_port=0

The last part will be ignored, as DWC3 already probed, but the
clock re-routing will avoid the SError. There is a small delay
afterwards to make sure the mux happened. The datasheet gives
no hints how long it takes, so delay time is a guess.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index edee27933d89..ff768e5b43ca 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1000,12 +1000,15 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
 	} else if (udphy->phy_needs_reinit) {
-		if (udphy->mode == UDPHY_MODE_DP)
-			rk_udphy_u3_port_disable(udphy, true);
+		rk_udphy_u3_port_disable(udphy, true);
+		udelay(10);
 
 		ret = rk_udphy_init(udphy);
 		if (ret)
 			return ret;
+
+		if (udphy->mode & UDPHY_MODE_USB)
+			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
 	}
 

-- 
2.53.0

