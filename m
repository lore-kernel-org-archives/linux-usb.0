Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236A34BE453;
	Mon, 12 Oct 2026 17:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791827260; cv=none; b=hHJVtYcQ9c0vHnhMm4lEVBBKAJUQPDz+EiS/rlWHdkEw1sMG60Q/Q6AmDw5GlD52U0AxF9cEQqrDiyZem0JRDoIED8RVs92iVeTL9UB8mRFrUGakNd0infBsWiCjMf38sesN+1IrcGefxL+cwYSD9khLLc9eQtaUSDMEF4VOrSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791827260; c=relaxed/simple;
	bh=sZRgqXSqB2/tAIK5OKCgzPl5xC7PjZqUl/g29e6RhpQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=M/5zZqCMoD3h+sfsrtik2iLzFxFO3v1LLjdTfO+rnshCFxrB2dCtV9w2a56y5x/kWtm8lf/QSERLKplQ+arI09DW4lKrHeesoXFV2QiHsK18Hnvgs2cVrkB79O6ke2QQ9Il3oQhWz+906l4PbJB+eCofDJNdhI6z6BxMzsca9Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LQu3NzXs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LQu3NzXs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ACC31F0089B;
	Mon, 12 Oct 2026 17:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791827258;
	bh=nCjjKfUdcvt4bUqXSVYXbALYjqTxIDxgMt0aT2LnB90=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LQu3NzXsB+/r9f1kPcKMNQ+mrLrg2OyErS9oH8kGMMov9nAonpKbMeq/jGpjKR6df
	 fWuANamUncRFqRTtPQvl9E73fHpNAAmhCS0bSNdD+s6+DZba5DaO1HuPlQy2sQWmrJ
	 hsyIZ7URqJ/Pfni7Gd0wzKvzAU5EmSSFmC3XutXGkIqMY3UFrXZxSfhk+UC+7kdQBC
	 rDe1Sp6mC3A18J6HEw9h1Y7/FI/wvuO+jvK3XiJrRgxZuhyg9FCAUsp1BnHs5uDekA
	 jySSONizAsqoMO3N+zJ/qGn4YA3aewVSC8MDDWeVV39fz4TbLfqF7b3/foiMLfH/wB
	 NIaEX5C74EfAw==
Message-ID: <sashiko-outbox-168490@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/11] dt-bindings: usb: Add NVIDIA LSTP USB adapter
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adrian Ambrozewicz" <aambrozewicz@nvidia.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-usb@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261012-lstp-usb-adapter-v1-4-aambrozewicz@nvidia.com>
References: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com>
 <20261012-lstp-usb-adapter-v1-4-aambrozewicz@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 17:47:38 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: missing required interrupt-controller properties for G=
PIO variant
--

commit e512df165fd25f0219b3ca663151d385bd684eb0
Author: Adrian Ambrozewicz <aambrozewicz@nvidia.com>

dt-bindings: usb: Add NVIDIA LSTP USB adapter

This commit adds the device tree bindings for the NVIDIA LSTP USB adapter. =
The
device multiplexes multiple channels over one USB interface and reports its
channels itself. The bindings allow describing peripherals on the buses, GP=
IO
lines, and LEDs that cannot be reported automatically.

> diff --git a/Documentation/devicetree/bindings/usb/nvidia,lstp.yaml b/Doc=
umentation/devicetree/bindings/usb/nvidia,lstp.yaml
> new file mode 100644
> index 0000000000000..62b21051ab20e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/nvidia,lstp.yaml
[ ... ]
> +                    i2c@2 {
> +                        compatible =3D "nvidia,lstp-i2c";
> +                        reg =3D <2>;
> +                        #address-cells =3D <1>;
> +                        #size-cells =3D <0>;
> +
> +                        temperature-sensor@48 {
> +                            compatible =3D "ti,tmp102";
> +                            reg =3D <0x48>;
> +                        };
> +                    };
> +
> +                    gpio@3 {
> +                        compatible =3D "nvidia,lstp-gpio";
> +                        reg =3D <3>;
> +                        gpio-controller;
> +                        #gpio-cells =3D <2>;
> +                        gpio-line-names =3D "LED", "INT";
> +                    };

[Severity: Low]
Does this example omit the mandatory interrupt controller properties for th=
is
GPIO variant?

The Device Tree Bindings guidelines state that when a hardware variant acts=
 as
an interrupt controller, it must define the capabilities in the required
properties list. It appears the schema in
Documentation/devicetree/bindings/gpio/nvidia,lstp-gpio.yaml incorrectly
classifies these as dependent instead of required:

Documentation/devicetree/bindings/gpio/nvidia,lstp-gpio.yaml:
dependentRequired:
  interrupt-controller: ["#interrupt-cells"]
  "#interrupt-cells": [interrupt-controller]

required:
  - compatible
  - reg
  - gpio-controller
  - "#gpio-cells"

Since the schema permits incomplete node definitions, this example can pass
dt_binding_check validation silently despite omitting the mandatory
interrupt-controller and #interrupt-cells properties.

> +
> +                    ipmi@4 {
> +                        compatible =3D "nvidia,lstp-ipmi";
> +                        reg =3D <4>;
> +                    };
[ ... ]
> +            i2c@1 {
> +                compatible =3D "nvidia,lstp-i2c";
> +                reg =3D <1>;
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +            };
> +
> +            gpio@2 {
> +                compatible =3D "nvidia,lstp-gpio";
> +                reg =3D <2>;
> +                gpio-controller;
> +                #gpio-cells =3D <2>;
> +            };

[Severity: Low]
Does this example also omit the mandatory interrupt-related properties?

Similar to the previous example, this node is missing the interrupt-control=
ler
and #interrupt-cells properties required for a hardware variant with interr=
upt
controller capabilities.

> +        };
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-lstp-usb-a=
dapter-v1-0-aambrozewicz@nvidia.com?part=3D4
