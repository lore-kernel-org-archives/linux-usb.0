Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8F2379EC1;
	Tue, 18 Aug 2026 15:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787067165; cv=none; b=MNnRnpzY1i4eS0Ls0IWCBp8en0f7fUEyrFTcKY/4yxxrnvt0Yp1HaB8pTPG4MalgFC1NDKiCer1h8zcGmomusnO81iarLOMRDOcKaz5a6Y1ft5RvacgQTuqFULvj0UTezDaksjilBLk5/v56lsT7VpY2dqwLREJXiMhX3dWZ1Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787067165; c=relaxed/simple;
	bh=2SIxriES/9nIEpMjhXXn6lSxFQSb3q96EHvBMQDRcoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B2nQ3mZBPAnUckZAMxhVQ0s/UCUvmfUnwYKpNBVKhYj/4wptoC7Jrxzu63WgUhVlki3jRW4kD5tUvhE3cxAq32Un1fc18zx9PFKYDej2FlMECtYtcqd39dt3XiAPRV7uSN4KkEMTctevElLUCb6CN4c6uZr5j9M3iH9Eto09WtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=hI3zy/C6; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="hI3zy/C6"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 38B6211C3AE;
	Tue, 18 Aug 2026 17:32:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787067157;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=QTUdEbCWpwe+zSYfyY3xQj5u2o38iCy0bccw1CM5Sz8=;
	b=hI3zy/C6/lJshsIMX6klRZYiBs8m56O9bGcFehD2d7i3jC31g8Z/WHIehn3gXhXmWVv9xh
	sKBvwa5inPgSXeeRXk9BjJawHonCiR9R1Eum+R70x4fO3LoOfpNxffc37P/kw3w6Acaeg+
	NKNrHvrGgVxrgLuvcgBy6RVNJdfGq+aIPxFydHCkGY5z5RugwG+VD+lWqW17DAuyKfAVsr
	oYFMgq32SvlbpTdC64dh4wzEsy6m3NlJxpek1LAMaZJatumm/iw8rXKwhQtRQnxvUdPJtg
	6pdMl95iB+Ra8rt0otXfk//z4R47s2hf7FGisht519lDNaUAy1iWmSN5fxM0Yg==
Message-ID: <64c9e83c-5785-4f8c-89b5-5faee8269575@nabladev.com>
Date: Tue, 18 Aug 2026 17:32:35 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] dt-bindings: arm: stm32: Switch
 st,stm32mp23/25-syscfg into simple-mfd
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-usb@vger.kernel.org, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Christian Bruel
 <christian.bruel@foss.st.com>, Conor Dooley <conor+dt@kernel.org>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
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
 <20260816213849.1044073-8-marex@nabladev.com>
 <20260818-invisible-polar-cow-fb2a93@quoll>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260818-invisible-polar-cow-fb2a93@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/18/26 10:17 AM, Krzysztof Kozlowski wrote:

>> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
>> index 95d2319afe235..ef640443dd239 100644
>> --- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
>> +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
>> @@ -22,11 +22,12 @@ properties:
>>                 - st,stm32mp151-pwr-mcu
>>                 - st,stm32mp157-syscfg
>>                 - st,stm32mp21-syscfg
>> -              - st,stm32mp23-syscfg
>> -              - st,stm32mp25-syscfg
>>             - const: syscon
>>         - items:
>> -          - const: st,stm32-tamp
>> +          - enum:
>> +              - st,stm32-tamp
>> +              - st,stm32mp23-syscfg
>> +              - st,stm32mp25-syscfg
> 
> You never tested your code - DTS in this case. This clearly generates
> warnings.
I reran the checker and fixed them all now I hope, sorry.
