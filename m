Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3265F39734D;
	Thu,  9 Jul 2026 19:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783623758; cv=none; b=jHP94FCnOkxjvsnY53x21xJJhVXE3JFgrMJY3aSja7l7OPl95UZVJFkx6BAKREDu75sd2qFFgaHmhu+SrT2ZXhd7Ghiz8Bx9zMJKvw4wvyKCemXJWIA8y35KUrycbHE1tmklmUt9gIK31tGL8W3UN4Xl5101F6yEtoYzJiiSOco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783623758; c=relaxed/simple;
	bh=Cq66EKeE2flHvN+UE+9Jd7VxqMbU2uK/j0/Drv52Xi4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DbMlvVTH7epbxSCV0HXjqicSkrnKsLPYetNVmREL8WJF07e1uQmQ6JaLBj2JMqLuY7476CJ5lUG8k4rAh0u77cBl622QN43scPnZcewxt9+E90fJZczonhpcuCu8sUiSSehxWJ5Rdcmfbm4p9nXna6/KyuSMrZq2JJiCF6CXzBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Lf+vynIL; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Lf+vynIL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623750;
	bh=Cq66EKeE2flHvN+UE+9Jd7VxqMbU2uK/j0/Drv52Xi4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Lf+vynILoSgT+CKF1zdt+cdccJZLQ3ENXN2uxQk/PZ34eAII20YEl6Qw0ICYARdD3
	 /iKeYjzFE+KDtDG9wiFDrrQuokA/4/9DhBI/LmSKRyDh95XbAr9N0SdH9Y8E07vTyl
	 +GULW29m3MAy2u9jSnQTQ1qJO1kagQfQ/HZqE0z0p2OvAR6HKAJXPhYlUzRi/razzi
	 Gr9/wz/l618gRXcgiuRZPlrtVW7Gieycc9Qq/ciUZB66neAzWsXEZ8bJEK8Aclp9j7
	 DLP2f7wNRHMSjjgS0IY2i91KMDwF/GuGOp+1B6ePpcZkaH8YJsIzkndVV79HDILJ63
	 dxDzWfNMBHrGQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6D9E117E0FC9;
	Thu, 09 Jul 2026 21:02:30 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id B537E48004E; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:36 +0200
Subject: [PATCH v11 13/36] phy: rockchip: usbdp: Rename DP lane functions
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-13-a149ac60f76c@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2007;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Cq66EKeE2flHvN+UE+9Jd7VxqMbU2uK/j0/Drv52Xi4=;
 b=owJ4nAFsApP9kA0DAAoB2O7X88g7+poByyZiAGpP8ETPHyamm9I0jIuRjRPuyRvuv4UGsa0Y+
 EBAUIOQM9z4aYkCMgQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BEAAoJENju1/PI
 O/qa3TkP9RHWUeUN4I+lDzwnyYa9fOLuCUWviA2sP7hnvdFQ9LWf2yg2uufOPBVOZs6TSZxO8Fg
 d/ieJHbiEIlbBigbFz6S3jLAr7ClPvPHefnxJkCJy3v0kSHMEr30C2/yrpwAh2gEjsiq/OOdedG
 /MFQZpRkN9o2DFYoBTjpOuNKiWX7ZfHlSF9g0Vs/Sk3FVOqvtBG6rG2+rCoNl2QDHOH/qkf7wy6
 BCNTTwwR0vbU6QVOGL7WQVZ85g/TgOVfRXHGXniUzjxBZ0B2sVvNiV3o4E9Z8eFBde0azrDBmKN
 8ZgMhW9ApHAPiU6ApI26zN5Jap524R3Brx5/VQwbwJoNZhfPjf34HtsZYvbSXCiQk4s5+9mgQXt
 WpM1r5Hmh4tnUrTh3yL0Rd0MEFgWe2vXGk8PRN0MlU7eB89oYMje50Q1aualG2dcJxKj9r569iN
 iFaP6IVQUl6dVChMudE98e6/zTsB9TR6HUzFSDJiWrV00wMoa5iV5jVCA/k4meMT3llPpIkCUgp
 V8gntSc7x93uDxneTFrwaBSgiiihGqmEsHJIFSOa6ADKKx3I4VR9QFs0scABO8kLlSzl2Wgd8Vr
 bxGBJyagYImIn3ukWUolqTGg4r5L1YbPiIeO2GeeSpIICK1IUasl0e9wQf51GUk/LvIY2EMvyd8
 wbrqpfgu+a0P6yoAYUCsO
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The common prefix for DisplayPort related functions is rk_udphy_dp_
(with a final _), so update the two DP lane functions to follow that
scheme.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index b172ce6a722e..7fb864a1486c 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -545,7 +545,7 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
  * ---------------------------------------------------------------------------
  */
 
-static void rk_udphy_dplane_select(struct rk_udphy *udphy)
+static void rk_udphy_dp_lane_select(struct rk_udphy *udphy)
 {
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	u32 value = 0;
@@ -574,7 +574,7 @@ static void rk_udphy_dplane_select(struct rk_udphy *udphy)
 		     FIELD_PREP(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel) | value);
 }
 
-static void rk_udphy_dplane_enable(struct rk_udphy *udphy, int dp_lanes)
+static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)
 {
 	u32 val = 0;
 	int i;
@@ -1049,9 +1049,9 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
 	if (ret)
 		goto unlock;
 
-	rk_udphy_dplane_enable(udphy, udphy->dp_lanes);
+	rk_udphy_dp_lane_enable(udphy, udphy->dp_lanes);
 
-	rk_udphy_dplane_select(udphy);
+	rk_udphy_dp_lane_select(udphy);
 
 unlock:
 	mutex_unlock(&udphy->mutex);
@@ -1069,7 +1069,7 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
 
 	mutex_lock(&udphy->mutex);
-	rk_udphy_dplane_enable(udphy, 0);
+	rk_udphy_dp_lane_enable(udphy, 0);
 	rk_udphy_power_off(udphy, UDPHY_MODE_DP);
 	mutex_unlock(&udphy->mutex);
 

-- 
2.53.0

