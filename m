Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793692882;
	b=cnIS+jRznH3XS6E2CFFAWDQE1nbykjSnIWhdHUztNliI9f+QxmkVDsDAPElKbrVBwIgJ
	 EkFFeFvvdSSnOL3Nwr4FwFYPGhTGiOMP9s2x/JcD1eyNotFs+s+eiKCX7PvnqNTZC9Hay
	 D2AsN695XgdbegNVy8sRrwEjyqmjlFgOX8a++reDj4Q83waRctOJXK5zgKF9E7X6VSIPd
	 WXJ9kYDPTfq9aby+6pwwqRc0jyNTJwt0x/zTf7hrTIpTyLeTf+t4cja4sZT/2xBXtfOcj
	 InZykVav98bbRBs4aPS+n5qcGPi7ZH99VvGoGVpf0US6jPNRB+173BY8F6jydCwTGng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793692882;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KNTJ7+aGLleegUTNQ5JpdEdo0YNVvO3z3jFP4d6sxVU=;
	b=VuQ4u25P10AeCP+0MvJ7R2noxv3HZnWT0CXUlszauDugGiixAMA7KcbWgRFPqOgdis20
	 k6UKdxXbHN/CIXVcDKyOBHggY5granK7fH0ndKE9k3vQG0iOEizUgwBgwJz/Q/D/PnVTW
	 MMLkXGTmSTl9f67KtIk57TgRFtUXag5ue6yqjwSiGIhU7GeIIBbziLRLUNjkkRgaTAm99
	 Y9nuskjhRPHgg25MkwS4e5+A/Wok6TZ/8DjrXcSFlz0hgDVw7EboMas9WrnPxJbqqt5E0
	 Y5v7yDmxhOkvEyojTfEwtAATmS9v6aKfrJvQkSMBc3ZcVyYDDhYVZIaVxgwCUeAIglA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UFdk6hxZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A686606D802;
	Tue,  3 Nov 2026 08:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UFdk6hxZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DCF91F00A16;
	Tue,  3 Nov 2026 08:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793692881;
	bh=KNTJ7+aGLleegUTNQ5JpdEdo0YNVvO3z3jFP4d6sxVU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UFdk6hxZLZuBFeEFhHzKLJi5V2ujidsBj8zD9CgJ6CefTWT/6PwEb7wMbujqSuM3y
	 CVCYS/ATciibT3eqiDXgdkMYiwXvmWtkwZZbkM9NJKEu8GHfGa1DDVbYCPfgNtjXj1
	 BUfCiCGHJfswP4AjXq+qBS+cKJ6SFQlzYgO8ft/f/XP82ixPnvO0eFMUWpzN1K+Nzv
	 TosCSLv/NyLFfVWX37mLK05KcbZm5UCvpvntWs3AT+jLX3VfBkyMqjQd8SWQWR79WN
	 fxcW0HTKCMBYxRrB07+xdGqn5ZVikjoivyNwD94c9EtGVzqfqkiF1mwwJTwjv6xd54
	 qGE/ex3tx1PEg==
Message-ID: <sashiko-outbox-194787@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: usb: Add CIX Sky1 USBSSP controller
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SG9uZ2xpYW5nIFlhbmcgKOadqOWuj+S6rik=?= <hongliang.yang@cixtech.com>
Cc: =?utf-8?b?bGludXgtdXNiQHZnZXIua2VybmVsLm9yZw==?= <linux-usb@vger.kernel.org>,
 =?utf-8?b?ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc=?= <devicetree@vger.kernel.org>, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103074929.1971195-2-hongliang.yang@cixtech.com>
References: <20261103074929.1971195-1-hongliang.yang@cixtech.com>
 <20261103074929.1971195-2-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 08:01:21 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: usb: cix,sky1-usbssp: invalid bus node name and proper=
ty order
--

commit 26d70ffe3b921fd15f5adca3d546e808116719c0
Author: Hongliang Yang (=E6=9D=A8=E5=AE=8F=E4=BA=AE) <hongliang.yang@cixtec=
h.com>

dt-bindings: usb: Add CIX Sky1 USBSSP controller

This commit adds the Device Tree binding schema for the CIX Sky1 Cadence
USBSSP controller glue layer and updates MAINTAINERS.

> diff --git a/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml b=
/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
> new file mode 100644
> index 0000000000000..c29654567e765
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
> @@ -0,0 +1,152 @@
[ ... ]
> +properties:
> +  compatible:
> +    const: cix,sky1-usbssp
> +
> +  reg:
> +    items:
> +      - description: AXI bus attribute configuration registers
> +      - description: Controller status registers
> +
> +  reg-names:
> +    items:
> +      - const: axi
> +      - const: status
[ ... ]
> +  cix,usb-syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the Sky1 S5 system controller used to program USB mode
> +      strap controls.
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2
> +
> +  ranges: true
> +
> +patternProperties:
> +  "^usb@[0-9a-f]+$":
> +    $ref: cdns,usb3.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - cix,usb-syscon
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/cix,sky1.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/reset/cix,sky1-s5-system-control.h>
> +
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        usb-rcsu@91c0300 {
> +            compatible =3D "simple-bus";
> +            #address-cells =3D <2>;
> +            #size-cells =3D <2>;
> +            ranges =3D <0x00 0x00000000 0x00 0x091c0300 0x00 0x150>,
> +                     <0x00 0x091d0000 0x00 0x091d0000 0x00 0x20000>;

[Severity: Low]
Does this pass make dt_binding_check and scripts/dtc/dt-check-style
--mode=3Dstrict?

In the example, usb-rcsu@91c0300 has compatible =3D "simple-bus", which
requires a node name matching ^(bus|soc|axi|ahb|apb|isa|pci-ep-bus)(@[0-9a-=
f]+)?$
under schemas/simple-bus.yaml (such as bus@91c0300).

Also, in usb-rcsu@91c0300, ranges is placed after #address-cells and
#size-cells, which triggers a property-order warning from
scripts/dtc/dt-check-style --mode=3Dstrict since ranges should precede
standard properties per Documentation/devicetree/bindings/dts-coding-style.=
rst.

Similarly, in the top-level properties and required lists of
Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml, should ranges
be placed right after reg-names rather than after cix,usb-syscon,
#address-cells, and #size-cells per
Documentation/devicetree/bindings/writing-schema.rst?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103074929.1971=
195-1-hongliang.yang@cixtech.com?part=3D1
