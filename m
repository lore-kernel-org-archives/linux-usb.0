Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A3A42BE91;
	Tue, 14 Jul 2026 19:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057187; cv=none; b=t9+VoYJK9tfNaWiaqmBo7vQpbiGXoe2AdDw34wOd+y77Zf56ygBG+e1e6re/zuI8yiVEssTVem3IS3sNzpcxPJtoKoTCEL26YdZyNJNpFBwfMX1su29rOIHnvqquNz/KLs2JSyn7K6mGLPnfJI2R9B8tHoLrzZ1Gu6lvwRz51Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057187; c=relaxed/simple;
	bh=V63zlxbk2WwIpvUkzfZbShKKI8n4pibTtc1ZREWfyK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jWxaDZzYMNpQtzIIc0Q8OsqZdb/lXNRwXDu5gYrPM62S107GWu3yAJiDIIwBO3Knd0lKHZXQDiAcvDnJqRicubVbahMSxhTJgI0GnCR6bS6Y4YJZ2OfELudBTMvF1jF8BohnijaUXdfAnxGvlFdc08uoi/knt0CMyWvx3DTvOiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AUc3ZeZk; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AUc3ZeZk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057170;
	bh=V63zlxbk2WwIpvUkzfZbShKKI8n4pibTtc1ZREWfyK0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AUc3ZeZklmz6zTkda4UwrE4VKA8f/XvVPshTkGXqnxaj/Kx6Tvv4wMVCPXD2gx6fb
	 8JviOTx+R5jLeVqnUXcVbF7aEWXGBn0xkbT4EVnXIblO8KmVTNiyr6QOCC63fKhWb5
	 xarMp9ia59aGQDcNsIN3TJCsIxSSz4g0IRF9kkDhs7/lK0nLj+ABFxOz9BvB8b5GA2
	 QU7nOHIfh7DOlUZPUlbvsbQVFtgEyKXYatz/KJMeAA++aoZZ6Bg+mcpJ5isVg19IHj
	 gHxWfGvNjKY6hTEzl5MRdCHij7Q4OzH5Y43ONnystVXdHI8XNu7sNC2fp4SPzaiAum
	 RsBEg5euhNc0A==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 18C4517E120F;
	Tue, 14 Jul 2026 21:26:10 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0332548006E; Tue, 14 Jul 2026 21:26:09 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:28 +0200
Subject: [PATCH v13 27/35] phy: rockchip: usbdp: Only enable USB3 when not
 in high-speed mode
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-27-6cb3e769d4c5@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=V63zlxbk2WwIpvUkzfZbShKKI8n4pibTtc1ZREWfyK0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjVAJ7QmSEvdWysGnof840cj44T1gR36gk
 uWBoj12xlU/f4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1QAAoJENju1/PI
 O/qaElYP/3qvpmGnUJMDBxbC6Z8jMPqFXid2nRYDzLr4mTRZufmSXpwe/QnPg5Ts5ngwnKKhmig
 8G3ttivx/KU38sUHK7esljYtt837+z6jINnPGR+XgYCbxREJCdsoBunEayweVhFwZa7AOk+MVqI
 rHtRgCEYegnbzlWKT28my1NoBCIkcD6Z7XKqNlNKehrwRC9Dkh/nisHYwYY8z34PC+sEp3uHz5s
 cVsJFXAICY3O7r1HtdkZjHQMO+m7+hsA2W5HNj+9caM3NdfXckuWUKGrvEusILFulVlkI0WT0Rq
 P27ZcIj65HuxKmStjMXyrNS7zAnYv87rUtMIKw1/pdXh0Y3RE2K5j90+3cryiISnbknHedKhND0
 2ZjKAOMmWSNme7EYqhdXNjz4+yKT+4ffGouG3gGsPSbFdMWd31udJ8Beq/jR8xeuqEpll6XDvPe
 n+C9E73fbKMxW3fr11et1rjbWVJcBiZMkmB6Pc+p0lKJI2Jg3+6vevxmzaZaINlhOUPAoE6jmvG
 95raaQ0LE/6QDkKxUzxykkFg2khg27yrDOS66w8xhLex7ty72SXDkskQN6bmt8nNfFyA/HHtIyN
 i6r3+O0AyVfM5X/Hx8vHz86JnNhvP9xpJdtfyKYAiLIr2XmuKmfVSNySYrRyzg2lJbLCRptN9M4
 qzzNhmCfJQJTpweaAgq9B7Q==
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
index 701c92ed6e2d..59b836a3796c 100644
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

