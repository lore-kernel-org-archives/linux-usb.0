Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B0E4F3937
	for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 17:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790615295; cv=none; b=cgozHobPWvHRkxcu6fJVr44Ej5WgoBQ+FZpgm7DWtHZAXsPydhIPuEJQohexwC1h+ge7MV2Brh3GVKDGnrkoj8KINBemEMr92FgvnWAp355Jeo9mYg0kg3NXBOTO9Af3XN6NVbpyzcim5nQ9+rFXEJoWkv5KNk8X6kUXgUwf878=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790615295; c=relaxed/simple;
	bh=+hIOk59b2H3pTCZgJaBTE5mJHtyR19kXkDBOZEQc6yM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UpVhiTS1cAI2XkxtHlBsVGfFKsU2yehLBGv70ikvcWsluenK3JuoAho5xe4apeVNL8PgvADv+qvQuYfWpZgtipcX3xLo9p9quUrAHewqJzX7/i96vnlkIZyxFcBevkPu75O6pBzv0uXNW3zb/aap0jMnIkqkXV0RgWtNs6h9XyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab201ecso3009481d50.2
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 10:08:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790615292; x=1791220092;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pwLC5W4u+V0GTSh2RZtGBKpKQq0r57Jm6ZwK/nvUP6s=;
        b=g2A3xJWzr9S2I/Ey3oXmgir5zFioi6Xg3q/eliuTkL51+3bR9hBHlt3SQ/rPo5LSlM
         ZX1nhMYl55DlFKFFpmgOQhUelviB/gCbgnpC98CMqHGT5IehUw7DN7B/QhSr354M/ESM
         +rZs7j+pEHHMmuw46VeLVLEIBgojMe4Fb0ogOqfnC+8VJFdORhH4yLH+Znl04PRaDQ1M
         WvhylXgIM/gIFgeE+ibOvyhvv92C16z9zmYoC7GjrOjxuLKNH0glcmf7IO4wXkZsf5aH
         h9+M2QiNdh17qBmoxnAFrBg5d5ga8QyEOAz5hysPoT6z6nj6b6tPc1uahczcKNpmZUhB
         lyWA==
X-Forwarded-Encrypted: i=1; AKwUvBxPscUKPkJmcIKYM9WwJ0cg/A/YfNhhTHFgHQI1np0pP1EL1C0fz9yJ7ziimo6s3Czq8ZkhZycgOwk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIh6nYBPh+FIThQOdDZkufa7FVdJ8sRn1qYFTUta/TkB/4coVyJ
	u5RrZwUHOx/7ed8RDzMl+V88i3z1K9YM2fsPwMR2yBs1lsDvIsCRzX4qMwiaKbvWwJw=
X-Gm-Gg: AYBFou0MV1uT2RRTIENoqeCmPJwqLWY2OGy8jeWPCJ8cYhGyg+51BukGuBuNbpMbdwp
	XAG/vG9WTLgzYlGOOIo9ta8YJzgYmpWSoTRP3+imjhWbGbSwPx9v5Zekk1o25GQykwOc8mzV+Ti
	NBQj/M2kmVq4oKhZ2ULx+cZA6pfVNJtrYHlK9ELm3dYBqDuCYxc1Q0/jvUbPVZVq6hH0e9wuDe0
	oyMsuJrIf9St3oaIKI5SIxci4XkWhr1+3r4+OuG/1IQBKnZMcsaSP+8xQGvOhlrlwRE9QSoHVBv
	SLs/7RnfUjATpN0QeUuNxunyrfrCMohUD5HVL4R32uG8fXgDmhgsUO7WywqLX2eP59tjBQbtBH0
	J3aJXLMpkEUsvW37669H8uGp+c1L5VSCvPsBBSm0xSmkpCNsYiUqyv1WQfM9TU1TvKd/FcfU+OS
	KruKAubdEv9rRmUeX5SQ3m3T/qvkBkCW6uBVn5IomFKCqPzFQyugCasPwwWf3m8pFWvXUTrE6Uu
	rj+9gIaBiKE/IjbDqUAePWTXTVI8ntDNnBiLg==
X-Received: by 2002:a05:690e:d0a:b0:675:47ba:217f with SMTP id 956f58d0204a3-67547ba26d8mr1378255d50.6.1790615292206;
        Mon, 28 Sep 2026 10:08:12 -0700 (PDT)
Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com. [74.125.230.205])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91430dda494sm84925776d6.23.2026.09.28.10.08.11
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 10:08:11 -0700 (PDT)
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530fa0716f6so36582391cf.3
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 10:08:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByfR0WUb7+7PEqvU3ThVeuY5jI3sXqdCN+xQorJtwcMB753dmiG4OjCQ0/jZU8z4KIsbOA/eXhBbig=@vger.kernel.org
X-Received: by 2002:a05:6102:1627:b0:7b3:67d6:4d7f with SMTP id
 ada2fe7eead31-7b367d65363mr1527719137.17.1790614816969; Mon, 28 Sep 2026
 10:00:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-rzg2-sr-boards-v9-0-5901e0fc9e44@solid-run.com>
 <20260928-rzg2-sr-boards-v9-8-5901e0fc9e44@solid-run.com> <CAMuHMdUEC9YoZySP3+-UMP0s9XHg4OOsS1Lh65ew2zka=5RC+Q@mail.gmail.com>
 <1a208595-6442-43d3-b1e8-c4f93856a7ea@solid-run.com>
In-Reply-To: <1a208595-6442-43d3-b1e8-c4f93856a7ea@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 19:00:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXAe7U1u69L-O5bvErXN6V3L-=59ewYezcEHcoDodjQpg@mail.gmail.com>
X-Gm-Features: AclHuK_mHVsKKXBL6m4Sk57vt_PCy6cF4ftlcvUQYkzUcI9-oEgY3mVcHJJ2ndQ
Message-ID: <CAMuHMdXAe7U1u69L-O5bvErXN6V3L-=59ewYezcEHcoDodjQpg@mail.gmail.com>
Subject: Re: [PATCH v9 08/11] arm64: dts: renesas: add support for solidrun
 hb-ripple with rzg2l som
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
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Josua,

On Mon, 28 Sept 2026 at 18:21, Josua Mayer <josua@solid-run.com> wrote:
> Am 28.09.26 um 18:10 schrieb Geert Uytterhoeven:
> > On Mon, 28 Sept 2026 at 16:40, Josua Mayer <josua@solid-run.com> wrote:
> >> Add support for the SolidRun HummingBoard Ripple [2] with RZ/G2L
> >> SoM [1].
> >>
> >> The HummingBoard Ripple is a reduced version of HummingBoard Pulse,
> >> featuring:
> >> - 2x USB-2.0 Type-A connector
> >> - 1x 1Gbps RJ45 Ethernet
> >> - micro-HDMI connector
> >> - microSD connector
> >> - mini-PCI-E connector with SIM slot supporting USB-2.0 interface
> >> - MIPI-CSI Camera Connector (not described without specific camera)
> >> - RTC with backup battery
> >>
> >> The carrier board is identical between RZ/G2L, RZ/G2LC, RZ/G2UL and
> >> RZ/V2L SoMs, yet only the RZ/G2LC combination has a product page [2].
> >>
> >> While the variant being supported here is named "Ripple", shared include
> >> files are still named according to the full board for consistency with
> >> schematics, silk screen labels and other SoMs on same board.
> >>
> >> Description for microSD is shared with HummingBoard IIoT.
> >>
> >> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
> >> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/
> >>
> >> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >> Signed-off-by: Josua Mayer <josua@solid-run.com>
> > Thanks for the update!
> >
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
> >> @@ -0,0 +1,17 @@
> >> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +/*
> >> + * Copyright 2025 Josua Mayer <josua@solid-run.com>
> >> + */
> >> +
> >> +/dts-v1/;
> >> +
> >> +#include "r9a07g044l2.dtsi"
> >> +#include "rzg2l-sr-som.dtsi"
> >> +#include "rzg2l-hummingboard-ripple.dtsi"
> >> +#include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"
> > This new include is not needed, as rzg2l-hummingboard-ripple.dtsi
> > already includes it:
> >
> >
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
> >> @@ -0,0 +1,125 @@
> >> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +/*
> >> + * Copyright 2025 Josua Mayer <josua@solid-run.com>
> >> + */
> >> +
> >> +#include "rzg2l-hummingboard-pulse-common.dtsi"
> >> +#include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"
> > Same for patch [09/11].
> >
> > Patch [10/11] is fine, as that one does not share
> > rzg2l-hummingboard-ripple.dtsi.
> >
> > As the rest LGTM, I can fix that while applying, so no need to send
> > a v10.
>
> Thanks!
>
> Since Sashiko also found a small issue in patch 11/11 ... v10 can still
> be considered.

OK.

> To the includes, I would actually suggest a different solution for the
> duplicate include,
> considering that I got confused about it:
>
> diff --git
> a/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
> b/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
> index 493a2b9b51d25..95a36f8804b55 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
> @@ -7,8 +7,9 @@
>
>   #include "r9a07g044l2.dtsi"
>   #include "rzg2l-sr-som.dtsi"
> -#include "rzg2l-hummingboard-ripple.dtsi"
> +#include "rzg2l-hummingboard-pulse-common.dtsi"
>   #include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"
> +#include "rzg2l-hummingboard-ripple.dtsi"
>
>   / {
>       compatible = "solidrun,rzg2l-hummingboard-ripple",
> "solidrun,rzg2l-sr-som",
> diff --git
> a/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple.dts
> b/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple.dts
> index 3df7c67d75a25..0c73871524541 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple.dts
> @@ -7,8 +7,9 @@
>
>   #include "r9a07g054l2.dtsi"
>   #include "rzg2l-sr-som.dtsi"
> -#include "rzg2l-hummingboard-ripple.dtsi"
> +#include "rzg2l-hummingboard-pulse-common.dtsi"
>   #include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"
> +#include "rzg2l-hummingboard-ripple.dtsi"
>
>   / {
>       compatible = "solidrun,rzv2l-hummingboard-ripple",
> "solidrun,rzv2l-sr-som",
> diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
> b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
> index d5bd9b7de4282..aeb92630f4c6b 100644
> --- a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
> @@ -3,9 +3,6 @@
>    * Copyright 2025 Josua Mayer <josua@solid-run.com>
>    */
>
> -#include "rzg2l-hummingboard-pulse-common.dtsi"
> -#include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"
> -
>   / {
>       aliases {
>           /* this board does not use second phy / ethernet on SoM */

That sounds good to me, too.

BTW, there seem to be more commonalities that can be factored out of
rzg2l-hummingboard-ripple.dtsi and r9a07g044c2-hummingboard-ripple.dts.
Of course that can be done later, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
