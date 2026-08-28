Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F48B324B20;
	Fri, 28 Aug 2026 18:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787942201; cv=none; b=u6Ffa5sa6mM9LkS7s3ughdXzZCUOv98c3RJzD9CEc3lrlKci7WKXp3i6zaQuc5MuEr1gLYpSm2X5CIrYfaWQwpWzbavuGPxshpsKxBohlkf0r12Cm8ycQH/1yLgGd0yNK3FLPuhjqijroGIwZBRPTM5u7B5VIga0t8Ev5Amblx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787942201; c=relaxed/simple;
	bh=SgChGXTF6+svuhaYcXm+CKn01DLf7oO3St0UWdDtH40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uoapFENVknde676YMAwiun64biyqIoGBs72Oxg9bV4YISrxuc55lVFtzKtSZ3Crt+79zfUfiWLCR3MdIsoX5WihzA8UaUOUjjqr4hge4w4/UB4x0TQGd6psmcj7cuy0lctHTknGQq3MMqAY/X8fUbGwPRZLjnPxyuAMXvCsCunM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=o3jImI8t; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="o3jImI8t"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hWnCm3RVhzMlH1;
	Fri, 28 Aug 2026 20:36:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1787942196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OzfQSK2+UGnXzDk2dsk+p0rloTsTHUWjPWkurQ7agXI=;
	b=o3jImI8tHkAy2kqKC0SDY8yhrlJ7aLk7oJqIw0SLvicqPJK9VK3XYnV+Vw0b3lRnr44L7Q
	wDGn3oVnIg3IqsSMiBDo/xJlM1adGPZleRobsvBVut1fo4JRw3OOXfmViJL8TRhfo+8LPf
	oVBqm+YruUJ7VKYsg6KWKHc3c4gNxPusJ/ONvshXVV2rk6i5t4L176/4lIqJBYHSXQHpPV
	tCxMeNKyHeMhNVIBy+F2GVm6LB7KJlwEwMtNkDRAD6yIa9fbfWYYKIITZCgKZe7QMBXf5d
	7Hu6XiVeXzlZhI5Z3LZx9Idh6tO5TOT6pGBDj+1bBr/GssYhBAwp4ZMTQwbPXQ==
Message-ID: <d7444dd8-c94c-41ef-b5ab-52cb32313df7@mailbox.org>
Date: Fri, 28 Aug 2026 20:36:34 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 2/2] usb: dwc3: dwc3-generic-plat: Add Renesas R-Car
 Gen5 DWC3 xHCI USB controller glue
To: "Thinh.Nguyen@synopsys.com" <Thinh.Nguyen@synopsys.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260828182415.388367-1-marek.vasut+renesas@mailbox.org>
 <20260828182415.388367-2-marek.vasut+renesas@mailbox.org>
 <20260828183046.86F731F000E9@smtp.kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260828183046.86F731F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: scj5rozfmyz9deuquab5tzdxygd56985
X-MBO-RS-ID: 4e08508bb862e32e895

On 8/28/26 8:30 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Missing 'maximum-speed' DT property incorrectly forces the controller into USB 2.0-only mode, overriding PHY-based detection.
> --
> 
> commit 0727bb2cc9c155e4d5497db94c337bc5b2603464
> Author: Thanh Quan <thanh.quan.xn@renesas.com>
> usb: dwc3: dwc3-generic-plat: Add Renesas R-Car Gen5 DWC3 xHCI USB controller glue
> 
> This commit extends the generic DWC3 platform driver with glue logic for
> Renesas R-Car Gen5 USB controllers. It handles hardware initialization and
> evaluates PHY presence alongside device tree properties to determine maximum
> supported USB speeds.
> 
>> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
>> index ca69ac0eb07ce..3994a6d93b9de 100644
>> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
>> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
> [ ... ]
>> @@ -71,6 +71,55 @@ static int dwc3_eic7700_init(struct dwc3_generic *dwc3g)
>>   	return 0;
>>   }
>>   
>> +static int dwc3_renesas_rcar_gen5_init(struct dwc3_generic *dwc3g)
>> +{
>> +	struct device *dev = dwc3g->dev;
>> +	struct platform_device *pdev = to_platform_device(dev);
>> +	enum usb_device_speed speed = usb_get_maximum_speed(dev);
>> +	bool usb2only = false;
>> +	void __iomem *glue;
>> +
>> +	/* Wireless USB is not supported */
>> +	if (speed == USB_SPEED_WIRELESS)
>> +		return dev_err_probe(dev, -EINVAL, "Wireless USB not supported\n");
>> +
>> +	/* No USB 3 PHY in DT means this is surely USB 2 controller */
>> +	if (device_property_match_string(dev, "phy-names", "usb3-phy") < 0)
>> +		usb2only = true;
>> +
>> +	if (speed <= USB_SPEED_HIGH)
>> +		usb2only = true;
> 
> [Severity: High]
> Will this condition inadvertently force the controller into USB 2.0 mode when
> the maximum-speed property is missing from the device tree?
> 
> When the maximum-speed property is absent, usb_get_maximum_speed() returns
> USB_SPEED_UNKNOWN, which evaluates to 0. Since 0 is less than USB_SPEED_HIGH,
> this condition evaluates to true and unconditionally sets usb2only to true.
> 
> This appears to override the preceding logic that correctly checked the
> phy-names property to detect USB 3 capabilities. Could this cause hardware
> with a USB 3 PHY to be improperly downgraded to USB 2.0 mode?

Thinh, maybe I should restore the V4 conditional here ?
