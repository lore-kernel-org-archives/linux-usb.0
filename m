Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54E1531609
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 13:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790171308; cv=none; b=BQbI/mbqOIcN+Nr1afzUJcoVrBE5mbXWhNOEraz0JnH5GotMl2pNlcK1CzFF1EjVG14cq7cOhbx7+ZOkJ9u2cTouL9sfhccm1OQUEkYzBtTSRkuEpm9ry/QmDxFh+mmKnuDhTvLsQd7cFziAQpN+r51V6DPMVFQ2U+I9DEaHNLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790171308; c=relaxed/simple;
	bh=zQLNcKwt8lnNKrUhZWYc0UbpzKFARTsV6kXIZiSRVZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GHf1yW96r29GDKkJzIP30KOH/oUCEPj+d8FDKZD5IlhSCsCzdCgOvtNyKj1jfw0ppIqIIwh9aPmjfaakjdWVv/IbpeC8Xu9zo9qj9DlDhj1WVlG3aFh+nEQY9R/zhlybUkSC+EYJfeQtsUxX7gk2inH9S70rOaU6Tt9iN0sWpzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c13f2685f2so583942b6e.1
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 06:48:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790171305; x=1790776105;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cZcaHlSLoWG/YlsEmorJF69zsl7G8OYYQpV3ToGZCjU=;
        b=HKcpJZtTTpYIeifIXO5qXn84BxTD5zP/7B2rxVtOVJ8cM9tWQuhp0O5DyqZoE2wbws
         AbcnIB69wHlplAL4RYhhRk0fb9CHYWUQ78bvdf8NFDjPRZNtzqaG9TwLx3cVun6Z0uOX
         toETUVOwI2Jhit/sUDwhYtIBVp4cPffElzj0Gs4azc04DJ/fEpAbsVH8bkFq/tF3tsWY
         YOfgl2wYHHKZYPLXaBVl9PQ5AmuiCdO7lQRDed8M0dZjV9z6bmFVL5WqL85QIZayi66H
         Zstb6SjwgJp64JHbPiCoxI3/RVsYz8fRXhzq8jh6JOVjwiyJI+TpS37YkfuOYCEBa8DF
         g7Jg==
X-Forwarded-Encrypted: i=1; AKwUvBwe82WLjXJcSVFpEtGmYRFYptaH6Qz14aj5ot+BxsI3R6L5Nx3rNM5TVB8UGziG/wq4vj7Wlfw/Hug=@vger.kernel.org
X-Gm-Message-State: AFuF++mFkT5lkp9eghTNyoxmxHLRQlRUILlxZLlaMAW1zuxDKCkGA29d
	3ZTc7v/0xhuidITmt6Ha0BIpdUv3a01jXuRmUhYz87H5i824tk5hs1xnE58fvcIqczY=
X-Gm-Gg: AYBFou1IgURh6D9j7b7uNnzCoAK6O17vCnOsZ/oABvjeR2XKEFHEoGbLyScbeyM9KzN
	40rBbRLSgocROxi9yb/V03W7J6NGAzkIG7VQeFNW4VMbzC/I1Rsqr7QfqG1quXZ3JVbVskqHYhN
	5HwHhQLFkJBXnE7Q/v8ocootLza1h+zjbW3plBCjaoHlVou0MZUUM04Yz1c3qPRXJj8AGTF6M57
	czmaOwy+CruQpIoV1vV6PYp1WkxXxH1OXTCdn1HHEO5ZTPQ0V94eBD5QZGznG6F8PVYf02KECwz
	Lf7RH2c3tEpyyitmw0I0m1OUGX+5QXHs9aQJM5PUcnluDg3YhUnkikGa4FIDEq8U3M/E7wxywQV
	pVK5g6FqcssXyNL50RmpXIU7swWF7YF5rEKHKgiS11TEQl+3W+ov4kmhJhHLenK/0+jJOomBYoZ
	6qn7uXkCnBKS4VMYvEHlJ1IAD2SjLhbSnW8yFxo4piINY3P/NW9q76x3toJDsUg6uxj7oM3ENyp
	tyOVxLtEq0IibCdiiUCGgyT3Un4s9jUQ2XqBQ==
X-Received: by 2002:a05:6808:17aa:b0:4c4:aaaf:fdfa with SMTP id 5614622812f47-4d5b7e62818mr3074173b6e.18.1790171305450;
        Wed, 23 Sep 2026 06:48:25 -0700 (PDT)
Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com. [74.125.231.204])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d5c522b9efsm2036543b6e.18.2026.09.23.06.48.25
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 06:48:25 -0700 (PDT)
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4b37a368895so599202b6e.3
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 06:48:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByYX5JzWcJuStQVCcbV1vuu+u2wsZm8WaMW99LNAB5dlPj/PJWHwIxD0KlghAffrjEDM99XgcKTPl8=@vger.kernel.org
X-Received: by 2002:a05:6102:390e:b0:7a7:195a:1b26 with SMTP id
 ada2fe7eead31-7ac1de3a707mr2471914137.32.1790170950472; Wed, 23 Sep 2026
 06:42:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-1-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-1-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 15:42:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtcxyD4Zh+HyM1D43zu8KND-18FiLhi9OXTHZPojRH=A@mail.gmail.com>
X-Gm-Features: AclHuK-TckegHvHKUKBwHK2truVsVTBXY6gTl27m7I0mB2ihxriiWdVUDyPODHw
Message-ID: <CAMuHMdXtcxyD4Zh+HyM1D43zu8KND-18FiLhi9OXTHZPojRH=A@mail.gmail.com>
Subject: Re: [PATCH v8 01/11] dt-bindings: soc: renesas: Add various SolidRun
 RZ/G2 based boards
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

Hi Joshua,

On Fri, 4 Sept 2026 at 13:56, Josua Mayer <josua@solid-run.com> wrote:
> Add bindings for various SolidRun boards and System on Module built
> around Renesas RZ/G2 family of SoCs:
>
> - RZ/G2L SoM [1]
> - RZ/V2L SoM [2]
>   (shares PCB with G2L and has very similar programming model)
> - RZ/G2LC SoM [3]
> - RZ/G2UL SoM [4]
>   (shares PCB with G2LC but programming model differs largely)
> - HummingBoard IIoT [5] (RZ/G2L, RZ/V2L, RZ/G2LC)
> - HummingBoard Pro [6] (RZ/G2L, RZ/V2L)
> - HummingBoard Base (Ripple) [7] (RZ/G2L, RZ/V2L, RZ/G2LC, RZ/G2UL)
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
> [3] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
> [4] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2ul-som/
> [5] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
> [6] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-sbc/
> [7] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> @@ -508,6 +508,14 @@ properties:
>                - renesas,r9a07g043u12 # RZ/G2UL Type-2
>            - const: renesas,r9a07g043
>
> +      - description: SolidRun RZ/G2UL based boards
> +        items:
> +          - enum:
> +              - solidrun,rzg2ul-hummingboard-ripple # SolidRun RZ/G2UL HummingBoard Ripple

As RZ/G2UL is pin-compatible with RZ/G2LC, I guess you could have an
RZ/G2UL-based HummingBoard IIoT, too?

> +          - const: solidrun,rzg2ul-sr-som

Is there any special meaning of the "sr" in the middle of this and all
other SoM compatible values?
If it just means "SolidRun", I think it can be dropped.  However,
you already have that for various SoMs with non-Renesas SoCs.

> +          - const: renesas,r9a07g043u12 # RZ/G2UL Type-2
> +          - const: renesas,r9a07g043

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
