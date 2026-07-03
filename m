Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34133242D9;
	Fri,  3 Jul 2026 18:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783102421; cv=none; b=WbxKxcSZUaDAdtXRiyKORxrYwU/4un6jWGs2wNJo7xrJwl5lvUE0H+62JkqTz5pirw3itNToAkh7kXI67WZGmOBDTsCNGZfZp61IagIjS1mNlUOwzdYIMB+KtCbsJn9B0hYwBpEBUYf4RX69nK9ADZorIAixjFa505XrxijpAps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783102421; c=relaxed/simple;
	bh=MGpikBa/aaqvkv65oP/N23ryrQe5o83Pvtc6osrktIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nSpdEvomF4/tAQjdNfNtNhEVp3SMc5faTkUanqiYrXK+C7am1bS98jg6Zv5L5/ElT8yWCgAc+//LRGB09XaQ2CszTw1fbfi5F1buwjnQtpznl3DFiqy7SMfLl/2JhPixxHjtKEWWmEw9jwvYmMunxs8NHTd2/1H9GKtRlod0I0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jNJhFEyu; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jNJhFEyu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783102413;
	bh=MGpikBa/aaqvkv65oP/N23ryrQe5o83Pvtc6osrktIs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jNJhFEyu8nfVxBJ6/bydrQ+7xikPmtah9w0aQZlJynqoFsZNG3I0zYQhXuZ7E1dM1
	 8UdNNiKauXjHMWNOmImU8YX6CYvbha+9pzqWkVIkiTJqY+09tUoD/IbrG45fC4ZTjq
	 2cl0mEmxZ0P5AD1WA7npcwLTITFZty06DtQE63BodcfIrlPdwB0lVBs7a+c2MxE/gg
	 PXDJnCLxDXyezOqCE2Y85zhKGxWMh59XRRg/ZH6GUzj8NWBVmGOU7S/ypu4u5cqcHK
	 mu80gqkwUuQJnIFJG1GlqutJY2X2iIagkOUXBFOQF1Y5GClxTGYNjo50ppTWXYmMly
	 iKQPDfqDJnUjA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3B8E717E1366;
	Fri,  3 Jul 2026 20:13:33 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 8670D48003D; Fri, 03 Jul 2026 20:13:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 03 Jul 2026 20:13:25 +0200
Subject: [PATCH v10 09/36] phy: rockchip: usbdp: Fix LFPS detect threshold
 control
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rockchip-usbdp-cleanup-v10-9-a392711ca8a9@collabora.com>
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
 William Wu <william.wu@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1521;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=6XR1qE8oQQO8DmAkgt9+gIoazIh1eRLq97pcAr0j0tg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpH+8sazDVjfQZXi5jTGdCvo3IFdDTrVc8Hz
 CNgKE2jmcsIDIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqR/vLAAoJENju1/PI
 O/qa8IkP/i3g4MzkciXnYvQhMve2TR7g8Kqxw4HGtfTvc2tHnfL5by9NFhi5R5M/2gu0ldJpCOE
 3bTvk3CRfzTTSRUbsjIPSicpgEmZ344ti6PBun3KK/rU5zz4TigYFXCwIcFkOW3b7Z8av0GwW1m
 eus8mlBnTm1fdvLqg44EatJvXroIMF9/7/Ad71HQkB+QOaLFJptbtI+d54k02TGM2LI+wqOpVLM
 sGrVIITGX5ME+0sZnkKTacoIkM0ndk0ZEPwYeqsZImCQCin91M675Bpq4q6+uLO8teUSJy66hSf
 gUe5AKnMQ5rOKlhU3iPbRJiyl/Yx8p7tabBy8Whjz/WUm2jk0AHsxJfHE1gYO+Y3LdfoYhpF8zE
 ZyjhBkUz146S23+x4yNbDW0FdK+1ze6h2cnWpvibp0PUvWspoSDK4PpRS39BzKPlwhB9/IMXMcq
 fQwrPmwhiI1/3s/8fKcgWYvoujAjD8ES+E8am+VY2jpZ7i/4h6mCysW1PnOyRxeR88A/LHxI7Nw
 eMUS3P7710fp28LNJdRzfPWbsos80Vpq7208SDCOYWB4c7WqF60Rfe53n7a0buyR+IVVR1AOQ5M
 mb3lFOwUHo6XhQo/QjXkg6bqyU1Nn8bqBQKkm4DTOcLcrx8v8dJdfocl0bY9/5C5FogAn32AgLy
 3RYXSkbxnMAAXTnsMsSE9mQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

From: William Wu <william.wu@rock-chips.com>

According to the LFPS Tx Low Power/LFPS Rx Detect Threshold [1],
the device under test(DUT) must not respond if LFPS below the
minimum LFPS Rx Detect Threshold 100mV. Test fail on Rockchip
platforms, because the default LFPS detect threshold is set to
65mV.

The USBDP PHY LFPS detect threshold voltage could be set to
30mV ~ 140mV, and since there could be 10-20% PVT variation,
we set LFPS detect threshold voltage to 110mV.

[1] https://compliance.usb.org/resources/LFPS_Rx_Tx_Low_Power_Compliance_Update_Rev5.pdf

Signed-off-by: William Wu <william.wu@rock-chips.com>
[Taken over from rockchip's kernel tree; the registers are not described
in the TRM]
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index cb6acadfbccf..982315535caf 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -413,7 +413,8 @@ static const struct reg_sequence rk_udphy_init_sequence[] = {
 	{0x0070, 0x7d}, {0x0074, 0x68},
 	{0x0af4, 0x1a}, {0x1af4, 0x1a},
 	{0x0440, 0x3f}, {0x10d4, 0x08},
-	{0x20d4, 0x08}, {0x0024, 0x6e}
+	{0x20d4, 0x08}, {0x0024, 0x6e},
+	{0x09c0, 0x0a}, {0x19c0, 0x0a}
 };
 
 static inline int rk_udphy_grfreg_write(struct regmap *base,

-- 
2.53.0

