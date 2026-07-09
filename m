Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102D54499AE;
	Thu,  9 Jul 2026 19:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783623762; cv=none; b=T85muSCXQjmghTlwdt8Dc53K176llf6y6T6Dll0gQimm1L2j4Gd4jQTns3O4wCKc62yW64vjKv+6m1pz8ueRF4SxSsiRnfvOCAnUBPiOUPSmxDcWi/hdpv6MiNAY0q9pHzi1/KLzsagTyG/N2/xy4fj74UFxIRd57m5NZe2pBxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783623762; c=relaxed/simple;
	bh=DD06F9UGdc4fStpWJrHPhAmDgKde7njpjXBETGCLvWw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kmyRV/qmhauDM2PDEM7iHjxXVRnzwOyLv1hpQm1GGeUolRgElt1idwKWeNLDZHZSxRA9mgIdcRZjm4YBCAAp0knCjIFD5dDNISTFC2xA/BYBwmRKYKNMiP6xkKGtaStslOD/noyRcCtioKlkYV1I5+02MlXrBrzwLtnDwdTkNmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OZv28SFQ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OZv28SFQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623751;
	bh=DD06F9UGdc4fStpWJrHPhAmDgKde7njpjXBETGCLvWw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OZv28SFQI9fBi9X+WQsEm9lTUgIhQopQ1ymc7k7saZcK5xKGAj35YyUY6bZ1PtX8Q
	 N5YmOvqCj6vR/+VBPEw1AP+DLvNa/EswJ/d+2szC9zPWOVerGvVZTXZR4lKKVFHzyx
	 qiRcT4S9fJMYD9xRBcB0CY1/dfBlOkQyBtIgeqO7AxXIxaW5iR0QS6y0imx8MWNHZ3
	 Suv1kC6fu/K8DhFVG5HtSgByTqcMeISX0q4v+8/2CD/OB0/Lf4dfLT+2F78fsIs95Z
	 PSZ2yAezhL/fIQZJxXHBcoqF1EY7khjraPmmUP44CXN+5lXpLCfAgkQX6x04JDKcZ5
	 xhLQaN1l9xWkg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0EB3617E35C0;
	Thu, 09 Jul 2026 21:02:31 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D12CA480075; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:54 +0200
Subject: [PATCH v11 31/36] phy: rockchip: usbdp: Add phy reset notification
 support
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-31-a149ac60f76c@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1856;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=DD06F9UGdc4fStpWJrHPhAmDgKde7njpjXBETGCLvWw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8EW2J7KWyamrkzt1XCjQ3zS0W2FgT8fZe
 maAfNSN0hh5JokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BFAAoJENju1/PI
 O/qa6+cP/3I3TAY9YRxx1dlT5hgKicUY3ZayBxzWJs8P6y6MWrd0HN/PoFEPE+nD1fJRahDzav0
 sgdLlIZOGXjgnQpoKAhiRBrO4XaqH7LSiPrx/Rbs/cCV3/1QnB/xPt8Hos04kJAG5V82jI/YxUF
 U9pDphPQRuFgNSRfnAjjQikUzjpeoVccve9wfowsqrNgwN2kfSkJGKl/Tumzzu1byMO+baNNLek
 ibSXJ8R1lgC9OJEvmh2AV9/jkTDqkJ5gXKz4WFIZ1jWhNtt1od8maRnnmCS4TMmG/tXxoeKqpP4
 je9azWy7m3F1/fDW56FXMM7BR+fbDP5fosPFTvJv0REZ+LE9c9ect8EVoLUtSKoNS41H5/34zJV
 fiMO2l4mFP13iHBlqfu25YAlMxbF5E+SYSDBlEzqjbKofQJaRc7y4uS9qzjirUWVi1P/G/7Yjrn
 KKRM9nk/LUKZmNPqcQQj5WvauXPWO5QD07nV9QsrOG7Nqzo6kPBa8Bg/EGY5auE0uZTCJ729Puy
 3F+RT1qRvQ6SYsVPjl0/88RIoCjX7dsQE/Jg9vjxwAk4STKvRkU4AFXFjIErZoI9oO2j+kRQEP2
 VjSKcgNeIsWK/ephyu/7Zdf57pXbk9zL4yiDxwJ9occzL/C/gvXvYA88yw9Xc44OWON7Wr6UEMN
 CbvqeQ5qaQ3SR0AtSFOw0vw==
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
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 694688ed387f..5d151fff9eeb 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1005,6 +1005,11 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 	}
 
 	if (udphy->status == UDPHY_MODE_NONE) {
+		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_PRE_RESET);
+
+		rk_udphy_u3_port_disable(udphy, true);
+		udelay(10);
+
 		ret = rk_udphy_setup(udphy);
 		if (ret)
 			return ret;
@@ -1012,13 +1017,22 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
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
+
+		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
+
 		udphy->phy_needs_reinit = false;
 	}
 

-- 
2.53.0

