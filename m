Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846A03B2FE4;
	Thu,  9 Jul 2026 19:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783623880; cv=none; b=rl1f0R+HY3+kzx955hMQs2czpzsqvuL1pcrF8rgeSernjGX0BoQQ6wLm1v7cA4a9GHmd764IKH+xKSuCn71+4lOn/FtWegiY7ltgzKs/14parBvvJbL581n1DQgy/nfD4A7NHs8jHK9vmMxnDqfSzoPKkYbVwDd4AF4x46SFWrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783623880; c=relaxed/simple;
	bh=2gLkRV9WDvS2Po8dt61VmCkxYhpPnN12xRBLJSp5sbU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ISiFYXgxFppnz1X8gA301G9DrO7Zbw2EcZJk1Sz3emdhNOkpMIrA+RoZFuQbsGC2Ftc2hSLxnE8o+arwqgKckfd550c3cN7WEwQt+l/MU2Z9D/uWx45KpTXsGXkl+225sU8udH43Y8D4m2VZST3/6zH1uGBo1k/1QZpMPtFP+Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BLycbxVX; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BLycbxVX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623874;
	bh=2gLkRV9WDvS2Po8dt61VmCkxYhpPnN12xRBLJSp5sbU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BLycbxVXyFs3Sb7fMLBSqIAxBPZq5ac+AoSBsAzQSEmS4Wi0YdEp8tBWev6yPqLJ+
	 UnbW/3kv/GFdUCt12WT9/g7TYIrrw0p/sOWnMcYOo39cQY6CpVSonPOvP1AW2PtvBD
	 xDipF7Qo3pwASvi2lRFlGfdKFb3e05k2cudm0KbLGFmXW4Gv3umw1kKvIX0mV2EzZK
	 MinSqUGWoqnb3LXN4SRgTVrD4Mux9S1Ig2dRZbycM9Az5P5LQYD8noAt2NR6DDW04I
	 680cJa+mZAmecVO3EWqHQimgWSO6MVULfFl2TkVocRica6OD03Wxep8eV2mN/2jryw
	 JTS1TnD0Lp3NQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 64A0C17E0D56;
	Thu, 09 Jul 2026 21:04:34 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C4E81480069; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:46 +0200
Subject: [PATCH v11 23/36] phy: rockchip: usbdp: Clear USB status on PHY
 exit
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-23-a149ac60f76c@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1231;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=2gLkRV9WDvS2Po8dt61VmCkxYhpPnN12xRBLJSp5sbU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8EX0DUba+Mp4Ixii4ty7KQaRBOEX/SuIs
 90YFcVLcSvOZ4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BFAAoJENju1/PI
 O/qaEKQP/2/45hwEeiIdWrFzTNqVCC7s0hVW6P9Q7hL5u5oVTXFVhex0RY4k9yplKZbqiV8Jajs
 P+FQKeDdRgkJ5pq4PJF6luMjGt4lHndNxL8IyLsfPM4Z0TdESw6XWXylfIqreLruiQntfVIiSzj
 /v+8lqwL5x2gP9SrAo4J3lGDvKpxnvmiEoMIPz5d4D+TiPU4YWkz14dHXTEobMCb/Vw0o+tMS48
 nTHXvpjGktiDyaoRRE9EaWb+CgWGPL4eNeHabhBBJX2Se/mCn3y/IfSQYfsWAaUSBlfuVg/a4Wr
 eDagAuvcrNy7QiGjGVQKcJ1/7nnNfxuhU+CToNWUntpHkN21+miR0NV8qLHUxsXHsXDPXv62k42
 ZUiGDXBwSgo9+CyQpqeMjHJpmO9esSvIRucbJxZyUMb4164mSzHv8FekyUpKMZZ874Eu+s/Hsz9
 uNdcQdZLxLuOLXwKPoXqdZiH/WtBI1QLlS1YKgKIe40YD7UxpM9JdanqyUpNuCDToG2nu1+kkYC
 P6Tkw63SQeYUu6wJY+JJxzXihnvYdEv9tpgk8TxMKXdhs5HbexffinDwkUSJET8YKTqGKqU1YIe
 Dn6zAVkGOu6UoN19/oPKTitTCd/yZr8FSAg8dcj4BYiWJVk06PQ2Vk01kUE+gkr/9lxMOEUnhpd
 XGJTAE1m0Ly/bysry4awz9Q==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Ensure the USB status flag is cleared when the USB3 PHY is
exited while the system is in DP-only mode. This can happen
if the USB3 controller device is unbound while a DP-only
adapter is plugged into the USB-C port.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260625-rockchip-usbdp-cleanup-v7-24-38eb3cf654fd%40collabora.com
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 8c165bcab796..a742bde7155b 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1273,8 +1273,10 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
 	guard(mutex)(&udphy->mutex);
 
 	/* DP only or high-speed */
-	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
+	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
+		udphy->status &= ~UDPHY_MODE_USB;
 		return 0;
+	}
 
 	rk_udphy_power_off(udphy, UDPHY_MODE_USB);
 

-- 
2.53.0

