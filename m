Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4158B43FD15;
	Fri, 10 Jul 2026 16:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701997; cv=none; b=CRQx8bEjpqs0oEQeovBQ0lVP+dkEP8/4QAb6YqPPmj+7rxi0+zq+RTo7xDIBKYkDHHbTTfQYcQOFa+apr3U6eY9Vce++GXn8BLWcVhDjppelMjIRaX5U/9cvedlVGTfVnzfywaVg71LyrBgKWjaipKn/Isj657s/B/6Vvh8dZjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701997; c=relaxed/simple;
	bh=aRNyF5ZgT3ELVnwnJ04Ch6r5ROTXt3cZMDpGpyjmEhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u15aY1ksUSRX8rSCMX0x2jwUcczRWMoOfuEk1fxdG6eMMdhhas58A82mQnK1sQIuXY4aHuxuUBXbnWrBZHuWUxOLyO2piGhAZct6UBnYhnMcNFto7P0P+pqs7vLAffnlsPmqnqc/5nAWelWzG6TPaNUcnNk3w8GwevYpCbkaH6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lPP5WUUs; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lPP5WUUs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783701979;
	bh=aRNyF5ZgT3ELVnwnJ04Ch6r5ROTXt3cZMDpGpyjmEhI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lPP5WUUsrDHi7Klpe2908Nyd+VJXf0RbF+KlpqU8zkXvdY9evMHaiWxL8B4yqd7dF
	 oLfzMfdKTJ65udiGiiWi/WGAL4rH/NRz6ykLgTVI3EVuHJp3bZ13DEWWftiIoRNukx
	 gFKqY6zLbE7h5IaEbHFLCLGDrxIKVLIzP/RjHBBUG0qJhASG++2suRhl3DFtWnS06H
	 /z/ycoGUc72uhfbzVy7Kpi1ocViqEPS31Ulrke7xmg+mYL6EWbGuz34AP8I/7h/ViB
	 u+VvTSevsthlQHo0wTcCNt4n8j4wH9MwAcskJ+hHIc7Uho4amPnePWS8mCQmLvX6wD
	 eC0wkWDAZp5aA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 605FC17E14FF;
	Fri, 10 Jul 2026 18:46:19 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1CDD848007A; Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:45:13 +0200
Subject: [PATCH v12 35/36] phy: rockchip: usbdp: Re-init PHY on mux change
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-35-8b41a9a9bef0@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=aRNyF5ZgT3ELVnwnJ04Ch6r5ROTXt3cZMDpGpyjmEhI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdm/jOxfigNEXufnrbggr0FCIoTbmPCTU
 vEbjNG5z7TXxIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHZAAoJENju1/PI
 O/qayBIP/RUCLauo0/EL3CXXSla3CKn3WpH9RfXns1tcCIyfmUYM64m1a0dZWLDl3L6j5i6K6oj
 PAfi2bk5jWaCfCnlN3A03Lwwdy1Nq1VdOpV/htck3jM75IpOWpz6mLYbRjMzFSCJQpVepYKPy/b
 Zvq01Smrv2z8ZUnUrwH5LNmxFeHPjwkc/8W4PC0Y/fdg2bnaU8jmLv2FmY1xOwHIHPHZjviX89w
 PsfFAVYzoKjX1VYdmxeJzVmYK3nNNwlrnby6DG/ncHrhnQkKcaa53LGx1SP/sGmw7xmrv7jg0oE
 2eQS80BFU5STVVjBXP19kqdnaizyFjVXYe/DnrUm6l0H3mWBe4T7ndNqRsgVqCzF1PnLTqWHh4D
 F067ZaB3Fz2XgkYmrFmlCD15JY/HmHoozwsWAblZfCVXv1fbm1DXXxW2E71BCZAURGRkmVpH1xp
 +r0KMyQToZ0JXc1Uhnq/nQufGyNWPJOHioNU9k+737UAv8h8QUReoIBwpY3LrOiAN249A7wqEYh
 iA8O8f8IM42QDeVuGIduxb2vNsbbs70Q1tptx/9UKie7edWF6dRsN92hBuZ+tY0FXQZ21IsjZ8r
 tpLwBaa1Jg2F+dpAJVxOSloa2HfuINdjPSLykUNBHIAiIhRjVnQOt6k+R9+yWvlSMt5bOkdMACj
 WerrZe8bLqrq3cpeU8QI7Cw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Ensure that the right part of the PHY are powered up when the
mode changes. This ensures the PHY is re-initialized in the
following two scenarios, which are currently broken:

 - cable orientation changes without DP being involved
 - switching from DP-only into a mode with USB support

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index c5ad300620a6..ecf0ed0139f6 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1383,7 +1383,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 
 	rk_udphy_set_typec_state(udphy, state->mode);
 
-	return 0;
+	return rk_udphy_update_power_state(udphy);
 }
 
 static void rk_udphy_typec_mux_unregister(void *data)

-- 
2.53.0

