Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52E32931E5;
	Tue, 14 Jul 2026 19:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057730; cv=none; b=C7FqNa7gY5PvKWN+FH1tuwfhhNeKXcxPiRh1rtOic2UaEH+TJ1lIsHysWcg2ctvQ+GAhktMPlpRn4LQwvXLgpqF+2HXHchI55ER+f358Fd3ddCq0ObkUnq0l1DL3Y2z+/Z7fCWB9VS0x3Sj6KHi2iHWs46OOXhujduZIxfyuC94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057730; c=relaxed/simple;
	bh=XnGWSO19nxa7H3lR2hHiYjO4JN4FWtYOwARby5EoDv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DNldiTKNI4NF/VCEI8hyLdOCgYtczgvoBZC4iHs/AI81V+Y1VjGpvLptlsTc+6XxiCh6vHLNumfE/wdhS5qAxIR7wHJCwrZB1LbnLYGc26N6AJjLU/gxaCvNdKVUjwkR1xNkWwckKyMMlctf9ZqRGE/dMBtCFOYYuSdHHXB+0xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SQWUQlKh; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SQWUQlKh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057726;
	bh=XnGWSO19nxa7H3lR2hHiYjO4JN4FWtYOwARby5EoDv8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SQWUQlKhXJa35D7BkJK6cOKbd2j3QSrADMgmVon67uQXN2GRsYNkSG4vJEc+SvijK
	 dj4rvAfm7vCJPZsewVioNPVQ8LQyxr3Unai9oueirbOw02KTzn5v8CpH7M+zt/rS5Z
	 vC6w04v92jwvCiMjLj69CKNl3Mccux838Q3RQh4sgVMYe6B9SERsA59oVSPZM2ThI1
	 4IUaA65MNJ8p3B8e3v0iWisKFuuwtn8o9MBT6u01rN+QgepwlDF9k9U5oLis2xJucY
	 EqapUFzOoi3dbE1HLPGbo9BCU4JELnamJi/flrl8rMN8CyBCBcYMWjJNWlcat4DONW
	 407Y7wIqLlfvg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D477417E0E6C;
	Tue, 14 Jul 2026 21:35:25 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id F0E89480069; Tue, 14 Jul 2026 21:26:08 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:24 +0200
Subject: [PATCH v13 23/35] phy: rockchip: usbdp: Hold mutex in DP PHY
 configure
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-23-6cb3e769d4c5@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=XnGWSO19nxa7H3lR2hHiYjO4JN4FWtYOwARby5EoDv8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjVDAAG31sid71ysbx50MacX7tWE741gJP
 HB3v8Ea0bZu94kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1QAAoJENju1/PI
 O/qaf7EP/3ioOJPL8WJRM+lHmnUUI3r36rF4wLjVpo9PqvezWDJIaeUdzuQW4u7KU7h3r60TdVd
 /YBL38ezLOAYUGH7XWUYSxdQw2NpD6PFFI8ZZKGtOfXSOrUmQo1L/zC2iAnZsx+qIB3O9ywc11j
 LnPRioBC/z8ZuUc2Mu5wluMqSpk4gQoO3BC+GHtuekeAXRJY3+DfFevIG1+38tXtiqGMvvBnjj/
 sH9khdxd9fHBCbwtiitP+Y+ZRDfByhi/d4zey7MkO/KKUnllN3ka2jpDFf/3ydeNrDvzrlha7Ke
 s6aHB7UjJdgSVDCG8jwf3KEQ+sld07H/oQ5xjxXm8Yvq3Jk+wYoH0NMMTc24OHk5U/sRZiS0HA7
 6H0csk0rmkSHI1Clq8PvjUw1BJ3oUa/DMgiHrQoIKCOPmniWoRqwL6982lNE5DNrXzGqMWhaspe
 fhUPg1b+jE3kXK6oNbVLgq4jC92CnQmBt6xPcwfKQWR+33woiOutTreffyuznMOAR/NVU6UFzQS
 LvJexD9DSMHUmc9sWhEgVpGB+AWi/oO3HcBg5eDu4r4HzzaBXq1bvT47Rvile7h2zCa9q2vxEip
 WrzCRYi14ruAVpJl0J+EBbrbQc3sQS0F3NzbaqxvHZH2ELXyM0HkVRqB0KkwoSpJejk62g3IHt3
 27PGv8hvgnmXu62ZspPw+MA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

rk_udphy_dp_phy_configure() accesses some variables from the struct
rk_udphy, which are updated independently from the USB-C framework.

The USB-C mux/orientation switch functions already hold a mutex to
ensure mutual exclusive access to the struct rk_udphy states, so
simply hold the same one in the DP PHY configuration function.

Reproducing problems due to this on real hardware would be really hard,
but could be possible when quickly re-connecting the USB-C connector.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612164627.23D391F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 8c165bcab796..b40b5d9ce587 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1154,6 +1154,8 @@ static int rk_udphy_dp_phy_configure(struct phy *phy,
 	u32 i, val, lane;
 	int ret;
 
+	guard(mutex)(&udphy->mutex);
+
 	if (dp->set_rate) {
 		ret = rk_udphy_dp_phy_verify_link_rate(udphy, dp);
 		if (ret)

-- 
2.53.0

