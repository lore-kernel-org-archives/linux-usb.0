Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0E8426413;
	Wed,  1 Jul 2026 23:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782948959; cv=none; b=Zsv5xkXd+f6vP8FZyEUlL6t6RK9OOSGAl3yRUjkGyQs34AIq7KwExyic6+5ksNqmR6FD67rqVmSU7AkHg6kT4uv7+oFtNcKGLoXJc0MfwqRuIUno5wTFE0V/OHmdnocESRfWWfHo4uTyoqzVa+Cqki/eyQZ983MLf/OMwDbg7Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782948959; c=relaxed/simple;
	bh=pwFDwrpgZY9t8TZsmANZyOlhkd/wcOwKPA161Wos6Nk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oEDyDJxm8o4SCnM7jHNaoT4W1iC1Vbfmp5mjaXZ3dvk3r4inYNeSbVnniLWycdwNRjHXvE42r2zTltAokqLn/pNpnWty2CjXaaEEqjqnTnXE06bBT7uYCWouAG1MYK/8ifXH14FTtaaIR5m4rwhwFAcTn8ZtefrBqMjiiWw5o10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QIxb7Uak; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QIxb7Uak"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948950;
	bh=pwFDwrpgZY9t8TZsmANZyOlhkd/wcOwKPA161Wos6Nk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QIxb7UakOtZFP5hehJHhwFM1jNiHOnYErV6AID3UPqtcoABIVI3SjjmLK30/y5BZN
	 +ojQSsGolHLa4Qcr7x6KoPuovTuae91y6QQRX3WtZZclSN5bABatA+aCSO+xzsc1rx
	 1JKuSaQmerPfBSihxPnEyvyFKdOQn07CsMhl0uSgYgQKPRGNTy94dm418TXr6uHwmW
	 kDMHuQtv8w4BNNbg47z98TazEqA9BsazmEoHZBwAxtGjaEl+4i3Ei/H9b0s5sAcI+b
	 cqyJFasZdF7Fs3jVHGQi9ndNsILQmugSzlwZc0KPdNYjEfFDoo+5qx/VN6+Z+OY2Fc
	 UvpffkGMKdgoQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CEEFD17E35D9;
	Thu,  2 Jul 2026 01:35:49 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id CD2FE480068; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:36:00 +0200
Subject: [PATCH v9 22/38] phy: rockchip: usbdp: Properly handle
 TYPEC_STATE_SAFE and TYPEC_STATE_USB
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-22-e31efbb62d2e@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1759;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=pwFDwrpgZY9t8TZsmANZyOlhkd/wcOwKPA161Wos6Nk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFR9w8ULPwm03F3eNYgRjrqpqIpkxwdGl
 Ps7Ti0bRwDFa4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRUAAoJENju1/PI
 O/qaz4EP/1CYWU0b8Q4ekLkP9CiI5enWTIBand1oo/jwnYcNLT3cEGT3ABrpsLZEaXRetLr0SIx
 5Hox2f5+7n1d0gHIp1PkLzAGDHUbtpvdjv+Cdb6fdtVmzY9iappGusm1V/8Jr+3tAp5YYohTKRu
 EOZqCU6dlkecbFHGlDkVGAyNd+OE4L90zc4GFiLtDN+u2eq91COBhGjT411DDRmfdXWRYVHI/2/
 z92F+HRZmCfMrNQfRn3d+onf4x0fpLDUcoGBpU0GNKKOaq4p8YuQvO006mquR9gOb/WQyqsUDmy
 dZoq4boNzCpS6GLzGGiQyobKKp0ztsyfc9FqpIp5JqRKQOHjsnweVzuuphiY3tr+PebJZevFFqI
 2XZNlJ8BRdY38iR1rHjFQnSUKEIg9xXlRUrMkyFmuRH0Y0y93Pt1XhG5qwD6AcOsHJiwyWWtQhO
 qz8UEzx7t0MqgNwL0UUzMhA1TDAgCTHt9nf+5s5UOGKIfWbS1nFakKXxuAJt1rn66E7GWf6FviN
 ypIxwDjPVdnbyeIZ2J7ZmQ3j6ZDrH5ZVyvlZXn0zi4BMOXflNfWAq+08qmnRmrQ7augK/yxF/uA
 ETRhIrlfu9GjYz6tvbpc7HVtAuYN7KnhmwlWo3aNj0IL1MMuYWlaCMURaVs10JWvYim4lDQoAVO
 sjYju0UKDvwqR1FLINdwsEQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Handle TYPEC_STATE_SAFE and TYPEC_STATE_USB Type-C state events,
so that the muxing is properly updated when exiting DP AltMode.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260619155020.CC7361F000E9%40smtp.kernel.org
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 70ef02c4a187..9f0c0127e6d0 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1329,17 +1329,26 @@ static const struct phy_ops rk_udphy_usb3_phy_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static bool rk_udphy_is_supported_mode(struct typec_mux_state *state)
+{
+	/* Handle Safe State and USB State */
+	if (state->mode < TYPEC_STATE_MODAL)
+		return true;
+
+	/* Handle DP AltMode */
+	if (state->alt && state->alt->svid == USB_TYPEC_DP_SID)
+		return true;
+
+	return false;
+}
+
 static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 				  struct typec_mux_state *state)
 {
 	struct rk_udphy *udphy = typec_mux_get_drvdata(mux);
 
-	/*
-	 * Ignore mux events not involving DP AltMode, because
-	 * the mode field is being reused, e.g. state->mode == 4
-	 * could be either TYPEC_MODE_USB4 or TYPEC_DP_STATE_C.
-	 */
-	if (!state->alt || state->alt->svid != USB_TYPEC_DP_SID)
+	/* Ignore mux events not involving USB or DP */
+	if (!rk_udphy_is_supported_mode(state))
 		return 0;
 
 	mutex_lock(&udphy->mutex);

-- 
2.53.0

