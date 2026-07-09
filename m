Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645EC3CC7F1;
	Thu,  9 Jul 2026 19:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783623764; cv=none; b=mlkDOJBg+fly97KU0n6GuGaTnax7HNBx6gQ7gFUxOMpaFyqLQIyL2Ab5Gr2xfM9J7Onkp4GwEBtva2D+D2wUNWygB31AO1nzABqVfUiKVlMGuMctBGFWgI4I1uIepf5H8AmiOPZGgEl/zJCreAhrDYn7qMoSjH4hNoPBoAoUlJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783623764; c=relaxed/simple;
	bh=4X9eFjcBaJHCtFU4hA401y9jwD+dcI01OT23M3giXnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VScLhZHgi7DAw8VN3VxMu1QEMVy0/j5X8URgO2wt1J+pPfxqug2X0xC3+FsKOHImOYpgFK7NHKr+7I9DUuvd6NbKtqp45atBT5Uu/6eyQj4QPIuy4GrkcyN+4Vo7YYTBX6wERb7QJWVdwgDWSbNtdEtDBEsjo5RrNHAxxeveljE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KxnJFhGO; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KxnJFhGO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623751;
	bh=4X9eFjcBaJHCtFU4hA401y9jwD+dcI01OT23M3giXnI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KxnJFhGOKeOyCNCu/i8D6ZEDuqIQeZgoxARnaGfVInx6BqhovC/tMg/I5igB8XEiu
	 IVJSaEPUk/JhyzfT9tbESKRZqHheFdQvjjRzbj7B4klF+TAtdsrcpP782w1PBGPf3G
	 kP3MfXaTWAWlsYhiBAU+cEMSwUz38EMADZe7YVlkktCtYaZixLK91fUVSlJhCkccnf
	 mVsKKXBG0xU9Ht5qU10jEgtlUA13PzpgWEFhOu8FifcvKCn156Aw2AtvGFVhWav6HS
	 mWmDB71U9EGtAjAKUNoaBf3DjUfKLovX4sN9dVWfv6dcG/TSeTokOVuVkjyDOYmCTi
	 B+WLJE+qK5hIA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EF85A17E127A;
	Thu, 09 Jul 2026 21:02:30 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id CCA1848006F; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:51 +0200
Subject: [PATCH v11 28/36] phy: rockchip: usbdp: Only enable USB3 when not
 in high-speed mode
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-28-a149ac60f76c@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=4X9eFjcBaJHCtFU4hA401y9jwD+dcI01OT23M3giXnI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8EWmJ7UgiPJxlFmypOxTVS7rcM6wogegx
 HInXB9THqAtWokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BFAAoJENju1/PI
 O/qaxRAP/iRidCIAUqeDbd0g8ayzjTupj4CKv2CwQ6cuJcrG1SfcO7IFg8KwQf3QxO1w2Wxzlu7
 vnwFZmhcb7s9ccPW5BIaRX3MODac/GW0YKWiHSdb5lzalsc0a+UPlq6KaaIg4jRAF8KD/Xpc8jO
 2GaORYEkJ1ohSWXRtdzjlhBkFAPCUl+/c53TVRPS2tkEDrPy1zdFcQHwoKoQUe9wFVH3wPxJSrE
 r6G/8WG8me9SvhhJr6BvxnKxVrhgOg3FLUrgcBAys+KhY37C+2ZaSJQl/u1CqLkCyImAHSP/za8
 RYP6QXEgsfdb9eAgF4TgXh6xSq08dp2yeX14mPM8tboqddND0Zvx74JZRw8qT3XOFRAQFXslrvf
 067YQh30FrEfI9ycVfpuuDan28sdl5CdlmlKgZ6nCrXuudmSuVxYchwBroiOM55jaTU1PTCqwJz
 6dT8ZPyHFJl7kDHR7e8Mhrft17YBgbab/AHN+Oml+cCot/x8nDNszfUVlYE1fNpzusxU92EtpHx
 MN2qob40yTuQwSmpdXL4plelXFP8XCH5oDDhtW5W0aRhHwGYFhJ6T56mkcn7hgdZkTURt4lZxEl
 UnvQ59duz/qw4uk6v8yO6sOwSl2mQgnLd2k7i3CGvHMBuUjdBekXo2zZA/5emk7LF1k8Fo2Pq1r
 2hlZcHwbAzo/6arXSA3YsFQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Ensure that USB3 mode is not accidently enabled during PHY re-init
for systems that are configured as high-speed only via DT.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260626212424.C215E1F000E9%40smtp.kernel.org
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index c645fea67c4d..694688ed387f 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1009,7 +1009,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		if (ret)
 			return ret;
 
-		if (udphy->mode & UDPHY_MODE_USB)
+		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
 	} else if (udphy->phy_needs_reinit) {

-- 
2.53.0

