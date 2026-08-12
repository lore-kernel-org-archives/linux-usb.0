Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37CF409604;
	Wed, 12 Aug 2026 10:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786532205; cv=none; b=SdkrpMhcl3n2fm8jq28PmpV6mK+mCzxEZfDog+Iv5dXFVavvZUZcSpBQM5/ym+pc7ibF1D79DlHv/vCbuHp/wEdhggIPomMcfkn8+AJJOQr8QuTrF+w+eRVzSlnby6QCXNTpE5ZaU5HM024d/yWbwsctrZpDjw/xX5ECevntZI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786532205; c=relaxed/simple;
	bh=ghKVIjPtMIvrFmKE4qHgxxh8JNv3DqK2TfpV/oST5mg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PBSmn4wKUuw9JNAjntGVY3Gdr5/6QByIrPiGMrDVP6mxxSYC2QgeAX/oxI8th4t/cDzw6LnCMS5w1hV7kx1FNZo3wZm6a00x+ld2ntsbTgR2/UrEijRSQaBmguwlExFgrQmOkAplQjj+BarCQ/SjKNLlRcfVcXDk2PFKEO/Ud/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=QOW0fXqL; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="QOW0fXqL"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A540511BD66;
	Wed, 12 Aug 2026 12:56:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1786532190;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=H19yU3A8Y/XE4lULkPLRYtMwMnahPHyjUbEiZ8HBLXM=;
	b=QOW0fXqL5P+LZcOk9Ad1vvUrZiV5Z5pfpESJ6kJuuJNJ48yR27mMGD07nT3W9LZ9kfdCf9
	utUnTrFC0agBWlIICmuXyMDmcMklVISxPEYdZcoPVFDPGOgVycjbdxPhEZ4ffg3XojogaH
	ggKwhOSUHaGg4j6bFDQ2fqFIv9mSAh/9M/ECRxXTyMiMBbw31sLmwlmdSib6MTKbJNpFO3
	UR+K6p4wXJI7rN2WICoO8mSIvWiM37S4UWkhPz0Pfq4mS3azUfIRkhUwoW7wITbNCahWJd
	sySy6HHbbfSQw5lM4Cc3U6uVO/BcQwCo8fxJ6ShB+SOaRJaWYCxW0Y4Q6hj9rw==
Message-ID: <ff691741-a110-44e8-90e7-ac54a96de1af@nabladev.com>
Date: Wed, 12 Aug 2026 12:56:23 +0200
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
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260812-silky-omniscient-dalmatian-b268cb@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/12/26 12:15 PM, Krzysztof Kozlowski wrote:
> On Wed, Aug 12, 2026 at 02:55:41AM +0200, Marek Vasut wrote:
>> From: Pankaj Dev <pankaj.dev@st.com>
>>
>> Document USB2 PHY for STM32MP25 USB2 controllers, which includes the
>> USB2.0 host-only controller and USB 2.0 part of the DWC3 controller.
>> Two such PHYs in total are present in STM32MP25 SoC, they both are
>> slightly different, therefore they use different compatible string
> 
> What is slightly different? This should be either here, or better, in
> "description" part.

They are both Synopsys FEMTO-PHY , but they are each attached to a 
different controller (one to USB 2.0 host , the other to DWC3 DRD) , and 
their control bits in the system controller register are different for 
each variant.

I extended the description in V2.

>> to discern them.
>>
>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
>> Signed-off-by: Marek Vasut <marex@nabladev.com>
>> Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
>> Signed-off-by: Rahul Kumar <rahul.kumar05@st.com>
> 
> Incomplete/incorrect DCO chain. Who sends it? Rahul?
This is lifted from the ST downstream kernel fork, it's a combination of 
a bunch of commits there and then cleaned up. Pankaj and Fabrice did 
most of the downstream work, I did the clean up for upstreaming. I 
collected the SoB lines from all the commits from ST downstream fork and 
added mine, hence this list. How shall I address this correctly, with 
some Co-developed-by tag ? Who gets which tag ?

additionalProperties is addressed in V2, so is the reported from Rob's 
bot regarding the botched compatible string in example.

Thanks !
