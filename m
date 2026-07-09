Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A66C3C4B99;
	Thu,  9 Jul 2026 19:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783623761; cv=none; b=SzaW/NYKPObFxWKmcU0Qi5lvCiJtCCbjgJP/WCLu9rZwHn04fJgo2BC8A0Q2+3IZi+D8pVyOaSklBl9AqoYKQ59yTFpVUharJfYpmiT44BanUalz0PFSakZxpR6cZ+Oi/rcINPVheVB+SqTiK0BsC93x9g8hDlIbIVBiA96E4u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783623761; c=relaxed/simple;
	bh=R+wp4a0ifl4hTuF+Ym4MsLuNqY2BgKTHqs8rQ855wZ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VGqmr6a55URlIY+a/x9NtAcgwgi+Is0i7EY+n3WiBF7UiGTeX4+X/McaTlGCr8oj7LFvbuQrU7j7uFWgo51n30nzn3ACK4EMWqB5dffEM58+ZCMsP0JwJjLF33R0U5Tz7748jxxlcc81/9+B4kAjwPwT+U4ZvS77DKXmj32r/r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=m/9CFizS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="m/9CFizS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623751;
	bh=R+wp4a0ifl4hTuF+Ym4MsLuNqY2BgKTHqs8rQ855wZ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m/9CFizStOD1UWne/qUFguTGE51YfW03w5rOAVki2A8ZUVdg9UbdR3JoMCM4mRWny
	 u6yyvjJeULXajmm/iPo0iAuAMQ5QPNsIKbpsxrx1IsIKG4sMaGdQ1Pl9p8Sivd9ayf
	 omxRn86158WQzcD/9iiDjUt3XtZA4KPfwT9YqB1BA+h/oQZNTB6uCCwXhTwPPl45oc
	 P81iXqkZpToER9X9ANcptJvLiEbr5cuUGrXjF02vf/W/QWdfh6eKg+G8XeblIhXR1+
	 tz8ECPRC0uIBYxwZL02k2mLZfkUUj+WUoY3li10FY80xXv7ZoFzkeVeI+JTHAiKrOf
	 xfeGPb1wKVyyA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CE5A917E1054;
	Thu, 09 Jul 2026 21:02:30 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C691748006A; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:47 +0200
Subject: [PATCH v11 24/36] phy: rockchip: usbdp: Hold mutex in DP PHY
 configure
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-24-a149ac60f76c@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=R+wp4a0ifl4hTuF+Ym4MsLuNqY2BgKTHqs8rQ855wZ8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8EXGZA3MrORiANWLjqcqc8KRqt4e7TfAG
 vVcKzi1ybwvwYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BFAAoJENju1/PI
 O/qaywYP/1l6A6xG9VcJx+r6WDprElYlHRjkkmXzHaMPfOO35nexVoUFVOstmKSIqG6i3Ad0/Pp
 mbzDVP/CJAezMTbXMlAO3qLLglmodZOjnYhejl7BpsQkvpQvUUvXpRVbUH6MWzQLJsSn0kUjqNF
 7HW8fBNXCpsEJ9UAKgtxFJQCblLcCZ5TObgSLeEsKMb+QMENNJa2MUj31Jb8L8ffoWD0lH/rEiH
 fc4KI7NDyJ/a5hmk8LdiR6gAyxDyHGRPIr0Jt3vBBCOGLecFNeiE5WJgPDMO1VqhtPdj2WJg6p9
 eHX9/fiy9hDo2iLvAzr/mAM5a6dyCaAh4j05ydeiB5DHOursIrW8NCAHKR041LxX3qjA/WVtsq3
 DE9EWIqVKGoNd+N/M1iaQSkQHjOhIOnhovvcR4J5cETCCdJv/iLpS9HWIBK3WS/rc+r+jKlEqOn
 CCQjqSvOoYj0UnLV3J4M7uPapm3V3cDoBONwTTOvSp3X2a00Q2G2VJ12ihOpesBgr6FLcNbjFVb
 7av7tEpGBTFG265PygWfDHM8jHaJDMvJXagjWS2dlWzQQZRU8RTUQzcnunmgN9l6rQv73l0cfv0
 P5rluYRDsHJoAAN6Z/BA6x6B1cwlozkYmujrxvPNrHEFWG9rJVjc+uISE+cX/VZ6palEp+snJN1
 srnElBK7ZpPCwp+72GgAw1A==
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
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index a742bde7155b..cd79c5da566a 100644
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

