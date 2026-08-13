Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355FB435EF6;
	Thu, 13 Aug 2026 20:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654320; cv=none; b=Bo0CJ90GBX6ymrg6qNg2TvjgyQH4udNEZzKYrP2pyjBZZvZxCfJy8J/A4/jyRwiFxIjomHVHVwj79FmGgd3GxiQn5iZ3mZ8cX2xjd5ugAGcvgP7LBlvvonjRouCS5VXz2SbqP8oKSaXtVvpZBAnbB7HD3GXQ+PRTv7E4Fg167FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654320; c=relaxed/simple;
	bh=20xVezG/aoq+Y1n26hPOfHEq7PggtuiY4/FZU3WwQuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XfQBZgFMD8vODjmG4s+ZjVInvU1N+hnElbXfkoWDrX7t2pM/yDXPqbuov7Y4wFibGdpH6kYlr5VkEYg5nx15MLgy/rXVEgAD/OWGO+AAnU7hnBQV4ZJABjbO1LjRIvJPvqHtIP/RC7g0wXTxEcG1Rm5PvTwJpJ8VkU5PGQEGSV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WlbfRYpk; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WlbfRYpk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654310;
	bh=20xVezG/aoq+Y1n26hPOfHEq7PggtuiY4/FZU3WwQuA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WlbfRYpkOaUaoB/ODwtfU06EYD1Mf6uv8mCgm59zTockvqgZ9csdnj7dZ/+G+I3te
	 GIbZuudJmP3hlCmmKFcpYySTUnxz+3ZqQP+7oXpkk6LcJ6k3P/XnF047CeGRR6W5DL
	 5WfxjL2SkjVhrRddG1tgCyP24SLfw5vo9w4/2qCV5z1kM3jROTDE7oJ2jmsYh/DGGV
	 mOIpdninKu4lL+6WrF9YTfu+/eguBUlo8+iNlF9hLpGnDdbEFPJnzwh/w0sXu7rW3R
	 Z3fHx3/juRJtT/9lRwmlotv08lRBdAdOkOTe6VWzBDOvP5QBDKFl7q6S+UTeQvwxP7
	 TE6DECo3o+Vfw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3102F17E0FE2;
	Thu, 13 Aug 2026 22:51:50 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 9B075480031; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:51:48 +0200
Subject: [PATCH v14 05/38] phy: rockchip: usbdp: Handle missing clock-names
 DT property gracefully
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-5-b5ad9c68fa11@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1371;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=20xVezG/aoq+Y1n26hPOfHEq7PggtuiY4/FZU3WwQuA=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmQV72VH7PDUPxVGtlNI5yvPN3oN8O/N/
 FGZ6kjsw0g4mokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5kAAoJENju1/PI
 O/qaaUEP/iILz7vBaDsawtx/OnM8KgfpPZ3OAvkWlPT31I33k1/OKlJfrQiyQxGlyRcQyWyYrb/
 kUPx6UjKKoaKVvhjaNY5DJttf8Wd2gJMGkNl3bV8Tv3Hvem3qB9Lw0d+LTzTaZQ71Ecb3SS2mmd
 odTxCnyOAOUFEOp1lOX0h2L5YCzAn6/BZ8N47xzVcMOQ7hlxaS7XKJYy/+/ozGM53mz/+q+g4TD
 gVZ5GtKQv/i3NZKTfaneS1JZ1VtH9mbKw6w8ieualH4C5+6cRYsuPRfR22LaOIGyFnFMNna3L1R
 RW4ndySds+EdbcleTHim+B+cAey/73sZ2zGnnuLzPUW1FgLVEvbiUnrmblTho9VTUSRHfV6s6c0
 9BGR8PhsKZQnTzQltyYLy0fd9iAWZ3RraA6oUnpJ44Z3wYZdthEx5t1o6yxmcGXHDnqwj8zM8iO
 vVvEWnVH/PFa0wt7KTLfc3VpGKMpVmvigcUeEeOC0tuPh2wd4RTUXWcPY8TeciSJsBi4CY7KID4
 CrP5EqqwHPbO8NdkmGr5Kvs6FKtFyxuuVTAq9L0m9FN0qwWE2Eesc/bi/T97Hg8a9X/X2IfJBfp
 v1GRY7jUSOdIYlKBgY2dVDzuSf6iTltn3+ZxuCR6jW6BRZYSQmI/N5PpSDgMs1vOy4ixzDqP0sF
 enaK3gR1v2v3KJVA0IuYz3A==
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
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
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

