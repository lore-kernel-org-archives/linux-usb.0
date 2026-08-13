Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0145A431482;
	Thu, 13 Aug 2026 20:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654314; cv=none; b=Z8AV2VQ9yrk2Ponq4ybD0e9yEaqxYFw1+nqOUvoETQdfkZ3JI/K7KxTDkLsijKA0xfuE2OXstbNCYBPx9vnk+oegP8ld62jXXGYIdyQN9moKV8gzgkearmCAHj2gh3NEOgkhOFjRmiB/n+mQEFtR574pdJVxjZax5jOJOoGy4TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654314; c=relaxed/simple;
	bh=mUcbOwAR6yXSrFE55prrZ2ir3KShnytA84FyYDFCZhk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FM9nyshNrRQhIVQjRrrFaD4dP76+0aj26fc3q8kcoZ5d/Kmxgxj76oEl/het7KHuAJs+WL9XxJ7+jVvhsyvZe/z2ekaoYnVSbV975plGJl54ho8nv3V8TNtxyQG0fL7huaz/yoIHabdswH5ASFpAxextBWYbcEpZg6xVxzCchOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gg9okzcE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gg9okzcE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654310;
	bh=mUcbOwAR6yXSrFE55prrZ2ir3KShnytA84FyYDFCZhk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gg9okzcEksFatFkfO3cGn/2T2oyTK46Q1Jg+sGkILDYO4EO15goK6A4H++ou2LqsH
	 LgPEMV61Eyh3pMG6mWtkju+YBHE2Fhf3RXOX8/ygOCWHunyKAtrQrB75VdU8TUN8E2
	 qt47OF1JJSG4aDCQi/pPyRfHaavEEsm12Aqs9q7qDo+vO2/6rBspMyWHAvV49r1BxD
	 bKZT6ZTI5HrFoihRymC712nDaV08e3mZqqi6avbMwbh8l4E7GBRY+iGF7mFImpRbpJ
	 13CasERfHHgEZ2ken3usnKihoA+5bxxMLSwH//KDJnq2eVOmAIqjXpcoVQqOhKJ8G5
	 TwpaYGg33M3vw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D809B17E0F83;
	Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 97EB348002F; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:51:46 +0200
Subject: [PATCH v14 03/38] phy: rockchip: usbdp: Do not lose USB3 PHY
 status
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-3-b5ad9c68fa11@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1478;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=mUcbOwAR6yXSrFE55prrZ2ir3KShnytA84FyYDFCZhk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmT8KOoaa/liNprPu7f2o0xwgpJU0pvNR
 PtRQCMmCXAqZ4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5kAAoJENju1/PI
 O/qaUeUP/3JuF0jplmRx0UHZjcG5wySSi3qRfp/FxI2lyqSWFn+IOkks6ArSsEkiDUrEyTK7Ld8
 ctmb1jiP6sN9JxTxm6V5yZnRWUB7uY7tOpFMGdAo6PC9AFuXA/Hg7TIat/oELrnV67epRalizcT
 UyVpsHzlX+FmQzCVB1NexzWAH53E/9OSne+B23TyRU64Yhd3w/q81dut817aPnVQ6S8uwD6fkLx
 y1K/h20Ry8VlpBFOUUG38kNwVmCm5Gqx05iD93euKxd8bIzn15nacUQdyoHeH5A0J0gzqh6zxpK
 oj6aiOgbM1d6Hp8XP2whDKNCfLoLFjFUir+yDx+FyHYIgSYMIyf7oleZTRNKiU42klLIIUtkRLn
 fzO7L5OgUvnUjrc05ZFl59dHvj4xrudsIA6vi9KPsVL0AWNIvRpUqRbVJ3/S97bvFih5ESgjRzi
 +KtBF1XIJsIHR2/7X7vVb3zeu4tQkvGpDEdw0oP0kg35MlJsPBpR0vUOotbL0bT6v/HlMNwebPM
 VoCm2W2ML2f5gKu3svYfVC6h9fd/HZgbJpamrlfrIYMuoVcepVmijFdRx48jbdMoCLCbfeaW+ij
 HEv/sf/PrJjiJaULJGJY5jX3N+r2ROLwuJpLZNEck16AhgdsU4vTk3dIIx+hAOOcvfheFHGhNPS
 CQsdBKOErBrUHj3/l73MqKw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

By default (i.e. without manually enabling runtime PM) DWC3 requests the
USB3 PHY once and keeps it enabled all the time. When DisplayPort is
being requested later on, a mode change is needed. This re-initializes
the PHY. During re-initialization the status variable has incorrectly
been cleared, which means the tracking information for USB3 is lost.

This is not an immediate problem, since the DP side keeps the PHY
enabled. But once DP is toggled off, the whole PHY will be disabled.
This is a problem, because the USB side still needs it powered.

Fix things by not clearing the status flags.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index a5ffdf7a6e76..12dfdd470a78 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1008,7 +1008,6 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->mode_change = false;
 	} else if (udphy->mode_change) {
-		udphy->status = UDPHY_MODE_NONE;
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 

-- 
2.53.0

