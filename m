Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9FE2DC357
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 08:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786005816; cv=none; b=ZGy1Rpp52fG7BlG+LurP1z7PJRj0eVILfFUCdB3qBvXk7VA0lkexeXmPVnap1BkS/2/ySd+K4CD+OnFJKa7hr/YextNtd5JovSdX9DAwHa2b1NlpY4qQtQ8LtNe6+2+HsJ0WnPgLY1cG6BtjFu7os34Q/s1IjIL4jrRJkCdhK84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786005816; c=relaxed/simple;
	bh=zLDbB/z0jNY1KQx0PAqhrKoQdj9xgTqpN/euBEcNSgY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tEL8Y4zYcwFbJZzr7MBJ9FTaoulPrgeDYr+2+yGgs60jws07tlIN+RaJefATeitVz9C6zYdCI4O8kIfxq1chZZTtLy1vOf97OvT8u86HAseoy5fdRUblfPlfqblG/c6hkWyU1LwHwL0vWVPL/JpUI+gkUc5PYwxHvZAdMstTLQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=auCNXl6u; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="auCNXl6u"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c15dd4b9132so317185566b.1
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 01:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786005813; x=1786610613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xvIHh+SVLMeD0AyZvgczNbxGZqtewrJZ12uyN4ASCkM=;
        b=auCNXl6uwG4OTf4aLJlEW2uhKagBU0+bU92auP4qEitMbHIGgxJUy6lue10/H8tSZd
         yoSErl+xge0CZ6N82TN0Z64hXE845orBHurdDtXxf7Zp0PtKOX8Jo3Zp5XbWl3rx0zyE
         XuKKGnT7vedTGyTAiQJmI3cD46B1pDWqXVjNNTW5nzFUdZg+1UokNfWG8QRzqPXpMEiy
         l3yw68iq4cVlWFBUEAPkJ3OPJMLaTTIMKljCQK67fwTBOljYgJzcsMLVJm06SSdtY2rt
         tfyLPKPNnQJuxtXPW1vsfBvZGeQepgaGrXviBGnDhX/bBlPuJCF93qD5KNveVRx0pJEs
         4I8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786005813; x=1786610613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xvIHh+SVLMeD0AyZvgczNbxGZqtewrJZ12uyN4ASCkM=;
        b=neBwfabY0o6uA/yLV/hREvqqQXAypYRbn5mjLOf9W4P7TDga8AjnsdUVJr2p0B4Efs
         uqNiutjLkYRfxpmDqJ7CrpvPdMqC/STdejCT807qRUmLlGSAI/uj7+/6E5FLZAt1OYYG
         OcFevZ22zYMlzOmMZ8yqdM1NQxjfCQv9J1B7LC2FDSL/nlrRWm5ipdbTkxPiGqIXo5FW
         Wr79Aq+H9kVKtpsXwhjo8oby5HdMSt/iyM29myzqP9ICjLHAPjMW1jyA06xOXWi6UGMk
         Znp6Knsvo0hbu9zcX3BoYeDpjS9CGLlRgvrsG71xEV8V3EhxyccxZTFxp/Nxjuja8FPr
         WRhA==
X-Forwarded-Encrypted: i=1; AHgh+RpSSRC51RBmhYtxTKy1wGAJUzGU9n+5BjUEixUFOY8XHNDQK2JUJb8Ol/JV/366p5Zv7pfgoApMpps=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJihiEjwWLVHyaNnweiJ3e5SDNIzstKfLlrxx+a4mR/LtDf8If
	KJwSDc90uPfqiarOABYaPeG6N2AxC+4fAvoY8qj5x8L3JGDqHuV6RBCc
X-Gm-Gg: AR+sD11wRN3aAonjD/Jv23EV6ICmnW7V9AGgrKhcVuKDvDhVY1IN2sQC0a+rvFAx9qt
	o/2NqfaSuOLbYUIOYK+kQnaWEF3JIjY8wSpgjoe2sBNnfF6zcDqwC1H5WTEe9JN1HXZy0mc27Z/
	ps5vGkL9B3ZiwvVno1lWXMvx+LnEsDFUrwsXN7diwSqRSnxIp4TtsMPo6hZ310s7WMsX92sAJGt
	26fSNjIu4+ZJnutMQQZ7Hj9Ft+xxYT1DPR19E2CCoGaBkvodeVnkVvZNvrmoxshueGn90JQBX6t
	GtGgyhRjtZm6XAGnLUFmKMc+JgiaRF0HzjBsTl1bJvk0xQ02TS/3cMrZZISTkpZEw9oSe3EEk32
	NvpNm0FSEwUp8Ptvg+3oN3gyWULdS6yVjVl3Q1B+Sod/1X5ArVNb34pqCKrxTwvJf4zyPy34v6H
	R44yPPYEDb7QrApXhpzVhIzdm61ngtjS0jdlucHrT4jy5RSfFmnS6IKeFC5JngCUDDQleYnTuiX
	9XQUEMy83OdOIpWbE7a1ITtWe6KHdHldDoCDlgAn85/OGqn1f39Bqig7QzL4DUlns1WsyagOBLC
	xIWBa84jwlRwrBQgDzSvu8wP4GTU9BJirMj9EO2JQ7glkzVI7/yS+tERkIZ4ljRCihrb1oX9ouj
	BAbQLuKb5eIYuJXxIK3XHDcochTXRP1JFe95p2YXo2fISapiAOEGRM7qzkxyJHj/eNqVLfCp7ju
	u2R4IYKWG8ZMGm8ZWWGglagR5NSQJ/2dtsdcnYuqoEq84fD8j3nzRiN2Bm281v0jnGiYs2IJNjm
	lsNmZ64UY2g5za4
X-Received: by 2002:a17:906:ef06:b0:c16:101d:7afa with SMTP id a640c23a62f3a-c2039eef51emr582607566b.16.1786005812928;
        Thu, 06 Aug 2026 01:43:32 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-a.c.oa7bb030819b2a894-tp.internal (192.236.90.34.bc.googleusercontent.com. [34.90.236.192])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2036256097sm221220066b.23.2026.08.06.01.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 01:43:32 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+6c7e68b141ebd3a2cadf@syzkaller.appspotmail.com
Subject: [PATCH] usb: typec: stusb160x: add missing NULL check for i2c_get_match_data()
Date: Thu,  6 Aug 2026 08:43:01 +0000
Message-ID: <20260806084301.1340-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In stusb160x_probe(), the return value of i2c_get_match_data() is not
checked, causing a null pointer dereference later on if the device was
registered manually (without devicetree or ACPI).

Fix this by adding a NULL check for the return value of
i2c_get_match_data().

Reported-by: syzbot+6c7e68b141ebd3a2cadf@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=6c7e68b141ebd3a2cadf
Fixes: 823754697556 ("usb: typec: stusb160x: Make use of i2c_get_match_data()")
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/usb/typec/stusb160x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/stusb160x.c b/drivers/usb/typec/stusb160x.c
index 6d85b25b40bc..8f3435c669cd 100644
--- a/drivers/usb/typec/stusb160x.c
+++ b/drivers/usb/typec/stusb160x.c
@@ -645,6 +645,8 @@ static int stusb160x_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, chip);
 
 	regmap_config = i2c_get_match_data(client);
+	if (!regmap_config)
+		return -ENODEV;
 
 	chip->regmap = devm_regmap_init_i2c(client, regmap_config);
 	if (IS_ERR(chip->regmap)) {
-- 
2.47.3

