Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBED41DE16;
	Tue, 14 Jul 2026 19:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057174; cv=none; b=Q2/3fP8j1SYVf9r/pQp18AlARsla+dR/USthN0a398PhQEyOB7lYHEzpFq7FWaghCoRejaD041UgJF8wSeMWPo51+g4ShEx7cXt6I0eym43kE6R4JVtBga0Meqk+L29fruBMR1RBTw3JU4DclSK4CmcTTqSJoN3rESE6XE15qY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057174; c=relaxed/simple;
	bh=USg1ohYmbXwetA6mCilQyNqt0XA2ZTz/AW7yPMSqQVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qt3MoH2DdUb+5uNt6x5oE9P2I4K8MjUlO6ORRSXAIMgWKXolR59kpc/hPku+2mhKSiRo655Eb/X6zu11bK5tECFI8N1wCJViyDL1ZoiC0CnVcXz3PsLNOtMpJTxLn9VZPro1Dv4jTA1tWNYJYaLOLJq6/nb0pZHBdOGZTaxJdxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HzwUJpDT; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HzwUJpDT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057169;
	bh=USg1ohYmbXwetA6mCilQyNqt0XA2ZTz/AW7yPMSqQVI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HzwUJpDT9KDK+YWX2h+SHPBXV3sS3hoNoyyJy2O3r9rnG2JBlrwDL9H4akhgNCWTV
	 2xchICUu7nGdDNytNWflObxDfXCWK3W8XLFt8tdlFfgn0ztHNoj1dCB2hqvtbCVjlg
	 p5k2HJ1bupOc33oiZPu7qtvahPBg5KlUDpTU9oPuaaaUSzyiuqQiB+viWwXKR3ZZTP
	 MbaPlUtvcQvaLDina6FhrEy9hxDDz//iS+GnpkndRGZrKpzFlYfsR3Fxw/vqEeoboV
	 tawueXxrRqcQTJL/+jnrnDarthVnyGmussiAJlEYuWC4iMWxFNBU0ZOFeBTaWtcjpZ
	 NxxpCCx4xHUfQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 23EE417E0564;
	Tue, 14 Jul 2026 21:26:09 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id CE0FF48002C; Tue, 14 Jul 2026 21:26:08 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:03 +0200
Subject: [PATCH v13 02/35] phy: rockchip: usbdp: Update mode_change after
 error handling
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-2-6cb3e769d4c5@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1789;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=USg1ohYmbXwetA6mCilQyNqt0XA2ZTz/AW7yPMSqQVI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjU+neWuqE+Mn/txJAJWYD3hhSd4HvB2P3
 rIUPjpWhl0jR4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1PAAoJENju1/PI
 O/qapm4P/04rd0Vcd/kPEGL7U/7NWQdtMsJIX2SJwqwA79AGet3xiZhzvEfjBM3R6w5ZAZzbAkD
 +KVpZRW4eHTatYHLorgwyNv1pi9kcJo3OcVSxhXahn8BbX78eyREZ44c20LKgjt9LiWv+/Bj3MO
 5GVJyvTVHg7PjxWNCTazH1CGyFMkeNwDk9OuIxirq3YasXEP9TPxyeM95++Dpqz4k0m5cvai5aq
 JTBGqis0QW0qvLLGHOfdGQ1HLRwzvL8U0I5wBEcqgBHAIdscnYmeVN4ENV1qx0O6/CFTK/x1kFh
 e8PvS2T4VY6flWrpZId2Fol41BYrCbcmO/frZ/CmF8rPxsAnP2/WSI/nyuSbYXxBblmAqirjd/L
 aeinMkLl93mxbIrebmF5EO02SdsxIck/C25bmwIxmuTAs6MXRikB3gSfnHlohPrP0QMBNxqoRfc
 OEs4KF5HnNCwWOyuBR/tlxCjcnn7QESgfMUN8NljH3iUekIDL/hH/kXSrDj2lfb6a4s/4/tr0G2
 PKHH0ZHJp9IGWK622gbEdkn4JE9Oc0TIe7rXuRkyYQb/aYO/ed+hq565yzxC2XvFpn8JeG78+wK
 LDfnJRwFlDOwaI3ewtOzTXaZDm4OFdy9577rzPsp8lOxp7skG+6N2SQSnhaFdyWGprtcfrrNdyE
 ci1s0L9nLiAkDm4F/O1st5A==
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

