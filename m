Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E03E4322F1;
	Thu, 13 Aug 2026 20:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654672; cv=none; b=HmHOOoBaHTyj3X/n4EkRIgwe9ThhIISzy/AT8qAbJfQ7GnsIkQdrh2dHH/bhTKFvEjY+Mt5RxXeHs8i0yC7mjHcZU1n+9sCBlCHeeCJtu6Su59jvT2Z4g6kTHxTsjkf5MngXGo/eYNWXWDsZ+vqYoyS1QEr4vKno39KR7xv3Io4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654672; c=relaxed/simple;
	bh=GHi/0FLE10kzyAmrm07WFRDt6rwX8EVRnOD0MyaLeJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZjQny1T9kB/V9WyQw4htU0iSV81P+biaOuKwubiJ/qQnQSEi7GZ0hDjl0MchOH4UdF/t7MGaDjgqZVdk6lAclCsCRJYYWUeumu5NPnDqfQqzz9LLYdxaX6s9Zj2yyn5z3TfRAxYd9iqwot52t21WajrVImUPgEW9CEmKb/NHK5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=f7SGli9w; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="f7SGli9w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654668;
	bh=GHi/0FLE10kzyAmrm07WFRDt6rwX8EVRnOD0MyaLeJY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f7SGli9wg8ZxFYynXep8y2sCZm17P46mGiXOgCK7otAHi1xB4cDNSj9ezTfl4N0CQ
	 6OBKpueX4MRwTC7ucJwKhxMR2I6wgB+WUp0yHsVgZMGmaSQ9ugWXZjqrULdsBKxkSa
	 03u4Mgb1bUPQ5vbPg6Wv9pwbz640YhwGEUnS5y5PEegS4IFqxfNjiGYgcHxsLqYqRB
	 9zu1QbP1VLI5Gboik2VEA4qvtYyMx907h79aEFUEindv8ymVq55hbeQx4goRNY3Ekc
	 mER6G8JLSkyHRrio8iahXTozDONaBMQ2jrXhlBNGz8ipujZ+LVTv4xbJ+CAH4OFPwJ
	 NGfMLGP44NBFQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 93EC017E0F83;
	Thu, 13 Aug 2026 22:57:48 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id CE40148007C; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:52:20 +0200
Subject: [PATCH v14 37/38] phy: rockchip: usbdp: Re-init PHY on mux change
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-37-b5ad9c68fa11@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1119;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=GHi/0FLE10kzyAmrm07WFRDt6rwX8EVRnOD0MyaLeJY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmUTSX0JDAOgsQKAZtnwnYa5DdOH9Zh+9
 sLairNH6I5T94kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5lAAoJENju1/PI
 O/qaW4YP/1JZq4gwKo3oHTtABtWAa3Si6DOlj1fAcak7W1/qzZw/Y7fGkAgbVFhaRedokSjjVWu
 wa3IvTcM2hxoKCJqJQzHEEHKMIuSAX6MzYJKcBkfuNNBOhXr0VzTOpXcBeGiAPiUAGn/zaxkNxr
 M1nMeFMXGW3blwjj04lXhpEWY2T5Q9GvqT/Y7hTvyqdODz9892v+y36iWISLdo+vDp7sR5lodLj
 F5BV752jyBcbC2ti0ekpBKRhgtr+iQyeCNX97TeYL6Fm+ARhW0NPtP/VemAAyXvOA1Z2M4WD+tY
 2jiYP/VgTurE85DOOI0E6AFL3VbZuk5zejJcHro3Rvl21nnhfe1wR3HpoXaPRE2BqFLdq5QJgW9
 Bj4DhjucKudph0qyAVR65yYmGgyHx5LkMt690T011/tIrgVbH736zOF0Ie6WzuWMcv7gGkQkCmr
 c2hIfE7HY9kbqyd4LAoTcUtC7fwmU0QQsxaXs2HpakYXEdCoDblj35tDyT8cTaRi1HY1ZFF0Axc
 Nz42Eqvg007rY0C+iz5zOTmRnmJaecyqQhIAMZ5qpWZNvYnu+JSzaEvght6OOb4PbnYTysRAn77
 SKOWk0DcQ1WXyGvLGPzF/vYnclWifha7XvFtXzixkMAFabl+9+lcGSR6Kc6Jxae/otYJLVOqPa/
 JZLU/C4Mo9IMv+uaMPpQuOw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Ensure that the right part of the PHY are powered up when the
mode changes. This ensures the PHY is re-initialized in the
following two scenarios, which are currently broken:

 - cable orientation changes without DP being involved
 - switching from DP-only into a mode with USB support

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index e597cdfe8d79..87d6df682176 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1392,7 +1392,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 
 	rk_udphy_set_typec_state(udphy, state->mode);
 
-	return 0;
+	return rk_udphy_update_power_state(udphy);
 }
 
 static void rk_udphy_typec_mux_unregister(void *data)

-- 
2.53.0

