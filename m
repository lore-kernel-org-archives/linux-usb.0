Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785911;
	b=E84OpPPeG+RtqdgJ7CdSkm2V/KKfIA8AYqHMsCgMjnD0OiJXMTxqwinHoPnePrGu/HJx
	 R4Zt1d42FKKpebANAH6L1PpPmFNWdMIyQd1U+UfXvDTxMKVHr+iWF6Do/tY6mzZaMXTa4
	 6Nr+pQ7DrZGVR6uuGo5+uj6Bv0S3WUWfCdrXHdMKmC4UBdQcoSjQ/D/6eozvhDRRucY7n
	 szjkiYhHW5gvvAkhUjIJFQHk7ddkmq+Ajtk3IYz6e35fRB/Cq1goRfVqWhja4RgTerXoy
	 fCTNMhCB/CISlbuDcJzGzTOh50SS8VmRL4JEseAmlLl4fL6mbe+OvYsw+LHaAnZZUUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZD8zIs47GHv3bIeOyhb3lpgrupfkTqj2lYrONuaJviQ=;
	b=tkR2itBqvfah+vYwQypSwjgbIumlr4K3UrdtD6ZeFNZsosp3eJ/M7Bgtid99Y743NmbG
	 wXZxY6yvApEnc4x0xPmPVbi6+vyYD96KBj4GH2X1HyLSQ8KA8+M81sIcNfIPIRHXGaPkh
	 6yoWyIzFgaH4Dn24tp5jOBxriOOmS76z3mxJfeZWCDBEXhGuKoBbAheEYCN56z+ama4yi
	 pF69OAyXWFlJjDAinxkpBmbA+NGesDwEHRHFM/rPH7lZWrlC7cVH7Beg3FQYyYhgg7b6h
	 znGT2RMudpNji3XCvIpGL0NxDrrDFIWZboFWc1LHl4uYlcFNnPk9R1+zk+vV4JVkKtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OsuN1urR;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A571F606A32D
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 13:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A571F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OsuN1urR
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-38692f62b22so10936926eec.0
        for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 05:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795785910; x=1796390710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZD8zIs47GHv3bIeOyhb3lpgrupfkTqj2lYrONuaJviQ=;
        b=OsuN1urRmo0kR1oHgU7OSDiuTrpvYprEnAqbC53vh0S9GRcpbZix4DHD14KGu+yj0P
         EvdUGt6l7eID1sRP4m7nfCrNW+X06Ce03uwAfopY3cN6ObMfoO9jOodZz37MZeTQOiJl
         +5zcjQMrTHMNSHREWsamTWZiOtTqQA/XkFSaivQ2k6cQerZ+d334/m/JN83lA25lcgTR
         Yfekk2VhajRBpltFovPVRyKa10EG6jQszfmdwP7l0uUIkneEOBQtOvd+FcE7A3Ag8RIN
         Tevkh+WyVz70YrqVuOo0c/EGqxMoHV+OG1mg8to+wiHx4+4AJ8LvcFMGy91iQDpxQ2n5
         3aTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785910; x=1796390710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZD8zIs47GHv3bIeOyhb3lpgrupfkTqj2lYrONuaJviQ=;
        b=kH/yRXP+tTgOOY69MJrZXimAT4c02O/XQZ2YFyMbFU59JmL/0q8WE42w1Ze5nj4SBn
         zVC4syE6xBGwHRgycxyzYD1t/373WlLAT0arsu7ZjJR371dSUNb4+m3ZIA83NQg8Bnvp
         dy84Qtfqe7YLGgLeAe1nZE24g6m8vMD/GCQjM8M+kV9tj3/4Jb7yYlSJtfUC2rhNevHB
         g+3W29fJH4RMRg6eo0a4TYcgiUVcm1FUGyx+gj+6T0NU5P7hy/p80UCERkOyYHNfY9Ea
         /Zs+/4W0jDSriEzJvvrXRTeBH70DeFWQpRRsk7QTGzbKcJsBVePGXEGSlyKmKof+JMAM
         T6nA==
X-Forwarded-Encrypted: i=1; AL+hErHFDMgF2f5uVkXaNTiCJn6OT5sMaYTGL2Gi89kGspji1JLpmxRVcFCY0v1GChbCfxz3ZdoQrGM2RmA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8J1qXvLCTS/Bvwz5uLNwbGW1mBr4/2PHNIdZKQVljEJqv28FiB
	NYcRn6aqKVGDNfz3BdDgqKsIFvjaIt0zirRJbt9Yy11oNlswmlsaNYaN
X-Gm-Gg: AZFdTZePSj1zXtTsHQR3mOY41QH0+lIBAPXi3N2S1Xqk9mpsNhYAD5t/nfysYWO3lUM
	SXL7HhSGivCrJAMaa3akXoyHUJMFSwGSOvDt4SkDUUNDFbIlpSLTmlgjFHCeHgZIeF6LKqkFm12
	Ugdyhjz4toDVt77OB47TBsCBxonKeeWTSJIcujyZveokg851ewDM8vTwdgdd8qC+uHA3Ipub+vI
	ZVEyNXeqUM0MgtlGaWw66f75oSS/79y5euoqX5EKhfiuW2rv5tKih28NhpuAlkpryHlUHeST+Wu
	oAF+61l0G8Z1LLvfWx3V2UeluPrZmu0GEOHugCVn508kU/xfwIz0w34CIMSVYgaoSjRBKjIpqgj
	neM1lfsbV7NBph3H/c202DqwE8bsNf/S722QnL4RnkURVebaO/RaAqxul7ZPKvXkjxjfb1qVOgy
	rsUyU6HyRK5iILZO//gCnrrcoATe4d4aU1sWfb/4t9vpcEEz+W4zZ33tApTC5walsD710cZpwjP
	TxgCwmhw4bf5VUvfH0mxOQdMX9UDI6Ztf1zN25aye0VlaUI6iDt35e4nl2CSSWuH6wWQsooC2DK
	PNNxeME+jIDs19hXoRqKCBBqa/h8EKLv0o2aWJSWLkxaGSf5miYe
X-Received: by 2002:a05:693c:414e:10b0:386:a1ae:6762 with SMTP id 5a478bee46e88-386a1ae6d5fmr21349026eec.36.1795785909724;
        Fri, 27 Nov 2026 05:25:09 -0800 (PST)
Received: from 192.168.1.36 ([2402:a00:163:2ce9:b15c:e4fe:6de1:494a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm59082431eec.1.2026.11.27.05.25.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 05:25:09 -0800 (PST)
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
Subject: [PATCH v3 2/2] usb: typec: mux: tusb1046: Support no-hpd
Date: Fri, 27 Nov 2026 18:54:49 +0530
Message-ID: <20261127132449.89081-3-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261127132449.89081-1-blfizzyy@gmail.com>
References: <20261127132449.89081-1-blfizzyy@gmail.com>
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

Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>
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

