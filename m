Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736142;
	b=S6wzJZvZMQd6Dc6eR1UzCbUDEMagu/pX/kUIOZdS4gGNXXH0mO7SDmFdTQzEtSJIrJEA
	 uxGL/9nH3m4vkwXp8V2Q10PSfyRGpMrC34I6ZDSvIbQX3BD+bFR9Jb9lMs1YOy9mS/rQb
	 ktLE+K9sZ2LtBTLCeomcLiBngZPrQlQ16lP4+Cr9wKzz5GJ0y3I0tdSTlUrkv0+OC1FpS
	 DwKC12Ed5K2llPHGM4f2M5FMA/qWOKHUeo7GsZrbU0L+n0DuYSy4y2Y+GWVmvO/+rR/ns
	 nc66y9LwXNvv85/kZ9NW9PsaQ5cA50Grvs8a6pU9uhD9UnFiLPy+Jz253hiP3YLZ1JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zPsd08imWPUgooGMrfpChvpxAcwbOgNAsgqoEHv8Bts=;
	b=jsbcfzOmSJeNjXeL7Xsj/MqpVZYtJ3C258biZLpNRqQig8m8a+vlUS6Lt39VzpnGbkSQ
	 oVuXQ0uTibdj2zJBETHukCJLrvjy7MUiU49eKm9LvhpWcd4nW9T7om5qmPlUgabnRjFy4
	 Fdawas33Uf7qm/cVBcPpifwgMN7Ya9GzLVejkbM7xoP2fRYDsT36yXg6M93JlWA1yP1Qm
	 rJ2GkesjssOI96WZjlCCit0lOVGP1LcB2IArAtsfgfktEzeYEqLdctnMz2VD48NEmd8Bu
	 It1RwgP+unAraE5yg2VJk/BhMfh7O/RFAsvORJMr/TK6kM/e7Uq5PrKg4BSyQWyDGjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pgt4IS1F;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7745E606A32F
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 20:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7745E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pgt4IS1F
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b0d91601bdso9660317b3.1
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 12:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793736141; x=1794340941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zPsd08imWPUgooGMrfpChvpxAcwbOgNAsgqoEHv8Bts=;
        b=pgt4IS1FC7nW0YArEAhe7aIbrJPeoyutEcmMPEHSLdqxh05jrfHi1QtBR5dGtgdiXl
         ifcp5mhPyKEBTZ3Fc9OEMJYv587LsBPAsmi0wie8r/2XWdC92lOVwo2cGBMnyxE3ueVK
         o6ONndjZ0SaeJoYfivLmH998WaGrwOakXCJY+61hSNvkIZq2WWGxZCAx73d8ltr6NGmc
         9zSu2HY0evpOvZiA+j271Fhz+xz5GY8NxfDYOOLvsiFFL6mh5EYSfZvsFFSe7kS0mBkk
         szTcM/i8O75tnWzFyWlrTTu0xHljVJWA7gaGqFlCVNHi1HX/2+e5dNNdhd0KvjP7OsYt
         6Bow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736141; x=1794340941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zPsd08imWPUgooGMrfpChvpxAcwbOgNAsgqoEHv8Bts=;
        b=oDXXuf+oF6n1Nl7Mk2Cib2qOJOeeaEAuc8jVF6jIqVJPSPN5lS4Oh8uSArvEfmDSKc
         CIBaCla33yHlyhbsu/jXLXuTZx0mQCA+Pvhrse9Mvt1SLb26fYC7LEO7n0HAYxxdbDhc
         j86mXOXhJKfAoDNlKcFO/3rVaWeM/2qqV0bwO5bsNpWBw+tmwaG7XEO+zKw35E9B1357
         7GzJcR7JC6Wv1pXnTvpX9w6v6ukG/WQbGhTr/TbbK42fdYg7H0Zm2hgKYygIu3Rt1Kmt
         bPiErwGKHykFvjtJyRAUxngz179U66c5bGkjAibVFe4qU+yehXhK1z53UJqFEVRsNMMD
         6MXw==
X-Gm-Message-State: APuU4Z8uEnPE446cesoh86fsdk3eABQWYwTPoCqJUyVfoj153KNJsI+y
	5nu6M7xq8Jnz4NoYJziBP+fRWOIEcAbX1bI1RsALwR19d1l4D7Q+2mPq
X-Gm-Gg: AYBFou2FA0IAqD9eUMsedzYAPIbWNFiZHGRtwCgwn8TkurSS4sA9sguEwUCO+cKbJGP
	dlqwabUA8UdVaiEI9jRHxq8JLtyZB2/uBlXdZpVUZkBVWpodciGducNlVVAKCWHCmI6f9AvJJC7
	axTIGUfXAL4XPzmwVJnnWH3eF48AxDmBpBRZBF76ZHcd3gBSHjfWplKW3ko9fjGr6SwhIZFRSeW
	wvTwd/OqY+VodosiXKPvxT39PxidY7cEpRRhSJmbu9JmYVGLSZt4XSJ9KZ/IfLXtd5hJsdverO+
	wQvzBaSUR4/EowYC76BvpRU6iafGP+bW3L/c10giGX+2QCfFO/q1Jdqsv60Hsyzyt3BJSWMN583
	IX40QccXKsjoZUecaVt9DnURDMoD7BH+7GenCSnmq8ghzjWEYR8er//44ybNUWSLyrUpL8Jtk0O
	k6W6uTk42QLvnhnZYVtwwLSIbJAhW27Ro9a9nOPXZrGq0+qBw/9/LVprOFAPM24OD/oFL0VP0rt
	UYgVRC2+IhcsZPeENg9sC7hbUPi9NxZRZSPDmfwUPqOG1ViYYYvvILXdHSkt2roO/KDxttr4Xnn
	TwOvT/VwimdGsna/fGqRj6ezbJS0UK+b+HELWK1ts/YpMJzK0mg=
X-Received: by 2002:a05:690e:4546:10b0:677:ade8:a076 with SMTP id 956f58d0204a3-67ba50c7b54mr6675580d50.47.1793736141331;
        Tue, 03 Nov 2026 12:02:21 -0800 (PST)
Received: from Abelha2665.autotrac.corp ([149.78.105.186])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bee245f70sm92764d50.11.2026.11.03.12.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:02:20 -0800 (PST)
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
Subject: [PATCH v2 2/2] usb: misc: usb251xb: configure battery charging from DT
Date: Tue,  3 Nov 2026 17:01:54 -0300
Message-ID: <20261103200154.125681-3-jhonwilker0112@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103200154.125681-1-jhonwilker0112@gmail.com>
References: <20261103185514.72144-1-jhonwilker0112@gmail.com>
 <20261103200154.125681-1-jhonwilker0112@gmail.com>
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
 drivers/usb/misc/usb251xb.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index fb0693742f018..7c0086a554cfe 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -577,6 +577,11 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 			      (wchar_t *)hub->serial,
 			      USB251XB_STRING_BUFSIZE);
 
+	hub->bat_charge_en = USB251XB_DEF_BATTERY_CHARGING_ENABLE;
+	if (data->bat_support)
+		usb251xb_get_ports_field(hub, "battery-charging-enable",
+					 data->port_cnt, true, &hub->bat_charge_en);
+
 	/*
 	 * The datasheet documents the register as 'Port Swap' but in real the
 	 * register controls the USB DP/DM signal swapping for each port.
@@ -588,7 +593,6 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 	/* The following parameters are currently not exposed to devicetree, but
 	 * may be as soon as needed.
 	 */
-	hub->bat_charge_en = USB251XB_DEF_BATTERY_CHARGING_ENABLE;
 	hub->boost_57 = USB251XB_DEF_BOOST_57;
 	hub->boost_14 = USB251XB_DEF_BOOST_14;
 	hub->port_map12 = USB251XB_DEF_PORT_MAP_12;
-- 
2.43.0

