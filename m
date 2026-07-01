Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A6B42643D;
	Wed,  1 Jul 2026 23:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782948961; cv=none; b=T1ci4VlXjQ+lA/H4nK+NqUaXTuEpPt+/C7lgxFGsSzD75NCIejCYqEgIza5fcaMoEq/r7Q4AY3lxpbdZOJuG4IcNnFai75VIoZDeVt2h/19qLUZtyJGvqGkH/Vrh2NkTmGfeUckhLl65g6FPhFQlAt2xZ7UZ5DIpkh+Shc4u/PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782948961; c=relaxed/simple;
	bh=dIroGrHc9sFXK1bNgNMwSvW11AbDOuZpaYHkw2BWwcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tRzY1/qi7cs1k9xq51sJpEx/AJgWiJ2lHDazO/VUXF4ANV8NtxkhNd17r5lszmiWVd1F/wiLKqG7jDjKNGD3YWWXxVHzf0XFQMde5lb619mmuwYfTh1t/T9edBlyzuaQCCXS6JLC3LerPHft9YyvvZfdW4FKx5fXvq3omNI3mxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=iX43+sf+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="iX43+sf+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948950;
	bh=dIroGrHc9sFXK1bNgNMwSvW11AbDOuZpaYHkw2BWwcQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iX43+sf+m0Vpbou+yCxm8NfivfbT0cngeHGRsH52lnpp8XuJ4BsNxdUYBUp1blB37
	 KoUQtxiolyLqQ8X7904dMsCjXKOrTHUORiKBmznXvM7e/xxfBf86y/cwO5Hg1oVix3
	 WwWMg03bp/zxIO0jXfz8GeDhxjjhgFC/+e0zfHc/CEbYA51QI5kon2u8K0UO4MnVY5
	 8givIgo1g2S7+HYrD7JxJZWywzaAega7jbrZSKSHoOzl9qw+wdsnc157qHl1vjslP2
	 f/54jhauZXp/npfWj4cg3K+ckmbQNXGioUAfCeVb6eMR5LjCL50Ii6khY63IY/Klte
	 vjOzcc4yorBMw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E591317E35E3;
	Thu,  2 Jul 2026 01:35:49 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D194C48006B; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:36:03 +0200
Subject: [PATCH v9 25/38] phy: rockchip: usbdp: Hold mutex in DP PHY
 configure
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-25-e31efbb62d2e@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=dIroGrHc9sFXK1bNgNMwSvW11AbDOuZpaYHkw2BWwcQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFRRAhumZ4QbtEL4NGs2RQjMZXWti6n9W
 8wYg6SoX1V7BokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRUAAoJENju1/PI
 O/qaa8sQAKh+ZneJ3Wt//kUq2tquvEUjyeA63OLGbClfj+fEIrxcnAgkwB1ZA1NEGgIp8DuBuKd
 VsTRsh8rHCsMhhl2o9tzZlTsr3pf28TxLkZh1oJ73/eJyJhe7uWYxSSsPKmggy36QHoOoZg5cdU
 SJZsDnbOUjcduT1Bu5oT4e5fEv41v+iXw4w8gd9MrbZrTPFaX1WAs7XR90pyksVE4/Z2hL0RILl
 C62uU5ZtP5umkD3o+oWWXkI8qJj0S114GV7m1Wr64i2kcvZOV/xts99VeOuJ5Ug+xvvwtegcvva
 wFfbFLZoq/GBJZOwEetcwJekgk6si8aPhyYgmQzToNFgxsn89RzOp/0Xc4icr48bNcAtXNCzU51
 ImARkJMWu5v6XRdlYuaMuFXNJ78bH2A2WUd4JIYuaV+VF5PWIp4SceO8m6B+txYLIPSCBV9Q7Hu
 KSaMHsnudYnYsRFvPGEwpXZnV7yhEumlepb6IdmU3NVu5A+OvURmZWxgukpcP6d1RT2XhRQBTzr
 6+6cLDdXAuQP4heAlMcETstKC6iGIH8IccmqbVDgX8sQmM+s+avv07F/s5Z/KpPvXEYp+F2CfZi
 yY2o80pLQDhUmMD6WVvctqeWJ123a4m8jk/Y1w2SsfB6zws2d5XoaCEEtXrx9as1fSK0kgv+iC4
 7flpJSEQfL3I4qrDjEywzTQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

rk_udphy_dp_phy_configure() accesses some variables from the struct
rk_udphy, which are updated independently from the USB-C framework.

The USB-C mux/orientation switch functions already hold a mutex to
ensure mutual exclusive access to the struct rk_udphy states, so
simply hold the same one in the DP PHY configuration function.

Reproducing problems due to this on real hardware would be really hard,
but could be possible when quickly re-connecting the USB-C connector.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612164627.23D391F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 1a983c1cef4b..c874dfeeece9 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1190,6 +1190,8 @@ static int rk_udphy_dp_phy_configure(struct phy *phy,
 	u32 i, val, lane;
 	int ret;
 
+	guard(mutex)(&udphy->mutex);
+
 	if (dp->set_rate) {
 		ret = rk_udphy_dp_phy_verify_link_rate(udphy, dp);
 		if (ret)

-- 
2.53.0

