Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED46042BEBB;
	Tue, 14 Jul 2026 19:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057186; cv=none; b=hiINEw7Hd+g1P/jgXnUpduJhswH5rp1WAui7UsU5IbxjlBduEY178BlENfSV4BAo05fXFaeZLOUZmb/3ZAxR0f/oTj4Pz0UYfsQX7rFdA7vKC5E7l390O030cF0PPKqTKIaoNmIJ5afNUSaEKrI93k5MIPJrkV09kGn6QLEBtcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057186; c=relaxed/simple;
	bh=DGHAo+/yHQUfg6E5xfAgVJta4NhbAYv3HkIdYgaZpOw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f+oY/oqPipGEgalQWgzEz5aiFajNxuVPsJZro9P4XtrBYBhOsQRce8bKyfMM9iBXnqqvrVgpSWOE1kHv3B0OC/J4ciXzxU+bqIcW267CFts8b+EenVwyfsZfVXY7yEa7lfVFPX9PAwvpTmLF9g8iedFh5TX5ayLsezCgGJFtCek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Bc+1I8bP; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Bc+1I8bP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057174;
	bh=DGHAo+/yHQUfg6E5xfAgVJta4NhbAYv3HkIdYgaZpOw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Bc+1I8bPbAf5YrUZhfocGP6eTNGE7ivR61lelnWAU10O7yVNNp0RDukMAYQIZvJbX
	 JJIVNlfwgs+ytr7TBrN8k6Jhta83DBGjqbxi6n67rONbTc//fPW/axUGvL5ODetDgG
	 aeKqOx0WmqL5mYJBbEaYWZREDuw8Gs2zUbqqi58vuRUFq0ADK3vcvjCF0uYEDw1WiS
	 in/4nSDXQMF9Ed2P0VcubalikAuy3T3+XgsZJtElnGGR2mOAd2PFYYV5mIFL7QwVJO
	 hi+eMJXsmSsYvhvQFLGvCFgP0k0l2UzLVuT8Aod1jFSqx32VeBXHf0WN3EUPo9j3Pl
	 wwlD0CJc7IYxw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9FD5717E36D7;
	Tue, 14 Jul 2026 21:26:14 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id E2909480052; Tue, 14 Jul 2026 21:26:08 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:15 +0200
Subject: [PATCH v13 14/35] phy: rockchip: usbdp: Use FIELD_PREP_WM16_CONST
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-14-6cb3e769d4c5@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1546;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=DGHAo+/yHQUfg6E5xfAgVJta4NhbAYv3HkIdYgaZpOw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjU/GT1APDo+BEPjP8UM1aIJhSuwryy2nd
 s+4ZXQ409YRtokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1PAAoJENju1/PI
 O/qa8B8P/0PbnPvj9GhI/Olal576f27XoVknMrfwLBkaFxBTA/gL5+1IxELSjUQnewAEWo3uFPZ
 /Kq45x5FojevsjrqFQU4uJMYIodGPfPyjLOYt7+z0rcXnvTarXUw/i6zoC53EyxajJi7nyPnRSK
 REpXRUm0/ajga6TFolSetytjelfg1xfpK6mcL+l0hnmx+CsKu2Vgq2YO7zlecwXEcMgiA17QX0/
 /b+baFLwuXBaTbZb3qVUskCMDc16/o6UUuJUi87fxxytykCM9G5oXhtz3E4s/1ubSuW3XTG+i8N
 wL10jgFDdzx9kF4l4mRHJ74vTLbmrYt86Ha3UeyeDDIHIYMHB+NCcB9Zyq6wY3TfKuN7cxiwdgN
 OZwWhAEVMRsBR86X4XCuKRSOZlVOz9LcXRc28Zpf0Jk8JoOpLB+AQme75ZtE5g0Rf3uXqkN76OG
 fesaMgyQHspVzR7M697MSfhw2lOIBtH9R3WaYjr7vUngkxCVKgd2Fx2XPwnwrdC2/N3k+50ECWB
 8j029xnpkephZ95Vd36ZfTyHhYVkzD5+7UQ93bxPp5gmKTtJNfWgplKlVKj/ueDvATnKaFcBh8H
 duK1MalOQOmJwPG6kQdIOtbuGHnoxNr+NnNFcRU+6Bz0I+poq6VYMHOXkkZX9ic2GiyrZFzEKKK
 hsGszxNrFkLPHQ2rDGaQ1/Q==
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
index 7fb864a1486c..05593e98c16d 100644
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

