Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com [74.125.227.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E20397338
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 08:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790669552; cv=none; b=V7RkXkjU3oWhpqc0+IADKHL8PJbO5dZY3Fe7Wx10WR7FhVHKr0buIuAwUusnOY95o3KOjaZOt9FCnRNAgNBbWm+xHFtkrcu+e6B/qgHDBm4pjmz5F6gaFI2lZDltaI/r9+MWYTlKPlsvpeYkDKL5+C4Qik5cQsQAn89PLhcRxxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790669552; c=relaxed/simple;
	bh=e8jTQ59tb4Ke+Zmo+wcDDbIer2Daet/lCXTrHvU+JBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oldAniyAHhsJ6fOi5MVDAbxdjUJTE6M+46CCG5oi04aSPP8rXb8Tb6Cr2//lL922piATjMepWOl9SvlHkaa/miJgsZYlkVmPViGUr1+cI3Ck+8fYH4brsrKelZvRP+1Amp4EjKtUy8IqLRIeDk9qkDASfJQOvpCc8loLZh1aqbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f38.google.com with SMTP id 71dfb90a1353d-5cda0838062so2023993e0c.1
        for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 01:12:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790669550; x=1791274350;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wKTPnbd7pHw8WKn97YDxHbj3C025J4UMPNethHoNt9I=;
        b=pN/KZXJTi3XZEznszts+kYzvuY6klxGdf4Ppimikx0jZMa7qHK9AemBH/EMqDRuXaa
         iHAZv0waPtxA5Z/m48eQC4w0ujtuPPS9sRfkDpInXVYD8xxfZivpKRQkIi2jBiJaEdxv
         khz/FHbYJr/ApIWM3fjW9BFAUc05rTZ9Zmd07wvDxbZHxWuiEEa12OxvpRWaVMjk7nzF
         zN8W7srgOt6Wud5Zni3m4TfVomR5q7SZvKSk0wIpd7XPYi4W3L2LTBB/iydPiOskMwT6
         rE6u7IRQDrSW+TsblpRiaK3/hqyvH1VX5+OiHcgh22X1i1lKTgeE+ryDyRZuUeHwny/J
         J0YQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkdmhsb0pV4qhf8F24hw4+3t9BTr7DzwEOJCG6sDzIXaIeXkVZmy5OXAFvFnSa4FW2icSvZ0gzTbw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtwXPN1MSuASPDhyWrlO2bVGoh+JDJRz6c4ljiwrWiGcsDDI2D
	82xFqJ/HwqD8Js49rQ456eLNA6oqKPTx7GoUxXSNUhXL0ftqHNnL46hZfkBoRKBQBEA=
X-Gm-Gg: AYBFou0o4Ru0mbqMj4PP1/Jv3I1nERZfx2uJjD1ueJ8N5dAUYliDeu+dSv7RM79PhB6
	OEAjfldBDzDTELjWoPW3GSkr0c4yKIBuh/mNtLt02cxxHMBQLh+5tbSH+F3h0A4RD+KZqLwtYRv
	D4jo+PRmtxcPWfzntgWV3EUjs/tiMUthE8dUiT6ujJm5SPWygxMHTFXGTo2+6NaYIdr2H+NAXhy
	enxC+BlcMogouoJYdYPaclE7W+lnEBtBjxStXOWjXeWqcWg5MYzlsmpn6i8pHtVOcHO3w/2prZG
	/h2F47PKp41d8iQWQ72Ofm9rS1hcS9ZFXwUytbHBqazQ8TxrcV+/zMk3gib/E75P2j3iaKNyKAo
	BQPC5ceHir3iq54m7oflKyPpU6xLfYywSNhHegCowQHX6oD2ngKNI8qJevq/pezoeiYVG9SuCo5
	p5p34pH67V+wLN7jl6uvY+ofVgG1+CKSp5YfwlJcX7ZVTfLYV0JJmuAR6uyFQa6GfnVLxOeXGSC
	mwhpHlHV01KpkyIO5zIxBl0dtJ0G9v3+zK4yg==
X-Received: by 2002:a05:6122:2909:b0:5c8:2852:36cf with SMTP id 71dfb90a1353d-5cb090264f1mr7060123e0c.4.1790669549856;
        Tue, 29 Sep 2026 01:12:29 -0700 (PDT)
Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com. [74.125.226.235])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5d3f2840d97sm148536e0c.14.2026.09.29.01.12.29
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 01:12:29 -0700 (PDT)
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-988ba23f552so343809241.3
        for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 01:12:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx88zpUqN10i8J+xVrhIfhSB15FpRW6XHQlkt8yQhFWV2ks5+WgjJfUlRt+v3WSFM6lHBxyXHWxp14=@vger.kernel.org
X-Received: by 2002:a05:6102:5346:b0:7a8:15b9:dd34 with SMTP id
 ada2fe7eead31-7af1c58fb71mr6318332137.2.1790669548884; Tue, 29 Sep 2026
 01:12:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-rzg2-sr-boards-v10-0-91752ea39cbc@solid-run.com>
In-Reply-To: <20260928-rzg2-sr-boards-v10-0-91752ea39cbc@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Sep 2026 10:12:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWoH-m972X1Emo6gis81-_TUs819gOPkUwtgnR3aQhGA@mail.gmail.com>
X-Gm-Features: AclHuK9FhwKj6JL-kiqTsnzPxsKOECrpai_keY8LaopHP5dfC3Vjj3Wu8JulErc
Message-ID: <CAMuHMdWWoH-m972X1Emo6gis81-_TUs819gOPkUwtgnR3aQhGA@mail.gmail.com>
Subject: Re: [PATCH v10 00/11] arm64: dts: renesas: Add various SolidRun RZ/G2
 based boards
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Josua,

On Mon, 28 Sept 2026 at 19:34, Josua Mayer <josua@solid-run.com> wrote:
> Add support for a variety of SolidRun RZ/G2 based SoMs and both
> HummingBoard IIoT and HummingBoard Ripple Evaluation boards.

Thanks, will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
