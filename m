Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497D537F320;
	Thu, 13 Aug 2026 20:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654314; cv=none; b=V4Z3itIumvhq/WEEgCfd5ArM7FgI1s/vTULToeSFzfvF1C6z+DqigeeKqyvQSnEtULwcv04KsQMPOyx8HM53TuW73OyGmCvXJZZOSixseCT/qXoHmRm+0lVLTZ8WjstAvuYTJ92xl4bWDyuZT9OnNIhmHTICosbnPs9nrQMB5D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654314; c=relaxed/simple;
	bh=4f7kNJiMFTnP9e9rkfZdI625/gkPYEgxMISSEZRPNeA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UZ19cheEW9xyUIPoD+2pty4DuP7cd6NeAVFpkhp3IHICiQBttZSbjzq2hTIq0zSQX2WEufzm8yZ6z3LHbbkKDhTGl4BTZjxLpgyGTKxygTBDa1nJub0WO8tqEZMJZlV/NeIWkCAkME/J45KnB+Byvy5CCYbMrG0VK4HSpYdv2ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HyRaaVQl; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HyRaaVQl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654310;
	bh=4f7kNJiMFTnP9e9rkfZdI625/gkPYEgxMISSEZRPNeA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HyRaaVQlB0C1M+VcM3jhKD1YB0OfPGJIRaqoxTBnaLwGq7hRIScAF/kJIIce8n1ey
	 TrMfpEukcNTH6oe8ZpwXg5zY4LupYaC+9pbOFkKaZnB7SXyWUBemWQeA1oXWWTEtHX
	 ZJljVnuAndTs5Cwn5UhjoDTqbg/YDw1pZK8nzDASEsHbD3uqj0rDKnDm6tswVG94ZP
	 nl1wsCagfxxOK86oPFskXhGkgcF9FKmeTe1A69p3+05VcuPck1d28gPCPUpV4hJoCZ
	 wD5EpMduL6TFA3Agh1GyEzZDvVcy9egh3SgapKuZ2hj/jnI9oMa/dY5xOjpGsfOHgy
	 FsLiQ6GvqtQRQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D6D2417E0EF0;
	Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 9645948002C; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:51:45 +0200
Subject: [PATCH v14 02/38] phy: rockchip: usbdp: Update mode_change after
 error handling
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-2-b5ad9c68fa11@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1858;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=4f7kNJiMFTnP9e9rkfZdI625/gkPYEgxMISSEZRPNeA=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmQtSHGGmamE4dLHmLB/fQ/lnZJgNUyrt
 Ji2TzxuB6+Tn4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5kAAoJENju1/PI
 O/qahuMQAIwNoeAEnEa6Fe33wG12W3T7Y4Gvwkz8PlvrlG1cNN2Xg6ibb5jFXQ37bgHtK9SJ7hC
 OPQszbNQHTQHQOyhIQluF7uqyYPqIz4w0drlurX8ttCcFXRgc+R+rTy88ZeaESdGFtUdOSdmwZt
 m5x9pxmgGk0xkPfViQcks/Ufu/bfgzexHFGG7q8VX0W+m4oUpvfxEcV1RsOBVBXoj6X4VffR1Hd
 OsA/jfztg6FiXhs2xQMVDG3y9EabZ60UxhVf3bAVXVpbGGKEzcpQREs5iMUTS/FodGDR4bf2uQF
 ZqFvk80MiEGrSkLhzGGvpyA9d7PJQfQ3xu0sF5bz4+YqpJeB03EmuQsBi9QzE8SRkL3vbVaJnb0
 YWDtN3WzZ1shhWZP3vzElpx7vne4efiiwi9c2nKXXP/J56uTm8vQ5YOJnPaAkbRtqty5A9ab5oC
 YqVqTv6eZQDRQpTYA7vfg8E8dj6hBEmwmnOf13kpUErsUJ/akbSwKmCGwtoI9Zsu+XGSRbKMg4c
 yNKrcWCxzLAwlHg/LZF7nBpvqvIkCGrWstcmPiImTeW2iX6mWhc9ah6lZT6G8o4g4oHSNVjHjbg
 yzNTB5OQoEPEY2sVXbGSukJzzhwsb54pIHOuNlJaz1HBNzw3vVZJ5HTBE5O3t7yuN/u1pbynUnH
 6BBzsCsjjpj/D5mIlE7ErsA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

If rk_udphy_init() or rk_udphy_setup() fails, the reinit will not be
tried again. Fix this by only updating the variable after all potential
errors have been handled.

Note, that no errors have been seen on real hardware and failures would
most likely be fatal and require at least a full reboot as the function
already asserts the PHY reset lines. So this is more of a theoretical
issue.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612163835.8D5471F000E9@smtp.kernel.org/
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index fba35510d88c..a5ffdf7a6e76 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1000,15 +1000,14 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 	}
 
 	if (udphy->status == UDPHY_MODE_NONE) {
-		udphy->mode_change = false;
 		ret = rk_udphy_setup(udphy);
 		if (ret)
 			return ret;
 
 		if (udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
-	} else if (udphy->mode_change) {
 		udphy->mode_change = false;
+	} else if (udphy->mode_change) {
 		udphy->status = UDPHY_MODE_NONE;
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
@@ -1017,6 +1016,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		ret = rk_udphy_setup(udphy);
 		if (ret)
 			return ret;
+		udphy->mode_change = false;
 	}
 
 	udphy->status |= mode;

-- 
2.53.0

