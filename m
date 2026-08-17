Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EAC353A63;
	Mon, 17 Aug 2026 23:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787011148; cv=none; b=BCD8NJuMHoWs8zoNo2CjD/38khFnijuqYun6xE8CDXOdgWH1cj1BXKBLhuNtUx9DHBwDSBNf/0tRikdBoHKTKkk2u89qBidxA75WvBdCIxkWu3Qh14oeM0aVX88o5ays6apxRQFs86b9PQYc9h1JOA+TpFbtYjdITi5YaQl9iDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787011148; c=relaxed/simple;
	bh=q+J/H6sHE4nDtXQAWSPuw8JjGxx+5heuvubufxb7M/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vb44SY4VAAP+EDioNCKX+QbKOXG2mTY4v4ndXSBCrXG65/xE4gwnWY5tE82dg1Gqd2Ysli1Imvng/iQE9G8V/WS+FK8oTRUOIfb+r62ZasFHEILO/jfhHloWpQTRUtIUoQ9sd46pfknVALYg4P5P33gAt6yV6ONaoKXU6btcuNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=doc8GAvU; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="doc8GAvU"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B3C7A11C31A;
	Tue, 18 Aug 2026 01:58:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787011141;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=s5KA4b6Nzoo36ubzR9I6KxJ83F3i3nPCmuwn73fogoU=;
	b=doc8GAvUAAXUcq/v3aPgSkOK8+gMFCYu/cHimh6rBUBoZmCby9eRWCEqjDt2N+9XuAOnqt
	cW2662RC+EuSuNkmkf3XZgcr2pLjHZTQEXCB7LClrnR1bK5lXNY909cm0dED8M2TGpMkh3
	lD3z6DGQmRIWNaBom4IYrKg7sVo5C17FbF95kCtRUJ/Y+Nq1VwwoaTtM4Z9szIJPPm4OHi
	1qMe4TH02WvZmLj1MwpPzrbPqV5SaQpXeKFmiHDsyFwBp3uJEbpI5yEmy9RVDMpnQNrim8
	+fHuyqZwGdAU+sxnWeOdyX4FiKI84kRLrOvaRJe/0ss+dkMPfXfOiFK47SUqkQ==
Message-ID: <41e7978b-933d-4813-9158-00474f531476@nabladev.com>
Date: Mon, 17 Aug 2026 21:48:09 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] arm64: dts: phy: st: usb: Add STM32MP2 USB support
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-usb@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Pankaj Dev <pankaj.dev@st.com>,
 Rahul Kumar <rahul.kumar05@st.com>, Rob Herring <robh@kernel.org>,
 Rosen Penev <rosenp@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260816213849.1044073-1-marex@nabladev.com>
 <61dc785c-bea1-4674-918d-0f38ea253a29@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <61dc785c-bea1-4674-918d-0f38ea253a29@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/17/26 6:35 PM, Fabrice Gasnier wrote:
> 
> On 8/16/26 23:37, Marek Vasut wrote:
>> Add USB support for STM32MP23xx/STM32MP25xx SoCs. This includes USB 2.0
>> FEMTO-PHY driver, DWC3 glue code and DT adjustments. Parts of this are
>> taken from ST downstream kernel fork, reduced, or rewritten, since not
>> all of the content there was useful and bits which might be missing and
>> are useful can be added later.
>>
>> Unlike the downstream implementation, the DWC3 glue code is using plain
>> dwc3-generic-plat, the EHCI and OHCI controllers are instantiated as
>> plain generic controllers without any wrapper glue driver, and the USB2
>> PHY driver is simplified.
>>
>> Both USB 2.0 Host controller and DWC3 super-speed controller are tested.
> 
> Hi Marek,

Hello Fabrice,

> Regarding dwc3, I've started to test and needed another patch from our
> downstream. I've posted it here:
> https://lore.kernel.org/linux-usb/20260817163101.6203-1-fabrice.gasnier@foss.st.com/

Understood.

> Regarding USBH, there's a dedicated glue on STM32MP2x SoCs for the
> EHCI/OHCI controllers, similar to the dwc3. On dwc3, I see it can be
> managed.
> 
> There are:
> - AFMUX signals out of EHCI/OHCI controllers, to manage a Vbus power
> switch (with polarity) control.
> - AFMUX need pinctrl to be added, and managed during system PM

This can be managed by the PHY instead, can it not ?

> - On coming MP21 (not supported here), there's address translation control

What kind of address translation ? IOMMU ?

> - Common dedicated interrupt to manage wakeup

This is EXTI configuration, is it not ?

> Using generic controller drivers, I don't see how to manage it, without
> describing it in the DT.
> 
> For sure, generic ehci/ochi drivers and bindings can/must be used. What
> would be the proper place for this glue to leave ? Why not adding the
> glue driver from the downstream ? That's supposed to address this.
> 
> Do you wish I send it upstream, so it can be properly reviewed, amended ?

I would very much prefer to avoid the glue if that is at all possible.
Thus far, it seems this could be done (interrupts are generic interrupts 
managed by EXTI, Vbus detection polarity is likely a PHY thing since 
this is managed by SYSCFG anyway) ?

> I'd like to sort this glue management out before the DT for the USBH can
> land.
ACK

[...]
