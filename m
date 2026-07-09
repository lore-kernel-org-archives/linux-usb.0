Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CFD3B2D1D;
	Thu,  9 Jul 2026 19:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783623880; cv=none; b=sd8pOxIVcFbDE+OpChjyEMmYmKN1HqRV309YEnaLOjqoOMDJY54lJt0rsDHaWW7ryRxKe5Hmzg8fQp4kT/NrKGQeqF04SUoQjGy9bwxzh7nZIBhzOzIQMhGbXcUZX9SxC/oFMRDioIp2U8kJb6uwpGST0chDb9SL1pUWbMrC59Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783623880; c=relaxed/simple;
	bh=l3uTaVmYXyzz4C+Rff5MIwMgEtWsya2jWgKHFq2XIA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p2+cOaxNhPBbMo7UatjE1zcK8DNeTLQdtIQ9l5Fgusn2gypPOR8Azjkiz09kYplMikmIxNrzjvYkdHJPv3GgK8HMon8Z2pQfP7pesqGNGvHO8KAgOG0fCxseVfvNkoGSym1QkVpD9Sg8Xib1uvYZmc4J8Dd7xhWrjjGKd1QFvic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FEvwfcOZ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FEvwfcOZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623874;
	bh=l3uTaVmYXyzz4C+Rff5MIwMgEtWsya2jWgKHFq2XIA4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FEvwfcOZO3yQK3DiiMDhDND7yykIMMlOxic8HENk4d5wL/xF/qxib5/wweZfnP0WO
	 eaY2GuFC0JpAWSyOw/nV6wIbqGQpVDA2xVmekf6e/KEshj6Tvm5qW2K3vJ1/OTjcFk
	 FDWDj/VVJ3jg6VtVcJMqSfXx+B+166GWUf++X93Dei0yCi9kmnomO5ltFnU1aPyEZX
	 7xu/MeI8iavFE12sQOOGEinrM2GT4xNOUFzBqTHGc+BSZZBd2KOjVchBDVVF+wxUIn
	 1ZdDUjrv+XUZhBF5trhN4m4SHgRdHvGZYUjFUXdCKmsj6BbsSKh/eD25ySEqPyS3MB
	 ozMDjyRRZGYJA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6B7E217E0E04;
	Thu, 09 Jul 2026 21:04:34 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C1B14480067; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:44 +0200
Subject: [PATCH v11 21/36] phy: rockchip: usbdp: Properly handle
 TYPEC_STATE_SAFE and TYPEC_STATE_USB
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-21-a149ac60f76c@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1759;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=l3uTaVmYXyzz4C+Rff5MIwMgEtWsya2jWgKHFq2XIA4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8EUAH1cmb7CJr1PqRzQdGafn8xDNtWA4A
 O//cDuJ2Gln8YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BFAAoJENju1/PI
 O/qadXwP/jrmkAC7He1d0ASid2gBRlSlrL4w7z05n/vvWee2wdd+52QY9noYqH9S+iafwoIWce0
 qEzkjgN6k1VUY7uccwqSoq1Ekn8DwrFsWNkJ2WJzFQGjSrCyKubTmFpAKbKA3dXarteAfuymPr7
 NqHWjJQczmmZD+yn7rkboYtf/NBNblLiGQAIHIU1Mv7W0OCr+xvbV7457IQBNB8XlTUSdYoVKdv
 sI16GkeC+KwUOPcnVo99qucxn7wIMTkBSeitUIdU7QZQH/Z//TQIFhDqns8JNy3N6vD9tSAL8aV
 h0ohlbzX1Ly+EDF9GIuhJrsxWgTHcz3JP3MuDrtlzlTnFaofCLVpZxNLIT+g1E3LMPIp65efad/
 0Cju4oTtqQkb6B5XxSi0S4W2OZXmZerkRMwO/clvjM2WoMttvfXXmDI9z1J4Yz0pelQLe6rBpgL
 bG1XCUQbyjdlvyw2f1JqnWa8jbmqmtCBQD4yf6EX1S/8sl5t+0Xl0ZqgX3Ysnu9wHgaY6ved1jM
 D0MzOxILZMivranhzOee7QRR0L379NINLRl60Nshktup7zQHki4PLLAfEwNicl/XPImtml3sr6c
 Y/9y1SP3wz35JezzXrpyLNDUUW2pmlFWPf8MAUGjXUeEXQ1PStdPI5a0kJV8s4DkOfkr/2Y48Ri
 CKc3pU5OT+8LJ3C/gw7w1vg==
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
index 4e54020d1755..0399cbf96e19 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1293,17 +1293,26 @@ static const struct phy_ops rk_udphy_usb3_phy_ops = {
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

