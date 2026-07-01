Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637304266AE
	for <linux-usb@vger.kernel.org>; Wed,  1 Jul 2026 12:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782907816; cv=none; b=B3lF/6xoR3qRE21jwLItPtSSuJ5VQQy6LPtFmmvJtvOu09ee7dHGeokK88LNSgu+YS3QZYStvyjVUVD6bIdXdPsn0naliXL6/kJ0+kbnOd9kLIc/it7x1HhUcPw+EUYJ+YAPCUYQHhc5EoHKZct+Is8IjrfNGA/Xfuvu2Xg8zhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782907816; c=relaxed/simple;
	bh=JsS/sI/idddKIWDlBwSZbRQeq5fDLcKEkGaqlcl0SbQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IMZe3SQ1hWVw8WpelVtePU9tcWAvYt61U+wGXwSzu/c2M4vweHVOafTdtHfjtEjesoNm4aIHg49wOfNFMk0kHOJs/rjFiI4Z+AG5IcTJGvbK7adDYAH3kFMjAv9WCq51337dWgixBFQmBax7qfFUUmIOQhAsnXc/9mYWfcBBAGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=le3QE2xX; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="le3QE2xX"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c9aea40d799so212600a12.0
        for <linux-usb@vger.kernel.org>; Wed, 01 Jul 2026 05:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782907814; x=1783512614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vdP4hNpxLNTNKgUm0LanFoYJtU1lJNPdovA+GASEeQ0=;
        b=le3QE2xXjS07ygXlk40CLSoPsAwB57gLRbzaSQInGLOcwtiaR+Wr7tGZAgtXkiouwc
         5RZFFFrioRKjebY6jL1T4B1KKtpbHHnmnGRqxQepUEwrXriCqgORAnXnnRPFBxjc6EUj
         TW3hYl45nLcx56mJRmJIGXw5iiRIdmueNKcnqb1z/MCYCYH9WBNz5pHCjk/QSP/F47Zi
         thTN6Jn9AW3vhN7VhL9bfQOq9HO+BIFw75nK8oN5R6zF4vq/N2MGFTbGk00XKP89YGjl
         2L1AWaYIMEe87ATZQVeBS+GxlRHNCFzSggrFpOpPduKmrhTbA16HJ3mJsTCv0VNbuQrB
         hpLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782907814; x=1783512614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vdP4hNpxLNTNKgUm0LanFoYJtU1lJNPdovA+GASEeQ0=;
        b=MjsEMkcJmsgWKas27Ovtbdu7QqX2aTANXeVr84sjNXNi3kf0+d36pH07lk2G2Rfg9+
         rs247fbf6OfumPLWqBMp4IfrGbb5aGuHrIbDyr0Y+/wjTiUGLBkIvUB00S9fYZ3m5gwC
         49LAiIzDcZD8IAW2aehdi9BEMnN3jE1hjesxEP+aECYNEoq3eUl60PHDC3hhJZG36F3H
         QZPj5H9WYjXWep+PUpFQNua7HucRS0kQOBs3krhcPmmzJ/oBxi5OR5wTPPpGKx6wed5G
         anfJgfS7wHLZ2cCKV60NNGPjaHotFZYIkz6FbwXFxA8HZWJITApErwP9KMGBBh6YKinv
         eKmg==
X-Gm-Message-State: AOJu0Yzz9vyGAGI/Dy+QbxBhu8zKOBvvY0vJH+a49HycRTKq7rFqYCru
	J9ivoSqmvHAZtaR5ePr+2y11RqpTssFAKurwmYbEvtPTFhBmP212jkI=
X-Gm-Gg: AfdE7claiyZoW8WHoMJKBamkRWr0rAsjWSiOQBIEKqZyzpjB7cQS5NbBkZlRX5/2uzx
	3i7mD8WVFOk5IBgRiV1HGIXSEbyTWSArR8E190alV2IEC6HE+ffQyAr/y/ISMutX+vmOC6TcW38
	E1wpOi0SesiEhYHmsML3LBk9E6bhFb1TtUXXUs36nsRdAwprZ/wArxqxqNVd4nfDVvuW5DJvqjp
	gYiVtRwuU2p/MVeAQEqb6trCOvqT5GQUiXpFsz0nULUKE1lax2/U4IknxX0gKLQTD+k8QVl8X2F
	qh0o3Sjq2gTAtdrsO05hPd9iiNNDfMjDBINNOxEVRQFB5I2vL5QTUTXpkGrX304E/Qp0Sjd5jZ9
	k8jbHu6fKv17KsOf9pbY2Wd0xzvZGBC4nXW6ETMmaTbDukR2HCzQoqiwDQ6OGYPCXEv10sijxY7
	E24eokNxVXUsOqIX7H9qfxwbcvlROT/6o+XZPpZM7Wrvbr+uOHm1DfAtWUpNPTQkTX4GTXJ2SR+
	jWEzMq/UtV3BvnIDVkfVMA9H8as0qZ3mlSBlbMxsCloi/qi3A==
X-Received: by 2002:a05:6a20:4310:b0:3bf:d354:1352 with SMTP id adf61e73a8af0-3bff4255de1mr522348637.32.1782907814452;
        Wed, 01 Jul 2026 05:10:14 -0700 (PDT)
Received: from localhost.localdomain ([14.5.152.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02ced41sm3846496b3a.36.2026.07.01.05.10.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 01 Jul 2026 05:10:13 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] usb: typec: tcpci_rt1711h: unregister TCPCI port with devres
Date: Wed,  1 Jul 2026 21:10:07 +0900
Message-Id: <20260701121007.92789-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rt1711h_probe() registers the TCPCI port before requesting the interrupt
and enabling alert interrupts. If either of those later steps fails, the
probe function returns without unregistering the TCPCI port. The explicit
unregister currently only happens from the remove callback.

Register a devres action immediately after tcpci_register_port() succeeds,
so tcpci_unregister_port() runs on later probe failures and on driver
detach. Drop the remove callback to avoid unregistering the same port
twice.

Fixes: 302c570bf36e ("usb: typec: tcpci_rt1711h: avoid screaming irq causing boot hangs")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/typec/tcpm/tcpci_rt1711h.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
index a8726da6fc71..20037ef130ca 100644
--- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
+++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
@@ -298,2 +298,4 @@
+static void rt1711h_unregister_tcpci_port(void *tcpci);
+
 static int rt1711h_probe(struct i2c_client *client)
 {
@@ -339,7 +341,11 @@ static int rt1711h_probe(struct i2c_client *client)
 	chip->tcpci = tcpci_register_port(chip->dev, &chip->data);
 	if (IS_ERR_OR_NULL(chip->tcpci))
 		return PTR_ERR(chip->tcpci);
+
+	ret = devm_add_action_or_reset(chip->dev, rt1711h_unregister_tcpci_port, chip->tcpci);
+	if (ret)
+		return ret;
 
 	ret = devm_request_threaded_irq(chip->dev, client->irq, NULL,
 					rt1711h_irq,
 					IRQF_ONESHOT | IRQF_TRIGGER_LOW,
@@ -357,11 +363,9 @@ static int rt1711h_probe(struct i2c_client *client)
 	return 0;
 }
 
-static void rt1711h_remove(struct i2c_client *client)
+static void rt1711h_unregister_tcpci_port(void *tcpci)
 {
-	struct rt1711h_chip *chip = i2c_get_clientdata(client);
-
-	tcpci_unregister_port(chip->tcpci);
+	tcpci_unregister_port(tcpci);
 }
 
 static const struct rt1711h_chip_info rt1711h = {
@@ -394,7 +396,6 @@ static struct i2c_driver rt1711h_i2c_driver = {
 		.of_match_table = rt1711h_of_match,
 	},
 	.probe = rt1711h_probe,
-	.remove = rt1711h_remove,
 	.id_table = rt1711h_id,
 };
 module_i2c_driver(rt1711h_i2c_driver);
-- 
2.47.1
