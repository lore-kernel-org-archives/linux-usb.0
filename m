Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D8E3612EE;
	Tue, 18 Aug 2026 15:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787067109; cv=none; b=HkWxR5Xbqdjuwn8MSF0BWbpHqAuTBP6rx58mO8MpHx/xLih12e8eUyui91QRoI9Hc/c2KBehQ2zswwpST2nzsvY+5FHVzWklgjwqsLxtIBYRAdu7Pc5cJ+NkipJ26i3LY6wbraJ/jK8eGwuwPz9ssa/ln8dBOBVAbiHL0auoWA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787067109; c=relaxed/simple;
	bh=B+0TIStopsZj7xcVHaX2q7mUv0xte6pFPz8dglkHNhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NNcj8EkJ8AVUfh0I+6A5Iry6+fIhqHwWcfRQGNWdXKfjUBKyA+Adi79ci92x/uA37xwXW5cyco0hbM7JdJmjOahHNVJnlRwCNJHTRMeg6zfQsCWv7sjdNmAFyUYEi2pn9o3OujmoQ3z9ke55QTKT5/18XC1OmzJComkAUy7UN1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=Vx6FSmEB; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="Vx6FSmEB"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CB4E411B470;
	Tue, 18 Aug 2026 17:31:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787067101;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=BErwctM4A7kxtwrjZRz1X5U4oldam1I7GBohsfgr2L8=;
	b=Vx6FSmEBNh0N1N/YLOwOElJGTLiHSvmUgwUDdb3vM5wJkLLBdaMgsNGGSIX6AETHcgBLS7
	Y/vFdp9o1ZB0G+0Qt7aGEEZdHsz0uEaD0/+AThG9/SBthG4or4qe4C1iTsO7phXy43bnc3
	oWiUtcWbMsunQR/VxEx8k/JEcCaMqwqG4y7AjzB+jjVcruWW0mLCXolBtaOsEr6KjNBYOa
	MiwZuJqj6mWBmnEbzKLALNlnIP22rcaskearR9Snkg+n0kOXZgAPPnXTLMH2dFxiaE5r86
	NGN3eUVvRUbRkkZUaM8UB5Cm+BDldbuXZ7Dpt7/lioy1HZpcRl6nFaS6S7uEXw==
Message-ID: <90397158-8119-46fc-9597-fb80846fc18d@nabladev.com>
Date: Tue, 18 Aug 2026 17:31:34 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] dt-bindings: usb: dwc3: Document ST STM32MP2 DWC3
 xHCI USB controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-usb@vger.kernel.org, Pankaj Dev <pankaj.dev@st.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
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
References: <20260816213849.1044073-1-marex@nabladev.com>
 <20260816213849.1044073-6-marex@nabladev.com>
 <20260818-brainy-burgundy-monkey-fc2a0d@quoll>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260818-brainy-burgundy-monkey-fc2a0d@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/18/26 10:15 AM, Krzysztof Kozlowski wrote:
> On Sun, Aug 16, 2026 at 11:37:07PM +0200, Marek Vasut wrote:
>> +properties:
>> +  compatible:
>> +    const: st,stm32mp25-dwc3
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  access-controllers:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    minItems: 3
>> +    maxItems: 3
>> +
>> +  clock-names:
>> +    items:
>> +      - const: ref
>> +      - const: bus_early
>> +      - const: suspend
>> +
>> +  dr_mode:
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    enum: [host, peripheral, otg]
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  phys:
>> +    minItems: 1
>> +    maxItems: 2
>> +
>> +  phy-names:
>> +    minItems: 1
>> +    items:
>> +      - const: usb2-phy
>> +      - const: usb3-phy
>> +
>> +  resets:
>> +    minItems: 1
> 
> Hm? You keep coming with some odd style, not present in any other files.
> Where do you see such code - property followed by minItems alone? This
> applies to other places as well.

This should clearly be maxItems: 1, fixed, thanks .

>> +
>> +  st,syscfg:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description: Phandle to system configuration controller.
>> +    items:
>> +      - items:
>> +          - description: phandle to syscfg
>> +          - description: USB3DR control offset within syscfg
>> +
>> +  st,enable-port-power-control:
>> +    type: boolean
>> +    description: Enable Host-Mode Port Power Control (bit-3 of capability param HCCPARAMS)
> 
> Why wouldn't this be enavled always? Why is this a board-level property?

A board can have external USB power controller chip like TCPP02/TCPP03 
and the DWC3 IP does not control the port power directly. This seems to 
be common on the STM32MP2 . Hence this property, which disables the port 
power control functionality in DWC3 IP and lets the chip do it instead.

>> +
>> +  st,ovrcur-active-low:
> 
> Don't re-invent stuff:
> st,over-current-active-low

It seems I can even use generic "over-current-active-low" .

>> +    type: boolean
>> +    description: Over-Current signal polarity is active-low
>> +
>> +  st,vbusen-active-low:
>> +    type: boolean
>> +    description: VBUS-ENABLE signal polarity is active-low
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +  - phys
>> +  - phy-names
>> +  - resets
>> +  - st,syscfg
>> +
>> +unevaluatedProperties: false
> 
> So where did you reference any other schema - for properties here and
> for this unevaluatedProps?

I seem to be getting this one wrong all the time, so let me ask -- when 
do I use unevaluatedProperties:false and when additionalProperties:false 
, what is the rule of thumb here ?

>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
>> +
>> +    usb3dr: usb@48300000 {
> 
> Drop unused label
Done, thanks.
