Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604666;
	b=SbevyIgP+Dv0eZZeCkgmdBJKGnNzyjUrdLmh408Cuj/qOGMtcrrkePl+x1z0VryXhw4W
	 qIs171VYrxQwhYki/bCf9E1J34giGGcARR1ST/RQo1fUGsvmWjAo92yWfXsKJgjq9NOnN
	 5QKb+PyIE7frvK8k883dgPl+c7FP4Y/lX/QR6H4ZGXtj8qDM5bZErBjeW1hFHuZDs8dQL
	 7d05ia6P3QssQRpAVrge1Qe/o6j2hQRYHcowo7Bb09ezOy98a5Rrsj3E7p7pINk7XYSl8
	 +OR1j6UVA9Xio2FURZ5bqqoQtPrLc4kO/keMqT7aW/J0YLTwfBPAuT7H4QjT9nZGG5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Zp2LzpohEOD48++2oGdRAJVm2T9583KxpsiScxEm4KA=;
	b=4KTnmryPJotnUpRN/1pvZ/+swQ4bPK5Lg9ziQc+aUlCR+KK4EYlMLEogF7U1SddNESEk
	 tj6/9um4j0ciwcOmrQKT9L3fLm1e39ziiXzwFeBOl9YWbkE/2/zDqo2Sg+fqnfNAwdWS0
	 bgDRp7NqMXHJtZauZDe3p+fjHbACmBo3uD+UIS35loA76ytMVNLBQUwf/ZkDrwtvs3wpP
	 gMBfYe1O3GbDKf+FDhPlF7y3/MIL1JL77C7CgHZTHk7oaeK+vyJ115YPwGEV0dQyTkxRa
	 S4w5hbF4Z4VfoVPi8IHsqNdwGgmM55k1jB9O+E9CH5qi1wiwTkM16ie8szdxJa3m/ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=y98FmQkg;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AEF606A688
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 11:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6AEF606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=y98FmQkg
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4b52fcb410dso1669921f8f.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 03:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795604664; x=1796209464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zp2LzpohEOD48++2oGdRAJVm2T9583KxpsiScxEm4KA=;
        b=y98FmQkgO18sYEhZk+KoODWr2WqFfOtujhyQDpw5d2nouq3viQVQksWktOrBV/bV71
         HsXxZ7/XtiuJcSSq+Ka7Vef3nw88PCFgqA0gzIY1Dqs7vhyTDvW6SUclMR0l/M8YIaJh
         8SeP/s+jOJnEuEZaBmbmnFlpCXN3CBdd9+mu7S0pLDHgF2XSRiUJA+MkIJl6zk21tRTB
         evK8aK7phg+OlnPvVtWBOBj8iOt5EYGC7WLWKqZnfXC8GZwhs0f/Ko4eo1YgTo5DJuWB
         mVYb4+mfq9wGHtctKSpvoS0YIJM637QnowqrhgWh8XZlWl7oamZjd/cL+AFbE9IVBIO5
         iWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604664; x=1796209464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zp2LzpohEOD48++2oGdRAJVm2T9583KxpsiScxEm4KA=;
        b=hGLXHrtFbHetQc8tkLVhCmqbEGLjbVAe7+DGiyKsDfLonKgAOSSHF6IjRIZrpiojZU
         x26WWuzv9oPLocm3LFMYN3pgQN/Ay65tREvV8xlBpcdOUi2s3/CfK7X7fcE14ziux31v
         PCZ15DmkWoVvWtzt/+Fi9WC3uN9YYKzg4wDpfTeK4fEM2yeem4Q6nr8dXR3BiEE5TZXv
         zEx/SLBaWSR+oHFqGYNyPx0TTi9bPaO0VFUShFOJempMKBMQOyseu0P5PWr6J6naqwL9
         67osB1Wb9PD+jsUK6v6x1mASPpcVUvg9fK1roYAVBMpI1RUzr4XTWq58lOHKPON9Zihq
         OoOA==
X-Forwarded-Encrypted: i=1; AL+hErF3uwMB75p7evO2jEqD1/dr8uTiEgkkFvy+wMy5q8A9MuTSIrEMcu6qqX3+aJDSdo1A8dfJGMARYNk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lfReYAuE6zOl4BBTLu8M3hp6yX9cYhiMuMyAi2I3inX6t5wP3
	4a6SXwTrlqyX7quZH9XHii4WblgtttAyHkZWCQXsVrs6hkXd+hw7PggD8nYtUMO1LoE=
X-Gm-Gg: AZFdTZe+Z6EEAF7uCftOdY3n8npryk3PG/Th7+Tpbt/kfKQor9SCkqHm6aqiUXaEghg
	3nGpMq8TlkYjBgwbcQBZ0ejz7f5GDPQRQKMgtpET0gu4AoGmILLUXcems3g0KY4/j+haKvXKBF/
	8F/gQ867FGQ3LzJK+8iq+1tKp+T5AKD48YXNPVuES4YZd11YtVF9XeoXyEIXlxHtoE0o6Zxe9Fl
	acoNYJyaPeTPetDBXWy5QUQvJKiAl1VJtyrjYwg69Dd1RosMR8/21PMz7/HIXymXW8gYqK4/XtA
	UYgrlrkebzMe2pTeCuErOclbUg6BT0M4661nT3WCobmOalJVXxU7Qse2jTwmwipBQxSgo/XYEJ4
	pt+Fcv35mA7PcS2KSjEt3HR0qXqUinnXkXuoRLS7uSKdyZDA3vUnzDtf6ktkfhGsD7MU8Wg9RQU
	FBzNYBOmtrAAJjFbBnn0Y0P2uvcGYIiwt3w3nCdXRUzo7OGsqhCPsVMXUhfrDj+Z/tXzX1Jmx8v
	WjqsqYGRoNkiF0zIaHvIJANQd2Nw5D1inqCN6O1wk9SbhVNx5M8+LU7r3g7KwA7WkAXbFR0KLT2
	zwo+DdEKLRpNBjQ24/4GfYmVs0Ke7K1vaGfF+VOm+3s5NH0p4g==
X-Received: by 2002:a05:6000:454b:b0:4af:e519:cce5 with SMTP id ffacd0b85a97d-4afe519ceb3mr17529108f8f.3.1795604663945;
        Wed, 25 Nov 2026 03:04:23 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm34532250f8f.2.2026.11.25.03.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:04:23 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 12:04:20 +0100
Subject: [PATCH v2 4/4] usb: typec: qcom-pmic-typec: detach the port on
 probe
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
Message-Id: <20261125-topic-tcpm-qcom-fixes-v2-4-6fede9a69f6f@linaro.org>
References: <20261125-topic-tcpm-qcom-fixes-v2-0-6fede9a69f6f@linaro.org>
In-Reply-To: <20261125-topic-tcpm-qcom-fixes-v2-0-6fede9a69f6f@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1156;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=1f45czPDt1u3bzLaNHt1eXuz+5iiaq/zjhQkgwg7qdw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBsC04VV31DPVVFP+uaecUxzqYyftNPG+glysULiJ
 Fas9HG+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawbAtAAKCRB33NvayMhJ0dliEA
 CuofRdGhxfaUrmIHtp2q+EsJOIwXNTsxH5bartyRkddMCPtU3HAf28o43pLNaPVg1n8Ju5fidr9Z8X
 5HfT8oNHeH7B6FeR1y9im5P0a9OKy3mj+4g0JS5A6QWpgcfexiETgAmZdG03EKzeIVUhLj5HO+SW1p
 wm9k+Yrt0hjP975aJAOhZW/N1AKi/OuUY0JnvmNlzuHEKpGPvjOCYeS2wmRuZXykKtFZ3MU5vrte80
 aL+KI997a7qaoPGrx356S/3LzSHZxcqoFQRh9pIYRif+KBCbCHqNSaf9xFZOOd1qhsbO5r/s71DDXh
 b77IkiQJMdg7P5lo8svpqJCJJ7pqI4Z7/zhYrh4jcuxkFhQqmWQzN+x4tnknS+RfRKxkGgMcqR5PeL
 jP8VcKKPuClT1dYmt2P+B6tQZiBGK+u+axS31bDKh/wokN/Isi+IC7hXv8SOOJcuDVJ89F6G9iiIHi
 GaSlsiPZcukIvh5eO/yGmCJrlx34qyVRzx7QZshYAvELFx0Rq0tkBS/QP4V9KV7g7/dCabfqeoHbYU
 q6UNYJ1uEluBDIsZ4MgN+o/Zg9Lxmj/uXWx3t2AjJs/IfQBxJ9DYRrlSoPklGLxIk1bTneL3KRPGlK
 uGIV8QUsFVn5tnF3KIxW9U6EpU1fD2H149Rf0sITjfJUt7klZDCbM0p5WDJQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The Type-C block may have been left attached by the bootloader, force a
detach longer than tPDDebounce so the partner and TCPM start from a known
state.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
index f125ac722e8b..a33903fedfb7 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
@@ -803,6 +803,17 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
 	tcpm->port_stop = qcom_pmic_typec_port_stop;
 	tcpm->port_disable = qcom_pmic_typec_port_disable;
 
+	/*
+	 * The Type-C block may have been left attached by the bootloader,
+	 * force a detach longer than tPDDebounce so the partner and TCPM
+	 * start from a known state.
+	 */
+	regmap_write(pmic_typec_port->regmap,
+		     pmic_typec_port->base + TYPEC_MODE_CFG_REG,
+		     TYPEC_DISABLE_CMD);
+
+	msleep(200);
+
 	return 0;
 }
 

-- 
2.34.1

