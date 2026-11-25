Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595371;
	b=Um3v2LHfqO8E5paF0RTFBvWgDn6MNDosBDPio6Lpwzpm+7+TtyCUh2LEklf8JK1pxx3B
	 d3cVmf9Av/ocPfaftTM3bRHNGP7Sam4M/SAayfLLjvj+q7PDT3vU4x0SzQ5fEIWiRBVJo
	 Qf36y1hJ/N3/Mk4kDtfvGDv7rIL0YFKOLNqXTKmvgH8AlfO5XEiYLdTJUyQ31tuIPGajN
	 xaru1N6yuECB7ER0t+JQCU+r74scKXp9Tyrwfqn3P1QqFbBFzJoUkJGOERzX7txF1j2iG
	 T4di6fmW5bnaNenR03kcAPvLB0HHpylYY/A4lry3Uon9ThKkzUw7O+hJzx6+sf5YT9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595371;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tExvGyYYg9reEZtGObBUAE95jnf+qq7Flhvf9toMgkQ=;
	b=nnTEi4DixRqvqcbVriZqfrpWIyqrURiqIKmlJ2oIQjM8aYmHBZ4A7qCje9fR/tBzZQV4
	 JZDs31Ivjag9ewFbk7wFLSl2beVotiwXNNDI4ltGbhWn1UDILdI150g9OJ7BbPJHAoY6Z
	 Qy9fxGjm69YnbZlVYVc1jgOEa6lDdXBguT+KqM58aV2w4I2rOuyw6byWIMrTh6EJJe4r5
	 QtIpHbd24+z+cvegEQPYiFGKcpHv/Vfc4omJVKTkToEcdY4BU+A6T06tWgwZJYKP88soC
	 bH5Y5Gyol+wgSA+hQJXL+zi6hKKLTPOlBKFT4qxzm8h/ppUeaJm1+54VoNMShB2QMAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BIxx2zHi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056AB606A31E;
	Wed, 25 Nov 2026 08:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BIxx2zHi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 632CD1F000C6;
	Wed, 25 Nov 2026 08:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795595370;
	bh=tExvGyYYg9reEZtGObBUAE95jnf+qq7Flhvf9toMgkQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BIxx2zHi0SvVQmtm2P+sCOhsDX+vsm8d8dsT6dZ4nNZXeF+xi/P9ZsRMBb9MpormJ
	 yuW2rRsgM4nOWjca67OGSzUjxNEWRGFBRspqOj6smbjJYR/TsaKyVy8oVP7k2+6Ei+
	 vXXXiGMAnPo1V+CNlo+fkUNiXfziUNwza0o6VUu90orZzHsaeq9LuBIP9J66BBdlxS
	 JfhYJNcPSAWyh+KNsnOwXmzMR6lABFmSjhz2VuMsQmttjDRJFfft/xa+eD0OhE+7E9
	 8AzYk4xuW0X+36eosmERZutgtx70e3gS9Uvc3NwIZnE05EWWGfr+/x8Vpcgyh6onLW
	 rCNeUGF9eOpAg==
Message-ID: <sashiko-outbox-232903@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 1/3] dt-bindings: usb: snps,dwc3: describe two
 connectors on one HS data bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125081219.3661014-2-xiaqinghuan@mail.ustc.edu.cn>
References: <20261125081219.3661014-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261125081219.3661014-2-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 08:29:29 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] dt-bindings: usb: snps,dwc3: incomplete endpoint schema under
  port@0
- [Low] dt-bindings: usb: snps,dwc3: inter-version changelog above
  tearline
--

commit 130dcbe74a6b42db1a884410d33da8ccd5d1193b
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

dt-bindings: usb: snps,dwc3: describe two connectors on one HS data bus

This commit extends the DWC3 common DT binding to describe two USB
connectors multiplexed onto the High Speed port@0 via mux-controls and
per-endpoint usb-role-switch and mux-state properties.

> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
>
> Changes since v13:
>  - [sashiko, 2026-11-23, Low] "missing maxItems: 1 on mux-controls".
>    Accepted: the shared data bus is driven by one two-state multiplexer, =
so
>    "mux-controls" now says "maxItems: 1" instead of leaving the number of
>    mux controllers open.

[Severity: Low]
This isn't a bug, but the "Changes since v13:" block is placed above the
"---" tearline separator, so git am records the revision changelog in the
permanent commit message.

> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml =
b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> index 6c0b8b6538246..dcfa8c3a81c51 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> @@ -26,8 +26,78 @@ allOf:
>        $ref: usb.yaml#
>      else:
>        $ref: usb-xhci.yaml#
> +  - if:
> +      required: [mux-controls]
> +    then:
> +      # A multiplexed High Speed bus only makes sense when the controlle=
r is
> +      # dual-role and both connectors can switch their role independentl=
y.
> +      required: [ports, usb-role-switch]
> +      properties:
> +        dr_mode:
> +          const: otg
> +        ports:
> +          required: [port@0]
> +          properties:
> +            port@0:
> +              required: ['#address-cells', '#size-cells',
> +                         endpoint@0, endpoint@1]
> +              # A mux'ed High Speed bus has exactly two connectors, as t=
he
> +              # two endpoints of this port; a plain "endpoint" or any fu=
rther
> +              # endpoint would be a third data stream and is not describ=
ed.
> +              properties:
> +                endpoint: false
> +              patternProperties:
> +                '^endpoint@[01]$':
> +                  required: [usb-role-switch, mux-state]
> +                '^endpoint@([2-9]|[1-9a-f][0-9a-f]+)$': false
> +              # The two connectors must claim opposite mux states.  Kept=
 inside
> +              # this branch: JSON Schema evaluates "properties" of an ab=
sent
> +              # property as true, so the same "oneOf" outside the branch=
 would
> +              # see both alternatives match when "mux-state" is not used=
 at all.
> +              oneOf:
> +                - properties:
> +                    endpoint@0:
> +                      properties:
> +                        mux-state:
> +                          const: 0
> +                    endpoint@1:
> +                      properties:
> +                        mux-state:
> +                          const: 1
> +                - properties:
> +                    endpoint@0:
> +                      properties:
> +                        mux-state:
> +                          const: 1
> +                    endpoint@1:
> +                      properties:
> +                        mux-state:
> +                          const: 0
> +    else:
> +      # Without a mux the High Speed port keeps the generic graph port
> +      # binding, so single-connector controllers are described as before=
 and
> +      # the per-connector properties have no meaning.
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              patternProperties:
> +                '^endpoint@[01]$':
> +                  properties:
> +                    usb-role-switch: false
> +                    mux-state: false

[ ... ]

> @@ -411,9 +481,37 @@ properties:
> =20
>      properties:
>        port@0:
> -        $ref: /schemas/graph.yaml#/properties/port
> +        # The High Speed port carries the controller's HS data stream.  =
Two
> +        # receptacles sharing one HS D+/D- pair are two mux'ed data stre=
ams of
> +        # that one stream, so they are two endpoints of this port and no=
t two
> +        # ports.  A single-connector controller describes the plain "end=
point"
> +        # of the graph binding and is unaffected.
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
>          description: High Speed (HS) data bus.
> =20
> +        patternProperties:
> +          '^endpoint@[01]$':
> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +            unevaluatedProperties: false

[Severity: Low]
Does switching port@0 to /schemas/graph.yaml#/$defs/port-base leave plain
port@0/endpoint nodes without unevaluatedProperties: false when
mux-controls is absent?

In dtschema, $defs/port-base validates ^endpoint(@[0-9a-f]+)?$ against
$defs/endpoint-base (which leaves unevaluatedProperties open for bindings
to extend), whereas /schemas/graph.yaml#/properties/port closes endpoints
with /schemas/graph.yaml#/properties/endpoint.  Because port@0 only adds
unevaluatedProperties: false to ^endpoint@[01]$ and the else branch does
not reference /schemas/graph.yaml#/properties/port, a plain
port@0/endpoint node (or endpoint@2+) on a single-connector controller will
accept arbitrary undocumented properties, including usb-role-switch and
mux-state.

Also, in the then branch, '^endpoint@([2-9]|[1-9a-f][0-9a-f]+)$': false
omits single-digit hex unit addresses a-f, allowing endpoint@a through
endpoint@f.

Referencing $ref: /schemas/graph.yaml#/properties/port under port@0 in the
else branch and changing [2-9] to [2-9a-f] in the then branch pattern would
close both gaps.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125081219.3661=
014-1-xiaqinghuan@mail.ustc.edu.cn?part=3D1
