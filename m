Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795615846;
	b=ydtcBqL6o2fmWc51Hg+lSehFEjB3QVkuZPTP4IkKBZMzbB8PXQUF07LA1K4fTZugos4M
	 T5x7sxcpnKpfT8wk33EHJnQ96sHPvD0/X+DYgDe4KOHOTVQoICfXWy39HaLfywNlWali9
	 H4hwsK1idw6a4lRzC5+3J4luFjoZov/74LKILLcAydrqm0p0C9JwAlvMFdSINT2m4xynx
	 oLZfwVkFoOCUiU0nKzun0d+/TpkI+cXRKAC01bVk6OTy94fddKWxFEl2lx/k3MGzBEfRz
	 eq4OLgksLUkx/V4//u3KtBMq49a+qeOd8cWpw9PWOfBYvBqHKrRzV8v89Te+fRbDfNw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615846;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=73kaX3/gJU+TE1/qYxJBWp5+fn83LX1wOwAPpJeJd5c=;
	b=dIEUpuY3MrpWOA4P/zjqCwDmSOdhAbLPyV7ttH6iuRCKCb5xDZeOzoOH6Vt4jXOjsKUd
	 slXMlDBxRghI4kvIKF60AGhN+pCcGNur9wwSRVXE+4UmK3cEmC7bKvv6mtwKQ5sSVP4no
	 nwfNjnOIy5RpUu2a1tjghjFgQ9i3LqboOPZSDteCLcPUHGHjIXsLcAl+wEP9vJJVillTO
	 fEg6supgx32CUCi59MFa2DEaTg7VXVqpV8M/glbO0Z9PavPeZHrR4RSNJO4hER9vAcxbJ
	 08Acq2kV65aZCGZi82vcAdCVmnUVoif4tFTQVZZExOXc+JEsb58MDqq320tZfJjoXfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HNcCgFPz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAC4606A321;
	Wed, 25 Nov 2026 14:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HNcCgFPz
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795615845;
	b=ovabdTNEScIkk9nO0e7c9WT0G7tF885IaInM1eOk2XIHQBxBxUNM6cyiqR8FAXXxFWAa
	 JQzRInL3XlwRXPY+BnjQEib4OdShtm4h5blnwhkhRE7NDwZnP/ggKCiuW/LhNtT49Nxqb
	 bQMYu3lHqUlYX3CRWrHAE95ZAnmkc6O/95m1XQr76agwOZEsXM42/Mb+bi7/XHnM+XLLh
	 ySyWyvLv/5Qd2FUoE3gPVt9GCLwFF97JbSTYNqhV4N1AYCia/DtDqMz2CCH1Gf0mEaD9c
	 /KtUu9sutxssngn8dp5z+y5YMhoUaZ8cm6HhoJznObpAsyCOIkbExQQ4qHQnwcdRpJA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795615845;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=73kaX3/gJU+TE1/qYxJBWp5+fn83LX1wOwAPpJeJd5c=;
	b=ibuYuNDKI8QYBtRvSlIyGhT3Gg+E8/c9QadaaPoVfx0w5XuX4f5QnWjQdnR8e8Z/LsSN
	 Pk0lYfCIh91tyY8INSCaA8XmMdb+z0b/F7tPqCPFa0wy7UW635cunxLawPrSUGELHGfnY
	 NeTpH2+1sgwehVjF3vZeUdzAQa1n1jrW1hJlhNaVpiXZ5lg5jc+9406tkX+fl04lRaMBI
	 8iUrEp+mOwaz8ygAGOm+WsLwVIC1AeRXP9f0OUluM/6KrjHn4Yw89meyvFE+qHVmtSN2W
	 r+/2wJRfaAEPMmbaQSoAM078+ANOrQNft+wPpt8pQhIQkC9avvXM1ZRYk57AoixKmhw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9DB1F1F000D3;
	Wed, 25 Nov 2026 14:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795615845;
	bh=73kaX3/gJU+TE1/qYxJBWp5+fn83LX1wOwAPpJeJd5c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=HNcCgFPzY/Nx1ao5oUePXnanKkk1CrtqbNpHoJEUNJyNXDZYvPpvdP97XOOj3O178
	 2HUK/4G927S4M7XM+kW8Zms/fwt8MU5qThU6LJB6i+5F22g8RcSgdHzRcbAsuoDZXg
	 V7mq6GEiNN3pWet1EyBIMErV4vp4CGqpLa7IJAHfUBBR9lDePccnsYjKieQfpGz5GG
	 KmPkBwsCfSKQI/6SxpLKTFYsKRf+iaiPjcCG8IATZytO2CiU9wZCEvevX1ccHd4yls
	 PA+vH8CPTUdLv4Lnfzll/4Y+A2u0Y969oV0NsTfb/wCd7ccLpWq32hOhswMZd0Gz67
	 GV76MtHmElYEw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 273A64CEF6;
	Wed, 25 Nov 2026 14:10:39 +0000 (UTC)
From: Bobek Brzeczyszczykiewicz via B4 Relay <devnull+admin.roadbobek.com@kernel.org>
Date: Wed, 25 Nov 2026 14:11:18 +0000
Subject: [PATCH v3 3/3] phy: sun4i-usb: Fix phy2->clk2 reference imbalance
 in sun4i_usb_phy_init()
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261125-usb-sunxi-reset-fix-v3-3-855c43694f78@roadbobek.com>
References: <20261125-usb-sunxi-reset-fix-v3-0-855c43694f78@roadbobek.com>
In-Reply-To: <20261125-usb-sunxi-reset-fix-v3-0-855c43694f78@roadbobek.com>
To: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Felipe Balbi <balbi@ti.com>, 
 Hans de Goede <hansg@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Bobek Brzeczyszczykiewicz <admin@roadbobek.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795615875; l=1149;
 i=admin@roadbobek.com; s=20261117; h=from:subject:message-id;
 bh=2/RvSPv9KdaGKCqwuU1CPvhUhe3Y2XomCyvU8DfERlY=;
 b=ocSYCrrc2L52i1L2hwM5KG3OM5fNqH5g0u+XCJpMlDYYjs1MWgFkLcSL+tZk2dIREQyt3b38K
 R0KCT0jsMv6D9UODCAba35OcD7RBvf2T3rSRlUr1Iyo9SyN+TmIbMh9
X-Developer-Key: i=admin@roadbobek.com; a=ed25519;
 pk=TcWSTwITMylwCZLYbw80sv2LQx1zButqiT90TFVvhas=
X-Endpoint-Received: by B4 Relay for admin@roadbobek.com/20261117 with
 auth_id=1548
X-Original-From: Bobek Brzeczyszczykiewicz <admin@roadbobek.com>
Reply-To: admin@roadbobek.com
Content-Transfer-Encoding: 7bit

From: Bobek Brzeczyszczykiewicz <admin@roadbobek.com>

In sun4i_usb_phy_init(), the needs_phy2_siddq path enables phy2->clk2
to access the REG_HCI_PHY_CTL PMU register for PHY2, but then disables
phy->clk2 instead of phy2->clk2.

This leaks a prepare/enable reference on phy2->clk2 while prematurely
disabling phy->clk2, causing a clock disable/unprepare underflow when
sun4i_usb_phy_exit() later runs.

Disable and unprepare phy2->clk2 instead of phy->clk2.

Fixes: b45c6d80325b ("phy: sun4i-usb: Introduce port2 SIDDQ quirk")
Signed-off-by: Bobek Brzeczyszczykiewicz <admin@roadbobek.com>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index a62558124d2d..6e35eb77c879 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -318,7 +318,7 @@ static int sun4i_usb_phy_init(struct phy *_phy)
 			writel(val, phy2->pmu + REG_HCI_PHY_CTL);
 		}
 
-		clk_disable_unprepare(phy->clk2);
+		clk_disable_unprepare(phy2->clk2);
 	}
 
 	if (phy->pmu && data->cfg->hci_phy_ctl_clear) {

-- 
2.53.0


