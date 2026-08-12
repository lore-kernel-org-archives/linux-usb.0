Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3DA37475C;
	Wed, 12 Aug 2026 19:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786563193; cv=none; b=dQzid24/PeYYiKptv9uOO+tQMxHgRoz79nPVVzQon+xCmWK84O0oEpNu9mDwsSW+dpfEKusO0iZraI8jXdJgS5RnfaXe/+nnmkdmbLlJKYX0wiBD1WG+kT/l/IjQ07Grh2Jpamr5KdGQN0a3Lp5jDpjKvgDvStNTkLqr5dva5MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786563193; c=relaxed/simple;
	bh=ftseWU0MmgHAln2DtkgjjMNJH2UeDNfQ3NnJ0PEy5ng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BKjU+vvJMgrpSr7HqQ8SmEEf5/WsWq7XvOLimR8QLkutMBBMvh426cUZnWbj6NXCjwpR3p6M3AZdzbS5VFHQCln7tbydcbezuMGCNvWgwdJjy9g9ecuscocA59WOk3wHOQKfdcmU1l4fZ7CBmu0iyVj5YbebfT8L0cy18iU+dQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=fGnrOCST; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="fGnrOCST"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8786311A705;
	Wed, 12 Aug 2026 21:33:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1786563185;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ED8eqHdTv64gQstfC56Ow6bZBOe8x1ePNie/0Y4oVZU=;
	b=fGnrOCSTNX2NlStNgvZoVWdpVAUR25aGrikNpgSdV49w063CUcRdklzwrUw0lXsfYzbLar
	BrcehqdHgDePwKkNLArWE3zazdl9BWMK+QSIk0HzCcixVgskQCh+UWKIyVz2Je+t7K5rzI
	ufSKA7pnRYl/J9/AkoadK2RQc1uHTMiq30zPZtOkemGNy4J7xRkQrBK/9r//7lOCWKdA3V
	KD0FGZ9C/nn4pgl+AJ6jEEFql6+HRySPbQ0HGOw8IhIuqeWGmJqTJjMZ7YiVOB1htEceaO
	Fr5MoprhMTjIgLJyIM0d3hLQaL4Xk3cV2UfPOIIF6OE12DZVqesaDb9aY0j3JA==
Message-ID: <ea21d4fb-04a1-4280-9a73-6f566be2b015@nabladev.com>
Date: Wed, 12 Aug 2026 20:30:33 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO
 PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-usb@vger.kernel.org, Pankaj Dev <pankaj.dev@st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Rahul Kumar <rahul.kumar05@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
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
References: <20260812010157.1772849-1-marex@nabladev.com>
 <20260812010157.1772849-2-marex@nabladev.com>
 <20260812-silky-omniscient-dalmatian-b268cb@quoll>
 <ff691741-a110-44e8-90e7-ac54a96de1af@nabladev.com>
 <ff957fbb-b8ed-485d-adaa-18258ed693a6@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <ff957fbb-b8ed-485d-adaa-18258ed693a6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/12/26 1:22 PM, Krzysztof Kozlowski wrote:
> On 12/08/2026 12:56, Marek Vasut wrote:
>> On 8/12/26 12:15 PM, Krzysztof Kozlowski wrote:
>>> On Wed, Aug 12, 2026 at 02:55:41AM +0200, Marek Vasut wrote:
>>>> From: Pankaj Dev <pankaj.dev@st.com>
>>>>
>>>> Document USB2 PHY for STM32MP25 USB2 controllers, which includes the
>>>> USB2.0 host-only controller and USB 2.0 part of the DWC3 controller.
>>>> Two such PHYs in total are present in STM32MP25 SoC, they both are
>>>> slightly different, therefore they use different compatible string
>>>
>>> What is slightly different? This should be either here, or better, in
>>> "description" part.
>>
>> They are both Synopsys FEMTO-PHY , but they are each attached to a
>> different controller (one to USB 2.0 host , the other to DWC3 DRD) , and
>> their control bits in the system controller register are different for
>> each variant.
>>
>> I extended the description in V2.
> 
> Depending on the actual difference, this rather belongs to the phandle
> to syscon, instead of separate compatible.

Modeling that in the phandle to syscon won't scale, the PHY driver is 
simple thus far and does not control all the bits in that syscon, if we 
were to somehow extend the phandle to syscon to describe the various bit 
mappings and differences in it, it would look awful quickly. Hence the 
separate compatible strings, so the driver can match on them, derive 
match data from them and use the match data to figure out differences of 
each instance.

>>>> to discern them.
>>>>
>>>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>>>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
>>>> Signed-off-by: Marek Vasut <marex@nabladev.com>
>>>> Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
>>>> Signed-off-by: Rahul Kumar <rahul.kumar05@st.com>
>>>
>>> Incomplete/incorrect DCO chain. Who sends it? Rahul?
>> This is lifted from the ST downstream kernel fork, it's a combination of
>> a bunch of commits there and then cleaned up. Pankaj and Fabrice did
>> most of the downstream work, I did the clean up for upstreaming. I
>> collected the SoB lines from all the commits from ST downstream fork and
>> added mine, hence this list. How shall I address this correctly, with
>> some Co-developed-by tag ? Who gets which tag ?
> 
> Everything explained in submitting patches. The SoBs represent the
> chronological lifecyle of the patch. Person sending the patch is
> obviously the last one touching. How Rahul could touch the code AFTER
> you sent it?
Fixed for all patches in V2, thanks.
