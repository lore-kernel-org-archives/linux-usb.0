Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322363090D7;
	Fri,  3 Jul 2026 23:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783121863; cv=none; b=cQfRoLy57ZUoUUSHn7fDmyeI/jG0MPIDAjAxM7kyUIr/RUj3r7u4tSfXlkE4VCSAncQDTvhnR4Wv7VzB6dqkDqFKq/oWeHQ/VEKzeATOqLA5c4k+7SrpjFnk5TL9CBjo55dRmPfLM9D9mlbaoJp4vzFNVMVgrCfTiuxdxGFOPuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783121863; c=relaxed/simple;
	bh=KsztTcLL1hh9As65BcDTh5Y7TjOnYb7YivozEbWiMmA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i4DK5cUkE+5PIJY4J8jl93HxJXED5VP2bX2Mfxj4KXvcD40jn9nV64RBRDs4jDq7ilkb7594QW3HT3UsDoIzBoh9JRoBYdn46hwazquq9EFOPwt58fGAioq0lkjAVKMvUgMHfMEAL5DPYJJnQVZieUqBsnSNwi5UXzSaV4dLflU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HN8pssfN; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HN8pssfN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783121858;
	bh=KsztTcLL1hh9As65BcDTh5Y7TjOnYb7YivozEbWiMmA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HN8pssfNcRqc7oKWqPFJnzA7QEMK0cQxl+CEe58My4AkG5I2Hm//qWttBy4QZbcpE
	 sqivjCRJDNAjqKB2DMQV5BXJrGrS1DpiBMs8q/gsb8x8FGtWKpgikjlLGB8+msiF91
	 Z6z8KarlmS/CALUB4+0SIHCojsc0TwiKx7L5daqygOyjbM0LvxXE0H3aNmeDFPrK3A
	 0g/7B5c+47PDP4Keuftv7DptBTeV3tr1z4h03ZYekdWhjUy+fukMqiHacZOHkvtE2S
	 bv6X1JorrcZ8FAoOd8fgRyaM5bz/EW7aUsywBMPzR2VACehDj278LrOE9LzTg2/pjD
	 O9eLlqmwg+Grg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5A17617E0DF3;
	Sat,  4 Jul 2026 01:37:38 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 94845480064; Fri, 03 Jul 2026 20:13:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 03 Jul 2026 20:13:34 +0200
Subject: [PATCH v10 18/36] phy: rockchip: usbdp: Rename mode_change to
 phy_needs_reinit
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rockchip-usbdp-cleanup-v10-18-a392711ca8a9@collabora.com>
References: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
In-Reply-To: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1831;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=KsztTcLL1hh9As65BcDTh5Y7TjOnYb7YivozEbWiMmA=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpH+8v0aLBk6MKa8OEigTkD/QUpFcltkqBE+
 Llr13RCCRZ1m4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqR/vLAAoJENju1/PI
 O/qaVvcQAJ7lMP4keNtSSl/sFdfSHtm0dPdu8g7HZckS9TEfwxpxbYpz8wWwsSD+GV5e2WMn6Po
 csgVZxF4mr6L6KWusa6pi84Xnu+fUJaNbuz85sKOgYSmQSVoukHryS33vkW1MhnwYAo3S9dtsNX
 YKSK6wSy39q2bXa1WbF8N1+RMINOWRNCYEyyfIzO1N8oWutFlIzIOEwxv0Wom+5BeZjQkhCR8ER
 TvHFVGOzrGadjrCQfEmOtFA3zzcJhy6z925H0dFoss7vA5dA6orZs7ksH2K3/DmuZHAeQbbgbX5
 e0wsJicxeW1rMf8rDf8wheXBfykMxXJsfVOUgGHrVDN3NqKM68WRvXfVkWcOwcI60QP9a6nOZvS
 m+X9Y64HFn500oueS89A2Rzn7ScI/97mrJiC8RdWDjHa3jTsYqBRqOm6cFk2kz9whrde2ckW4Rf
 3NE72/sXje7pdQhid6ICjq3uIE4BkmRpCyz3swPwLqb/39cLZOyxTPW/PoOw3XLjm4vic6K0bUT
 /TlLEJ2Sm2aWI5kfyAaLWLKUYf9lpEwbc/CdVydZS/o70tRV5qo6U7/xE1f3QUojLo8xrH9bCXc
 +E0iqb3EUxbN1RowcylPSq5OS5zmKWiATmk0Kam00QPax8phkLieGrRcmeqwXtR9DuBDqyOQkpu
 yWPs0+V3iEg/iat/4F7U11g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Right now the mode_change property is set whenever the mode changes
between USB-only, DP-only and USB-DP. It is needed, because on any
mode change the PHY needs to be re-initialized. Apparently at least
DP also requires a re-init when the cable orientation is changed,
which is currently not being done (except when the orientation switch
also involves a mode change). Prepare for this by renaming mode_change
to phy_needs_reinit.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 24108816e3b9..e44d19c9d119 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -171,7 +171,7 @@ struct rk_udphy {
 
 	/* PHY status management */
 	bool flip;
-	bool mode_change;
+	bool phy_needs_reinit;
 	u8 mode;
 	u8 status;
 
@@ -578,7 +578,7 @@ static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
 	if (udphy->mode == mode)
 		return;
 
-	udphy->mode_change = true;
+	udphy->phy_needs_reinit = true;
 	udphy->mode = mode;
 }
 
@@ -951,15 +951,15 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 
 		if (udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
-		udphy->mode_change = false;
-	} else if (udphy->mode_change) {
+		udphy->phy_needs_reinit = false;
+	} else if (udphy->phy_needs_reinit) {
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 
 		ret = rk_udphy_init(udphy);
 		if (ret)
 			return ret;
-		udphy->mode_change = false;
+		udphy->phy_needs_reinit = false;
 	}
 
 	udphy->status |= mode;

-- 
2.53.0

