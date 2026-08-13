Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AFF396579;
	Thu, 13 Aug 2026 10:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786616256; cv=none; b=Kly1oZHHzQv/tn8Pg2G0KUfNUb5xS4ESF7Srk2BnqctGGRsUF8EdTMegvC23OlxTk8FPGmu7g9nNvJh/szDvHUMLZl9GSt1m9BjJ1aNTSaDCKr9qaI/1PbCV4KsetOX2n7BdBX2rTHTLBzi1HFBGvUAYwCkOJDlUCax3JZDAzkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786616256; c=relaxed/simple;
	bh=tuSKT5vnEGLzW3L1+Tg/g153UUo4Fo7bcNTh3Y87xTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RU/SI7i5cY6Dr1k4Y7xlpHt8iKv+aCWmGU8/F4tEDkEJEb3GBhIvlbXXpY667I9QRLUPOEExUrKnqV9cZ2CEHazV6O1nFtgMFrjCEC7OxoOobsrnFGb/J55SnwYlSIIsg+n/MZWkkP06LCTE+UI5M+BDB1gqx19I9ymtJeL7Hqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=UNgWn58Z; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="UNgWn58Z"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BE8F1112995;
	Thu, 13 Aug 2026 12:17:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1786616247;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=/BuHPpnzZHteKsYDuUbfARlxgNnfnDbxBH+K+gw6fwA=;
	b=UNgWn58Z7/RgRQnUiTN0w24Zxt47G2xD545mja3bMa1O29zmbIonUCe/pmi3b379YvLdnG
	D4wtCOg3j5fEz/XiYXbH1J8beRq6WTjZcKSkp6xen+e05mXvx6X/f1I2I5jZHGwUq9nMpO
	FCLTTZaYF7YiGNnxzamTK1yoFj8WgvixzW+6SQvpdOpNhlzSEQDNLssSebZrKEDxbv2RpF
	4ufPn+CO/Bm1HBtbf/XVl/AaJ2NRJtK8zo3KCWxyLXWxUUDAd2dFdKGeI50Zv3UJq+l2HL
	JVNCpsuXSwijoIhVBm1V40Du/rNbhB2bryA+PnRr/wXg9gu+wq/B7bM69TPFjg==
Message-ID: <9921697d-ea7a-42da-b172-54412082ec8f@nabladev.com>
Date: Thu, 13 Aug 2026 12:17:21 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO
 PHY
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org,
 Pankaj Dev <pankaj.dev@st.com>, Fabrice Gasnier
 <fabrice.gasnier@foss.st.com>, Rahul Kumar <rahul.kumar05@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rosen Penev <rosenp@gmail.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Vinod Koul <vkoul@kernel.org>,
 devicetree@vger.kernel.org, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260812010157.1772849-1-marex@nabladev.com>
 <20260812010157.1772849-2-marex@nabladev.com>
 <20260812-silky-omniscient-dalmatian-b268cb@quoll>
 <ff691741-a110-44e8-90e7-ac54a96de1af@nabladev.com>
 <ff957fbb-b8ed-485d-adaa-18258ed693a6@kernel.org>
 <ea21d4fb-04a1-4280-9a73-6f566be2b015@nabladev.com>
 <20260812225105.GB693080-robh@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260812225105.GB693080-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/13/26 12:51 AM, Rob Herring wrote:
> On Wed, Aug 12, 2026 at 08:30:33PM +0200, Marek Vasut wrote:
>> On 8/12/26 1:22 PM, Krzysztof Kozlowski wrote:
>>> On 12/08/2026 12:56, Marek Vasut wrote:
>>>> On 8/12/26 12:15 PM, Krzysztof Kozlowski wrote:
>>>>> On Wed, Aug 12, 2026 at 02:55:41AM +0200, Marek Vasut wrote:
>>>>>> From: Pankaj Dev <pankaj.dev@st.com>
>>>>>>
>>>>>> Document USB2 PHY for STM32MP25 USB2 controllers, which includes the
>>>>>> USB2.0 host-only controller and USB 2.0 part of the DWC3 controller.
>>>>>> Two such PHYs in total are present in STM32MP25 SoC, they both are
>>>>>> slightly different, therefore they use different compatible string
>>>>>
>>>>> What is slightly different? This should be either here, or better, in
>>>>> "description" part.
>>>>
>>>> They are both Synopsys FEMTO-PHY , but they are each attached to a
>>>> different controller (one to USB 2.0 host , the other to DWC3 DRD) , and
>>>> their control bits in the system controller register are different for
>>>> each variant.
>>>>
>>>> I extended the description in V2.
>>>
>>> Depending on the actual difference, this rather belongs to the phandle
>>> to syscon, instead of separate compatible.
>>
>> Modeling that in the phandle to syscon won't scale, the PHY driver is simple
>> thus far and does not control all the bits in that syscon, if we were to
>> somehow extend the phandle to syscon to describe the various bit mappings
>> and differences in it, it would look awful quickly. Hence the separate
>> compatible strings, so the driver can match on them, derive match data from
>> them and use the match data to figure out differences of each instance.
> 
> There's no 'reg' so the syscon is the only control interface, right?

Correct.

> So this should be child node of the syscon (with a reg property).
All right, will do in V2 (already done locally).

Thanks !
