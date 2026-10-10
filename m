Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAEA34E777
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 21:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791667998; cv=none; b=cAX8pRXNPQildmQFtD/qVX9WwxiCc+tJI1lRM0Y+q4lJ38j5DK0VHTiksPa5FqX831wmCmZ5yxZlMIYXVBeYi46uChYvJY2rPIiommoDaQNvT5UPU3bPuCLz9eOwzOxjnoZaV+QWnbejExnEbQtF1Ba2ViB56DHTsiP6FymUszU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791667998; c=relaxed/simple;
	bh=a+sF6iYdqiPAe5xoRZQHhVMgKfMsfaYDg6ekcwVE8eU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aGJcwreI1vV1r8uq1kLuuN+bd1NRLb1Z57Z4Qc9UMfHkRGc7kvlxYt9dmEK+5XEQiyuLx8sfbEZeoPpOU3c2NF6PLUDF/EfrM+fIOfNAAZqIB8l9tddPlTYxOCLhnnthtaLOJ35il5qKeK1tcfJuX26NFhu2cC5sp/1dPSaoOuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gBdS8jok; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBdS8jok"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso5479995e9.3
        for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 14:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791667993; x=1792272793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eCrolD5DkHotxeUAvn9zDJ/yLsmWYGf/l2LTc4XvAY0=;
        b=gBdS8jokxcMph9iewasZUR31XmXgdbSGK/8E38TgilaaXtu/nGo5PUyNUIAi8lv1xu
         CyAUCLoTQqiEnizfkkJLkp5e0uCJjzfFDoni7oRxygNvaP4GRHWO2KEgJKfyvwEgYgCT
         l/j3sO1GloDGjzUV4BcVLPEs/jFmd/u1p3cXPC/CnQdWLbl1uqulhxDs02nGDFaeN+8J
         2BA6riTo8lrE6PteAjsHJ3veVI3X2yqbNODCf/YAj0qiXjxaPFz06pTyLHfzCsQRWTZm
         n3SID242nKBhG1/M4Fjp2AxTt0ZQre2DV6VQXJCt/nPYCUR3jM/DTcN8/BwWcc7YI4TG
         pLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791667993; x=1792272793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eCrolD5DkHotxeUAvn9zDJ/yLsmWYGf/l2LTc4XvAY0=;
        b=2Ja9A1GaJK0i/0Yl/D7oB2MssuSAq5FNbUKQFDtoTcW5mFgEbjZNkXl9/rzpaeXcKF
         UdoayN3K+NZWzatkBp6zbYUqOyWHhmy/4UKtFusjiqwp7Y/+vaBo3ab1aW9Ic61cqrfn
         aEDNn91V62+jJ6+xaEinQFt63h2V15U7ICpO91GIN8DmSrPGFHrv6Pp2rZfF2eT3MA2a
         H4+4I/WVRZ67/g0G2VfsreV5v6ITE4hZq7NVCdn7FCoh+gN4NQa5nUgwcde+NCeAheuj
         Jhn8fcOVUUulWRjDo2IoONct4nYBNMzwUqBT9f4ZQLF8AYt87LR4ggfHMgckt9sbESaG
         c7lA==
X-Forwarded-Encrypted: i=1; AKwUvBx68J3f6hoboWkj7dzYpgnmouERNb6PqwiIixMjXzX310IwNWuQp5TTgOua5iSsR8TlPVczerodzAQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9KpF0n1XWdcVt5axC96nOyS8tC4YERUWxJ1yBUWMRRi3UajPg
	FPFe8jJ/1dkmqeE0CyuMdNQGrc67mITvWOkLSIRP5fWPrvhPp5dYRLUb
X-Gm-Gg: AYBFou0ECtFkP3T9+AMAZVM9Rid+tvSlSfAPgJ1rQuOhQOcwu/SttgLt3b4hfvYK5y0
	E/0A1FrwLYBb8a1fAmOZ+4gihu4okV1TgTgeHttOk5OmMCplUaAzC2QM3JV4o0QancnfBnyo9pw
	kMzlzbWdf4RUQk+UMM1VSFWNlO7LSRtCsTk+VfPt149dAOkjISG8dCGMFphVvhTyISfp4epaJPh
	7cJPfeY/EYYx0HDUhd9nw+MPG3uZRNdn9T8fB1aFAJMcd9lKqREYOnIRgn/hovywQHe8zLWq/oB
	GKMtyd/dXhFZcDSn6eAt+xY1wNRf8ehe6kdACv2aYS73gaSbxxsIH/ID07tMGT46BmoMdIDVT3u
	JU/t+JGllzEdN0m5LdiZRKHo2OxZvY1XaHfb/m+Pk1cBsgICWlOt8Cqc38ACmS+F7DDV4S27VdW
	OrQP9EJ9Igntxpu0jabI7gC6XA8wfuAmlEuIyMXHALUYiIgrPQQTMFjUdE9PfKbsMXri2BTFtgF
	TYC3GUn3pSQ26bxhJu8rjRfvtLM4uLWZnYwkVHSNdQ79gHsk1NL0Q==
X-Received: by 2002:a05:600c:3f0c:b0:4a1:85d9:13be with SMTP id 5b1f17b1804b1-4a18e498471mr117737605e9.20.1791667993167;
        Sat, 10 Oct 2026 14:33:13 -0700 (PDT)
Received: from fedora.fritz.box ([93.93.22.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm202787435e9.3.2026.10.10.14.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 14:33:12 -0700 (PDT)
From: Stefano Munari <stefanomunari.sm@gmail.com>
To: netdev@vger.kernel.org
Cc: Thangaraj Samynathan <Thangaraj.S@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Nisar Sayed <Nisar.Sayed@microchip.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2] net: usb: lan78xx: reject invalid EEPROM write requests
Date: Sat, 10 Oct 2026 23:32:48 +0200
Message-ID: <20261010213248.15938-1-stefanomunari.sm@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The runtime PM handling removed the -EINVAL return for invalid
EEPROM/OTP write requests. These requests now return zero from a
successful usb_autopm_get_interface() call, even though no data is
written.

Set ret to -EINVAL for invalid requests while preserving the runtime
PM reference release.

Fixes: 8a7ffeb795f8 ("lan78xx: Fix for eeprom read/write when device auto suspend")
Signed-off-by: Stefano Munari <stefanomunari.sm@gmail.com>
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Tested-by: Nicolai Buchwitz <nb@tipi-net.de> # Raspberry Pi 3B+ (LAN7515)
---
Changes in v2:
- Add braces to all branches of the if/else chain as suggested by Andrew.
- Add Nicolai's Reviewed-by and Tested-by tags.

v1: https://lore.kernel.org/r/20261009005702.164936-1-stefanomunari.sm@gmail.com

Tested on a Raspberry Pi 3 Model B+ with the onboard Ethernet
controller, using raspberrypi/linux commit bba53a117a4a on the
rpi-6.6.y branch as the baseline.

  ethtool -E eth0 magic 0 offset 0 length 1 value 0

The command succeeds without the patch and reports "Invalid argument"
with the patch applied.
---
 drivers/net/usb/lan78xx.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 5655941f1478..2fed938fc7f4 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -1712,13 +1712,16 @@ static int lan78xx_ethtool_set_eeprom(struct net_device *netdev,
 	/* Invalid EEPROM_INDICATOR at offset zero will result in a failure
 	 * to load data from EEPROM
 	 */
-	if (ee->magic == LAN78XX_EEPROM_MAGIC)
+	if (ee->magic == LAN78XX_EEPROM_MAGIC) {
 		ret = lan78xx_write_raw_eeprom(dev, ee->offset, ee->len, data);
-	else if ((ee->magic == LAN78XX_OTP_MAGIC) &&
+	} else if ((ee->magic == LAN78XX_OTP_MAGIC) &&
 		 (ee->offset == 0) &&
 		 (ee->len == 512) &&
-		 (data[0] == OTP_INDICATOR_1))
+		 (data[0] == OTP_INDICATOR_1)) {
 		ret = lan78xx_write_raw_otp(dev, ee->offset, ee->len, data);
+	} else {
+		ret = -EINVAL;
+	}
 
 	usb_autopm_put_interface(dev->intf);
 
-- 
2.55.0

