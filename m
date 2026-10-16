Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC72179A3
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 00:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792109136; cv=none; b=O6ZQb7jH0VXpOls/hYjMYoQ6Z5n3EPMwgJb7o7yFtYvCYUjhVQDGkLm3kQ8aSlaTR3aMfD3hqY3k1pIkGMiedqk6Okz5ZVpHouKolbXm8Xqr3NLv4sxGWZ7U+ASlco6JoGsj4K30dXc1xgSbmSuSsdDl3PHC+/Lu3L9HF3j6F60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792109136; c=relaxed/simple;
	bh=fPRYypa44znrNavChK57m+Ydl3AyDgbMBifU9YzFMLU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vwv9v+lGwir8Lk7C3K1iKfq2MCAbKbNFLhGzsiRtBIOdMyS/kRl9ORqWEJ6cBlEmqLuFghBlMbenlt3kI14Bv0Am+N2JVtALOU3q+6dyNQ0b0qGCCUvstSpiWD2u/Uh3wbP2kvjXmJY7sBUvGYwDU0IdF92xLcYoe+LcKVd7DC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rScwL5k5; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rScwL5k5"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so51979105e9.1
        for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 17:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792109134; x=1792713934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UnhsvI9MzVbrWhzAeYwgCkKjH6CfXVlO8VeDcgUlxMk=;
        b=rScwL5k5O6KZT1xUuakOfKTXFJWr+OAjf8bQ8GsWjMa4D8l3XuFAzK3ywr6S7ER0g4
         hw5cKkAhLWyypo3HS8444/rvHwgbanQDCjQtMRb1Sfpg47ArO6hWtTMWGEV08v94vzMc
         qwbyUJz7/GgOmqHapRdvrEDirTx2GdWy5D9PDrXYB6cE2Kq6oS/FFfYJFk1XdKfGRKF4
         pr5QELEyQ0xWdd2g/zbRhBV6v9lWfL6IhcIZsqsr5Qx+eXucI8MVITTOEWUh/2MqB6qf
         5UGc2zYHC+B8dusJZUZspdAv4HwTUCa5wYSKjpZl1QIvu9raRQTuqBgRJqy6+E32Fwe6
         NGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792109134; x=1792713934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UnhsvI9MzVbrWhzAeYwgCkKjH6CfXVlO8VeDcgUlxMk=;
        b=JRsDJyZxTs2Pqlm5813HRRF8g6LESQ3qiI4wGLMplWsQ7fqVMYYh0U8i5HiJ8iN5UD
         2Pt2hylSkdoIsWS3fEKQEFspVbYhjuNICqRjOTa8LdLrqnuli/o7aTbRht2epcNFbugT
         7E8qihKtXoJ2qFmxoEaXGIdU2ikUBw9G/MHWbWe/MrpVGiQKylT4u05kryF+enN5Xepf
         eDWdDBGT+stjmsVfcNzzDQ0eQyyJHeuhg5aAaxE0KFNha7pR7P6rhkSyOLJf1SFiP5cu
         iX5OBmNVwv4nhd3Uv6bBqrNeDdmcOrEkOKbj7Fdjh+v3LUHR5GQc+Gg9SiprzSVbHVCj
         zhfw==
X-Forwarded-Encrypted: i=1; AKwUvBw+ATzrQjKyU2QomaVhgVKbA2z/DSDrRZoYB2zmXHQn+L/J0k7Qu0bsJspkWlONb0X10P224DNSK+c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwtkAwtuScYmD/c7T5ykVqKDO44Vt7TAIdBQ/VeYWW2nQQl4AK
	kP4iY2vgS0IOzDSTSdzTfLve93DbYWoLXQq0sY2sSOgdM0qIMPTj6PL3
X-Gm-Gg: AYBFou2pnGWZvtR2rVxzjTtyYK1entcKL3HHGHid+UzA04aTN1uMrPUdofZKtSV3B99
	ZvJYSXNpnd+Krz36zprdMQQNwG8yBz4/oYqLeFhToObClIty1emayhPdYzyDuco6UF9tb/xkmxp
	NF2oMu2t6DtQe7dwuaTN4DnvJ4jq1bY/yL3hYATOyJ+wCHlznFSqe2k3f4oBayuUsMdLohLVrgP
	74yn6CaIMEhh6u32zc4fkofZIIPWiYylqpKI5d2H4D7wq4P8ikraVyxXg3wsgYphLeRzWQkp17A
	QvtKU6WaUBNUR72vTSy1WVMib0M7CxCf1XvWGKXd3WG70X4BAqi3AH/Uh0RwQqlS2mYtc/D1wqz
	k3sLNFM0JRQofKM1TdLJ3qj/lV8E5+yHKc1Etdx8wDh8E9GxaRfpDNLiDjwI834FKhOoR7GTkQx
	lplk6krOUQTRaTynhQXCzhiVedZHaED8oNHK1OrOQMciGNTPECkbk6VmCCBeoRfeeRNgPRldKG3
	Q+X1mN/23iKjRhftVMGzLYST8ZxaijmWfdKUzBa9xhvqSsO5pI32A==
X-Received: by 2002:a05:600c:4747:b0:4a1:88de:9e8b with SMTP id 5b1f17b1804b1-4a18e49d65dmr411113445e9.5.1792109133763;
        Thu, 15 Oct 2026 17:05:33 -0700 (PDT)
Received: from fedora.fritz.box ([93.93.22.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8d1esm1315821f8f.39.2026.10.15.17.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 17:05:32 -0700 (PDT)
From: Stefano Munari <stefanomunari.sm@gmail.com>
To: Thangaraj Samynathan <Thangaraj.S@microchip.com>
Cc: UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: usb: lan78xx: fix error handling in lan78xx_open()
Date: Fri, 16 Oct 2026 02:05:21 +0200
Message-ID: <20261016000521.92868-1-stefanomunari.sm@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A failed interrupt URB submission leaves NAPI enabled and EVENT_DEV_OPEN
set. A subsequent open enables NAPI again, triggering BUG_ON() in
napi_enable().

Clear EVENT_DEV_OPEN and disable NAPI on the submission error path.

Reproduced using failslab on a Raspberry Pi 3 Model B+ (LAN7515).
With the fix, the injected allocation failure returns -ENOMEM and a
subsequent open succeeds. Verified connectivity with ping and SSH.

Fixes: e110bc825897 ("net: usb: lan78xx: Convert to PHYLINK for improved PHY and MAC management")
Signed-off-by: Stefano Munari <stefanomunari.sm@gmail.com>
---
 drivers/net/usb/lan78xx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 5655941f1478..6a95934bb3d3 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -3484,6 +3484,8 @@ static int lan78xx_open(struct net_device *net)
 		if (ret < 0) {
 			netif_err(dev, ifup, dev->net,
 				  "intr submit %d\n", ret);
+			clear_bit(EVENT_DEV_OPEN, &dev->flags);
+			napi_disable(&dev->napi);
 			goto done;
 		}
 	}
-- 
2.55.0

