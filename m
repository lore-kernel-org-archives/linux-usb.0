Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B293CC7EC;
	Thu,  9 Jul 2026 19:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783623762; cv=none; b=fHeIekILUVZOBEkoqHf1ZN5OLgPJAmdo7hIpf+No0QKqC3mQ3xQ//x/DmBEaBN6o1ETUmlDEZK8DSa5zFbzk3HkaMFhutYTitBFE9QFEhlw1gCIfI/febWptgM4G9I7UZ8IH7Oy0YdvhYh2EdZXypphyL8DaH8v7fhp5u/DAVfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783623762; c=relaxed/simple;
	bh=aRNyF5ZgT3ELVnwnJ04Ch6r5ROTXt3cZMDpGpyjmEhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lwyoDzbZNeu7OvTMGSr+H3JtkQXt0UXCQe0fqFW8HfWsqVnoPbNPLyoSxlMTNeRSNx7weXSJpk/cyaSYqSAGXWM3WldvFnLkqdC+xWEPtr3zuRK2ixrBDvHB5iqtIT6UU5OxJDQc/BZNqgzpd1VQL3hk3io98NH72aeD+qDpMY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bsavkvfq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bsavkvfq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623751;
	bh=aRNyF5ZgT3ELVnwnJ04Ch6r5ROTXt3cZMDpGpyjmEhI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bsavkvfqfk7U+KmFxvK2iGha8gxgz26PL7F92PjiDdk1YOJ/pTm8Ky374d0710EYE
	 Be8ZXsGmIOepl11lPBvRv5eP67yVXd8OpTzfWUw0CSvjPrWlVUfMobP+sf7W8rh+/Y
	 60zaDzs4/DhP7qXrbiUCteEIEy0hKomm83qucVEQa6KYa3xIr0MZj6JouSfvKNMXbn
	 3OHojuzJIpBNNcPCEkg5fRt+Jr5uuy6/MVSgT8nxwY1gQq9OfQgjuQUu64B0NX5ZsT
	 +WAx2O7YW2DXGoMa9Aeevfs8lawrM1es9i+0OorycDLNJvTm9Tti+91OjrJkiSZ9Av
	 GruoRN/PnCmmw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2694117E35E9;
	Thu, 09 Jul 2026 21:02:31 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D72BD48007A; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:58 +0200
Subject: [PATCH v11 35/36] phy: rockchip: usbdp: Re-init PHY on mux change
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-35-a149ac60f76c@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=aRNyF5ZgT3ELVnwnJ04Ch6r5ROTXt3cZMDpGpyjmEhI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8EVQ/kYx8UKxwMtjY7KAcn1uKo8K/PD7o
 vpiP+OnsoaPjYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BFAAoJENju1/PI
 O/qaME0QAKi1HDuNxKKV3gbcu6nndZtaBC/N4LXKwSnyMl5LHWILuK2MtIc8HthmoltBeJKqN2G
 rmY/Ofz1XlhsoDB6jFhHB4SP72EM2qgENNXjDGoMkCaqeaXvt8pJKgbtrqtWOfd82FYC1oROcwR
 q69kfcJysefMtAu32dtX6nlKD8yJFMfzhhZt1QiVR1skA5tmKnm974zJF7puMe/zQZwur3LDEMV
 NLG5sa1VJ/xeWpItYaLPAYAkLVIMG0+IozrELKPNPTVCQ/uUpGqZNAVUNGWuHLQiWztPv96dttv
 5QIpPi0lwkoKBDBO3esJkaFJ4zo9fsn5Ek4PwjepBNcZZEXsgLizKX+BoMz6wnPtdzpQ7USyNsQ
 6ky/sxqClA9z7d/XoAhUoF1QZyaJM9s2pgoFgAoeaT9qkEDpluqQekTNVEBJsHCIfdgabeDO5f5
 5KLboVCoUkbwurtnYSbvsSnGWhU3/n2A4WgolvmiO02BB5RYAkICQ6PTmv+Kz/0VSio7hiwLlpg
 zjLTj5Koj7kQrz/2u3jXwH3Uonk9LnaBViD4R1XX94WBCo2Td9ZO/F3awz57W2ODN9J8CeHNDIX
 FLpZFsQ/unwwrQjAbaPcf93yklq89DOmQyGbuHgOsmQ5rJIJv0pl2zyjJZvpfzBX5EQlzPB3ReA
 zgLCtPRim0wjT54QAw4cpWA==
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

