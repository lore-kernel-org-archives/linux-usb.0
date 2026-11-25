Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609031;
	b=jPk3cVq3cYFQ5wXHv/QLHH9jpTM1Q1bb+nvw+z0BKA5xdWr8x4qcH5E7eNBaxx4ZsQc0
	 uQA/TyaS0V5rSvyOfzGcUX48/N7bTv6WZYh/pWAaZQfIXhjd+6ALJ4/CYnYawQglxxaWI
	 HDIHogNYa4LWM1ywUxmQD7UUblHKGOzSlGsmaQcDK3Vr+AqZWbSq8og6vk5H+ThnrJkCi
	 lEyh6cF3ck1vV/x6AG6h1e7UHYQSleBCiLlWG69H7LWfKDBxyDsPkEXeeqeLziTwg/85T
	 vgOE06RTCdDjKgSnobOJ5hEjq/dKFp4JUTUfImLAkAV0N71aeCRTFdpJbBXK2fth9Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609031;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ANnF4gP22dTclfpg2OY2BM2KOhGsixC07z+vMijIrP0=;
	b=MFsW+0niLAATKTU7gDFo/67MLfObSbcdBGJroerxDj9IwjBh+M9a2WxeZ+sIRfbQALYr
	 g79fleZ33NVFvEBdNb1xan8sO0t1+JRd+VbGEJiulY5gidbx+Yf3Il5oINif1byD6QDfn
	 2o2eD/2Oak5hjMRiXgwRXpHjm7WCRt1XvY8OLl2aYgi4ay9Zg8EtkuFT/REMTr8022s3q
	 2KQb92mucGA4sPhCxiNYUZxLWE7Omh5+Ru6TtKI1z7LxXIPfVQSDSYS1pfZDe5pxlePUT
	 K0GvBR+32E+4NtLykghJUlYqCdLfTQBP5b86TYSzx5ulVBhmJxPyae1bO3COwYQRxUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DUnj++9s;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9E7606A31E
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 12:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E9E7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DUnj++9s
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so1051155966b.2
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 04:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795609030; x=1796213830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ANnF4gP22dTclfpg2OY2BM2KOhGsixC07z+vMijIrP0=;
        b=DUnj++9s5XG2hscZEnhIQe5wBPFC/lhit/pJtQMaaR/NbGITGGbmFb/JlVpMcv2cyi
         /NFfzBXdGbCpLZViRyxBo/NzYka8FVYon4Jptzfr6l8nZcci6ZJKnoTzu6sMEM+goBhV
         cYWkO1+jNiKkTjjYNYa59a553sAn+4Gwdz8QxzcHRmMU5Bqz1P7NrH8thmndrOu+drhL
         MG0ByFDLBgmRYXMixOnWj9KyopQJdW+DH9axs+P64O3pFR4yYKxUf6PgHa1dhxqSyPXn
         T+qGnKeNFiLh3J6ucdD5d/xEATG1CsMCZItSIES6cpBzgoZ5SksqnVEag4vksPFd+kSe
         CDHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609030; x=1796213830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ANnF4gP22dTclfpg2OY2BM2KOhGsixC07z+vMijIrP0=;
        b=bDUtICyPV+qaIxoOZVNqD+CzGvMv2+g2Ysunz3CULte84C4QBmMlf9kuUzFsiXlEUO
         Kn7y3306uZTQB7UM0i8iePOEjSUMfW9Ow0SuJJNHCz2JL4CFqo7V8M60JCXRVtsGmlqM
         QYa8erw3ZvN5qrNTMMz9bjXlcA0FREnyONSfO/sLmklN31h9yEwiN7qByC3L+rVfv1CR
         7ik21s466Mf4tbDYkk52rTat0EQ7pwr1UIM37oZv7dIzm9TXSLrFCLTo/BOTW9lDasST
         9juoaya+DtpPowESJfsmdQuX6j6RuvVsqddGyuuj37AIt/5kzOFQpertrWibloM+UB1X
         xTwA==
X-Forwarded-Encrypted: i=1; AL+hErF7kKdrcOeMNj2MXb9wNjxZyRumr7GaRjmIJCc+hsbKiS8WlxXEc3+zwNeibGEqoFilTBHTAguZ1J4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ILTELdSzxYKOqesSycXF4WmLVt+t16tdpVac3DE4XCIAxJYmB
	/F6IaJSYhpxFOPwsTC8GV9EoBFh1RkX1ueRpTBMax7pqzrw59xXW4e/Zh9HoqJGx/f8=
X-Gm-Gg: AZFdTZc6Y6iGa78c9IZEOCk8s0/YS3y8I+HGf90xvbTIKK62tusA08yyfudh6ZQg12i
	Cxlg+oRcy6ziSafFjzqHI6UGNPIRPM+N9mt1hjsnECRdq6n6e/KmJAqkR3sr4x9KJgKo6PzFf1y
	WpsRvroMS8RIgG0rnG2225mA3VbCRDLKinZjuQMnDlh2eEYxQ86jq1Rdcpz1stZF+f/BuWUod6c
	FyWgfYv2ns4hjI/R23BBs/DQeNUTO5Ak6pT5QT7dQaAaU/0hLlBxmpPJyZcRC8dTYk16ybb6zCN
	dxxgdqBHsMXSJxHmBt/b2ssBh/kj1aukWJx6HF8ahlid1uTg5CMTvfU0v8zLOVZ2U9e0nCi7gjz
	vM3vEOgmqeQF/P4P7Asr3Vmzr1CYG++JwlrYPTssc9s6/xvA3LC2LGfwaVwo51Hn1uulA0FxxEl
	GJ+Oc9Sa+961yj8I2CUro82rV2n74TKFvug8aygC20U8Zhjwp5QSBwBrDC/N7j6wsfN2Efmovyo
	WvfJeHhbwHB6PwvMV7xFZv6LU2MiYDf2JsPn9H+DWfCYjXllh6kIUhNWlz5gvPBXUuLCIBtLghp
	xOmjdAeEzx7ev1WAjpuygQEXET0Az7/KW4UCDbeJxBY91eVB3aNHolGkXlSZ5FQkJDrKQldEtyZ
	MrHGP3XFqj5y/yo6lPg==
X-Received: by 2002:a17:906:f8cf:b0:c50:bf14:8ec1 with SMTP id a640c23a62f3a-c513ab4d93emr1021800466b.33.1795609029664;
        Wed, 25 Nov 2026 04:17:09 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad00d2asm650611966b.3.2026.11.25.04.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:17:09 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 25 Nov 2026 12:16:57 +0000
Subject: [PATCH v2 3/4] usb: typec: tcpm/tcpci_maxim: fix vbus regulator
 UAF on unbind
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261125-max77759-wait-v2-3-9914b985c00b@linaro.org>
References: <20261125-max77759-wait-v2-0-9914b985c00b@linaro.org>
In-Reply-To: <20261125-max77759-wait-v2-0-9914b985c00b@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Badhri Jagan Sridharan <badhri@google.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 Amit Sunil Dhamne <amitsd@google.com>, kernel-team@android.com, 
 linux-usb@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3

Unbinding the tcpci_maxim driver triggers a use-after-free in
regulator_disable() if the driver has acquired the vbus regulator:

    Unable to handle kernel paging request at virtual address
    006b6b6b6b6b6bb7
    pc : regulator_lock_recursive+0x20/0x218
    lr : regulator_lock_dependent+0x198/0x2c0
    Call trace:
     regulator_lock_recursive+0x20/0x218 (P)
     regulator_lock_dependent+0x198/0x2c0
     regulator_disable+0x4c/0x100
     max_tcpci_set_vbus+0x70/0x108 [tcpci_maxim]
     tcpci_set_vbus+0x44/0x100 [tcpci]
     tcpm_reset_port+0x13c/0x288 [tcpm]
     tcpm_unregister_port+0x70/0x120 [tcpm]
     tcpci_unregister_port+0x24/0x68 [tcpci]
     max_tcpci_unregister_tcpci_port+0x18/0x30 [tcpci_maxim]
     devm_action_release+0x1c/0x30

max_tcpci_set_vbus() obtains chip->vbus_reg lazily via
devm_regulator_get_exclusive(). When the regulator is acquired after
max_tcpci_probe() has queued max_tcpci_unregister_tcpci_port() with
devm_add_action_or_reset(), devres releases resources in reverse order
and frees the regulator handle before max_tcpci_unregister_tcpci_port()
unregisters the port and max_tcpci_set_vbus() accesses chip->vbus_reg.

Switch to regulator_get_exclusive() and register a devres cleanup action
for regulator_put() before tcpci_register_port(), so the port is
unregistered and tcpm_reset_port() disables VBUS before the regulator
handle is released.

Fixes: 0c8935642cb0 ("usb: typec: tcpm/tcpci_maxim: deprecate WAR for setting charger mode")
Cc: stable@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/usb/typec/tcpm/tcpci_maxim_core.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
index 2bb306b6b1f9..2e6a8906fb32 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
@@ -209,8 +209,7 @@ static void process_rx(struct max_tcpci_chip *chip, u16 status)
 static int get_vbus_regulator_handle(struct max_tcpci_chip *chip)
 {
 	if (IS_ERR_OR_NULL(chip->vbus_reg)) {
-		chip->vbus_reg = devm_regulator_get_exclusive(chip->dev,
-							      "vbus");
+		chip->vbus_reg = regulator_get_exclusive(chip->dev, "vbus");
 		if (IS_ERR_OR_NULL(chip->vbus_reg)) {
 			dev_err(chip->dev,
 				"Failed to get vbus regulator handle\n");
@@ -221,6 +220,14 @@ static int get_vbus_regulator_handle(struct max_tcpci_chip *chip)
 	return 0;
 }
 
+static void max_tcpci_put_vbus_regulator(void *data)
+{
+	struct max_tcpci_chip *chip = data;
+
+	if (!IS_ERR_OR_NULL(chip->vbus_reg))
+		regulator_put(chip->vbus_reg);
+}
+
 static int max_tcpci_set_vbus(struct tcpci *tcpci, struct tcpci_data *tdata, bool source, bool sink)
 {
 	struct max_tcpci_chip *chip = tdata_to_max_tcpci(tdata);
@@ -514,6 +521,11 @@ static int max_tcpci_probe(struct i2c_client *client)
 	chip->data.cable_comm_capable = true;
 	chip->data.attempt_vconn_swap_discovery = max_tcpci_attempt_vconn_swap_discovery;
 
+	ret = devm_add_action_or_reset(&client->dev,
+				       max_tcpci_put_vbus_regulator, chip);
+	if (ret)
+		return ret;
+
 	max_tcpci_init_regs(chip);
 	chip->tcpci = tcpci_register_port(chip->dev, &chip->data);
 	if (IS_ERR(chip->tcpci))

-- 
2.56.1.831.g720f3f5937-goog

