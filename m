Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AC041F349;
	Tue, 14 Jul 2026 19:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057178; cv=none; b=ZjvlmVK10OGBZge5g13g9g6sxFzto7ra/z0wMgDOlaMUEryf6Ajb9/hnsdIlxBkoYZR9IYrdUORWZPODzN8zhQqGWhhQ9f2+Z2rIvcOqv/qdsYNSj5HHv+jkcuvqNZUP3Hg6WSPKIhb9IbO0surMCbDbEA9ERZbTb/dt5oDkBt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057178; c=relaxed/simple;
	bh=t8uTKCJDQbXM1zD6YGkoRMmsGqKnvfqXTlOk0PQD5EM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MjNT9YGNwOXafrLd6aIPkCtrUW2mvmwh4Y3C/lhOKYRAP/Y3gp21l/T1jVE9tJ9Q9OW4Y7YnzVjZ873r9Mhg9TVhSC/vepzh7gL1JHAWGbp81oanOkEiJm8rz9hsTt1jH5ZaRPqYqPbc48KEEQsnygcmupZXV7ndS8D5dzJAFOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lmfHL9TD; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lmfHL9TD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057169;
	bh=t8uTKCJDQbXM1zD6YGkoRMmsGqKnvfqXTlOk0PQD5EM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lmfHL9TDe2ya6OYv0WXYWqaeCXvtqHk5kX2IttFQD9tvLrufQ4zyijyNCy52a2nDT
	 uH05wNSxMX/MRYIzGOHD84mPPnz2tdM2XFgeNP8TBsxs1VO+3WxlTwcnBBEtGarr9B
	 e5RB+9wGF93IHvIiovoHMsIAdyS6UsqnEMOTwOj321GrhcC1tfWuzlamb8sc+dX3mJ
	 N3G/fYV2fLOB6Xrgh6xVz7P/X1Sn7QorshfJP2Wz2HaeJrxO4rTMwIqMCzPREx80qr
	 qDVarSrlzNdzpJYfT/xTi2pSMxZkm9+E0boyBYtcwP3Sh0CaBF5bGu4Jc1xo+c+U4+
	 oZCLkUtOgQG1A==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7B57317E0E95;
	Tue, 14 Jul 2026 21:26:09 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D6BA7480038; Tue, 14 Jul 2026 21:26:08 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:08 +0200
Subject: [PATCH v13 07/35] phy: rockchip: usbdp: Keep clocks running on PHY
 re-init
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-7-6cb3e769d4c5@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=t8uTKCJDQbXM1zD6YGkoRMmsGqKnvfqXTlOk0PQD5EM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjU9t/eKOfGMpPkDJwLcJdJ6ye07owdAfl
 aIaLEWAzTKQXYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1PAAoJENju1/PI
 O/qardQQAJrFiIYoJse19+fZUHZhl9JCCRgI/43WJsiTCWzDTFDLnw65e13IEGsEpWTEqLqNgQp
 tvlE6J8qWM3HNjGnhkuehdgo08fLiCJNPpsAo5K+GFfUyJAIuIENrbc1j1cO/9le7uZApnOUs7X
 SQbUEtnyIGk6BEajdHmqi5uVGphOJPiSgHj+UHxGDePXLK6ri1e3gAO8V2kWM06PDQXxz0jIJJs
 zbZwZXpLoQwz08fVNB5XQlronDGK+mdkKkCVYYWZieM/L67GCfg7bq7eByO6srmqunwmHOZFAB5
 EJL5cSFzuB9dODpf0sRD80aRfeb+q+dycIUJwruTpYoNqmhZ+3XODw/E/7m/w23GRqZeNOhESoH
 IqeNSmvH7zS8yjGAh2aEApGsb5hDrf2rkLsN3OYMzv9XEPy72megsq0hjAYKbS1RFlFbvJDTeyT
 /kQ+IHrPYpvsrKCBLeiSqElh13taiCF9vqy9frBDo7XYmjeMo/JjFV0a49XvbNjcw56E9rdbfw7
 3K9zdmj7E2DR1eeoswy9FqrFue7xKKf0dlnlNRxyEOL3v+DsAtPbVtQkAHtQOhvq9UuzmjpNL/t
 Ffmfi0PlAAZcbGtr+D1y1SISzN4n0Ln/R8N4PINLi23kTaAHcov0jMQukwlUvEJEjlJGCmC3TcU
 Mj6AxVrhzpbb3IsYbcfw20w==
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
index 6cb9f6b4dbf6..e3f5a26c876a 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -987,8 +987,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
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

