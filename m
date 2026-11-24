Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526400;
	b=LfpaUg7d4r9lZQdQuzlS74p5iHFMIPIeU+Kc/FKOa48saJyFbI8UJ7vcru8nB0PtsroQ
	 HtZ7oQhxE4Yge23DuyNjq4oiRV2RymmR8slmhlHr5uFyJr8G8FrL2GSbqxK8hQbMoxkHO
	 Z6+Kmbua+yECicamlzSVUACW+xjG/QvPjEzKsfQN32uscaYg3jCXwCUGiwLU4kuhWPlnA
	 oB4gzJ05zmW9gCYYaqamT59D0jIGofDwLt1bxE1BHQVXe0qQ5hO0yGSjJGQCOl+sLODQl
	 xVLYE9cymgplEzMYeoUnBbHTPgbx1vyaMLEw9boECSah9oY6dmnx5sChnTMjhM6j4bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526400;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KFZSGntA6gY6QjF8Us67JqlKzT17zScK4HvfkqBNygU=;
	b=rh9pmZKMVMG/al8gGIzAUfbZ0fCHP+6fSOBnkIh9GF+180nWQGFBKR9ALSBqd05Y8IeY
	 t89HXzJCLq2+N+t5oRl9SFFt6nORTJRth8BFxU2/TtbVmD2PJRV59LNs2uK1RorZKrPaJ
	 UtNWd/xJ+BylaGcW6a6a2mnCFGqYPwyYAhz7aDR5S1UdnGhlYbhGer1HTz0vxPFJrSfu0
	 oJ+VpHBOoyo0wi0hKm9mkmr0YmSKlrr3P8F0RVReeXALdUb5AihCbqk6R1TrbGnAeqO23
	 G+OFPW6QCtu3dx/m7rBIA3C5QimzVnkhKihO4m918e4BCVV1Fdyg5fNAxOZTImHq1sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mI7v4baZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B8D606A31E;
	Tue, 24 Nov 2026 13:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mI7v4baZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 975B91F000D4;
	Tue, 24 Nov 2026 13:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795526399;
	bh=KFZSGntA6gY6QjF8Us67JqlKzT17zScK4HvfkqBNygU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mI7v4baZG66GEPkhWRLtgzlBuK8c3uXHi+QzRiatDyF/W5Bv6pYGJ5fgk6tp2iUZV
	 2z2qBoxNQeiarKZR+zef55Nl4wCsIbncSPgzgxvSfRF3vMgtIk2r5AFU+17XyKZ2Rl
	 m/eTsxNNlZ+OeR7TXbc6WkF8z5cnLoBA51ZvOQi/j03BrrmccWHcHjEAeQltQeh3KL
	 8ChO828IwOP1kHeVcUMxKLfnntO16mdp2ceZKvJHvAuLreRGQaErhjfMoKzy+ANuxO
	 iKFINu9WgEhZejK++iH1/CktMoPjRqpR0sZgpxWl51uqFC7QlhQfDeb6OS53uPn+cw
	 V4y8sne2sF4Ng==
Message-ID: <sashiko-outbox-231193@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/6] dt-bindings: usb: gadget: udc: add Axiado AX3000
 and AX3005 UDC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-axiado-ax3000-usb-device-controller-v6-1-b991f9b27111@axiado.com>
References: <20261124-axiado-ax3000-usb-device-controller-v6-0-b991f9b27111@axiado.com>
 <20261124-axiado-ax3000-usb-device-controller-v6-1-b991f9b27111@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 13:19:59 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: usb: interrupts listed before clocks in properties
  block
--

commit 755ceb9337fe6b68003fb56f847aa8d22ec06d74
Author: Petar Stepanovic <pstepanovic@axiado.com>

dt-bindings: usb: gadget: udc: add Axiado AX3000 and AX3005 UDC

This commit adds a Devicetree binding schema and MAINTAINERS entry for the
USB device controller in the Axiado AX3000 and AX3005 SoCs.

> diff --git a/Documentation/devicetree/bindings/usb/axiado,ax3000-udc.yaml=
 b/Documentation/devicetree/bindings/usb/axiado,ax3000-udc.yaml
> new file mode 100644
> index 0000000000000..8b9acdb81907f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/axiado,ax3000-udc.yaml
> @@ -0,0 +1,69 @@
[ ... ]
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

[Severity: Low]
This isn't a bug, but in the canonical Devicetree binding property order
clocks should be listed before interrupts.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-axiado-ax3=
000-usb-device-controller-v6-0-b991f9b27111@axiado.com?part=3D1
