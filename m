Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AE443B49D;
	Thu, 13 Aug 2026 20:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654329; cv=none; b=UJKKRM8c5vd2C5MA8+QPJLLi2d8hKAi2Sfll1+SxUg9vjUl5MsKgPqASXdXKcWOifZroemH1lRQrCWFqIAFkkeDOtu0Viqyb9EEQ8zt4eVI5YqkKt/HZn8YzJ+RRj4c43VyEyj1Y0I8Lo0nYMTyLQOSfvj1W3xewFKu/dkoLVQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654329; c=relaxed/simple;
	bh=vXkzKIM3/q4hdaQBsltNPWM9OVsnjoG80wl/tu/yBKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JXYZ+3Zxf74CU/erhnNsMg31MEent/jo4pgXiXy6uAvpi3DgLlXYqByfuHAeAo7r0cwmTgCmOWihrIbKkicu/ac5gOTAj1tWw10edkAHLTtTorjcvsye8zmE/6JFIHMdQ0/OfxI4eaxmufJiUchat15xnCMP/Zin17SdKESMpTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FTIwyZ3L; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FTIwyZ3L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654311;
	bh=vXkzKIM3/q4hdaQBsltNPWM9OVsnjoG80wl/tu/yBKc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FTIwyZ3LB635E8jyWYlkTg+9HBQn3ZJAN7GXwee02hkrzdNLjuUDMoVb54D1mKDcI
	 /PWzXFzl6rhbB1OwxiRz4RVWZSGMMtiz7aqffepMTMf6Hquv3eNBf7R/ZBksqzPeNv
	 m9xo82lmfyL9NCBFtGkla27PQGQaLWZUtzh1DwCxCBqMtkq8LWUWYflceKxe89afFG
	 id8uH5itqZVm+jj+GLiu+wuhe5Jd7rdAMtWGXvQyuQ3aLR2bfa5709A4fmRHzfqVgR
	 pRmMtmAex5BIjqs5T8taskP9yCBoZ350I5kk38oBIcEM7fbKLT/4TQcXJDWKyxPXDM
	 L1L4cgX8VmzSw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C276217E14F5;
	Thu, 13 Aug 2026 22:51:50 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id BB19C48006B; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:52:08 +0200
Subject: [PATCH v14 25/38] phy: rockchip: usbdp: Avoid xHCI SErrors
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-25-b5ad9c68fa11@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2046;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=vXkzKIM3/q4hdaQBsltNPWM9OVsnjoG80wl/tu/yBKc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmWk9xoQulUGwo/h+HJi40MABXF/KPexK
 IiXzH//fRAe8YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5lAAoJENju1/PI
 O/qagYEQAIfviLzk/7en5Ka26TvxzcgF3H6aXqhobyjHmx/nVPHjNcJ5xzA4keKkXbhdtRoV77/
 l8kd8bcNTjJWYOJZ2+x83Y5LjVSFmjT5ZPUk14+HXzZqnxGxj3oyyyk+r/9rGLvWl/dU5SS0A+W
 LLHxPAaMUqad2zrEFhSyxhelRcejwE7df2h9XGLdENZgD08dCc3jn5UJNLGN2zqGaM2Pkway9Po
 agtdqj4+5EsWXawqFEmk5+zEWUQL3NSDl1mwKjxbZcj9SQDYzZzCDvs3ZlvJepy2bGw0sKG5zaE
 HpfPz/GJGWr2beDscedH7IYPcb04sGfmULK2FguHlXeva5iac6y73KOJ6pxUBG6mxalt/Bqymo7
 H8feuWsP3axLt4CglRMshIUl8BniZRJk62MTgLPGsVfrMsWS/rnIjh1HE07s1gZM1vAmEq4Cm+M
 Un+QIzv/xDraP6ZZ1HOlFe1iq8pToFK+WbaAd3suvMf6wDtVQGQ7Nn4b/FN6PfhKnc73/xOQBSS
 3LoEQ82PypCfBBMR6bseY4XE0KAaKgByG7ueksD4Amh8ewJraHerwy05t13ex8q76XjKS95EjJF
 6IGzUl5EKtVqMnxQDVLYZA5SIIBS/rqaxUAqeJkDuMCNbGKWRwoDpRNEKaot0EyeYX1UZ1p0oAK
 01j8XOgShh4GqAMJJm6szrg==
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
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
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

