Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0979941F348;
	Tue, 14 Jul 2026 19:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057178; cv=none; b=o5vkc0F44oFzepfyt8D2HOCBWfRo5ZKA6vfOf0hE7GgA0p+w8qllZSHW9gna29iDjWE4rWkopm0n64Pge7vfg9lppby7hCreQhFLKE1ItgUeA5w1oKcQK82I3lhX0Gmycc1ERq2kcYlMtEocsq68CAgL16eoN34U3lPT28ekvPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057178; c=relaxed/simple;
	bh=gjt94yB7OMQ1kbenpTWsg4rbaygeNwSXNZrsMwALuYQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UBFFIsto2Rqbeg078HU+1r2cY8Q/ta5E+YgKTNk0pKcNv8dpOxst0v/PF66pzRUk4NLQOAVkw6jVWFTcWhN1MhbT+cWu5Bz8rAtCphLvfihl2NnYuy9I0t/aLDC+WsTFB75dd6TzzpT9QKFF2aiEn3gQSR0fAGmwe7cpWHNaGKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dwf7wU6w; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dwf7wU6w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057169;
	bh=gjt94yB7OMQ1kbenpTWsg4rbaygeNwSXNZrsMwALuYQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dwf7wU6wkFtTW/7THwJKgIn3/mERVq6oFIzJx10NIAedzlPPpIIzRVBRMSUNyAZnq
	 oWEfSZq7CFFmFGvNtNPcN6QXQGa9EoPqK+urGXzCKqA+rhVaRzPc6fiQPhIeEXjpWR
	 Lm+/3RhcKy0X6AO76O7sF+syTotHe8hSADynzDx7Gh1JOhmApqwlKWIRMatIBOU1E1
	 MqtN4HaHaOaWohNMqzbZRg/T0iycK8GZbOXO27InSvs75V7CKiWHy5ZFAwN+AjgDxu
	 amUxmwK375rmFVqiKF6Mdeh/ZSKzIg43Pz4s0fBegiiXk3TSPl/Rt5ce1hbDb8F1YB
	 Zkmbycl42IgiQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 71B0217E0E1C;
	Tue, 14 Jul 2026 21:26:09 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D35E8480031; Tue, 14 Jul 2026 21:26:08 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:06 +0200
Subject: [PATCH v13 05/35] phy: rockchip: usbdp: Handle missing clock-names
 DT property gracefully
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-5-6cb3e769d4c5@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1302;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=gjt94yB7OMQ1kbenpTWsg4rbaygeNwSXNZrsMwALuYQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjU/u/AyRvnUJ6L95kGIeqmze3AG8Bi7tq
 2Ggju18IsJKvIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1PAAoJENju1/PI
 O/qajJYP/A3swIfH4ymtLnJi2wi3nntQ9R4ujq1maU3ut2SGZn3Ekmn5qpkzE8Xyr7GOgV7BPUI
 VqIUCTwDLkWCtpHZSWTqxXLhTrmCe14JXf+hJaf4nSfXlESSXE1hXVqy9Z9xeS/wA+D/cqPlNW+
 J9swfnLuH7TuJZtCUheoI0MEHE11h9sRV+IBHTNwncv7xODf89kD92YFAY7yvLXYAPG0Sgk8clD
 /NpMubS/LOFCtTdsiGKcHISXH+OdKsoTZBIV6M0INdNyIzsY02EWq1gFJjW7cNR3lEZSClJYpoz
 8a07gOp8LhqLbCf4oBGqFNWz0jzt2x49X/hA2vrk9d0D8MLBH6P5PNMYYRgEWdxXhqelpeCbFp0
 pcUGFn+ErkHQf7H1Z+oMFifwbgjDIe2K+cgnYLK1xMBVw0DWWA9vLNjaFoPzS1Nk6X7YGSznVDa
 ZaLWuOzqn40/YZTvhDYTYgoW9cgZ6dV0waHa+azjWVAMkHazAKaU+n3HIr7SrF4SCrPZAUcUZRS
 v+hewhL1a+LJSlOxq17GJ3zMpuAQzY/vCEg99+ykpkw1XuMa/QTHVkoOZWrGnufsi/0Z1aaW4Xy
 XVTjlcqClW8RrHWyWI6PPjxy8FxLxiORzkl2jybtpyU1PULwS5AnxZHuFuCACc9k0hxFoSEHLCx
 3CLdUTey5n77QMXwFrcIofQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The rk_udphy_clk_init() function would currently try to do a strncmp for
a NULL pointer, if DT specifies 'clocks' property, but no 'clock-names'
property. Fix this by making sure the clock has an id string set.

Note that DT binding requires setting clock-names, so this is only a
problem when booting a non-compliant device tree.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260619154349.071321F000E9%40smtp.kernel.org
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 2845a012eafc..3fc8222fcaec 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -432,6 +432,9 @@ static int rk_udphy_clk_init(struct rk_udphy *udphy, struct device *dev)
 
 	/* used for configure phy reference clock frequency */
 	for (i = 0; i < udphy->num_clks; i++) {
+		if (!udphy->clks[i].id)
+			continue;
+
 		if (!strncmp(udphy->clks[i].id, "refclk", 6)) {
 			udphy->refclk = udphy->clks[i].clk;
 			break;

-- 
2.53.0

