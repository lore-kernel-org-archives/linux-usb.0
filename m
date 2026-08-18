Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA85437AA9C;
	Tue, 18 Aug 2026 16:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787070923; cv=none; b=nuwMr+9UzywMzFOvnuHctNSDlChdjZrCJzPJEC8iThMkXiBaRJWtPqpftUY4S2ji3pAgrCq7AlpY3/OnwJQUGhOltFaYNDlJ8mDPTPB+LEE/5pYsHmJqBysRhYTTwelwUvRHwj9v4fJJQuQPlN4IswcqlbrpLypG2h7MarBKbr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787070923; c=relaxed/simple;
	bh=hw10gIrcVssu6A8BkkQ4x2eyGQFgSpSmppcpntZNMu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=opgAKbBS0EMb1dmDtNxzBqIRq6enQ9ZFiVi9ltd3FbGmWYiuEu1DEG2rw6Dsn4aCW0Xl5gPIIvryvAPl9AQNls+o6m1tN8LrTnHSCFEu/7qnizIdHOc9AJmc7qkEpwrJhO2j5UxQHF6Nhx6Go5kDsnz/WixioQyyvpD+gD90J18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=MnfX7ENv; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="MnfX7ENv"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD10A11C32A;
	Tue, 18 Aug 2026 18:35:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787070915;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Q9v8GxHoF0StEQNyJKE2bkpAPrVfKbBQPYDkMVPC55o=;
	b=MnfX7ENvYLsquDvBDCL9P3OXOr3jnFJr7USPuU2Hs+kf4GAZjcFgqvsnDMgCDxTaOk3UtX
	VVxDi3GEFP2Hh56dXxIfbqI8z3zhSaWYwzgGN0cbHYyKjXHc9CMhricENuvCHedS75f8Ml
	IR0LRlF8PXlYTPqkx5nhp5c+4fs5/RJ68E8oBVIRErRx1CeiRRMMOJqPy9UiR8r7vs4Bdd
	8U/e8LYxcYmTrs5/ynA/h3LkM7GE/EkDz1LhdYVLFqOKVc0TCNSZMfKIITQkSQuPzAtw8K
	cqSVgVUqLldBb56IFffMOTdPsYlCZs7MqIj5dIKFpW3Erl88H7uOmErly04hwQ==
Message-ID: <d6064380-2368-4131-8cde-44734f67028f@nabladev.com>
Date: Tue, 18 Aug 2026 18:35:09 +0200
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
 <41e7978b-933d-4813-9158-00474f531476@nabladev.com>
 <6c900e6b-2f50-4ec2-aca4-3093479bba53@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <6c900e6b-2f50-4ec2-aca4-3093479bba53@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/18/26 6:07 PM, Fabrice Gasnier wrote:

Hello Fabrice,

>>> - On coming MP21 (not supported here), there's address translation
>>> control
>>
>> What kind of address translation ? IOMMU ?
> 
> This is much more "basic". The controller can address 4G of memory, e.g.
> it's 32bits. That feature is only for STM32MP21 that can address 4G of
> DDR which starts at 2G offset. So basically there's a SYSCFG bit
> (SYSCFG_USBHARCR AREN), that adds a 2G offset so the controller 'DMA'
> addresses directly the 4G of the DDR (instead of 2G lower memory map,
> that's not necessarily useful, and 2G of the 4G DDR, requiring swiotlb
> with perf penalty).
> 
> Current downstream glue driver checks the 'dma_range_map', (e.g. DT prop
> dma-ranges = <0x0 0x0 0x80000000 0x1 0x0>;) that represent this, to
> enable the syscon bit that adds offset in hardware (so 4G of DDR can be
> accessed by the controller, without swiotlb).
> For USBH, there's nothing mode: set it at probe time, based on
> dma_range_map, restore it after resume from low power.

Maybe the DT syscfg node shouldn't be a plain syscon , but rather there 
should be an actual driver which binds to the syscfg DT node and 
configures all these hardware details early on boot ? The USB controller 
drivers will start only later, when the syscfg configuration is already 
set in the hardware by this (future) driver, since they depend on the 
syscfg node and the PHY subnodes. Maybe that is the way to fix the MP21 
without having USB controller glue ?

>>> - Common dedicated interrupt to manage wakeup
>>
>> This is EXTI configuration, is it not ?
>>
>>> Using generic controller drivers, I don't see how to manage it, without
>>> describing it in the DT.
>>>
>>> For sure, generic ehci/ochi drivers and bindings can/must be used. What
>>> would be the proper place for this glue to leave ? Why not adding the
>>> glue driver from the downstream ? That's supposed to address this.
>>>
>>> Do you wish I send it upstream, so it can be properly reviewed, amended ?
>>
>> I would very much prefer to avoid the glue if that is at all possible.
>> Thus far, it seems this could be done (interrupts are generic interrupts
>> managed by EXTI, Vbus detection polarity is likely a PHY thing since
>> this is managed by SYSCFG anyway) ?
> 
> I better see your point, thanks for your explanation.
> This makes sense! For this part, the approach can be the same on all
> STM32MP2 SoCs (21/23/25).
> 
> Still for STM32MP21 address remapping feature (out of scope here) I
> think there will be not much choice to keep a minimal glue DT & driver
> (and parent to generic ehci/ohci). It seems totally out of the PHY
> driver purpose.
> Maybe you have some thoughts about this ?
Please see above.
