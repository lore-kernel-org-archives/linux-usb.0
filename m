Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC1041E6DD;
	Tue, 14 Jul 2026 19:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057191; cv=none; b=e9yJzbFW5iJ+Z63Y2EZMsKExOoY3vbqwo0XNCML4ObBAUrvEWCh2vwnoTpBHVAoBnrrdPods2Jtu/9hAwcLEzfBiKJzokNboXcTxpteKFQsiGgYmFckJV7xOMXNA3d0xsrx5vkLNkvVrT9fOKG+FnI6ofUhL9oEahiiENhsN+8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057191; c=relaxed/simple;
	bh=/pjh5DQtiFs1nMCAmgRMNRjrSsE3EdF+7v+JGgVHc0o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s67G8+uO8DiBZZibi3E9giq/oB/YA65vCXDDBqMBijjEsG5TCoerihPpa+bk3ku2fGmWIiLxuKv6T/LBzNTR+mGi6MEpFD+Bm5RnwA4iihGBdZKmnMkh50GKIUtId7Pj9zXfz6/LKWWGnGH3uzkqpy2Xhhvqii/PDbJTneW2SrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Y7NblXpA; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Y7NblXpA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057175;
	bh=/pjh5DQtiFs1nMCAmgRMNRjrSsE3EdF+7v+JGgVHc0o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y7NblXpAMHY92eDvgIsGMqaNiOpU1CDlials5jPSpXLqJcHNpaP+mOsGgSreiWG9z
	 /4yTzdgIFLDYzrvo10FN+bA2BJRS3MtoZKIs1VYY3t1T20SgoAi5FUUGm3z0UVyoS5
	 NsSKR/9tvq6cg5cfaj7DydP0ASwNB8oij3oWD6+8m8/i/d/NWQp73rhCODDsxSsynU
	 lpox/Tg5Z1G8V6CbaGNu86eNMbhpPLr64YuOYulHgdUxVI5tGr8nvPn35vCaC8MMzX
	 FCHVGDqChxMaIt81ycErMxeWJcnttmn+7rNr7VkBv2W8KQe896sMPm7DW7/6w+0iVm
	 nCLopOurL8G3A==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 30DCD17E37F3;
	Tue, 14 Jul 2026 21:26:15 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 07D13480074; Tue, 14 Jul 2026 21:26:09 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:31 +0200
Subject: [PATCH v13 30/35] phy: rockchip: usbdp: Add phy reset notification
 support
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-30-6cb3e769d4c5@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1982;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=/pjh5DQtiFs1nMCAmgRMNRjrSsE3EdF+7v+JGgVHc0o=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjVAL9pEiZQ9ihCIjDcH/tBrhnBO0jsMJN
 /bol5XAcuhERokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1QAAoJENju1/PI
 O/qaHLoP/3hruqK3aOWXTYXZRPGp52K27d4hDqUC6+2WHeDmXXTdTCw9gYW0yV5lwdiYJbhQwdJ
 3B0r/Wid3IwMdoqznfHyAsncAg0AQZBK2FASKBOP3IkELhvGGjLe+2d6vsS8KLVhf1obSMTG9dM
 ag3/YmGBtd6yt9aWcJ5JS6NVWUEQij8FM763t6/lGE+1mZRPSNmqdouvgR2zlWbGulKHA+w9ktq
 Ibpum05/8c+8uJCYuLOaT7P22xZO3f4EwvypUWojFH6siwW9OH5PGQc4djHViu/Rzd0dE2uJZpm
 DY2yDvd6go2syMnLuWzIYeU/0WiXPyWnB8cvro2kwlh719ovz/WQhch/fEqD71RKjC8auLJPfO1
 XHvarFojaaNn3B/rdcwxHt0hL/t0j/6VT1clVfzyRWalS6IOkVMBlwKYJKnHHOT1inGnkPWt8Ly
 sv3NQkuu65FaPebMg+9WdovOYdtwrjPnZ3R7WUGOyait+lXYvWR3RfK8GqxtP0fEu4mi2bPOyY7
 PZLuv9SSP2JMtQnunxkVcoHf46Lbp/vFx7/eiJh+P55QY1mNIb803fbAiOZw2LuC9c5veiMpIpT
 Ta9nD4mgQ/jrP01zYK1E1sEFq5xoy+RzOPhrqf83wiCFk76Tr4tXYwSjToDWu5zCM2zKo2qzujE
 E9mjFXXBTto54DARmbl857Q==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

To resolve issues with running into permanent "cmn ana lcpll lock
timeout" errors after a few device replugs, add support for reset
notifications, which will be handled by the DWC3 driver to gracefully
handle the PHY being disabled. This avoids corrupting the controller's
internal state and the PIPE interface between the USB3 controller and
the PHY, thus fixing the issue.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 59b836a3796c..21f282216aef 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1005,24 +1005,39 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 	}
 
 	if (udphy->status == UDPHY_MODE_NONE) {
+		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_PRE_RESET);
+
+		rk_udphy_u3_port_disable(udphy, true);
+		udelay(10);
+
 		ret = rk_udphy_setup(udphy);
-		if (ret)
+		if (ret) {
+			phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 			return ret;
+		}
 
 		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
+
+		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 	} else if (udphy->phy_needs_reinit) {
+		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_PRE_RESET);
+
 		rk_udphy_u3_port_disable(udphy, true);
 		udelay(10);
 
 		ret = rk_udphy_init(udphy);
-		if (ret)
+		if (ret) {
+			phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 			return ret;
+		}
 
 		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
+
+		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 	}
 
 	udphy->status |= mode;

-- 
2.53.0

