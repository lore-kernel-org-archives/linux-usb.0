Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ED33DB97A
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 15:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176294; cv=none; b=XQCDfEAEhwtNE8heaHD5p8Mtdvd5XCyU03uE8SnHuIlQAo7J8wa8Kgg788Ia9mlOx4ZlE5QNdzKTYZYQcTkdV2EdQ/q83/W/mvYotjoobrqbcRsnvplZTZ+O8imva+IiFS4aN+uvYoh6yCzVwPyokmgWEP+a+8BCs5ioIOnYu3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176294; c=relaxed/simple;
	bh=pZ9PpJiZh12Hwh/7XmEn8qQxKjkEk7eQcjPzfGPj1DY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qJPFpvJs/q5CCAe9deH/V8lcFkG0abqG8xfuPEEHwc9kDVG/AkPsUeLjmIJPvyU16LOp+BvmdGRbXLeebz2JX/+o2KuR+lBO8MZ49bDPVErqEzrc9wLMS3KubbqsCjlr37AnF2ORtcwB73lDxNGJUteEftjTtRUSSZ2qGnQtSns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5c985f055b9so1161739e0c.0
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 08:11:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176292; x=1790781092;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+skuiLYw/IgGtWcdd1NJ+Hgm0E875s4yIqfpBxdBYoI=;
        b=kC2GWnjBybV6Y4l9rHXPMLAuKqC5P29M+wfPAkhDh9hnapF0WSvVZLLKKr1Cuf3yVj
         cX2CL+RRhgkMuSb5+HOUMzWwlCFkOumFxPBQuAbSF8QJh3jxkx3Hm4KNvdMygLvH7dnJ
         hDo7+u6hXwyRdHxc8+P7ECa8H8pPjIGJGoXaeO8PZnxCg3jRpEQGMhx506uJs3GBgjG9
         HSdFU3NCy+1dvTfrQhrm84GelAhti5AoY4LwGnb91e9LvifEptzpV4z4gScCCDrQo9o5
         InTFRWfvjkspio/D5sVLWapKgyk+ZsusnSKEdYDV548OMeyFp7vSz2n/NjLO45quGRgC
         Bdbg==
X-Forwarded-Encrypted: i=1; AKwUvBxNLwAFAozSrFwNjV/yjKxrfyUKQYwBO9DtCqC4rR9ByFRQMtqsCsMJ5q3oHcGaNVoe29ea9TfY7R4=@vger.kernel.org
X-Gm-Message-State: AFuF++mQ4/i9wXpBZf9QN3SKw2Gew8zeklemt1M7LqszVF6TQxYhP2vN
	40YQPDg415vkXTBfTLQHdSe7Dm3lpPDa340PkKnry9UuFCG68V5bSl1XPBPVnJAzfSM=
X-Gm-Gg: AYBFou35UnJzDwu3aXbU11tJvjTNr4d3kciMRGIDhoy4DSgcb+IRxVf7a9E/tfclwWc
	MCVB+bOn27FRkKfMHu7yGNMYx0FDRFfQAf0vNUUmfcB5XAwVBrT6mxMhukAmAAY4O/h6oYIhtmz
	p+lRjbjLuj/dVR6ozv8z2WjQsvwHBg+FHXt3yPBj127EYc3gv2uc+uEyHXpfxCaSOBM6SXDdk0W
	I1l8oGb0V9a5hbue8wIqX/A4NlzEU8jYx3IuqcYfnupGdMhteuzKBbqiI92MkxRO0C2y7MCMDKI
	GGQC76amr965+nw6D+xOuRmRYFxkyXj1d4ZAPapNjlF/IEtMnSphleIsUiScivis2ImFB5MfBPE
	nrtyo0U47RE9PYsTFlugLX7XEJvfvzWpNfg2Xu1SGSJ0b6+sWmlze6ECw9yM+RLujMMkj1ioy0B
	tATT72kqqx3R9jevASeSgh+UTMWjCqvyFuaQ/xzAjB1T86zAehp2IJPTmvoDR5L07Fiu/M5E5KX
	lk8uyAoqHOGYrovH2Rcwvk/6gTOJVAXrDWEbzyl
X-Received: by 2002:a05:6122:2804:b0:5c7:c898:9817 with SMTP id 71dfb90a1353d-5c9e3481de1mr6395660e0c.7.1790176291171;
        Wed, 23 Sep 2026 08:11:31 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9851691694asm3664338241.1.2026.09.23.08.11.29
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 08:11:30 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5c83fbd23a5so1607957e0c.1
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 08:11:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwEM+x6NO4EKhmIzrHRH/y8A3m+HAYxMBPONiWvqtkKkFmWMLDK76qcsdvxwQizscnVxXi3oTDhmLY=@vger.kernel.org
X-Received: by 2002:a05:6122:2804:b0:5c7:c898:9817 with SMTP id
 71dfb90a1353d-5c9e3481de1mr6395425e0c.7.1790176288382; Wed, 23 Sep 2026
 08:11:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-11-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-11-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 17:11:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX4K8GbT-=qUzWTdhq4bayC3ktE1F+X+z2XnXDi9vCAfA@mail.gmail.com>
X-Gm-Features: AclHuK8E9qilobRH7fLrZ_B96xKE8A0mTA3qi9_owW1vdBVZD4FYLc3dsbXINdI
Message-ID: <CAMuHMdX4K8GbT-=qUzWTdhq4bayC3ktE1F+X+z2XnXDi9vCAfA@mail.gmail.com>
Subject: Re: [PATCH v8 11/11] arm64: dts: renesas: add support for solidrun
 rzg2ul som on hb-ripple
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
> Add support for the SolidRun RZ/G2UL SoM [1] on HummingBoard Ripple [2].
>
> The SoM features:
> - 100Mbps Ethernet with PHY
> - eMMC
> - 512MB/1GB DDR
> - WiFi + Bluetooth
> - SDHI Mux switching between eMMC and Carrier Board
>
> The HummingBoard Ripple is a reduced version of HummingBoard Pulse,
> featuring:
> - 2x USB-2.0 Type-A connector
> - 1x 100Mbps RJ45 Ethernet
> - micro-HDMI connector (not usable with RZ/G2UL SoM)
> - microSD connector
> - mini-PCI-E connector with SIM slot supporting USB-2.0 interface
> - MIPI-CSI Camera Connector (not described without specific camera)
> - RTC with backup battery
>
> The carrier board is identical between RZ/G2L, RZ/G2LC, RZ/G2UL and
> RZ/V2L SoMs, yet only the RZ/G2LC combination has a product page [2].
>
> RZ/G2UL SoM shares SCIF2 pins between on-SoM Bluetooth and carrier
> board. Provide dt overlay changing pin function from uart to gpio led
> control.
>
> While the variant being supported here is named "Ripple", the overlay
> still carries the "pulse" suffix as it would fit all its variants.
>
> Descriptions for eMMC and microSD are shared with G2L SoM and
> HummingBoard IIoT.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2ul-som/
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
