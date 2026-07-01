Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DE9425CD1;
	Wed,  1 Jul 2026 23:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782948958; cv=none; b=LQjeWZXndPG7K2kPOL+CsclgT076fvyXFgUp41mXmYhPcQpi/VBFvxSJn4sZUlP+vUvZ2swD+ESrLOeQlQwchUrTgv0XBUj0/0BHDuaR0JrrNaw85w4HgA8PzQ71RoGZCyVkezOHgpTmIdfGJTGeB0iMXBXtI1VLIj+NBYFGdmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782948958; c=relaxed/simple;
	bh=6wzRNyqv6NlPOaqntAKWNGDB85tg/squK5vsA5C6di8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ckB9KhTpvAYeChc2pmedTZbo2oe03/KPhZdjAj/tjPJZ8bAT5rTTY8zgk8H58fMaQw+e/sCLUidLQkC7S3SrNv+dK4QyRQqTtD1gb0K3GmHWhbPXH5I86qaSo0qQ5xYNh4aAwJvDEYwRq8Icw5CNDBk2CYP++kYt6NmwQCYPFfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lAJSxeWa; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lAJSxeWa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948949;
	bh=6wzRNyqv6NlPOaqntAKWNGDB85tg/squK5vsA5C6di8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lAJSxeWaVTMYiBo/DPCAzy/uecaiFQeLlTUwS7vN7OcrBxPGJXrB30XotiDtWZzXz
	 rx2Oe7LEk4d44KsRDV4IMTPKN7Yt8+VLXUL5edBV+D4Giz9RTvRu1175iFA+FvHNzl
	 PltYYWTYEYZjy5J0iV8M+vTgvRnLPJkZG9vixDUIzbbM8nbn6b5Yw0RisT5UdZDhGz
	 PJUA06fyRlO393DXHb0P3z2MTz9JdN7U+PhEfmV3ENio/6YUteugkrNwB6WljNp+JR
	 ue2uS8eWtxwk7qY66Ka84GdLeicZe+2kfbZME+nQtZeTfhFfKj77MFJX29nM6S6wzs
	 lZ/U7rO1dQKvw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9D51C17E35CB;
	Thu,  2 Jul 2026 01:35:49 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C2B0D480055; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:35:53 +0200
Subject: [PATCH v9 15/38] phy: rockchip: usbdp: Use FIELD_PREP_WM16_CONST
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-15-e31efbb62d2e@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1546;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=6wzRNyqv6NlPOaqntAKWNGDB85tg/squK5vsA5C6di8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFOldLD8T6CERw/4aNWu8uTfaE5BTUr5s
 goajTSHWwvK0YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRTAAoJENju1/PI
 O/qai7IP/A0DhfE1P1oHzeDWbRHYaozVOSBGenZuWLpfLJ21xD3xuEgPHDEP1iMjf7t59z3c+5T
 PwVVb3212+fZFwNBaciVdyn6EAwVchTI0kK5F0kkW065SQOWQzJ8CsS9oFVFwYkgD9DAXNPyUwL
 GFYCVsP3BsSQYrM7ggxxpj6Sv9SRFHVGoxObDie7wsQsbcu9noRD5Pq+1YbNBYeOzySplfdD5Uk
 7aWVzKz32RKrv4yMUcHq8UnNTd15QRD9OfXmDeqNHMJPLynwX6yUhZD7+1Myx9tkMlI8QPO+ZXP
 isw2IjE7CQKejOAp1b8zu7Hz5fi6NCG0ukE9XRH6ftKucjpXt1FffAzhHeRJ3dChyG3ajAh4Afd
 DHbpe2YHhpq6PMspwZGDQDj9+I+UUkoPAGndMngZdT10wN9YTJ3Tr3pIh7q43mxU6VR8EWVLE7c
 ojoJaLO97yTVWgTBTpulTit3CEwbAukvwGNbMXXp7HZNjWhte31dHSsfWajXCVKnJqYKZ7hGVcQ
 0laqkCtieB8ZIsNG4Nx9j9eguSNFXzE3x+hRaSzlb5y2N6L6e5Vg8O2ykO2wlZQYDmnKKyEF0wx
 QFGukVDrgEvzJ0XQuKDhPiqz+XIin0ldQlc35PVfBBgUd3jE50gZRlmZKhPg8NVmnyw/7Aq+0gj
 bAey8L+UgAkA16kLCdQIqZA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Cleanup code by replacing open-coded version of FIELD_PREP_WM16_CONST
with the existing helper macro.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index ee7ec86bda9e..3124bcfed031 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -12,6 +12,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio.h>
+#include <linux/hw_bitfield.h>
 #include <linux/mfd/syscon.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
@@ -75,7 +76,6 @@
 #define TRSV_LN2_MON_RX_CDR_DONE_OFFSET		0x1b84	/* trsv_reg06E1 */
 #define TRSV_LN2_MON_RX_CDR_LOCK_DONE		BIT(0)
 
-#define BIT_WRITEABLE_SHIFT			16
 #define PHY_AUX_DP_DATA_POL_NORMAL		0
 #define PHY_AUX_DP_DATA_POL_INVERT		1
 #define PHY_LANE_MUX_USB			0
@@ -104,8 +104,8 @@ struct rk_udphy_grf_reg {
 #define _RK_UDPHY_GEN_GRF_REG(offset, mask, disable, enable) \
 {\
 	offset, \
-	FIELD_PREP_CONST(mask, disable) | (mask << BIT_WRITEABLE_SHIFT), \
-	FIELD_PREP_CONST(mask, enable) | (mask << BIT_WRITEABLE_SHIFT), \
+	FIELD_PREP_WM16_CONST(mask, disable), \
+	FIELD_PREP_WM16_CONST(mask, enable), \
 }
 
 #define RK_UDPHY_GEN_GRF_REG(offset, bitend, bitstart, disable, enable) \

-- 
2.53.0

