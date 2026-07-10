Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9CD380FCA;
	Fri, 10 Jul 2026 20:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783716976; cv=none; b=bQHFDPPOLoTBOA11oHLX7AiVNAI+/AuXZx0AIjqAGLPQYbBPfEW/v2U4eAqdO6V0tHIl+iQELZGKDnjG/VYzPYS1+qGJNtEsvhOlEzSzaHsjozFz2htLDPtR71CV8ugGGVLaoL0UBH9YuYowSNh5Xj3jpYQAjCrxtDSff229xfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783716976; c=relaxed/simple;
	bh=R+wp4a0ifl4hTuF+Ym4MsLuNqY2BgKTHqs8rQ855wZ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T5SRBpIclqZBgFDd8nKv49CGmoH5BvT2FeNLEFDxmsJfYxbYh6tDGtyKcRgmCSY9YQj9nhGixcx19KkL8Y9DIXc4iHYq7eONC6vTXvHDOXyx96xmsHXOBS+IlNfetQTGoAJ7Sp1dNSNNmJnqfDeWK1vaXbelKX+2EsmAeWQnMCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ny72CjBP; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ny72CjBP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783716973;
	bh=R+wp4a0ifl4hTuF+Ym4MsLuNqY2BgKTHqs8rQ855wZ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ny72CjBPYcRTtmlou1+fD1TZcorojOwrchzX+zsmju+nhugiLq0pdaYpLljkIGI5y
	 hb4rKjTdmOuNZL5xbyRemMu/XbspZ2DzTdC+/xDOHovTW62Ezz9nIj7rKU/7pJliE8
	 6xAjbhkBHWVLNBiln/gxtoPHT6Gy+iSzgJc1p2c6pHlvUGZSfZ8z/v7s2j8ZwLGo46
	 b5rWcqIH7lRxlwDNB3KWi2bjKNQkJIcsEfPmlvAUogEBjL3Zdx8NkCgaCvKmwusiLV
	 A1Qj3+9UEeuMuBRQwxEOa6ApyOrPMSe/tCOJ1o6EYjhZGqZofFFfEqxg4l8xXMUhF2
	 kNzoUgiPElU8Q==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1686617E0DFB;
	Fri, 10 Jul 2026 22:56:13 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0B9C248006A; Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:45:02 +0200
Subject: [PATCH v12 24/36] phy: rockchip: usbdp: Hold mutex in DP PHY
 configure
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-24-8b41a9a9bef0@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=R+wp4a0ifl4hTuF+Ym4MsLuNqY2BgKTHqs8rQ855wZ8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdkvM1gAQlyG0OQ/+IK6e+bAvk4s+rLAK
 VW7delPxK8/PYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHZAAoJENju1/PI
 O/qabdgQAJ5iVr0WdAHe5FN+i15BY9kbFVkSQXcJfEpEBRn2BJ+C00B0kpYOtRmcm3gznO8KG9W
 ChQ33Jdoo6kaB799bveJscbAWou9rLooGK8tFtynmuC+izefB9n/1XBAmZKxRMyMcskpCCRymQ/
 ILvxdEezczDo3kp2cTk1juYyd+UUhVitoIiwReBdgJ0NomUI6BolW2xlqXI85WV68bUMjWvuS+P
 17bDbgPn+OU89+aYBZ1XYxMYnyq8kschZemdG/EQP+NhMQS8uOZgNwLB39Yj+TfgoRlMnyLoPFG
 WYRUjMfgNn4hsdwUpu8gAWt+p/vMijV87Q9jIB9l6bQlLizjl5DlZ9ercDoaVRZGd6MsXBlBsig
 SxEpHbVr2xdbBBjqknSy7zvkS0lOXXyxccXmWsk+8m3RVKSEm0iRY+PVZ2CPM5Nta3GKMY5liPG
 0xwOdz89nE7rN7YnWB9SxEyYwDB64uep8V4ajRAJIMi7bgDIxS0STlFGvyDbaqD6D+MSXLpovqr
 6WSoCHQiESgb2Yea6fOrwWLbi4sT1JdIuo2XwMx74g7yxPrH43/D3fQQF847F/FV0HTqIrBf5nM
 sh/WEMo5HB+dpuuGV/f1loUnoHaJkORIsW4Yg5+doJQ5nnp2ARuShz9G/Ufmq8otNH1UPR2ZbI9
 u0+nLDMtTsZ5P9/2cC2En1Q==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

rk_udphy_dp_phy_configure() accesses some variables from the struct
rk_udphy, which are updated independently from the USB-C framework.

The USB-C mux/orientation switch functions already hold a mutex to
ensure mutual exclusive access to the struct rk_udphy states, so
simply hold the same one in the DP PHY configuration function.

Reproducing problems due to this on real hardware would be really hard,
but could be possible when quickly re-connecting the USB-C connector.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612164627.23D391F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index a742bde7155b..cd79c5da566a 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1154,6 +1154,8 @@ static int rk_udphy_dp_phy_configure(struct phy *phy,
 	u32 i, val, lane;
 	int ret;
 
+	guard(mutex)(&udphy->mutex);
+
 	if (dp->set_rate) {
 		ret = rk_udphy_dp_phy_verify_link_rate(udphy, dp);
 		if (ret)

-- 
2.53.0

