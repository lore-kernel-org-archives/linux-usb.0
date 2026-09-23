Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63D043FD3B
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 15:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176259; cv=none; b=at8dWtq2t5dhfHrF8nsCpIbtV6ohMdTIpp2WcuGX0EauKE6zX2EMLzteutequmsPoRhS5PJiOxsr2gwhYDb4Qq3PhoN9wpkUrtcnH1EqS81DRjKvJEXv5DqBbZSDeZwXmQxWV3G94rVFfBXjEUhf1K1EOTAT8LmQrKS6rNKYTl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176259; c=relaxed/simple;
	bh=4At2W+U2/moj7AT8T+hicJRX9oknEhtMUmhLAdjqwNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zfzth1W9NCQHdpMiwIJMB/Id56XZM+aO4IzTIoZ79XrIU3uhVPx/am8qzwXYVw/n+7UfFmxRw8p4fKtnkAeV8TzVlrsAkJNyxaKeTo320aTH0jCjRSravT3YH9qRc088fRN9f0QutgOgxbQH5B/LR3sb0oQngYv7KdoxDuq3RtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-791a9878aa9so358776137.0
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 08:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176256; x=1790781056;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cCnq/zzLYRUWzxPlHY5tjdaCgBAl1dYFcApPP+PgMMU=;
        b=ENQMYLwZICq3Gy/0t5wCH5aObs84gbAC00O4cF5G1EdoUXGTCK1c2naildPsHJeKyG
         a2yn16POddfxYpSObptV+vvMGOVryRjH1hxvP2AZPX1Mz+sFXTQ2j6FSSpX321PHy2sO
         E0KYKkMGCkTFFyTZhtkFxd3EnUJbhDpfbpKuIoQxgmHJh9chp9tjqJuNf/ZoGI3IRzVx
         yyL+Lfj81CcWm1r6Ljxf2+RqG0jBw0b3IIa3mzwUC0TIU2NxKucosGiUSgm9Ahe3KMuN
         qlrPEmegOPIlLcpRu6JzLW762y5lA1AKkuqN0yE0OQ2A9/hOYs9Pkj6xa4PShCrPQH+D
         yTdw==
X-Forwarded-Encrypted: i=1; AKwUvBwQ7Qu4+Lwi3daSZ/N8Ftx92cG0bdz/iAvLFr55pkOOKFzYA1xPANRHaV6UP+cS+RvZZBaXw3XWdI8=@vger.kernel.org
X-Gm-Message-State: AFuF++nKGt4Aac1hyw83lFQZID1Vgu8wb7kMVIpe9uOHJPMrzqR76iJb
	Ea2cHHqyJCyngOBEzwTus198wsFQC9mEQwrUJH3VWOkXZClnQ7Da6Ue3lO7ucIeAc1U=
X-Gm-Gg: AYBFou3MKoGORF9WovoF2VYz6iPjVSXvpmo9CsGRKUuL1TH2Q7MfVeASiPd28tML44n
	0KE2zNQXw++1AblJDV/S/JdglArXJObIvjuPiVTMhcs/ETogqJCLzmWjYY1pVk25Sy9mqNXI7lK
	dLTXtuFmiuj3+CJR+JYObQnET4UqeC6FjOcuFV60M4epgnp0uqiHsqxrWRGALCGcFaJE9lYey6v
	sEQqeLxLoazAo7e8XG/w3/scT+x23JdHnehuoUozvrKPeheIlOCWArRpfkdQz5dlh1AhHuK80g+
	2yhVGXfCdKvOu/GbRxfTL/d0jQtQSb6QpcSELqlmRx1laxuBTqXd3xjyooQnm7kQwVrZb/rKc9J
	jE0gPGiTaU0yxxl5JgZyiQHSv0zU/DuwWkt+GPZTc3e4yjqt280OhE3S+rogHm2c0T3g33zaGEH
	fuHqKdj9taBBR5ykYZn+Lws7h76sgldUZ0KLNAYDgDV61VILO1uwAx2haNO3NtVu8FpuC55hesc
	xlqTK76FGnNh6h9Nzg7xEpj822yeO4Bp/QIUEasvGYp39I=
X-Received: by 2002:a05:6102:390e:b0:7a1:f9df:e35c with SMTP id ada2fe7eead31-7ac1e45a0b9mr2779431137.35.1790176256392;
        Wed, 23 Sep 2026 08:10:56 -0700 (PDT)
Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com. [74.125.227.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf5674f44sm3738032137.3.2026.09.23.08.10.55
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 08:10:55 -0700 (PDT)
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c67e5292faso494240e0c.1
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 08:10:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByFK8k96v9p6VGb+1YEjbRA/PmCxhW/ZDtPDubsYUl6vEsJQfPkpQHnfP1tNYmyEzGuwElsGjT1b08=@vger.kernel.org
X-Received: by 2002:a05:6122:1d06:b0:5c9:a60b:e5d1 with SMTP id
 71dfb90a1353d-5c9f165640fmr3422858e0c.11.1790176255382; Wed, 23 Sep 2026
 08:10:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-10-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-10-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 17:10:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWjRu+cPZo7V0jErowLp6n2xinAXtw9Pt=On-nshBH-Eg@mail.gmail.com>
X-Gm-Features: AclHuK-BF50Mc9e7D97YaSRELj5RHb8ahiU8YbPOF3bWrJ1zKR2oLG_CwN8d9Yc
Message-ID: <CAMuHMdWjRu+cPZo7V0jErowLp6n2xinAXtw9Pt=On-nshBH-Eg@mail.gmail.com>
Subject: Re: [PATCH v8 10/11] arm64: dts: renesas: add support for solidrun
 hb-ripple with rzg2lc som
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 13:56, Josua Mayer <josua@solid-run.com> wrote:
> Add support for the SolidRun HummingBoard Ripple [2] with RZ/G2LC
> SoM [1].
>
> The HummingBoard Ripple is a reduced version of HummingBoard Pulse,
> featuring:
> - 2x USB-2.0 Type-A connector
> - 1x 100Mbps RJ45 Ethernet
> - micro-HDMI connector
> - microSD connector
> - mini-PCI-E connector with SIM slot supporting USB-2.0 interface
> - MIPI-CSI Camera Connector (not described without specific camera)
> - RTC with backup battery
>
> The carrier board is identical between RZ/G2L, RZ/G2LC, RZ/G2UL and
> RZ/V2L SoMs, yet only the RZ/G2LC combination has a product page [2].
>
> RZ/G2LC SoM shares SCIF2 pins between on-SoM Bluetooth and carrier
> board. Provide dt overlay changing pin function from uart to gpio led
> control.
>
> While the variant being supported here is named "Ripple", the overlay
> still carries the "pulse" suffix as it would fit all its variants.
>
> Descriptions for eMMC and microSD are shared with G2L SoM and
> HummingBoard IIoT.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

I didn't compare with the board schematics, but it LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
