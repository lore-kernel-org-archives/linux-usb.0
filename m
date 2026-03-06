Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0894288C30;
	Fri,  6 Mar 2026 00:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772757934; cv=none; b=Pk4In4E2skqGxbRwJPEFdQ+urEdBSDiV+JApikRr+Dj5i429YT/CGcIdvQjyEuWniYCuvY6OSLR9oCH/gBpv3hCzHlW1Y+DL1EgYEOx5iLP/f5pekajOFQ4PXILi1eFoMC+4wb21g3nO5VYL8UOzco70EdVvLXaqyzhq2djf1s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772757934; c=relaxed/simple;
	bh=RfZ6JfMteBUvtPa+L1il2dXvDwwhTUW7cGhcZfzVpl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ELyxKiJglmJN5N4RNOBpc2ilvi5FBHFrLlu7ezRPExXkJ8D8YtgM5v0yDiPUGr8OcVjLSuaJF4JVmJmdbQLQ3g/lfQ/eIDKEMVFhFXV8qgYdZABDuFU6+u5EOE4pUoTgEnSVe+5H8mq+VqYULw/4sGNhQU1PwxqKPYpyrKSOZu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F7PFHuzx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F7PFHuzx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A96C116C6;
	Fri,  6 Mar 2026 00:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772757934;
	bh=RfZ6JfMteBUvtPa+L1il2dXvDwwhTUW7cGhcZfzVpl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F7PFHuzxFF2xXjeSHFWX9UKCutem6Sp6gftOvOM80oDAJlI5qKbdGXhziaAjxDOqb
	 juukfdodr41K3ImYrEeas+GnrL9FrrcyveNHXn5tgXQpPIW1YHOY/kFFYf+YXfBVY9
	 sRYMqE6K/uim4woWg8ygo8Dot5HRkAquC/LH5D8+qKEuKN+SvXgInXAPgVrRj2d+32
	 OxtYCaadBseZsR/VmsTYmIwZmBFwUP/OgMGjjrDIkgdZfJpQ2TNSGHy5OXQjfQbOAL
	 1U4qAnFk5mKaMzfPbuVJMoQrzfUdBa03R1oy9uJUiiZJPosuE0rnVzjcVVyCuuyuS+
	 MMeqIALwU9PXQ==
Date: Thu, 5 Mar 2026 18:45:33 -0600
From: Rob Herring <robh@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Herve Codina <herve.codina@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: usb: generic-ohci: add AT91RM9200
 OHCI binding support
Message-ID: <20260306004533.GA870954-robh@kernel.org>
References: <20260224-atmel-usb-v2-0-6d6a615c9c47@gmail.com>
 <20260224-atmel-usb-v2-1-6d6a615c9c47@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-atmel-usb-v2-1-6d6a615c9c47@gmail.com>

On Tue, Feb 24, 2026 at 01:12:58PM +0000, Charan Pedumuru wrote:
> Add binding support for the Atmel AT91RM9200 OHCI USB host controller
> to the generic OHCI schema.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
>  .../devicetree/bindings/usb/generic-ohci.yaml      | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> index 961cbf85eeb5..ab8a49142386 100644
> --- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> +++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> @@ -55,6 +55,7 @@ properties:
>            - ti,ohci-omap3
>        - items:
>            - enum:
> +              - atmel,at91rm9200-ohci
>                - cavium,octeon-6335-ohci
>                - nintendo,hollywood-usb-ohci
>                - nxp,ohci-nxp
> @@ -137,6 +138,16 @@ properties:
>        The associated ISP1301 device. Necessary for the UDC controller for
>        connecting to the USB physical layer.
>  
> +  atmel,vbus-gpio:
> +    description: GPIO used to control or sense the USB VBUS power.
> +    minItems: 1
> +    maxItems: 3
> +
> +  atmel,oc-gpio:
> +    description: GPIO used to signal USB overcurrent condition.
> +    minItems: 1
> +    maxItems: 3
> +
>  required:
>    - compatible
>    - reg
> @@ -144,6 +155,22 @@ required:
>  
>  allOf:
>    - $ref: usb-hcd.yaml
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: atmel,at91rm9200-ohci
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            - const: ohci_clk
> +            - const: hclk
> +            - const: uhpck
> +
> +      required:
> +        - clocks
> +        - clock-names

       else:
         properties:
           atmel,vbus-gpio: false
           atmel,oc-gpio: false

>    - if:
>        not:
>          properties:
> 
> -- 
> 2.53.0
> 
