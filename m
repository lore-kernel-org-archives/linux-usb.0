Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98CA426D0B;
	Wed,  1 Jul 2026 23:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782948961; cv=none; b=Oh8T1nhDs5YvYKjwuDGXU53CnNUoigVoyk7b/uEMojAyQxmt5zTptNi6my6QhwJTAs2/fCs/j6OKKEIi5Pi1jEnMLL0Mz6qMtDACuQwUvqd3op6EZMF3EsEXb5bYKGzTKFXLcH6tNFFTPFpYI98GU7qNB8rUZPXFup6o07y3NOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782948961; c=relaxed/simple;
	bh=2KMZ0BK5nZl9x3Sxrnw8YlXTBKnooaCdrEkVGc6Hu7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XN4KfjKTOn+L26FUmbJlGnLH2h8XS0ZWTdlOowxeB9i1GqpqBTrvpPXNBOG8j1p2RAuiYEv8DXZJIVp6TfHCCW7/WIYWqzMS629vSKKfZuM6gW3vy6RLXDpuU/jMghYQKejXOy4owgDgFNmAMjhFZvzloD+6c7a5gE8RcmP+4xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FjQx/BR1; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FjQx/BR1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948950;
	bh=2KMZ0BK5nZl9x3Sxrnw8YlXTBKnooaCdrEkVGc6Hu7w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FjQx/BR1AcycpjQFboqeuflIr35Y68NL8TJPsSzOGVv2M9U1BTQfIaxa8j/FZ1DMk
	 lQAHErHxCEaXAKhx74lklAaYHAm0sG5gUA+Nu/7/JskFL0sOBMS5I3gETGQ1ehhxPv
	 2SkLM+cCp2QNBr+SoTZH9OomPl5Lur/fzKybx8MyGQUSIgpQolLUH4ca2W2l6lU2U6
	 IEbRIM/5EtKyy1K/fb/CAdx5NITFDCtaE/k8d54FEkG2c2AUDv1wtd0m06MNjskL+p
	 tRK83sgYBuZagKsFTlF6Fdtr+iVq58pli5GOQ3URCenF2Y5AqCcW2c7ZKDmMMmxik4
	 A1I+QOk5srNsQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 187D817E35FB;
	Thu,  2 Jul 2026 01:35:50 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D93C8480074; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:36:08 +0200
Subject: [PATCH v9 30/38] phy: rockchip: usbdp: Only enable USB3 when not
 in high-speed mode
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-30-e31efbb62d2e@collabora.com>
References: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
In-Reply-To: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=2KMZ0BK5nZl9x3Sxrnw8YlXTBKnooaCdrEkVGc6Hu7w=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFSkcMxQDCmuLrdWjNkM/C2sM0jUr02q7
 Nd096rbB/JWVYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRUAAoJENju1/PI
 O/qalFwP/0WTgWmYfQkf0vMM3TApw1PcGBOaeKB8x9C/kYkdnIxed6Q5afPc3EW9cth0VP4BFnW
 kxBtJD+I4qRFHv0aB9xlVMeVJ+55uui4tXxtDaER0Ta1Qj4XkIBGYxqaj9rzpTBgHAQbQLeNJjv
 6oALvAg9G5SxOAHxU+eqrOE5QbqbqeeoBUujVoL1j6s2rBoDBPc6tF+gWy4tmj8rdXlhcFdPORV
 zUJZ7bUDzh63wHRTuTn/HSmS23Z+UEZ/aErXk1hGKelq/Ts1dI+pnDXA9jGZRhJJgjnZGgOm7M/
 vaggTyfa1bDzJ8PBZR2C+9+9r73e2hCYjAyZ8SdFmkMOuQDgrh4CuR88D/0nDMq2MeEQ8Ib8iTT
 tYc9yjoMhMONuBDjq3fssT/jmSVrgn4849mAR/Sq+zXrtiknkyD45o+SKnOfiBkGcerzzSLO8Am
 D7OSbzFWWZdR5NWeqaQ9fTAazRyFGKkExXaQ9JeddM7enPZ+NbRCQ4rYGV3aC7in0kabth/cmrv
 DGYcBuGaMknEb0rqzyRwJiR9niBIBNcmDCnnCOui6FELAVNODClLBDI7WhXs1jC41Ad0LSErAOl
 FjunmZnDQj/oIOn871AKWlJIeo7rFFM4yohT8EJ8/OBW72gh8tM/1NY9US33O0dDxTqU02COT83
 Wg258Fb4fnEdCLzk/H5su5Q==
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
index 266cbb0e5325..c69766929b3a 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1037,7 +1037,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		if (ret)
 			return ret;
 
-		if (udphy->mode & UDPHY_MODE_USB)
+		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
 	} else if (udphy->phy_needs_reinit) {

-- 
2.53.0

