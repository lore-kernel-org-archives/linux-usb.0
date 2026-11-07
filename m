Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794014631;
	b=pPC5q0uc/Pj9Tu6zDI7NeW6LiEAYdfUK9nkQ1DzuZPIs9Ivd+rNhaOQD6SsAvs2LE6k3
	 vz2ET/dLINRQ6gyKRSrfzqtwuzz6BvX/R+EgFB+McGGxl28n7BlnA7xZ9QXc5k3I/EiKX
	 hxSc+lXWMfOnwNx1q8v3jbgyNbAn78bOECpReVEfAHHC9hdjEijUyznvogbztgftf5pYP
	 ClxYwoAQliYuu1tVvEaKn11a5rvEc+Y7BCjpc965HSxGla1RQOqQyxhFRyAavunIN5Pc6
	 0QtG35yAC9VuwR+s+aEAPfNbJQgcX8F+y5sDJNsDoWZO+H1THpYyVrTddXetxKvh46g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794014631;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=o+HcSjTqd4re5RNgrVp3CqZYYxui6PARuEPwzL/ZM0g=;
	b=sZxRWY6p1bd1/+P/Xq5AJzWgEV1qNAS5n5wVSKCEXGa37Os4fIVsg1iPafWyYbU3m6e0
	 9LkW01NytXwFVpl37kHGe3EjBVvsRfSYUsVxOg3gapJuL2d3Ki8vE0OJ3gh9wZOpjDdVn
	 po2oUy4B1iHwnhkHaspGGDwc5ZSfkECWvlxvdXS97cJEDW2J/dvgvlp0wZDI8RIO7WHlq
	 YnfqxNXPnDNiAM0ntyYO5lhrKt2h1hCcKzGjdG06MMFYau2b7aHoZ2nNqK/40IqfdwuOG
	 W2uJypgsQd/neJrB05ew8FYZhUnpSmKVUwbti2X4kkxp8q1rNKZ/xiHwwcycRCHY1jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i5O7bq17;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42919606A32D;
	Sat,  7 Nov 2026 01:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i5O7bq17
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE5C11F0089F;
	Sat,  7 Nov 2026 01:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794014631;
	bh=o+HcSjTqd4re5RNgrVp3CqZYYxui6PARuEPwzL/ZM0g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i5O7bq17/j/SSWKhZ/WLf7lgCNHMr+JblN+4AY85qtih4sF5zsoXWJEYLcYYYHW8g
	 2YMZyGKeo+uzXViKz0XMjccrjd6xhXy8g6nM+aUE8VRuVZpKkTOmbiYVTefqUCfcxg
	 FPI51k9M3yqYHoYlASVfQ7q5lb+ajYxDCcnRbYHshTtdZGnAeTqpsvkY9/KI90gZ4q
	 Qp/y8bMiIqfjR5juLlNOXYK1yMURbzhyedsamfn5wskjUwzYZR3eKfqtPhST6RBaQX
	 BV35VSzROhTAbM9QMwHbq5hsaApVCceWMu1ZuOK+ckH6DVD6QKIGbBcua50gJv6z9N
	 V2r353GtZjYmQ==
Message-ID: <sashiko-outbox-202460@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: usb: add Realtek RTS5453H Type-C port
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gary Yang" <gary.yang@cixtech.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261107011012.3655873-2-gary.yang@cixtech.com>
References: <20261107011012.3655873-1-gary.yang@cixtech.com>
 <20261107011012.3655873-2-gary.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 01:23:50 +0000
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
- [Low] dt-bindings: usb: rts5453h uses addressed connector pattern for
  single port
- [Low] dt-bindings: usb: rts5453h unconditionally requires
  try-power-role
--

commit bf789180bfcb329a121d357c95111fa527217ccf
Author: Gary Yang <gary.yang@cixtech.com>

dt-bindings: usb: add Realtek RTS5453H Type-C port controller

This commit adds the Device Tree binding schema for the Realtek RTS5453H
I2C-connected USB Type-C port controller.

> diff --git a/Documentation/devicetree/bindings/usb/realtek,rts5453h.yaml =
b/Documentation/devicetree/bindings/usb/realtek,rts5453h.yaml
> new file mode 100644
> index 0000000000000..535aa23794273
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/realtek,rts5453h.yaml
> @@ -0,0 +1,126 @@

[ ... ]

> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  interrupts:
> +    maxItems: 1
> +
> +patternProperties:
> +  '^connector@[0-9a-f]+$':
> +    type: object
> +    $ref: /schemas/connector/usb-connector.yaml#
> +    unevaluatedProperties: false
> +    description:
> +      The USB Type-C connector managed by this controller.
> +
> +    required:
> +      - reg
> +      - data-role
> +      - power-role
> +      - try-power-role

[Severity: Low]
Should try-power-role be optional here instead of required?

In usb-connector.yaml and typec_get_fw_cap(), try-power-role only applies
when power-role is "dual" and is optional even for dual-role ports.
Requiring it unconditionally forces fixed source-only or sink-only ports
(including the example below with power-role =3D "source") and dual-role
ports without a preferred role to specify an inapplicable property.

> +
> +required:
> +  - compatible
> +  - reg
> +  - '#address-cells'
> +  - '#size-cells'
> +  - interrupts

[Severity: Low]
Since the RTS5453H manages a single USB Type-C connector, should this
define a single "connector" object property in properties (and list
"connector" in required) instead of using patternProperties with unit
addresses?

Using '^connector@[0-9a-f]+$' with '#address-cells', '#size-cells', and
reg allows multiple connector child nodes at arbitrary unit addresses
while leaving the connector node itself optional on the controller.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107011012.3655=
873-1-gary.yang@cixtech.com?part=3D1
