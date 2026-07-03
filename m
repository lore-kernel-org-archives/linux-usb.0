Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F7530E835;
	Fri,  3 Jul 2026 18:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783102416; cv=none; b=rsFc86yCkSGkasdE4pieRzpeAyE95Pn8uPoioAk7MeYkLuxH/YTmd271jEL4owc9HOyBAdmB5KUUVh04L2exBdzWH1IZt8lVACU5xXomaL5TyCRXq5kGXrFYHmBNRc7eGe1yc2mgSH5R7SShZ3bXi/QiVftTvpJzcLvN8CZZvn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783102416; c=relaxed/simple;
	bh=1p3WFYm3nPwFyjx+ldeJOnj6dqBA+X1XeNTC11p7Zk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QgESA5sCgSGwhOkmRcpYzbJI8gbqIXZxaM4yznd9hOnd0jfeLU+httWGGrCj2CFEndqBYi9G9SmqT98WIP5sBAoH7LHq15D9+GjLHBQ9vDcz7kMGK5payjLo80wp7GB0jnRMgQRdgsrFyLzUCNlie2mBof30qc8qJuj/6BDDd4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YdCBaLUy; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YdCBaLUy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783102413;
	bh=1p3WFYm3nPwFyjx+ldeJOnj6dqBA+X1XeNTC11p7Zk4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YdCBaLUylNmbTEfxVXEESP5SWZneTx/9I38Z8zR/9wYT5A8piUo2VSn4nDmOahQ4X
	 Eimny8N6yy495+0EOMTgc4PN6yrQzotPuH1S5V1vC9YC75MFDcma4+u1o071GQljDU
	 aBJt/d7X9vgm4u+DgoUVlh2b4AY5uMVBryQ5PlorgEmsM8Qf1buZGGZe8HMpJJThHU
	 1DA+9BlV30yTpbI9R+dAQSPCVKnF9J6gL6gF0bSbESHvwm+Hv2jctwCMK7dw5ueWFz
	 GUwbAwqXZk82P2W0gwO3xzpUOPoO440FTDE6Zzwm1zed6R2UEI1TfqLLYzybTTldrG
	 wC/ANSKdtiiBQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C809A17E110D;
	Fri,  3 Jul 2026 20:13:32 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 7ED05480030; Fri, 03 Jul 2026 20:13:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 03 Jul 2026 20:13:20 +0200
Subject: [PATCH v10 04/36] phy: rockchip: usbdp: Fix devm_clk_bulk_get_all
 check
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rockchip-usbdp-cleanup-v10-4-a392711ca8a9@collabora.com>
References: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
In-Reply-To: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1653;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=1p3WFYm3nPwFyjx+ldeJOnj6dqBA+X1XeNTC11p7Zk4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpH+8ukH/jQZI44B748GiOGA357PbMgb4AMz
 BR2DPHy1XBUd4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqR/vLAAoJENju1/PI
 O/qaM8gQAIc1ytCxdqGIMSRoIglJLEf2H3ei2EoZ7DHS/DgTyKukkMxaY+/8Eh3Be37hGvOxNYP
 5ZI//NvlMmCsT9pjn1qC/+GnYWf+sHXri4VsfrjoiJejgPris/gujDBfPz1lAySpeIOESrjScV0
 vTrBveo0Z6A/vJHFFgzXGFdIXMtwgEhh2AfzKvziAR2RmSHDBZY9yI8av+Lf4xyKs4TCB62wTcU
 Sz4dA9CbPCiK4is/0geS8UWlUG8QZUJurmkv1nHB6/qnv5XJGR6Zej6rN2/1pLnK/QNWN44LmQU
 ybh6cxcr2oJkXHJ9FMIMQ18zYhpa4rDtBtFDC9CDJmgZ8IxojjwSGEthQHr5vhG5A2AI/hOD6o1
 CvEc20Sy+uRBcQNF+yo5WZPKr9Fun5nW/K+66xX8StKaKz8bkxR2tsW/ScohSOIRzyRusRW2+BS
 YJNEsASYuSim4Bs5rViNu2jCsK+RPbOuPNufNp/Hli8vYRnpNEnNc0/hOe92h9r+/S9niNiRMp+
 7BSJstfOi05ITsTNKxwZ8QE7P/O9f8OnohndDtjkHOKLNHVocKEg7Zr28oWeZxaaV2zQVS3Qhed
 PXK2A3ShMtNDJ/xNmBgtu5AR/yVYlPND6bjoPKkRh8PdYPm8CrmrXfSwTYqTCg+UOX6Sfiuvlso
 W+bITqPc6mu4Pouj9uVYvhA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

If devm_clk_bulk_get_all() returns -EPROBE_DEFER, it is replaced with
-ENODEV, permanently failing the driver probe instead of allowing it to
defer. Avoid masking the error code to fix the issue.

This effectively drops returning -ENODEV in case no clocks are being
described in DT. This special case will now be handled by the follow-up
check searching for "refclk" and exit with -EINVAL.

None of this will be hit in practice, since the driver is only used by
RK3588 and RK3576 - on these platforms the DT is validated to contain
the clocks and the clock driver is force probed early. Thus there is
no need to backport this.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612164107.C7DB21F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 12dfdd470a78..2845a012eafc 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -427,8 +427,8 @@ static int rk_udphy_clk_init(struct rk_udphy *udphy, struct device *dev)
 	int i;
 
 	udphy->num_clks = devm_clk_bulk_get_all(dev, &udphy->clks);
-	if (udphy->num_clks < 1)
-		return -ENODEV;
+	if (udphy->num_clks < 0)
+		return udphy->num_clks;
 
 	/* used for configure phy reference clock frequency */
 	for (i = 0; i < udphy->num_clks; i++) {

-- 
2.53.0

