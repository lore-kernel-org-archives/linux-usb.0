Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466584;
	b=UIgQRmFaW3Y0uK2+2DbFUvl46tWKPkwRo8UES17lJBKkBcUhw0t95tErA/eCbqcvZIdM
	 YnHm29OQbXAHYiWP0+wnXEeWSKM+FEBameRNBewpivg7yYZIiVXRXbB26hR/Rcr7sedsI
	 PCBOJ6td//VwOsCLLQ5nnUMWmePLMcSin84Tlk6N0sf3XvLWSKtS05JuN56IJGztU38nt
	 8VzUlLIQI9TA6iRqw+gCt6wy6Tg/fnJccV/xDSuG0Bjx8f4u0tE+rT+svvvES+S+2FBL9
	 3Oro+rojXhRB+TXjmsgnPOvOwZJF7yWgx2W3JOJAoNppFkgVDaan5vXJ9C/emzvoXCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vTav8FAXb6nFTtunUSm9Oo3pbBRDYrw795godDfr3bA=;
	b=lsLTpzanbBBNpfeqXXkhvz6vjKK+j8ZO34X/bkDs7M1s2KQ1B13vQ3rClKBihrDEUeqr
	 DI+2sy6qrCJ0FO4dvxgergU/mRgv0x88qLlwfyrA6tZjyJDSwiTsb04MuIJLm0UfIS7Ro
	 r5TrRMdMdIXX8vqaYuA5w7ryAI4saWAue2eICVyMSkkp3F1JR+ApLEImKvG8qzaqflS8i
	 suEiR5OZfcmkgaAMF6nNaKyXTNRsDiJ0xaVBvauO6YaEtqXgzjnkFV0Poh97QDQCv83Ec
	 34Q9saxTel+r/NyTh8sxlRsWlDowMvW7TUzdw2sKEylgpCEzcgJ7DANobcHodoXugeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UxyEoZuZ;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031E1606A8AF
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 06:56:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 031E1606A8AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UxyEoZuZ
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93f36c18b75so234203285a.1
        for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 22:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466583; x=1795071383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vTav8FAXb6nFTtunUSm9Oo3pbBRDYrw795godDfr3bA=;
        b=UxyEoZuZZPTpShq4yKIoeWQVufiwYeT6C69K4s4wsmxpWWb29QQTHCwJBZ4JcKQ3np
         qWq9MEbtxFWwBGbxG+GJ2lJj/UDk+yRg4L2Ud4rYX6V2knajD8KaJDkv4yLyr6s9C9wT
         IAr2K/VZiMY5a4NBQocjqklXKnCDk2L7c3RXsuAWVKvFUmU35gE6V0rrTNxuDgz+6neU
         qbOt3i6kBYDqRCRqz7f2/OwUHLZ/tqp/4xRbr7U0SZTtCKzfAua5rqGYO6kjSx0VMkvU
         o8CFYrkC5zqMEbNUnylldLJhDH4Msnh55xEQeIf4WS7DbZBAOPEoyG9DU0+Ye6VwzbrZ
         UxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466583; x=1795071383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vTav8FAXb6nFTtunUSm9Oo3pbBRDYrw795godDfr3bA=;
        b=lm9XvV2EpHMjLl4cw4m2jiJD2u5fnWxciH4uO06033dmrrdDpHd/yuJpmqgBVlwLf0
         Rey3ubPbwpnfztNWa1SqX0hxiFO3w7SbuVkdKXxrR2sgm0YL4Cs/yaYEziol7tZI2wFx
         FVhAc2E9SX4JYt4zwIBBRXcAQCiD3Ku3AB8iDKxP3JEGxB/k2pKkbOfqaRKPB9YZlSTY
         MquMvw9YiKK9OZJaSKdwr2JI18JdlPLIFeM6Rzx1+kWyplNE+aWqock0eohiLSE4VHZv
         FzqgTPkz32i42ZnU33LnLoAYzITLWwnff6Uw/n/D2ytSPFrXFLwD49txCeCI4PxppKdT
         45Ow==
X-Forwarded-Encrypted: i=1; AL+hErF2ZBEe0WkX3SyFOaJbVVB0xBd2NEBYDHHJwX/d9O/Jv1eCo2KTICKozSkDuUgGb6k1DrvQvOEtMTM=@vger.kernel.org
X-Gm-Message-State: APuU4Z90RWg6II4tVqbtBFdFAcmS4J04sFRmbZadfGmNOZf8esE7EemX
	ihfnKBpcw2aQI0BWJ9fJ4ViEZ4ec+Hko47R9uSqDSupkJ/5znJCn+Yo=
X-Gm-Gg: AYBFou0iqqpfjOtr6MK79uT47+gxh4bpuAyiGJgPgk3uTjVo5ajSw93J7R4WY8t3iTq
	fUHLApgU0+ZQNzFSL2x9aGHp18Tt3tzYKsKI3m0nxw5fBmNT30ZEClCS3AxC0SiFPOOX494+zXe
	+xXwl/4MWbxLCIGe4PsQPQBbHNtAfeIQLWnqAgwed0TUsPW9pHmMax89mq+TAf3a+xKoPtMEFI6
	nMO9zwjN5KyZrpctXAHZzLoJka0hkCJY5TUOuAZq+R+o6e3gMZ39iESTKQHioDY8sW2IpgD375e
	NAdP12EKV2WMgbZLnlSrne64yD8TV3j2aBAqOUhxPOl5qdaXF0PHWTMHt+KF30myUTPD7y0gmiH
	WgdOf3KdBu9p03T4OOZNKI8yh9xbOs4JrJvJ3mqb8zjINWioW1h9ZGI3pp6byUpum7atfiSi8ca
	aA3/sgDiAIKDPs140afXJnn7SzHx6yT6I/qKMj0W9VpLfsoxFwA6rEJWJWFtPQRKxbmFSQLdVOc
	eq8dHvWBjYWsWquSkCcWjWCK2Cech6kmRVEnmU1ZsljSobWFZEK9CsmkauOFWbUrmiq3PB8hQAB
	ovxOFuldks/EtHWjpCIu2NkAyZ5cmEjHcAK6GjSeZvNR1kE6JhUtI3oUwvgwJy2/V3jKUNff9qN
	DQvONd3n908VZp+E0rRekFmb4jKGSjzwd2GqVDc3hXP9KR6/Y9edq4F6rffarNy9pVvtksX4Keb
	VHi5RtI6hZx/KgRA65GHsaeUHI/wS9U4Ow
X-Received: by 2002:a05:620a:28c9:b0:93b:eb9a:ca47 with SMTP id af79cd13be357-947affa6f31mr888523185a.31.1794466582945;
        Wed, 11 Nov 2026 22:56:22 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e784e77sm661246985a.20.2026.11.11.22.56.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:56:22 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: typec: stusb160x: disable the interrupt before tearing down
Date: Thu, 12 Nov 2026 01:56:20 -0500
Message-ID: <20261112065620.34269-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
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

The devm-managed IRQ remains active while stusb160x_remove() tears down
the partner, VBUS, role switch and Type-C port. An attach or detach event
can race with partner removal or access the port and role switch after
they are released.

Disable and synchronize the IRQ at the start of remove(), before any of
these resources are torn down.

Found by a static analysis tool under development.
Not tested on hardware.

Fixes: da0cb6310094 ("usb: typec: add support for STUSB160x Type-C controller family")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---

 drivers/usb/typec/stusb160x.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/typec/stusb160x.c b/drivers/usb/typec/stusb160x.c
index a2ec0565bd85..ec2f4d7f7ed3 100644
--- a/drivers/usb/typec/stusb160x.c
+++ b/drivers/usb/typec/stusb160x.c
@@ -801,6 +801,9 @@ static void stusb160x_remove(struct i2c_client *client)
 {
 	struct stusb160x *chip = i2c_get_clientdata(client);
 
+	if (client->irq)
+		disable_irq(client->irq);
+
 	if (chip->partner) {
 		typec_unregister_partner(chip->partner);
 		chip->partner = NULL;

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.43.0

