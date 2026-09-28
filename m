Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com [74.125.227.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17E64EBAE2
	for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 16:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612066; cv=none; b=Pt30KGJlWM/Qr1qn/VqBHXSbW5GGBz8nR3FZJpTXVUAiu9LeviprFgPi7tOnCvTX0jyBAT59859V1csYkOsgYa1FLrl0mqn5xRNuQ8ZGKa3h5r/AtnEL45uVu6on0NCijKessGeuRBkmfmYb101aE/SaSDq+spnJStcJnwHEoao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612066; c=relaxed/simple;
	bh=LmuWqcMyTwMuJpgDZBWpwTFm9kIaObVYzEuR7y9gTcE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ONbMVpGsc28foLeIV17Y9YC1u1snDQm8QvZlYVVVVftA4WIdyDmAmva03zYomNrUnMYyRwpaObFQaLklXozwEYf7ERqZdBf+LjYAdbcLKsbL1zSsNysUZQref49ziCrTC6EQC057cbm1T9ePitbhlVaz37q+KSsRTnbjTkgtD+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f38.google.com with SMTP id ada2fe7eead31-7b37ccc2c4bso479646137.2
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 09:14:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790612058; x=1791216858;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kDbgXPFrnW3qUuObWck9tBFMLu1xDmnvb5Ge11TXK24=;
        b=jAUhGaQMfrBIq1Ru8/1fHEiUybfLxfKLLERPOFHayrwED2qX513TxTc5gLbIXwjJlT
         UyBYuqZ4Ri8WogVJz6JQL+GoYFzgcUH3+DteyDQ39mpk75jUyDOjTU8LGXlgrNV0D5v1
         ZQk33FP0utB5DrreNJFuIP7Ti/Mt1Vj5SxnV7ftBgZkwxKFARPgTLeNS3hsnQvBNOA1z
         V+ZOMXhWUs2JKYIx7YWjryMqXro2GlgtZ0fIBEeX+3vL5gWkwPmwF3p/Kb8ltljNyOMF
         gNRsXrsiuRzXgUQGVlh5IO3CEnZybRS/qMcd0ZGfiVS8ZHHsmuEOKcwu9qeyV/B+O78h
         ZB1g==
X-Forwarded-Encrypted: i=1; AKwUvBzxnKi/eKmJhyBXQgJl56RuqLQZWbTCcfUZpH6x4sbPWLLP1Gll0FEFhLLHdGGAyEUo2oSAYGPsXZg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1duSePZ0YQM3eVWvm+S5UjTyGh3YlPW9imHdfUrkubdrE706x
	9QVmKVFicyRJVbSkSjf37uWAicZsIg7wd+iIIybg/GLTo1CDIQKo6/aCltGPVIpPsmg=
X-Gm-Gg: AYBFou0hFUmCwWVcWjae4jrBKHhTKSwfkgMvbWAByr8jC2at8m5Bnnu9R1OFh2GQ2kd
	r34+NRVMgoKcUz9fa1/qEPUbjCLWYpTyR68tFJPHvd/ixfNIX9QbFl7TGZXdCRLqwch4bBGz2Bg
	Hrf5AFqQl7A4zsydtAe+Wbf40b7CR/piGePqruS8xT79R4FjCSEqRM3xG4SLcwNVsu4yewrsCrA
	5nyw9Rv3cUdhRpaJYTf/k3lqngg1ZH/HQvQUAMNjNtb7l48l2kcbiaW70UTA1ChSHwMwxwvxAaS
	ThKfPzuLYf/jL57updJZjgAkc3lh1f/7KBqwkf7NiH4B/ITqblXZJOD6y0OxP493MBLF8mIviYc
	P6lknLRLNldbxwSA35DOt9UaFe9lpslrrQfel/bpMKtdf1ZYPFOcYf8BznZRuUJWgE4EB2L2KXm
	u0nvk1EQvdUDUN8xhHYsufQhB30lVbRjqZTZnauxWIHSlqIEsINwUptw36qcUjqZTXMW/D/lCvo
	PZFR3gQ9KVGaPfcud4mt9X6u+K7vP1i/vPsRQk=
X-Received: by 2002:a05:6102:1627:b0:7b3:67d6:4d7f with SMTP id ada2fe7eead31-7b367d65363mr1480312137.17.1790612058428;
        Mon, 28 Sep 2026 09:14:18 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b39c1a46a6sm9421750137.12.2026.09.28.09.14.14
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 09:14:15 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97ea5bd53b4so738881241.0
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 09:14:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxwcmaG2pkn6NEOwki+a8kEQ7jvTYuGZI1H/GsyqBZbEPdZqSZIXPFgTlPT7aGQ+U2TE9kMe3MBupI=@vger.kernel.org
X-Received: by 2002:a05:6102:36d4:b0:7b1:6028:5475 with SMTP id
 ada2fe7eead31-7b1602862b3mr1908825137.12.1790612054596; Mon, 28 Sep 2026
 09:14:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-rzg2-sr-boards-v9-0-5901e0fc9e44@solid-run.com> <20260928-rzg2-sr-boards-v9-4-5901e0fc9e44@solid-run.com>
In-Reply-To: <20260928-rzg2-sr-boards-v9-4-5901e0fc9e44@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 18:14:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUC2yTTnciUg0RU7N2JCRT+fLeHf6dx0bWGfhfAytrz7w@mail.gmail.com>
X-Gm-Features: AclHuK_AjFWmrE4_ymPqY0VlrZBpkft59awZIm-1fGOKVExdklYpAhT9I-Cw7Wk
Message-ID: <CAMuHMdUC2yTTnciUg0RU7N2JCRT+fLeHf6dx0bWGfhfAytrz7w@mail.gmail.com>
Subject: Re: [PATCH v9 04/11] arm64: dts: renesas: add support for solidrun
 rzg2l som and hb-iiot evb
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

On Mon, 28 Sept 2026 at 16:40, Josua Mayer <josua@solid-run.com> wrote:
> Add support for the SolidRun RZ/G2L SoM [1] on HummingBoard IIoT [2].
>
> The SoM features:
> - 2x 1Gbps Ethernet with PHY
> - eMMC
> - 1/2GB DDR
> - WiFi + Bluetooth
> - SDHI Mux switching between eMMC and Carrier Board
>
> The HummingBoard IIoT features:
> - 3x USB-2.0 Type A connector
> - 2x 1Gbps RJ45 Ethernet
> - USB Type-C Console Port
> - microSD connector
> - RTC with backup battery
> - RGB Status LED
> - 1x M.2 B-Key connector with USB-2.0 + SIM card holder
> - 1x DSI Display Connector
> - GPIO header
> - 2x RS232/RS485 ports (configurable)
> - 2x CAN
>
> Descriptions for eMMC, microSD and RS485 are provided as overlays due to
> their dependency on configurable mux states.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
