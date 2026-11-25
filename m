Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604665;
	b=EnRExUTshoc2dXBAkfXcSLgKA5ilNMhcu9kAQOijiC2FBKGnePQh3io0PoBYqeRnJT/4
	 eaz13fNZtscdAHtp0djY5jTvoa0n2qaoTzW/1wM0xdSR+rZeywVaFdUmAK0kGetencWgf
	 zRDf05hjDrztbVrA69LOuv1MRI/aE9Fv5Y4fDSP56xMEMBLHwTntdi3vz675Tcc/oTnOn
	 1SnJOanjEzFFqC9sG4f8RH/01XYH53+shTXMkcj4fLeBVcG6ygaG+8sHq72ugX7GF3T7k
	 7rAPNKE+RA+UcIewG2HJG4pIBU1MXWnYwrJ6Pq4yNw/+t1iy8chTwB+r+gWlCZzCX+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=xVYwLQptQkyCuKBhGnfYLOY7fLR9tn1ULqvNq1oXzRk=;
	b=b4IwxcJirdNjSHp2cxUR6EnOYsdvRm2D3qu/DIFAU6g8YYzGTtFbJtogZ5yREbmdlv7i
	 io9+BDdZ3jRUTJ/MKADi5tqaLGaAm7KbJGYtxOGFXY3p17qjFp7BKv4kYbdm2MrHNC27a
	 AalWHAz/v/pytU2Fdb8qDlYH5Oa7HtjEGh0AulokSA/3vmhwvJrrcQqBIV6S1KcQLybOx
	 8O/A5tG/MPz2FS88fLYPVI/xpAeuJkoO3YgxClQhVIXYdmkWt/6N1RR094+9UgliWj5lO
	 sAEpl6QrDSP8bRrtWKX2DXNbQJxLLRj+HZW8U4kOk+0IyFGw3yqRCG/NXQ0TrIZy3Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sFT5D5BP;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E148606A686
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 11:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E148606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sFT5D5BP
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so4603599f8f.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 03:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795604663; x=1796209463; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xVYwLQptQkyCuKBhGnfYLOY7fLR9tn1ULqvNq1oXzRk=;
        b=sFT5D5BPSZOJhNiYGc1pvsOGfxbbGScbxvIMeYR1ibq4OrmijwARv9ATZglUlCnL4U
         +YWs/olbXixCuI+UWQAovIhi3fqY1iHRpHQUMtZ+U0oJm7wV5etXKk9UEqgQzqzpx61r
         r9qy94vAASVaS3YxdMvhd36MAG/4j8zyvy9Uk+qOIsvCuypmqji2xtgaeIiu/dO819KL
         lx/33A3nhEO1nx6bqNwGcRKFQUBJ6pl8wQrtz8iVRtMdneso6JsJ3vLRH8L/64RXiJOy
         oNAy/cTv3h+zFO4AoV+7BAGR5XEBG/0J6oiApga3noJBxuNQtyObufwrQLcpG8p6BF51
         mwbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604663; x=1796209463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xVYwLQptQkyCuKBhGnfYLOY7fLR9tn1ULqvNq1oXzRk=;
        b=HpCI4h0GtSgP4EP3B3myFCilHPr9qAwho/nlLyf9nVrmEqsK/on97KgJK7OMZ/+Pb0
         2JQeGRJatkldIzfePYjU3hzsIJd35MpPNpL84cFpIogCUGZF2dnWr2ds6ZrTQio7uXzV
         L4PChDxMTb2p6OcXWmdmaBemkoPvu8+DBnfnt2JwWFDbPv8abexduVfXMUEmLHG/7KpT
         AccJr2nZ7UrHAD5737Yh90E1IMAOqIWmiZM7kttI9ihH3ftwQbrNN2viAKgi6iokoZIv
         9+npmdvl1TXeqbMISvHSYQgurk7frbI1w3JqhoN6cChg4fiFUX8tvaLhA6sJRSfuWUpw
         931A==
X-Forwarded-Encrypted: i=1; AL+hErFx+7R81FtDdxxyO7PLwGcAAw5H561c/7TtpBEOz6eeExVzUvz6qV1VTztKSLOSEkcZlfObMCCZWME=@vger.kernel.org
X-Gm-Message-State: APuU4Z968PONc5MbWJH+kBjbLOIXu/T2ormrm3ZoZjmo34qkEMEIQjHw
	BbpqeVjDh8IDqTSoOT8p+Vu1002ws3TwY14TpuUZZaAk9MNw+AFfm0HRNlCkc773hJQ=
X-Gm-Gg: AZFdTZdFnFKM6fS9lRyx2Zd3H5B1t7cqb6VuV0ZWDC+N2wxKXdHSvsCysIzTWtjcp4M
	PGFLEH13m8hRUQ1JbPN6P9sgLtKXjotcBWch40EfxuhgvzUIFB5LgMT8SevWIseoRz19pONILcC
	TnlsjK6hQZnA9gIbDNCar5sb/wx5DUDVEF/ZNbkb83H3xynJmAMTxUvdgTfUUD1otElNRTaaLJD
	i0lZNY1iLX7bj6PxLWz7v7qxiawmw8wpCK1kCtpgJFkC1hV1ru4JhDalo+cihY4PmmwCoNvFJjn
	Sk8mQkcYZPeZfmhWoYjfqNlvAJPUotU4udhD89I9HTNirX2WcJDmWS5KlVOAtBHD08bTlnEGb75
	Zfy/Bx2C/brt9Myyt0Dj1PM2BeXsKWwd5YbJMY1/ZEr6g/Ps5TOnWF7dCWywUdtz5FOMJfA3tbv
	T7Lnt577/0bzwDNgAQJG01/v0w0eX8veumZitmEWBEP0g0dg66vEo3xXWh51+EmLzmlNR7qOfsV
	jmO3/Ajtk6wT/gSL9NUQG0BuLYrYQ72b/PgWfMzEl0+Nzmcnu84MOiLJo3jvUXoxqwkRYXYHpAn
	cGcUhO0ofO0SnlbEQ5VuLe2kpLdbn1aF/yKUZHIW/ZNtKNrJ/w==
X-Received: by 2002:a05:6000:2986:10b0:491:ef0a:1f5d with SMTP id ffacd0b85a97d-4abb32a41f2mr26859347f8f.39.1795604663354;
        Wed, 25 Nov 2026 03:04:23 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm34532250f8f.2.2026.11.25.03.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:04:23 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 12:04:19 +0100
Subject: [PATCH v2 3/4] usb: typec: qcom-pmic-typec: switch to SNK_ONLY
 before DISABLE when disabling port
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
Message-Id: <20261125-topic-tcpm-qcom-fixes-v2-3-6fede9a69f6f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1328;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=wZ3V44vChkvHDcga4+bvEukKI6NXm3A3vV+3tvY0IgA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBsCzRXNdENuqml3MNAqq0u5gGshoBpK5zo1Ys1pQ
 d29kcmSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawbAswAKCRB33NvayMhJ0e0WD/
 4yMuarLUKQZQkPWdhDGaP11duAJNqHv5UqQMlekn5p9uwipfIae1H+GrXd7XwlYvx3D+Q62eJpUpsF
 0agB3OBOP2fLddP3vc/WgtyxQdga5PL7OkN6L+TwrZPqkFUbj9qu+z6BHup1EkAYyzgqCLlw8AqXHw
 GuDr1iDp8v2RQj+E7AVUrqU3zZMu1TWhbPr+g7tbC77tZVcGTICZJjsGbUDM3GKwdd/hwy7dAtrJE+
 PiF9XsD/50yrjUNSKs7VGzZzmBZp+8FZteF/QFUcbI17OqmldXZjnSzNOE5A1qubhA1314k5q6hh6b
 57rSkMCL2rQd3Qa/DxSAju/3o6CWaPHnMjSu5JFxYH3/UWjhYIddSHNgXzsGyPpv4Gd1U3C+x6KGPl
 iMdTy48Zr+xGNmekXZwMtf1kaFOqO2orka8jNnUxCl3bFZZudL8hEQW7ZmsG9RkJ4IT13CukSLiABB
 wIiHUD9ic/luIAVZ1j0nCiiuDok67YVZpwRkR2fLLoRLgXcfY89dXkJAEB8WCRIqTA+jonQf8llwlr
 AghXstKCMjOcXuJ7pYfDj3jWpGhHm7t763AFAzS9/P8BJOJmApJCa91NzGmeneXkDzPlvfcEr6Q34g
 lIv/rgqBMGcSfff4ohAlEdFtyqts2BHw/vj7SZeVDFUihgbI1Nlodtjz4Krw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Disabling it straight from DRP mode can trigger an over-voltage fault on
the VBUS boost, so switch it first to sink only mode for 2ms, then present
neither Rp nor Rd, so a connected partner detects a detach in a safe way.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
index 710acdb9689b..f125ac722e8b 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
@@ -705,6 +705,16 @@ static void qcom_pmic_typec_port_disable(struct pmic_typec *tcpm)
 {
 	struct pmic_typec_port *pmic_typec_port = tcpm->pmic_typec_port;
 
+	/*
+	 * Disabling the Type-C block straight from DRP mode can trigger
+	 * a VBUS boost over-voltage fault, so go through sink only mode first.
+	 */
+	regmap_write(pmic_typec_port->regmap,
+		     pmic_typec_port->base + TYPEC_MODE_CFG_REG,
+		     EN_SNK_ONLY);
+
+	usleep_range(2000, 3000);
+
 	/* Present neither Rp nor Rd, so a connected partner detects a detach */
 	regmap_write(pmic_typec_port->regmap,
 		     pmic_typec_port->base + TYPEC_MODE_CFG_REG,

-- 
2.34.1

