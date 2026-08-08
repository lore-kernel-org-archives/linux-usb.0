Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5883B1B3;
	Sat,  8 Aug 2026 04:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786162561; cv=none; b=n2hZRtiJBb5UYigfQQ+3TLLgoZXqYkcLvToJVbNhsjGYd+qYHrf4BtEREmj0CXnX342yZxPbXHcB2Qw7qNXywPFFN8kEY9Agzs1xFqR4yNndoiplMkNNiPPsvGFj80w1de6yM0QxxlRUQ02mBjo+9kBwdmVyrXxQqpEN5v6aUQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786162561; c=relaxed/simple;
	bh=02OaB5oVzZu5W6eHZ7Ud7mp+EZolwWRoJyNcWM4XJJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qpKJpfvDcmRuUZ1seAzjuv8L66wka9ZoV6r7d7loGXd0mjNeIIKAaVbUVVLUs+Ii7aGe2NGhk/NcoNFOfz1gaf9/nl7Y8okgMuV4ldfSXoFbUv6WFRQGBTd4WUvXcQzGoOcBzhhMa5sKW4GfEO1ZWLTK86CIqkr+kGFqFCIwl1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=cxJVcFlN; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="cxJVcFlN"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4hH73n6sC4zKmks;
	Sat, 08 Aug 2026 06:15:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1786162549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uddTzLS6mhU1Grqr/5fazKknmHmClN6UsXV87q0dfTY=;
	b=cxJVcFlNXBO3hAid91aNjQXFGCvh4bWQ7rc0os1j8YrK8scJckgZaOlO0dmVinaIxLRgp0
	neCIT54Y92KbndaBM2UJpdGEJ0NjqchRRaNejaYAa7MYgQ57FB9tOBd8dEt646uXPo3vxi
	wa/5pkPuzt7s0fIwJXPnyCPPiqR6hIS5AeOybCRHtb6WYM9FV5+6v+Xky9dE7CB6i60Nku
	pk4bqZeNmNggJK7e3laHZaiaxYTY5JZ0u0YhvHfrxfBvjaiS8+dQLGhFlwcH2NybV/1KLn
	vEY8a7R1pvq0LZq/d3zVwoeHyJOO5GvY76pd/FPkkTOh73/gZjBDBp9LnXuifQ==
Message-ID: <400a1d8c-3b71-4e73-b103-c6e6c518fa13@mailbox.org>
Date: Sat, 8 Aug 2026 06:15:46 +0200
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
 <anZpZIW76RzmyiIi@vbox>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <anZpZIW76RzmyiIi@vbox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 5jqa9wibpk3jxu6cocjwjfc4x11ce4kk
X-MBO-RS-ID: 95ff7b48c0a9cc68fa3

On 8/8/26 1:31 AM, Thinh Nguyen wrote:

Hello Thinh,

>> The Renesas R-Car Gen5 SoC contains multiple instances of DWC3 USB
>> controller with glue logic wrapper around them. Extend the generic
>> DWC3 platform driver with Renesas R-Car Gen5 glue logic specifics.
>>
>> Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

[...]

>> V2: Extend dwc3-generic-plat driver instead
> 
> Great! This seems to fit in nicely for dwc3-generic-plat.

Indeed, this is nice.

[...]

>> +static int dwc3_renesas_rcar_gen5_init(struct dwc3_generic *dwc3g)
>> +{
>> +	struct device *dev = dwc3g->dev;
>> +	struct platform_device *pdev = to_platform_device(dev);
>> +	const char *maximum_speed;
>> +	bool use_usb3_flow;
>> +	void __iomem *glue;
>> +	int ret;
>> +
>> +	glue = devm_platform_ioremap_resource_byname(pdev, "glue");
>> +	if (IS_ERR(glue))
>> +		return PTR_ERR(glue);
>> +
>> +	ret = of_property_read_string(dev->of_node, "maximum-speed", &maximum_speed);
>> +	if (ret)
>> +		return dev_err_probe(dev, -ENODEV, "Failed to determine maximum speed\n");
> 
> We shouldn't overload the generic "maximum-speed" definition.
> 
> Can we check for the presence of the "usb3-phy" instead?
This could be made to work, but I don't think this would work nicely, 
please see below.

The Gen5 contains four DWC3 controllers, two are USB2-only and two are 
combined USB2+USB3.2 ; the USB2-only controllers each use one PHY, the 
USB2+USB3.2 controllers each use two PHYs -- one USB2 and one USB3 PHY.
-> The PHYs are always present and always connected inside the SoC, so I
    believe the PHYs should always be described in the SoC DT, and the
    DWC3 controller node should always have phandle(s) to its matching
    PHYs.

The USB2-only controllers are a non-issue, there we could get away with 
checking for the presence of "usb3-phy" and if this is missing in DT, 
apply the magic code ("use_usb3_flow" is always false).

It is the USB2+USB3.2 controllers that are more complicated. These 
controllers can be downgraded to USB2-only mode. Currently, this is done 
via this "maximum-speed" DT property, which, if set to "high-speed" or 
lower triggers the application of the magic code. If the "maximum-speed" 
DT property is "super-speed" or "super-speed-plus", the magic code is 
not applied (this is the "use_usb3_flow").

If we were to opt for checking for presence of "usb3-phy" , then the 
board DTs (which include the SoC DT) for board which would require the 
USB2+USB3.2 controller to be downgraded to USB2-only mode would have to 
adjust the PHY phandles of such controller DT node in board DT, which 
itself does not seem right (DT describes the SoC hardware, and the PHY 
is still in the SoC and connected to the controller, please see "->" above).

That is why using "maximum-speed" is I think a bit better.

But maybe there is yet another option that I missed ?

Thank you for your help !

-- 
Best regards,
Marek Vasut
