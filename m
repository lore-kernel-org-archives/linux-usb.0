Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CC3388360
	for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2026 14:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783349602; cv=none; b=fF34pdL4pfDgUPEBDUzR25b7OtaHUbfo6PKBrUy5eYSGZrkprJT7XgQ3Sb6f1L3pF5cPLCvdpvFcGuTDVZ6YpNrSp7QF5iNyNfOnOz2VQwStsex0cYAff5K1PWTN0qv6hgOfgYnDLEHV0A1lpPdNrGJTDThr4sc5lYiOvE2nsn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783349602; c=relaxed/simple;
	bh=I7jiCCDGbaeKX4aqFPomBZzfK4RxHyb7e1Vpt7EJh6o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=a3vCMkPutiJNtWaHlI2CUfQvF2E1fbPUJZD/sjLO690rH+u+/RI53kFyzzeeuWdDkZolbsGTqehCKz5LovOoap/pV94SfGm5nwZRLd8AxXcbcrlZhAwTKHxZmum+IEb62b8naV10P/cehK/EB1ve7GDzsUTTmD/EjeOCLVwwVVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aIFkc6Kd; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aIFkc6Kd"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2caced6038eso33925925ad.0
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2026 07:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783349599; x=1783954399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xjunpqkgIb0eNkxRiAQe6rJNL+GYWOS6QsHJM94fNqk=;
        b=aIFkc6Kd081dLm0BQuIMvfxcTcvw19msqe1htsCGOtwbRPC3w/ujAbCIJPeg9ZR6/w
         1x+WEeFZYBe8kDft1BorZ4pPQZuqyzzDJL9WR3p6uKWsHEXlPuShNUCJajMowiACsHBI
         YscyhoViSGnq8Xm11pNdIZHkk+wxSWG9B3EIkxfUDmavsAQYVTQ1OfPipkRUUydh+772
         EbKziyfHoSU28GSHYP39yy4nIYMk2sUd51e+W4cA/TEu7ZQy2P8Y/chy/7W6L7k+cFrH
         bgddTnGNzF+OwKGbaDU5VizJNGv2PeJMkV0XtuAOCDwHx3cBQ8TCFmjxu/QIQ0eCyHPW
         6acw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783349599; x=1783954399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xjunpqkgIb0eNkxRiAQe6rJNL+GYWOS6QsHJM94fNqk=;
        b=PFUq+bVtXg1a+XaU9V803JTfiHPX7sTwtW55eW5DRdfaKUBYWX+rwn6TZc+x8FQF//
         zEmN22bE20sg0ne4EtPuf0hpB88XU270A/eZFs1rPKQuitpNPzlyKYLt0WOt3E+lR0QV
         ufYrhuEReO+ZPxBhPb/nV2m5wc8G854etO/7uZFANztA8a6OrdOnuPut2NH+xmrEPE2K
         1CeMOT0zeZ3c7LVW1r3J73H4YoSsU5szWBSSauqQ4bOP0H4flZMo4BIXV0FkC9iNeHXE
         4ByjpxNpCDB77Mu/yNVQ4P8H6Ke77b+tCbbzDYWcEbCH643nAxZk3553aX20J/hk9YqQ
         YRbw==
X-Gm-Message-State: AOJu0Ywt3bHWlcJ+YCJ1FI5fiFT3KYU4WOY8lqK8xRrOtTQG6/3Jaflv
	+gjPlHYyX3VQsbXWHuRSMRk2DaogasrZRojfJ68pg1g+vAeiXKdMinfyeRvJ
X-Gm-Gg: AfdE7cnOryTfhxJagUs5wjSGPqBSYpV2Cb6x+JtSpO+jMVxqrvXbb7xyVFQ6wYT1MF4
	tJRjT0Amcq7SCiPCZAHUmqhGSKzP6A4zgy27NP8UIWbF7jAzRQz2k+rTggYCoeibUb+Unl4Xv5w
	kt9zUI++rOg1e4mngYpNaYTQe24FUUT9n0AJxyQwbmLALFtcQsQKLvKG4YJqJGQnAO76zXbS+gg
	hIb9jL4hXbpmFsndJQE8DmEVuRLbHFRA6rPkHEeNN3DBMtdM5WrShTcKWKWVuNLvUft9ZTJXzu1
	5JIvWmFQVHQa+o7ycFMbQrb9Tzycq7d4/Os4HK3syk8dE5pDO3ziRpUaN6RN6G8ryFdJHucPQ/j
	DaHav4kLPwP/REBogYQP58bRA/4yg9n+OS5p8vwaL09PNghX1bE11GYxVqM6BqIcl584NS7xMQd
	OIDYDroXTq53WCCJGRG28Vrfl5hqdmjbRnvDJHm0MYf4bnoRGg3jTQIcNN+uKdTjnlUAZA2RsYh
	OCAXNZI25iCVYcm+Oqmj0DRyqh7u4TGX9Q/AVnl3UcseBwP6Q==
X-Received: by 2002:a17:902:e84d:b0:2ca:11ee:b007 with SMTP id d9443c01a7336-2ccbd7d2b45mr9877485ad.18.1783349598915;
        Mon, 06 Jul 2026 07:53:18 -0700 (PDT)
Received: from localhost.localdomain ([14.5.152.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7765810sm52217695ad.53.2026.07.06.07.53.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Jul 2026 07:53:18 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2] usb: typec: tcpci_rt1711h: unregister TCPCI port with devres
Date: Mon,  6 Jul 2026 23:53:12 +0900
Message-Id: <20260706145312.37260-1-mhun512@gmail.com>
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

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 302c570bf36e ("usb: typec: tcpci_rt1711h: avoid screaming irq causing boot hangs")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
v2:
- Add Cc: stable@vger.kernel.org.

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
