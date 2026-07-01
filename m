Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987CB420E81;
	Wed,  1 Jul 2026 23:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782948957; cv=none; b=tr9VdeVH8cdGbEnHCx30JV3Nd7a+dg4j2D4D6FOQnvBGPt11cUDxPdLieIHQYXXeye8CBXTy3nfhIIcfVoEx7Qs49FuOEXvtwhwgE5uRXM0OHHiREgqcaYS2I01fLV5ZCd2/1hHTdgGuNFLyd0o9ruM8ZR4hLwP+q6B9VIhmKvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782948957; c=relaxed/simple;
	bh=zEH+uUm8bgc5It+KvVL/LtXKTYllMdlDpxOaj7Ri5tU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BXnDFMrS4bofd6fivF821LJp4QHCaCn6olM+9IWzi3pvb6KMGdOJANUPhUQBaqkkBRGMV+K4VtZtwTim3RWXrX3AmNEkjhqkYK/RYhs75YEzTk5ivLlQfw2XNWDadyfmMTlPBoT9kwIhBjTrulg80TulHc/3rNsn4y4zGN9dgcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bgRf1mSO; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bgRf1mSO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948949;
	bh=zEH+uUm8bgc5It+KvVL/LtXKTYllMdlDpxOaj7Ri5tU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bgRf1mSOQbatqltA5reWhlkgv4fV9swCad1BIePQlv/SO7/vOb1FMAJsuLYlfD9HC
	 wqQwEz98RXde8qAbfp3MEf8cBfs64Dt8BueKFg6C+qSjfpWiaogLtuwZU8jkxhKBk8
	 BpT3Omb8uD8dkN1ZAhk677H1KIlwUoq9KHNLz+46Qs/YqNPYIi5gsXsaw/wnmU1kn5
	 33Y2eom7YTh8mKXiE5lrmMM2FxbTpPbq9KGJJMV6ADvzZcA8mOGGsEUFiuHtKrw6IJ
	 P1JbgrDPct+MbXZ1MsohWJSRBm9277/6ooXDNukuJfwq2bCL+jF42yJwGPNWNQnkLX
	 sM62FJFcxHLgA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5D92F17E1583;
	Thu,  2 Jul 2026 01:35:49 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id B827548003A; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:35:46 +0200
Subject: [PATCH v9 08/38] phy: rockchip: usbdp: Keep clocks running on PHY
 re-init
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-8-e31efbb62d2e@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=zEH+uUm8bgc5It+KvVL/LtXKTYllMdlDpxOaj7Ri5tU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFNhmOTZhvZSE6owDsWEKFbSxQSQfq9Nk
 fH0mz/QivcX1YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRTAAoJENju1/PI
 O/qaqpkP/1734hkjUhH27HxXQedk8ywW2otIuO3pyz4OnZsFXFyhMcmewbb2JnZoxKrO9ilGo03
 ElnAGggGpLbTfG824YhxW7/Vd3LNBm9bDdazFO4IBvzeyQhmjr77RVWFRyMgqxsPPl23og18OnL
 OImZ3FTBsaQPopwMNhQ5o0cc4hq3EvuRDoLIwgRXDYaPxvDhuFv3E6YtSyMX7pUzPRqQkjZRcx8
 UuKKQlYUjMnfHYyzLOICr4dxkwpbkFPuoYgc48HVNsYvoMb3ooF/bmurzCCf02r9Xob6Hqm83Ty
 3Ji0yrl3jIuolb4Vsc9iTns7lfD8v4JBaz87EOJV/cmtI11IX4w73YTyu8ZgwmMrY1Yo8JhZFh7
 Sgqm/aV6v0pxSpX4z9XLdcUumK+I3A1fsGaT/5JPKksP3sMI9MV8Xbo+7orEQqy6H0DT4j6aLcB
 r3nZaXyoRai0ckDgc1Xn8YLvT6ty8H4KdT7aJjreojkQ8STA9vstS1LTo8+fnFIU3HoZUkFza3R
 eHnNIx3HcxUVqYMRoRgPv8B86RgC/nEZXJ5Vo5FMED2pRhzGjGGZ/CWp5nNsFumlEPvrtPcNUOZ
 6qZDPVI0CtbPbFXYCDR/nHPzK3r6S6M2L+Rhj+n8zNtkdREHaRq+YUSa9icoMhad/Op1mRugLM6
 m949+BpaKAuMqCz+EzJYvoQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

When a mode change is required rk_udphy_power_on() disables
the clocks and then calls rk_udphy_setup(), which then enables
all the clocks again before continuing with rk_udphy_init().

Considering that rk_udphy_init() does assert the reset lines,
re-enabling the clocks is just delaying things. Avoid it by
directly calling rk_udphy_init().

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 5d0e4f82de2f..2b27fd1c15d8 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1022,8 +1022,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 
-		rk_udphy_disable(udphy);
-		ret = rk_udphy_setup(udphy);
+		ret = rk_udphy_init(udphy);
 		if (ret)
 			return ret;
 		udphy->mode_change = false;

-- 
2.53.0

