Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7302BE051;
	Sat, 29 Aug 2026 03:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787972524; cv=none; b=UzA7UFx31Bcuue87hUsI/vYWx8+DAqDVZJUB7wekv5ckUvm8DVOgb9pWMZGzGPcoBYgVItj2oEJKNCCn6IVfY/XXjfEdKjXSbbLmSQ7D/QP160H6PdASSDV7o9IilLnq8njZvVjapV33Nwjj88QK6/XiRS1eAlnQjp8rkCOt0lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787972524; c=relaxed/simple;
	bh=mnLQ/WGAzo65A18P+exTkUxMx59ytmSErq84FBWL/GQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iXzR2IlgN1dQsrMEcpT6lLPN0d8MstdLO4xvHbj/4hZxKiMInBbT8a9JrSNuFiNyKK9Yga4SxDbP1LFkR93yPZTvTvhz8NOLtmy1NrAUNlhwcZg6QooKGicXJDpgdsnoKq1QPD34JKMGXXbiL3YfwxopUdzVXCFLJftGYwk2J4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=NSsHhYLb; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="NSsHhYLb"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hX0Qt1X52zMlFd;
	Sat, 29 Aug 2026 05:01:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1787972518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KEpvTrRkGNgrRpP1fVC8+PhkXpNE6/mF7tJhzH5Aqb4=;
	b=NSsHhYLbQN3jLM3Poy/sAL9qgJ4DhirUaeuX0HYSND2XkBXIIRJdadIdkdQxnrpuQDLZo+
	12+SlCO+TcLqpzkn4UGz++8EZ6LFDhtRJsqHwurxV+NYjuqVbstGwbsNjdqHX7RNQ5ePED
	iqbZLiESMlXTngvvmd5q2GqmatkqPPh7SIYLXud0SMNvQT6r+MyGQDjN9bEGtYsGyQC1oo
	zVAgemUnOM1gkCwFhhK83lYOYMJgtdQkADdeI/6+MKIe/OabQfWcflrBNQa4sASnHnhWIG
	TGqZjVV19shskEyajHXq4j8m0TMqzrbk49bPoYrZo4OrayfJG63+WE7Lm2KsaQ==
Message-ID: <1fa4e305-5717-4a99-9e53-3a7fa1c5df1e@mailbox.org>
Date: Sat, 29 Aug 2026 05:00:11 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 2/2] usb: dwc3: dwc3-generic-plat: Add Renesas R-Car
 Gen5 DWC3 xHCI USB controller glue
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>
References: <20260828182415.388367-1-marek.vasut+renesas@mailbox.org>
 <20260828182415.388367-2-marek.vasut+renesas@mailbox.org>
 <20260828183046.86F731F000E9@smtp.kernel.org>
 <d7444dd8-c94c-41ef-b5ab-52cb32313df7@mailbox.org> <apIGMJ6wveRRRMCv@vbox>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <apIGMJ6wveRRRMCv@vbox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: fey1k9o8r38j5izd957d3p689emwihrs
X-MBO-RS-ID: ba9a0ad98c3133f6e42

On 8/29/26 12:40 AM, Thinh Nguyen wrote:

Hello Thinh,

> On Fri, Aug 28, 2026, Marek Vasut wrote:
>> On 8/28/26 8:30 PM, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>>> - [High] Missing 'maximum-speed' DT property incorrectly forces the controller into USB 2.0-only mode, overriding PHY-based detection.
>>> --
>>>
>>> commit 0727bb2cc9c155e4d5497db94c337bc5b2603464
>>> Author: Thanh Quan <thanh.quan.xn@renesas.com>
>>> usb: dwc3: dwc3-generic-plat: Add Renesas R-Car Gen5 DWC3 xHCI USB controller glue
>>>
>>> This commit extends the generic DWC3 platform driver with glue logic for
>>> Renesas R-Car Gen5 USB controllers. It handles hardware initialization and
>>> evaluates PHY presence alongside device tree properties to determine maximum
>>> supported USB speeds.
>>>
>>>> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
>>>> index ca69ac0eb07ce..3994a6d93b9de 100644
>>>> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
>>>> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
>>> [ ... ]
>>>> @@ -71,6 +71,55 @@ static int dwc3_eic7700_init(struct dwc3_generic *dwc3g)
>>>>    	return 0;
>>>>    }
>>>> +static int dwc3_renesas_rcar_gen5_init(struct dwc3_generic *dwc3g)
>>>> +{
>>>> +	struct device *dev = dwc3g->dev;
>>>> +	struct platform_device *pdev = to_platform_device(dev);
>>>> +	enum usb_device_speed speed = usb_get_maximum_speed(dev);
>>>> +	bool usb2only = false;
>>>> +	void __iomem *glue;
>>>> +
>>>> +	/* Wireless USB is not supported */
>>>> +	if (speed == USB_SPEED_WIRELESS)
>>>> +		return dev_err_probe(dev, -EINVAL, "Wireless USB not supported\n");
>>>> +
>>>> +	/* No USB 3 PHY in DT means this is surely USB 2 controller */
>>>> +	if (device_property_match_string(dev, "phy-names", "usb3-phy") < 0)
>>>> +		usb2only = true;
>>>> +
>>>> +	if (speed <= USB_SPEED_HIGH)
>>>> +		usb2only = true;
>>>
>>> [Severity: High]
>>> Will this condition inadvertently force the controller into USB 2.0 mode when
>>> the maximum-speed property is missing from the device tree?
>>>
>>> When the maximum-speed property is absent, usb_get_maximum_speed() returns
>>> USB_SPEED_UNKNOWN, which evaluates to 0. Since 0 is less than USB_SPEED_HIGH,
>>> this condition evaluates to true and unconditionally sets usb2only to true.
> 
> Right. I missed that.
> 
>>>
>>> This appears to override the preceding logic that correctly checked the
>>> phy-names property to detect USB 3 capabilities. Could this cause hardware
>>> with a USB 3 PHY to be improperly downgraded to USB 2.0 mode?
>>
>> Thinh, maybe I should restore the V4 conditional here ?
> 
> Sure

I did that in V6.

>, but please drop the speed == USB_SPEED_WIRELESS check. This sanity
> check is not necessary and would be flagged by dwc3 core if set anyway.
Could you please point me to the code which filters the WIRELESS USB out 
? I can't seem to find it in either DWC3 core or USB core, but maybe I 
am not looking for the right thing.

Thank you for your help !
