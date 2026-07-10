Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C36043CECD;
	Fri, 10 Jul 2026 16:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701991; cv=none; b=g9276AgUdnpFdxRcjo08J4vScnwGe3VGlCjacxEylmtRbQZwvGz7ObDy3TdrAXMJJpqqKb+k8vF6GTSLCdjXubw1L/NMWEudjAwy/RcK55e9i5ydZXaUtTuPmDwGjJsGZ9LUSupLa2K9xfrHg+jFW0G4N0a662sFPJHiP4aqPE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701991; c=relaxed/simple;
	bh=p/Hx7Dq61GhbEna9UzxVrHfH1lhodjbwQzayZC0Idd8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PIw/TjU/Ewtz56lTdONVF22lEYqjgDot56+/lEwTfX2XuO/hDc9vZC4kok0rC0XhMF2hfZyOroasMiNopnBeMXfzzeHISP4yyIGyuE7Wg3LQyYVmEtMMDQ0F1xLhjHnQbbSNo2HcYK/+SGKiTyCTXTB1z74sW2P/lqd8uExShNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=XFO8By1D; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XFO8By1D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783701978;
	bh=p/Hx7Dq61GhbEna9UzxVrHfH1lhodjbwQzayZC0Idd8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XFO8By1DJ/gAVp+WFYrD6tBjg3DLbe0FQoFrl+v/HkTV8kSEHcFSXDpSYrJ03hwOj
	 rl9UN8b/9HO1MJ1afBbopyjV5GjWX0UDshAfQX13RyPtseOIY2szsS26wltb7E9U+9
	 2ZYNDCJMW0HUNN8D3D8FSGWZFNg80VNxFUhgpItaxEwuwPZI21UrIy/wbj2ctsoiGs
	 sNkfrmkK93uEfxwu6eIG/KF1gsE/I4sa0mzsZbo/g2xm2Yc4YCkRC1+/VtkN7N0+0/
	 0TIAGpzQiZufTK8oIuI29yYRT4FjMpKBjnt/ZJPUEEjmy5VzN7nfuAts+wpWmEjtxb
	 8r4CTjqp94wjA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9B9D217E0FD0;
	Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id EDA5748004C; Fri, 10 Jul 2026 18:46:17 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:44:50 +0200
Subject: [PATCH v12 12/36] phy: rockchip: usbdp: Limit DP lane count to
 muxed lanes
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-12-8b41a9a9bef0@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1284;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=p/Hx7Dq61GhbEna9UzxVrHfH1lhodjbwQzayZC0Idd8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdj72DDjkI9/sX7ecpjWBaZ0uU6L11Adj
 JQbaNK+mlmu54kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHYAAoJENju1/PI
 O/qaESkQAIu0jxdbXqe+fqC+khEjIl6hvyv6VQwFYdaXEdNsfvDfm7FfPyCchwQSwhSXJlT/8tJ
 Y/BY9dJPLvsR3fxhTmFk54Ux1nJL7GAX4v2seAFW76k0Lj+x8aVrmZJA4U21e+WEuJ4sDG7v9mO
 E5cftShB/uw33/pTzJcskHFjfxI96EWMdCloEBbS5nYzIZUbf5ERnMGnvydSyPXC/LwY0/JGWo9
 LCne3Wsyb08LBDbCTOwB49UmLw1g9hjdRknPHynmDjbcc9QHlTX/NUIDvATjuYvB8GisALP49XL
 FPWDio3g7VerJyDDOGtd4PvR0PLsdfLApHqlb3fQhgKaMkSRyttNCSv8d/5QbxwxQ0VTQKrNjF3
 VtpAcVcesTRZ/kVomqXvg3brQfKKpr7YleJbqKEN/M/ESzbTOj6lBEvNe/TZkCpfydc8jS/Kt0u
 V+XDUP6egbnYmwj/K23LpPhvXYWm5G6lZ598AvpFzGVKDtJBGWHz5qiesevVZifjqV4ZpgNMpEn
 YeF1PR7m4O8uAT3bCm5Y2BnesXd+BGr9YgHHoit1zxgqjAxAtIvU2w1Z/ioOO1dMgrNUaGfS4zl
 AqbruJg+tZn9jnE0Z72LDSNT3J0dEaS/ogMBQ8fps7GOUu7IyFqVQ0duuu0PK7G6b5FMiHZZs71
 iMUSQM2GUxxvlMt9L82gxJw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

In theory the DP controller could request 4 lanes when the PHY is
restricted to 2 lanes as the other half is used by USB3.

With the current user (DW-DP) this cannot happen, but as the check is
cheap and users might change in the future protect things accordingly.
Not doing so would corrupt USB3 usage by the following code configuring
the voltages.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612165546.98E1F1F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index c4d62b234ea8..b172ce6a722e 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1099,6 +1099,9 @@ static int rk_udphy_dp_phy_verify_link_rate(struct rk_udphy *udphy,
 static int rk_udphy_dp_phy_verify_lanes(struct rk_udphy *udphy,
 					struct phy_configure_opts_dp *dp)
 {
+	if (dp->lanes > udphy->dp_lanes)
+		return -EINVAL;
+
 	switch (dp->lanes) {
 	case 1:
 	case 2:

-- 
2.53.0

