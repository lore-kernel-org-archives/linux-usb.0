Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795735323;
	b=4m9RMwf6A69NM8HvFXK1m7Bxo1uUPfu7VriaoJ1JsqCIzImnhWBo7bE4lvDkKUG8LK5b
	 vbENxoFPJNvq8Z9Qf7L2Fus+kD+kM3yGMM+s9g9Sg5SzUoNTH0dmZvRxSZnhRmySKi7Pf
	 mEbMMiVMKS3cQkdIVWscn/2ro+UuDfcpYr0PEXtHAgbm82GVpPqhFVYz/hufCP++p7weo
	 q5qaQkBYPUxf0+hRx3lQS6U9dpDtJIAS5ksUcTTk4BlK+85sCkqUcKcVVnu5Lk45pet63
	 TYP3gTTYnwjbsAx/5L+emjPIBWkQDZgJ+RvNxeOTJd7OUqqcRhbHKQ82SfHYh2hlfFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795735323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=VRFCVhEBeWupCKdiVBQf0NCTrClRnUwUIvgz9LCaq6s=;
	b=onKwZonK+KANlhxwggcmVpM4wDZyMc1Y7STPbq78y5VRkFgMV08lbohFXP5uIPai4u+/
	 6Ct7tyTR8L2A9shpJRe+2PzIMBT4wXKG1oYVowr1DG2a+r/2ZCu46rhbrZdtnGq/5+Ezb
	 3/YICCADlJfFhc3UUooJsvwqB6MWP5SgAha34gF4cI1eg9rzHzTDBFQkLEJCKfcaDmTqz
	 4DR40TJ4zczpD3tmtfeCA7zQjVfkc6AsRmxUmYvdqT8Y/kHzyIDXsm086t5GilAbFoijN
	 j3R3OP1yxhs4HGNHHlQGKmrPV1Q1mMifH195ib23qgVFXBH6Jz8axS6VCZ+HNWSa8hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ICdX8mJ5;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FE0606A31E
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 23:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19FE0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ICdX8mJ5
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f0621eec70so52295465ad.2
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 15:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795735321; x=1796340121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VRFCVhEBeWupCKdiVBQf0NCTrClRnUwUIvgz9LCaq6s=;
        b=ICdX8mJ5EIroNM+KUCs0BXqL1uwJmB7DSvo7xXRp6JHDj4bWI0YwLtq5J5lHKiT4iy
         2/Yo+uSFFpQLNSO9+Hj7LAXmT13astJ2no7xJaOarkrVOOc9RjuHPHIkDaBpcF2cSAlU
         06esrNorhwk1TzLZhqbmMCSvLn3hENp8y4u3nzEGOs8JGhpKps4Y6AYgX0FcjJMeKn92
         rNko1l4WlgkWwgwS7r0LXfExUHbVZjG6AjqJxWAhHZ4jontlB6fLgKvU4K9c7Uw7gRTo
         65YjrZkVyZ07BLPbzHxQ3MQccCiV9n2VmWW45znJuiXNj3SSQ7gO+ybf0F0jN0fAwRUC
         RihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795735321; x=1796340121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VRFCVhEBeWupCKdiVBQf0NCTrClRnUwUIvgz9LCaq6s=;
        b=GmPQjHUSBNpqmv3kozgCTkNbE4whmrDbOjoRAd4LWAPuWP8B9aJ5QrxHUOMHU1wBVe
         S2oeXmg6WOhs6mRtIAlfOszwSD5mqssmMCbRkw3Z1og1zeKyLHZpDIexmWfdb/aC5geD
         TPT+1+YM90SrXInNfGZ+4nE2brd24iqacnv8KpZgftM6ULqpxKGYYLc6ANns6sjPbDb9
         /TGa/O5iHNfrnf9n+s7qc1FTL+4u55c+2TPhXlA59kvg5SyxDvQpZYu6BxeH/gOCq/8b
         CqTBa1qI6qfzJawFbqBxXYpj8ehoAQliGoBletW7Bkreh6cALFwA1Or2+cjLQvtPCqWZ
         9zBg==
X-Gm-Message-State: APuU4Z/7kcZTIxjqslQSb8a8XtWSQo6rG3rSYJ2lXB/irtSg3HpQw8Ge
	0tRT0hgrCJ77TbZFkj8CrGntblda9esYnm7+QO/BT/NKWD6juxDd7Zxu
X-Gm-Gg: AZFdTZeqytw28gG49sb7suJtP3Kl+1K0FfqJvGnGKATyW327kNpkRgES2ACrksdc7zZ
	CjQ9tDCLa+QBszxAtykFBxRUqK1SRpL6a6+DxErDpzCQDF+G3uy3etLhpFYmBv1zQ9Phv/jJtHg
	WRy2tkfYgirLnk+Mgt/gMRR87xD7kDeXluqxoEzG3jE2isW9LQwGP3FNm3gUHzSsH7PdokGvD2o
	mmSqfFsZ5iQmI5XxYmKcPcpwW+86VL3B/SCWLFO+0PuMjyINIfrZOiBROXyvXwoCAFpyZPL3knC
	P5wRFJ9qAucAMmXMN1Nm2VLrhZi9tVjQa6PNQiwzlZAhYQ3jjc+h1UigBMU7RPmgUAnoaY0Ade5
	29pJm78NXG3n/vP16n/3wjU+eK6D/zcPhm/52IUa9/OWrPC0XqM7zB3H0GMZ6XdTLTyqxDYt1sF
	8QnSTYLjO4vPblOQFQSP3YsPBKrUM4202krL4xWGvcXwzG8Sq4wwQttulfxfVlBcSWaFtE9MGS1
	XMUalEAqGTI+uV6DVZWzdMcTaTUHuofUEQ4vkEBfyEdWVAsp1CpqZql91fVrLOQDvPwDOCaFO5R
	of8eCKo6cS8+8kl4qlXOgEjf7GeztEJHJnMep5WT/DJzRmN4fA==
X-Received: by 2002:a17:902:d4c2:b0:2f0:8799:415f with SMTP id d9443c01a7336-2f087995606mr168498785ad.44.1795735321417;
        Thu, 26 Nov 2026 15:22:01 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c42a6sm110365955ad.23.2026.11.26.15.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 15:22:01 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH] USB: serial: cypress_m8: remove trailing whitespace
Date: Thu, 26 Nov 2026 17:21:59 -0600
Message-ID: <20261126232159.68334-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Remove the trailing whitespace from the else statement in
cypress_dtr_rts().

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 drivers/usb/serial/cypress_m8.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/serial/cypress_m8.c b/drivers/usb/serial/cypress_m8.c
index 78fb1389b34c..36bf84df253e 100644
--- a/drivers/usb/serial/cypress_m8.c
+++ b/drivers/usb/serial/cypress_m8.c
@@ -631,7 +631,7 @@ static void cypress_dtr_rts(struct usb_serial_port *port, int on)
 	spin_lock_irq(&priv->lock);
 	if (on == 0)
 		priv->line_control = 0;
-	else 
+	else
 		priv->line_control = CONTROL_DTR | CONTROL_RTS;
 	priv->cmd_ctrl = 1;
 	spin_unlock_irq(&priv->lock);
-- 
2.56.1

