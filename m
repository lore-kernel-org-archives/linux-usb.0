Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CCF44C640;
	Tue, 14 Jul 2026 19:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057729; cv=none; b=ApYtOs3VrXUDw3256B2mudo6ryAVKjpLzzO+BZAKbhEpcl56ZM0S7q6YjPZnCKanvSw4J6WxGPGbnQiTBgVcL4WLksXIvFI3Vq+cgK2CvtRzaRtXMO44PQDguuzpqTJoZVER+e4asHd6ecwXtk1b5DONr1PYzsd6vwGO9bXN6W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057729; c=relaxed/simple;
	bh=Z+3CyQE2pXbXffrbEZ9tv78CQC2NdfKNTl32QKWc8Bw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XQIjvbeV2NL/By9fqtLP3vo5FwrHMhcJqfG7oEJNOBPnbpRAQBy/yJdAuEa7URxOhn4qF9LvW36JLAr+xhegGVo03nJ6bX+vCAnXuRQpPxCrVpPO3ZNh8pss52KWQfyTE0YGr/PFfUY/EamIHIVdNs+Jos1afFwdTrxFGasqe+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BrTlTYfU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BrTlTYfU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057725;
	bh=Z+3CyQE2pXbXffrbEZ9tv78CQC2NdfKNTl32QKWc8Bw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BrTlTYfUwAcObFpwCirKiK/qxfa+nZNUhdg2gEWDTvRbi7MNp9RkwPeBlBPoeP51a
	 tEZJyc95eUUxZJytKvYI9PXPKxijz1TcMRI3nvmSJ3duN87BEE0wiWrfFnP+1iP5i+
	 4+DThy3QOhrPugQLNcKDf8+XFbJudfac9+MDWjBp8Mm6JKTHWE239vEwDtYTmoEEzk
	 jZX5JcKE6KXlHmPIM4wZUjyv8HuDHJ/4LoHWxzCWIaSp7Xc86Zr/0S34065EB7myfW
	 WeF3cbtdcw3vCyKVgevT5USnZ9AS9JlfCRCDvdp+3kzVPx4DhgZjHBivfcSDYbVAkF
	 5PtgZnG+XPGSA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CD3C417E0720;
	Tue, 14 Jul 2026 21:35:25 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0001248006B; Tue, 14 Jul 2026 21:26:08 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:26 +0200
Subject: [PATCH v13 25/35] phy: rockchip: usbdp: Avoid xHCI SErrors
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-25-6cb3e769d4c5@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1977;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Z+3CyQE2pXbXffrbEZ9tv78CQC2NdfKNTl32QKWc8Bw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjVAePyey40ZpCgfmTRDWhXn+47iB9lnr2
 JFMIvy965h5jokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1QAAoJENju1/PI
 O/qaEGYP/1bJLpoBOTFgN7vUuxl6EdRFDAeS/xgRqb610TShDpsP/AJbDRasLbV4STymvh7nMYT
 QjrEURrE6YT07NuKlmNFY4a5EpPTxXlgrAQZwBTF8S/0EC6GX3hC1LkRgLK+Ew+f//49V3FhQBq
 kRi8HvhnCSD9jc9+PVcX6X8sZyzX6t8NIW5akmn1vbE4JvR63DxmvnF29yuxmVDeZw8vlqvorTJ
 QSedcvK7ufWET9tivr89I8kRpheMpgjJ64x+CF5XMRe2QHiULEALQydmu0TCYrHvWUS2re40XQw
 EkQRU3cvhdTrUDGROm1owFucvm/6eXKhPrnFlUIBZD5e55JVmqnaPFcqVjh6FKm8Ifnh9P1o3Vt
 /O/qoRHg5PZ84dFDNBXRgpN4LAJ8pzo8VF4GYMK53PUfcdsNVlBViSx8MFt5B9GACqLkwXS3cUY
 5yzNIoo1vYFc8L7GMVL2WEothoRUeaKrQpUv5rhwV1DHwKCyoJQfSIqZMYb8aTwxo6cbJdQrTHM
 sC8DG6QeOPW52bbWdv0iG6lRjoRia15012VBwYHb6/UEzAEkOod05KxmOat9Z8FLbdM48FhLX9a
 Bhj0bBB+y13ZPKGUy5gFy3kEYNIt6vlHK7bjBHD2alhZyjNIzlX6kERwr7zhQce56KpJvBOFF9P
 Y2GolfvDYbM6+wRm/Ue0peQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The USBDP PHY provides the PIPE clock to the USB3 controller, which
means the PHY must be fully running when anything tries to access
the xHCI registers.

When switching between USB3-only, USB3 + DP and DP-only mode, the
PHY must be re-initialized resulting in a short period of the PHY
being disabled. If the DWC3 driver decides to access the xHCI at
this point the system will fail with an SError.

This patch avoids the problems by disabling the USB3 port before
re-initializing it. This does a couple of things:

- forces phystatus to 0 from GRF (not from PHY)
- switches PIPE clock source from PHY to UTMI (safe fallback clock)
- num_u3_port=0

The last part will be ignored, as DWC3 already probed, but the
clock re-routing will avoid the SError. There is a small delay
afterwards to make sure the mux happened. The datasheet gives
no hints how long it takes, so delay time is a guess.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index e67c1df792ed..c7f09040185b 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1000,12 +1000,15 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
 	} else if (udphy->phy_needs_reinit) {
-		if (udphy->mode == UDPHY_MODE_DP)
-			rk_udphy_u3_port_disable(udphy, true);
+		rk_udphy_u3_port_disable(udphy, true);
+		udelay(10);
 
 		ret = rk_udphy_init(udphy);
 		if (ret)
 			return ret;
+
+		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
+			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
 	}
 

-- 
2.53.0

