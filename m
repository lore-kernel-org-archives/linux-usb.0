Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685920;
	b=iQ+3Pp0Ii0bazoTR+IoYvITiWJ+L7izrKY0sCB6eht3AOT3wP47FZqEEmtV/dYKW696s
	 8w9WO1BR0Jn3TrdW1AXx+8rY6I/d7wf1N18nvi+PzbzVHWo4e28Y3ulVqyz7OEX5f0oge
	 AaYTaY7hescKDtmtUZUnzpKcPOCW9DkBbpBMNaY9dBOMGvH7jQDMMjyWQ7kCITpzfc5Bc
	 /Ff9xHZsHDWoOGQeMQnlyICzDUavWazDYyv5euv2ns9pAuHohBms96O0RrKjziqzelWCl
	 DA4G27GYQztbFg/ojVk9SPT+KmByXYqcxbB8QF3YCW2wb3HH/WLKNgbotp97RHmnyTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3dcSItid+640QQ6B4SJ+u9MysfBoiq2+UtuyGaK2ZU8=;
	b=1ar9QahVj7fBbpR6yHBzTCjHRMmecPrR3rZakxPAlB0jWO8R0tEdx/topBv2KgyJEu7i
	 nWYE58+u6uAPo3wnFOaa7ssUS02CdT0wsis8zJaOyZpYbx0PS9do3A+R5lYMa+E3QO/OE
	 5n7SGC94CDwqPd4nRuadmu4j2PgTu1gzbbovjNsqlB3LTOc3qRVzHX90sOevb1YM8I9XB
	 YIwTFTqZKv2kcUVEoHzH7+1KeAcxhoS2Qkp+8fJIrZN3LV/oYw0J+Un1Py+9FKN/2R06B
	 9gtpulO4QKr3xDLuWCOdO5V9vpa2nY/ID54cyfiZHxWGBkm01RZt5Aua/UWZtYM34Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OQuHJbEk;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EBD606A681
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 09:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96EBD606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OQuHJbEk
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3866a784546so9296219eec.0
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 01:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795685920; x=1796290720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3dcSItid+640QQ6B4SJ+u9MysfBoiq2+UtuyGaK2ZU8=;
        b=OQuHJbEkv6SkaSz8rAnRV8NWVYuVN7xnPksPb3UOji7J3c3KM2kl5kXJYeNDMIcpEM
         6veLsMMf5XFsrLFwsGyMnbmJERHNkWXWNFNTDNafv7tLD07NP2tQS+5IjP2iwD1OpBFZ
         HR0XXn9okyg6nHI1vo9IsF1v77NxsXpHWzdOSDTpZ4dX2Pfdn5KnHwGEDMWIQcUZSpUf
         adMztKfwPR1SaqH1mHgmKiTAQ1BBdd0vUV8ntvZd8i6gCWiW2nq3h9ftP/o0kw60Q9Ft
         ErK9z93Tt+JMQ27lnMZRPAiNwvHwO/DGVvRqpcNt21+o8Dn5NBTek6X5dsXnYk7FsFL1
         altA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685920; x=1796290720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3dcSItid+640QQ6B4SJ+u9MysfBoiq2+UtuyGaK2ZU8=;
        b=p2hlJ2cEm3mTn1qMQfl2Wzt4eyqurjQ9Sj0uhWv3chW6YsmkKAd0CVyRfGE34ZC3nb
         7eZk5b3jkzJkzi2OAg4sU7EMVMSKU4EMKk28XAh+Iyjze6oHW5b171i9ciLak1Yzxn7L
         6Rif37VbD6kJezgeRU1XxtM4qtK+2ewJ2hjUTbrEEnjDmAIhHwEVrsPihH95xiA8DS9Z
         a4DcYeAK855dFXZNtU3DJ0+NxDqgM0rZrNlqqP49/lZwPLAMVqNBgOS6GQJa/y5GCxu8
         WTacOSZL/aLEUnmrpVkddJwkeOjo6JDOilpT2RAREmWwzTEbUw2Z+DL6nG+KGXAafe7r
         bZXA==
X-Forwarded-Encrypted: i=1; AL+hErF7lDwXbtTgWJpgdxBVIOGeGaPsp5IhRzufL/odRU/IV5MgWnPCGomi4jCnIW7cHd0a6FdoUgpG2DQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z85ow2KLVV7pgXzhHyqDP12SEyN6McjOGtJMV5BH7EZA8Jift6C
	9wlptEZcs/AnNdzwp8O4Sx1lyKNLNvJQ4m8aEHsBTtl5dY6mpF0Cef6GcGhpSQ==
X-Gm-Gg: AZFdTZe9fyqPoZShrXNApFP52RttLFbObODmzyPYBOecTU50HSzVy7jtSVYJe4i70VF
	mL/y/UqODHCArE+5o9JCrllY8T5Z2hL0lVwdinPL5BiREeXatlsbkiJDk2i5OghiMzDDpwXEpOc
	7fBq4A21a2AEICDTRKdc0ekGCM8q9uBuHkzMYereVu8AaqMuydqop98o8C3YFLkAYY4zSF1WIgr
	lW5AQuqf5Ku4uVIuUH3cwME0d61GtUAw+xsc4VlSEHZplvO7evrxQM1yOvuFuzUpQHTHsPkTCKp
	AB5ubz07DQbVJtQG/oFFxDxn8CTOtESVzngnkiZB1668NoIZa8IXwfoP5zxAlbwAkoZSrj/+QDU
	ohBe/ET+8CkAmCTaac7Kk2kquKF2+V9e0TwpmqH3Gs4sxAmdQBkso4X2icu6tEBzhWPNji+Pv0P
	q6MOlxgdDvo7848jGQ3Kej7BE2mRWY9+dljGZjhgG18QxwljyT6LgihJKNHxinsBp9U9x8foNtQ
	TOdc6Nq/Krq3Z/BEX+QF6IIhy/9ixn51bOAlfzACAJrGkAw6oaehM5YF96UQT1Y0ClESa4YVQUO
	oslQalx+2K8vRa7oB/J6Tt+5331/c/Ztsmy44Cj8KQ7IM+biJGClOQ==
X-Received: by 2002:a05:693c:60d4:b0:369:fe81:a575 with SMTP id 5a478bee46e88-3857111f203mr25335643eec.35.1795685919741;
        Thu, 26 Nov 2026 01:38:39 -0800 (PST)
Received: from 192.168.1.36 ([2402:a00:163:2ce9:ad38:eaaf:b00d:c452])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aa203267sm32600571eec.0.2026.11.26.01.38.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 01:38:39 -0800 (PST)
From: Ajit Singh <blfizzyy@gmail.com>
To: romain.gantois@bootlin.com
Cc: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heikki.krogerus@linux.intel.com,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v2 2/2] usb: typec: mux: tusb1046: Support no-hpd
Date: Thu, 26 Nov 2026 15:08:19 +0530
Message-ID: <20261126093819.76480-3-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261126093819.76480-1-blfizzyy@gmail.com>
References: <20261126093819.76480-1-blfizzyy@gmail.com>
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

When HPD_IN has no usable hardware signal, set HPDIN_OVERRIDE over
I2C in DisplayPort Alt Mode so the device treats HPD_IN as asserted.
Clear the override when leaving DisplayPort mode, and preserve the
existing register value on boards without no-hpd.

Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
---
 drivers/usb/typec/mux/tusb1046.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/usb/typec/mux/tusb1046.c b/drivers/usb/typec/mux/tusb1046.c
index 34ef81f75693..50a856c8245d 100644
--- a/drivers/usb/typec/mux/tusb1046.c
+++ b/drivers/usb/typec/mux/tusb1046.c
@@ -21,6 +21,7 @@
 /* General register bits */
 #define TUSB1046_GENERAL_FLIPSEL BIT(2)
 #define TUSB1046_GENERAL_CTLSEL  GENMASK(1, 0)
+#define TUSB1046_GENERAL_HPDIN_OVERRIDE BIT(3)
 
 /* Mux modes */
 #define TUSB1046_CTLSEL_DISABLED          0x0
@@ -32,6 +33,7 @@ struct tusb1046_priv {
 	struct i2c_client *client;
 	struct typec_switch_dev *sw;
 	struct typec_mux_dev *mux;
+	bool no_hpd;
 
 	/* Lock General register during accesses */
 	struct mutex general_reg_lock;
@@ -44,6 +46,7 @@ static int tusb1046_mux_set(struct typec_mux_dev *mux,
 	struct i2c_client *client = priv->client;
 	struct device *dev = &client->dev;
 	int mode, val, ret = 0;
+	bool dp_active = false;
 
 	if (state->mode >= TYPEC_STATE_MODAL &&
 	    state->alt->svid != USB_TYPEC_DP_SID)
@@ -67,9 +70,11 @@ static int tusb1046_mux_set(struct typec_mux_dev *mux,
 	case TYPEC_DP_STATE_C:
 	case TYPEC_DP_STATE_E:
 		mode = TUSB1046_CTLSEL_4LANE_DP;
+		dp_active = true;
 		break;
 	case TYPEC_DP_STATE_D:
 		mode = TUSB1046_CTLSEL_USB3_AND_2LANE_DP;
+		dp_active = true;
 		break;
 	case TYPEC_STATE_SAFE:
 	default:
@@ -80,6 +85,13 @@ static int tusb1046_mux_set(struct typec_mux_dev *mux,
 	val &= ~TUSB1046_GENERAL_CTLSEL;
 	val |= mode;
 
+	if (priv->no_hpd) {
+		if (dp_active)
+			val |= TUSB1046_GENERAL_HPDIN_OVERRIDE;
+		else
+			val &= ~TUSB1046_GENERAL_HPDIN_OVERRIDE;
+	}
+
 	ret = i2c_smbus_write_byte_data(client, TUSB1046_REG_GENERAL, val);
 
 out_unlock:
@@ -131,6 +143,7 @@ static int tusb1046_i2c_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	priv->client = client;
+	priv->no_hpd = device_property_read_bool(dev, "no-hpd");
 
 	mutex_init(&priv->general_reg_lock);
 
-- 
2.50.1 (Apple Git-155)

