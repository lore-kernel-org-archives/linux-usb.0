Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588FA4399F8;
	Thu, 13 Aug 2026 20:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654329; cv=none; b=FaqGHjq5rLcJ25Uxtb37ptweqYol8AwgsbOlqUuuADWCycteVw0RyG/oB2VkhXOiyGFXVLLsKQnxmEb2v4yITAU4jRE8HU95VQRdlmJvk/dnwd7ynTy3vr5iWiSrC6tZr0u1SOcvqvIzi6xIJ24GN538laWvm6r1dkQP62kB0dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654329; c=relaxed/simple;
	bh=44ZpQFUM80vYgox7xZ/LA1egQ+gyiMQUbepipkmRbak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AwvXuwW62GCodV5uFZ+SN+5RBRuDuAcWh1AwHtTmkYC6wD3kJNL15azlF+Q19RxHOZZ7jeX18ARY5oy839AKf+7yh4LHVXiTHW36wmEfQSRIDAGLH0iD8rGZyidj+M6Lpm1YAKMt3rwzumbbJlYJvxpJf9qL5qk5dVs7HAzgCp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=d1UaQ369; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="d1UaQ369"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654310;
	bh=44ZpQFUM80vYgox7xZ/LA1egQ+gyiMQUbepipkmRbak=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=d1UaQ369FD+Y8Xt4k3Dy/70w4jvZc1mvfgkpvd5i6JzS0kHaFQ5Rfptpr4v8ncAEy
	 RjZ9r056brVPPWgG8DnietpSChRALAA/nSR1PbkiBb4IN5ZBLFVjjIKKI0yum0Dc3P
	 mPn9my9Qtv6zQwywXK7P6SentnP2TCpeht6P1l3zqm3t/XwPV3+4/Mp9R9XvSfJbTQ
	 GfgpFKaIwADIuvfp54grCNcZp5675RAFXoFqOenNDXK7UlP4CL0kFqJMwkutJXA7Bg
	 WYVnGC8bcaDviERVBCiLcpqBIZ9ObfHKW9O+0Q3yO6FlxEO3UdMI2hC2HlnDO0xiIv
	 HRa5a2NYLIRBw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B79BE17E14D0;
	Thu, 13 Aug 2026 22:51:50 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id B7B92480069; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:52:06 +0200
Subject: [PATCH v14 23/38] phy: rockchip: usbdp: Hold mutex in DP PHY
 configure
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-23-b5ad9c68fa11@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1410;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=44ZpQFUM80vYgox7xZ/LA1egQ+gyiMQUbepipkmRbak=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmQaXXlHODS7QxbxdpWo5a4aJ77ht96kR
 t4iHcxRu4695IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5kAAoJENju1/PI
 O/qafFcP/RbtX86JnHjpEjJrAPd5foYzfWkkebm73/F5nmwDk7Hut4ajtV7CvtPxTko7dl4x0Lq
 chgbxf4x4ht7KWZfMJd1+eGF7Ow/6k0tucoBQBdP4uy0CCzYET3AbK8xrcwGGlRhBjJNDTBsZmQ
 kRlIdVu5+NWhfZSMrhm//b5TdBm7K8VStH9PvyPYq5gWLqfrjN+Xs7I00gnw9B5reo0i5NUX7CY
 gg6/p9xQUgcXlNv7/tCgx4UMwLfSwMSTtSqIXdo1GMPwLmFdoWELF3O75MzgMtfYA8SwGsa0UUQ
 bSjx9nRb9fiDIxPx0W5OSJNnTdcwnBoqrDp6gve6FBlhZf1Kj5jcddAy7uK9vF0Y3iaiCS3kDsH
 Jttvlk02CI1ZLMyTIG7mhPWYH0bXe/S+ASdq1W7msTuEqyhyoGlqX6n93MHIYJEDqqKPnkJ6C/u
 48B0N5q3e8k2ENbxDukU7UiX9Ryp7iOCgXOsZ/6MUBA89MRSgLi82Lyf97YuuDpF/4kKZYdBIto
 SwfO4QMLU6v+NH/KvURH1xLZTpoGJ1z2SzkrW88rkAMs7poxhOT2Kb2BCxfZIvEZHUGY729c+7I
 i/3cgySgyfcJ+vyBShY7yvgrSl7BToe4+kSqtdb/6INGGKE+p78gMlKYoqTcBSx/JBVjgqkw7Ia
 BDsSY8NwuUuPEQSSVc84qnw==
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
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
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

