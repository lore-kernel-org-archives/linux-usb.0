Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793842191;
	b=NEzh41a5JxurizsDINKBo1M+mnKXIVPNfW0lFERPhKO4sjLlXQHFiMqcC3XIq8I4n2y4
	 iAZP/H9lftz+1gGjAhwbkzym3R5ld/JGlAf9HjizH+PtyASC4vgwQDLvEEzZaTnZxiFiP
	 RKMpa7R2imLCZeQOlbgCeD0Hgzu3oZYJc/70N/dqgo81CFzi07fNCW0+Ma7bieOkEtrEy
	 cUAoEhILBdeUbEfH2Ax2L7VAipLLxqYMAWPrFFKtArBEyAnl6Yms1KQeKxkTPj7bbj8QQ
	 tH2HOMwb4Sy3ocr6BTf51EF+Nyhln7aEDw3zAWg9QIkGvhiIXg9JIo+wLxcjEd9tu3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793842191;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5D7J/ZaoSpizUl9ORZSY1EW5jLXomd+aMnkNWG9A7Pk=;
	b=lvc48gD/x89lQmCSBDOpvNMchdjQVV5etnPInnwAThQBHk309D3mQFZFRLaSjyv12J5q
	 Z0ZQmHcZa+9cHnL2vL7e93Z7DASqAbyVOIeqXUJn/Lv3tlfbJ2G+ll2Y7zqubD/IQcdDz
	 KADUYUMrU5v6OPmLQSqphkWlTXHDpfPb5tGby5uiK1h1poRpct1ALqXfJm3SJX16eA7Qq
	 Wcgapc5o0hJXZJv2rYj4JSCzCc37+3CREmVONDgtrReJtXqAzeZ6NnggaI7acrIWKCljI
	 bEk3QreJw3FRaSBE08+hGA20be6eaCi6Huysdr7Z5mZBrHk2+IoK6OGRG4jnm+ufThQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W+ZoSDRl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8F7606A31B;
	Thu,  5 Nov 2026 01:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W+ZoSDRl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F181F000C1;
	Thu,  5 Nov 2026 01:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793842191;
	bh=5D7J/ZaoSpizUl9ORZSY1EW5jLXomd+aMnkNWG9A7Pk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W+ZoSDRliBsBumIs/0FiW4Ioce6ACmciul3mR91aIwkuFbaSf5OsgIQs0UUziuNbC
	 aTBnvJaCwpA0D62uZz4x0ZUKq3H9GraoD/nfpsYXGlnSf7NRBuRs3MfH4dmaLOoGzX
	 lx0ulIof2JlA5Xk4sS66a5X8lbMrPaG+up/2ON3oGp5P0i96NmKstrPlucgbHSPHS/
	 s+Wx8kSDOhIlHUE9nX1PmwtumdewcAK+K0/4f98l4gwnq0+ndVJEhIsJaDbAxKP8hd
	 vV2xRDNJMwXfOYpiuq0IzhRJmxjyETMPQ0edMWBys0wTytSA5rqL7H19xqLDocokRL
	 ENb+sRys0Ig4Q==
Message-ID: <sashiko-outbox-198410@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: usb: Add CIX Sky1 USBSSP controller
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SG9uZ2xpYW5nIFlhbmcgKOadqOWuj+S6rik=?= <hongliang.yang@cixtech.com>
Cc: =?utf-8?b?bGludXgtdXNiQHZnZXIua2VybmVsLm9yZw==?= <linux-usb@vger.kernel.org>,
 =?utf-8?b?ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc=?= <devicetree@vger.kernel.org>, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261105011803.4058557-2-hongliang.yang@cixtech.com>
References: <20261105011803.4058557-1-hongliang.yang@cixtech.com>
 <20261105011803.4058557-2-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 01:29:50 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] dt-bindings: soc: cix: non-standard #syscon-cells property in syste=
m-control
- [Low] dt-bindings: usb: cix,sky1-usbssp: redundant unprefixed disable pro=
perties
--

commit 6118aaded5d0bbade230e227b29df8b8fcf97408
Author: Hongliang Yang (=E6=9D=A8=E5=AE=8F=E4=BA=AE) <hongliang.yang@cixtec=
h.com>

dt-bindings: usb: Add CIX Sky1 USBSSP controller

This commit adds the Device Tree binding schema for the CIX Sky1 Cadence
USBSSP controller and updates the CIX Sky1 system controller binding and
MAINTAINERS file.

> diff --git a/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-co=
ntrol.yaml b/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-cont=
rol.yaml
> index a01a515222c6d..d19ef4e3cac02 100644
> --- a/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.y=
aml
> +++ b/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.y=
aml
> @@ -27,6 +27,9 @@ properties:
>    '#reset-cells':
>      const: 1
> =20
> +  '#syscon-cells':
> +    const: 2
> +

[Severity: Low]
Should #syscon-cells be dropped from cix,sky1-system-control.yaml?

A syscon node represents a miscellaneous collection of registers rather tha=
n a
provider class with a fixed specifier cell count, and different consumers of
 the same syscon node may take 0, 1, 2, or more arguments. In
drivers/mfd/syscon.c, syscon_regmap_lookup_by_phandle_args() parses phandle
arguments with a fixed count passed by the caller rather than querying a
#syscon-cells property on the provider node:

drivers/mfd/syscon.c:syscon_regmap_lookup_by_phandle_args() {
	...
	rc =3D of_parse_phandle_with_fixed_args(np, property, arg_count,
			0, &args);
	...
}

No other binding under Documentation/devicetree/bindings/ defines
#syscon-cells, and cix,usb-syscon in cix,sky1-usbssp.yaml already specifies
and constrains its two arguments via its phandle-array items schema.

> diff --git a/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml b=
/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
> new file mode 100644
> index 0000000000000..621526d32d7c5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
[ ... ]
> +  reset-names:
> +    items:
> +      - const: apb
> +      - const: core
> +
> +  ssp-disable:
> +    type: boolean
> +    description: Disable SuperSpeed Plus mode of the controller.
> +
> +  u3-port-disable:
> +    type: boolean
> +    description: The board does not route the USB3 port of the controlle=
r.

[Severity: Low]
Do ssp-disable and u3-port-disable on the parent glue node duplicate standa=
rd
USB properties that are already available on the child cdns,usb3 controller
node?

In Documentation/devicetree/bindings/usb/cdns,usb3.yaml (and usb.yaml), spe=
ed
limits and available PHYs are already described on the child node:

  maximum-speed:
    enum: [super-speed-plus, super-speed, high-speed, full-speed]

  phys:
    minItems: 1
    maxItems: 2

The example in this binding already sets maximum-speed and phys on the child
usb@91d0000 node. Adding custom unprefixed ssp-disable and u3-port-disable
properties on the wrapper node creates two places to describe the same
hardware configuration. Could the glue driver inspect the child node's
maximum-speed and phys properties instead of introducing these two properti=
es?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105011803.4058=
557-1-hongliang.yang@cixtech.com?part=3D1
