Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F11433CEB5;
	Fri,  3 Jul 2026 18:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783102424; cv=none; b=lQ5scxwJ6mhwa2vnDoerwlG9wEyAdT62RRVmfEjQr8M2I2iwGq0U0l5lhNKGtux6gZLCJ8MB6pd5qrS0PGOjllm26AHnUyQSSpZXgfunaTRN2PqwT1vOhu1z7bKFtlWBWgyMUb4Jcj48wp28IMGKEyaUfJyH1jkhd61y81UKxWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783102424; c=relaxed/simple;
	bh=l3uTaVmYXyzz4C+Rff5MIwMgEtWsya2jWgKHFq2XIA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nj7cGigoWtxRFjqMW2hBDej5Pf1LELjP9J3fOnvf9Np43yjXKDOoeko7u4ySePV4X0q0GI4QmBEY5KFM8kiWxQB/CUgeUTa0lHz6TPpfw3p/Qw4n682GYxab3glRM0fTfb8CXUAdZOPQtr3tCgOWMhqyk8MhJmTqrC3Txu0miaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=X4YV/aaJ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="X4YV/aaJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783102413;
	bh=l3uTaVmYXyzz4C+Rff5MIwMgEtWsya2jWgKHFq2XIA4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=X4YV/aaJNi4A5h92WkQUnIf2fLAKePwEMrsZ/tWYVkubaONVH/eL0mnCHj9zBGzOh
	 9sQOQuXBIlctktgA/Bhw5rJe1hiFuoK/lpcT7t45eFKx1iCBFhK7NVPUMkg1P0sJyl
	 1LSYHjhEsZxtFbBGas5D+alBC+lna5WkrHL05hGtlD8ADTz1qd6ztc7kN9vvxmOXtE
	 fg8S0T9mUvNWtQ0h7dhpTFYBCTvY8pyAkkxINvc2fnE7fvMCSil+Ph9J5KCunC23+v
	 UrFXgSBPWBR7ZQnNLSEFGLMkT1NGPjiPeRfJOXNXClpSfs4xDkQahIBJ+fTRYomOKg
	 OaJxjK+x+ziCw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 977BA17E1522;
	Fri,  3 Jul 2026 20:13:33 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 98ECA480067; Fri, 03 Jul 2026 20:13:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 03 Jul 2026 20:13:37 +0200
Subject: [PATCH v10 21/36] phy: rockchip: usbdp: Properly handle
 TYPEC_STATE_SAFE and TYPEC_STATE_USB
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rockchip-usbdp-cleanup-v10-21-a392711ca8a9@collabora.com>
References: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
In-Reply-To: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
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
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpH+8uUaVWxLh18faLrl8FxckwS6ohQJ7Zwu
 9WRYkEmfMrrNYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqR/vLAAoJENju1/PI
 O/qaOBwP/ioeGkMqutCITXG7Rn0fotf31b66kpUI5mHMHqXP5ucdxqca0pZ2bFZ4jGXBIMMVxvZ
 SZAQo2ZHrcHrvWCBzaTfTYIuK6ma0sqE4QubOReyGn0WE3q1P8CDMDT9f2+tAbCtvDTBTL1ksnZ
 uBxt9hC3CltMJ3xgKmFAg/EzsxOzrqegcb4O1iousFUomL/ZmgSMjkVQbcX98wU+llySxjTBNWX
 jRILQVJALxTNo1rCO+tp4fQiEBMwnRd4ohrgWs0PNvzaKdLz6GxEFbZ6mxqgBSRNXWkEz3qZ8C/
 8SJWwqGLJaOagOT+BHtvyudot7U43ElnhArK6GsOJOVAq3tJkFSSomSIHyGsvVWZQnpBMIU+Hp3
 El16hDloJL2TiGEiqnOaX6y7B9MHqX5/S2ceBqlw3fAXpkHj93CvBg6FCo5dZ2xiM7DAkUBdOpX
 xHtayXVIbRzFjmdMW7CGNu7Ou/MihznJJDMjFkYKKIgUxBqHeDH9wqIWpdr+n9KrGQ68we++9LN
 +7I7aarc3/rCqNgMnI1IrSQc5wAHGNhutaKR+jagSMi0ZV/emVC9n9OTMcknnyAC6idiB65KCTu
 vuW7e133W9Z4k7qOvvLaGJ5tuPx6orXseXEISjFOpsQRhoQ4cU8yGAzPGMP+ARzVSqmKWsmixFk
 kN4OihMg89weO9ge0lmcugA==
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

