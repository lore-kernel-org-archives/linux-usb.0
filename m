Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3644963C8
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 15:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176656; cv=none; b=S9USc5M4J+UKpJmFKQdjVhnTDDCzLuJFkGuVWiu/gxoaToV05zGhuIYb3NaWDR73NXIPgfZ2HtX/dm5xYvVOgvdAOxOCMPXN6ibNCngO3feWOWBg0NUUimUYKIEszTjXK/aNoD0H4durHGOHDZkUXJ8/MS9hExaZESYBr3pbvoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176656; c=relaxed/simple;
	bh=EhjWSKImZwoAXYfqAyTmCpINsx0oSO9M/RawkNvcdAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IihNnt/0EcWyEzOMGbghmuqiBpGlcITPbVLaz23mReKCl+s5G0k33FtAHA2koVLDCQKVRFQH78peGlNPERwJuvko0tom+TyHaK0Hd9rX5dPJCyHm8rjB/SGN3ohR27ADRmiJ5zMG7vtf3DYqkgRhhrSp7Kehp/UpCfxtTwY3C+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4cacd3409so784540a12.2
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 08:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176655; x=1790781455;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sDvgyyoRqIDDfI9/dyDxtj/9kppA0KcEIyfQ/4/NmrM=;
        b=HzTtMzEpZvwWAu6sG643bxixBmtCHxP0DWfhB0LI+RTpGT5UcUubyL8xF49JC6v2Iq
         ZZbah1k7DcyfPBv617d/AR+p7QHmfg4iQrBcA4XNgvX4UDi7IXYgcSD+QXW5EG6wHY+q
         Zcyz697EvBgmi176pCDozrXGTCB0zxP8nzH0ToFOaTXVEfukLW/fuDVmUQoKBwQdviHC
         Nn241cN+r5Pta9XxdQFkjqrKnVv7TwhBF4nFbFhSQ4eDCyt0wdPwRdYCCvdG2l5cbfdw
         NM38P4n4PQChE0owlU+VDfhOAjVXVsZtKpPUwhIt/JAEGBJ2bck6D1NpIuGo0KZzivNi
         U/SQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMJ2ebrrqryv7XLzZ5MV+jT4h3xPwQTCbQLLEvZweDETKJ+W0j9QYW/A3B2JulizpHRV0kZhZKiMI=@vger.kernel.org
X-Gm-Message-State: AFuF++nVrgCRuGhPC6E+XTOw6aAQc1dcdl7FbUS1p/e//yg7uIhaCfNn
	+v5BNuFX+0ATbQCABSYXwRSJoY1TSoK8Ez2wzki610LkW9p4v8nFMbkZgwxiTjg3Uys=
X-Gm-Gg: AYBFou04MDq1/ZVgLhIt6HCYT7X8rQ8h2taN248qjoo7AKAQn4MzwtbWQEb/6SvIdbQ
	cfE2lz26RcS15iJneoQp1tBVk1z7FI76T5CIY7wbPxSBel2tVbk5wmlneCmHrH2T2MpxxHqbzVt
	2ZVQhNWHEWGjrixzSbckIfEShHi0XKZMcLdj2BjNdkx+chco9/SviYrJNA0gWfnUHxfvLJTiH7A
	+nVh0FoDf4ZgTZ6yXpi+YBTQnH55VywrWBi4nG5frsw4Xg6yg6ElCQNkb3lVSV5wHTGr1O//+h3
	hANK6lKAhAcQReYhWfEUFQvZQd68irPz6gnnevoyYyLxZxN30zFwPrRRD5ewh+xrV6jqHtrRYvQ
	b8HBeQCzfqaAOly/IzEAHAot6/YCLBZRaG9J8z8wfXC79qRFWxF0RS2pJqHJo3cw5ziRWovjqmi
	W+UeoDGdvS+75Gzgnm7BWjHF7dIOkzs6GJfr4bqWKGVv2MPKvfpLMwaImGW8RkA6pf9zNpOH03b
	E8vki1+p1buhGPRWqof27/tzU2CWxlvWlk9cg==
X-Received: by 2002:a17:90b:134b:b0:3a0:2900:f584 with SMTP id 98e67ed59e1d1-3a07e67c0demr2860666a91.46.1790176654604;
        Wed, 23 Sep 2026 08:17:34 -0700 (PDT)
Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com. [74.125.229.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07de20ecbsm5609641a91.13.2026.09.23.08.17.34
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 08:17:34 -0700 (PDT)
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-142dd05d97dso778686c88.0
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 08:17:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByosjBY/iDfbqXeG/GbRYnGvJjrVioUD2qA8A25lm3i2pEPB+cKQK0XlqbooY5cZHmIEUVKv/edySk=@vger.kernel.org
X-Received: by 2002:a05:6102:26d3:b0:7a6:accf:72c1 with SMTP id
 ada2fe7eead31-7ac17ff1a5cmr2593444137.0.1790176226764; Wed, 23 Sep 2026
 08:10:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-9-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-9-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 17:10:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVQ47vaVRKRGvwSY1Sy5B9VADC6YOJ7XMt9ruPZdd+hrg@mail.gmail.com>
X-Gm-Features: AclHuK9nr5QPs8sC-PMKUOwR3cdMhCa7cZVvTQqDSW5Li8NuNQleAMbNnooakSU
Message-ID: <CAMuHMdVQ47vaVRKRGvwSY1Sy5B9VADC6YOJ7XMt9ruPZdd+hrg@mail.gmail.com>
Subject: Re: [PATCH v8 09/11] arm64: dts: renesas: add support for solidrun
 hb-ripple with rzv2l som
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
> Add support for the SolidRun HummingBoard Ripple [2] with RZ/V2L
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
> The RZ/V2L SoM shares PCB with RZ/G2L, differing only in the SoC itself.
> RZ/V2L is adding a powerful DRP-AI NPU which G2L lacks.
>
> Due to the similarities, all descriptions except SoC are shared with
> RZ/G2L.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
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
