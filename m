Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D37218AB9;
	Tue, 14 Jul 2026 19:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057730; cv=none; b=PUsbmZJ2/0XszNUG7/vYaLju2DaA138yBB1CDs5L/KtICdoZcl0euzi+GGE0TH7AHpc/uQODLRtL2yDnfOwwjEI4ZqlStbDjBb7GeNQmambPg4mX80jXkzH0wWoz5kZvA3ObJ55zW0TbrGU94d0g25S7RXP/YWDKTG6wR58mqBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057730; c=relaxed/simple;
	bh=l3uTaVmYXyzz4C+Rff5MIwMgEtWsya2jWgKHFq2XIA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PWoQodhcrr6HWyjrYSpjOa9nfCm6LnNu5U3O/iKNAs+zPoE74HDpO0pkwuFoKerPcSW/SHf8GtoCf+jhGHA4XUHvUCCYXC6wtdTUGfTmVZeQvJPv/2SXJGkWXilegc7Qecp8hCcQaZNEAwWTP8tEKgKO3MrxaL2TETU7G268M4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ful6Ju9c; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ful6Ju9c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057725;
	bh=l3uTaVmYXyzz4C+Rff5MIwMgEtWsya2jWgKHFq2XIA4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ful6Ju9cdFmKNPUEEKH/zFllOJ/MQyVwPbqDMcOdkNyXZTP4rQWKL39A0PVaNWOvK
	 epw1m6Y9yQbK8sckHKTSDYFfsTpTAUBs9+mMUy20sK0lFFQYQkiVktT26ZHTsXLq1x
	 oPujTX/40Az7AQ7o0ieqmWKQdK8LuEwS6x6E9qaHagg6Xj9K6zqLQBRb3f7m7iFwPZ
	 Jzct7j85z0S2NxyfGcuGsoGAxQ1PY2HZnx00/K9QgKZGH09ATfDxQvtNhI/IltS6vC
	 AwkShD0uiu7/TIrDmnrmRYluqG8/pdH70jvThvKyMcQr5gWkX1nxdv95F24hGrQ5US
	 NCE9t82HScvjw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CE72C17E0928;
	Tue, 14 Jul 2026 21:35:25 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id EDE5F480067; Tue, 14 Jul 2026 21:26:08 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:22 +0200
Subject: [PATCH v13 21/35] phy: rockchip: usbdp: Properly handle
 TYPEC_STATE_SAFE and TYPEC_STATE_USB
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-21-6cb3e769d4c5@collabora.com>
References: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
In-Reply-To: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
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
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjVDN6PqS920WWW30IhHfv1MR1K7reXu4q
 fxzyU59q3EzWokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1QAAoJENju1/PI
 O/qaNkUP/3SDFSJmB/Jf/Jwr6FxQLjhiRQY5pvNNbpmStQp763owq3dXPJk4fBEoYUC920K8+uk
 /D7iGwuD9s+DAkIaCBnJzKmjuohA/JP3b2pZQkfsSVWPMq+KYpB7ErbFb1UhLqix2tPI5TcKtUe
 hKxo1cZrgKyNIPYEFIBDfU8AKlDUO8tb/Lzi18L2PSqOn8kKY0t7gFkGP9lVVv1QqwAF3Jb4CvK
 8qL1kRr71zqVDpVXHGtd4GS6JlRdkF3dvTSVyuMirBcDQSnRhQUJaKS/aWSt/f43lFIb5XCPR3+
 tVuCteyvbBS1o4DkhzTq/zyOf4HLcXGSBDJfHW/wROoC/ORSP/scMCopbY4INkWe5l09SC4li8W
 WsmV5RW4IkDrrG9XklTTxeRhnShYZbB+N4s6f8fI5Dwnx8RXY1k4tZvJiBkHEvLomYfDQc5ZWVw
 VX746/CT+C2vbfuvfTE1s5w2HsPwWEQKPYjTvRTg6/kKi1oKoZ1N5eYXMZUYhNGM/7i8IJ9oHVZ
 Mhp0H0c7jUxB6e7TufSxNCFY+C0tOPycyWu/gCG8r2/SUCxWq9ixGzkV9j1Qb6DEMOO1l094glq
 yNFfZnYwuwRmfDCS1gkIyhWtu97H01puIOTdukpVlZaYosxo6fK7mbAI7rPvhKGkBbhr+H9C7tN
 Lidg+2WMpL8bLkq9yZfQ4yg==
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

