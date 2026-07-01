Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEEB3B5DED;
	Wed,  1 Jul 2026 23:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782948952; cv=none; b=FZ0jDwqMzBuIXpiC0T6ubhpbY44fh/tNut51IOPev7jj/MluBlCu+BKRxW2BmUnkK/V9AQrHDHEtdXm/ZNMnKPn/ynnuSN1k/sYug+dGAPQgq9TMpF7La2j1QNoEl2ZlRdu2bQ6iTsjug3ZdYuMOqM4H2nFN5rDI8NgRJMzv96I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782948952; c=relaxed/simple;
	bh=1p3WFYm3nPwFyjx+ldeJOnj6dqBA+X1XeNTC11p7Zk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g9sqwEp2nW9bqik2RCdMRqcYmjGJ6kk+kbb1M+72EglC8f7AE0mla2BIC6rQ+qwDHau0ko75k22n4BPkhph37t33dctpCuY2DURSdtPYfemDEXGG+NOHjD5FH569cDUHoTg10mKQSZSrwLE0qOBlcya6sqWsx1jVRFs2s7QBEP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YoMUFsFH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YoMUFsFH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948949;
	bh=1p3WFYm3nPwFyjx+ldeJOnj6dqBA+X1XeNTC11p7Zk4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YoMUFsFHXhAOV+KtRAbs+cfk89PImJb5NIDyfc9YFzs3KdDBTKAZkjaWQaKHSMIoq
	 M6/ZlPqVHLMJbj1OCo7IFhcpnBdgp6Ae6DQ6+qujvLLmCZHc2M/uGGKHM1kRJ8z9Rd
	 5GgBRlBKm4SNyLgw7rxhaTs1V95V4JYOZBmmmiUX4o1jjWuAfVjucJvun3FVXLfrDp
	 nWfWjOZTl882UGONZ8xxC/vzlvfkrLcTpsXc8dg2594B1wsMaShhobrVu7PXq14FkN
	 XVYdgZoi7U1PBgeMjqxZekGXFpLc0dR0Ce6wsKwmoxtiqOmXKkvVvSKBqdjYrU6NQ0
	 CTYAkUGNl/akw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 05E3817E0FDF;
	Thu,  2 Jul 2026 01:35:49 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id B21E4480030; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:35:42 +0200
Subject: [PATCH v9 04/38] phy: rockchip: usbdp: Fix devm_clk_bulk_get_all
 check
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-4-e31efbb62d2e@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1653;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=1p3WFYm3nPwFyjx+ldeJOnj6dqBA+X1XeNTC11p7Zk4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFO3kBNo9YIDzmvN4ePDG+z470pGIv1VE
 BTHpgF0Ul0VN4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRTAAoJENju1/PI
 O/qay1gP/ir2nLXhbm1d7EDMQrSeTl4RXqFNa5d9AVeu5hOsk+j8Btee4OI1HWVWwyIFENMbb3V
 r0K5hwmF2XbFmEqRqJfsrXGnFVBAa5QMdQcxXlAGWAi0pjZuXaC+m1CiUeoKNAoox4hw3k4TY5z
 i+xsNigvPNWKrigam1T3FHoxi2NcWD7VA3RX3579dB9eWI9zkJ1j82UfPxkXvnGi5DTn8Cw2Rnp
 2kzX/uW+9a4K8lfKpLZ1M4vX0c5jT9CSaXdD8CNGv8xlO7iuotX9aikAjup0aw2jQ/QrlErYX/l
 iGQzzsnD0BZIU5ODDw9xvyiTiOUyhLFvS5KCNO4ivjY0cNSJ+BJ2avErTJlDR8sY7Q0JMqmb5F7
 d1CRzU9Q7VR/jpcd+nltCw4t9BjCMJMDc7vGtpyUEJImPVw5PR8soANQ/AutyLRK+uVjhGIMv05
 BVq33zv8eV1xAiLrLYclBJkRGcoqX6W7pi5daI8aqQuk6GxEK8wQFleeE9m3vgtcc0ves0OxkVy
 lZJ+n/Kxd7xsrggHiKpij4RSgFAZhtcBU9WN6SUlWIMYJPaNKPNRjh5EATjAV+U8cGx6VF7qT0n
 xkgDUuS/3vP3oENS7f7hVD1sEgPtxPI9rYb201POBi2tC/vBLOTnJa7L1smGuNwcQ/Q34AEsoCN
 KXHONFElHo6J5HtRSnNIr+w==
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

