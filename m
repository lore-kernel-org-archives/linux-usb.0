Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438991;
	b=04LL2+5MXYNYgv2PG0FTW3LHKQQ1Ke4cTPccOsIaJ5ygM8uT/mWJWliYkcM1syePyE5I
	 WEHXnNFJPs0mGM9OFanyLetIjy8nqDRPeBI2iQ7fG7qlmVk0vRJXBOu1hNUOMIqZoyjNM
	 ShmuoNM+prPVGxLEwZN9u39TPlA8bpkf2FPNulh5X+mS47j4Zi95tGort+FvOvoevxVcY
	 h6CQpqdhKFtQ/E2DdkjkAEuXqJG2K4AxeHvLUpcx3kJST+2xb5NxvJkTxfxo+NYEzwOl+
	 wj3lXO9torSuk7R7wCsNH1xpVlSNlLbzf/Ukox3nh4Bmkori3q97zsV3/Z6jYqtUBRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=wg5SGmS6BijniY97uk+aTHYyvR1onjkeuDeP3BvWyrY=;
	b=lgbeCgW4uFI0h68tEm/KZ/Splk1HJ0mbU912XmW+iFK4NMyYOEZKBaRGKlftOtJvCqRn
	 uT8/xQh73RM5DJvQeqnwW3qD2hpFQx2SGP8fFTI+Y4G3FSjY08N0U0V+VSmTlBkMoX7PK
	 Ffu/lRb31kHrzR49R344bthqdw3/09oG4sJnRwnkMHEr+VZT1ekzgbgVBuI/x8RxgPMVM
	 U9GObt+bu+XD80Do5fkjaW5RxHu2aQ7J51ifr318wvLgrWogTdklxBDnjdUJhNi3dq5hx
	 OcWkpr6aFGk6qf990xEMYpLzrW8t+ldK5qbCKqKrtI53SqBxRFcRYXDJRg5xWzAKhhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VJ+PxWT7;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B818E606A330
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 13:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B818E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VJ+PxWT7
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so530900766b.3
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 05:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795438989; x=1796043789; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wg5SGmS6BijniY97uk+aTHYyvR1onjkeuDeP3BvWyrY=;
        b=VJ+PxWT73Yx+B8kg4YgXTs585xLPZlmPfsB4UYBcGzHTz06Aygo6qxG5pgZKPeFLFq
         SCZQV4rKhMpEOKfEbvxJEEbMd6N500skwzYs/1PrtAnMaU9g2Lz3t9jo863eW8nN4stW
         BOkgF+Tfr0Bi84OJq38Q8T7lbcIaPVB6+xz8CoxBwvXdoD+4b+UYjAT8sA0By8Nt6TxW
         0l0k7o5o1tDFV+1KUEdaCa1etgJxZCjAPWoGwCzPVG0UsowDITJ1Bkj2sR4EOn8rmLaD
         Dofzc2GUF4BX/hxcLP8Jqp1CIFAtXJdLHWrAds6k0BULxkAiJHaTv+uGGDpTm6YHNZIi
         kbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795438989; x=1796043789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wg5SGmS6BijniY97uk+aTHYyvR1onjkeuDeP3BvWyrY=;
        b=Ykfvk0L3731KQ3nLI4fnbcFlVM7xqPOIff90iDVYh2Fvy8KExoSyqO0SoQh6fG29rs
         13kxLdNO5uj3wPQfKdReACypyvPRkydK08nPxouSUE83s3ywJZxu76VsP5rmbWVxXmon
         pkaWllRpz2fO2DJ1921s5+E/6VLY4MyfYmxrWiywxIuuPF+jxzHEkOln4NeVS0h6/hCG
         Sd7V7FucNvPGx7zdGWdBWnFweSErTr/5n6qK7OI0tO/ttjS8OQ+DS6r98FZwymDX8mQ4
         Q7BJB5BhkxvgIrP67rGCmLJyc/2DqkFbqsMpOvqzbMsnyFESGMLUju4IWiAZVBYnW4WI
         Vm8A==
X-Forwarded-Encrypted: i=1; AL+hErEkYs/qebtHj/utT7VUZQDbtRBsjXqRdGsTddvKAEfgv1bYCymnq5s3XDOeq9mLGcIY7upqxDBumWU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fVxC3uEW5OvYOmZG7LcyaZT13rmt7Kin2xgQZqBQaxAryh32M
	lqBJ1+E0KZFA9jpGgQm2VaD4Kkkc8fewZhF7r9+isfECdd8v2sdl8nva9bSXSffYh/w=
X-Gm-Gg: AZFdTZfpX3FaReGTbBfHwxfGZwaqI2OrleH3EErtx+1kFlqX18rH1HglQffv3s4EKdx
	mGl1yaePbnzpRpM/1+X91z7rSVMm1fKY6cLQJsBm+e/njafckqtIYaCnm0/Y16udGxjEhqAKh3X
	M3cNunXoexeqKKlsLf4DrqF5tcR0qRA6nQEFbNp2rbWr9vs3wcJcag8k2iulTL76SA0oZq4pB4U
	0Hes+ftIKTCINFlQ+zPsCHRueYtfiO6Vr+nnOiZhMCfJ/ZFdBoEewCpZgYFRA7Ib11qh4G53LK5
	SCRh39QUhq4yopbyZulYO/yVTkga7uqathnuGHE9byrZdx1IPwAbQGebUO/q3Sy+F7yXvmOFWWh
	1b4WprRCxZqzxPmqg7obHTSV/dhIUzhRMh1m+IW84xM4fDvaS+AF3mSNEs5f7eKsf2X8ONT2UUG
	FXzVl5+vumC+HOtc+hsP+s3JTWcWgQQmcFVbUK9aLflG9vRa7lLNESafQ/k7Lvpw1dMB03QJ3aW
	wvq7pN4S2FRhdQWviAUM/WQ+tkoHVcTRDpkkVnIYqp+EpMjih5kVWa2DjzsILQ369HTbYPtOKLJ
	9lcK6VVCUZ0GQyaR94wc9G/PYp6LWxmjnezjTNUQG8Wc5VUFn9Z9VsL5mFIlb/gZQDZ3ygM6DAK
	klbBggPszWK2ZUE0CAA==
X-Received: by 2002:a17:907:a88f:b0:c46:d493:501a with SMTP id a640c23a62f3a-c513a8410d9mr998124466b.22.1795438988978;
        Mon, 23 Nov 2026 05:03:08 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afe85ecsm401379466b.70.2026.11.23.05.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:03:08 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 23 Nov 2026 13:03:06 +0000
Subject: [PATCH 1/2] usb: typec: tcpm/tcpci_maxim: fix invalid wait context
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
Message-Id: <20261123-max77759-wait-v1-1-6fa54a751bb7@linaro.org>
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
2.56.1.750.gf70dc682cf-goog

