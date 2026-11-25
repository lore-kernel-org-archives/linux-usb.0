Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609030;
	b=WbYQVVJhwxWNEV7BxBvg9iRpz9sFW/7ozXfzBXhvm2BfCwOi+EpRdmBR3NMBkqUU0hXu
	 qsNrfMs+Neg0ZI31IBiSAIYgthDZgu+eG9xKCMSO09lixeuYC3CPMtebv/iJkvSwaUkub
	 d+Z1XqQ9TpyTd097f8OSTDxeTd0pXj8/sn9webVouJeMG2mLFuZRwm9vnCTxQBq+5GOmO
	 IcYHJuy/U6VRNJb6ZdVlKqvRhq5YWenhYmxY+TdRW6FTL3ZmAodrmOWuGamkFW4/xC/Qz
	 SFodHlGOzDVHQowZ0z2I66SDNEoXvcQo+o6UE7T1ax3Hw7OqlvuJV9lCZy3hcg+waYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=w8tUVNHS/D38ZjyQ5CWDOY/UFQrlls5f0YWk/lFXuJA=;
	b=OYZp3s5LxSkkzWhUD3OnhFvtZNYghkfyqGwCyFFc8AUuBT9sjI+83JKfocXMlhkSZ3qJ
	 c5in1j3NV7tYpBmLgumdF7ZskRnDziKEPwTY6lmFImbCZY9sciYtEpSo2ACEAn/oqZWxM
	 rEtQDjuJIp7Hs7I0zMqcBMDZ/WJhZNaUPmu7OYezohwB8vXImLqoFHNoPhWk8SNW1mgKb
	 ++czsAiznt414xo751JOL3CClYW/gR4qeeSyF/UpzJGmXdEOzZTIYAumOpQKg9fb9OTg8
	 KAnIXh2ZwFaO2mV7qpevQapLDtUyOmFx1CjXYfLWnCT36O/9ibAa9vJgLoMgb4uBuHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=p7Hgccfg;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22859606A321
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 12:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22859606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=p7Hgccfg
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c5133831027so809561466b.2
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 04:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795609028; x=1796213828; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w8tUVNHS/D38ZjyQ5CWDOY/UFQrlls5f0YWk/lFXuJA=;
        b=p7HgccfgldId0EFsZVtky/Yn1tZ+TXful4b/uTLUd3Uirf9ev2SvdKPgZk5QhA0Lt2
         1qkohPw+/agFjbbWnIjR8WS+b4pwrBVFMLKrd6rFnoSVmqOWjMeRdeiZflR455d37vmA
         aS5Dos4/2jRxZn/T8LGuudGN5NyJ9xj5d4vFV5gk0bhYygcymgiFmtdET3W51r6650UX
         Ac8yo1SNPbHqdJbdJFsQfbY6ey2meedmWfjHbJT0FUl3wOwVuR1XP9tAgYOHvJJ53JTF
         slJe0WZt2mhG3ZsRHBi4/xOQCcCGBmDA/XH7SZSeS8/ufvEVbJwqEUepD6XpOzwSdLz8
         tZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609028; x=1796213828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w8tUVNHS/D38ZjyQ5CWDOY/UFQrlls5f0YWk/lFXuJA=;
        b=jk5bP02GqEM7sOfS6E1G+x7+zPI8vnpDk1b8fY5qAyfE1PKTV3knv3z1hL/nit7w0p
         6rwDOetOGQ94sDRDCN6mHb2C5xxcwMPY6JX7o3aATNkZeVKOI983h7SCqZqI/xoj2Loc
         QGYEnL3P9Ee9AbftkkKhXVqUNMsEElm8d2ZAwKlQehrSrD08fy7nyiwYlGz0Ztn74fq+
         7sRgrCnbomDEo082Rm75iWKuYtrot8mS+8AnQHD/WwINzNNkotxerRLbT4c/j4DjeEvq
         CUrFSny5XRIjUZCqhET+iH2VrXXc6NlFrychkNy/vEWcYCt/Vd3Gt3sC1CA38xvLulxK
         WcbA==
X-Forwarded-Encrypted: i=1; AL+hErG5fYs8zLPvmO1yhuhHlV1xvI/WlwlvR+cyLgcUuLZ00854W50jZax5yUhLYgXF+w4/HLmKd6loyxE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+kATfVuYQNsnIB7PFeflYJkYyxTImyKkLQHsHp6fg1KgXZpyN
	LyYC63AM3WRiryEJ/D+4VZUO3j+JV9wxNTt2Y+z/1f9et2a5NwuGf2SBpKbhPVaaUvY=
X-Gm-Gg: AZFdTZf8rX0G9pM8FOWnPMkAarmIcA1cUAoBOVSiO6HZ539m/jFH17VAGZQdhszLA+o
	coO5NJUEoaMQnCnwgCjYbxg08k006ZaNy2v+GNj34AFLe6XaJsOBDsTq9B8dJBLq3Pl9q88rSNH
	QD4ad8RmHlBBpsVVZ3/lgKA3kS7lpilU5WyJBCnRct7MiGRJwfP9ahUd5clmuttfxsSMMT62Hbf
	ZQ78ddpwTz7nwnqtWSimEj1zS8sE9Frrd2p/LbJN83Cfu/41K2F8lCx9bYQru/wMt5yhh1e2DL1
	/6dXTJ7UVyaYOIS4FWk+d09zJQl0DAHfs2NkOdP/gvUCuBt97p8rpTRW6VmXvRQZhd2NYHZXW+U
	edtDJ3DjMiL0h9BZ+HIl67EVDbI3PjhL3tx6w0Zjue0dWcEr8oqmChV0zDmxESe6TsblQm7Spa0
	cE0xqP+V9YqH1V85C9Fc6Z+jG0faXZgDM807OQGzJynI7lktK3GAGuJpUaRuuw52QLdMnrsWrMH
	StjIht5riVhqYHM9jPGGACKMxPHpKxSpL3sf9Xgwfdnea+CucOSvKcRX4fL9SB6gF0bD56Xe2xt
	omdXvJRJr54PBa2iOTKsRIUJwOO2gwf7ilV18C/vTfp4ezK43Vp7EuZWJ/WEInfvehh/TSC/2Tt
	9zcaPkhw+5vyNOLB9+w==
X-Received: by 2002:a17:906:3948:b0:c50:b0f1:abc9 with SMTP id a640c23a62f3a-c513a60eab9mr967680766b.18.1795609028530;
        Wed, 25 Nov 2026 04:17:08 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad00d2asm650611966b.3.2026.11.25.04.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:17:08 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 25 Nov 2026 12:16:55 +0000
Subject: [PATCH v2 1/4] usb: typec: tcpm/tcpci_maxim: fix invalid wait
 context
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
Message-Id: <20261125-max77759-wait-v2-1-9914b985c00b@linaro.org>
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

Lockdep reports the following with CONFIG_PROVE_RAW_LOCK_NESTING=y:

    [ BUG: Invalid wait context ]
    swapper/0/0 is trying to lock:
    (&dev->power.lock){-...}-{3:3}, at: pm_wakeup_dev_event+0x38/0x80
    other info that might help us debug this:
    context-{2:2}
    locks held by swapper/0/0: 0, on CPU#0
    Call trace:
     _raw_spin_lock_irqsave+0x60/0x98
     pm_wakeup_dev_event+0x38/0x80
     max_tcpci_isr+0x2c/0x58 [tcpci_maxim]
     __handle_irq_event_percpu+0xc4/0x4d8
     handle_irq_event+0x4c/0x100
     handle_level_irq+0xe8/0x188

max_tcpci_isr() calls pm_wakeup_event(), which acquires two spinlocks
(spinlock_t): dev->power.lock and the lock of the device's wakeup
source. On PREEMPT_RT, spinlock_t turns into a sleeping lock. Since the
interrupt is requested with IRQF_ONESHOT, max_tcpci_isr() is never
force-threaded and runs in hard irq context even on PREEMPT_RT. Taking
a sleeping lock in hard irq context is invalid, triggering the lockdep
report above.

Move pm_wakeup_event() to the interrupt thread max_tcpci_irq() instead.
Drop max_tcpci_isr() altogether, since its chip->port check is already
duplicated in max_tcpci_irq(), and request the interrupt without a
primary handler.

Note: Moving pm_wakeup_event() to the interrupt thread doesn't allow
the system to suspend before the event is reported:
suspend_device_irqs() uses synchronize_irq() to wait for the interrupt
thread to finish, and pm_wakeup_pending() is checked after
suspend_device_irqs() returns. Once suspend_device_irqs() has armed the
wake interrupt, the interrupt core reports the wakeup itself and
doesn't call the driver's handlers.

Fixes: 6f413b559f86 ("usb: typec: tcpci_maxim: Chip level TCPC driver")
Cc: stable@vger.kernel.org
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/usb/typec/tcpm/tcpci_maxim_core.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
index a19f52515429..6e202171f57a 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
@@ -411,6 +411,8 @@ static irqreturn_t max_tcpci_irq(int irq, void *dev_id)
 	irqreturn_t irq_return = IRQ_HANDLED;
 	int ret;
 
+	pm_wakeup_event(chip->dev, PD_ACTIVITY_TIMEOUT_MS);
+
 	if (!chip->port)
 		return IRQ_HANDLED;
 
@@ -430,18 +432,6 @@ static irqreturn_t max_tcpci_irq(int irq, void *dev_id)
 	return irq_return;
 }
 
-static irqreturn_t max_tcpci_isr(int irq, void *dev_id)
-{
-	struct max_tcpci_chip *chip = dev_id;
-
-	pm_wakeup_event(chip->dev, PD_ACTIVITY_TIMEOUT_MS);
-
-	if (!chip->port)
-		return IRQ_HANDLED;
-
-	return IRQ_WAKE_THREAD;
-}
-
 static int max_tcpci_start_toggling(struct tcpci *tcpci, struct tcpci_data *tdata,
 				    enum typec_cc_status cc)
 {
@@ -538,7 +528,7 @@ static int max_tcpci_probe(struct i2c_client *client)
 
 	chip->port = tcpci_get_tcpm_port(chip->tcpci);
 
-	ret = devm_request_threaded_irq(&client->dev, client->irq, max_tcpci_isr, max_tcpci_irq,
+	ret = devm_request_threaded_irq(&client->dev, client->irq, NULL, max_tcpci_irq,
 					(IRQF_TRIGGER_LOW | IRQF_ONESHOT), dev_name(chip->dev),
 					chip);
 	if (ret < 0)

-- 
2.56.1.831.g720f3f5937-goog

