Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41C938E126;
	Thu, 20 Aug 2026 18:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787249359; cv=none; b=CWpyQGipRU6bc0h0FONSiJrX2JMJC4mWMvI4JX4i5L6BX2kv/zUv55cdm1rMqtVsh2/q1l7a/5NZAESBxcEu29y4cq2ejUZKEqWV3ukF37s/ZK8rgTstynPzPGPB1LK3Pl6MozZVu7L91T9My5yMqt2fQNE9QtMM28BN7zfYb/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787249359; c=relaxed/simple;
	bh=1qi389nyHDbm12j8DdLckrQcMd8HwswX9FVhJFTM+Oo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mN7JFwdwuwIW9QlFZpUCU7RZ750ESt3EvVI3sRPVYq4R4MJ0TzanuqqweMM97Zos7RP4M8dNVNtANZVO3y74cntIaf02GuQAOjXekXij8jWzruRunbhH/n+SShPln1L9EpyBIIjLXHal/jixznv/cTZ8z11F1qH0KUMxpD2iwQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VGf+aEC2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VGf+aEC2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5870F1F00A3D;
	Thu, 20 Aug 2026 18:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787249357;
	bh=FRjpf1Z4QPNzatfneLad243T0oW4CckTgAQ2q+XEl/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VGf+aEC2ZuQL3x2CuxReOn0iJloYDEb+B1vZm8i9gwYWHpzJLG3ori+1qU4FkoEy6
	 4JzriddskRc4oNBnDsvuPTyMn1VOq62CAnCbUpylYAiPbQjpgrzgPqCgafw5cU9T8M
	 douqxqiOubU0w+dcapldjdZPBTPOPKm3QeBopSIweQ7pmpGLYHH+cIO+bSMiHtEXY7
	 3VIqbTKY5E5xLmPzZL3t2WiO7XTduPVLdRBubj1MvdfngDc1i3lX+C5tKuxs2uNhOZ
	 e/bhBH3u9QYjqXdEkjH+xJVsWhmCsJEcSiUd4QFunl73RKitSYe/keGbbnVPmKzaHJ
	 1hw6KXYut8YDQ==
Date: Thu, 20 Aug 2026 19:09:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: Add Cypress cypd6129/cypd6229
 Type-C controller
Message-ID: <20260820-strength-stylus-bf618dae41c7@spud>
References: <20260820145036.2035641-1-akash.kumar@oss.qualcomm.com>
 <20260820145036.2035641-2-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m8RTELuwTqMYz17/"
Content-Disposition: inline
In-Reply-To: <20260820145036.2035641-2-akash.kumar@oss.qualcomm.com>

--m8RTELuwTqMYz17/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2026 at 08:17:36PM +0530, Akash Kumar wrote:
> Add the device-tree binding documentation for the Cypress cypd6129
> and cypd6229 dual Type-C PD controllers. These are used on Shikra
> CQM/CQS/IQS platforms to handle usb-role-switch for the USB Type-C
> ports over an I2C interface, similarly to the existing cypd4226
> binding.
>=20
> cypd6229 is a variant of cypd6129 and is described with a
> "cypress,cypd6129" fallback compatible string.
>=20
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
> ---
>  .../bindings/usb/cypress,cypd6129.yaml        | 99 +++++++++++++++++++
>  1 file changed, 99 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/cypress,cypd612=
9.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd6129.yaml =
b/Documentation/devicetree/bindings/usb/cypress,cypd6129.yaml
> new file mode 100644
> index 000000000000..f709f82f2092
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/cypress,cypd6129.yaml
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/cypress,cypd6129.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cypress cypd6129/cypd6229 Type-C Controller
> +
> +maintainers:
> +  - Akash Kumar <akash.kumar@oss.qualcomm.com>
> +
> +description:
> +  The Cypress cypd6129 and cypd6229 are dual Type-C PD controllers that =
are
> +  controlled via an I2C interface.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: cypress,cypd6129
> +      - items:
> +          - const: cypress,cypd6229
> +          - const: cypress,cypd6129
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  pinctrl-0: true
> +  pinctrl-1: true
> +
> +  pinctrl-names:
> +    minItems: 1
> +    items:
> +      - const: default
> +      - const: sleep
> +
> +patternProperties:
> +  '^connector@[01]$':
> +    $ref: /schemas/connector/usb-connector.yaml#
> +    required:
> +      - reg
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +anyOf:
> +  - required:
> +      - connector@0
> +  - required:
> +      - connector@1
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      typec@40 {
> +        compatible =3D "cypress,cypd6129";
> +        reg =3D <0x40>;
> +        interrupts-extended =3D <&tlmm 136 IRQ_TYPE_LEVEL_LOW>;
> +        pinctrl-0 =3D <&usb0_intr_state>;
> +        pinctrl-names =3D "default";
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        connector@0 {
> +          compatible =3D "usb-c-connector";
> +          reg =3D <0>;
> +          label =3D "USB-C";
> +          data-role =3D "dual";
> +          power-role =3D "dual";
> +          wakeup-source;

whitespace nitpickery, blank line here

> +          ports {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;

and here

> +            port@0 {
> +              reg =3D <0>;

and here

Otherwise, this seems fine to me. With that,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

pw-bot: changes-requested

> +              endpoint {
> +                remote-endpoint =3D <&usb_role_switch0>;
> +              };
> +            };
> +          };
> +        };
> +      };
> +    };
> --=20
> 2.43.0
>=20

--m8RTELuwTqMYz17/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaodCyQAKCRB4tDGHoIJi
0nHJAQD5e9L4rm14PG/FLac6A7fTUwTnqSGfMZJl0usvj5TtrAD/YEnba9EJK1ql
DDsUcq7lnK9BRG6E8pU3oAPXmOBIlgk=
=kld8
-----END PGP SIGNATURE-----

--m8RTELuwTqMYz17/--
