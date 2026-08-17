Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555BA353A63;
	Mon, 17 Aug 2026 23:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787011144; cv=none; b=EOkAzPGti47kLNmEDa0cdzPPWI3I0xuMQGMTpmU/AVS0r6eezfoyViu9mfOETOU8oO69wpeBiZYd3AJP2a7PuvD8KkO5st0aVbLq7wS/pWrtTrQCjHJGVPQSgvMBlSSlszCe0oLFSYPLoRbqh49wqG82B0L5Mlj4p/oO1KyMZGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787011144; c=relaxed/simple;
	bh=WhnsRzWHc0S5v9CpFed408Wqe8KuQr38NWe4DWGjBrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jyog81OVc5zFIMobYd+W9m/iMr3kJDB4cPp1oHIymdhOdF0vocE8UPR08n04xKB5JU7H5qnl56YY30tArvqiYJ2mj/tF1AFk+3qphkiyV+C7xqvpIVnMlVoXKUDQtz9vGOST82lURHugpFA99XgOlqmbCapEgYOACmzfvksYyCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=NQq11MPz; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="NQq11MPz"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BEC8311C29E;
	Tue, 18 Aug 2026 01:58:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787011129;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=AtrN3lAWZAKRJ2tUbDwmP+q7qFhyr1LIxuBeZrAeC18=;
	b=NQq11MPzUYMsWwlx4ZJXP3+g2y/P9YUC8LLnnIx7p3n1/Sa5qThgBEen1VL9zF3wSQoeHi
	DEngtzK8KRebR8vv/MWIpWpzVF0fjb1M5d/eJijs1Y43cZNQV8aBRcIa4LXeXBwMRogKoL
	fzdwLE3V9zLf7SNuJdlF8bFZJwP29/cFHkYa/tNjU9VfVebb44QfHjQ3y1YUwJefbEvMJt
	qOs8SPJqcS2M+E5cnC0JrbgP6F7O6QId/UINbPRqTsoV8pDRHGSCW9kVGb2+G0KfRfqcqi
	HDE+ZVfyfkwHI6NoerKC0krpVcOtYo2VD/g95HZ4kmStFmvSkMlYFE4Z67adkA==
Message-ID: <d55b75da-d86d-41c0-95c6-9a6627599244@nabladev.com>
Date: Mon, 17 Aug 2026 20:50:43 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] arm64: dts: st: Add USB nodes on stm32mp231
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-usb@vger.kernel.org
Cc: Pankaj Dev <pankaj.dev@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rahul Kumar <rahul.kumar05@st.com>, Rob Herring <robh@kernel.org>,
 Rosen Penev <rosenp@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260812010157.1772849-1-marex@nabladev.com>
 <20260812010157.1772849-8-marex@nabladev.com>
 <8161b556-7ea5-4d5f-a8cc-12a71c850aa1@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <8161b556-7ea5-4d5f-a8cc-12a71c850aa1@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/17/26 6:23 PM, Fabrice Gasnier wrote:
> 
> On 8/12/26 02:55, Marek Vasut wrote:
>> Add USB controller and PHY nodes to stm32mp231 DT.
>> This includes two USB 2.0 FEMTO PHYs, USB 2.0 host
>> controller and DWC3 DRD controller nodes. Include
>> missing COMBOPHY for the USB 3.0 controller.
> 
> Hi Marek,

Hello Fabrice,

> There's no support for the combophy on STM32MP23.
> It means USB3DR can be used in High Speed maximum.
> Please check the datasheet.

Dropped

>> +				interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>;
>> +				phys = <&usb2_phy2>, <&combophy PHY_TYPE_USB3>;
>> +				phy-names = "usb2-phy", "usb3-phy";
> 
> Please update USB2.0 PHYs and speed:
Fixed in V3, thanks !
