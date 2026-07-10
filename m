Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8E743F8A3;
	Fri, 10 Jul 2026 16:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701996; cv=none; b=kElTzV7jljto0o7WHo2h8hO7qa1CDWfj6vvtFCSHuuN6tyaYaLS0zoL4GBNG+nbHzQZralJ7UmKL9FVTxbEJKXUPeDwJisyavF/saMnAX82zDdO7FK7wsgoW9dKAyw9A2ZzxW9RN4vmECjwCWzKlt/wkH1bmSHZHXNQhcmyB1U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701996; c=relaxed/simple;
	bh=2gLkRV9WDvS2Po8dt61VmCkxYhpPnN12xRBLJSp5sbU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bKO3rXDyuoiDA28VK9gvxHUK0uIjSSyulFROoRr8kXU+XibDFn0oZHDKw9QS5ygF6dzQE0a+3xi92gpXGkiwSiOI7bslf9tsNLE0FsRqjAhN14VgXMb/eJDsVtLzlWAdyu0pAaARmftuUuNhzn8PagGez6XM/sNVKZCqzOcwtyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KbX23xCq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KbX23xCq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783701979;
	bh=2gLkRV9WDvS2Po8dt61VmCkxYhpPnN12xRBLJSp5sbU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KbX23xCqk9IZWmkgzpqdhY7nlDg/WC+S/ncSxSZgSHMJ4OIyezWPqhWzuXP6aJLPz
	 s58/4vnCMjWaXXMssDNzmwVrNUSudwDSY93cU+D3J8tWApy9PKWju/KISsUYeV1Zdj
	 0rPQfuwJTsR0hjnv19aGYNQjoAMNMETKrNcPhUoXn7bMTeaH90+939kwASPY0KIY41
	 d1xH58exq02o5A5tfRLqqh7dPNuQ54SG4qICOWGeVu6FzasdnJ6wiC1H5r+2frdwIQ
	 SP9Q6I+B/3aznbn/szWtOVUwWcVnnW2e/yhYgdJzDYX0PtTfA/zgA4nCCLTUrVZMUk
	 FxmsHkO6ABArw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0B2B017E1066;
	Fri, 10 Jul 2026 18:46:19 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0A3A4480069; Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:45:01 +0200
Subject: [PATCH v12 23/36] phy: rockchip: usbdp: Clear USB status on PHY
 exit
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-23-8b41a9a9bef0@collabora.com>
References: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
In-Reply-To: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
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
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdl/6QOwty84wstrmcD/c8k+KmVlkxsw9
 Wadc0m3+uRAsYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHZAAoJENju1/PI
 O/qaFm0P/imYG+JPo5C9PiNekq1YpO111qtuk60JOpoJcXeYA8ZsQKWCWa5yqsA+cJ0H7I98ULs
 dn+yhtufyQ1CWfBkxRUi+JZVQ337gAuSzlo7eooExY/j164m2nXOBeJDFaHVn7PfUd5QjJ+BVIF
 SR82/AMooT+lMgOFUeFlshf+BHlkGiuh8GjniTV19wWzfjSA9r6v879D7iUhxAQrTageFFb3yml
 Fwq7QBkCi+pUSRyhPfRuBzfKFCHXorzOjDe+jg8//nYls32QF+sLrPs+7zYhg79HORkVcWuH+3l
 RX02S4RrNhZWfys/2IemWE8o3SFdcXbUOROj9L7BGCAsssOVErTUZsd/PPZp4fPh5598ccb4qCb
 xb5xeLu1iPVkUeNBxkyiiDtSoC2a882q2QxcjVNuH+TIlE/pbNModiY4usQ3ZvQq7kTUq/84oU9
 +o3Npyjnb6DBmlDgGmxMOp7/leXXmdadyHnkKf6PsxI4dWo8yfIT81cRNSaY3s/PRyO3dPGZA4K
 fMAqCSW/CV4knR/iqLdhD2ZmxmBGNnbfpiKBEXfVescoeFUM/CWMyn39ZvV92zCkc39654MMsYV
 h4p3DvRcbW9Khei1i4u0H1pcPW7kjcD+5ExYEAQ8q51yjpi2BMu8Li/uqrwVIkjzW5bjG7J0BYq
 fksy3bZ0d7S4V6Bl0w/kyyg==
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

