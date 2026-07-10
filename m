Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB418182D6;
	Fri, 10 Jul 2026 20:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783716976; cv=none; b=Y48f8Go8jPWfVOHLI76Nd9EleQwC/s8LpA5AkX+MRSZlbjpvhsVjq1zQ9YtWcC9vyrgHgavdwuYjB0uDJw6T6+eUvju8ez776vFpZs8KI4UbnrKugzZGxg0MI8e+JfopkO+3BDT6RI+oHyCR0pkDVfjvA4J8Dr/JCF5lVcZYEm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783716976; c=relaxed/simple;
	bh=KsztTcLL1hh9As65BcDTh5Y7TjOnYb7YivozEbWiMmA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uLJ8rPl36pQzg+zL8QSqhTUBXJcVRbleJcW/m6mWnuO5NA8gpvGxdcn7c+rS+9zUhBXLVh7NJ+MGPgP97ptxtyds/LIL8vC2Dpv+raUFdE7MXOIoItWT2o3nSV2MctczsGEf86WrokECqznsJnEgzEgYFTbIaYV+VXO4B+U132o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AsnlYnKE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AsnlYnKE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783716973;
	bh=KsztTcLL1hh9As65BcDTh5Y7TjOnYb7YivozEbWiMmA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AsnlYnKEb4+9cZLy7mzp7QAshUqMTXL9/EbdW3DuunJuDxdbrpMOeL1FWPDHPPvR+
	 Cxzgb3felcLaF6Lu4mhE9gH93JLD9e8MPz4lH9/vgwq1Vimxj3KXCFwyMF/h4zTUMm
	 UFb/9duz/3TSeYwaU3hAuk6ik15A2DPWsumwP/6GY+HS230VrOz/RJkya3jGxKWyGY
	 TwBIuppasQHWCwxaAQv3eU0X7MaZPFIjyxwAf5/9e3i2tFKXc7KIbGcFPLyxdMwUrI
	 mVw6Aku2yLhdX8RZJyrEmmfAZNtooXlEe/0JnRfQV+GMCDmkCHGAfmSqJh8lxHwci2
	 LFfc8TgHc1OqQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 13FEF17E0720;
	Fri, 10 Jul 2026 22:56:13 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 02912480064; Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:44:56 +0200
Subject: [PATCH v12 18/36] phy: rockchip: usbdp: Rename mode_change to
 phy_needs_reinit
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-18-8b41a9a9bef0@collabora.com>
References: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
In-Reply-To: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1831;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=KsztTcLL1hh9As65BcDTh5Y7TjOnYb7YivozEbWiMmA=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdnKMGlckTMit4CKUXquYmHJn7bDwh6N3
 QCRwH7JCCLelYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHZAAoJENju1/PI
 O/qaVUUP/RKGEc58xxEWdv1e05CjoEyyVl/NtF3LV43Blv0Rr0F8LAyJnPHAEyHZXDsgUIdC3qL
 R+SDKy8GPLvGJovGEniewLnVE808qs45iyfHL2QNLBrZxexZApBB+1qJsN2c/viXCs6FOuyQTeq
 k8VLrL4xA2nmOEoYcX5OVYEYQyYyzWzWFtP7IC+zqr8xFAzrPfqp3cq2RVFsGuD87JL73+kvNpc
 e1KPphOsi7rW53oXVXyp1n8gvspuIbtSUkAdvSgmddz7hH9RG7DPnGCbxnZ0BQXrbs9QyXHi2XN
 NGwG1zPGpDjCKHnDBddwoDiLoxg4IgI3QLs31mmBMSjA7D3wt7kDdq4JpqGhq/jUxd8DjPKwY6h
 HTfDMBdShp0LXsQCW8ICv2uDJmuuxwSEwO4EorhkMlB48lGLr1UhVoTd1NNe7pk6s7qw2wG5Ym8
 oErzKqkKcuxon7KRD0WZE0WCoR9WISO6bpuyGgUyHtMiOsLuFt5eEM7x2yM62XGF5EF2fHO4vXV
 BqpPUzXzrIwClZEnf7G+pkuUaiiQY0x88VReUWCbep1TqV1MAKPPkTKzNVkK9Lp3GnEIHW2cV9e
 J2n5OzOSOCYo3PXKoNceJ77VOcIkSerpj4ssCTR42MlFQfmUIp/q1vBUhqeBn47PTMuJznctDb6
 b/oFJibv47hP7sO+5f/M0Rg==
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
index 24108816e3b9..e44d19c9d119 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -171,7 +171,7 @@ struct rk_udphy {
 
 	/* PHY status management */
 	bool flip;
-	bool mode_change;
+	bool phy_needs_reinit;
 	u8 mode;
 	u8 status;
 
@@ -578,7 +578,7 @@ static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
 	if (udphy->mode == mode)
 		return;
 
-	udphy->mode_change = true;
+	udphy->phy_needs_reinit = true;
 	udphy->mode = mode;
 }
 
@@ -951,15 +951,15 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 
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

