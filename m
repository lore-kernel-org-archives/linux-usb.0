Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AA143CE65;
	Thu, 13 Aug 2026 20:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654675; cv=none; b=AgJ15ex6llYvYjq+nY0Vo913BURI83QSXs7Ez65cIyzm5fxaE4eTjsEOI3N1jg7MBaVOgscBiDMmC7LC2W/NKqb9u1m2uAPi3NL4N81gve2XraFSYveFWfiBd+QUqqOp/nAd7WBnQrOxgcb3LnDRXlEDNa491I2d9YQb37AazOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654675; c=relaxed/simple;
	bh=xtuw+S8aOiE2uzmS/xdd2KuITABZc272KnkQDRN0ffI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tGv8GfujypgIi3Sdxh6ExASaavwwcDb0ZAdYWa11L0TSY2y5pjAjoSPe3bITkt3wdD+egQPfgt2TZm+++Ve9vqDTMIjGPeehm5cbgMqByCPQ3YbuzYt/HUSfEEJdEVFi2idU4T37X4+zudBReintXLjeAInJZz9EHgZTW+XkP/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RqniNRXO; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RqniNRXO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654669;
	bh=xtuw+S8aOiE2uzmS/xdd2KuITABZc272KnkQDRN0ffI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RqniNRXOB9ihtfps+IpaHA8DQhvGkB9cVmeae11Ul0uxqgU5PpHjN/I331Ik5d/hw
	 fZxYD7BDdBpongh1KCRBt5qWD0zPuWsb4gfXE2quwzEA3TBCM/aZVRgao4oO5JdLkA
	 pc9nwVQyyP9OsZTv7DgXfc1U32JIm8cGtxpSfZbYUSujb1jP9maGHUtiYsd0OdwmXc
	 gelukDhbJVRSzOOLxEQJyEvE9lp4lw9YvLIHPmr9g+/8T7zPunMfwRdhcSvFl17U8x
	 Hbc6RJxFn9AZdklFs/sM/aSHOQyjDPOFuWTXsYs3JTk+TXkr1OiPfIjEizjYf25T7+
	 47ISG4ry0pevQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E1E2F17E10B0;
	Thu, 13 Aug 2026 22:57:48 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id BE46948006E; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:52:10 +0200
Subject: [PATCH v14 27/38] phy: rockchip: usbdp: Only enable USB3 when not
 in high-speed mode
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-27-b5ad9c68fa11@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1157;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=xtuw+S8aOiE2uzmS/xdd2KuITABZc272KnkQDRN0ffI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmV5i9XhIqiZolTNMpxwY4BOpqJmGr/ja
 /c2v/fbkfSSUIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5lAAoJENju1/PI
 O/qaJJ4P/291uoKDo+Aszoj+kaLwiQXFYzR7Op+C+LexbfkwVek65gQyDPCN34cXrmfgTc1ySE8
 Ks0otvztz8ftTwINtvdsOmU+8DkKcLGmIaaSQm6cbKk1ZE3cNgEqIj6KfvI3yP3ufvVVEsj+xr4
 zD4dmhY0VFVw/nqaPYdlRIiH255XZC0zerUf7QnDN/z5HzIBSIx8GKdmkBNqrPodEFj0CWPYppp
 FFTgcN/5lnuqKvKArrfT/k4gGh56P5H1Ig8priv9p22lcDeyNqXi/VRWu3SnJyOmyy/BbIRyaPT
 U8/0X0R+1AJE4Om1UUTGCxp7450t8nBvWUddCyJlKw8JwBymwn7W5tXeGqj3WMcv/JNsWZbBaf/
 b18FIHuP90Gt8H/2Z6lkUjCPN6cPj3wNhIPyZuYzoYfToL8BtqAkp2EiSW6r7znGEHQPSxDmvFp
 VuTpnMLYT/L7c/FFgbUbYb4ZGcD77ESYCaoOB+8VdV92RKp4h4QhmVM0ybZ3E79NYMY5M3F1jpZ
 KfI3hqZfcw1uDqz7GEv+pdslY2jZQfgF2SJ41f2Pz02uRxF1B6J+NaF7fT5aYiAoxkWoN+TO/Tl
 V2qFmUzOd+FXraQ1hFduqJkkfmH19F+g1tNPGZfEq7QCHKpHkrzQmIw5Vikpeu5bp55tNYrj0B2
 LaCLBf8Ik/KRRZfMrQ28+iA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Ensure that USB3 mode is not accidently enabled during PHY re-init
for systems that are configured as high-speed only via DT.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260626212424.C215E1F000E9%40smtp.kernel.org
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 701c92ed6e2d..59b836a3796c 100644
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

