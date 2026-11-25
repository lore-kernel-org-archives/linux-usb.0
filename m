Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615456;
	b=YTTz7uSZvtCH8N6oi9JjMyzbUICB0pUkf/lDczSv0cVGLPNgyHAzMSD4fAHxtJqATGGQ
	 yfdxrtDwmWBdqFx4yIKAZwzv3ksx/JA5FJV0Bx++VScSo4DUvKU/XpXCsRNufgGP3/SCt
	 4iIqJWgCdFlaZqETStR7x0wxd0/UXc9CubWld/2zX8ocMiqSge4oIwIIOn6IxqP0R52NI
	 wBP8V7FK5Kmd0rYuces2y2I8plaCKfkJkEhH3q17WXnfbHQgcSkpFuDvbCQkTlpOO+Sty
	 nYNJBEL+svvZyK/LaYhBZTii7WcNQxo/XvSQJf2mrhh0qXK3ae2qxzhV9xk7VqKlztw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=4hHDt0AHnzQVee/nL+otyYXpEluaox9MK0lFkuMoHGQ=;
	b=h/S/S4OWL4UEPrUlQU7KEOjcUZ6vysdt9cEv8FwK01HVXP26c5H0I+6HhXa2gBjC/Dhc
	 aWUUzANad9dzilvHbd115EwDA1GQ9Ngie3bcxmphKumVUhFmKV6LTqvXUpXg5Xa8xF++j
	 fCdm7cEl/MqbHbZLPmdCnQ2UFDwUHBQ3V84/vDoC8ZDuRNizbh6nOkKJAcT93BreaCda1
	 b3Es4tmMIx96pAT2rlAx+B5X8aFdbjQ/sM0fkMddHL30e+qabf2FsAjixLhYDYNQRuO0U
	 yw+Ko89wdOBHX3igyc9GNZXkZWUs+e0oBbjydUWTTKthJPoliXO5FpLkxaavX0DMddA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="Jsm/ZHBA";
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0797606A323
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 14:04:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0797606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Jsm/ZHBA
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c5188e17487so3278166b.2
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 06:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795615454; x=1796220254; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4hHDt0AHnzQVee/nL+otyYXpEluaox9MK0lFkuMoHGQ=;
        b=Jsm/ZHBAd7kRnpLgCIyhYgtTxMHOIWXwpst3K0kudtd8oR8JO4Er8s25HvpTNJwRE2
         dV1wRnZmdBRhlJ9jH2z1iMRmwHdcdQ8Z9yy/YcIyHUdaz11pzbrHZZPPIBNdTzrJ2tLa
         Oc263OxCfT90nn2wVVJ59hKRGdaV/ySMrVnnEc+ATEU7wJmmCSt/ZCjdk0dlthv/Csaz
         qD1WWFDdBqCXf1ifCAM5f9RJwOTbCVJqWPnRg7fuw1LE5afQmMVKZ6bWGPXT1bu5hn/V
         hVBLbPc8VcSn0wRSSRfQGVgt6AXpnV8DIlMR6COT7GckMn58S8HFB/+FmabjVB5oSrUy
         TAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795615454; x=1796220254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4hHDt0AHnzQVee/nL+otyYXpEluaox9MK0lFkuMoHGQ=;
        b=VSI0kcSnQpJAvV1wcdjEb/DBjuHxP8iVzcteN3Dj4Cz+f+0qQ7/4fPUj7IeZIUDn/W
         tF3HD92YzuiyoTSdwWEpmOvjfNfHMWxkCxwlk/Xlmfxh152NH9fGJFUGEfwlEYAsZLjE
         Lbp6pECfpYlog3kfmeIAGvmvvW2DHcgguKJtha+ADBda/HF9g+z8PybSD7v2gOlLd5e+
         wXWc8PD0D5H7821DnOD05WblU9K/vkDX4PF13ZMRaSutWPb3t26MU668CT5PEWccxvXC
         30KTd6jnGDWaAXJbxVb33Jr8RFWE8OScxwdNFs6hNKv+OrmDc4bglEq1F0m178+x7KZd
         EgUg==
X-Forwarded-Encrypted: i=1; AL+hErEH6YA6TvSIK5MqJ2R3zmeeIBdaoYu2I/ntnqwoA+5P3vij14JWtO3lab1weP2rgq9V2aMM/6z16Rc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8uyKu2Bl8R+rUm6G0vCEB/CGJYvnhjmrMM9v7Gs27miZpJ0Ry
	g+Kd0BlfItppcEdnHaLTfvClOf39n28++9JQ151TFHNZYwJ+ZKVOCyxFC8vTipuKGWU=
X-Gm-Gg: AZFdTZcXCPeF8kJCbdF5/S3x1v3c6LbNAWi4rXcmeWiuF97sHkgoLaZF9ZqO8R7jUDs
	+Tr/mq3//yZBYEWanUSuJTfxmaLYgO2eo82VanoOmPC/eySC1Wfo8Z+cbqOLyeAGy6/7HYUs/1X
	hz/qfMSyDZ+19Ce8GoUUY31HXP5uQaciqhdKHAjgpKYx6cUvEEExZii6dY05JGUt9vJT24hiCcz
	aUQBXCCrQfnEZstVncoHoXcMQYndD46qROy1o3/yVrQnv6mSMuYXVwb+ARRdP3uY50By7BwHBcY
	zsVHJIJYh8jJbfnTyIhE/xhhg7tRPrBeGkCSXzO96uFbOsB6B2+Zx25vt1cgp/4ldykhMyCBPCr
	ox8K+k4kc1Cmy/wyrf35/mtt71q30Eo+2LEb4DCLk/ueMDo5atAvzizKXZQawb0wxX4WEaSVz/r
	i4RF2kuVUjjzfw0pSy7rNpEvzjQ9qzyadNc2V0HfE78WQtnnR5pPr+tLGaB9ujrvxwXP+jW1TbZ
	p3tAvnStA2vv8lL7pw/ZtOOAGvWlF0ItDAk40H2g93PpUemdhoV5qGmd3VPCDGtgg006AeVIORA
	NnUOYSLQza/FDTnu2hkuig0lAzyk+yc/8IWVU1+2mtPTNwEus8X4qUJEvzVifh8O/hfl7605G1o
	B/jes6NlLblovEEILAXVVQCRiJxCUsUnv8RwiywA=
X-Received: by 2002:a17:906:bcfb:b0:c40:b59:1b with SMTP id a640c23a62f3a-c513aca41b9mr1105555266b.44.1795615454197;
        Wed, 25 Nov 2026 06:04:14 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513a8678cdsm627741866b.0.2026.11.25.06.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:04:13 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 25 Nov 2026 14:04:11 +0000
Subject: [PATCH 1/2] usb: typec: tcpci: add get_current_limit callback
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
Message-Id: <20261125-tcpci-maxim-bc12-v1-1-656e01201efb@linaro.org>
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

TCPCI-based ports attached to a source advertising Rp-default report a
0 mA current limit to consumers such as charger drivers, preventing
non-PD charging on hosts that rely on BC1.2 detection.

tcpm_get_current_limit() falls back to 0 mA for TYPEC_CC_RP_DEF unless
tcpc->get_current_limit is populated, and tcpci_register_port() provides
no way for chip-level TCPCI drivers to supply that callback.

Add an optional get_current_limit callback to struct tcpci_data and wire
it into tcpc.get_current_limit when provided, clamping any negative
return value to 0 because tcpm stores the result as unsigned.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/usb/typec/tcpm/tcpci.c | 12 ++++++++++++
 include/linux/usb/tcpci.h      |  5 +++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 7cca97bd772b..3f2c87d475c7 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -498,6 +498,15 @@ static int tcpci_set_pd_rx(struct tcpc_dev *tcpc, bool enable)
 	return 0;
 }
 
+static int tcpci_get_current_limit(struct tcpc_dev *tcpc)
+{
+	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
+	int ret;
+
+	ret = tcpci->data->get_current_limit(tcpci, tcpci->data);
+	return ret < 0 ? 0 : ret;
+}
+
 static int tcpci_get_vbus(struct tcpc_dev *tcpc)
 {
 	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
@@ -892,6 +901,9 @@ struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data)
 	if (tcpci->data->check_contaminant)
 		tcpci->tcpc.check_contaminant = tcpci_check_contaminant;
 
+	if (tcpci->data->get_current_limit)
+		tcpci->tcpc.get_current_limit = tcpci_get_current_limit;
+
 	if (tcpci->data->auto_discharge_disconnect) {
 		tcpci->tcpc.enable_auto_vbus_discharge = tcpci_enable_auto_vbus_discharge;
 		tcpci->tcpc.set_auto_vbus_discharge_threshold =
diff --git a/include/linux/usb/tcpci.h b/include/linux/usb/tcpci.h
index 9b46a6bc762c..1e316190dc8c 100644
--- a/include/linux/usb/tcpci.h
+++ b/include/linux/usb/tcpci.h
@@ -208,6 +208,10 @@ struct tcpci;
  * @set_orientation:
  *		Optional; Enable setting the connector orientation
  *		CONFIG_STANDARD_OUTPUT (0x18) bit0.
+ * @get_current_limit:
+ *		Optional; Returns the current in mA the port may draw as a sink
+ *		when the partner advertises Rp-default, e.g. from BC1.2
+ *		detection in the TCPC. Must not return a negative value.
  */
 struct tcpci_data {
 	struct regmap *regmap;
@@ -223,6 +227,7 @@ struct tcpci_data {
 	int (*start_drp_toggling)(struct tcpci *tcpci, struct tcpci_data *data,
 				  enum typec_cc_status cc);
 	int (*set_vbus)(struct tcpci *tcpci, struct tcpci_data *data, bool source, bool sink);
+	int (*get_current_limit)(struct tcpci *tcpci, struct tcpci_data *data);
 	void (*frs_sourcing_vbus)(struct tcpci *tcpci, struct tcpci_data *data);
 	void (*set_partner_usb_comm_capable)(struct tcpci *tcpci, struct tcpci_data *data,
 					     bool capable);

-- 
2.56.1.831.g720f3f5937-goog

