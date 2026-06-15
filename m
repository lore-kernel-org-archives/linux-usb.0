Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6763D349A;
	Mon, 15 Jun 2026 16:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781541682; cv=none; b=LCFEG999ZSCdYdao/7xJUAqX+QkXohF+1XgZKraaeVosu85IrVw8qmdBmG/VJhjhgwJ3QPm7JIj4EQVGPoGI5eb5yok7Pkj5T/aHWgd85GN92vWmXUfLmAwRdebuXnlIUPSSS9O+YgnH1jcP6Ji4v8yFN4Z+SZnqb0faregFZdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781541682; c=relaxed/simple;
	bh=zGx+qZ0QyNkKm0016IvdKKSBRkhur0pSmP4v6muMB0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h4oPfcdQKeOL6oa/o2lu3wKQZglWHBVrJrCxnSEw0swUQ7iOd9oVFGvs+R4s17V2gvxJsKVvFtcu8rsMGybBwch1rQ1unMmkZNQ8VIey8A8lBZZEWb4/cLjNG0MA015WVZ+8Ads9VNk6ULhR9MylV6qkPlLiD9toEBWBp07+/uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iu72/a4m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iu72/a4m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A9191F000E9;
	Mon, 15 Jun 2026 16:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781541680;
	bh=udlWMUoZKfMCOQypoj8EGPr5EJFgIz3hwyh2Mg7jRA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Iu72/a4mYmAmY8UjPHPDEoKcpiz9ET/Fui2UP6H2MGote0rmoTDKeE3gQfKRRhcgQ
	 8DBzw+RkEitHYWvPURs85lk/Y3bc4xxRwVWXZzgEbhlUrGV9+e9CvaxmnQUFd5gcs1
	 OG2/LegHiPI9RvTehGqgafXOr/NQ63b5DsbQ+ioBgIBF66R1ZIeUIGTyjNCQQV99G8
	 rfUbPssE8my6/YvEZIeRTm4iEZpNZ0xmDr2MtdYmDnJoPHB2jK0Rh2/WBs6m1fRcoC
	 gEtSrwHVI9SQh6+u0XOzH3ZefCaXSzopPj42W+vsAF+x84jLTvET5R6pnjsnUIUex4
	 IY35MLn1Tzszg==
Date: Mon, 15 Jun 2026 17:41:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Amber Kao <amber.kao@ite.com.tw>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeson Yang <jeson.yang@ite.com.tw>,
	Yaode Fang <Yaode.Fang@ite.com.tw>,
	Bling Chiang <Bling.Chiang@ite.com.tw>,
	Eric Su <Eric.Su@ite.com.tw>, Doreen Lin <doreen.lin@ite.com.tw>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: Add ITE IT885x support
Message-ID: <20260615-browse-atop-417be2f2aac3@spud>
References: <20260615-ucsi-itepd-feature-v1-0-a826cfd0df6a@ite.com.tw>
 <20260615-ucsi-itepd-feature-v1-1-a826cfd0df6a@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6E2wXWT8cA4E2vle"
Content-Disposition: inline
In-Reply-To: <20260615-ucsi-itepd-feature-v1-1-a826cfd0df6a@ite.com.tw>


--6E2wXWT8cA4E2vle
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 09:47:39PM +0800, Amber Kao wrote:
> Add device tree binding documentation for the ITE IT885x.
> The ITE IT885x is an I2C-based USB Type-C Power Delivery (PD) controller.
>=20
> Cc: Yaode Fang <Yaode.Fang@ite.com.tw>
> Cc: Jeson Yang <jeson.yang@ite.com.tw>
> Cc: Bling Chiang <Bling.Chiang@ite.com.tw>
> Cc: Eric Su <Eric.Su@ite.com.tw>
> Cc: Doreen Lin <doreen.lin@ite.com.tw>
> Signed-off-by: Amber Kao <amber.kao@ite.com.tw>
> ---
>  .../devicetree/bindings/usb/ite,itepd-it885x.yaml  | 109 +++++++++++++++=
++++++
>  MAINTAINERS                                        |  11 +++
>  2 files changed, 120 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/ite,itepd-it885x.yaml =
b/Documentation/devicetree/bindings/usb/ite,itepd-it885x.yaml
> new file mode 100644
> index 000000000000..59e4eaa32ff1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ite,itepd-it885x.yaml
> @@ -0,0 +1,109 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/ite,itepd-it885x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ITE IT885x USB Type-C Power Delivery Controller
> +
> +maintainers:
> +  - Jeson Yang <jeson.yang@ite.com.tw>
> +
> +description:
> +  The ITE IT885x is an I2C-based USB Type-C Power Delivery (PD) controll=
er.
> +
> +properties:
> +  compatible:
> +    const: ite,itepd-it885x
> +
> +  reg:
> +    maxItems: 1
> +
> +  gpios:
> +    maxItems: 1

Sashiko comments on this and on

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  wakeup-source: true
> +
> +  pinctrl-names:
> +    minItems: 1
> +
> +  pinctrl-0: true
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  "^connector(@[0-9a-f]+)?$":
> +    $ref: /schemas/connector/usb-connector.yaml#
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        itepd@40 {
(usb-pd here as the node name please)

> +            compatible =3D "ite,itepd-it885x";
> +            reg =3D <0x40>;
> +            gpios =3D <&tlmm 129 GPIO_ACTIVE_LOW>;
> +            interrupts-extended =3D <&tlmm 129 IRQ_TYPE_EDGE_FALLING>;

This double use seem valid. Either this is a gpio or an interrupt, it's
not both.
pw-bot: changes-requested

Thanks,
Conor.

--6E2wXWT8cA4E2vle
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajArKwAKCRB4tDGHoIJi
0jpqAQC8i3l+Fc4tWxMRAdt/mcUMVox2W3RzhZiBv/Ec9LzrgwD8C8o8cQhcn/v4
cgkMCqlLYWT0/NoXt4jjFY5ZYEUozwI=
=7VZE
-----END PGP SIGNATURE-----

--6E2wXWT8cA4E2vle--
