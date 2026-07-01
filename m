Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95301426400;
	Wed,  1 Jul 2026 23:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782948961; cv=none; b=QEkmGtblT64brSsjlAjLap9/ZCgHFNu1aMJKvb8xr6WGfTPQrRuHNZwsHFyMpKxr5lu96csbJc3+ZKM9SMor85boqf9Pq246P2eDT1DOsIvF9hKihnEjj/cGGLmkpiiAK+PxVQOAwLALt29nUwt9vsOgGoh+NKDw8aVdBk3DBIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782948961; c=relaxed/simple;
	bh=DOj5HF8XA7jbU9jcpR9fUDezK5MUkDvjWoRyt8DGPAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QwDBfgNjtqwVoL9seB4COKx1Fv9VQK6HaEujsAK6BFu1gxPD5J+HdPGs0H8nclBTeffOgWg4GXHjgLHqdTY9hEv8ynjqC1cEtt6+8EZfCSgGn7oCHDoJcqToJ0nmIM5Ufv/sEYOtCmiMZA00rHq47R39Gvu+Os1YjV5IhSmgd/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=XHMYBlxg; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XHMYBlxg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948950;
	bh=DOj5HF8XA7jbU9jcpR9fUDezK5MUkDvjWoRyt8DGPAQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XHMYBlxge1L4KoNEVhQMDCbsOlu9+x0cIfIgV0kn9eZ4IDWu2tczw8Bc8qcyx7JCy
	 /vxygueVhH5IAtpm9g21oEhynd6z/m6KrAy104FVg6FTB/hwzTybelT7IhmhcCAvO3
	 YpWQy4q4VKMpU2/Zxm/FFt1pbw8zMVo8U9JyhTCkX4YxEZCQML4Jp2e6ku/4Cj1nBa
	 ozKNVcrOyADw4Sm8MARfolXENr9Q+yYVMQGarAuAYxjTd5+k9+D3zOukFqFBLsV8/E
	 zLnsMjO7F+rnuvi8n7RNtmjOhjZENXjP1twENxirYosfWUfrrnOGU40mtKbKRpOE62
	 a0/tzVKF6Nl5w==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B7D6C17E35D5;
	Thu,  2 Jul 2026 01:35:49 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C8BED480065; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:35:57 +0200
Subject: [PATCH v9 19/38] phy: rockchip: usbdp: Rename mode_change to
 phy_needs_reinit
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-19-e31efbb62d2e@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1831;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=DOj5HF8XA7jbU9jcpR9fUDezK5MUkDvjWoRyt8DGPAQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFMZwUxaUdoOlCXxXCe/oPwVNOHXMPrCV
 zn341TXL5IcYYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRTAAoJENju1/PI
 O/qa3twQAIKSZazX7g27sBj9AEPB5zoTy4kmX7tnbacVkYner6U0Q2qV1/gxZZFyhXNVxWgPvg3
 ly/aUMfWggMCcnci/fefxRMY8pSst4eOnK1iz1Ky3ww8+z+D05u50TRa+26gpCB69Rq/HVfiJzr
 jEffk5TttTwAPtsJoOvInhpGcyPsTd18ra4ckFmVLFKqdwyGAjsfNp1siVLTycJFctlDmBSlIEE
 L9wbvGHLO/AQNZqDjbYP+wO/l1ossnmsOdsXnfCtAttNGkffmjEVGnVBh+asQAPjPJn19OGxsyq
 4sr3Nw9sbgclhWAd6YBpgwkMGH7NeMOhQhZe0WmqnLqslWSBW+k1SNCIFPpFYhBs5QnZPhLS5tj
 Ur7MemdNfmf0h8fQvECy7pzfDiX1kSn5B6KBBiKQLmq+Zqv2neeKq/GNsXizztYusYXbmq4BDxA
 U0zsg4wRUfWPfAoV2Pq4tgRUcKYsiiKLNucO5pZQzmy1pUnY/bpb7agBO1KFTsCAWjyQh/RxAVN
 3x98wotMYAmhi/TS4r4lVru+XVghan/+b/iSQFyii2Ns2zBETr03rtOSiLvtmShf2CbbmzDFPeX
 sXZ15BaMPEcPUuEnvHY0pk8n3qc5pjX7Zof2newHTPtNkf+Kqr05/94YSC7KEjyve1jy62tdXR+
 AkKRCqPUIWNPvWd/UdbY4+w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Right now the mode_change property is set whenever the mode changes
between USB-only, DP-only and USB-DP. It is needed, because on any
mode change the PHY needs to be re-initialized. Apparently at least
DP also requires a re-init when the cable orientation is changed,
which is currently not being done (except when the orientation switch
also involves a mode change). Prepare for this by renaming mode_change
to phy_needs_reinit.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 928466659486..8f06bb9b1fcb 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -172,7 +172,7 @@ struct rk_udphy {
 
 	/* PHY status management */
 	bool flip;
-	bool mode_change;
+	bool phy_needs_reinit;
 	u8 mode;
 	u8 status;
 
@@ -584,7 +584,7 @@ static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
 	if (udphy->mode == mode)
 		return;
 
-	udphy->mode_change = true;
+	udphy->phy_needs_reinit = true;
 	udphy->mode = mode;
 }
 
@@ -987,15 +987,15 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 
 		if (udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
-		udphy->mode_change = false;
-	} else if (udphy->mode_change) {
+		udphy->phy_needs_reinit = false;
+	} else if (udphy->phy_needs_reinit) {
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 
 		ret = rk_udphy_init(udphy);
 		if (ret)
 			return ret;
-		udphy->mode_change = false;
+		udphy->phy_needs_reinit = false;
 	}
 
 	udphy->status |= mode;

-- 
2.53.0

