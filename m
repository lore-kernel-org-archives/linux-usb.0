Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615457;
	b=q7bYHZvs4OrZ2mCAywB0a5nTD+C4IuCOLg98Z8y2StD+cqFHDppu5xJY4kmZSYFYrHGa
	 RmF8cUaNd5hUxx3qGkibXaFjn3ilT6dW1idbsDXzzgyn8X3K415nuylGXCWAngGvvdm4t
	 CQ6GtBTuI4iwtwLISlfZZvPLB8PWVab9ptO1bXRzKOlOt9DKBrRfWJpGam07Nc/MejGGn
	 FNd4L02FVDB9TKtjEue2cDlxTvIqc6fCCmd6MC5sH1QsGckHd0fGK1zcoCEC9dSR+HvFu
	 ik0DjRWHllUAEMPGPdQas/DzyUyvmqbP/WOSVKbMZqyJIucwD9J1TE5izr2ShRbRZ/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Gt17SqVKZFuoQnEt/P8FEpr2f5WG5HbmEzaQYA6IuPI=;
	b=DJgiMZT+BMWMkiwJTAqX0Xt89trrQTxU+cbdKrEAfhvU4/q7eygKsEGzJObXLyU+uhFj
	 Y41Z26q9xpsQDrwBGf5EUxaNYlPQjPryMMiuH5K5au1Gk9GaGEM51CJ/hyKrD5EETJF91
	 MeFjsuSoK2qBP52q3B3tkmmUT/vnR5oc1y28U2M73icB+FVcpyYhuR1Tb6ZwyCy8iuuws
	 fWjUPmzhNE7ewBK3ECajeO4bgIUys2g7NxmFUqQkByvvdSmGbOJX5LFJZQePdm7Hoet/d
	 GgLzWBUPly4NH3HzOcwg6JJPywMenC2XUThrlxAuryfgNdY+lc7GRegSzLz6KaWPi+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZCKuJsSk;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3CA606A333
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 14:04:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF3CA606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZCKuJsSk
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c50e26763a4so3259766b.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 06:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795615455; x=1796220255; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gt17SqVKZFuoQnEt/P8FEpr2f5WG5HbmEzaQYA6IuPI=;
        b=ZCKuJsSk17jyd39MTLwUJ1VPStiFuOP6X9DhZnpKiBPVsSNKEk0QshbtMprFWtw56n
         cWGsMNrkHqoLGk5j0n8C9GhhGUcgRXYqpEYqv6MUHR2oCHUZmZsBT0Ynp42ydi+asTR6
         AmUQ3UPRtp9aBrKBg09NLPGtt4VacDbmJtdiXj9n8SagCjJNyw42DaTGA5TmR8A+0Anz
         MCYir84qSd4chECrYGlb0dtFS0Ucbi9iGDvsuEenmwGy+MmYAWPjcinlbGaz80WODb/2
         mcu++UDk3WzEj5cz3Yz1Q3+pTlhh/gxAFuVjdAlQFJ21RHYWIOR2OdCu/eX/0Li4CwlK
         cmOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795615455; x=1796220255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gt17SqVKZFuoQnEt/P8FEpr2f5WG5HbmEzaQYA6IuPI=;
        b=p1sXVeTKvEHyx70he/oQ8AdI9Do0HwHEaEDZHCW0sV9NuKEOD6C0BqdmNqAGmIWqdx
         FrC6+V0BJIeUqouX9YpexSYcFqH7t+NTSlfrm8+OvfJxypAIp+vlzNcbLjQsu7tiZSD/
         yZ/R/MY1kvojZBlT+HPDBSUq4k74FxT5+TWgRY9Nya1RLxn1Hx5V0TFe5yQFR9+vefF5
         n19MO/fPs0a7kvJJd2m97XViidEm+FxnGiC+COVUuRaqMFBzmg25u8GhVglMqKEhvTMB
         MuXKMUimYXSy0j0LJBqlUmjE4paz/KLD6yOX5adi24d1sDrgV5wMT1wPQdJqjFhx8Op0
         vTow==
X-Forwarded-Encrypted: i=1; AL+hErFapIDFfy4smt6TZ1SScGLIUhOm3lCpwfEooVftIv5vPmJ9yXEABmVWkztsUU9g1kNmfeGeGNxjerk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8d32M1nVgJ8/QbKwz21FlrCMEZea7AzjipQDkFivASUPIvJLob
	8lt+mpZ5SiG//pQC/ML/Z1bda2Bh9cxKMya5NQx/UDnZnyT29oN7JZMggw7sIsy+MkA=
X-Gm-Gg: AZFdTZcWBrH9orIqqzixvjHzCTlNj0vUPHWGJZ9903vlxXFPD5Rd/uNQf58fhH/OCIQ
	UwDVF+7T1DQCFTlfP3tcXDT3CpkerGy57bFBAXrFWkR4aHau6XD6e2HoCfvH3weAPHlWP4/sVvN
	eFLnHyrcAnQu8MYonMM11oEqqVuS8+H80sZTWeI/juXX13/j3NeBT/DZhNN5/GosKFAM7z+CqrG
	fsMqiYr7Ezbaoa1mPaqcB92pwknL5Qp3UL1tHbRYPzKxP2SMTm4D3FCxz3y2B9ihWWAkQT0TsUt
	DbmzyMEho2NqhjuKoXlWp7vUeQwm6BNEyQc4FapdC9Sd7Lb8dq6HwIRl3ilwAEdilrmdz4tw+Wd
	c+YHgICUITL+zZ9bGc9c0NWuC3TDH6OOyrkB0ez3BhUAOPLFuWpgvM57X4xIn2WM1wohKLj82gc
	6rfzfA8603M1SVrUgmhnvAAwURAFiW4P8w/ImVpS2lLDE5z6lY4kzwKq9G+lPVWa8vx02Z4W+wO
	VIGTGoJBeode0mXqd6+PYJ5R4YZ90ROdggDSdum+MxdvCM9Td6tbQXRdhqRf+858OLzpTxV3A1T
	Ewoxj3HmikXpxAkaxuMePzJLwjLbkpyax/dtrrq7Nik2khbUtsnQmI1VWW899+uQ7oyujcvdFcb
	LrbYClDszB+JDCh14uw==
X-Received: by 2002:a17:906:785:b0:c50:5e10:71b3 with SMTP id a640c23a62f3a-c513a999557mr1169848066b.10.1795615454956;
        Wed, 25 Nov 2026 06:04:14 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513a8678cdsm627741866b.0.2026.11.25.06.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:04:14 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 25 Nov 2026 14:04:12 +0000
Subject: [PATCH 2/2] usb: typec: tcpm/tcpci_maxim: report BC1.2 current
 limit
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
Message-Id: <20261125-tcpci-maxim-bc12-v1-2-656e01201efb@linaro.org>
References: <20261125-tcpci-maxim-bc12-v1-0-656e01201efb@linaro.org>
In-Reply-To: <20261125-tcpci-maxim-bc12-v1-0-656e01201efb@linaro.org>
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 Amit Sunil Dhamne <amitsd@google.com>, kernel-team@android.com, 
 linux-usb@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3

Maxim TCPCI (MAX33359/MAX77759) ports attached to a non-PD source
advertising Rp-default report a 0 mA current limit, so charger drivers
such as max77759-charger disable charging even when hardware BC1.2
detection has identified a charging port.

For TYPEC_CC_RP_DEF, tcpm_get_current_limit() returns 0 mA unless the
TCPC reports a limit. The Maxim TCPC exposes its BC1.2 charger detection
result in CHGTYP[1:0] of vendor register BC_STATUS1 (0x87), which
tcpci_maxim does not read; on Pixel 6 (MAX77759) attached to a CDP host,
BC_STATUS1 reads 0x02 (CDP) with BC_CTRL1 (0x8f) reading 0x81
(CHGDETEN set).

Implement the new tcpci_data get_current_limit callback to read
BC_STATUS1 and return 500 mA for SDP and 1500 mA for CDP/DCP (and 0
otherwise or on read error). Return 500 mA for SDP (matching fusb302)
because TCPM queries get_current_limit() on entering SNK_DISCOVERY and
SNK_READY and has no USB enumeration hook to raise a 100 mA limit later.
Tested on Pixel 6 (MAX77759) with SDP (BC_STATUS1=0x01, 500 mA), CDP
(0x02, 1500 mA), and DCP (0x3b, 1500 mA) attach and hot-plug.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/usb/typec/tcpm/tcpci_maxim.h      |  8 ++++++++
 drivers/usb/typec/tcpm/tcpci_maxim_core.c | 25 +++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci_maxim.h b/drivers/usb/typec/tcpm/tcpci_maxim.h
index b314606eb0f6..8290201f8ae3 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim.h
+++ b/drivers/usb/typec/tcpm/tcpci_maxim.h
@@ -10,6 +10,14 @@
 #define VENDOR_CC_STATUS2                       0x85
 #define CC1_VUFP_RD0P5                          BIT(1)
 #define CC2_VUFP_RD0P5                          BIT(5)
+
+#define TCPC_VENDOR_BC_STATUS1                  0x87
+#define CHGTYP                                  GENMASK(1, 0)
+#define CHGTYP_NOT_ATTACHED                     0
+#define CHGTYP_SDP                              1
+#define CHGTYP_CDP                              2
+#define CHGTYP_DCP                              3
+
 #define TCPC_VENDOR_FLADC_STATUS                0x89
 
 #define TCPC_VENDOR_CC_CTRL1                    0x8c
diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
index a19f52515429..fb22a0dfb963 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
@@ -5,6 +5,7 @@
  * MAXIM TCPCI based TCPC driver
  */
 
+#include <linux/bitfield.h>
 #include <linux/interrupt.h>
 #include <linux/i2c.h>
 #include <linux/kernel.h>
@@ -57,6 +58,29 @@ static struct max_tcpci_chip *tdata_to_max_tcpci(struct tcpci_data *tdata)
 	return container_of(tdata, struct max_tcpci_chip, data);
 }
 
+static int max_tcpci_get_current_limit(struct tcpci *tcpci,
+				       struct tcpci_data *tdata)
+{
+	struct max_tcpci_chip *chip = tdata_to_max_tcpci(tdata);
+	u8 status;
+	int ret;
+
+	/* Relies on CHGDETEN being set; returns 0 until detection finishes. */
+	ret = max_tcpci_read8(chip, TCPC_VENDOR_BC_STATUS1, &status);
+	if (ret < 0)
+		return 0;
+
+	switch (FIELD_GET(CHGTYP, status)) {
+	case CHGTYP_SDP:
+		return 500;
+	case CHGTYP_CDP:
+	case CHGTYP_DCP:
+		return 1500;
+	default:
+		return 0;
+	}
+}
+
 static void max_tcpci_init_regs(struct max_tcpci_chip *chip)
 {
 	u16 alert_mask = 0;
@@ -523,6 +547,7 @@ static int max_tcpci_probe(struct i2c_client *client)
 	chip->data.check_contaminant = max_tcpci_check_contaminant;
 	chip->data.cable_comm_capable = true;
 	chip->data.attempt_vconn_swap_discovery = max_tcpci_attempt_vconn_swap_discovery;
+	chip->data.get_current_limit = max_tcpci_get_current_limit;
 
 	max_tcpci_init_regs(chip);
 	chip->tcpci = tcpci_register_port(chip->dev, &chip->data);

-- 
2.56.1.831.g720f3f5937-goog

