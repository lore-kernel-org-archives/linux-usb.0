Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8623911A2;
	Thu, 13 Aug 2026 20:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654314; cv=none; b=c4ELXMgDlRGcx4RjOi7lFfHfW4/P+CyzasK4TULed2lrMmRq3Ky4BnFMGqom5M/+4kMiFGFXZns8Gla2xWR2oa0K0+jPsGq3lo/QHCqubQ+QJfl0PTtiQL7l9AgPHfvQEYsFK/LgODoSSgXDQyETNc64dKXER0MyJ6Hh4u1O7hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654314; c=relaxed/simple;
	bh=g2eUspn6SpAhrvG2oCpesFUQvKlLr9UwfL3mIyZ84IY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AgNpjKLpi3b+3pVtku7lC0TsoHImvLL9MAWxRvEJv1QgiJpTR8rLWxqAMXcF0YtgFsSolzlFfbi6d+KheMDoA7lsUdJWQBR7Qud4tu1+h4y3rewPUxf5Jfnbc1SeQ4g74uBRExCcGPMEuMdawKxN2GNevBGvIOe74zzM4UNETO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lb2UQNtT; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lb2UQNtT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654310;
	bh=g2eUspn6SpAhrvG2oCpesFUQvKlLr9UwfL3mIyZ84IY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lb2UQNtTlLLQ97/trVmi69xVdXrIyDyQZ1AceQMF1M3OXW/1n0+wCJ1o9jcOciUjl
	 auQXIsmmKPwE7RSIjEJ7qDkxoLKjTq+s6DO2SjyyhqpUlxQul+rRXnS80UJ6/9+DAk
	 RWKYE8ptapVYxYXXinZZ1mIo9IEF272IDa5sDP7C4MP9U4RLwy9vnq82ScUHH28L1q
	 qNdeBYyeL1zs3TOkoDqf+YMM7uieIXPbZ0I/OKQLGQX0zupl6dBbjfduphJGGjtemB
	 L0D6/GRV9uiVtoVubFfnGKsVVba/23W6kpymOQPOsK/Qksnusnm5jBFZDnzx6e3vo+
	 7H3kcIOpwuc1w==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DA11817E0F85;
	Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 996C3480030; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:51:47 +0200
Subject: [PATCH v14 04/38] phy: rockchip: usbdp: Fix devm_clk_bulk_get_all
 check
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-4-b5ad9c68fa11@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1722;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=g2eUspn6SpAhrvG2oCpesFUQvKlLr9UwfL3mIyZ84IY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmQxNzUboEkFepUDK3bfPmtoL3FYp0VrY
 /jTY2+qmYzok4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5kAAoJENju1/PI
 O/qaTowP/Avk67aTGzGpIyFHaV5g13+gq8pnAWdleaJ+67Q0UWNTU50cD06DQAy+pLvCj3T0mxS
 S7Ku39rrkP6kwM2FTWFQbFzuhlrDe44TqQ5I87D0ea83EkSZ6BjIYfDzWM0KMIMzMYlbtr8meWJ
 k+CsNY2Zkcy/4Wi5mz9EEoOHFhjL9R4VW532yzxuDaauGUFko3cT6t84Jf4ImE+JAlqb1cTBaJN
 OtBgGMfd92a0GjBQogdklD7cvLu/2dphar/ESU289DhmI5yKJoZAT0ElF900CbjOxGwTstyRXRI
 GPFe1AS3+HL8Lh/Pz+g/4935asmizx2dMbmct10LPkhlciyw65gxRVGTRwlc/w3YfzQwvVliC0X
 zwJkGL0hWh5F56sWR6HGYg0a/9fGUZyhhCSXhHDI0Lb+YQhvtG97CBnxc3ifitibsW0cqEkgnV3
 sQWurAu2GrczkIhaveQEjzu1LsRhCS2yQ6Kj5SMI0bRjW3N6+Pf+ZKCnhT/954MTNxnxU27W0dS
 kmPuzOgjhoxQs2WfTZwvunpYteK/VFj6pAoulWfIEhb3qKSOARWkTkjs/nz7wATLbbLqQlOcSNh
 wjI1WU1llGwiX36FjMWHwzhbUw/AwKdx31YcW6TRsZHsjZl5bT4HLVRTMk4Xk3Lw5ZP/dHf41QR
 zlv6va7/j5uPYKjb4LOgmTQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

If devm_clk_bulk_get_all() returns -EPROBE_DEFER, it is replaced with
-ENODEV, permanently failing the driver probe instead of allowing it to
defer. Avoid masking the error code to fix the issue.

This effectively drops returning -ENODEV in case no clocks are being
described in DT. This special case will now be handled by the follow-up
check searching for "refclk" and exit with -EINVAL.

None of this will be hit in practice, since the driver is only used by
RK3588 and RK3576 - on these platforms the DT is validated to contain
the clocks and the clock driver is force probed early. Thus there is
no need to backport this.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612164107.C7DB21F000E9@smtp.kernel.org/
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 12dfdd470a78..2845a012eafc 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -427,8 +427,8 @@ static int rk_udphy_clk_init(struct rk_udphy *udphy, struct device *dev)
 	int i;
 
 	udphy->num_clks = devm_clk_bulk_get_all(dev, &udphy->clks);
-	if (udphy->num_clks < 1)
-		return -ENODEV;
+	if (udphy->num_clks < 0)
+		return udphy->num_clks;
 
 	/* used for configure phy reference clock frequency */
 	for (i = 0; i < udphy->num_clks; i++) {

-- 
2.53.0

