Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777340;
	b=SQXMko1eFOAcJbeS5QPIUOzaajUTgt75lFT8Sr7lijHnaSKqIWCq4ENTSRI/dsnfF5KK
	 S1UlzC6S2vJFZQ/Dv/rNy52il2izt0adgrD3K2LNTHimtWkUySoproQGIoNlo86u5aPGi
	 4zlMkiPyUWAhe3SMq6C6aBqcjOA6DuxZmw8NEG0bBC8hpke3hTTdxsG/Ccg5Q+FIh19G8
	 C2Y7UYI9qmAI2t8CmtOYpHcvBFoqmkhdJ0ktRKTxeUGkkShH9UYBwEC9g/32g7ebikRS3
	 m2InAbHZkNreBuqgve08Tnb/YUqCBF/2prdvY2hedJzlGzkAwiNmY5J4+/bHNNOHpQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777340;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 User-Agent:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=nxHHWtoHNXcyhPMP2Q2UoNWtXvhj8SJDUzWXB/5ocyk=;
	b=fQB8NXjQPv865SGL+T+xcBOIP+U1YEpNhHlbgwCe0pcmTtacrUpWkeudQ8dvcN/aOuQK
	 C860u3bRxvEX3OYhrXszDLSEXllgeU2mybezq1j0LsBGCpqXT63NQxfU4+9LFTzvBtCN6
	 H+aFRlBfEoQ8gOatWbt+KYF6XD3VHBT6zA74rcXUYmtuAg29PhU11fsk79Y2zsURzmFk6
	 kOviyvXqFELCuEKuwv3cgeaW1lne4Itb+VbL4BtOUR0491X7NbdP92CpzRH3ab18o1HY7
	 qUTMYSRRyB8/ArhLKMMNcUd8g9m+YkA7grUjY9h7P/3jTiGBVR4paZklNMl/QhfM4AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=TfycXgNH;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC7F606A330
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 11:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDC7F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=TfycXgNH
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9A14AC2B9D2;
	Fri, 27 Nov 2026 11:02:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C1BED6049C;
	Fri, 27 Nov 2026 11:02:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF94711E6823C;
	Fri, 27 Nov 2026 12:02:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795777336; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=nxHHWtoHNXcyhPMP2Q2UoNWtXvhj8SJDUzWXB/5ocyk=;
	b=TfycXgNH7tOntVdin/eHugaX7mY1Ol4Bxa2KGnjXV2PUsddgpuQUmjkEeZVnRb3d8tYRO3
	rvZAw6bYvi30H03FwGmjJhgOaqU+lSJ1rfrema4M3sHpmI1c7sih+VUYIAiobkJ0g3dSvH
	2MPh/+wRW4pp8Ye5c//XN6QtRM/UncSUqR8VGZHPC/cPrWjcUDIQsySx6r9mDQvVYki9Hf
	bce9mnS/sBBJt1Rehtk0P8eavUnAtHoyzDsrUguFUEsjgOBnudAaRerRJtwvxV31HOfjDH
	MKM90PcAJ8pVAVTTV3PABx43tQ/eKrNvGil9FbRSaBsU8CUGu4BpDrny/f4f4w==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Ajit Singh <blfizzyy@gmail.com>
Cc: romain.gantois@bootlin.com,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heikki.krogerus@linux.intel.com,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: ti,tusb1046: Document no-hpd
Date: Fri, 27 Nov 2026 12:02:13 +0100
Message-ID: <20261127110213.17642-1-romain.gantois@bootlin.com>
In-Reply-To: <20261126093819.76480-2-blfizzyy@gmail.com>
References: <20261126093819.76480-1-blfizzyy@gmail.com> <20261126093819.76480-2-blfizzyy@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: koshi/0.3.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On Thu, 26 Nov 2026 15:08:19 +0530, Ajit Singh <blfizzyy@gmail.com> wrote:
> When HPD_IN has no usable hardware signal, set HPDIN_OVERRIDE over
> I2C in DisplayPort Alt Mode so the device treats HPD_IN as asserted.
> Clear the override when leaving DisplayPort mode, and preserve the
> existing register value on boards without no-hpd.
> 
> Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
> ---
>  drivers/usb/typec/mux/tusb1046.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/usb/typec/mux/tusb1046.c b/drivers/usb/typec/mux/tusb1046.c
> index 34ef81f75693..50a856c8245d 100644
> --- a/drivers/usb/typec/mux/tusb1046.c
> +++ b/drivers/usb/typec/mux/tusb1046.c
> @@ -21,6 +21,7 @@
>  /* General register bits */
>  #define TUSB1046_GENERAL_FLIPSEL BIT(2)
>  #define TUSB1046_GENERAL_CTLSEL  GENMASK(1, 0)
> +#define TUSB1046_GENERAL_HPDIN_OVERRIDE BIT(3)
>  
>  /* Mux modes */
>  #define TUSB1046_CTLSEL_DISABLED          0x0
> @@ -32,6 +33,7 @@ struct tusb1046_priv {
>  	struct i2c_client *client;
>  	struct typec_switch_dev *sw;
>  	struct typec_mux_dev *mux;
> +	bool no_hpd;
>  
>  	/* Lock General register during accesses */
>  	struct mutex general_reg_lock;
> @@ -44,6 +46,7 @@ static int tusb1046_mux_set(struct typec_mux_dev *mux,
>  	struct i2c_client *client = priv->client;
>  	struct device *dev = &client->dev;
>  	int mode, val, ret = 0;
> +	bool dp_active = false;
>  
>  	if (state->mode >= TYPEC_STATE_MODAL &&
>  	    state->alt->svid != USB_TYPEC_DP_SID)
> @@ -67,9 +70,11 @@ static int tusb1046_mux_set(struct typec_mux_dev *mux,
>  	case TYPEC_DP_STATE_C:
>  	case TYPEC_DP_STATE_E:
>  		mode = TUSB1046_CTLSEL_4LANE_DP;
> +		dp_active = true;
>  		break;
>  	case TYPEC_DP_STATE_D:
>  		mode = TUSB1046_CTLSEL_USB3_AND_2LANE_DP;
> +		dp_active = true;
>  		break;
>  	case TYPEC_STATE_SAFE:
>  	default:
> @@ -80,6 +85,13 @@ static int tusb1046_mux_set(struct typec_mux_dev *mux,
>  	val &= ~TUSB1046_GENERAL_CTLSEL;
>  	val |= mode;
>  
> +	if (priv->no_hpd) {
> +		if (dp_active)
> +			val |= TUSB1046_GENERAL_HPDIN_OVERRIDE;
> +		else
> +			val &= ~TUSB1046_GENERAL_HPDIN_OVERRIDE;
> +	}
> +
>  	ret = i2c_smbus_write_byte_data(client, TUSB1046_REG_GENERAL, val);
>  
>  out_unlock:
> @@ -131,6 +143,7 @@ static int tusb1046_i2c_probe(struct i2c_client *client)
>  		return -ENOMEM;
>  
>  	priv->client = client;
> +	priv->no_hpd = device_property_read_bool(dev, "no-hpd");
>  
>  	mutex_init(&priv->general_reg_lock);
>  
> -- 
> 2.50.1 (Apple Git-155)

Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>
