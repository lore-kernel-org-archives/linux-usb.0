Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BFF21FF23;
	Sun,  8 Mar 2026 09:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772962054; cv=none; b=N4ot+baSYvL6nKQeX5UIIc/2lAH8Oo6+iy+WVqlm2IP2dqCaRC1hVoMdC0CeZ7OJ9gmXZtrRBOsanM4PFxTULTIQDIA4jUraRFhIGwbhkPrBpwb5kXqmO1xsuPlVuvOliOZ/2bizq9Scq5OBT3VvghCpOO9GmNM++JmFF8aHNvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772962054; c=relaxed/simple;
	bh=FmWpFmZ13fR3hYtUujD4lsXKYHTLZYGMygU0qXXXEnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nkiUenWlbA3Zjp8kARCTPPJMffZMkmqBLh/rOnXPSAHQfLUwiaw+ygI9EmABds/DlZzTPH5g3dC5x/uJ1ydb+pQXQLt7PU+VJJsRHeToMcIycg48YwIkqRUwaYG9R0PP/6PDO4Ul+2074QHNbtVeuhlH8/ts26K+n1FesG8xPis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PpOmJHC1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PpOmJHC1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3D6EC116C6;
	Sun,  8 Mar 2026 09:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772962053;
	bh=FmWpFmZ13fR3hYtUujD4lsXKYHTLZYGMygU0qXXXEnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PpOmJHC1w17i0api2p0aZyqZeZltSaCZ/xrlRba3HtrZxGZRB9cnlDc/Ls/M7T+j9
	 BjFD0/L6ekeegL5mTx/AivoGnLp37E3cfTCsQuTc3XzHp8HZ/Dz1sQxvawDl6iNp1t
	 9I3MO+lFWC7acPhS86o6Yf/ULWIltpIeu5eWHR/jK7ZtDgtR3QPawSCm+2Zyip10e2
	 FJ1B5WUNqYM8mlRbSbUtQy2mWGG8ZWTzj/RkPagWDcOJgDEJqbX29BDkUdZD+7Y3w3
	 6fr9P9dgIBQpGDjJTp21UOMh8AEQiORi+3C7UrgOALC0qXUxLyRzG+l5gpVIaq2ZtI
	 TbrBiEAjcbHdA==
Date: Sun, 8 Mar 2026 10:27:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Herve Codina <herve.codina@bootlin.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/5] dt-bindings: usb: atmel,at91rm9200-udc: convert
 to DT schema
Message-ID: <20260308-nifty-honest-buzzard-ccde9b@quoll>
References: <20260307-atmel-usb-v3-0-3dc48fe772be@gmail.com>
 <20260307-atmel-usb-v3-4-3dc48fe772be@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260307-atmel-usb-v3-4-3dc48fe772be@gmail.com>

On Sat, Mar 07, 2026 at 09:16:21AM +0000, Charan Pedumuru wrote:
> Convert Atmel AT91 USB Device Controller (UDC) binding to DT schema.
> Changes during conversion:
> - Include "atmel,pullup-gpio" and "atmel,matrix" in the properties since
>   they are required by existing in-tree DTS definitions.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
>  .../bindings/usb/atmel,at91rm9200-udc.yaml         | 77 ++++++++++++++++++++++

Where is the actual conversion? You are supposed to remove other file
for this to be a "convert".

>  1 file changed, 77 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/atmel,at91rm9200-udc.yaml b/Documentation/devicetree/bindings/usb/atmel,at91rm9200-udc.yaml
> new file mode 100644
> index 000000000000..6961cd5d5d89
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/atmel,at91rm9200-udc.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/atmel,at91rm9200-udc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Atmel AT91 USB Device Controller (UDC)
> +
> +maintainers:
> +  - Nicolas Ferre <nicolas.ferre@microchip.com>
> +  - Alexandre Belloni <alexandre.belloni@bootlin.com>
> +
> +description:
> +  The Atmel AT91 USB Device Controller provides USB gadget (device-mode)
> +  functionality on AT91 SoCs. It requires a peripheral clock and an AHB
> +  clock for operation and may optionally control VBUS power through a GPIO.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - atmel,at91rm9200-udc
> +      - atmel,at91sam9260-udc
> +      - atmel,at91sam9261-udc
> +      - atmel,at91sam9263-udc
> +
> +  reg:
> +    maxItems: 1
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
> +    items:
> +      - const: pclk
> +      - const: hclk
> +
> +  atmel,vbus-gpio:
> +    description: GPIO used to enable or control VBUS power for the USB bus.
> +    maxItems: 1
> +
> +  atmel,matrix:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to the Atmel bus matrix controller.
> +
> +  atmel,pullup-gpio:
> +    description:
> +      GPIO controlling the USB D+ pull-up resistor used to signal device
> +      connection to the host.
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

additionalProperties

Best regards,
Krzysztof

