Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D14449996;
	Thu,  9 Jul 2026 19:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783623754; cv=none; b=rVbp5fSihpgY2FQdL/ddt9iWXb3qcbXWWLKixcuFf07H8JRRrRip8NZvQNK4BanvjZboa13O5OwfNPqeOM4p8+o7opaIdeYSeAkQVcva5AqFtd0NrDA830GVTJA0JITyYhyzc2nJoktGrj/owVyYl/JNY8DImlXRYyuYQrNl3Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783623754; c=relaxed/simple;
	bh=USg1ohYmbXwetA6mCilQyNqt0XA2ZTz/AW7yPMSqQVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E8Oyrz+OIZSHeQ2oZ/h+sRYcsiYyXE9kGX+AJrO/Amuu3ACnIlOoZ3lSLAN0qs5aDZ6sp2fjx1srEifEizAu1wv4wC3KZsYwuYHijM+PcvHhMQUDsvanc5dlvF/U/aiRReydwSpkOnjWFAtZZ0bsBaQFDYUpweBHPWFTbvVn9r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JxBbp28I; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JxBbp28I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623750;
	bh=USg1ohYmbXwetA6mCilQyNqt0XA2ZTz/AW7yPMSqQVI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JxBbp28IeG77Q8VIQQ1v03MHdFKS9mAWTZaBaajxY6KU/zBEybc/oWEKzM5iovdrY
	 sgpLAAOIrqKwlb7IK3FJyxeCTQhwdnN9fRkWvxMQen2A64j6LlBXMvG3ZYffE+Sde+
	 QxTa8XU7yJr0UWJpyR38ODsLAQus/AvIQcNd6psgzJzkT14JaaxKl3k+UhF94MnRhv
	 ef/QN+Sh44G9c/oV0SLM1ZTNFeSGcorWIbAV627iLf/+AM2V8N2UF83J8/EpI3kRD7
	 6W3h3XtbsvewP62poapAUZeKkrzlfjGxyiTrGeIb/vSSqWItU33OU7mXiC0UdELu9s
	 H96yqXko/FfwA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EB39B17E071A;
	Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A3EF248002C; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:25 +0200
Subject: [PATCH v11 02/36] phy: rockchip: usbdp: Update mode_change after
 error handling
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-2-a149ac60f76c@collabora.com>
References: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
In-Reply-To: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1789;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=USg1ohYmbXwetA6mCilQyNqt0XA2ZTz/AW7yPMSqQVI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8ES7ysgTTpTXb5AQ+D95NgmwHuZMK9sRj
 lsDrN39g/n47YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BEAAoJENju1/PI
 O/qaY28P/3pbW+RrXaw9dOiSQlMDRTLuTLMYDef9qXOTFRv7uINJ+NaNw8FeAQrb/BgeWD08UT5
 ZjxXyVsbKdfcQNUMfrdDEN6q/Wwep0KE34dLHOL3Oq/wl8DqWLadHHaLBq5w+EZ8e1ggMDjlBTi
 vO/NGzoQV4/7gMZWWdU5vs60UTy7IHgy8UEieG/NmfUUH8ZlxmuYEZB7LEShlN1Ku3eFd1Zc57k
 gYQ+iHHFGhJpiVkN2Qlju+KxsRiuRMFykqa7lHIXTfQweF5nPrvNePfD98w4TBdd7OaSPIxSg74
 KSto8Jorvhe4nR/q5IN+EbAmOHFmXrDQsl/USiPiFaVimp6bSlyT5Sui5U1hhl8wGZopDVfA+V5
 m79bEtDB0ifGTgTMOtnCwaBqINO5b9c836aFXaEAGC2MlusuZeix09CS4GEXeR0KuTkFZci4266
 3Jja+vNqL295fRWLqXKblpUDlYAtVKL7S8e6yPwsO9lMprzVe2yCiHfIVIPNtmKsig1UtCMiw0m
 xfp4LMpFgCLRlf9zuvao1KdpO6GIYm5CMQjVxqi/S9w2E4kU8wUv0QSbvwT+NgZGHLUeciElaVx
 mKKvUPtlRhd1KP9CZTE2KYuKKQZU/oAYZkFoTIwhrVe8W1WpdpxI7ku/kx/RHYSZb+8HIVw2PA8
 jNdvL1MBp9nYPACJBYQ8njg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

If rk_udphy_init() or rk_udphy_setup() fails, the reinit will not be
tried again. Fix this by only updating the variable after all potential
errors have been handled.

Note, that no errors have been seen on real hardware and failures would
most likely be fatal and require at least a full reboot as the function
already asserts the PHY reset lines. So this is more of a theoretical
issue.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612163835.8D5471F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index fba35510d88c..a5ffdf7a6e76 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1000,15 +1000,14 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 	}
 
 	if (udphy->status == UDPHY_MODE_NONE) {
-		udphy->mode_change = false;
 		ret = rk_udphy_setup(udphy);
 		if (ret)
 			return ret;
 
 		if (udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
-	} else if (udphy->mode_change) {
 		udphy->mode_change = false;
+	} else if (udphy->mode_change) {
 		udphy->status = UDPHY_MODE_NONE;
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
@@ -1017,6 +1016,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		ret = rk_udphy_setup(udphy);
 		if (ret)
 			return ret;
+		udphy->mode_change = false;
 	}
 
 	udphy->status |= mode;

-- 
2.53.0

