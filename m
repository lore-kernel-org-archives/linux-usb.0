Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90556341AD6;
	Fri,  3 Jul 2026 18:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783102425; cv=none; b=PWbAYagKh77JALWd0WQCg3mka8AhdLegUB1+0QJUrH/4X1m1Iw+0GBTesxyXtyfshY/sUuKz/LzuQFDdUhHbSBqlXRXSzyIX+yc4A3hM/sTndgLp+3X4A2fBTqUwOAoBU7KN7ZImmJnGiYSnnmi8aTI/kQ3P49Wjia4nQQVneUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783102425; c=relaxed/simple;
	bh=4X9eFjcBaJHCtFU4hA401y9jwD+dcI01OT23M3giXnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bT7Z6hCQqHi8sjqvFOnfEoctXJ9w65JxQaLKE+1AokOONOiznqi3lzV6VnRfZ3L0t3RjoRFSverfW4r76CvCGGb2813GfiATaKrfv+fxUxjlEJtAYaj8+9y3uvdUOEn8tiAdlGMU41KMSCyxiFInBkSoDuJBW7OWQkWf5t8qHcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hAL0EQr3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hAL0EQr3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783102414;
	bh=4X9eFjcBaJHCtFU4hA401y9jwD+dcI01OT23M3giXnI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hAL0EQr3M5y3tT9Zsq11gLv3dwjl4U/YSrFvWFKyRCNo8vRW+bV/QMaBbvzBNTCqH
	 HEwhJT6woYAoeSy08Q1TsXOuVTDvB/KlsG98Xjcik2n71R8ZKq78ocHXmx3pdx+oBs
	 aaEHKWqCpjJ8DQBt3A+qHvPlu/RYIM4aG/00eQA6qm+QntZYGa6jTHgdWYMOHbWEbI
	 i6UaoDHv/D68o0Zlk98C/wq+G/8IfEodWl+f7xPYCW7UMbt3dYdpD2NHw9F+SmESde
	 W9w7ejucCzIjRzHIDgSoogPbfYGQXof02EFluefuiPaUqMO8dXTrUPsUa9wafMt2i9
	 xsAOT4/yV6eKA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D316217E1559;
	Fri,  3 Jul 2026 20:13:33 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A3C9B48006F; Fri, 03 Jul 2026 20:13:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 03 Jul 2026 20:13:44 +0200
Subject: [PATCH v10 28/36] phy: rockchip: usbdp: Only enable USB3 when not
 in high-speed mode
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rockchip-usbdp-cleanup-v10-28-a392711ca8a9@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=4X9eFjcBaJHCtFU4hA401y9jwD+dcI01OT23M3giXnI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpH+8xKdxlQxnjtIaYU3momd0YCs2YagqVfs
 sRnAGiWi+qh3IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqR/vMAAoJENju1/PI
 O/qaclUP/jpS0Zz4Me4rYhzh3c5z4Wl12xb882eFMCf6epCMvVrKcxYlUZOn+fUq8JXnZMEEaw1
 qHpCd+HUogk09sbfIesXMJfOLmx/cor8PvPoztUcZDIaR+nlAQp0FYpu7FC6pQEuujfVfFFrSRv
 284fEwEiimMO1GBu9aeZiuj+Oi7VghfMJw3+z9t1DWTgdVdiMNQb7QQVQKwSHPb8tNjfjZ+4190
 9mclkjdv2BSQ47aRlf9zQgZcLdPOly9zgZsdoQaVfUul4Yg/SVkzGkvSZx9LHAptYCODxpvKoSK
 Mf8SkoAdFyFdloNJBrC/eAio6R1oWp/3eaqZzQkBhdyTVgG+9B/ZXuPc7Z3FjIU+IdN+xCHwQwh
 Rrz/xrNamr3teiT7Av6ySEEY5krWY7UeBZ9aQSahkudJlLv0cSUDpHCaOXbvFgLt2VW3mVS5L3u
 kCUrA1ua8wRYn8rUcw6JmDZV2DjEbGQ9ThxOzzWxxYSp4YsRaSwT3hOqO09s/l1IIV8ybqlMFpc
 0rWplZjTA9p0jJsTYkoiutxL8EdTi6PuGB8PsY+ZYlDBxGG0dD9346MbdCO/0hTGVn/d+FK1J2z
 /ijroUYdX3d7N3SEf697UaVfmatNaTP8elJ7BSF1QSbFFVmAm5IXyMIkBR48b4nj07cXaW1xyvU
 AvukhHxLQhqyjwJAfNFcv/A==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Ensure that USB3 mode is not accidently enabled during PHY re-init
for systems that are configured as high-speed only via DT.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260626212424.C215E1F000E9%40smtp.kernel.org
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index c645fea67c4d..694688ed387f 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1009,7 +1009,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		if (ret)
 			return ret;
 
-		if (udphy->mode & UDPHY_MODE_USB)
+		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
 	} else if (udphy->phy_needs_reinit) {

-- 
2.53.0

