Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3EE340A4D;
	Fri,  3 Jul 2026 18:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783102426; cv=none; b=MoIshaLJCk7/4GYl80H/FJIpCuxz7mfCjQsHZOQzSoiMOrU9KXQ5O/Wk72VZwGhotN6Wkhk12v4ywmKjKoeJkpSLa4MC8uCXClLOAMg04Q9g1ty1cGNWXACR+fkCM2a+fMtz+VEDcX56UVkjQfhk/JUOi3dDombUYtF5rSGRMf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783102426; c=relaxed/simple;
	bh=LwQqS8coKgvymoJgMVu8XEM9jYreg3Oyt1anGPjS52c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t91iTqFQy11nN1RC6O+8RNbMy4Cpa46w7j3hihG/q+O9c1QON1Px6+qZpDppSsk7nqAoMF0rOBK5o/zTA6TQmu3xpo8+OPn67T/ZUMcc9IxSFF/Ihiuo6Kbx2EwG35ahefuEEwWjx30idNT2JwLn1g4S4pNI2iwbrt+/G66XSXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cOOKiviX; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cOOKiviX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783102414;
	bh=LwQqS8coKgvymoJgMVu8XEM9jYreg3Oyt1anGPjS52c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cOOKiviXXnCSV+p8zfEBX2OtsQitJUAX9CvK1BemdKyzDBgOCgnwlVvGghaTbIWVz
	 sKB7xZCKIhi6vF40C179Q7WlVf7QchMD21bGXLwEy+NRWtgHHnH1fl3F5gNgCWU6pr
	 L8IsRJmRZUvYsDoIs8sshacyC4r53MZsLRNf+vatAgPvLcTadPQNH48OcPA/F9lwkZ
	 ZnptEdr4BulyagbMXQCojwkuvZTZuRNLXWI4BcjTjlS4BXtF1oY92gvgTOqnbVMBKM
	 fHri30IxbPBYbPJ1UowbzhihGAn9FoudnDwrtDLTU+6QQoJglKGP8q66OEHqXFq/WR
	 dnnrLzUD7UwtQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0308117E1576;
	Fri,  3 Jul 2026 20:13:34 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A9B8E480076; Fri, 03 Jul 2026 20:13:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 03 Jul 2026 20:13:48 +0200
Subject: [PATCH v10 32/36] phy: rockchip: usbdp: Drop -EPROBE_DEFER hack
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rockchip-usbdp-cleanup-v10-32-a392711ca8a9@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1501;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=LwQqS8coKgvymoJgMVu8XEM9jYreg3Oyt1anGPjS52c=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpH+8xg6PeFnZcmq0JgXMQyYUirloOTLYeP/
 wiIG9Z50ocwg4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqR/vMAAoJENju1/PI
 O/qaD7AP/0Qzbv24ViDBs/FXVLdBrNTY5y7GfPNW/CYopgcFMD+UEpS1GbJrtvwI42gHlyCiih4
 Q5avXiqN8n+LSvkJMTyyzr/5tCXiLApSjHIWKNfqQUIK8I5CeXwVUuyyrU7Eotlp/IC3dmRWygZ
 MP+Ew8C6w1MDJp/wSKLqu3ulzqaQe8JP3TL+iYSmv0awPO4rI2y+AEuL9QVlvcj+vd9onFUcYcT
 OPpJThOanVwkFY6kgDOHb0pjvk5n5PB5XwnPRBDTPC9EdkItozg+H8tEPGM+GV9MLl9fte6MV6y
 Cz5f9C/8OEYzZTBBNU/uoffXDeabrROV8kHsjMb+X9TrpuJp+sS2zjREbwqEAU65Rz7UC3a1364
 39UlhDVd72o4skvGcYotWsVDI+wdYb7Bmvy+COG1D3FBTWSYWvg/vermjTLUMOpGXZMFckN+XOj
 E/MBy7b+DrqrPjm7IYsxCHEKY6wG7rdcrGaQWVeThYDOsNvfSD+Rexz4gTAwU8JQyQbh1RCHUX3
 T/v3cTrkB7FKv0dl1NA2U7vrAs6soDI2RS+NVmD8/iHEjYYCIPK/dVpGEQfagOixb/+cGEo0sFq
 YGe6L+DQjGJqb5j+PcSpyelL4m+mEKedjYYdytNkCEoJP/iFSiQuNJQBHPc3vShZVOagN7KIxm8
 nGiCkiwAPV8Se2RnpoKwrvQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The hack to return -EPROBE_DEFER when the lcpll lock timeouts is no
longer needed. The driver now does a reset during its probe routine
marking everything as off and later on does a re-init, which avoids
the problem.

Apart from that rk_udphy_status_check() is called after the probe,
so it should not return -EPROBE_DEFER.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 5d151fff9eeb..3fb6eea2979b 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -750,17 +750,7 @@ static int rk_udphy_status_check(struct rk_udphy *udphy)
 					       (val & CMN_ANA_LCPLL_LOCK_DONE), 200, 100000);
 		if (ret) {
 			dev_err(udphy->dev, "cmn ana lcpll lock timeout\n");
-			/*
-			 * If earlier software (U-Boot) enabled USB once already
-			 * the PLL may have problems locking on the first try.
-			 * It will be successful on the second try, so for the
-			 * time being a -EPROBE_DEFER will solve the issue.
-			 *
-			 * This requires further investigation to understand the
-			 * root cause, especially considering that the driver is
-			 * asserting all reset lines at probe time.
-			 */
-			return -EPROBE_DEFER;
+			return ret;
 		}
 
 		if (!udphy->flip) {

-- 
2.53.0

