Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9732426410;
	Wed,  1 Jul 2026 23:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782948959; cv=none; b=gat22kX1b33phLg5NAAZ0xVpw3oCD63HSDNcDdV7j/JhDr+RYv1yGTY7O3kQ5S5AWKA4JvRVHlPSTfnQMzexbem9NnLNrj9oHyb2oZFbJupXjBUMqyraHVqRPv46xBoZDp9jzKXdj5mY7brmI7CGLkJcJErWynjoRQHdZzq9g+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782948959; c=relaxed/simple;
	bh=E3PH5dcID2nJKs/noMUpOfcvSjayh2aTBogbpSH7EdQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vDXNMxAmHp18+kZrPXPxnW8Ga2uQUIUFH3lbyLQcEwPIOMltM9iCFAB3iMrmLYG+PJgCU+8wWoQBeHCdqLnHWpNjT2GSxH/L2O70mMazZadoL6JZISxwUbhH81ttaQPaYo71xDZYPh6sdc1IdbYLMJgIpcVUsJ1rTBnT+VYvJe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=V2AjyEZV; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="V2AjyEZV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948950;
	bh=E3PH5dcID2nJKs/noMUpOfcvSjayh2aTBogbpSH7EdQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=V2AjyEZVDnJ6h3Zvk3vHGoUyNfrlmRc1MXasRG6Cs9Ntl8QWDx+pR/j32kP8KxHLW
	 hSlQngtj3D5B89HX3QsH2ijih8CfY2FeU4oT1czb6qZonFS+Hps3R540o9XZnJxYjE
	 1SNetTnDkiuxCd1QNmugORMY83pC6EkWvKY4OqpHz8Iyn4xjw4knVmb4TEULhfT0Yt
	 H4qAzLphgIPykrBDuh2wMwFzxW5IjGg/qKoXdbpMjULDsvm+W+z/a2NjhPEATv0u4c
	 +pzT6LSxVQ+RNv/G1FgNYN3E57sbYQwOty5Wc8Fj2vpjZkJpuVmkydID/iIj+30O1S
	 UZ/62Ym2t2Cpw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DABA917E35DB;
	Thu,  2 Jul 2026 01:35:49 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D01CC48006A; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:36:02 +0200
Subject: [PATCH v9 24/38] phy: rockchip: usbdp: Clear USB status on PHY
 exit
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-24-e31efbb62d2e@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1231;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=E3PH5dcID2nJKs/noMUpOfcvSjayh2aTBogbpSH7EdQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFSZIwQ43TvL9dF8Txf69gahcpyg9sB6Y
 X2mrUXuV7Jr7YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRUAAoJENju1/PI
 O/qa4VAP/jCC02OyX+P8a2s+rWg32sVH2MuJZVRNL+4sMRhoYBCwtR2StQQjPQzAWD0cCVUbVAf
 02OuVf4TUk5CTQDY2OCktbHd87GpxvPQ1o9wNtcxy/nEpg8j5qqv29q55168WYr9pECF+XMM1i0
 2wI9K0fPoQQ5ymnmzuwBCqV6PSOJ3yrEqHuSBxTHgYYmZ5ZFEwHtJhtFXUey7KimOvuBXfMfIsL
 jmIEn9r84xPCb7b7gYKx7uSSlJbhPxJ/7bjfH4j0OvQAafVgdrDRkyNqQ1aaphePPnAoHmGACgj
 ba952xNcGDqdyPddPIOIf9VrcbBu9ugFaPysgyLdVt0oPlOXvrmnGBkbd8vWqX+4oR6a6rMMSk1
 y28XSaT2c8NDxf2ggOMR2jXnmDCEpCyQPDL8kksK3r8BAmfcqeO8YuYoY7+5n5ogU7D5PgbenIz
 GexrRSm0r9X5IpZpEtEkHqkofJQbrlNorBHZDH3i5ZqiT5ycqyZwCXPlJVMAEbQWNq7aJag4WqS
 SLZjZWZL/LTsIReqtund48cQ2fgIEYMC+0oMCHVJ9UoifKQh/yasmeoEeGwcqub7XHnOQfgGzbM
 WGmba+yqYd25Gr+vcUj0/L6sX0nBxj/ptFMh9HnfVu0e+HYR8hHGBkGh2ztauXDvE5xkE22fp8L
 FEg59G0POV/H2gSZVopIxNw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Ensure the USB status flag is cleared when the USB3 PHY is
exited while the system is in DP-only mode. This can happen
if the USB3 controller device is unbound while a DP-only
adapter is plugged into the USB-C port.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260625-rockchip-usbdp-cleanup-v7-24-38eb3cf654fd%40collabora.com
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index bf6e7edbe631..1a983c1cef4b 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1309,8 +1309,10 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
 	guard(mutex)(&udphy->mutex);
 
 	/* DP only or high-speed */
-	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
+	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
+		udphy->status &= ~UDPHY_MODE_USB;
 		return 0;
+	}
 
 	rk_udphy_power_off(udphy, UDPHY_MODE_USB);
 

-- 
2.53.0

