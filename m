Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B8E3DF008;
	Tue, 18 Aug 2026 11:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787053395; cv=none; b=H52CxgWKPmq5V679+2gZDYeTzUg9J2YJ05mj8ZumzLYfAhlafhiA92JLc38N/CRIS3gH9oekG2kHte2XwBZQ2Z7kYHJLRd70QzxQ1mbNFNmkidTWOB9ifXgDn9NI9usahFy/DGTrI2dQMWOY8R7TQsgHi/sHCSjfAI/rFUxxNMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787053395; c=relaxed/simple;
	bh=p8uUw1EELMPA6+cusUPDVinRnmKRuMGt7TU7C6tgJ1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SsulO1eT6bt+DrU7cMxZK70uDgt2v3GHWlB53j9sU2K9ayCE9SA/NwRd/dg0XFC4CNYbjLWQsnDqiZCr2jyTlN1J4okyev7Z3O+VXMFHvz8kjei56l/JDSAY24jXrZXMOSkWcqZO538BN5CkkdiRSXAJZX34nUE26ZstOJ+s78M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=TkUwwvcA; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="TkUwwvcA"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E0F3011C00F;
	Tue, 18 Aug 2026 13:43:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787053387;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=9ZcN0w+bflhe6BRMhf9Wjukk4Z/S3kbcxpHbb9Y44iQ=;
	b=TkUwwvcAUXRRaxQI8sBMU9QIhZu4Qp/SPjiHNWps9dZ8EOKxynh+zjsyxh1VfduE7a4+rd
	B/G5e9L5nCec4TSqEkGe6RQi2TozkIXCm2c4eYm0mzHOSmTjaJEUF0cJk9ojpSx0L19hW8
	1VRKOspct39pI7cvMrYtFYTyDT6S0ClwLzlYpX10KxhCRxypYf5/CoZWWC9ZBY52w0ipWl
	cY6Xcazi1fRQ3sYKUsNwhzzLF/SYdhhPUdMmmcDY5lTuF1GC4P1g2KowduKJnetov+x0Mf
	m9VETLu60p8fgHa4vjCS8prShpAQSPrmpqzrtQcnHC0CfSnQWkT7NS/ohug59Q==
Message-ID: <0198d074-6fc8-45d4-9ef0-eac299ec9d82@nabladev.com>
Date: Tue, 18 Aug 2026 11:53:19 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] phy: stm32: Add support for ST STM32MP25
 USB2-FEMTO PHY
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-usb@vger.kernel.org
Cc: Pankaj Dev <pankaj.dev@st.com>, Rahul Kumar <rahul.kumar05@st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Rosen Penev <rosenp@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260816213849.1044073-1-marex@nabladev.com>
 <20260816213849.1044073-3-marex@nabladev.com>
 <e415f8de-f8dc-460d-80a9-5e1b2b34f8a8@foss.st.com>
 <f7b674b3-9490-453c-9eb9-96b19254d0a3@nabladev.com>
 <ed1d6988-251a-43d3-ba0e-aaa3e54ad07b@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <ed1d6988-251a-43d3-ba0e-aaa3e54ad07b@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/18/26 11:28 AM, Fabrice Gasnier wrote:

Hello Fabrice,

>>>> +static int stm32_usb2phy_enable(struct stm32_usb2phy *phy_dev)
>>>> +{
>>>> +    const struct stm32mp2_usb2phy_hw_data *phy_data = phy_dev->hw_data;
>>>> +    unsigned long rate;
>>>> +    int refsel, ret;
> 
> Hello Marek,
> 
> Just noticed refsel should be unsigned ?

It makes no difference in this case, since the value can be either 
0/1/2, but fixed.

>>>> +
>>>> +    /* Check if a phy is already init or clk48 in use */
>>>> +    if (atomic_inc_return(&phy_dev->en_refcnt) > 1)
>>>> +        return 0;
>>>> +
>>>> +    rate = clk_get_rate(phy_dev->phyref);
>>>> +    if (rate == 19200000)
>>>> +        refsel = 0;
>>>> +    else if (rate == 20000000)
>>>> +        refsel = 1;
>>>> +    else if (rate == 24000000)
>>>> +        refsel = 2;
>>>> +    else
>>>> +        return -EINVAL;

[...]

>>> As you mention the downstream driver, please see there a specific
>>> comment regarding the 2nd clock for OHCI:
>>> /*
>>> * USB2PHY provides several clocks used either by either USHB
>>> (EHCI/OHCI), OTG or USB3DR.
>>> * In case of OHCI, CMN bit must be cleared (clkohci_hw). This clock is
>>> required to access
>>> * the registers, to resume the controller from suspended state.
>>> * So declare two clocks, the PLL used in all case, and the OHCI clocks
>>> used by OHCI
>>> * controller.
>>> */
>> Is this what you have in mind ?
> 
> Yes, with one addition, please see next comment
[...]

>>   static int stm32_usb2phy_probe(struct platform_device *pdev)
>>   {
>> -    struct clk_init_data init = { .ops =  &stm32_usb2phy_clk48_ops };
>> +    struct clk_init_data clk48init = { .ops =  &stm32_usb2phy_clk48_ops };
>> +    struct clk_init_data clkcmninit = { .ops =
>> &stm32_usb2phy_clkcmn_ops };
> 
> clkcmninit should be a child of clk48 which basically represent the PLL
> (480MHz) as it is still needed as parent. See below.
> 
> BTW, mainly a nit: could rename clk48 to clkpll and update frequency to
> 480M.

Fixed in V3.

>> +    phy_dev->clk48_hw.init = &clk48init;
>>       ret = devm_clk_hw_register(phy_dev->dev, &phy_dev->clk48_hw);
>>       if (ret)
>>           return dev_err_probe(phy_dev->dev, ret, "Failed to register 48
>> MHz clock\n");
>>
>> -    ret = devm_of_clk_add_hw_provider(phy_dev->dev,
>> of_clk_hw_simple_get, &phy_dev->clk48_hw);
>> +    phy_dev->clkcmn_hw.init = &clkcmninit;
> 
> Would initialize with (to adapt) :
> 
> + phy_dev->clkcmn_hw.init = CLK_HW_INIT_HW(name, &phy_dev->clk48_hw,
> +					 &stm32_usb2phy_clkcmn_ops, 0);
> +
That's nice, also added to V3, thanks !

[...]
