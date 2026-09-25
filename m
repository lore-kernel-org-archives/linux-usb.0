Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A6D47884B
	for <linux-usb@vger.kernel.org>; Fri, 25 Sep 2026 08:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790325427; cv=none; b=qklNQ7w4xnaqoHDwBPet0eHT0PnwbIeJjOHAZgyz3yhQxQpqFKdnbf3viAuNNiCFJRmB67Mqk4EdoeyZ0Y/tSkiZdmPU9VudeEHX2JINQmYW4DyQk/oDcq14M7WdP2xSBsg1h3E5CL+mRBxvwuabWEMNGOd83K9kJdtp8VO6h7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790325427; c=relaxed/simple;
	bh=ynpwjG+I+W6n5EtE22Z7G3rUSMwbcRn+9MipAwmrRDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QW/wf9sgjvysIy5bzJwzAhf5hR/tMGRf1DlErxggR55lpPlOY4S35EAB5MKSXRgx5ik8zanm4pEegh81z71mXh7hiD1cNFHfSsh9o7r5jImk2nsYe44iiJC/3RLki5dhD3b4pQ+2/Xj4ikzkqWUd/vPQPZQ8koq57JG6Wd/BJJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-982db8d3b1eso194454241.1
        for <linux-usb@vger.kernel.org>; Fri, 25 Sep 2026 01:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790325419; x=1790930219;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qCNI8jGo1Ov8X30u+i1BBvFQUriwSK3GJhOUtQAjv2Q=;
        b=C6O5+MOtZ11PC+MtwcSj+5WwX5PCU2NHxc/9jbskKUpPbLZUcSJPYdDZveh3HkcSi9
         pO/83wpJxrtI8lSP9pv4Zk5RNTjeOXUiVydVH6Pr6tbPhp3wDj3usrvCJ/z4n4gDXps1
         d50EsFWLRzqdHhwlaJ8odCOeV1OZdcP4X8RafQgJMjL2ZjBuq0i/X1Q2pSZiLaKljwMP
         56MalM8oIKTDIUK3MhaKtkStRCh2mVG6QdcDGqd/roImnn58NYgJkLffNfThbfFUJZqI
         zzCVX1JmOStT9pHDZp9dPgCz1e2cNdj3yEGP2b8kCtrGvq54f1P5hfIOxSW7/gagj/iH
         kmxw==
X-Forwarded-Encrypted: i=1; AKwUvByHIEQE75XFzwDivqOjMADBfMiFUgVzPVrxrr000I+c14MdnyPwevV7QTP3ucreQoeX66IvP6jnhsQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kmQPmvYSSw806BUj8dHoihYnrH0WlXDtW3ITdTA4vPK0a4jIBs
	n5qexOVaA8SSjUWNvepCPWDx+t6NXfzNFrjfLpVTd35Va7ma/WFrA8GIizgo2J/i
X-Gm-Gg: AYBFou0Q5smXTMzd/2tWaOTifqoPS0bmvO9LRc9BS22ysOKfywjYyD5Q42wFRLDX5NN
	XhfHgLS7JZFzNl0uWwO7p4+qlNs1oi4wDi8ZAnlbsiTY1FrBcVlmcn0i9qn+gxtugXgeusbBFbm
	HCLb7tPR24gw2iDpugZ+uo8e+HdhzAGVQW97+vuUcxyZ3XFDvLQTn7aL2g1ljxlRO+Zdt6AI43H
	pq8JLdIVAuBpQ1V5injNMH9js7lXRvsdMEP787O4EpZ8tKvKgHfbacGhogkPrqfd1vPdqYnmANe
	PEnBjCsVc1hKYtBfIBriFT8P8t418PLy2fikxpxNIKRgWDK0fqpUCXijPzrHIOHR9GnOsdY6MHD
	9RtFwNQfoCdEPGwXgDUh6NgSLTg+CZCMAIAzcr6EmL8+wJv2HHHcdhzff7xRajih8p9v2NICE5M
	Oq6PXyIB7TC7Ktu6V98kfZYCqyCJIGbTwgdJoRBCwim9g7Dq1VqVM0lX4O7buZ/7mUZCdH2oPS/
	iV/mP+RRH1OrOp3/u75dlussIFqp+5SBS2t0Q==
X-Received: by 2002:a05:6102:14a3:b0:7a7:198a:c2bf with SMTP id ada2fe7eead31-7b1d5a903d1mr485058137.29.1790325419164;
        Fri, 25 Sep 2026 01:36:59 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b2588a1551sm905060137.5.2026.09.25.01.36.58
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 01:36:58 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-982db8d3b1eso194447241.1
        for <linux-usb@vger.kernel.org>; Fri, 25 Sep 2026 01:36:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzFUG7AeeZ65isHhIsHH6RfIqmWYedR76puBQ+MVH5wGN8FXNG3fuq575Ba87orh54EytXt1e26vuo=@vger.kernel.org
X-Received: by 2002:a05:6102:3f4e:b0:779:5049:87b2 with SMTP id
 ada2fe7eead31-7b1b34d3523mr571652137.0.1790325418233; Fri, 25 Sep 2026
 01:36:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com>
 <20260904-rzg2-sr-boards-v8-1-94c4674927e8@solid-run.com> <CAMuHMdXtcxyD4Zh+HyM1D43zu8KND-18FiLhi9OXTHZPojRH=A@mail.gmail.com>
 <29a64d27-b19e-41e3-8d2f-768cfa8de2e6@solid-run.com>
In-Reply-To: <29a64d27-b19e-41e3-8d2f-768cfa8de2e6@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 25 Sep 2026 10:36:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVHSdXX_xaNAGGtwpUHH2K4NUaDZVsLPjC+aqL6stKxag@mail.gmail.com>
X-Gm-Features: AclHuK8NKCeC4Y5XQE8QASTp0kSvhUAEgHHcCqI-Lvtiu6JPf2U_mHtpxgJb_YI
Message-ID: <CAMuHMdVHSdXX_xaNAGGtwpUHH2K4NUaDZVsLPjC+aqL6stKxag@mail.gmail.com>
Subject: Re: [PATCH v8 01/11] dt-bindings: soc: renesas: Add various SolidRun
 RZ/G2 based boards
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

Hi Josua,

On Fri, 25 Sept 2026 at 10:29, Josua Mayer <josua@solid-run.com> wrote:
> On 9/23/2026 3:42 PM, Geert Uytterhoeven wrote:
> > On Fri, 4 Sept 2026 at 13:56, Josua Mayer <josua@solid-run.com> wrote:
> >> Add bindings for various SolidRun boards and System on Module built
> >> around Renesas RZ/G2 family of SoCs:
> >>
> >> - RZ/G2L SoM [1]
> >> - RZ/V2L SoM [2]
> >>    (shares PCB with G2L and has very similar programming model)
> >> - RZ/G2LC SoM [3]
> >> - RZ/G2UL SoM [4]
> >>    (shares PCB with G2LC but programming model differs largely)
> >> - HummingBoard IIoT [5] (RZ/G2L, RZ/V2L, RZ/G2LC)
> >> - HummingBoard Pro [6] (RZ/G2L, RZ/V2L)
> >> - HummingBoard Base (Ripple) [7] (RZ/G2L, RZ/V2L, RZ/G2LC, RZ/G2UL)
> >>
> >> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
> >> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
> >> [3] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
> >> [4] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2ul-som/
> >> [5] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
> >> [6] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-sbc/
> >> [7] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/
> >>
> >> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >> Signed-off-by: Josua Mayer <josua@solid-run.com>
> > Thanks for your patch!
> >
> >> --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> >> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> >> @@ -508,6 +508,14 @@ properties:
> >>                 - renesas,r9a07g043u12 # RZ/G2UL Type-2
> >>             - const: renesas,r9a07g043
> >>
> >> +      - description: SolidRun RZ/G2UL based boards
> >> +        items:
> >> +          - enum:
> >> +              - solidrun,rzg2ul-hummingboard-ripple # SolidRun RZ/G2UL HummingBoard Ripple
> > As RZ/G2UL is pin-compatible with RZ/G2LC,
> The SoM is, the SoC is more complex.
> SolidRun uses the G2L/G2LC package 15x15mm while G2UL is 13x13.

IC.

> You are correct to expect HB-IIoT, however due to the reduced pin count
> and feature set it is not useful and will likely never get supported by SR.

OK (same for RZ/Five ;-)

> > I guess you could have an
> > RZ/G2UL-based HummingBoard IIoT, too?
> >
> >> +          - const: solidrun,rzg2ul-sr-som
> > Is there any special meaning of the "sr" in the middle of this and all
> > other SoM compatible values?
> > If it just means "SolidRun",
>
> It does.
>
> > I think it can be dropped.
>
> The "sr" is merely to avoid name collision with other SoM vendors.

OK, for non-DT situations where there is no vendor-prefix.

> > However,
> > you already have that for various SoMs with non-Renesas SoCs.
>
> Correct.

OK, so keep it for consistency.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
