Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CEB449990;
	Thu,  9 Jul 2026 19:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783623753; cv=none; b=hmkQM3IQjR0WUeQ4KpMooi57t9EDKOPC15ou26/RJmh8tpHZWBbuACGsiVPgWV6oS0gcCsUYNUYY0mLjp65dSZ8tuda7r17TjzsuGVD34nbNQtkP214DhAZgOrS6cOxVME+mTyg3SB8DnAdONd/GRzg80BqWR63AFVpk7K+Acac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783623753; c=relaxed/simple;
	bh=ou2OeHe9NiTPGYgMcRzTUBwKmURTgL5/azZ1wBtlGvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FH2mMVYdsdxz9pqH8yZjOhBQgOWknDfJzfgju57uQzH9iodbkbw4FOKDBt99wW0AuSn01UwD2P2C1+AvrGB/OmH7GbolG6dp3I0Btusxyki5c47oKc6QCNgH2pzLmhh/cChDVz3nD9SCcYawjNxeQah/A2t8Z/EtBceUoXhHvqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GTHauvKn; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GTHauvKn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623750;
	bh=ou2OeHe9NiTPGYgMcRzTUBwKmURTgL5/azZ1wBtlGvM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GTHauvKnzd7SFlDljFZd6gtM4inFUMIkL28Lr/Lw7wDnGFrhtbvsurc8DiRUJxfG1
	 PJESMGmm1tsD7L6p90QcuSOnWql1p30gOW2gbz+j48dKUpYcO1ksAkdRLdRTMmGGnx
	 8ge439FgbGh6RNxl7uDcE3HrH7tifUhIzuKvL4Ra4qKi7lyo9Nk8OYg5Rd12NC0b5b
	 0djR2RG91azIfTOGTU8qNc/K4JFgAvDwX5ymvK750+WBTDsXoJ8//V/mCV54akwOXz
	 gPBXGn4GLNgT3kANBB8L0I7kDo/PXcqNTXoOeUiuKISNMV8K8XJPlfg2vUIa/4PI+b
	 Eggm7kcoH2drQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EEE6317E0DFB;
	Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A599648002F; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:26 +0200
Subject: [PATCH v11 03/36] phy: rockchip: usbdp: Do not lose USB3 PHY
 status
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-3-a149ac60f76c@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1409;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ou2OeHe9NiTPGYgMcRzTUBwKmURTgL5/azZ1wBtlGvM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8EQjsudxf4/WOIhhtLCpFVjF17WZM+Z1q
 Q8l8C0bfqVZZ4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BEAAoJENju1/PI
 O/qajRcQAIMA8PmiKyo2R+Km3wV0GQoLW+qUv5C5Ck5lBoBAs0bYjvBRaQhCp5k+gROZsELvW6z
 9VBJeYkoqCnmR7SRSz7T6P5Y9rb35HpUZQgS7NKEa1BtM2J9z9Srb4wKuq4Cb4+ebeTGHuxfZ5o
 V/zRX1UBS+CsU065B+wLJNVNl8Mqknx5R6HjEEmugID1tH+6ZP9t/G6Mn6SQ2TNjt4PYEfCpZQy
 /U+Xi5NdofRyJ987zyc5UTzruaNKWNEWCGIGcWMgoQ3gsatLkc3xKUc2DpVH6PexwTyPv7yoKL9
 5l0K9G7VvqVxflZV22IzO0NIXaWQc9YQXDcf+sqrSIEQ1qYAUJ7XyrpAgWqeeh8VqbHh1KuOJNv
 vDSN7G6tyDuw8sBAVomexoZNaw8EYUrw7Udl/vNj4vLvpO45tg+IoDeAyb8vdYpvGkdtpmrkgpL
 ia7uchn56SkbvYFDsHtEdNoU2360UE79S1eZfyTYN8zpxvv2rzj5Aso+nx1uz0b/h4LBq2awn45
 43ae+t+Cyygn5cqSGCDfbUDM5HxeNm/5cRZzie9uSGleRLLZzF5dDPhna2NtYrAK2e4zZxltF4j
 hPTyPXbpy1xYOqwzrpktp0p4HgIpLsvKVQTwG5mwO6C5j8hOVcmtOLRBHRfm5HdZRx9UZ7+nEsg
 tPG5iFxjETqALmgXwFBUw7g==
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

