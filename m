Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F7A3C37B3;
	Wed,  1 Jul 2026 23:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782948952; cv=none; b=ZLbYfe+awNc1o0eCbH/gKy7gkCC11Mp+IPjF3W2ubCNZOmVQdcPnA3742Pu/C57Ilh59erhkOriu6TZIhP1Fszq2vj21UYyMhXZiV24PgEVZmw6sBKtWla0EbZkY1TkCb3JUxLkxlnSKpqVLLb70VwvAxst8G4IIeShwLSj4zDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782948952; c=relaxed/simple;
	bh=ou2OeHe9NiTPGYgMcRzTUBwKmURTgL5/azZ1wBtlGvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UaJwCK3HRHFwLkvC5MC2D8KCUeVKPJEwM9BWhsE3dKZL1sDXx/iKMFAY1zZlIjb100aL2GBGEyxWriMmVnDVC+pzKiBU3Ysa0P4hcJrM0OWoWPuysi99DkLpn/qN2RHLOvlhljN3+A/9KduUC5XiRFUqq2kIxgAzRjXmH15rRnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JopCORWt; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JopCORWt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948949;
	bh=ou2OeHe9NiTPGYgMcRzTUBwKmURTgL5/azZ1wBtlGvM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JopCORWts1/zBZAshpM5FlhwVl4pX5v5Db4QkTN6TlZbCkMZ0VLNNIpKzAbcGztV3
	 L51fx3v3suDxc5R86qB4Z4PAx3YG2o965+Q8DAfIYEPNO9aTunF66rie6gDfX1ZRhG
	 I1rmcfNTSNbTOFhy8wRS68dZZhCuFjI2kBQZHOGaX8f0+urJdEI4Qi5iNLdBRdhBpT
	 TIh1gQUBnhlw6XCvzaefimI41p/oAvk+xqDL0+cVQSzeW0IpIoKWDougby73SxnPJr
	 Nvd91IFrWCkaf1zhoC31+wdP5ONRTjAd9ane6S4vTgnzQ+Tb7gq7o790w8GBw3MxiC
	 /+oIM5cGhRv+w==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 037AB17E0FAA;
	Thu,  2 Jul 2026 01:35:49 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id B093C48002F; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:35:41 +0200
Subject: [PATCH v9 03/38] phy: rockchip: usbdp: Do not lose USB3 PHY status
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-3-e31efbb62d2e@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1409;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ou2OeHe9NiTPGYgMcRzTUBwKmURTgL5/azZ1wBtlGvM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFPWvCILXhPZhf42ixcVhNrM3hmuvuk7y
 691Ps/bIwJBRIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRTAAoJENju1/PI
 O/qa50IP/1b2y0pmWi1VxXN5PMzVct1/97+k3BAP6RFtVpo2zuqJpShP8iEj9LwGlUbT4BQUyrg
 lNnydIMFhfER15s5wp/uAf6zRyqGd5vn+nYJIYBM1yHzIyWlxH94aoLoi58Ftuc5VrTfhOexGhd
 DXvkjKS7u9frTNXv5FdPvlNDc10Wsxjv4Grhbwz9dUUUVUqZuVROn5WzcMT42gO1Ix16moJHDp2
 EU0POFjg15qchk3AmKC/kKwzq0b+ISfPKM8/i3OXKHq9i6aaKZhLeT3/CZiEz45iPrTicz2c209
 Bm9PZ0QlFomLNnRUUXtVXmhxA9sI0FpPW2BdEB2u6ZGRCsyaARvug1oTIqSViHhsojvyW8RA2pp
 Whmua5LjFQixIsGft1KTmWwxi4/XcoSsTQ4MzP+nmH62E8qODeVy15M//Og29F67cWxROiC/P+a
 3dx25HIY/B+55YMoTdjcstLJ8Old14xbyregNmR8EmgbTIBQWWT4/DNYRXAoGazCmhEPk/ZwuuB
 7TntmV3ilfhyJMXObweukVWZUFX15sg6vAlDQ1F1kFbnu63XLRa60X0OmoKG6YAj0UOkeI2IBgO
 mCL6EqkEtSYheV74dFsoUhkyKYzQqNJkjJk2C2UCL9Y+9UMWBjzSc6TWxnDdiT7UUEWlxdTZXJ8
 XlrXialq+wJ4Ee1JNLsEsvA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

By default (i.e. without manually enabling runtime PM) DWC3 requests the
USB3 PHY once and keeps it enabled all the time. When DisplayPort is
being requested later on, a mode change is needed. This re-initializes
the PHY. During re-initialization the status variable has incorrectly
been cleared, which means the tracking information for USB3 is lost.

This is not an immediate problem, since the DP side keeps the PHY
enabled. But once DP is toggled off, the whole PHY will be disabled.
This is a problem, because the USB side still needs it powered.

Fix things by not clearing the status flags.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index a5ffdf7a6e76..12dfdd470a78 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1008,7 +1008,6 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->mode_change = false;
 	} else if (udphy->mode_change) {
-		udphy->status = UDPHY_MODE_NONE;
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 

-- 
2.53.0

