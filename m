Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609032;
	b=5FSEa1w24/OiTw5mKLjFvVZ3/ONOteEkXO6FqPl65LyPZ7j1B+V5N9MuLc4qBiZa5yQA
	 /9cy40OUdjoGa7vHrIExzHeF6tp3NBPkSnDyb/ZaXjV+Xrnh9q9nGHZIM7OptIFmb0C2s
	 grwSOCRmgGLoJHNa4B2czsLUvowPovaWndLieostmFYli1xXUqb3JK4VhgCDZ6pw1MTh2
	 bgR3lFiiEjcMUOMNm5CG7HDAJkB4ToZal8TtY4QXHtSN62gJCqjl+zaALw1wMJPrINNVv
	 W2h2CbXq2aMKLGl2mkik3k21TXc3K80T38GA/AVoL44jTHGuwyk86Sq9k0DbxWD37Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gUBulya+f6ud4/UzPh4bijl+YYBXVX1Rb5gaE8nRFNM=;
	b=qLZzLMTl3lShn8mX0yP3FXgKZmxMZhg7prcDg8DAvmyhLlltmNYky7RO2MRkWsTSU8Q6
	 dZOGhPRmDPtR5Cn3Zsm7ItpABCSHSInnXDsy6ZQhpYRytfSj71sgn2QBmxH3hR22O8kL2
	 Tc8cps19Y/9LwOc5pDcZUb2g9mkkQJqDpCnuhSAZ6ujHa9sDmln7c3u5bYMfePOTEDQl4
	 aUczeCOQBWWbtKbneGx+QV6bzXWt0rA6gbm6lLLlSld5T/HPZwxPE2/apZhnaTb2BefKh
	 kHIE7pYucdEInJGBcwttRVwuvBrcZpgczkANVTjETD9cIrsTmxrZ6MKaTcaYRcorjPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=w7JozsPG;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA60F606A686
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 12:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA60F606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=w7JozsPG
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c5198302d38so255586266b.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 04:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795609030; x=1796213830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gUBulya+f6ud4/UzPh4bijl+YYBXVX1Rb5gaE8nRFNM=;
        b=w7JozsPGR2DXJciRPXQCReL90rexXHN0ex16BHaKMpYJt7GRBcSmkBD0yFWYJF78eq
         4AbEstAQICTIa7Hp3Bv/zzOO5R1rFe0dudCmgTF0/fjKNzc6ZD19rAcGScUPdlgmE5RA
         wN3Jc1ZxfPbXMk/Ry///1cHg1ls1DSLza9FjLbInb4xTVihltSaFX3/X/22JFX1Rd338
         LO4NBPkOv9pLChTDD/LVLWg35Ra1vo1QlsjJ/gzu1LS9g3q/rF/pZN4h/0n7L5wflJPL
         otURTm6LNNPDifMzZyauSwWk1eH6zmDmEfMOhj2jp4uB6WR198WdLySRGHkC9tHsqZmj
         0DmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609030; x=1796213830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gUBulya+f6ud4/UzPh4bijl+YYBXVX1Rb5gaE8nRFNM=;
        b=0/qN6nISJ4LOplLjNq5rczvgoy/i7NMV0bgeHgSaCZLix48b1AfmLIeOaHVl7Tgzz6
         7e7s+zZW1z0z6leUaALLcpXkFHuWh3aw0ilEqLpx/wGWP9r+HaovKRM9AKXkjcZM9wIn
         Vdt5sPUsU5LN6VNzaYCqJuoeJVAI54zzDiYd8QVtO/f0k8RuTxVaI9g9nEnQEBH3MRSx
         I54SaVb+L9HKoRo1uv/Q+/wJNWOvB4eqx1wjgU1xD6iM2yoosoYOXFDuJyCY3s+V2O5S
         dIplP9yMf3OHtEbCP9sIlXUCNbmSum9+8uoz4niUJMCTQxaqT4QwAzx3E2fDMRvzt4bw
         CdiA==
X-Forwarded-Encrypted: i=1; AL+hErHkD4nR1sjg+DupcaPyBJhnFYHgmZ3hDw87yJon70FuTqqVHqukXJq83jUZX+2WJrdMcGyav5MpGLQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Hru4QetiW+RHyAj6LA1detg4cZ4RhdbuZU4pwTF1bRuvfY2Jc
	F27CXbK831m9m6UYjR1l8Df8aCiqBStF+e1mIvT+L3/m6cOfPuJCcaJXRaH5sqBRstw=
X-Gm-Gg: AZFdTZdRN3pYFgHWSil5pz1xJ5KV4htFHZlaxIwZqVoA7p80I6XrUyDGkaBR9r2n5hD
	QPii4vDEyja8nr5C7QkxaRXy+97cj+6g3mUZ4vyKGeZZAwUtfuPkCVWtStv+/LJtTr+UTp5Nf9Y
	8NR+J39wx75q7w+KSI7lzXvWVCcc+bgtS/d18u30w4G37FPylXZlhN1AuWp3Vwcr/fhtrAsBxH4
	w7EAeWRvBmccgiCJvwyJXF0dLmX8uQyW0mmxOIc+gSrULXMwo0FPiAms8naxkRT+us8v3jdNk4c
	Pj1sRYUM/V3jJHo+ENwPJI1SmREy1OoZ5OB7ix2740SIHB3+Q0cvsJrhd8QdXEqfBf3XWtjF8qe
	mzQTutCZaldgOL38XyLfJBs7KKhARNYxsmG1Kw0TQT0rADqC0LD/5AvXlc6uHbF5KvjhcLjuQTy
	p/+A30gaVbZymXCdy/EAYaQDKuAMrUUjqcPGMB0kq1YBHjVkX6z9mIMqEbylTfjYhRWevWM92gt
	0fIeBR71uHWZZK+cBz2yXwKysM1DsyNTGTy0dn6mr6G+yKAw8rYMcNQzcZZQHDheqOJOf0hjQF2
	R5Vof/eCiIxBdRIoQ4hewp02WR5AiscA+622qZKIA+ttFTfAMcWWvWqoIY6Bc+a1Tjhil+OU2s5
	7kYHEIO1IgrI2s54GxA==
X-Received: by 2002:a17:906:3588:b0:c41:6de7:7dee with SMTP id a640c23a62f3a-c513a3ab1a7mr1070767966b.7.1795609030236;
        Wed, 25 Nov 2026 04:17:10 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad00d2asm650611966b.3.2026.11.25.04.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:17:09 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 25 Nov 2026 12:16:58 +0000
Subject: [PATCH v2 4/4] usb: typec: tcpm/tcpci_maxim: only complain about
 vbus when sourcing
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
Message-Id: <20261125-max77759-wait-v2-4-9914b985c00b@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3

get_vbus_regulator_handle() logs a spurious "Failed to get vbus
regulator handle" error during probe and stores the ERR_PTR in
chip->vbus_reg even when sourcing VBUS is not requested.

During tcpci_register_port(), tcpm_init_vbus() calls set_vbus(false,
false) before the PMIC charger providing the vbus regulator has probed
(the charger's power supply waits for the TCPM power supply), or on
sink-only boards without a vbus regulator. Sink-only operation does not
need the vbus regulator, and max_tcpci_set_vbus() already ignores
regulator lookup failures when source is false.

Leave chip->vbus_reg untouched when regulator_get_exclusive() fails,
return the error from get_vbus_regulator_handle() silently, and log an
error in max_tcpci_set_vbus() only when sourcing is requested.

Fixes: 0c8935642cb0 ("usb: typec: tcpm/tcpci_maxim: deprecate WAR for setting charger mode")
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/usb/typec/tcpm/tcpci_maxim_core.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
index 2e6a8906fb32..736d01694745 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
@@ -208,15 +208,16 @@ static void process_rx(struct max_tcpci_chip *chip, u16 status)
 
 static int get_vbus_regulator_handle(struct max_tcpci_chip *chip)
 {
-	if (IS_ERR_OR_NULL(chip->vbus_reg)) {
-		chip->vbus_reg = regulator_get_exclusive(chip->dev, "vbus");
-		if (IS_ERR_OR_NULL(chip->vbus_reg)) {
-			dev_err(chip->dev,
-				"Failed to get vbus regulator handle\n");
-			return -ENODEV;
-		}
-	}
+	struct regulator *reg;
+
+	if (chip->vbus_reg)
+		return 0;
 
+	reg = regulator_get_exclusive(chip->dev, "vbus");
+	if (IS_ERR(reg))
+		return PTR_ERR(reg);
+
+	chip->vbus_reg = reg;
 	return 0;
 }
 
@@ -224,7 +225,7 @@ static void max_tcpci_put_vbus_regulator(void *data)
 {
 	struct max_tcpci_chip *chip = data;
 
-	if (!IS_ERR_OR_NULL(chip->vbus_reg))
+	if (chip->vbus_reg)
 		regulator_put(chip->vbus_reg);
 }
 
@@ -244,7 +245,12 @@ static int max_tcpci_set_vbus(struct tcpci *tcpci, struct tcpci_data *tdata, boo
 		 * Regulator is not necessary for sink only applications. Return
 		 * success in cases where sink mode is being modified.
 		 */
-		return source ? ret : 1;
+		if (!source)
+			return 1;
+
+		dev_err(chip->dev, "Failed to get vbus regulator: %pe\n",
+			ERR_PTR(ret));
+		return ret;
 	}
 
 	if (source) {

-- 
2.56.1.831.g720f3f5937-goog

