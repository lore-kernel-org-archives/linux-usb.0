Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com [74.125.227.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50014E9C31
	for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 16:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790611841; cv=none; b=O/XPuKucgmbGWnqvoVrPGi2eLAdNMxjkbVYo9NPQ6gMaWVgNH2UDJpUIJ99Y3qKhNikVMGx5gv5dn5b7K+NVxHlBJ/Qmi8R+1NNcd1I0l7GYox417HPL8PJPEquh+l2u8ZFtB4eDEYYWqOxe66fR62YarUyTr3Fow/IsfMJbLhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790611841; c=relaxed/simple;
	bh=S5jmAjj9EtbV2wtaU3tPzm8z57h4Nf5RYtIBVSwNH7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WND05UZOK+haOvJRDNB2R6Wcg0s/EZnJ6FflpS4qVlEGONazZz3pZNS+sxtkKA6LbbihAZEOZKSjZlLm7/4G0fOu0HJTHyHM+LEEtGV7+bExva87zFoHyXT8YWgZ9JifawQLvJsRgyGg0W1jVWKyYaCfoxdGuWP86f4kg+/SOCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f38.google.com with SMTP id ada2fe7eead31-7b2eb9b9809so1585490137.3
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 09:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790611838; x=1791216638;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8Q0b6nlsGqU/6knVqqPIUET6/nAm7GVMX2LsazzutA0=;
        b=1nEHlv/+PppSdONFU1Z8vq+zmqnI1l9iizVyyUyp9JOWC6gSj3t84iIteJsxvVoqYe
         XdI2RRqS1udNbhmCIjwM0AecnV7lZbS3i+shhyGqMJbC1ATFjUIbR+rSIS3EyUSuTYs4
         S6JEfUsGHshRFFLz9k+U67UGSZ1Zs4B53VyfSXsOXlp2XE4PEfA44XVIOXBEIlLexYt+
         ZPuwej4crXvMfgrN4pVG63RX7DgohWVm3NTojSeHMpMKIkajdn5mtx8K6W22l/ddMJ/a
         MdHVZ8fdDEJ2XgQTedANdJ7dpT6pZBA7zDz89owFpvimrgz6CvGNNWvgn3Q4/yDeiy/x
         VU2A==
X-Forwarded-Encrypted: i=1; AKwUvBwbIsiEU75p+15n7bWc/j6eWTAmpudiHLWT1L9OHye13yxMZWx+VFaAEthGBIRJYYRCODmbf4UNnX4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJq34xc0WOGmLeG0ovdzy3I4mw8lIidmqEWi2YgvQiCTesUVOih
	ilBuBK9ihA4RP7gKIci0qNpNZLTUsYWb9SVoXANbDJrw3QdmaCnaV7D3K8q/IYV3rmU=
X-Gm-Gg: AYBFou1GtttmjoXzOg9dngX5/tNrF/Jv2uc1aMkiRlUnRuJPdJYPpKSjnngUUxyMjht
	iJUt8vu5ibkUfjdJJjiywJImR2B4+dmi4C+QgvgVtyxTwJY7Q2m4njXq8o2Zj268Z17+phQYIzt
	ul6cyYWQSx7KMj9LBqgxjpZlbuqbimhJ7tzTmUkWWEeymcqX6WHh07y5prPzkTjwoJ2fFXwWjvi
	qcmGQ6P+ZBNTg+XbFHDaw8pbZKlE1MBkRrq6TNRWhCgqZHU3LsSGWSULOEbRw4t0nQAeVBLW8Nf
	fXGAbly9CRpl6bNnibwF2pmx4qeyM7tq+mw7hp4PNoDDmojew3hGBGHMrCs6REI/TeebOnJsEVc
	qwdESRDMhhPWC7txn8gUHzv1lGsjWxVIwwvdriKHtqOPtgbPiqMiNg3IC84yzdaKCMgip6oChGK
	e1so/pHrO3N8nKNK0TJKHzvFgtL5sFmAITjLKNIpnqgWn3zPpOCwXBGKtxA5kKZ0MOUknwsFGMO
	VLGb/ji9swt8XHmg3o/mcSlsTHDAut2cUKJ
X-Received: by 2002:a05:6102:a4b:b0:7b4:b196:f641 with SMTP id ada2fe7eead31-7b4b196ffa7mr1313483137.37.1790611838429;
        Mon, 28 Sep 2026 09:10:38 -0700 (PDT)
Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com. [74.125.227.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cde5f620ddsm9270134e0c.12.2026.09.28.09.10.34
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 09:10:35 -0700 (PDT)
Received: by mail-vs2-f41.google.com with SMTP id 71dfb90a1353d-5c981b0d59cso2253932e0c.3
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 09:10:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxokBOKk2q+aAu93xBxJHjyuLudcnMaclC1m1QDQsFq1JQdIY2T0xK7Wcr+O6xnokDwoUrIZLbgxFs=@vger.kernel.org
X-Received: by 2002:a05:6102:3f46:b0:7a7:19aa:8a89 with SMTP id
 ada2fe7eead31-7af1f2fdbe0mr4785652137.36.1790611833554; Mon, 28 Sep 2026
 09:10:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-rzg2-sr-boards-v9-0-5901e0fc9e44@solid-run.com> <20260928-rzg2-sr-boards-v9-8-5901e0fc9e44@solid-run.com>
In-Reply-To: <20260928-rzg2-sr-boards-v9-8-5901e0fc9e44@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 18:10:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUEC9YoZySP3+-UMP0s9XHg4OOsS1Lh65ew2zka=5RC+Q@mail.gmail.com>
X-Gm-Features: AclHuK-UMUf9NZIHGIv0UWf0z0Dz2lXiorAQQxBHpxwCZfCPbVVPhasZYdlvx6s
Message-ID: <CAMuHMdUEC9YoZySP3+-UMP0s9XHg4OOsS1Lh65ew2zka=5RC+Q@mail.gmail.com>
Subject: Re: [PATCH v9 08/11] arm64: dts: renesas: add support for solidrun
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

Hi Josua,

On Mon, 28 Sept 2026 at 16:40, Josua Mayer <josua@solid-run.com> wrote:
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
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Thanks for the update!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Copyright 2025 Josua Mayer <josua@solid-run.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "r9a07g044l2.dtsi"
> +#include "rzg2l-sr-som.dtsi"
> +#include "rzg2l-hummingboard-ripple.dtsi"
> +#include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"

This new include is not needed, as rzg2l-hummingboard-ripple.dtsi
already includes it:


> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
> @@ -0,0 +1,125 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Copyright 2025 Josua Mayer <josua@solid-run.com>
> + */
> +
> +#include "rzg2l-hummingboard-pulse-common.dtsi"
> +#include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"

Same for patch [09/11].

Patch [10/11] is fine, as that one does not share
rzg2l-hummingboard-ripple.dtsi.

As the rest LGTM, I can fix that while applying, so no need to send
a v10.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
