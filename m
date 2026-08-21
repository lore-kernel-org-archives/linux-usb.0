Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E063A9DB9;
	Fri, 21 Aug 2026 07:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787298083; cv=none; b=fqmWAWGFttnZUmIKzYZw3tGECkRsmjF0Mi2xflnjMfY5RCWRZVL8fYUvEvKFnpGW+U/7NJzqwiB99mkOyPfepnILIkz3ydS4sNfIWTDpqeEvQhjQYaC56yeP0i7VcyqXvzIVHyAeoz/pT2luWnE/tsr2/e7SMiE5NFyf5duCa3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787298083; c=relaxed/simple;
	bh=eP1Mrc9TQ1UWFBi0K1ewJfVrBz3ImRVNztXcPG1oBuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gx9XzeOatVIRWG1d3wv4MkWkNXxnstMRyoVQ4R4jP+TM3oOCB7tyBmQbdTVwiIaziXqjpJ/DJ3tQ0KqSosp/E+QoDaqZ7GIfKG9JuWy5BrH0Z6yHKi0Pm4r1SPDp7s4JGXINvVR4crt1fdp4bhlLPHIM7k8HJXCPZ1hp7+ZfeBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jZc6U6O2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jZc6U6O2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79C7F1F00A3A;
	Fri, 21 Aug 2026 07:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787298077;
	bh=ei+B8ocDD8dYcFQzb2AT0WGx2IPkB//7Ko8mka3Bc/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jZc6U6O2lQzWmS5s+LLmj/Gi/1BmdrFqSe5tbnWw3zjZJeqwfUXu8ymjBpDaS62wP
	 t8wonbpR8B4UK08unCgqNsjyV0Y6TSA/84NeEVE/b3PRRpaWisweinjBKE+JwIs0+0
	 6BL243QSHh+mALBxe3+shcHOOvwGdQ8YatAfRZ+Jk2y9qhMAdL4QzYPQ/sCu7Hym6i
	 sf2u8F5S1t0iBQNHvExFkWQWqA9mAwAbJn+eRjcgTqZFzO66tkzQchUXqcw+TNUNUL
	 EXgT4NicoPCIORRz2BRR8HDKk0oiRq7jhmBr/fc+5DRWL1ucyr612bZREAk0e79MtM
	 j3xPUGe3KBc0w==
Date: Fri, 21 Aug 2026 09:41:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
Cc: Krutik Shah <krutikshah@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>, 
	Karthikeyan Mitran <kmitran@axiado.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: gadget: udc: add Axiado AX3000
 and AX3005 UDC
Message-ID: <20260821-woodoo-enlightened-bobcat-9315cb@quoll>
References: <20260817-axiado-ax3000-usb-device-controller-v2-0-0ef033dd0a68@axiado.com>
 <20260817-axiado-ax3000-usb-device-controller-v2-1-0ef033dd0a68@axiado.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260817-axiado-ax3000-usb-device-controller-v2-1-0ef033dd0a68@axiado.com>

On Mon, Aug 17, 2026 at 10:57:13PM -0700, Naveen Kumar Rajgiri Bassappa wrote:
> +title: Axiado AX3000/AX3005 USB Device Controller
> +
> +maintainers:
> +  - Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
> +  - Krutik Shah <krutikshah@axiado.com>
> +  - Prasad Bolisetty <pbolisetty@axiado.com>
> +
> +description:
> +  Axiado USB Device Controller (UDC) is used on the AX3000 and AX3005
> +  SoCs. This controller is based on a Corigine USB IP core and provides
> +  SuperSpeed (5 Gb/s) or High-Speed (480 Mb/s) operation, selected by the
> +  maximum-speed property. It supports control, bulk, interrupt, and
> +  isochronous transfer types across multiple configurable endpoints. The
> +  node describes the memory-mapped register region, interrupt line, and
> +  other required properties for the UDC hardware.

Did you implement my comment?

> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: axiado,ax3000-udc
> +      - items:
> +          - const: axiado,ax3005-udc
> +          - const: axiado,ax3000-udc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  phys:
> +    maxItems: 1
> +
> +  maximum-speed:
> +    enum: [super-speed, high-speed]

You miss referencing proper schema to get such property or you should
not come with own generic properties. IOW, look at other bindings how
they define a proper UDC device schema.


I also do not see a need for this, compatible defines max speed.


> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        usb@81200000 {
> +            compatible = "axiado,ax3000-udc";
> +            reg = <0x0 0x81200000 0x0 0x00100000>;
> +            interrupt-parent = <&gic500>;
> +            interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;

resets, phys. Make example complete.

> +            maximum-speed = "high-speed";
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a674e36529f7..36af69fb965b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4468,6 +4468,14 @@ F:	Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml
>  F:	drivers/spi/spi-axiado.c
>  F:	drivers/spi/spi-axiado.h
>  
> +AXIADO USB UDC DRIVER
> +M:	Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
> +M:	Krutik Shah <krutikshah@axiado.com>
> +M:	Prasad Bolisetty <pbolisetty@axiado.com>
> +L:	linux-usb@vger.kernel.org
> +S:	Supported
> +F:	Documentation/devicetree/bindings/usb/axiado,ax3000-udc.yaml
> +
>  AYANEO PLATFORM EC DRIVER
>  M:	Antheas Kapenekakis <lkml@antheas.dev>
>  L:	platform-driver-x86@vger.kernel.org
> 
> -- 
> 2.34.1
> 
