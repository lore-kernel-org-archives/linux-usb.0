Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425499;
	b=VWJLbhqPji5eGgHCt6fpIBlmcsGCzYQUsmrnvZ6CznjTRMmYj0QnI2CWSAWaKbQy/vBD
	 BPI68D8ZvSQZ58owzaPeta4dzOiOy4AU6lRFzy8faDxhVC2YczD5pnzXxnsScSw8BcvU1
	 LT09SeFf86yOPSlzyxIEpx6D8becak00cDeECAlxr/1y8va3IcUHWno/ja3HWvdi938Pt
	 44bZMx+10zPfPzIYkCvV2Q+Fwq/w9CYTKdMAGBFS9YnIHITox6dWlNELdRMC/zoxpTj05
	 T4dUT80MAR4CPxRn1Ngnq/cGz4R6r6059bzU1184gB33VxpHS9MciSVlLmbxaxOjMXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425499;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tkQwK+vlDY71q/sHTufjrBA1GVceFaGvMUnyrh1Y1Z0=;
	b=05tsSgggXv9Fq1obhxefGwQ7uhAV8rDUr8BugXnFOFK2U10yoBgiNpKEBRgSuNtNsPL4
	 GwoOMwvJoo8X9MBEkqC4EbRv4FeYkcOhxXRKxbWvKxbxOREEFuuJI4RM+vWsIcr4RDa4q
	 wFh90KU6S3dpwlbDQh5kNrN/T5WPyukRGqOkgNPct3ULhCWYtOlvq6embk7eoCLHHAJbR
	 g/9ZMAn6oL/TZiSM+FPOXo0RMEZK+p1vAFu4LyxeT+ViTI8ahXGw4as4GNfPGO9sJwrtR
	 xjmqCBZ5m2tSi46fcAKuwDHdFLVVwnn+zhuQ/Q7yQEpZmxFL7PUSZybyAqpD8WzhN2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fM9L4tGl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DA7606A327;
	Mon, 23 Nov 2026 09:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fM9L4tGl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 271BD1F00A3E;
	Mon, 23 Nov 2026 09:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795425499;
	bh=tkQwK+vlDY71q/sHTufjrBA1GVceFaGvMUnyrh1Y1Z0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fM9L4tGlklYXxlHwn4DEuhk/nSdDJpQJFxD4prX9G6+ZtY6s3UG6olw8JIoxgRHjC
	 zUITkKvOiXAj4td1syXpnv57NcPhfjIBr5m2m/ogGUNVFTbD5vgEiJLk1/m5Zhq+Bp
	 hCJaq1Zz7F8HVwf6ggTnlsFZfki8qSIWCmXtifFvhOIrjvccU4s9PBN0SWdLDI8qeV
	 hBUTWV6Ll8eEGBdADvGenj1okIFurj9Ok/1QVOAXUAPsBrvlqNnTNevnGUeJf5fLjF
	 TFlvzILtJzNWJ+oL7qSYU5chPHo6CncC+ca9/J/WHXmjFzn5ENngvKbOjjtxQyLZeH
	 AnkLxaXPkrBMA==
Message-ID: <sashiko-outbox-228957@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: cypress,cypd4226: Add
 orientation-gpios property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akash Kumar" <akash.kumar@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123091024.2214918-2-akash.kumar@oss.qualcomm.com>
References: <20261123091024.2214918-1-akash.kumar@oss.qualcomm.com>
 <20261123091024.2214918-2-akash.kumar@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 09:18:18 +0000
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
- [Medium] dt-bindings: usb: cypress,cypd4226: undefined XX token in
  orientation-gpios
- [Low] dt-bindings: usb: cypress,cypd4226: use items list for
  orientation-gpios
--

commit 68e05d99b098ac78032aa1e2d387de700ee8bf5b
Author: Akash Kumar <akash.kumar@oss.qualcomm.com>

dt-bindings: usb: cypress,cypd4226: Add orientation-gpios property

This commit adds the optional orientation-gpios property to the
cypress,cypd4226 binding schema and illustrates it in the example.

> diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml =
b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> index d923ef82ecfaa..5716c045d87ec 100644
> --- a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> +++ b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> @@ -59,6 +59,14 @@ properties:
>      description: enable IRQ remote wakeup, see power/wakeup-source.txt
>      type: boolean
> =20
> +  orientation-gpios:
> +    description:
> +      GPIOs used to sense the CC orientation of each Type-C connector.
> +      Entries are ordered by connector number, i.e. the first entry
> +      corresponds to connector@0 and the second to connector@1.
> +    minItems: 1
> +    maxItems: 2
> +
>  patternProperties:
>    '^connector@[01]$':
>      $ref: /schemas/connector/usb-connector.yaml#

[Severity: Low]
This isn't a bug, but since orientation-gpios has a fixed maximum of two
ordered entries corresponding to connector@0 and connector@1, should this u=
se
an items list with a per-entry description (along with minItems: 1) instead
of maxItems: 2 and enumerating the entries in the description text?

> @@ -129,6 +137,7 @@ examples:
>        };
>      };
>    - |
> +    #include <dt-bindings/gpio/gpio.h>
>      #include <dt-bindings/interrupt-controller/irq.h>
>      i2c {
>          #address-cells =3D <1>;
> @@ -141,6 +150,7 @@ examples:
>              pinctrl-0 =3D <&usb0_intr_state>;
>              pinctrl-names =3D "default";
>              wakeup-source;
> +            orientation-gpios =3D <0>, <&tlmm XX GPIO_ACTIVE_HIGH>;

[Severity: Medium]
Does the undefined placeholder pin number in orientation-gpios cause dtc to
fail with a lexical error when compiling this example?  In addition, this
example node only defines child node connector@0, whereas placing <0> first
and the specifier second assigns the sense line to connector@1.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123091024.2214=
918-1-akash.kumar@oss.qualcomm.com?part=3D1
