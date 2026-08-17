Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276043B0ADB;
	Mon, 17 Aug 2026 07:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786950015; cv=none; b=D03M2FWyaqubKBLitJIDnnBNoPz8lnznZh23i4nbEROQExvpkuSPQ6iHkWyfXpz8zuoC8QT0oXKl3T4oqQ83ICCAfbb0JobHZWwqAW1+YqC4Oj599hlSZdKTlAGKIkL42+QOgIVz6a48yoYfX+UQ0e+t4vQVcuzgX1VZvpjelmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786950015; c=relaxed/simple;
	bh=WcIwkuuIli0DzdxzuxE8u6k9nw6hopwTqA6UCL6GOQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hSiejG5T/DYDKjjLfEEL1EhiRee5kfdcwQ9GWLGNBqluaJVQDiPwKWi5p1REEyflYgVt41cKXjRi3ooMIKgLf7v0+OxLa6iPsQaU8dElrG2jEgwC+1i+761n/sjtFESVt8tI5yv4juHQNpQQ3b5exzUxq+eM4v1GHxnO9bI62fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ntkh+860; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ntkh+860"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B411F000E9;
	Mon, 17 Aug 2026 07:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786950013;
	bh=W0Mi9bUNtPO+CJJgczTsGSqnp1P24sokh/3X+v65g+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ntkh+860Nk7dcOLhNdisBMPbKsPY+jbKCuRjNLS+vKI/HsQ+mg2QqdVC/Rx0Mj5Vx
	 ZSmZ0Ty+/116deaYB7PdTS+AJ5Fj31d3yQLzd/btU88s6MH7WDq6wMYcnn18zNM3us
	 QJI2oQuT6JvqgRAs3DckpAy+CUraMrG6Qoq2xuhWbD691z+80/2gyCVTJmawod4vmQ
	 mCM9JWso0ThievXtLf1Cjp7TFna5mM2m6mp+Ia7cpnxzS7JfhhZhw6f3oVuUiL7h3q
	 xQ/v92cKk/GrEObaDBVA06WqbByxazx35IvKxp3rnBCw8fYlCheqUwYfJNoOt2i4ST
	 umBvcbjpoaG2A==
Date: Mon, 17 Aug 2026 09:00:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-usb@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: dwc3: Document Renesas R-Car
 Gen5 DWC3 xHCI USB controller
Message-ID: <20260817-uakari-of-mysterious-nirvana-a1d0da@quoll>
References: <20260811051016.1655887-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260811051016.1655887-1-marek.vasut+renesas@mailbox.org>

On Tue, Aug 11, 2026 at 07:09:33AM +0200, Marek Vasut wrote:
> The Renesas R-Car Gen5 SoC contains multiple instances of DWC3 USB
> controller with glue logic wrapper around them. Document the glue
> logic and DWC3 controller.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> ---
> V2: Rework to use flat bindings for generic plat driver
> V3: - Support one or two PHYs to correctly describe the hardware
>     - Make maximum-speed optional
> ---
>  .../bindings/usb/renesas,rcar-gen5-dwc3.yaml  | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/renesas,rcar-gen5-dwc3.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/renesas,rcar-gen5-dwc3.yaml b/Documentation/devicetree/bindings/usb/renesas,rcar-gen5-dwc3.yaml
> new file mode 100644
> index 0000000000000..37944a7d5be04
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/renesas,rcar-gen5-dwc3.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/renesas,rcar-gen5-dwc3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car Gen5 DWC3 xHCI USB controller
> +
> +maintainers:
> +  - Marek Vasut <marek.vasut+renesas@mailbox.org>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: renesas,r8a78000-dwc3
> +      - const: renesas,rcar-gen5-dwc3
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: dwc3
> +      - const: glue
> +
> +  clocks:
> +    maxItems: 1
> +
> +  dr_mode:

We don't accept properties with underscores, unless this is coming from
existing schema but I do not see snps,dwc referenced in the binding.

> +    enum: [ host, otg, peripheral ]
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  maximum-speed:

Again, where is the property defined?

> +    enum: [ super-speed-plus, super-speed, high-speed ]
> +
> +  phys:
> +    minItems: 1
> +    maxItems: 2

Why is this flexible?

> +
> +  phy-names:
> +    minItems: 1
> +    items:
> +      - const: usb2-phy

phy is redundant. Are you implementing completely new bindings which
have nothing in common with all others?

Best regards,
Krzysztof

