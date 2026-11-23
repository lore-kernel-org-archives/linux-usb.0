Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438992;
	b=NsdEZSbP/PeCz5cAKfq1b+km+tjJwpq+7YFVdyTI2xOQ5ZGbq+h+vJeN2dcHXWH8si9Z
	 fzrwcF40w9M8zIDK1rMC9A6/ZNYIbNhavujBZzH0YqxUV4ICCQhuHXH3DFtN0ZRauOn3l
	 x1m1ncT30FLxJmOyVQjdtlAGph7IcFoSnqX3IB6dBbLPaAulz2YwV5KlSA5/EoAz1HAzo
	 TRDYKR3dmo9RQBLhjhEkigWvc32s5ZFIUKpH2zOTtM7IDoHuWQ4/RhLzNAC8fHyZuIBLU
	 sbE2Z+XyeV2LRMnQDPAnjaNfhu+rn1MdaJgASR4YUBWWQ3D9nTqhWW+Fh7lnVgQuHTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=mDrXuY6jqpxWSzFXHtwGni325RaMm1gVLFRBB2Xcank=;
	b=myZ9hOZ0c9ljRugtJhW0A+A6NPheqSxkIrZqbHKMZ1o6yG6h8kBvDpo6gXpfe8LgELwr
	 3vy0yzysv1sGNyBKwu2ZvQUR8v++NN/x5BAuuCIeX5yvFRtOhB6Uz+hMctuoYA4GUZOsY
	 fNm4zusPxED1lFpnSMLQ/F3lWNWcLaRk2hbG+iACowDN6usNJQP0NJdR5JvnZjOZYCoKK
	 A+klbubw/tLYnAJrPtWgZmqB97D2xXoWFasTOrXIKZKh3qZiGUI8pzcCvWwvj696ghn3O
	 IfxVTnOjMiWxpWdIZ+sL6EPEXYQ9gG6YScwmin3M+M5tXTBunfOmoXHBiYEl06y9AZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="Ut/Dl8iF";
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158B1606A32A
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 13:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 158B1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Ut/Dl8iF
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c516a574bffso187310166b.3
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 05:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795438990; x=1796043790; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mDrXuY6jqpxWSzFXHtwGni325RaMm1gVLFRBB2Xcank=;
        b=Ut/Dl8iFLFDYyi6KA+M8g1eQVi5UmVpRDZM/alCboO32jfq7OUx56WDkOfKT/HhWnF
         tWoVJjnNTuPECYPXsh2Z4654mOf2Ku9FIOJCyBE7t7xFA7RYL0b71HsvGWCrxULvVwMe
         mFgLB6mfBicaRauVR34P7+0O54OstPnb4smIPWwCd8TE2+e4kFRKMleg+WNw8neAsrh8
         BbFCEjmXHHRAJ9u+EIXJF1wwD2RyQdWvw5MmCUMXsg+IN2zdw87T6buPwguI/7e3rAEu
         P/Z3MvdJC3OhrCpM23pkV8mGiLnp8i0bjzrOmZICQhc89bNwO45/Tgf3OiiAFimk68zb
         mMaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795438990; x=1796043790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mDrXuY6jqpxWSzFXHtwGni325RaMm1gVLFRBB2Xcank=;
        b=V2Cafc+e1fNjT9px5okUhTQrC2Wfa1WDCp/TbGTnSdhx/oRry0GRpBZFGoM/wjJsIi
         MM6T7j8hIfbef/hXpdHnzXishA/t46RhLpeRKIC6on0ZjgXOG9vAOrqvTVYL2Gfxnd5z
         eCm8dNBYvUNazGe6dhgXk1mJcn7lsbY8IVVwN2NYozni4cd7d+jYMy+owc8oAedX03k1
         t1E+1MdO7Z2e1m1C+e/nziHBaOnvEOtioXZQEY87awpgCk/ddeojMe8Yx7UiUJRBFzSN
         oO4gpnSPjH4LwBeHQmoOO6n1+4/zWz840EgANJtY3udJwaRLSiva5WTD+esLbFrp1u1q
         wEdQ==
X-Forwarded-Encrypted: i=1; AL+hErF4QLjUZ84mRgAAVXqxHl5sdRDHKArkuB2A2YDR3mi13bbhtdvWAKiLiHqKN6wGzY8vdh248LQ3dDY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eAgtMYCfjQMz0fdY896g+EX9AnBVVYdPIqKO/CnUCuAUquKhO
	FkfeW01w2DVVAoS0ym3zWvnCneR4oOiVoEMDcmaW1/6HAZk6mfjOl/7Og6iFN31mwXY=
X-Gm-Gg: AZFdTZdrUPKTTLkY+pg/Y8d0yxwU+bT1P/HtCO4goi5c5drACLannIFN1zQAjM6bbpx
	C5b0WcLppvbYS4MnG1P8SD973SfbUdfC/ji5g1dFlkiuIm9BactIHDh3i0TLM8Nt/SsPrcSN6xO
	I+CX+nBKhFXSJR8wwQxMbIIJwKu0oLGh1nrCvRLrkZaMNL/fqgHcZ48R+MZt2Ok1dVtz76u6VHk
	e26IeOUaZKEAO5dMRSGqdnO6GfNOdFu9zQj9WNdScXHTulv+3rgdUYw1BXnnZptcBkWYe1ux3fc
	U6ykpU7rhvgieBWq/nSJoh61qpPseSM+Jb1sOKgVeZWXL6CKiDxtIWWQb5lXZHfcUFrEgoAIySw
	CmKamAkOK6McafJ+Vxb19pcm7oAosGjspUk2iGO+4UhN1nAgFkiVPmwZCdrQEvBaZz5YPkHhW9u
	h7iXksZuzR09JFiha6+X1FGhHqKZy3P59uEpGPwqX6HsPve79nRVdwhRLiywkSDyT3H6VR4DNcu
	RFi1jg7t8admZt5nKXIKi93DX+TfS/82G6YIVmmwzrTD7YW7yQO/xWhIJdlkC+qjnCleN3dsNC1
	QEP92guI9lTWI0eKx2UjjNekw6uEvXqOC27Rn9yM5n8/23gbvqdN+VRiErR1p1GV0p6GZ9g9l6S
	2sNG8/DPcN3P+Wf4XMyp1eR+BTFguxC4PDde6uD4=
X-Received: by 2002:a17:907:948a:b0:c49:9383:a28 with SMTP id a640c23a62f3a-c513ab42e45mr946851266b.35.1795438990465;
        Mon, 23 Nov 2026 05:03:10 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afe85ecsm401379466b.70.2026.11.23.05.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:03:09 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 23 Nov 2026 13:03:07 +0000
Subject: [PATCH 2/2] usb: typec: tcpm/tcpci_maxim: init wakeup before irq
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
Message-Id: <20261123-max77759-wait-v1-2-6fa54a751bb7@linaro.org>
References: <20261123-max77759-wait-v1-0-6fa54a751bb7@linaro.org>
In-Reply-To: <20261123-max77759-wait-v1-0-6fa54a751bb7@linaro.org>
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

max_tcpci_probe() requests the TCPC interrupt before it initialises
the wakeup source of the device. Since the interrupt is level
triggered, an already asserted alert can trigger the interrupt handler
before devm_device_init_wakeup() is called. Its pm_wakeup_event() does
nothing while the device has no wakeup source, so the wakeup event of
such an early interrupt is not recorded, meaning the system is then not
prevented from suspending for PD_ACTIVITY_TIMEOUT_MS while handling
that alert.

When the driver unbinds, devres works in reverse order and in this case
removes the wakeup source before it frees the interrupt, which leaves a
similar window.

Call devm_device_init_wakeup() before devm_request_threaded_irq(), so
that the wakeup source exists for as long as the interrupt handler can
run.

Fixes: 6f413b559f86 ("usb: typec: tcpci_maxim: Chip level TCPC driver")
Cc: stable@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/usb/typec/tcpm/tcpci_maxim_core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
index 6e202171f57a..2bb306b6b1f9 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
@@ -528,16 +528,16 @@ static int max_tcpci_probe(struct i2c_client *client)
 
 	chip->port = tcpci_get_tcpm_port(chip->tcpci);
 
+	ret = devm_device_init_wakeup(chip->dev);
+	if (ret)
+		return dev_err_probe(chip->dev, ret, "Failed to init wakeup\n");
+
 	ret = devm_request_threaded_irq(&client->dev, client->irq, NULL, max_tcpci_irq,
 					(IRQF_TRIGGER_LOW | IRQF_ONESHOT), dev_name(chip->dev),
 					chip);
 	if (ret < 0)
 		return ret;
 
-	ret = devm_device_init_wakeup(chip->dev);
-	if (ret)
-		return dev_err_probe(chip->dev, ret, "Failed to init wakeup\n");
-
 	return 0;
 }
 

-- 
2.56.1.750.gf70dc682cf-goog

