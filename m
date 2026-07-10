Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D6F43CEFE;
	Fri, 10 Jul 2026 16:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701997; cv=none; b=MoSkdBrfs6zZhc86+ujApXWtc3DNWPKvjwow/5ZaJkFhkqTINKR68qGPKVVeBROfITyBvXlBFJ4sv/W8rLqvhGVyKEkLYFWCOVSW+9g9cyDcKghciA0CeajCLC9GPmfK6h4ZIc0WSYAi+jO/Ys/nOkpLOT+OGT0Vf/Niep32Ejo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701997; c=relaxed/simple;
	bh=Cq66EKeE2flHvN+UE+9Jd7VxqMbU2uK/j0/Drv52Xi4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lHrHOHYF5OOhr+SrjSYyICT7EDRwYip3+Aq8Y6a1RHawAyNb6qwc93ZGe9yhk/0NdtDN565tCXHNjkRTRDDp4uXbQ+/M7I/UnyMTgXvSq/4PKNIYqATTx3KPf9NItqev7dBLB7Jh3/5QmyjBZy/ByIoru+HrIuxOkqDQ9As2WDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lsWJFETA; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lsWJFETA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783701978;
	bh=Cq66EKeE2flHvN+UE+9Jd7VxqMbU2uK/j0/Drv52Xi4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lsWJFETAbvMXTYQVVcQJ5QLkPws9Wvyl6QO3pRp4yAMfkSbXlcAh+ZC36aH83qv/q
	 Zd83tMANHKjPKZ5BQsbFXtHyIN+lzzKUpDOoEgT2idk2PNwnBWLdZUWiU9eEmv5j8A
	 IybORvaq9C1sPv6XVyfN2BvvvmiUm7itnmxEvVNlUGcnuJiHSxctoPsLEJjhr0mo+S
	 PtePfGtNRE2nBoUWmzVHqMTSK07OGTimpkl1f+GkVhkUEAalLdBNvK8RMUWkhXhDt2
	 zrZAEGNKRVTXSMG2vqc2gTDLRYg0n7WYvXOzkYp2YZxEe+VRYPv8aq6Rgc9DnLGxfH
	 KOw+UcbyQBt4Q==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A27C517E0FD2;
	Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id EF33D48004E; Fri, 10 Jul 2026 18:46:17 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:44:51 +0200
Subject: [PATCH v12 13/36] phy: rockchip: usbdp: Rename DP lane functions
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-13-8b41a9a9bef0@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2007;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Cq66EKeE2flHvN+UE+9Jd7VxqMbU2uK/j0/Drv52Xi4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdje/dVxNaIgSe1sDf0tGtslymIEJXNAX
 FPDgtvNw00eA4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHYAAoJENju1/PI
 O/qamx0QAI8YOVSbAx9X79xCtxl319zGPVzBvbuEFucuLk0LgeDMKPf/SmSiCEpAVjQfWh34NB0
 SZpIMRC2jaakSGoPe2XWhipzlk+LGZYX3PBRC7WMURc4Xb6ip1GAWYk/2n1Tzziq/zLtihj+nu1
 4FPROBaPbXSiygxGq45pFXLTrcuhtAXRl3pKsmnsEezTWTmp8MtiOXcqCDy5h0D+7UUPZpHo+lm
 S7KM3gy1I462xdKCET/voAm1d1Jtr2gKXnza2fRgXYWdJYlY8UbJWP4cCwFikVLGn3iYSmeweal
 FS8/R182/5OMKTjuDSlAa2GGy8Q98s7mTNjM+BwVDVVvUltNu7/m5cUfRLCoRB058whlAbCa5wK
 tJMMBC9M6Cd8WoMem3DawZfNFYoMcoD7qeqctehipVd6BGpNutDfMX176y4ZBGUYVqx6ihvidmf
 IZ+ChIT8z/5A7HED7wmHwJxCqb7awMBX34umV2N9PCmql1nj4+CgBLV8EwZ/OLXnSNtqc8oj613
 LDk5HcJ0Mvvs/czPVeVDqXX/a/I3qID2jbDyla8Hg4hkRDVLm/xaUmasf7DxRx+BYh366N0/MiF
 yXRAU6q14S1nTg/Cblt7qYCjqho2ko0S42/Ei97/MrZybeUsP4vTnTk0nKtKH8RJRcO0NVRcKUU
 YDTGdd02s8Y/IVIghtIYl7g==
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

