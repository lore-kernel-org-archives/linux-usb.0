Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430059;
	b=2EFIAwxw7TPhRZ6OxyjaV22A5ZhaLiwJ2us6qbdBQP//bI0L+P2nV2F1IZ5ESmgRGdn1
	 +KyuQZObXrJ8k7+y2xpgUUjZltfpRHUYywvHjXercfH8iuF0Qo4CHVoELVclQFMwjiaqJ
	 STSERIeo4d0qZjrA6RaozDNDuNkauJFR0w+RjdpgpsuRVoIE1TXPxYRUYE33T2SXsC5UB
	 SLpQGe4KauQgNSOe5wOhF7306wWqFMS5geFZ4sJ6FVZ/GVfwGKt8g7ykdLBbA534EsVk+
	 pp8iMdlx0y6YMqe1BFpb+7UYNVq5OnyFxYd32c5zE8aSd/2pQNcu7oAGEmbJNKU3oeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=rO0PLvuw6ce5QXFOrLKO42ZXm/30hY+KUJ+GebPFvXY=;
	b=iayhSH6dL1vYQXsmQfSNnkGSPWy8eFO3Btc6TBEQvUhYKRsqQYwQSNLSMOAc1gVdFGKx
	 EfcJNSvD5xJhV3ntEynLRontwktnvwloe0glYKHcxYMHW9lqVepiLuEb21J0FdLBkSKY2
	 gPc4DVner6j2ctSxlGbifS3vzX6wd3+Xrys3HRq4FTFT/BMkv0Tx/4F+5kCRrH7DwPJiB
	 Lq/aAtTNSPdp7XbOjOUjHghkpKQKBhVJT7FiWftvNrYjZcv0m/FdNtsDTXArLySbkTFhP
	 63YFg0QfEEsa5fz0HzT5rI0hiFoFb9XYtcw+sHy9BVFMjDhnwIN4BTqw1h0OSOKserQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=SJX+LAaz;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DEC606A31F
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:34:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57DEC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=SJX+LAaz
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so2435273f8f.0
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 02:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795430057; x=1796034857; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rO0PLvuw6ce5QXFOrLKO42ZXm/30hY+KUJ+GebPFvXY=;
        b=SJX+LAazpKFZy4znH6MNzecKcIgg+Rjmvh7Zp3XhlehrLDz2DmdfiXpsPG1qYiiUWx
         z8nE+LqP59RXRUSZ/4C/S/gwY9LaARwlwx5R+Y2JH9Mh8v2CIULk1hQzEg8Shr00VyB8
         HFUEVxUetx1SqELAwQODf0tj48wlRJYKlr2w3Dzm5eiVgDfyZwtR3PM4q9zxQhDlXvR8
         Gzi2p1uCsoGc5zYMVD9fEIggaDorkwCV8Efi0o9kRAA65VZ96YEaMV5cARd4KFuLgfng
         ix6Fxf9HH7NmYF4uXi1p05wYV8swOtnDReRM2cPyqZqZcd5YyKbfbXRSEFVJXwtkuvN6
         X3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430057; x=1796034857;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rO0PLvuw6ce5QXFOrLKO42ZXm/30hY+KUJ+GebPFvXY=;
        b=O0uXFJB7zYsteN+kRQ3ZZUvjhORdjyD5w7CfPxsrYSCnieIUeZRESW6dabw0svGi1V
         O5uNubIpVmD2vXInoslTa6xv3D7CSudgLXBxcnHVcvnx7a8LA9EFoCj6GAieacdSkEqn
         pyEk3CyqF4/yfPuI+Ud908DPCTvr5FVPXxoRAVMAFj97QKCXHeD6s5Ma9euJAcU8ktfA
         /0OqhPeGrvgsxNqnXUU7OAjk4GScEP5rX+bGHERhJ/JKaPVOkpI+x6BL0kseMpoU609/
         EVWYTp6CZYTWlXQFn8+g9O8mkkdCFncsw+p+VHn8J0UulClt5mowGE/Hx3bJSgCdpOX7
         Tqqg==
X-Forwarded-Encrypted: i=1; AL+hErEh8iZ53340fM1B3jFtsDoYKWU6fqqWsb/QQElytbAxM1UA95eeIftwU+1x/nailuEBOLum176yYBI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ldr7Bp/8AnasVkUUg+IH96s5UuuKz9EcYn3W3IuXD4zDKpo6c
	k2gIBMp4dIQUcVSaPYh3QUF6JFtb2YNTxtIPIFdyrpNQH0aivluPFObPokrVdA+JbD4=
X-Gm-Gg: AZFdTZfR93R3t9w8c7romKkyljyYbBwZJM1qXCHsDV6V2pepCFCFf37csQcyn/TM3v9
	/SY878kIXnaw1UDCT96Fa0RaTSmuHxJIFtIJp7USqkCSOYAgPRKitZng9lMuvFA3Z0+Hvhb2FJb
	n20ehHrAPXNqMILSPcWJG2DCUAKpJmLa32SIC09jXNQMU8ey0uu/Tsvtr2GP2wBOgJjcW4lgL4m
	ZcI0L531mXxQe+e3AIIDGnGgxMPXhdItwMUD7kfroPcvodl4F/x82/xPl9rQH5LngH+PhCbGQl8
	CKdcujrVoBSHtuyjhyVlV3AJXVgp5iI1jlTv1gv3aS7j9h1+b9MqOobJ3PetbuaqK79umKVhqJb
	/PacnBJE5w/MDIe4GbIIcql/IMiXWE+RQe/QFkIuk/gCo4Bt61hc2f6F/mZF0yY0h78folWgPXv
	irMuvde1f7vOyv2w1vFw5WygMJtOhb81oW9+93ONZeCL0I0+rPeyGlfYIE6Y3edP7ux03oQ82dI
	gx90hrUSTztvB66F7ZPoVirO3MfTNPuIm9vSZ17L+aBctPkKCEYcmKFQLZuZM4njQx8tX93XNrx
	pxmsnRqHDQn15Qvh6yooG0ywUQUIFxPJd3PIa3WdZsRqG40SRD+IituLkTLfrVJPIO5MojcPN/g
	nEGqSpD33Uw==
X-Received: by 2002:a05:6000:2085:b0:49b:f7e8:6f3d with SMTP id ffacd0b85a97d-4aa579a93b8mr26457325f8f.18.1795430056726;
        Mon, 23 Nov 2026 02:34:16 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm22256392f8f.31.2026.11.23.02.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:34:16 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 23 Nov 2026 14:34:10 +0400
Subject: [PATCH v2] usb: typec: fusb302: Keep interrupt flags across a
 failed register read
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
Message-Id: <20261123-fusb302-irq-read-error-v2-1-5539a09127d8@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0K6dgxTBIGV9zAs2jKVMQZwCkRDu
 LuAcenyJf+/N6tAwhRUGc1KaOLAXbuCPkTKNaa9EXC9stKxzhAxAz8Gm8QaWJ4gZGogkU4gN4k
 zKfmCrFPruRfy/NrF1+rLYbR3csNm2xYNh6GT916ecNv9Iud/kQkBweRpfUptgQXqi39w35McW
 xpUtSzLB5kZn0vQAAAA
X-Change-ID: 20261116-fusb302-irq-read-error-8a3ca5ef9ebc
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3912; i=alchark@flipper.net;
 h=from:subject:message-id; bh=roam5Grdtbk0Ss1UgX0o2hvhZvIfWOfQ3AePotlY4MU=;
 b=kA0DAAoWsqLYjxBZ1KUByyZiAGsEFqahmkf9hJIxmk3IIEJkrEtl4kjl+kmQLMrMCU+GCErAp
 oiRBAAWCgA5FiEEnfakPZUyDpq6SEj1sqLYjxBZ1KUFAmsEFqYbFIAAAAAABAAObWFudTIsMi41
 KzEuMTIsMywyAAoJELKi2I8QWdSlpLMA/3t2jSkrpALLo+BYCnplVjMN/lQzKQJbIYGsIAVRlXp
 GAQDl/9PRZPBbR3RzWc7ixzsAMjMQL1u+WWo5vm0KO+TxAw==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Reading INTERRUPT, INTERRUPTA or INTERRUPTB clears its flags in the chip,
so bailing out on an I2C error in a later read loses the flags already
read. On Flipper One, a NACK on INTERRUPTB just as a source raised VBUS
lost VBUSOK. The driver kept treating VBUS as off, so TCPM never attached
as a sink and left every Source_Capabilities unanswered.

Keep the flags pending until they are handled, and retry the reads a few
times, as such errors pass. Otherwise a flag left pending waits for the
next interrupt.

Fixes: c034a43e72dd ("staging: typec: Fairchild FUSB302 Type-c chip driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Changes in v2:
- Added stable
- Rebased onto current linux-next
- Link to v1: https://patch.msgid.link/20261117-fusb302-irq-read-error-v1-1-a85d45b91912@flipper.net
---
 drivers/usb/typec/tcpm/fusb302.c | 62 +++++++++++++++++++++++++++++++++-------
 1 file changed, 51 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 83bd287dadc7..9fb76fdd3b7b 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -100,6 +100,10 @@ struct fusb302_chip {
 	bool intr_togdone;
 	bool intr_bc_lvl;
 	bool intr_comp_chng;
+	/* interrupt flags read from the chip, but not handled yet */
+	u8 pending_interrupt;
+	u8 pending_interrupta;
+	u8 pending_interruptb;
 
 	/* port status */
 	bool vconn_on;
@@ -1499,6 +1503,43 @@ static irqreturn_t fusb302_irq_intn(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+/*
+ * Reading an interrupt register clears its flags in the chip, so keep them
+ * pending until handled: a bus error on a later read would otherwise lose
+ * them. Such errors pass, so retry a few times.
+ */
+static int fusb302_read_interrupts(struct fusb302_chip *chip, u8 *status0)
+{
+	int ret, tries;
+	u8 flags;
+
+	for (tries = 0; tries < 3; tries++) {
+		if (tries)
+			usleep_range(1000, 2000);
+
+		ret = fusb302_i2c_read(chip, FUSB_REG_INTERRUPT, &flags);
+		if (ret < 0)
+			continue;
+		chip->pending_interrupt |= flags;
+
+		ret = fusb302_i2c_read(chip, FUSB_REG_INTERRUPTA, &flags);
+		if (ret < 0)
+			continue;
+		chip->pending_interrupta |= flags;
+
+		ret = fusb302_i2c_read(chip, FUSB_REG_INTERRUPTB, &flags);
+		if (ret < 0)
+			continue;
+		chip->pending_interruptb |= flags;
+
+		ret = fusb302_i2c_read(chip, FUSB_REG_STATUS0, status0);
+		if (ret >= 0)
+			return 0;
+	}
+
+	return ret;
+}
+
 static void fusb302_irq_work(struct work_struct *work)
 {
 	struct fusb302_chip *chip = container_of(work, struct fusb302_chip,
@@ -1521,18 +1562,17 @@ static void fusb302_irq_work(struct work_struct *work)
 	intr_bc_lvl = chip->intr_bc_lvl;
 	intr_comp_chng = chip->intr_comp_chng;
 
-	ret = fusb302_i2c_read(chip, FUSB_REG_INTERRUPT, &interrupt);
-	if (ret < 0)
-		goto done;
-	ret = fusb302_i2c_read(chip, FUSB_REG_INTERRUPTA, &interrupta);
-	if (ret < 0)
-		goto done;
-	ret = fusb302_i2c_read(chip, FUSB_REG_INTERRUPTB, &interruptb);
-	if (ret < 0)
-		goto done;
-	ret = fusb302_i2c_read(chip, FUSB_REG_STATUS0, &status0);
-	if (ret < 0)
+	ret = fusb302_read_interrupts(chip, &status0);
+	if (ret < 0) {
+		fusb302_log(chip, "interrupts left pending, ret=%d", ret);
 		goto done;
+	}
+	interrupt = chip->pending_interrupt;
+	interrupta = chip->pending_interrupta;
+	interruptb = chip->pending_interruptb;
+	chip->pending_interrupt = 0;
+	chip->pending_interrupta = 0;
+	chip->pending_interruptb = 0;
 	fusb302_log(chip,
 		    "IRQ: 0x%02x, a: 0x%02x, b: 0x%02x, status0: 0x%02x",
 		    interrupt, interrupta, interruptb, status0);

---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261116-fusb302-irq-read-error-8a3ca5ef9ebc

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

