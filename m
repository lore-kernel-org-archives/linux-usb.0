Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843528;
	b=bf49IDPx8uwKC3UG9XPvLqmGOlfyP/nfzdwK8UtEtyK2sFdEJXaoJtB8C6a8cEsf2//k
	 V525D6dXrBM25kycg5dQSEJEoDd7K/E8CnKPPL/ffPjuk0c5GeaPGITIGXcPQekmau2Qh
	 lVk6iVJ/zUUVF9HsGkfnU4aRwxjEK12AwiC/P9TO2XJuEAbMWzIFqByUPXJVoB+xB/kZW
	 cNX5WE3CbU0d9sRHtMn1HZiHNxJTmjh59gMG1f9UCCArvVAW1m4cs8Pt7TmbGdDxUfQkB
	 /WoTYlhSOkYUdwGzIfYlatOSpxoDX2J8d9sCqoFpC2J4Nxleu1wMO3RCgkIwDZmjnrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843528;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OF24Wbpj41CLA7OaRfaL+FsEC5Mrvdj7Ov5RhPIAmas=;
	b=4Ndkth2BQjQYVEIjvQdK7z5EaJw+fUI85wd94Ddo131lJWYUijHvta2JwRYIhkGbzMc9
	 gQy2M/d8dg8N5TJikPdhD6zlgqAVNL/PjX6UFTSZEToEHgaz4FzjbF/Vh2UY+PCgLrffW
	 uHdH5u/p1mDJs+fHKasKi0n/qw/BTWRJnbI22p/x9oTvz/TahNK5TB04+7e+uoSObu+wN
	 4i7lPc7tr/X378CTyD2nilbjHQ6oFUGRlgiUJSLr87Yr5Cr/3V20fX27SVm9g58/Ltden
	 mfP5XpkwSCNsFMHFjELazb9VNtSDiztsCPQp/1cCExJ31YBHg+EjcvWk6o0AqA62mgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="C/kTIsTB";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E9C606A329;
	Mon, 16 Nov 2026 15:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C/kTIsTB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBC271F000C4;
	Mon, 16 Nov 2026 15:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794843528;
	bh=OF24Wbpj41CLA7OaRfaL+FsEC5Mrvdj7Ov5RhPIAmas=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C/kTIsTBaNclaQlIu5wkUidgtY0lOS/vbl4mbw6t4uFvk2DSRo/uXFt0Io7Nn3CrC
	 9DiXe8iSSSrqXGVIH79ROYQfSQmJSopY+UIGvFnGyAPJhA001Wbv8ihY0Rnwm+CklT
	 iSfy7eVpUMbIsskglhnfvio+60Lnv5T3xBAwGNQotCud6eWqXM7UwisrQ2lM4Egr30
	 0KvDT6+zYIfthj8j8M3wgklHZuiLPO1tIQVMp2gnUfFvIIvQzHLh0Ct4GoGkCzfkoE
	 bbtW0S1k1NGal8J3u70wl5Q8L8b30Rge6nelpaWYoFbmjUXe5iKj0ERqmEZnrD1h+B
	 dZi0rjNZPbwZg==
Message-ID: <sashiko-outbox-217310@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/12] dt-bindings: usb: Add Tegra238 XUSB host
 controller support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jon Hunter" <jonathanh@nvidia.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-tegra-usb-v2-2-42efc03a9700@nvidia.com>
References: <20261116-tegra-usb-v2-0-42efc03a9700@nvidia.com>
 <20261116-tegra-usb-v2-2-42efc03a9700@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 15:38:47 +0000
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
- [Low] dt-bindings: usb: unwieldy per-compatible conditionals for
  tegra238-xusb
--

commit 68b69d5e79cc5b22a7419c3753f57282df3a1a08
Author: Jon Hunter <jonathanh@nvidia.com>

dt-bindings: usb: Add Tegra238 XUSB host controller support

This commit adds Device Tree binding support for the Tegra238 XUSB host
controller to nvidia,tegra234-xusb.yaml, constraining its PHYs and
interrupts and requiring direct resets instead of power domains.

> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.y=
aml b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
> index 4e4d7fc352f15..989cce0bb52c1 100644
> --- a/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml

[ ... ]

> @@ -162,11 +173,44 @@ required:
>    - nvidia,xusb-padctl
>    - phys
>    - phy-names
> -  - power-domains
> -  - power-domain-names
> =20
>  allOf:
>    - $ref: usb-xhci.yaml
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nvidia,tegra238-xusb
> +    then:
> +      properties:
> +        interrupts:
> +          maxItems: 8
> +        iommus:
> +          maxItems: 1
> +        power-domains: false
> +        power-domain-names: false
> +        phys:
> +          maxItems: 6
> +        phy-names:
> +          maxItems: 6
> +          items:
> +            enum:
> +              - usb2-0
> +              - usb2-1
> +              - usb2-2
> +              - usb3-0
> +              - usb3-1
> +              - usb3-2
> +      required:
> +        - resets
> +        - reset-names
> +    else:
> +      properties:
> +        resets: false
> +        reset-names: false
> +      required:
> +        - power-domains
> +        - power-domain-names

[Severity: Low]
This isn't a bug, but would nvidia,tegra238-xusb be cleaner as a separate
binding schema document rather than adding another large conditional block =
to
nvidia,tegra234-xusb.yaml?

Tegra238 differs substantially from Tegra234 and Tegra264: it uses resets a=
nd
reset-names instead of power-domains and power-domain-names, supports 6 PHYs
instead of 8, and has different interrupts and iommus limits. Fitting it in=
to
this schema moves power-domains out of the top-level required list and adds
an if/then/else block that overrides most of the properties alongside the
existing per-SoC conditionals.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-tegra-usb-=
v2-0-42efc03a9700@nvidia.com?part=3D2
