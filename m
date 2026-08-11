Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31418266B46;
	Tue, 11 Aug 2026 04:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786423720; cv=none; b=cY+QUD9kZLUCNx1+RAMVvP2lu30Y2ACVEq2Dk59EQKPC4jlJxIbwyOkFRm74/SdBK1lbBj+XZ0+5+AkTRlycl623HuWFuyl1xVD3Y/U9dloSaj+ICpat2VT+Iw811erhSVVvia1OunU1oFqUzhodlf/+rNrTRhx2/NNrH7JXcBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786423720; c=relaxed/simple;
	bh=uUVMtEb+ufbseU1gnFoaJRCwQsCphZJUQ2auD4sLi9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hXq5LpJRvEQCqc+tPGIpD6ZuVcLPy7WPF/Riy+CIwunyTYCMM12dhaqJAJB5k3ElDMeRMzjj7K5vRufVoin3AooO2O6meRBVD8IbHfVwqpuYtav/c8tJ0PImHipnoMAC4oFDCKVl3EUkRfSrorZ4pihbr0HlwedqOA0dsMR7GaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=S1BvD3UN; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="S1BvD3UN"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hJzf454TpzMlNS;
	Tue, 11 Aug 2026 06:48:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1786423708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3AtY33r4MVbEl55xX7fHnJYetW9OMHq7dKc20AHkeOA=;
	b=S1BvD3UNx7tem7A446esoB3R88Ihq6cb9M62aHhhAQytsBBt9YY0NeVw+dkmbA+SkZdOdy
	GM90I2Ry8WtbmHAPtZJvEtZLqLVzH/iIxX/bMgODG3vETPTuBNWBcmXTdXxM0qH9x6D3Nl
	5vmnccWzLvpKHJYPTIzHQjl7I32soue+wucaTcJLhRpL4bOqQ0dOrac25dkJTsdUvh6k0E
	omfJ08aL2Xf/Eq3Wr81MszmI21rPgDNVMISuXgcJu0qYeqGrLctntzRjasAMBZxxFl6sNc
	pWfsiTItcnVU2zxWx8w8OnQ0maCSr7TVHLMcEjfVpEB1K0DS//+PQ2XpMzl2Vw==
Message-ID: <d81fc021-d7d3-4b80-8bed-f1d9ada2b167@mailbox.org>
Date: Tue, 11 Aug 2026 06:48:24 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] usb: dwc3: dwc3-generic-plat: Add Renesas R-Car
 Gen5 DWC3 xHCI USB controller glue
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Thanh Quan <thanh.quan.xn@renesas.com>, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20260806050422.324435-1-marek.vasut+renesas@mailbox.org>
 <20260806050422.324435-2-marek.vasut+renesas@mailbox.org>
 <anZpZIW76RzmyiIi@vbox> <400a1d8c-3b71-4e73-b103-c6e6c518fa13@mailbox.org>
 <anpSU2q_jAssGb7_@vbox>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <anpSU2q_jAssGb7_@vbox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: b3m3af3rpsqj9o9yjjsiekwb3x8g6do3
X-MBO-RS-ID: 683d43e645adcf12a35

On 8/11/26 1:18 AM, Thinh Nguyen wrote:

>>>> +static int dwc3_renesas_rcar_gen5_init(struct dwc3_generic *dwc3g)
>>>> +{
>>>> +	struct device *dev = dwc3g->dev;
>>>> +	struct platform_device *pdev = to_platform_device(dev);
>>>> +	const char *maximum_speed;
>>>> +	bool use_usb3_flow;
>>>> +	void __iomem *glue;
>>>> +	int ret;
>>>> +
>>>> +	glue = devm_platform_ioremap_resource_byname(pdev, "glue");
>>>> +	if (IS_ERR(glue))
>>>> +		return PTR_ERR(glue);
>>>> +
>>>> +	ret = of_property_read_string(dev->of_node, "maximum-speed", &maximum_speed);
>>>> +	if (ret)
>>>> +		return dev_err_probe(dev, -ENODEV, "Failed to determine maximum speed\n");
>>>
>>> We shouldn't overload the generic "maximum-speed" definition.
>>>
>>> Can we check for the presence of the "usb3-phy" instead?
>> This could be made to work, but I don't think this would work nicely, please
>> see below.
>>
>> The Gen5 contains four DWC3 controllers, two are USB2-only and two are
>> combined USB2+USB3.2 ; the USB2-only controllers each use one PHY, the
>> USB2+USB3.2 controllers each use two PHYs -- one USB2 and one USB3 PHY.
>> -> The PHYs are always present and always connected inside the SoC, so I
>>     believe the PHYs should always be described in the SoC DT, and the
>>     DWC3 controller node should always have phandle(s) to its matching
>>     PHYs.
>>
>> The USB2-only controllers are a non-issue, there we could get away with
>> checking for the presence of "usb3-phy" and if this is missing in DT, apply
>> the magic code ("use_usb3_flow" is always false).
>>
>> It is the USB2+USB3.2 controllers that are more complicated. These
>> controllers can be downgraded to USB2-only mode. Currently, this is done via
>> this "maximum-speed" DT property, which, if set to "high-speed" or lower
>> triggers the application of the magic code. If the "maximum-speed" DT
>> property is "super-speed" or "super-speed-plus", the magic code is not
>> applied (this is the "use_usb3_flow").
>>
>> If we were to opt for checking for presence of "usb3-phy" , then the board
>> DTs (which include the SoC DT) for board which would require the USB2+USB3.2
>> controller to be downgraded to USB2-only mode would have to adjust the PHY
>> phandles of such controller DT node in board DT, which itself does not seem
>> right (DT describes the SoC hardware, and the PHY is still in the SoC and
>> connected to the controller, please see "->" above).
>>
>> That is why using "maximum-speed" is I think a bit better.
>>
>> But maybe there is yet another option that I missed ?
>>
>> Thank you for your help !
>>
> 
> I see.
> 
> My concern is that "maximum-speed" is a generic property that describes
> the maximum speed the controller is allowed to operate at. Per the
> binding, if it is not present the controller should default to its
> maximum HW capability.
> 
> Would this work for you? (Given that the usb3 phy phandle must be
> present)
> 
> 	if (!has_usb3_phy || maximum_speed <= USB_SPEED_HIGH)
> 		use_usb3_flow = false;
> 
> This way, "maximum-speed" retains its generic meaning as a speed limit
> rather than being used by itself to select Renesas specific flow.

This works nicely.

I will include a slightly reworked variant of this in V3.

Thank you !

-- 
Best regards,
Marek Vasut
