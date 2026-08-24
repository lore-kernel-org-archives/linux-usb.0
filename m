Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF62B7E105;
	Tue, 25 Aug 2026 09:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787651267; cv=none; b=jXt5g9FOvo8IrrjMr5C0X1D4m4CfzLwG7Fmigh+icIEE+ZfmzTCZ3+Qtyyx2dhxQ5UFXcDVLGd+FCyiYkOoQIstdlGrRYKn2xM4jA4NqJp6NSLf1dL2hoeBvatCOkjjf9YHlPWslVFD3Wyfj1nkDxZfWf/XAxVztAEnzctieWLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787651267; c=relaxed/simple;
	bh=BQqsQnNyYyzJPg9xIDpafuByotDQ8EScOhwlC18fwOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aybmat01slvhLbOVtUi6pQ0nlKIpYZ3UftzNR+a5zUBZjeMkLAArAF5iySdFisFFFvVjkbXFZhpjLYgrqCD3rNqLqdz8+3sLDbdd60JAQxOsgA29Ip9oa7QlQyT+TAZw+BvDym/4hp7czqz7rNwOndggImhNpLeBMBZDkKzoOXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=KA41FsLo; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="KA41FsLo"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 879F911CBA7;
	Tue, 25 Aug 2026 11:47:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787651259;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=qWzWWNS42exc7ZHN0500c9MV5vEAEMaWiWpVREU3tJ0=;
	b=KA41FsLojocrPYcAPQ5ThUy7TmZo41kwn3HTeEpM3yq9L9aybF5GosZV+tHWUWNxBGFKzw
	TpJ0BPMsvZ+3AO62YXUCEXwEZipbVfJXnFIvwuexTFpsNpU8VgyLRhSt8idP/V2ySY9FLG
	xldTKRU2LSnYLrqKot9/CtG2GkQED4xj3mETtSFq920LoQztVtUA/tym0aWimuSS7UJeSh
	MPK29nwryWqkv14eupeLr4h8ORuKk7v4lZ9kXGCrb3Ip/sgd7DF4OUY3tswdTLNVgffWmw
	3d7qxqAVB++fBBBu8lrxpqjL19gYcl7irm1t8nuyMZpe/g7uio7CQlBO2HBozw==
Message-ID: <ec43c68d-7f68-4ad0-9bfc-2b6dc0c5ec14@nabladev.com>
Date: Mon, 24 Aug 2026 16:39:23 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] arm64: dts: st: Add USB nodes on stm32mp231
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-usb@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Francois Choleau <francois.choleau@st.com>,
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
References: <20260822074816.548662-1-marex@nabladev.com>
 <20260822074816.548662-9-marex@nabladev.com>
 <a77b459f-5b08-453a-a247-c320617beee6@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <a77b459f-5b08-453a-a247-c320617beee6@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/24/26 3:18 PM, Fabrice Gasnier wrote:

[...]

>>   		syscfg: syscon@44230000 {
>> -			compatible = "st,stm32mp23-syscfg", "syscon";
>> +			compatible = "st,stm32mp23-syscfg", "syscon", "simple-mfd";
>>   			reg = <0x44230000 0x10000>;
>>   			#clock-cells = <0>;
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +
>> +			usb2_phy1: phy@2400 {
>> +				compatible = "st,stm32mp25-usb2phy1";
>> +				reg = <0x2400 0x24>;
> 
> Hello Marek,

Hello Fabrice,

> The size 0x24, covers the PHY control, trimming and vbus control logic
> for PHY1 (USBH). So this allows to later extend the driver for that, right ?

Correct.

>> +				#phy-cells = <0>;
>> +				#clock-cells = <1>;
>> +				clocks = <&rcc CK_KER_USB2PHY1>;
>> +				resets = <&rcc USB2PHY1_R>;
>> +				status = "disabled";
>> +			};
>> +
>> +			usb2_phy2: phy@2800 {
>> +				compatible = "st,stm32mp25-usb2phy2";
>> +				reg = <0x2800 0xc>;
> 
> Then here, I guess the size should cover also trimming regs ? e.g. 0x10 ?
> 				reg = <0x2800 0x10>;
Uh, yes, fixed in V4, thanks !
