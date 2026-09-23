Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845DF521884
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 15:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176171; cv=none; b=ZFmk7hpr6FDvwtTpJD+RdYnpwYYgQXwvhQTkDtOri9/hXeenR04SrFTq1HDYQu6gpuoMpenWOadJRYeN/e4vFO+RgUv6KblRlDbvWhakJqQacd3R/iWbK352/wX1vcKrJwZ/8AfvU0E6sl47P0fHJ67z+bWKmAu38c1DHrOzNCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176171; c=relaxed/simple;
	bh=3CAD3EBkGvkw8ITbSCbAKxzYiupi8Enwarxa/dgYn1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T5W7+QXLVqWOiP3KmuCcToRakTmJ6XZtzKbG3Yj4F94+IkL48JJvr1pY5EErRZYcp9knbXKLf+/Jx1TDat0Gkut9+i4+AVDjuxxOU3kNMVPTveoJ7NE0/xHPuXi0/ELsvH5wi0DSGSHLCeXBcD7PgGspCYKukI3rNTc6hKMi4y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f43.google.com with SMTP id 71dfb90a1353d-5c82bb05ddaso826342e0c.3
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 08:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176168; x=1790780968;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6YS2k2hncr+GFNhOluY330WU9W5Yzfq4y1ZEwqZxKbc=;
        b=nVlksnrhDwixC/Nov6Pr8aWnTL0/llxxCpzXDng/7hOdNRC+McrFt5mP7ea+WKycu5
         VW8CtbqrS/o4Vse7km1pt3/FzBxLhEoKamGz4Vvzw9jDwhHqeFr/wQ7Nfd//7L6tYpaw
         vF8fW7B+tJRJQEaL+w1AF2oKQDTPjD5rcw+kp81sisKbwqUgCXy9d4WVaqtF5g/ecnAg
         jC+kwV6kgo0afrnB6XLL1lh9n8sLHzpqAB9afvtNJL46wKnFQp3ZIdF6t3MPJ1Oiy80b
         b4nNFlez4g47uOtjW0zniPbY2FscNZv9zZDCRxlEH16ShKyU5P1mnNUtEoiAB7R3pzwH
         Sxzg==
X-Forwarded-Encrypted: i=1; AKwUvBy7Hj9MIy25l7K8F17WVwsYEmcimyrERdS5yd7UoeUJNltSdUA7Ts+VE4eKdGnne4RpqqoMF4tiPv0=@vger.kernel.org
X-Gm-Message-State: AFuF++lIpcqoej+CXhkGrY0Rm30eBiGfzblIcsEedseJ+BILoJZlJXPW
	nwdN51doHPegFDC5gxuNBr9iKcw31DNzMfwkG8CB3vkJtxCzuy0XRkI6zun26fEf7zk=
X-Gm-Gg: AYBFou0nCa/FCwFYJZR5M3bg84GPTHyO8MlnwezPEDHa4chJ/YJ+Qv79AXRRdtH82wM
	+YAUZxUXIEAUCxW0bLyJUc1kMadquHkDYsSLHj1OaNpbVZuEYlcWi6yjv5Sx0qtzuJvDggJL5Jg
	NW1DazSsG5tHGZQfHyBvIaOvWJiknKGFF0/2IFG/V1wPm14vwrtK7/cmjPWoZ06Fk9YksPv04du
	yBAtw0bG2SZp22qv0v5o+ZaNeAvq9MiOdA2oUS0tPvs9kisra876yLWwkTr+XT3ZTTei6yWtS/P
	3Cu/jKXc8zTaXc548lVPxjgL1pzQ0W/azfoIhRFQLPbOzETkKvEzRdzr0JJMkS9YsVD1vPpuhTo
	DQfSGZtfzqZ+xpUf3z8kZrzJkVP0FsGhNWd+QfjQ1Q1B6ucTOdKSZgBZpTvn/U9A84ZIP8g138A
	njFiUGosq4gWbVih/alYJfCtlF4ryte6b1Y1RECvNOKNyqzt3boi/AoGmlEAOoUp7AYsNBHM3J7
	Dty26T9slcjDdhhnaR4Efd+Xa63rf0dWjWB
X-Received: by 2002:a05:6122:1313:b0:5c9:c60e:5cf7 with SMTP id 71dfb90a1353d-5c9f16bee0fmr3308695e0c.21.1790176168302;
        Wed, 23 Sep 2026 08:09:28 -0700 (PDT)
Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com. [74.125.227.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f053f9b2sm3301367e0c.14.2026.09.23.08.09.27
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 08:09:27 -0700 (PDT)
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-79189dbfb32so195471137.1
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 08:09:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzzDQrnTr39EEcpY54riQ9GuuoH4wxHXKzWs828RJ86rH4YxflPJDU2xgV+W2SpHZCc9twPBYisulk=@vger.kernel.org
X-Received: by 2002:a05:6102:f83:b0:7a1:f7e2:aae3 with SMTP id
 ada2fe7eead31-7ac1d0cb103mr2545079137.21.1790176167279; Wed, 23 Sep 2026
 08:09:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-8-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-8-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 17:09:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUzDBMVEV7VP4JeoKFvbbYs6txYqHzw+j4qnvkKZJ3Zyw@mail.gmail.com>
X-Gm-Features: AclHuK9TWKX7_LFBBJY6lEHypNQ2_JvEQbFVziKurEpWXaJo034l1OL9z_ll5Zs
Message-ID: <CAMuHMdUzDBMVEV7VP4JeoKFvbbYs6txYqHzw+j4qnvkKZJ3Zyw@mail.gmail.com>
Subject: Re: [PATCH v8 08/11] arm64: dts: renesas: add support for solidrun
 hb-ripple with rzg2l som
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
> Add support for the SolidRun HummingBoard Ripple [2] with RZ/G2L
> SoM [1].
>
> The HummingBoard Ripple is a reduced version of HummingBoard Pulse,
> featuring:
> - 2x USB-2.0 Type-A connector
> - 1x 1Gbps RJ45 Ethernet
> - micro-HDMI connector
> - microSD connector
> - mini-PCI-E connector with SIM slot supporting USB-2.0 interface
> - MIPI-CSI Camera Connector (not described without specific camera)
> - RTC with backup battery
>
> The carrier board is identical between RZ/G2L, RZ/G2LC, RZ/G2UL and
> RZ/V2L SoMs, yet only the RZ/G2LC combination has a product page [2].
>
> While the variant being supported here is named "Ripple", shared include
> files are still named according to the full board for consistency with
> schematics, silk screen labels and other SoMs on same board.
>
> Description for microSD is shared with HummingBoard IIoT.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

I didn't compare with the board schematics, but the rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
