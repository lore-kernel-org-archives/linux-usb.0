Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3FA3242CA;
	Fri,  3 Jul 2026 18:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783102420; cv=none; b=UFpjcSsvwzHb0QxBUXsIOaA6Gaw5zz4AqInfMqanIvjUN+NXjWw3uzJadsPSHL9A6HPU8DZliLG6s2rik+QJsp+UJdlp8YZRKIiXs9C5hbTHc+RrRbPnF9IInrhOiAbfgZCe7HvijsNMzYOp1aYmDO+35tLb3Jn91+wRSEqTbRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783102420; c=relaxed/simple;
	bh=gjt94yB7OMQ1kbenpTWsg4rbaygeNwSXNZrsMwALuYQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CqnRKEMZ2RmAl66Oveqj56aU2l49LQgA0pGZUWnXLKGeD5iplELeArn+kVk+grM9pyDWSBfHtHNxW8pz4wHfsfc5JZ1mEBMyzHwQsrAg+HUt5HfywlDXaQlEeDw14ZFYI6FLNDs7PJ+1nxWJZ9Ew8KBGulNR49NukDkxiV0VtIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JL3oC9IX; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JL3oC9IX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783102413;
	bh=gjt94yB7OMQ1kbenpTWsg4rbaygeNwSXNZrsMwALuYQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JL3oC9IXXMSi3atxGXKazwNKJ1CRZ5svJR9xV8gVtjb5M3ExS1KptJ6Sx4Kpd9cCU
	 qtV7I8k72OAKKmt/s36Rj808VYrnJKdZdjM4h5YCoFBfkSKmceJflF4nsif1QepK8g
	 rI6n5tK1eFWOHTcN1HCmsuzYUitj8jevkQFEbommHAKKXstRtvUEU73a9WtPAFa655
	 FS4sBV5LFYKY8UHpbdVB9lF1Qmd1PfqczN52BX/ymmwODclfpUwG5vAnDMbsh3yfoY
	 TBkmNV/d5NN34fRSN08s5OLmWCm29z/bWuHKlNRfurGDxSnbPoBX4sughKDTaZKbh5
	 SBP72T0V99LjA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 221A017E1123;
	Fri,  3 Jul 2026 20:13:33 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 80563480031; Fri, 03 Jul 2026 20:13:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 03 Jul 2026 20:13:21 +0200
Subject: [PATCH v10 05/36] phy: rockchip: usbdp: Handle missing clock-names
 DT property gracefully
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rockchip-usbdp-cleanup-v10-5-a392711ca8a9@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1302;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=gjt94yB7OMQ1kbenpTWsg4rbaygeNwSXNZrsMwALuYQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpH+8tyg707WYxG+xVW2Xv12fOU8M6kcmUo3
 ZikGel4WMA5IIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqR/vLAAoJENju1/PI
 O/qat9EP+waNNc8Ls6igELDg6nTIpAWqTNlG/hFv9CeVwLdtQ/3nAEIo2TVQsoaLADf+YdVBDlc
 M0eXlDDuMZIb0VSIUEqhVuRaj2ri6oEKZLFY2QHDmznhKBFmu8LcwB4UqM1GyeuuTudjqqYpsNi
 uTqeZKF5HNcIldOXGbyS1HUkGhnuGmlcb/zhUtDR+ed5BhZOmY8V772dEuNORY6W8f/9cWt4Ekv
 8UcUY5RSgc/zygQozt8kAXG9ViRdyeeTvnHm+qQJl+QV66IKrZdiPPUzTqcJu2ViAYvTRX3Z2yX
 3PxuHTBD33ciSD7KUXedr9MFCRKM38qMvg4/Ta7mxvqdNwo+dtXGuoQh0eOzh+eWTIBUDj6juPC
 5G/Z6T3zxvNEeJO6xlT8WYHJ7y6Mempq0F1B1U0aU++sXdh5xmfmYzmfC5is/ldCaEpooenbykp
 CV1Rj4nGavT+jvoB/rsz+KfaYbsxdhOngO6f/XTrTmiy2lOGYNH4I1ZjRgA0hreHZZY514peojK
 NrpDzsPgBpwGRtAi6gfvu/AHy3EoT4cySwMn4bnW73RyTPSukYgBopj7rn2QQeeESYac6PpYphW
 VpfuZ/Wjm2QpKV8/rltlWQZhWI1lK8P49ZXMOa9K4gSvQlrlh+QVapQt7oUQh0KiFY1/XsJ6sq1
 kJGYszwkRMXhqCS6AOVgrxw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The rk_udphy_clk_init() function would currently try to do a strncmp for
a NULL pointer, if DT specifies 'clocks' property, but no 'clock-names'
property. Fix this by making sure the clock has an id string set.

Note that DT binding requires setting clock-names, so this is only a
problem when booting a non-compliant device tree.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260619154349.071321F000E9%40smtp.kernel.org
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 2845a012eafc..3fc8222fcaec 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -432,6 +432,9 @@ static int rk_udphy_clk_init(struct rk_udphy *udphy, struct device *dev)
 
 	/* used for configure phy reference clock frequency */
 	for (i = 0; i < udphy->num_clks; i++) {
+		if (!udphy->clks[i].id)
+			continue;
+
 		if (!strncmp(udphy->clks[i].id, "refclk", 6)) {
 			udphy->refclk = udphy->clks[i].clk;
 			break;

-- 
2.53.0

