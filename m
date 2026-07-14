Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCDA41F35E;
	Tue, 14 Jul 2026 19:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057179; cv=none; b=MeqJl/67wru9eldFMu2lS9+iIXGccjenIVqvDsaRgSROg3YJ5yRl9EGJxAgD5k4v+sq29XXLDdKuEOB2cjuryf3qofaS01J0Dke9La9z/gELKP2wtUVIuscD1u4uWZq6onQc13FoWUYvt34l+gzb4VrOq5D3GSO7GcfFx0IBQfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057179; c=relaxed/simple;
	bh=8x+V9jjStkv7ipsHaKsRN2SwbLF1FQFj7nt1kWMYqkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aHgU/w05DHqFaMkpxT60jPGeBjvmL9Hptmdrfo8HgfoHeN/LQTwAI5Qv/OQ/T17up88gl4QrGoOer1RANhF/onGKpUp/9HFVIJHDpnq+tqBRbBrvlMZ34lWN1K/BrXcF+ZRqFniIjbkcNMddQmwO34rKLCFkTHdSb9everYY41w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bjEHOZAs; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bjEHOZAs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057169;
	bh=8x+V9jjStkv7ipsHaKsRN2SwbLF1FQFj7nt1kWMYqkE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bjEHOZAsnxqEDyuo0XFs7ikzQQFW4Zz8R8wg0+Ujo79uoBUW0SPaE/k+rmL9sk8lQ
	 wzyzJarB7FpjKeltHnS6W1grQL8C/5WNO6p+cOA7njWoLIyh5kFk4562l2myOAOay7
	 G09Sbc3z9ZlBSTfd+/LiLYppgW4S0nJd4srYCILP3v76lC8ImbWyh8tz7TqPfM32L2
	 n6EzOiQ+hQ1PtUZZ9qPAsSIYYJNeGGsQ8RySctltYBS5OdVcNbeT2FA/rRl/NNnE1X
	 ipV2iy0B68wa9V5O6ybhDPyfRaVGwh4d3ih3TCZL/Vtuhc2EQ/OWfHZpGLYswdlDPW
	 wRWW6rghkFKzQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8B5FF17E0FD0;
	Tue, 14 Jul 2026 21:26:09 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id DC123480047; Tue, 14 Jul 2026 21:26:08 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:11 +0200
Subject: [PATCH v13 10/35] phy: rockchip: usbdp: Add missing mode_change
 update
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-10-6cb3e769d4c5@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2006;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=8x+V9jjStkv7ipsHaKsRN2SwbLF1FQFj7nt1kWMYqkE=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjU9OY3Vrxoi/+TihhHDWuTHmxjep89o9N
 JV0E3wH43ZtfIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1PAAoJENju1/PI
 O/qa2vMQAJdVOR9k7y4ad+UF7oDtvzdRNPtqC/Jox58Tl+GrEXB46Kknj40aIgvVocHQJ6RXW5n
 hJVztQQVwwuVLTt9q4zdT4Q5u48m9Wqhialbj70KAXTYx/Yfw9Kupb+UQmtVgFSTLDTJDVDDkqs
 z8LRM5liEPGvYQGr9qoc6nlSdCxHr0nnXjt346h4m0lAAhJvvsLhVfH7CTQ6uml4yiX0nd01Xd9
 yfHH5nZ/CsiDr9K0moeNGu7b7pz8utNsbSv8ryyZS52pldIewc7vXviuNVuGICM0jUt4ddorDzp
 3DrkPS9lq0ZyD6WfT7W08f89OEs1vNnZg5fTBtswS7V7+zcWCb3z0fqQN0iAev1S37k8JvdbOpk
 YcTdhVeNjbw2KoSOJAGhAaFoDCeC14y9wJJRPkRjlk/5bmNMkeW5rIw9mLtny7Ke/2twPQm+lKH
 CSxCJjBBcU+NOXKR3Yg2kBWeVTiNnm8ggAjZl3Kia27hdFo5GLGKr4J7eOvufzw0e+H0x1dWs4I
 +U3dkXbD3GUB8q86MYewMUjOglplYIhK94nnH/3JCcNJdp+v1/uyiYTSWliWug/FQqCLhEC925/
 9Dhg3y2EtzNlhojlit+951/rJcph6RACPEP9BZB4i6emt3L8mZtwhvTPhXDcq0yOVUl1/lKui4X
 zeF+nvtsKyIJnKlf5eA0t0w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

rk_udphy_set_typec_default_mapping() updates the available modes,
but does not set the mode_change as required. This results in
missing re-initialization and thus non-working DisplayPort.

Fix this issue by introducing a new helper to update the available
modes.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 982315535caf..7540c897dde1 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -617,6 +617,15 @@ static void rk_udphy_dp_hpd_event_trigger(struct rk_udphy *udphy, bool hpd)
 	rk_udphy_grfreg_write(udphy->vogrf, &cfg->vogrfcfg[udphy->id].hpd_trigger, hpd);
 }
 
+static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
+{
+	if (udphy->mode == mode)
+		return;
+
+	udphy->mode_change = true;
+	udphy->mode = mode;
+}
+
 static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 {
 	if (udphy->flip) {
@@ -647,7 +656,7 @@ static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 1);
 	}
 
-	udphy->mode = UDPHY_MODE_DP_USB;
+	rk_udphy_mode_set(udphy, UDPHY_MODE_DP_USB);
 }
 
 static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
@@ -1361,10 +1370,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 			usleep_range(750, 800);
 			rk_udphy_dp_hpd_event_trigger(udphy, true);
 		} else if (data->status & DP_STATUS_HPD_STATE) {
-			if (udphy->mode != mode) {
-				udphy->mode = mode;
-				udphy->mode_change = true;
-			}
+			rk_udphy_mode_set(udphy, mode);
 			rk_udphy_dp_hpd_event_trigger(udphy, true);
 		} else {
 			rk_udphy_dp_hpd_event_trigger(udphy, false);

-- 
2.53.0

