Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794633004;
	b=aXHDE/0mCXZEmQNtpgpxhvzSUmQUwVx/v+aNXDXGOtJ05IL8Bp7gNHJ2EwA/xCj866g3
	 JH7brqYMlYRm+RZ2HuYiDfhhY+axJFPw/gV/UWmcvoDU/zA8YgpxDd18u1BR0q+lERb6r
	 5F5A3NZ72RdN237vAG1xH4nHXArMVqdGURpBk/fNQIHbp1Vu895KW9kZ9gVqEg3RmwQeq
	 wlBd4973KbHEYaKMh2NTf6mQSTAmPyt8gcaaDOHZUXbuduhbFV1uqSDxNQXzZ+F+5L2TX
	 i6CSfZY22pwn5ewWfanfZSQMj0G5XAHOMTk6RYwGKGy3nvmhZTzPnId0r1mLtOglkqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794633004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VUh/PFi1lDb3micsC8D/BbCK473QFmrlieov/ej0JWU=;
	b=wBogzZKnIIMPtefOXPue+p2yI6QrwLeMXtpIY96UYBuREwXuaARfXWQ6NZ7oqq5Dg4Cz
	 CzRTBEzBK9yLQWuoCg8yEVh1uvDw4fg5RxnTF9r3Nh70tzWtlrpvUGueqmp7z2DnOaAMf
	 y98vu8zWXUIXa2Yq4gdz2iwXFjdltes0z8K7yh12ISOwTPtwmbFnyRBy9WL7qyZ7h++rJ
	 5ND3fadm5Xaj3lkVqhpdXb8IN6LhOzk311mFOeXkkyNzDgSVDT/VH/O/4VP4v2vLmhy3w
	 QenNiGPt+6wRBfBg6NaxCgH7EnBvJ2ubtu7DdeBD2RsknjIU0Tu9ZK0exnSv0fUve6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vpXcrQIp;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4FB606A88A
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 05:10:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA4FB606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vpXcrQIp
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b0a519049aso2316607a91.1
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 21:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794633000; x=1795237800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VUh/PFi1lDb3micsC8D/BbCK473QFmrlieov/ej0JWU=;
        b=vpXcrQIpE8QmiuCYPGBGK9RQKIMyMiybG8Uli5btFf8XoUz1ZlpENF//fzVzuCfuMw
         iOgSjMxwidMCnvs+jdE5E3j4/HMVBdifXsAvIXlIX3EoIgSqvNZz/RvUpaW1L7+rWOEF
         GPrqv0RGU6YjxGRCplKrxiMD5tl+4eimQQS4Evib6ZX/GpN1lzz970z1vEQgSgONuCNU
         Zi8hmOn6AzUCslniyq7X8l9os0xrhbnFPgbpkAwLdOynUhzjYYdD8ev++4J1XgAVgrHy
         vmPYzScg26uhNDwtMaDhNIG5fV+3i/se9+BVmeBkqO8NHT+q9NJjmaTQ/45OgEPK8hmL
         LHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794633000; x=1795237800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VUh/PFi1lDb3micsC8D/BbCK473QFmrlieov/ej0JWU=;
        b=I92QCXcS8kNvVcV6Q1M8Di6Y49Iwki+OmeAe98dMEhDc3+baL5/wDQKoGs89EZLCOC
         CdNdDdFuvtVuyv/Jj0XgEmU9TUePnJzVZUaxqMeDduyL+My5LNngfOEl5nccadI+DQFe
         B/CbD5gWzmHzmk32N07zxAw9h2fKjd924Oof3/3hJZ0iPsUGMExqgVziTSTw5rUwzhZU
         5J24gWLHifE+ciX3fmQnVS159GoKpAS1iH1CW9q81bUUavY7hB+qlQsQIGTtFupZLWkW
         S6lvdYz+2fTvpjzcCIKtLLOK2YbGvuDPwzDECOc6GRXyNNPMmhL31etHGKQhR+LgYu5u
         yPdg==
X-Forwarded-Encrypted: i=1; AL+hErFsR995YmjgLgxlwvbb9SOEMy0Nd5l0KI9XcsNOkHBZYdYJh72EZGBxDu4AvggibN8sIFRjQBl8iTk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IeC6y32qgv8q/5rDFkKJmSpkATovDLcetidFY3/AGx8mkr0jZ
	nEUbmYY2ysnMMSgsfyDme2oFSjHooSF7oIn1JAA1huO4kBanCLNbuQPX
X-Gm-Gg: AYBFou1iunsGetvq2ncjtajzvQXzwca5ywTBZtPwQv3pU5jQYVMT0rgGoz5mk/hfDSM
	/8JEoqoCIs+0lQN+MmbqdI04+JNAVJdA+YM6/ZzOYSk+0kJeny0BnVNuqzDhLrkku1TQnPKipw+
	1UnBQ2WmoM6D+QC8m1e5xm0EKwynOl0kUyGdp6GmftMSVJ7j71EvkU4OIsAJ7bibgkawGitPte/
	AgjHw0eKhGPJsTyt+K2gI84WjQ6L1w01um/FXXMmByUJoijWzIF1fS01RXO/vtB3lbMwCcKGFBd
	ZzYA6SREIsIhJ/hHo4myEHIJVo/GVkwWJNFNYrGEr/x/J3vehecWcBPGiPCf3PQNT1/+m1q7cu5
	9NEBDMmrI5ET7Da16XTxPpT7ZryPDsgYw5GHReZ5ulqLe2SmK67hj3VOObixQpiJTdWQ2UUvTaE
	kQD4HRmr+rXh0kbI8SEEuZNykTKt11pkdlE5+PS6g/EcJRp5WgQohYCd61yUtUuQTWyiHGgJIm+
	nlF4o7ySsWTS5v7M6b0f9f/cjFoB43JkrM3rl0dFxzQ4gxo8PYte8Fbhh/9xiIKMV0meiRRZ4b9
	lVqAdXR5jtvqLiKOyGFRICm+esfJ16nEcQZqJSAptYFc1LgflDmu
X-Received: by 2002:a17:90b:3146:b0:3b0:9a13:c5d5 with SMTP id 98e67ed59e1d1-3b1b0b57dd8mr4332886a91.16.1794633000237;
        Fri, 13 Nov 2026 21:10:00 -0800 (PST)
Received: from fedora.lan ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d257a0sm12776577a91.11.2026.11.13.21.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 21:09:59 -0800 (PST)
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
Subject: [PATCH net 2/2] net: usb: smsc95xx: propagate MDIO write errors
Date: Fri, 13 Nov 2026 23:09:54 -0600
Message-ID: <20261114050954.275495-3-artem122novak@gmail.com>
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

The MDIO write helper currently discards register access errors,
and the MDIO bus callback consequently reports success even when
a write fails.

Return the error from the helper and propagate it through the
MDIO bus callback. Continue treating -ENODEV as success during
device disconnect, consistent with the MDIO read path.

Fixes: 05b35e7eb9a1 ("smsc95xx: add phylib support")
Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 drivers/net/usb/smsc95xx.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/usb/smsc95xx.c b/drivers/net/usb/smsc95xx.c
index f85ee5f8a539..52035c160f4b 100644
--- a/drivers/net/usb/smsc95xx.c
+++ b/drivers/net/usb/smsc95xx.c
@@ -215,8 +215,8 @@ static int smsc95xx_mdio_read(struct usbnet *dev, int phy_id, int idx)
 	return ret;
 }
 
-static void smsc95xx_mdio_write(struct usbnet *dev, int phy_id, int idx,
-				int regval)
+static int smsc95xx_mdio_write(struct usbnet *dev, int phy_id, int idx,
+			       int regval)
 {
 	u32 val, addr;
 	int ret;
@@ -255,6 +255,12 @@ static void smsc95xx_mdio_write(struct usbnet *dev, int phy_id, int idx,
 
 done:
 	mutex_unlock(&dev->phy_mutex);
+
+	/* Ignore -ENODEV error during disconnect() */
+	if (ret == -ENODEV)
+		return 0;
+
+	return ret;
 }
 
 static int smsc95xx_mdiobus_reset(struct mii_bus *bus)
@@ -306,8 +312,7 @@ static int smsc95xx_mdiobus_write(struct mii_bus *bus, int phy_id, int idx,
 {
 	struct usbnet *dev = bus->priv;
 
-	smsc95xx_mdio_write(dev, phy_id, idx, regval);
-	return 0;
+	return smsc95xx_mdio_write(dev, phy_id, idx, regval);
 }
 
 static int __must_check smsc95xx_wait_eeprom(struct usbnet *dev)
-- 
2.56.0

