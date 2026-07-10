Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F60443F8A5;
	Fri, 10 Jul 2026 16:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701994; cv=none; b=FKURkZD8afSTdfVZAioJWPZMOangiC3Lyx29Osajn1/HNtp+smjbc1V9CJT3hb03yRANSTon1gmeYnIGG0JNtBEsbk1gTmYg7PWuO6JJ8tNKGdCW7JolWohjsnhIHUEwP/sBj/sWqp/qeuaznpGW06Vfsh1RyHFxmNqlk57d1LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701994; c=relaxed/simple;
	bh=AyMiIrxEFIKqV6uGqRNRCgp/f+R94tkSUd/pjFfr5TQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UMk6bUgjCf/xnaEmeY7W+tkB8l0Vq9Pqcep2+/xGbbNyxclyPLSFLpBKfXmrB7w/LYNT2S4tfWjOyhJnGXJD6IAnOVqNBIFon7sMYenwML0xqikH9k9ts8sOZGLJ02trBej1D0LJukG7YhHbRTVM8fDaw7+7UC/QlFwuIss5asw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FVeYvp4m; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FVeYvp4m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783701979;
	bh=AyMiIrxEFIKqV6uGqRNRCgp/f+R94tkSUd/pjFfr5TQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FVeYvp4mSttn/+cKWxhiVz4y4blrtWOPo2PQj7fdyo3pn99XSW4KgSUCCoWm3RZaH
	 e8b2itb2JiV68snxsBK1xn69shanej1kBdjOG/jj/PQ5MRW0MUQBfuPtn81NlnwpK1
	 NzTwUxBAuiWyTMISG6xPP24v55nB1Zt8xG76LP0dA+M33ea2WGols7ESLfRm/669jq
	 oP0oovHzTDULDB+utLksahZVP5vJeNZ3OslB93J7nJANBIMt5yChHagmVGkwgMyi/L
	 x32hCWWjl8DU8cdQ4HHf64//aUu8vbYCtibWGFBIGJkauCzxi9eOoA7LqkP3+78S1D
	 NkoVjVhZAWA5A==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DD28A17E1029;
	Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 03F20480065; Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:44:57 +0200
Subject: [PATCH v12 19/36] phy: rockchip: usbdp: Re-init the PHY on
 orientation change
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-19-8b41a9a9bef0@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=AyMiIrxEFIKqV6uGqRNRCgp/f+R94tkSUd/pjFfr5TQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdl5E/2+HsfxUs8gVifOtyqoAttpuxuf8
 4BVWaMgK3HvZYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHZAAoJENju1/PI
 O/qaB1oQAJuUsSxPkU55OfA++kz6x6xLvdVT62xmQ8rDSE2Ax4qtmGPK056QX8ui6VO2hXOqeL8
 hNZNDB8W8kEnb8naLI/89yV3Wb0yo2EbdAhoJzVPAnUhAtH/IV0vm3Tsjgb7WSqjlNvcqUvggva
 xX6DHPI8zgvlwPSVN9LCxvOuYl4KTuDtIHSq0vba3AIo0XlvZ/y94qkvDNdMzfG3bpuxJJQ6tPs
 ELSKXXozTJPCITfHpatpSGlvS3edlXrH1XvPJV4aiUWgWtqHyOTMOnbVkZQlZjtGEND+mpqbwvq
 lRSdnuMYmRLBz9ju34Q8+ejreqn+lRqKdxMv/NZhP/uAm1Jnr5xYZLJeHkj/P4TBKY8xMYZbOMl
 Rcgj9ynsmqg0+3hZW835wI3gFHLNuwoiYauFY3BYlPiRcHCsHMgYeJUrVCye/BSqXWdSkO28b8c
 xzNDsF9Q6pZtFfkCfdyE/0zo7NCpV3IT9USlRyAEKNIiLv4HY2/URpADTh9U229NnoOf8ztoV8Z
 7adhB2kNAl7SglgdIl7jNTDZ8CZhFqpw8XU8Y3HntYmSohmbIlmcXjrp53wbCLZJzZM9VXmkSQo
 mKWVqAzGGyNKCjAvut/6Hu/KVamQOvj0h9HEC+uv+Ih0eHrOPCuPz4xUcBzANEcw8pgjFe1SXfd
 yGva2urnYIwTnw/VGns4tZA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Changing the cable orientation reconfigures the lane muxing, which
requires re-initializing the PHY. Without this DP functionality
breaks, if the cable is re-plugged with swapped orientation.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index e44d19c9d119..4b454798c4ed 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -620,6 +620,7 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 				 enum typec_orientation orien)
 {
 	struct rk_udphy *udphy = typec_switch_get_drvdata(sw);
+	bool flipped = orien == TYPEC_ORIENTATION_REVERSE;
 
 	mutex_lock(&udphy->mutex);
 
@@ -631,7 +632,10 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 		goto unlock_ret;
 	}
 
-	udphy->flip = orien == TYPEC_ORIENTATION_REVERSE;
+	if (udphy->flip != flipped)
+		udphy->phy_needs_reinit = true;
+
+	udphy->flip = flipped;
 	rk_udphy_set_typec_default_mapping(udphy);
 	rk_udphy_usb_bvalid_enable(udphy, true);
 

-- 
2.53.0

