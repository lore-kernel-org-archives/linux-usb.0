Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242A943BDBD;
	Thu, 13 Aug 2026 20:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654333; cv=none; b=IPQdJ1ucWXlujeYLWiBgpyg2Rq1MYWd6JayD+oOS8dWxUJmoqmQ2LB1QxqBjCWq0+d2dCrlebsFYA9PIEPPQljo3HCT32plsab2YmWspzuHdGhHd3mP5b57Ic6c/AKMIqVGLfSqwZWgy86aAJrY8mQA1hsNg5au63SVUH9QLuhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654333; c=relaxed/simple;
	bh=DRXGZ9p7V1/mxjzbN8TrhXQcxeu/SF2V+MgG6q/rcw4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mQ+MXqHqfjrzJNRwG6lqDChOjHsjMkMSTG44eB3tqbqFyCoSNAmUopp4Lm3BitUJKhcGqLkcPRspg84rHQmx8vxe/we1jQyZ2qscbzGM+bYEp//DFSRMvXSLRhtAxkRQd06l34YmXL2KF984KvBqVtTAVBqkTcwpJOKn0E03AWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Nv4x1Cpv; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Nv4x1Cpv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654310;
	bh=DRXGZ9p7V1/mxjzbN8TrhXQcxeu/SF2V+MgG6q/rcw4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Nv4x1Cpvz1JnVCQQn7THa67sUsto/PeLMeRJsJMScgQLhHCx5qWCQ626SzJwT+ipa
	 oDEAO2AGVEqNwO0qLAmG35mm2nAIpOPtFEkBiXGJ4NRkEUH+kmuthVS2V9GTWJGib2
	 ogC5Hmz/xwm+FGUeQDAgtWIaRMq9JKXm41frLe7mXycgom5+rqSWDj+yceZuA/lbN6
	 EDD45HwCfJQR1o2RcyIhixORexYCiFBMrLWszjuXozAhHHNkT3RXX2SHd2o5tM4WE3
	 IyFYWCiyVa8fxSqbRM7E2bJVWxmXusPpGfw56eTQR1lOv8v9+JM64u5diNTIKdyilA
	 e1LWHBPK5zZFA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 96CD717E1412;
	Thu, 13 Aug 2026 22:51:50 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id B1812480065; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:52:02 +0200
Subject: [PATCH v14 19/38] phy: rockchip: usbdp: Re-init the PHY on
 orientation change
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-19-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1326;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=DRXGZ9p7V1/mxjzbN8TrhXQcxeu/SF2V+MgG6q/rcw4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmQT5DejwXvNJchdzLQ3Mt6HljWSUwqQU
 CutrxoaF1atb4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5kAAoJENju1/PI
 O/qaptkQAKL4RVLm+JOiRRYPfvlsojLvVjCjKZ92tkzFvrMhc/Dv2rodKUiN2eDA3ynL4V2ywY2
 fI2vE4NM41TiFBKCHoRfWyZDSpyBJuMaj6QkqHJG0QK2YEkuUtR5vLy6JHtxVg2JKWq3WAFoke2
 WDtodDjxj0HDvBlBdrFdbVu7FXMYFVypoDiPO4AdHMRjhVyy6sk3obpNE3M9TPlF5MXSlDgn7+u
 DUeGG0SDaojXCjgU3RW+rUr+TyN4IhK1kU3nsEufu7fRprDq7x79VCTVy/SpizczHOQBSh6m4kh
 yO+1yvHj2OyUzfUmDT4UxrH6SdayYQNmyr1pYmTWoEPDl9Kme53HFWXYOldaJHtK3/vqa51vbU6
 iAEkaQJXomOQqRyuXn3mu8eKSOC4g3tJHYbOfk6KHwHjOpIi4V9Kg63k5ONlO+b3B8sOdVKyiem
 aE645AlUDgAoUGJi0+pny7BNSrqgVi4er/3hUJSj3WDG+7WEoGcO8RYkhhuBFQGP1Vgb0p8iUCU
 48nVNYu93yN2/tnw4i/aonfeJwjXqeEPbumPKNvOYBgeoqKXA/7m5ZVdtVgmbWaTZ3a0Gn6j0r8
 5+0VdvsQ0a706rBwSZTvbcNdOaiB63KInVXVFHpVmcC2rETooOJr628BdjElUQHX8uDssSQOr2D
 XWcMfXsvcQyc7CqtMu9E0Zg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Changing the cable orientation reconfigures the lane muxing, which
requires re-initializing the PHY. Without this DP functionality
breaks, if the cable is re-plugged with swapped orientation.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index e44d19c9d119..4b454798c4ed 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -620,6 +620,7 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 				 enum typec_orientation orien)
 {
 	struct rk_udphy *udphy = typec_switch_get_drvdata(sw);
+	bool flipped = orien == TYPEC_ORIENTATION_REVERSE;
 
 	mutex_lock(&udphy->mutex);
 
@@ -631,7 +632,10 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 		goto unlock_ret;
 	}
 
-	udphy->flip = orien == TYPEC_ORIENTATION_REVERSE;
+	if (udphy->flip != flipped)
+		udphy->phy_needs_reinit = true;
+
+	udphy->flip = flipped;
 	rk_udphy_set_typec_default_mapping(udphy);
 	rk_udphy_usb_bvalid_enable(udphy, true);
 

-- 
2.53.0

