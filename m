Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776068;
	b=BgGXf90lnMz92MNIsUpuqbs6nmuGqohq/qrnUH0lPbxN6K3hvue/9WjCkoUIcM8VvGPG
	 /XqGovvqX4ZXjn757pD0lqStXXYZUoxDJ2CkD6/SOiogXkyiiMKST4U3x/0/O3ygumHxO
	 MgPJc4/NZRaeFyRUiV2LaoxrBirXltTcGj7k8DlkpG/jtOxMPE9Y4bn7kFu59uTOEHBiC
	 2ORYZTVklcMEfUDUk/ZlKx1ls2hR6Lw16PIHGacncrpCEduCg39Ez/7DPStcIXWa2cqMt
	 qt4zu0pJOYDzlwstzGR436K8ndrfTPtRsFB2hg7FcMcGTpjvdjTyWxN9RLdWWMkRudg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=v4a+pdVtUe1EJJdubOOaKfns4F8nxWcG7WQWMntGcGE=;
	b=TrkhA3iac9e7z1fnYO96IkKGGG6MMkLaz6utO5IBafr8TJtUZipZcsX4TRbad5CfqUB5
	 GeGcEvCN13rmR/7Cw1SasfvTWGEAfVVf96Bn5xYLBT9E9SUaH/v5cBP8PPCiqNuyubDIT
	 9CCfIT4ZWWUubfRYKXVOxCh2a2gqa5JS7crerxauWasqVyCw52d7yF8dw7jUKYSOSob02
	 HOQG1xW+17xhahW65IYou3J9gxJpbwlnTmMYBFde2jy/rVoSBcG9vKP+taGSXBX4jZ7pv
	 a4Pr4wyYaMoPsQ7LaFbc/bbwDv6L5FGfS5A9LRzEZHAiCX8y7hRzYuM35O0n7sPRgaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=1ipxtVqT;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59944606A6AA
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 10:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59944606A6AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=1ipxtVqT
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a357b1c649so4575198f8f.3
        for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 02:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795776066; x=1796380866; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v4a+pdVtUe1EJJdubOOaKfns4F8nxWcG7WQWMntGcGE=;
        b=1ipxtVqTLi8aXXC7ZvgcyaYiJaJogM1Ec9e6X4zxuekg+R90tVBVjEIIvJoEw0IqAG
         AWOlMD5sEKagJZbc+kEkAYv3m4ge17q4G0v2UUfioCE78dMp7pfVZqmBW8+lTVorx5po
         T4jrBEgXs/UhlaxDNkEz+VRj2EO9xfzthq3ecYxq01IAzc8OFj32lZnUpZIXWR9IVl/q
         u+/o9Pb7b8r3BY33Vn29eLZEypniihPkacBdGjYMNbgmqInk620W+wMxTkhysGB2t1t7
         R5AsHNhO1wr6ZjWs/ZjscWCj6urXUwiWVxW5aK0l1R++h8gvTxHSpfMmWmxSYFe5TwOz
         aMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776066; x=1796380866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v4a+pdVtUe1EJJdubOOaKfns4F8nxWcG7WQWMntGcGE=;
        b=r0OyVcTj+TbyhDrCLUYBxq3Eb/ygvXSOo6DLCx7P3Ge47qPtzw9E96+VdXsb4HlEf/
         ZT2XfORAVfj1nm7Up8a/+DO6dq+v1kPMCJNZiNB9A4cAAUNYmgDtt3krfOdt8F8wB75N
         bDOA6Ur0X3pNAa25nFIRMOTCkdgdRrLMUMDsfnZQslbr45/qh99kX6UiFxGmYoRNMu5f
         VKrXbQahsrgPAEeM38kES0Rb58coVq4+NFcD1SVxZrCf75WuYp44KtrX3+7OF3DNv9RC
         S9V/GGnFXfE4FDlXefsTEDxZuLKnBn2Um1DspYf6UgAbSJrO1kUi6ywqqmb7P9Yq+sWz
         7pVw==
X-Forwarded-Encrypted: i=1; AL+hErE9/7SISPmimgEwtNzeQPKC3aGMwrR8tXTSeFQjkSBUHJdCiiKbyL5sCLBf/Y7XrpWaSvhVrK/cEQo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mE7GBwubWn7MWbSJPoksjG6gqLh9Wd8uASKhzHxf3BuxRR9Yl
	LWBSfRLBBDwT2rrNavvSDauyWevn+x9QPBFmxUieeiorPmjz7voc1FTZ0ppTTd4+OLk=
X-Gm-Gg: AZFdTZfOruHYwqQPyOOWiWiKqxlJnhSsVssYzhV6g21oCwoQU4rgwZtQsdyhnJ9Xnxl
	Y+q50lZtz0tehk3KRRyuJ7M4SVlFx4kAlUSQPCIp2EotVM5R4Gdal1vEs+j0DoG2SXeK3z1oNRB
	hU3CtfJHWo83mld4PrtgyWTvsJ8QgNrewAo0uEK2mOFOef7CK1+C1QMw6Qpte9HoRK7OmGIsyqp
	HX+EQjH5uKd2hl1/CYKEQEHLLRhmSnn6KqvZuQFUxZbi2IY1fU/8cz8xX4YhvJo+4wvvKwhEzxH
	5bNRDF9USwiCC/YXzfWQIBMownFNWdKoocpROelWL9CiDjoTEAc7DE3o6QzPmq5chXjAeG2bawO
	4NLuE8vfIL9TEt2bzIyFcgZZbaTtHhjhdhFbK3b4qZEAYeSxQ59NR3pjUW1eK3ZceWVHiqhzMoH
	6Sy21I6rZ8GBvNhPsJD0FgB3kx8mtuUJ4+chhVOLIWYM6poXJOSwR4Vm3bxFGFIpgFrEc9Dk+tD
	zdU97UVkNO2c5K7v9DQm3ZrNkZT5ltsOWUIs5UmiVAxEPaDJOw/SRxxBfQuGAAXX4sa8Ycw2n0h
	ILKNMwZf4vD7J6pRckDU8Ui7AGl2AiINcW4VmZO9X1i/jpdHIOkyWOSt8ShEpPphQhxEmxfoT3j
	emj64+sIh
X-Received: by 2002:a05:6000:2503:b0:4b7:8178:f7ea with SMTP id ffacd0b85a97d-4b78178f825mr23002295f8f.51.1795776065640;
        Fri, 27 Nov 2026 02:41:05 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dcf9sm45597649f8f.32.2026.11.27.02.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:41:05 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 27 Nov 2026 14:40:49 +0400
Subject: [PATCH v2 4/6] usb: typec: fusb302: Handle interrupts in the IRQ
 thread
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-fusb302-getsourcecap-v2-4-6770eb1e7945@flipper.net>
References: <20261127-fusb302-getsourcecap-v2-0-6770eb1e7945@flipper.net>
In-Reply-To: <20261127-fusb302-getsourcecap-v2-0-6770eb1e7945@flipper.net>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Yueyao Zhu <yueyao@google.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6105; i=alchark@flipper.net;
 h=from:subject:message-id; bh=kTIPW2yAFNq3399UJRyEGQQJQ5Ot4JrKKJTWUyt7UvY=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRzxpkx56cU58Ux7cg9c23RskXlTEI34j6femrz6dZPM
 YU32XOmdExkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDV17QY/optnctQtbZrwu4yFWaX09O+Pet7YDUncWdBrF7xjRUPtC0Y/hkV3+u
 fOzd5nU1fvmIk6+6cb+HPeB6k5xhc/vwsa8c1cyYA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

The threaded IRQ handler only disables the IRQ and queues irq_work, which
then does all the handling. The extra hop costs a context switch, and
leaves the handling at normal priority behind whatever else shares the
system workqueue.

Handle the interrupt in the IRQ thread instead, as suggested in review of
the switch to a threaded handler [1]. IRQF_ONESHOT keeps the line masked
meanwhile. Before resume, the I2C adapter may still be suspended: disable
the IRQ then, and have resume handle it before enabling it again, so that
nothing handles it twice at once and it stays a wakeup source. Make
irq_lock a mutex for that, as disabling an IRQ behind an I2C GPIO
expander may sleep.

Verified both at runtime and across suspend on a Rockchip RK3576 board.

Link: https://lore.kernel.org/r/20260312120418.99U0NPWL@linutronix.de [1]
Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Suggested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/typec/tcpm/fusb302.c | 82 +++++++++++++++++++++-------------------
 1 file changed, 43 insertions(+), 39 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 5cf1b78e7669..aa0e4dbe31db 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -87,9 +87,13 @@ struct fusb302_chip {
 
 	struct regulator *vbus;
 
-	spinlock_t irq_lock;
-	struct work_struct irq_work;
+	/*
+	 * A mutex, as disabling an IRQ behind an I2C GPIO expander, which
+	 * fusb302_irq_intn() does under it, may sleep
+	 */
+	struct mutex irq_lock;
 	bool irq_suspended;
+	/* The IRQ came before resume, which handles it and enables it again */
 	bool irq_while_suspended;
 	struct gpio_desc *gpio_int_n;
 	int gpio_int_n_irq;
@@ -1943,24 +1947,6 @@ static int fusb302_pd_rx_start(struct fusb302_chip *chip)
 	return ret;
 }
 
-static irqreturn_t fusb302_irq_intn(int irq, void *dev_id)
-{
-	struct fusb302_chip *chip = dev_id;
-	unsigned long flags;
-
-	/* Disable our level triggered IRQ until our irq_work has cleared it */
-	disable_irq_nosync(chip->gpio_int_n_irq);
-
-	spin_lock_irqsave(&chip->irq_lock, flags);
-	if (chip->irq_suspended)
-		chip->irq_while_suspended = true;
-	else
-		schedule_work(&chip->irq_work);
-	spin_unlock_irqrestore(&chip->irq_lock, flags);
-
-	return IRQ_HANDLED;
-}
-
 /*
  * Reading an interrupt register clears its flags in the chip, so keep them
  * pending until handled: a bus error on a later read would otherwise lose
@@ -1998,10 +1984,8 @@ static int fusb302_read_interrupts(struct fusb302_chip *chip, u8 *status0)
 	return ret;
 }
 
-static void fusb302_irq_work(struct work_struct *work)
+static void fusb302_irq_handle(struct fusb302_chip *chip)
 {
-	struct fusb302_chip *chip = container_of(work, struct fusb302_chip,
-						 irq_work);
 	int ret = 0;
 	u8 interrupt;
 	u8 interrupta;
@@ -2128,7 +2112,26 @@ static void fusb302_irq_work(struct work_struct *work)
 	}
 done:
 	mutex_unlock(&chip->lock);
-	enable_irq(chip->gpio_int_n_irq);
+}
+
+static irqreturn_t fusb302_irq_intn(int irq, void *dev_id)
+{
+	struct fusb302_chip *chip = dev_id;
+
+	mutex_lock(&chip->irq_lock);
+	if (chip->irq_suspended) {
+		/* Only once, as resume enables it once */
+		if (!chip->irq_while_suspended)
+			disable_irq_nosync(chip->gpio_int_n_irq);
+		chip->irq_while_suspended = true;
+		mutex_unlock(&chip->irq_lock);
+		return IRQ_HANDLED;
+	}
+	mutex_unlock(&chip->irq_lock);
+
+	fusb302_irq_handle(chip);
+
+	return IRQ_HANDLED;
 }
 
 static int init_gpio(struct fusb302_chip *chip)
@@ -2226,8 +2229,7 @@ static int fusb302_probe(struct i2c_client *client)
 	if (!chip->wq)
 		return -ENOMEM;
 
-	spin_lock_init(&chip->irq_lock);
-	INIT_WORK(&chip->irq_work, fusb302_irq_work);
+	mutex_init(&chip->irq_lock);
 	INIT_DELAYED_WORK(&chip->bc_lvl_handler, fusb302_bc_lvl_handler_work);
 	INIT_DELAYED_WORK(&chip->rx_recheck, fusb302_pd_rx_recheck_work);
 	init_tcpc_dev(&chip->tcpc_dev);
@@ -2294,7 +2296,6 @@ static void fusb302_remove(struct i2c_client *client)
 
 	disable_irq_wake(chip->gpio_int_n_irq);
 	free_irq(chip->gpio_int_n_irq, chip);
-	cancel_work_sync(&chip->irq_work);
 	cancel_delayed_work_sync(&chip->bc_lvl_handler);
 	cancel_delayed_work_sync(&chip->rx_recheck);
 	tcpm_unregister_port(chip->tcpm_port);
@@ -2306,14 +2307,13 @@ static void fusb302_remove(struct i2c_client *client)
 static int fusb302_pm_suspend(struct device *dev)
 {
 	struct fusb302_chip *chip = dev->driver_data;
-	unsigned long flags;
 
-	spin_lock_irqsave(&chip->irq_lock, flags);
+	mutex_lock(&chip->irq_lock);
 	chip->irq_suspended = true;
-	spin_unlock_irqrestore(&chip->irq_lock, flags);
+	mutex_unlock(&chip->irq_lock);
 
-	/* Make sure any pending irq_work is finished before the bus suspends */
-	flush_work(&chip->irq_work);
+	/* Let an IRQ being handled finish before the bus suspends */
+	synchronize_irq(chip->gpio_int_n_irq);
 	/* No RX FIFO recheck may run until the bus is back either */
 	cancel_delayed_work_sync(&chip->rx_recheck);
 	return 0;
@@ -2322,15 +2322,19 @@ static int fusb302_pm_suspend(struct device *dev)
 static int fusb302_pm_resume(struct device *dev)
 {
 	struct fusb302_chip *chip = dev->driver_data;
-	unsigned long flags;
+	bool pending;
 
-	spin_lock_irqsave(&chip->irq_lock, flags);
-	if (chip->irq_while_suspended) {
-		schedule_work(&chip->irq_work);
-		chip->irq_while_suspended = false;
-	}
+	mutex_lock(&chip->irq_lock);
+	pending = chip->irq_while_suspended;
+	chip->irq_while_suspended = false;
 	chip->irq_suspended = false;
-	spin_unlock_irqrestore(&chip->irq_lock, flags);
+	mutex_unlock(&chip->irq_lock);
+
+	/* The IRQ stays disabled until then, so nothing else handles it */
+	if (pending) {
+		fusb302_irq_handle(chip);
+		enable_irq(chip->gpio_int_n_irq);
+	}
 
 	/* Look at the RX FIFO again, in case suspend cut a recheck short */
 	mutex_lock(&chip->lock);

-- 
2.56.0

