Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECF233DEF7;
	Thu,  6 Aug 2026 03:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785987730; cv=none; b=MXNRNpM5y6sOOb+vsrYKofmPwFbGuVPM8FZKUHhO90bMs7x8Mx610dakat9x1k2nc2NLeopyiKmwXJHQlw7spXddGsV1RWwc34ntjrt2MtZHnHIXFx8iOsdkqx3KN7C7PtUpPwhHMjWn6FEgfiv4W85uvoa3t/7XDQr9qFft994=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785987730; c=relaxed/simple;
	bh=7voE2p0GTZdinhQpsehaZGzrFZydYdAiqblkzWe2HnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SZ/hb0ytTkXfjX/BF8/4sDiCI6kB/lvQcAX/TOYYdON4IeZadgC1GbtH0hw/YQKwsa8ZFCGrqKpXGOgZw5WWEsE79JLKZLkheUCeK1L8GyBFeKdXiQ67dqEY/jlv/ivRq6Y1H5inNoQQoXH/6eq+t2YyaFaMQBwKi+ILLuRu8aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=dt32KFLZ; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=A67Gh8xb; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="dt32KFLZ";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="A67Gh8xb"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4hFtPm5kp8z8v12;
	Thu, 06 Aug 2026 05:42:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785987724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=60Wx4RH2DcNw+gmwLmaL7VBzhkcqR8QF2SDd5x9NEhw=;
	b=dt32KFLZjqZF6ckC6UBwUS9d+/e1xL8JAIhu/wwBAzhpBsj9KvtXr6xUJkhoNYPXzXceVq
	JNKEvDhsPWj+91/eSoQ4TgbT1nDY3oQzXll/5bv/XXWdx1/RmBlmoQiL33PsVndlQfuors
	G+u1TA1b2SDWLkCQVKicVWgs4vs4VPpaEj+acIfi0OK/D6PN4DmnbifLfNnaBti0O9ogcN
	6BzRfU4g4ZVTAHarF4v4q3DP+hKGyNkrVuL7zSQnOSwiurRgYa+Uigv4Oxn/TzLtjjAVxe
	NgUZRK44bHrCtuLlk6lP0jjmqcFfjSvmMP4P0S04iQypYo+Ypj/Nnw/UOa+r4Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=A67Gh8xb;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <52e2964c-8b26-4312-a935-6455a7ad4750@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785987723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=60Wx4RH2DcNw+gmwLmaL7VBzhkcqR8QF2SDd5x9NEhw=;
	b=A67Gh8xb7edtDNia1m11PzmcokrUNsptre3oQsNcfJEcCRLqZ9mQBiHHEgtsOCVK+ZKM2z
	EgqBO0vgr2W6L9YVydqQRe1FwuKkiHRUm1ttBlFKrZICFt4JoOmEv/jX83BTvrWiX12CST
	9/widq05XFbMIyRtP6DiZ/TeU8Dv396Ds6eSy5i5cTVuAw/PViiUrQU9lD5byoojt4SRXo
	AlEDDDR0Ai3fOTqAvrxK8u8AvoXCEl2KBrheoXpS2/3vGMQmAvlzDn9DRZsvDGpnYjTlXZ
	yOLAOPHIsc9GciBvekpBzFOfIAvuOYnXSwspDTP1rPttrqQs4zsgSy0AG9t0XA==
Date: Thu, 6 Aug 2026 05:41:37 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1 2/2] usb: dwc3: Add Renesas R-Car Gen5 DWC3 xHCI USB
 controller glue
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Thanh Quan <thanh.quan.xn@renesas.com>, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20260728011656.465040-1-marek.vasut+renesas@mailbox.org>
 <20260728011656.465040-2-marek.vasut+renesas@mailbox.org>
 <anJ6HkPgDb7I4xeL@vbox>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <anJ6HkPgDb7I4xeL@vbox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 4gt7rfopkx8on66n5tbkm67yn379tmbt
X-MBO-RS-ID: ca329d717fb030c81a6
X-Rspamd-Queue-Id: 4hFtPm5kp8z8v12

On 8/5/26 2:48 AM, Thinh Nguyen wrote:

Hello Thinh,

[...]

>> +static int dwc3_rcar_gen5_init(struct dwc3_rcar_gen5_priv *priv)
>> +{
>> +	/*
>> +	 * The datasheet describes initialization procedure without full
>> +	 * information about the registers. Therefore, the source code is
>> +	 * based on the bare metal code shared by the board team.
>> +	 */
>> +	writew(0x211, priv->base + 0x26);
>> +
>> +	/* USB3 does not need additional register programming. */
>> +	if (priv->use_usb3_flow)
>> +		return 0;
>> +
>> +	writew(0x11, priv->base + 0x81c);
>> +	writew(0x0, priv->base + 0x81a);
>> +	writew(0x1, priv->base + 0x802);
>> +
>> +	usleep_range(10000, 20000);
>> +
>> +	writew(0x0, priv->base + 0x802);
>> +	writew(0x1, priv->base + 0x2a);
>> +	writew(0x1, priv->base + 0x81a);
> 
> Use macros for these magic numbers.

Please see the comment above, this is some magic register poking init code.

>> +
>> +	usleep_range(10000, 20000);
>> +
>> +	return 0;
>> +}
>> +
>> +static int dwc3_rcar_gen5_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct device_node *subnode;
>> +	struct reset_control *reset;
>> +	const char *maximum_speed;
>> +	struct dwc3_rcar_gen5_priv *priv;
>> +	int ret;
>> +
>> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	platform_set_drvdata(pdev, priv);
>> +
>> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(priv->base))
>> +		return dev_err_probe(dev, PTR_ERR(priv->base), "Failed to map registers\n");
>> +
>> +	reset = devm_reset_control_get(dev, NULL);
> 
> Where is the "reset" being used? How is this reset asserted/deasserted?

This is going to be fixed in V2 using 
devm_reset_control_get_exclusive_deasserted().

>> +	if (IS_ERR(reset))
>> +		return dev_err_probe(dev, PTR_ERR(reset), "Failed to get reset control\n");
>> +
>> +	priv->clk = devm_clk_get(dev, NULL);
>> +	if (IS_ERR(priv->clk))
>> +		return dev_err_probe(dev, PTR_ERR(priv->clk), "Failed to get clock control\n");
>> +
>> +	subnode = of_get_compatible_child(dev->of_node, "synopsys,dwc3");
>> +	if (!subnode)
>> +		return dev_err_probe(dev, -ENODEV, "Failed to find DWC3 subnode node\n");
>> +
>> +	ret = of_property_read_string(subnode, "maximum-speed", &maximum_speed);
>> +	of_node_put(subnode);
>> +	if (ret)
>> +		return dev_err_probe(dev, -ENODEV, "Failed to determine maximum speed\n");
> 
> Why is maximum-speed a hard requirement? It should be optional.

Because we need to know whether or not the magic init code (please see 
dwc3_rcar_gen5_init() if (priv->use_usb3_flow) above) should be 
programmed into the glue registers.

>> +	priv->use_usb3_flow = !strcmp(maximum_speed, "super-speed-plus") ||
>> +			      !strcmp(maximum_speed, "super-speed");
>> +
>> +	ret = devm_pm_runtime_enable(dev);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
> 
> Do you really want this to be a hard error?

I think so -- why would it be beneficial if this wasn't an error ?

[...]

> Please use the new flatten glue model. The logic for this glue looks
> simple.

It is very simple -- enable clock, power domain, deassert reset, program 
the magic into glue registers and it is done and ready.

> Can you review and evaluate if we can enhance and whether we
> should use the dwc3-generic-plat glue driver for this?

Let me give this a try, I think this should be doable. Thanks !

-- 
Best regards,
Marek Vasut
