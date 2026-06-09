Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59AF41C2FF
	for <linux-usb@vger.kernel.org>; Tue,  9 Jun 2026 16:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022756; cv=none; b=H6h0v33j9DIW6OEPCaF4NavZWy1pgZq8Rv/NbIKRbA1uNFRKQtoPWL8gDsWybtXasWNcH8zabuaX1TLBSuL4v14EVAU6cVYt3h28PBYDtMcBLWMRC4ApDafvECkQJk1Q1/MkMy8hJCTOTfLk2X0cgAz1+sCuAZLzuf/Fe3+uN9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022756; c=relaxed/simple;
	bh=/Midjtuh/rfgbab2AV2ai67raWTZg9S7QWnZPf50CGY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=tjsIW+cHwgJWvzfk1psXLc7g6rZtdgZ4kgFcOnNBJ04SYb79I9yulnfozpU5A5ADaKzZGo7dUqz8g86M/2p8Kt8no77uXZxKI6dNHopjZEkWEB+/1Unwfl6BrRlMd4KCgu/8yvelVj7jCmxJoJIecac9DzRwI2UWrw/B1ruEQ0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=QOUagz86; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="QOUagz86"
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1781022750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GU6hxEB3LrImYHmp13AtCCpp8e8bRkCTpxK/TD8cOpY=;
	b=QOUagz86dzoPrDjhHrSwN/06Sdmkq2iGHnAcJWwwkB4jGy9cpZbeuBVKzUQ2wMbiBEhNfS
	fkXZcqO/FX8Da8Q0Jb9q0Ri64dwxeIwsei3wq03ji5x/sDo2a0B2GzHSiIlmdfbqDYKmid
	EBrn1SB3ts5kXNKC6WG9f27WKnnLVyBVAsiozmaoQqJlJEKXdh+T01Ds0t55ucLSSadvdw
	uUknq9hMXc6S/2Q00PMkA2/C5aaG+6n43UK9L2qDQhzLWDO7kxIpqzKkWDvYmcreWWk91w
	ytsziuJNh2KWUV6GtxJWxrmErpQ4KJkuERcFgsEFkG1uOfZG+MkDxu5o+509UA==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 18:32:16 +0200
Message-Id: <DJ4NVA328NUV.LSPMVBFE0PD8@cknow-tech.com>
Subject: Re: [PATCH 1/2] dt-bindings: usb: Add Rockchip RK3568 compatible
 for EHCI and OHCI
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Jonas Karlman" <jonas@kwiboo.se>, "Heiko Stuebner" <heiko@sntech.de>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: "Diederik de Haas" <diederik@cknow-tech.com>,
 <devicetree@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
References: <20260609154124.445182-1-jonas@kwiboo.se>
 <20260609154124.445182-2-jonas@kwiboo.se>
In-Reply-To: <20260609154124.445182-2-jonas@kwiboo.se>
X-Migadu-Flow: FLOW_OUT

Hi Jonas,

On Tue Jun 9, 2026 at 5:41 PM CEST, Jonas Karlman wrote:
> The Rockchip RK3568 EHCI/OHCI controller depends on clk_usbphy1_480m
> being enabled, or the system may freeze when registers are accessed.
>
> Add Rockchip RK3568 EHCI and OHCI compatibles with a similar four-clock
> constraint as RK3588.
>
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> Existing DTs for RK3568 use the plain generic-ehci/ohci compatible,
> next patch make use of these new compatibles and adds the missing
> clk_usbphy1_480m clock references.
> ---
>  .../devicetree/bindings/usb/generic-ehci.yaml          | 10 ++++++++++
>  .../devicetree/bindings/usb/generic-ohci.yaml          |  5 ++++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Do=
cumentation/devicetree/bindings/usb/generic-ehci.yaml
> index 55a5aa7d7a54..c49a1bbc8cfd 100644
> --- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> +++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> @@ -52,6 +52,7 @@ properties:
>                - ibm,476gtr-ehci
>                - nxp,lpc1850-ehci
>                - qca,ar7100-ehci
> +              - rockchip,rk3568-ehci
>                - rockchip,rk3588-ehci
>                - snps,hsdk-v1.0-ehci
>                - socionext,uniphier-ehci
> @@ -186,6 +187,15 @@ allOf:
>        required:
>          - clocks
>          - clock-names
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3568-ehci
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 4

I think that the constraint for rk3588 is this:
- minItems: 1
- maxItems: 4

Like ~ every other compatible; there's no 'branch' for rk3588-ehci.

That's different from what you add for rk3568. Is that deliberate?
Because from the commit message I assumed they should be the same.

>  unevaluatedProperties: false
> =20
> diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Do=
cumentation/devicetree/bindings/usb/generic-ohci.yaml
> index d42f448fa204..5f1b4d2bff89 100644
> --- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> +++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> @@ -47,6 +47,7 @@ properties:
>                - hpe,gxp-ohci
>                - ibm,476gtr-ohci
>                - ingenic,jz4740-ohci
> +              - rockchip,rk3568-ohci
>                - rockchip,rk3588-ohci
>                - snps,hsdk-v1.0-ohci
>            - const: generic-ohci
> @@ -198,7 +199,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: rockchip,rk3588-ohci
> +            enum:
> +              - rockchip,rk3568-ohci
> +              - rockchip,rk3588-ohci

Here they clearly do have the same constraint.

Cheers,
  Diederik

>      then:
>        properties:
>          clocks:

