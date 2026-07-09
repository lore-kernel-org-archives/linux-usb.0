Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DF04499A5;
	Thu,  9 Jul 2026 19:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783623753; cv=none; b=kqD+0zHwUeM5q0dF9m8gBevNzTjkT7VFUobSo2ovevdtwZQQrX3reUyDEbEUj9O1lGVoiaEqCtJTrsQw1wG3zLpX4n/eASR2+VzWlMqp9HkRyYENvyqr27U9I0DizC/BOmH2SY36lh/UHnkal4aUc/f09AHFcX0mj+EJajFNJAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783623753; c=relaxed/simple;
	bh=1p3WFYm3nPwFyjx+ldeJOnj6dqBA+X1XeNTC11p7Zk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NrBngQBbjJY7TZ9B+sJTnhG9JjYVlYHzio4yJJQ3fZ3gN1GboTvmuXPaK+wEXZWRsifjyes6lhYfQOmGWbuu7f7MV0Xre+s1JYP5tq4LuFhQ0C9Af2zlpy0PfzLnXhPj91zyjOmKk0Kcsfp2R5107R8jPtRpQfd3RtA73QO719I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ei2DKV11; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ei2DKV11"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623750;
	bh=1p3WFYm3nPwFyjx+ldeJOnj6dqBA+X1XeNTC11p7Zk4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ei2DKV11XgBN0X64BoDpwf5HmVegaYOxlH4DPJ1x3cw9vS4BvHsTtYx3pbPD9IUHM
	 GfrKBDSYiHhR7QmZv/DQGc7L7prEsPJweSr5PAGJ0yIpI4+CTUUf0WF7dHVUHpcman
	 IdbNJocEV49WXZR232C3yyRwS96nfX3w9/Gs3JFHcEYCEZ/hDVIH8wWp4se8TBarG3
	 p10bNMWblN8oyjMs4Cfdd2bka5GaNz/0uKPp+BPnzfWBMcwIgMxwb/VFX+mOIAvyRV
	 JulODDS1nMZB5x0DT+8Mhwcj7/8AFnEt6eh7Eb5UOtXhrKveXhpKSd1nqGrSJL5s02
	 BW/+xsJRSjxMQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F00A417E0E04;
	Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A7228480030; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:27 +0200
Subject: [PATCH v11 04/36] phy: rockchip: usbdp: Fix devm_clk_bulk_get_all
 check
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-4-a149ac60f76c@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1653;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=1p3WFYm3nPwFyjx+ldeJOnj6dqBA+X1XeNTC11p7Zk4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8ERiZnFGRgy6HyEObV/nyJ1H5SjNSi8fE
 VmMs/zzQZAb34kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BEAAoJENju1/PI
 O/qaWLEP/jeqWskhjkjJdmKlWFh4k4sFTU/b6rHKM0Vd3xnNKemPgQhxkDYBrQ/Nel59w7T/Fxh
 /nFBzmr2G78CTxDM4Q9CTh9g1qCSA9TDEiq48Hl5dtKKHhM7Pgmtn8d6eXyrs+lx6IW87/ExgfN
 GMAUjwkjJstUtNjCb1mz4fl3aLDfeNgATIX622QW4qKrZWFPi+KBx6zMdg1PXY5iPw96yEhg+zz
 TLUr39J10iCotlE0Vu+XrlBjFfLihfSanyxnlSHxbHOBpSF5phPscnxtn4aKAldFG5lhUVYDJ6t
 zmIqTEs8llV55h4GAVPhp/oeq8ShL+0v7NytxosiGyNCWyrE5o/J3li6UKNtKgtbk6bqMevCZjr
 ZnExMzuARWn48nRMOpEh9mSZRGJdVyvwjBBNyQww2OJ+pbkZL2M5jJFh0ALCBvjgq8N7K4GYgdA
 YbaFK/n5dRecuGk6so+b6ZidIwJu6wD4DiGJgaQeYgyDhHQYkTQYyMmtEXfW2LtKdGWJrCeZgdp
 veiZEWCvVu7/gY6sEN/Plnt6o+BpsnyrS2y/XaKNsPuUn5dLvlY9Yg1PLEmV3kC5ZRgJuJaD5dE
 wx4lFtXj85xnvavQGYXKMe4oRIhixh/4ZyOMUgwIQwoVFWnfH/DcX75f7Ivds2/q3lSUNhz42VL
 GErpuMWfoXbmB8pjwLGordQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

If devm_clk_bulk_get_all() returns -EPROBE_DEFER, it is replaced with
-ENODEV, permanently failing the driver probe instead of allowing it to
defer. Avoid masking the error code to fix the issue.

This effectively drops returning -ENODEV in case no clocks are being
described in DT. This special case will now be handled by the follow-up
check searching for "refclk" and exit with -EINVAL.

None of this will be hit in practice, since the driver is only used by
RK3588 and RK3576 - on these platforms the DT is validated to contain
the clocks and the clock driver is force probed early. Thus there is
no need to backport this.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612164107.C7DB21F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 12dfdd470a78..2845a012eafc 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -427,8 +427,8 @@ static int rk_udphy_clk_init(struct rk_udphy *udphy, struct device *dev)
 	int i;
 
 	udphy->num_clks = devm_clk_bulk_get_all(dev, &udphy->clks);
-	if (udphy->num_clks < 1)
-		return -ENODEV;
+	if (udphy->num_clks < 0)
+		return udphy->num_clks;
 
 	/* used for configure phy reference clock frequency */
 	for (i = 0; i < udphy->num_clks; i++) {

-- 
2.53.0

