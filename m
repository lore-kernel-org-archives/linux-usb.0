Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8F036F411;
	Wed, 26 Aug 2026 05:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787721853; cv=none; b=m+eD71DjSvZZARTk0f8osMeKl3t2ukCQUYoVTi4qDgtvsZJ+6c3RK9Bi8AR6WqMzv4jbnUCVcxrac1qqrzVOYtAj3tQojhqnDpCQWdwypxUC/MnCifARQuSGhOePapdUzmLhWQdUOjOurG88KnzcMtYPjieSJXENK3m3859jApM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787721853; c=relaxed/simple;
	bh=oO9E+8r+ZMGNs7fAE1Zxve1IX3zNEnFwfXvKKlJp5uk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R/jTSwW9vStd/PRhwrGUx3qIIMaPuwwoYfL2GxoLAXgabUl2xCmKw1vzVTiZJ4mP0LV7ySDuPdRPLe5lJS5TXz71kCUPK79JtBQPzqj2oH3tfhm1S9MBvBcpTCaA6sDqXhmAsmkQyOP43AbVFlTG4x9l6gq5AAaCHUi+Qh2DKP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=SgB5V+kV; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="SgB5V+kV"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 88B1711CD1B;
	Wed, 26 Aug 2026 07:23:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787721845;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=2WSTUnZav2cMaC3lE9hNS4oPzqnlu3+rzaCPWkt1SOA=;
	b=SgB5V+kVDU3Rbwyt5YDztBKpw5w3bCaY/NaJLEoUSnYv5RF8KkTsPjBLYgf6WdvrQQQRN6
	TQnxR6vFZIbXu2WU3XhLRdCGlZrrqeZqnYugUzR2UV5Db0/wyLEMw7amUYvf7tpO/vHVuZ
	M762/dVL8XjlfBvDQpj9KpdCetUnoxsV6+Yb/BlJp2d1+dV6S0/OMbIKMSYmEubTuOqMA2
	sneMy9vaW9ysQCMzPOnErbH37R9w8n1RF4njsV07UrOuphkasFnwSS9xazXtUaf/LycV9x
	8ay/Ta6w7KmkKX+Tj49TfiL576C7IfaXtDV+ImgUmJhC7qSTPhHoHsXGB93hug==
Message-ID: <75025cb5-20d8-4f80-98ad-77438b0fd5ef@nabladev.com>
Date: Wed, 26 Aug 2026 07:23:58 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] usb: dwc3: dwc3-generic-plat: Add ST STM32MP2 DWC3
 xHCI USB controller glue
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Pankaj Dev <pankaj.dev@st.com>,
 Rahul Kumar <rahul.kumar05@st.com>, Rob Herring <robh@kernel.org>,
 Rosen Penev <rosenp@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kernel@dh-electronics.com" <kernel@dh-electronics.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
References: <20260812010157.1772849-1-marex@nabladev.com>
 <20260812010157.1772849-7-marex@nabladev.com> <ao42hJmXCG9thL9J@vbox>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <ao42hJmXCG9thL9J@vbox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/26/26 2:44 AM, Thinh Nguyen wrote:

Hello Thinh,

>>   static const struct of_device_id dwc3_generic_of_match[] = {
>>   	{ .compatible = "spacemit,k1-dwc3", &spacemit_k1_dwc3},
>>   	{ .compatible = "spacemit,k3-dwc3", },
>>   	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
>>   	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
>>   	{ .compatible = "starfive,jhb100-dwc3", },
>> +	{ .compatible = "st,stm32mp25-dwc3", &stm32mp25_dwc3 },
>>   	{ /* sentinel */ }
>>   };
>>   MODULE_DEVICE_TABLE(of, dwc3_generic_of_match);
>> -- 
>> 2.53.0
>>
> 
> Did you compile test each patch? This one fails to include bitfield.h
> for FIELD_PREP().
I did, on arm64, hmmm. Let me explicitly include bitfield.h in V4 .

Thank you!
