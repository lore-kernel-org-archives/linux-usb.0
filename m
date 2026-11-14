Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794633009;
	b=wQmy5GQ/eSh3DVMGFEvC3MuBjE7mT4CJ7LZpf/vVkkD1fa5qazEPqWdW1y685ahfcQas
	 paw0DT336wWiVrv6py9ajBgdugoOrGGN/IMOW1j2OCLxjXZHyV+keZTnyHN932CMMUdNw
	 dMdKzEWYf7PMfxNrQXLgvEnyocuY1L75lqeG//n4fOwLvPxGbnpxBRcJz+cwBwKUAlxVE
	 qYTGUVD/jG8oQN6tT+ScB3S/HmRwTvQxg1pZhaBXDK65iMx2Urn5AJyZnn5jza2p7mPfU
	 HG7KYEn5fleJr9kqS1AgapMx1+TXU3MkyUzA1QjuCpgaQhQrnoMTMnZiM5AQojtrQOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794633009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QNw1D5Dt32lz0/D4ctFxMFaPg94rUQWpcHEoRIYdiI0=;
	b=QVXaCRymoXYqOms2N80AJlDGVB9oyiq/0V8vBTO5z0VQXFYcQNRkd9hx7fD6I2txrUoJ
	 m689scx1bYDyhYCVJG3G/EcATBGhFAGwAF5rqj1wqzeyjoC1VEuis9HxfvnjNhfhk3r6W
	 QutB6HUq44hz2PoA+KzPvWfCcAypOXTcyQY7U0NRTXulDwyPGbIEAZcqnd4ug6s1rl0GX
	 zyTvNWZQxE1/8hgkJe5e0W3n7jircWdniZBS41nXuh6muoL0YrdMNKxBTzeWiotajg86R
	 d3OKiWndiLrRMX7yFDKWsFASwm3HMIBHtBtwRKg42FdBW2oD6CEt27c0Sk4NM0RsdAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PCv82Xos;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C93606A8A8
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 05:09:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9C93606A8A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PCv82Xos
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so658009a12.0
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 21:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794632999; x=1795237799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QNw1D5Dt32lz0/D4ctFxMFaPg94rUQWpcHEoRIYdiI0=;
        b=PCv82XosjaH7HTL3klmxO2Xv4wSrvHyC4HX67ixIo5QwRftFlnvVR7Cat3IRlWglQo
         PHie/GYajbcMEG63N0RcYRTLylGTAyliEwK75+OVkwl0NZ4dloOG838UR56/wMrACZpr
         I40sD0oei8fzqv8umjOrRJ1/+ml4hzshpbnjzKLBaMlq7YzkBv+PX92A4hSf3oSZwq1f
         R0VBUaEGYhlIlIr95OxgKRxb60SsNjTdcdNuidp8vVjEW2L1YIHfMSTgI+TbiT4lLjkG
         yqs3oam+esxoFvzt/YD9XhbrNTSU5qrkdjDkTl6IDlm6W8hq+rAuzhXRqX8aK23K+JmW
         k+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794632999; x=1795237799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QNw1D5Dt32lz0/D4ctFxMFaPg94rUQWpcHEoRIYdiI0=;
        b=WfZyaQCywo96aiOLd65Gr2jA9oPTUp9y1+kGkD379IwYCAG5QtfPenypuYxzW21sYP
         bk92D3XV+8k7ONqwh/t3iL3Gbw6BigNr7sskZEdxnypFNHzpVvXyX9jNj4UzdDyxdF7s
         88A7NdYj9SY1/Vfg3wKlhaveEVQXn2hbTkrwllYWZrrNDdnRc5b3rOAMpitxVV7/8G+B
         cRIN04nCgufOwxWcqyNewmqCTYrd/1WhJiIovIxoaCfyeU62/1lM8QFoQkPoU8lXpw9L
         aQkoVtwZOZNgI6Dc0HcR8qs0Ev065WKK3slvBmytDW0eKziSpHX2NNH7/XHJKVSWXK65
         1+Ug==
X-Forwarded-Encrypted: i=1; AL+hErFi5fDgnUTTwZ5D8q79jGOFA1/7Y+mJobtJE+OvOIV7keW2QDApdOtfuu4e+Ddei3RXAvETIhIKrZU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Jq8MqkSGNZwP5A5fREb1gjORjPo5pjxan07uy/FqsLJKWk2N1
	8zOCYK/djrmJUNCBBSj6V2m/87W77we2uBP96zfK/zgTaGxGbYNIg/e7
X-Gm-Gg: AYBFou3N3JgHOXSRjE9pZi3pLVSyW16V09OdOuhyFDIe7swsFusJvoTeYXnCiANL0CX
	bnseAW20Mt8zMDKpxveP27brdCG0st+pC5LqXCUfueZEb9pdxsgG6XadcBQg78XgySGc2Ww6CoR
	em81bnG1TYv72OC7EYUiSG28ao+A6/mw3KgYvwfZawcg46DNgxezn46oGEec7bnkQRs9hIDDDYH
	V3HhDLOvYvMg9aI3A8oguGkLxuYISOXwlSLzTBqVsXkorM3ff6WQGsC1Aaco2K7A2RP2pHMEm33
	xRxkOVgrGkBGRiW3Lwm9iaza+RkiRbI/ej5Os4AUgvOVRUBEEEU2zjCtB3bYb5wXmgB4BJ/Meft
	rMW5Vtdv6qHwsoBCY9/RSSzIX8eOIJLvvyr+7UTwTKEgEpvxLnJWK9j53d4yd5N6zUAtCaqitei
	h1D7xdUpAJuTnaYp+tZJRXvFY52b3bn6CvnJckAy+t8KL+ztgEUnRANBkndt/bUWdGw81b9OY9W
	1L8JQ94W4TEu/ZeVRCg0rDcGZYxfOX0wEoGwKMkdvqJAPtPx4BJeQ5z2Ge+/4jgAHt+xuwI029+
	CHvAdsb0xb5NzJ/2i4xVJY23nArwYPY=
X-Received: by 2002:a17:90b:1b06:b0:3ac:b44c:2d84 with SMTP id 98e67ed59e1d1-3b1b0a0e8d1mr4752210a91.13.1794632999243;
        Fri, 13 Nov 2026 21:09:59 -0800 (PST)
Received: from fedora.lan ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d257a0sm12776577a91.11.2026.11.13.21.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 21:09:58 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: Steve Glendinning <steve.glendinning@shawell.net>,
	UNGLinuxDriver@microchip.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Alexandru Tachici <alexandru.tachici@analog.com>,
	Andre Edich <andre.edich@microchip.com>,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH net 1/2] net: usb: smsc95xx: propagate MDIO reset errors
Date: Fri, 13 Nov 2026 23:09:53 -0600
Message-ID: <20261114050954.275495-2-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114050954.275495-1-artem122novak@gmail.com>
References: <20261114050954.275495-1-artem122novak@gmail.com>
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

The MDIO bus reset callback returns success even when reading or
writing the PHY reset control register fails.

Return the register access error so callers can detect a failed
PHY reset.

Fixes: 809ff97a677f ("net: usb: smsc95xx: fix external PHY reset")
Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 drivers/net/usb/smsc95xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/usb/smsc95xx.c b/drivers/net/usb/smsc95xx.c
index 130a460c1f54..f85ee5f8a539 100644
--- a/drivers/net/usb/smsc95xx.c
+++ b/drivers/net/usb/smsc95xx.c
@@ -291,7 +291,7 @@ static int smsc95xx_mdiobus_reset(struct mii_bus *bus)
 reset_out:
 	mutex_unlock(&dev->phy_mutex);
 
-	return 0;
+	return ret;
 }
 
 static int smsc95xx_mdiobus_read(struct mii_bus *bus, int phy_id, int idx)
-- 
2.56.0

