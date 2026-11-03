Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732138;
	b=XtWjIADYrDITdt27asIIA/8h91q25CkgaAaODk60HlA8+eG5Tpo828bXp4jIbyUJsLzG
	 KvHnT8fb8L4lyuGRWsa9cXr7DNjT05fcGFtGhQp7quaFI3rig4Oxtha1hjpZ6v2HE1KYI
	 5W9pYedlerodTSqM3p1sm2ktZ4qRkoZqFyK0SLJzow8jH0PEI/eGElVoYnoAXFZX4zlZA
	 OdvTEzn1nLZcT5jgJtH2C9N2DwS+zIqRD5WwZVX9aRyR+sVH2OfJPJuE4nvxUwrVyaxUW
	 Eol18LLr1NJchNabWU38raBO/nEhmPSbZ/rNRJhUmxdtR3e02V4Q2ELPk19A2fMoY8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=53wguHLW3cLcQzyyPPD75Tda+cMWiySwa51kbwvu2UU=;
	b=SOrQ84Uhlpgw713HH7W5rcyyhKcB4xBBsflFUqk1GA7fBJ0XXOPCdPzjzneJAZpMBEbX
	 c6dILMyKhTZsMURdrBA9DucvG+kFVwFdR6pfPQDoKVF+Z2KsHG+VfeUuaZea1O3GAyVDZ
	 nLPnN9jq8ENp9Z+gYza+ZGqi2x5Nq+pGoiX7aUUtjlcbN24fmZof7dyVBz2R/eziVJPpq
	 1b3d71iJj6XfoIDvbWqtl1nobrTTvl0L8leuemiqNOFQ3XhpgX5G6ADjI9xbxnCUXBidd
	 B/PgptHulzaMUUyQrP9/W78oE0CUB8E08G0tbbOWM4CExn4NVNw5pSv2WBNwuAiKyNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gL+GuAYI;
	arc=none smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827C5606A334
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 18:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 827C5606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gL+GuAYI
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b056d58f2aso42837157b3.2
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 10:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793732138; x=1794336938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=53wguHLW3cLcQzyyPPD75Tda+cMWiySwa51kbwvu2UU=;
        b=gL+GuAYIepInqX92HWra2fb9t08+90isckYecQT6yo1uEo15tsVrZh0+ICN8Lio5hJ
         CwT/RtInFpxA+cCjl3F9iy+BfLLM1b79CIjYUNkzM2OYH60a5hSUzcqtCu8bvqvcQQHj
         y37iXrrMClocjSOGEzTWcoUBVV7UhqOx1Vxato2xA3jcjsM+PnCxd8NBc3mOz33JSKWE
         ooErB0z2mGIOELMhbbIhdlmCDTn3x7Nu1+R57Vy5LzGqe/VxnRCTVq4pX8GuWBmGwUt8
         12veGUHUKjcJAw/Z6KB/272Sbj/18VzPe1gJbWOdIwSpCV2s74UZjY7SHzA7NjUYdPIQ
         YlTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793732138; x=1794336938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=53wguHLW3cLcQzyyPPD75Tda+cMWiySwa51kbwvu2UU=;
        b=Cc45OjIjb6B205P7GqmfSnZAkjMk9LuovVf2fbhGI9/+McQ7/ZEUn4tKPWwRGPx3d4
         KqDHvaMaveR64cmwOnfHRo5JIe5TK6byC+JPDq3RsrksukQRkI7ZrUUBZiMO6cMhpLrl
         W+k10aP4Efp4jrLdj8SnV7sj+mP0CxOvG7veDvNA7lOGW6uKypC7D6mf9eC/WDWwPFES
         3URwP+mg5ZnYbH1yPzPj9qGwPhfGPwpLZZl1c5zy6wIqAQOuL5Kn+zdipD/OzU8zYmWq
         U36KcR0t4VPZnLmt7USimliu/qSu8a8z3dKX4eF27AFE2EnrqMMZDXWU5LhSSrd5SUlj
         8RkQ==
X-Gm-Message-State: APuU4Z+UqjD7PbaV7J1XnjE9snO9NYbs0mFFWmpDobZ84GDxwjlKgbfP
	LDSry+QQX/QmAieMlV4tIY/EmUSfRw0J1vdp9JomRXyc9OLLP7dAg0pF
X-Gm-Gg: AYBFou0B98/2NhVBnk5OV44Rst77k/AQTfpalW/rRGBc4mel3K2b3kVLXsKOvxRKbCR
	MONJp94SBzYv29IW5u4p4b3eQ/57OkEcZYs6JYXk4yVC3F9BRAKrwIsh9B0XChctk1NkvmWHO4B
	xnrh180Wzlj069CaicPqabGzm07AAtNL/bsufUinFGj3Xfc7SV4xKkV3beXvSHvUIFRa/9sLCkU
	amB2SxjxoHYrjg/URyYGnY/WOTVvReaBJWBNp8D3hT185g6L/iKYvSTKb+zCyGSMIzIf1MV0zjs
	4danMscYRsxg0pvxMF72lsuvI3A07eqUo0+3mpxjV18rL1Nn0HeGBz4E9eIPTnqa6XLmygw6Npe
	AsIwu3bfK2Y+Xr9Xfq3UsQ1mXiJ+aYoxxNRua3uOJVOKckf6ztflsHBjWdHqIGr09z1znLxGUOv
	yZCJIeX9kLGKG25Qd5kuAuCayWWO3Km/t/5Wb6pdXM0B8MrCdvQZrD+MWyiYBXCBEDONxYWMVPg
	eD/WfLb1zQs54nS5xZYowRfNW96c8DAUFPdgIpuQl5yvQIWXW36Ao2aTpfkHbKm5Sk/6s+DSPzl
	vTFctZ80xtfyhuWkgzqKP480JdweOFWQsgi1Vp7CY4j36wWM2RoLVWWxhpgcoap6OMJaSbhH
X-Received: by 2002:a05:690c:7008:b0:8b0:fb9b:8d0 with SMTP id 00721157ae682-8b2b673ca09mr70118887b3.50.1793732137456;
        Tue, 03 Nov 2026 10:55:37 -0800 (PST)
Received: from Abelha2665.autotrac.corp ([149.78.105.186])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b30992b0aasm2880387b3.17.2026.11.03.10.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:55:37 -0800 (PST)
From: Jhon Wilker Rodrigues Aquino <jhonwilker0112@gmail.com>
To: Richard Leitner <richard.leitner@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>
Subject: [PATCH 2/2] usb: misc: usb251xb: configure battery charging from DT
Date: Tue,  3 Nov 2026 15:55:14 -0300
Message-ID: <20261103185514.72144-3-jhonwilker0112@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103185514.72144-1-jhonwilker0112@gmail.com>
References: <20261103185514.72144-1-jhonwilker0112@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>

Parse the battery-charging-enable port list from the device tree and set the corresponding bits in the hub configuration register.

Keep charging disabled by default when the property is omitted.

Signed-off-by: Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>
---
 drivers/usb/misc/usb251xb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index fb0693742f018..166eb541ef161 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -577,6 +577,10 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 			      (wchar_t *)hub->serial,
 			      USB251XB_STRING_BUFSIZE);
 
+	hub->bat_charge_en = USB251XB_DEF_BATTERY_CHARGING_ENABLE;
+	usb251xb_get_ports_field(hub, "battery-charging-enable", data->port_cnt,
+				 true, &hub->bat_charge_en);
+
 	/*
 	 * The datasheet documents the register as 'Port Swap' but in real the
 	 * register controls the USB DP/DM signal swapping for each port.
@@ -588,7 +592,6 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 	/* The following parameters are currently not exposed to devicetree, but
 	 * may be as soon as needed.
 	 */
-	hub->bat_charge_en = USB251XB_DEF_BATTERY_CHARGING_ENABLE;
 	hub->boost_57 = USB251XB_DEF_BOOST_57;
 	hub->boost_14 = USB251XB_DEF_BOOST_14;
 	hub->port_map12 = USB251XB_DEF_PORT_MAP_12;
-- 
2.43.0

