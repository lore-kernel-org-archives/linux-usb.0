Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF7E37F727;
	Fri, 10 Jul 2026 20:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783716976; cv=none; b=rmbJgs5IYlzKPTA7cp182XTKZj2VaYBll69O7FR33xDuc72DAJulPlgorQsBxTobVUJ3FOV5RNC+aNbBEVqYqJamzfNgcsA3hw0E+1aywZ1oN2xViItDZYoUPgR9ighC0q6DA1C8VzPoaE5MpeR70k5GdRgRIO7P9X2DL6okBFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783716976; c=relaxed/simple;
	bh=l3uTaVmYXyzz4C+Rff5MIwMgEtWsya2jWgKHFq2XIA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MdqCQW7ufJuUNDnnELwickI7l79dDHGfo5ecwNdLOmoo9/xfW/+Kj4EkNhl3KzTSGnnzmrN99Wd7wNkUIH4CZRt2jo/ao2VE1kaF2Mpp8nwP0D8puqj6bByhgj+sCOZDzIfMAg4NH4dM8Tyy6FnAoU54PQnrQ2luiK3UVtmdEPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PjqKhwVN; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PjqKhwVN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783716973;
	bh=l3uTaVmYXyzz4C+Rff5MIwMgEtWsya2jWgKHFq2XIA4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PjqKhwVNegcV/oEvr6eP4viEzyRIUkXTxDo/xcVXucymkYYdY1YEWQTIt+IKoG0FJ
	 CovE9C2ygfOb1Hypv29vH8TULvELPUcxHvBDHQVjPINoPufOjWFsm2GtRLZ96D+Evv
	 V6RInU6BpLTUCHz8ptiwmVHUPk0GjoT0pv7oFUq+U9y7jWSoZgwIzPIY7fhAZOOK6M
	 mND+9o8NW8Xm+VvjbmODMk0lKRLM0Sp/r5sLNlGv+yo8Y45eNvlp1G5HBNOJfsJynX
	 vZYryVLd9Zrf/9ipnBT9vyW+1ey0iS5AdZmfacZTI90rBv+oqpUJQ1/q78yRzTHFgl
	 maQD2cO6vT1uw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 17ED817E0EA6;
	Fri, 10 Jul 2026 22:56:13 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 06E09480067; Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:44:59 +0200
Subject: [PATCH v12 21/36] phy: rockchip: usbdp: Properly handle
 TYPEC_STATE_SAFE and TYPEC_STATE_USB
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-21-8b41a9a9bef0@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1759;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=l3uTaVmYXyzz4C+Rff5MIwMgEtWsya2jWgKHFq2XIA4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdlFv928K3HH+xY1qBeDPeZKXqni6b6AR
 rkP3eAehujOvYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHZAAoJENju1/PI
 O/qagLAP/jPUlSGTgQ3t5ZRk5jXYsUFghxH0TXZttSf/EfkLfgMHSRxuFX33O4+rSvmyZ8IBVN1
 j1CFJn4r4KDcBk54euE2g8SO+WvgRQgAVs4chBR7cTcJqni85VQXLm8RhR8OXYpSVVyqUqPSVfl
 hLAB0VLgM+Lvr29xD40CMg8DHR3iW1DJ4fN42Livz+cqb9TJK4vwRkcG0H5g+gAMOqb2eYqZBVU
 M9ssHkKPnH7tpHwot2ccUB5ckAvGXcMwRTFiI9kNrNsnV3IK8z4L2nZo2tnCNjzToJlhPsrMcqh
 tLs1zClOZpZfKFpe/8yVHLuAvoeyv2fYQd31cS0BWa1b/l6TBH1njaJMOdQgC2k66XJkXEKB5Pz
 Dw5X7r9jXAfj6ujeKmNDcOG1yQNIwNFCHSbiid0twi9rxhM7quwW2HYT0U8pEhTgqF7J/zxhsVj
 2SSKfy4xqDmwFmtNuJRVZ3094J2r8YTie3rHnmJnX0AQr+T3t4j7Z8knhmQbjMn4CrJz9F8eEDa
 UgYthJD+yYaq5Z3k+W2n69oK4yYIbJ3/ETMfkvngmzdBBWYaHySgspqxOOxMr6ILoQi+LHqhO3B
 BPfCk4CDgaAMSP/ecSTZgh5InRxvxzUkNTK9NJQ7C9cNKB+KagF0NOLjKW2iWGtmLpCoWlnqixB
 9jJPMLABHxwccoCYDlM8p/w==
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

