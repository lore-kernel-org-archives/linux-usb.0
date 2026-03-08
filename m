Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20023186E58;
	Sun,  8 Mar 2026 09:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772962183; cv=none; b=WgbtE2mHhfDJbSg8NJx6i8mlQf1PwTo5N5qncKNiiVNmSx+x8Kl7pjGbglcGZZ4OPUVIEHK+M/1F5iG9zqG0JovkBlSxvLM3e1gxiMY58HEDMRx2tCr21kSrZ/6C4k70ONBPNVUKYdvGfBYayQ+gFsYU0Zf12cJZhPwytXSFZPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772962183; c=relaxed/simple;
	bh=UdO0glGyIlGGoMN5cN83CJyEO2V3A/5t+IUInVAdHz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PchQwARnhqRNonMYTkr+AO6XtE9Yh81Oxv/PPYtJ2ajFmaZIHrJZCW/XQGfRrmLbDwENRVhT08e6yftpZmCVwZMqxt9Y8jUrL7pu5Ypn9bPbmTildwl0hyX69xiEBAu60Ein6Z/z30j0vrfytfu2JzdK22h0qimUY2l93hmhIaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WYRJu4GM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WYRJu4GM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 555F6C116C6;
	Sun,  8 Mar 2026 09:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772962182;
	bh=UdO0glGyIlGGoMN5cN83CJyEO2V3A/5t+IUInVAdHz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WYRJu4GMvJqQn6ZDF6I2d5snxNq8YjE3KL686bTQIV9zWBnu/ZEWs1hPZhYKrKoZP
	 HJOOOL3d1Bhjmy+onknBbUj8vyFWVZRRW0QEkm1QaFtKevKoxudsJ93X2m9CMAg0KL
	 UpBUqVYhLfkComUTzWe0VFr5P/VEHfjUhmgElLuQ7yLN8kZUWfJvbcNdgQDkhSPBmR
	 3Kt6Omo8fp89pvk7WTFYfXNeF3GqQm7/3TEJBhj8VRO6JFtw0P4y9a4Rv5pp4o7fwP
	 IPXFf2kKBmqcHfAMY/H6NPUdS1rstckuz9yG5O3xcPYJWng9+tHA3xKd3TstiYktoN
	 +eWczMeX+HyBQ==
Date: Sun, 8 Mar 2026 10:29:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Herve Codina <herve.codina@bootlin.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] dt-bindings: usb: atmel,at91sam9rl-udc: convert
 to DT schema
Message-ID: <20260308-cherubic-misty-cricket-80fad0@quoll>
References: <20260307-atmel-usb-v3-0-3dc48fe772be@gmail.com>
 <20260307-atmel-usb-v3-5-3dc48fe772be@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260307-atmel-usb-v3-5-3dc48fe772be@gmail.com>

On Sat, Mar 07, 2026 at 09:16:22AM +0000, Charan Pedumuru wrote:
> +
> +  reg:
> +    maxItems: 2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 2

Drop

> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 2
> +    maxItems: 2
> +    items:
> +      enum: [pclk, hclk]

No, list the items instead. Why is this flexible? Nothing in commit msg
explains that.

> +
> +  atmel,vbus-gpio:
> +    description: GPIO used to detect the presence of VBUS, indicating that
> +      the USB cable is connected.
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/at91.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    gadget@fff78000 {
> +        compatible = "atmel,at91sam9g45-udc";
> +        reg = <0x00600000 0x80000
> +               0xfff78000 0x400>;
> +        interrupts = <27 IRQ_TYPE_LEVEL_HIGH 0>;
> +        clocks = <&pmc PMC_TYPE_PERIPHERAL 27>, <&pmc PMC_TYPE_CORE PMC_UTMI>;
> +        clock-names = "pclk", "hclk";
> +        atmel,vbus-gpio = <&pioC 15 GPIO_ACTIVE_HIGH>;
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/usb/atmel-usb.txt b/Documentation/devicetree/bindings/usb/atmel-usb.txt
> deleted file mode 100644
> index 12183ef47ee4..000000000000
> --- a/Documentation/devicetree/bindings/usb/atmel-usb.txt
> +++ /dev/null
> @@ -1,125 +0,0 @@
> -Atmel SOC USB controllers
> -
> -OHCI
> -
> -Required properties:
> - - compatible: Should be "atmel,at91rm9200-ohci" for USB controllers

Why do you remove OHCI here? There is no conversion of this compatible.
Don't combine multiple different changes in one commit.


Best regards,
Krzysztof

