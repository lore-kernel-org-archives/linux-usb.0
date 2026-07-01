Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF7840E8E2;
	Wed,  1 Jul 2026 23:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782948964; cv=none; b=IU0CnOO+PVMRvSD9ENYEP2AzUxwMgK5QkESIRY9c4KUB4OmhioHsdlmgtOS4E5LahIa4IX6J1Vp+sbw5WED0gAwns4+lVvvOJaQT+LGfx3MaFlAtgO4XBlZPsql/weXETQMkH5YW/bKaT5lh8MIaQT2EqJ5XAQvUKZ/dsgMPIsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782948964; c=relaxed/simple;
	bh=y1K38988NOGNjrWDX39V0tM+tzGRa5eL8tR+BuYD8RM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pi/aMiVCa888CCUzu88fYI9o5lyuVQxKE1SF0VtC2qxLXjM1rBkomARMtlkb4Xu6a9djNzcgILFy3IDNAanGhT3UyxAiwB4akXrkRvRH8Kp5vLRquz8uEZxJikGkLwoDTdE3MsykFAWM3fLmlLxaob76ubjNG/oJxZrSovRlqEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fte/d0iZ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fte/d0iZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948950;
	bh=y1K38988NOGNjrWDX39V0tM+tzGRa5eL8tR+BuYD8RM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fte/d0iZq+OLvpUfy6Hrv7d21+g9YMofSExIkS8k+FiewC3JpNXMXVelGiMvVrRtw
	 PIf+kdEYi+I9nlGJSQxczBYYCXQPo98yUnzY/J6o9KSLoTUa/hc1jG3wSRtMbA5mC0
	 hyb4l/2ErpMpMAujFMdGMx5SkrZmNj9IowbEqmPYhKVzsa2oBFE9K0vAuNf1NNZc8E
	 ZMbb8h6sHfUzdcvGuCdL7EATaBdiGJUa2x5U8tZq76RXGf/8v2zhoV/k+pWT3zRwTY
	 1NCVHG6V513SQai9iCxZBsnqGOPEoPT5Xlae+aaKDG4e8olS69lo7LuLHTZsCudLLa
	 tD4FLZ2KCdhSQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5040617E3620;
	Thu,  2 Jul 2026 01:35:50 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id E364D48007C; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:36:15 +0200
Subject: [PATCH v9 37/38] phy: rockchip: usbdp: Re-init PHY on mux change
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-37-e31efbb62d2e@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=976;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=y1K38988NOGNjrWDX39V0tM+tzGRa5eL8tR+BuYD8RM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFTn4vcJyseHiWtsGKSypASqmgHiFHurS
 73UXcoGV5JhgYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRUAAoJENju1/PI
 O/qa8UYP/jqwlza70YtDGsUk7C9XkDcHowQvZBZXAvJvgG5DWym8OS3+V4p7Uv2yvb6+5w32pwP
 M5TGFJr55M6WCUc0G3dG/v1MZpJHKbgDcfR0bVX+TbVGl34PZ0Jh6t+oXLTR/lviDjy7pAdmRBc
 c6thHRZk0mMEOa1ZSdD+AypEDwxKTqEXcGNjYh9IqSl8LWJ8dad4PnEwEB94qJvdZnsUc6h4/6q
 +QbFn3Wox5nbkHcJVtuYrpLj/7961Sg1Yez8ozPTWS4mT/PI74KDXEQV9bkZ6UV5TZELlMLTTPm
 cFMISyIAMNMORB8kfnWGmgFQXQDTxOzWaGERxc97QBanjPFr6PYKNAsnDBFs7yn1uU6AdFUQgHe
 zz2DueX0wIYPR/8gfLhA1CwY5rMOM6PYRjWFzJi4eV2UgKis5oZFGH3qF7Q4lau8s/WDLpVvqvd
 jauLtwktaLxbn8bp+XyV+SljEUDHuDtoOeigFy7DipO+sRqmpw++qcC4wukHSXZfR4F9195lh1c
 3pfdLxAR95nRtPhmh1LzNiR+3+reTJaBHfHKR49u4SANeDf5iN4Q0Kcbc0clRcD43Cfwuevc74f
 Fj6sjHYlh1DVsJO9TafaMOzis8BEBnWgCwOs5Svvv/gVCqGOQhYJ9My4hY7VmXXyFbWVvp8I2Px
 N15mIlUwamRmjNMxPbjUpCQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Ensure that the right part of the PHY are powered up when the
mode changes. This ensures the PHY is re-initialized in the
following two scenarios, which are currently broken:

 - cable orientation changes without DP being involved
 - switching from DP-only into a mode with USB support

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 735ce1bfac7a..d056da53cb1c 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1372,6 +1372,8 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 
 	rk_udphy_set_typec_state(udphy, state->mode);
 
+	rk_udphy_update_power_state(udphy);
+
 	return 0;
 }
 

-- 
2.53.0

