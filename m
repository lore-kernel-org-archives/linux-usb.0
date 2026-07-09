Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1FD3CB8E2;
	Thu,  9 Jul 2026 19:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783623761; cv=none; b=tg8WDK+rAAkHohvnA6bJP9Kksxy8phi/N0vQGshhgmLKnLVLPwI6w9FGK5oqzdjiUsu5J4jyxf3/GEvkNQiK5EhPjPG5KNWaiJl3AjDq6sfJnnyyw9v8P1QLdH+mT5JxfZWGnAS4/l9ghUdXtE8HREEtFIz+OXTBCql5b2Kc0lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783623761; c=relaxed/simple;
	bh=zAIpPhnBqJTD75ki7fc8mqrG+OsdwFQx0MWSBhIwC28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tX1cF4eY87re0B7LYdK15vmWv90MhOmNIVH8+AcsmhyVLU52keEj5nmIRg83OK1iYkTa7bUINBx98z5lMELCe81AKTeQ4L0544NcdWS9hxHiL104WXbVBcGvF9mSQX59GJOE2ue+/eCNK75XXiGWbYuvJw+pTR8eE8rjImI5FhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ELam322a; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ELam322a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623751;
	bh=zAIpPhnBqJTD75ki7fc8mqrG+OsdwFQx0MWSBhIwC28=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ELam322a6jPqmycCmg5uLQxLpIGe+qschMJgTv66UWWusil457l1sQGNe3Bv22Lnj
	 4hKcWsOdfeveiW9GXgDt7MsGszCc2Mz2zTQOLUHLtTN3qlXe5kTM2SENYMumsjmkfq
	 ebN+V6MArocX7YTabVj+Ss9SeLT5Hv0FZfkjrL7j1IXulOva6vyopB70iD+OerAFbK
	 1g5us25stgYVP1ZjLqnYb97U27lafUWy9CmaNU8IQdbJ/FKXW7VV0tW031M5L8k19z
	 +vdYvwQtrjr1emOnEAF7MqXe6CNCGIj+RrYXNct3qcfPZ6G7b1jKVINV0LaDjHyvqq
	 x64ZHzdMX4GBw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E2D8C17E1078;
	Thu, 09 Jul 2026 21:02:30 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C99DB48006D; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:49 +0200
Subject: [PATCH v11 26/36] phy: rockchip: usbdp: Avoid xHCI SErrors
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-26-a149ac60f76c@collabora.com>
References: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
In-Reply-To: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1810;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=zAIpPhnBqJTD75ki7fc8mqrG+OsdwFQx0MWSBhIwC28=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8EUsqxDjyRpYmP/KrlICmmaxYzsBb1exY
 RFPTxNl4Yyol4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BFAAoJENju1/PI
 O/qa1WkP/0GrRF7v/bnHHnjREPF92AFSWya2wTPYzjOYPZ74aYdJjnjGxizciFrIB8atC/BKotR
 NKZQ/WSWTbns+caQ43FJqJ3dmtp66jy9wo/WRQ98Oj5FWX3l0CSdBCpvEYpmLQJxZtHDrOnpwRi
 MTLyqD8nE/fA3Epsz682SFWYXmjmpgrzySWoXyY3kiQhzpJ2eztQCu9NbAyiwRTf9gGd+IDLakC
 Z3Ip6tlXD3YiVa1WSC2dK7JN10a5avyseQBl/P/6ZQSVMrdgWEkoF4g/3efi2MCozPK2TkRlISM
 olthzv7MGlgPh9wR7CYmMlnAsr+TKwV45FZS/qSlB/582KzkuCcNKSgsu3uP81DlBSjIWVp2xUq
 NSKxrfLQi4wW8UL8TFVTHm70bl/pP03UfEUrRKwf0JSs9KkfbRUBc/Ern4kvg6np8wFQ4aeorhq
 LSErqdSpz7e4SEnfT6pUYs/qmd0wOiDcU7y9LH/0T3Y3jHae8CY7YTSilFs9JmH5ZsJgg8/EV1X
 NNQ6wDVJeV6+VbdrjGvKbmOWuvUJtutFYgEWtZT0j9FHO8EHhKTzMn6r7CQH1/BymZWEVVv/KRO
 d2Vkmba5qwrz0livLMVWRJSiB5D/5TSMRKrEv/ZEAXhscdZFGroa+uSlvjJxF8ddyVqh13libZg
 fIsEVP3JoVpgcX+n5hfMt9g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The USBDP PHY provides the PIPE clock to the USB3 controller, which
means the PHY must be fully running when anything tries to access
the xHCI registers.

When switching between USB3-only, USB3 + DP and DP-only mode, the
PHY must be re-initialized resulting in a short period of the PHY
being disabled. If the DWC3 driver decides to access the xHCI at
this point the system will fail with an SError.

This patch avoids the problems by disabling the USB3 port before
re-initializing it. This does a couple of things:

- forces phystatus to 0 from GRF (not from PHY)
- switches PIPE clock source from PHY to UTMI (safe fallback clock)
- num_u3_port=0

The last part will be ignored, as DWC3 already probed, but the
clock re-routing will avoid the SError. There is a small delay
afterwards to make sure the mux happened. The datasheet gives
no hints how long it takes, so delay time is a guess.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index edee27933d89..9e77513643a3 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1000,8 +1000,8 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
 	} else if (udphy->phy_needs_reinit) {
-		if (udphy->mode == UDPHY_MODE_DP)
-			rk_udphy_u3_port_disable(udphy, true);
+		rk_udphy_u3_port_disable(udphy, true);
+		udelay(10);
 
 		ret = rk_udphy_init(udphy);
 		if (ret)

-- 
2.53.0

