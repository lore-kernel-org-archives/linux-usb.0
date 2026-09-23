Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C4F53C3B0
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 14:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174814; cv=none; b=qvv8rkOm/Y/w3qZKpge6t9/b/x56RY055ZSMqhTpAKfqIOeZ1jsiL5mcCeS1ZL5kdE3aZnAD25SM4zSdnbLjv9wWeUXIWSrt0l0fE234tgjJnSjLiTMImjPNscgJTH/5dP04pQtouwuYuzZpoDJVFb2zoEC5MGn2UTL/2s6GV1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174814; c=relaxed/simple;
	bh=FXzg6hBNBXZZsScdwtGeM5Pmqbhre7BC03zd4cLn0Yo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YYBQdazDJrSSldo3BwYRiqOteHVLPGrusbJ3KgnXvgc2jpiJTddUEBLs5gbq0tV3je7pX94mE5YkaVJ43edXRY9JblxG7oxlu+nPOaS4f+p7/ql3gLhAfz9Sv4+BDB2d1xBIsAXoLeT/ib+EDDyuEqUi7IFFjNdlJIXnf5s5GUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e33b917so831647e0c.1
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 07:46:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174812; x=1790779612;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ONYGJu27lrhOYpsTIFykGbM1Hkv2j9YTc036/0zk0Ug=;
        b=TAS5Qc+P1gEdD4Q3dog7T1FffMcn98mfHmD7Dptgjw6mgaxpO0WgQ0oLQoxTY70aHc
         gjPNc75AVBFy/3vsT2wLnZzHibviNXlVcYwTNOE4k8G5E0OzdE+Cycjxcz5O4T7sIr/u
         ErfggdUrqrS2xxjr0O7I7Sr0H7RV+KBiiHnjFF6jCghhLe2V0FhdsOJQWG3ESEdu+Kx8
         XRjTIvJEMKn7598J+LV+/J37DocXtqND2zFrJif1bbPjIZZ4su170skX6oJEsoQtc5VI
         t5r5z+ygUrXRjXj9SELvCqU/T1dxvTLISD2Ih8ggtO1G/h/acOtC4dQkwEi1lCBh8zQg
         TIVg==
X-Forwarded-Encrypted: i=1; AKwUvBxUScN5JuVrU5p5UwbRStAG955efRZwXhZioaZOEAStyPpco1nOS+4B33TkJTi9FsVtkrRm+krKEZQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lv3UoFVyKv0Yw2aN/PaOG0IUFYGrGwpJdosBJO0ZvB68GivTz+
	T4soVrtb7t6LguGnhfqTpmg1NCohMF6MVfbawA9YYis1ZH05HEeDVwpuxccL648T4Uo=
X-Gm-Gg: AYBFou2JRK1PZNO8QEgyf6s/nNm0B19KZaYTYzteqm1/f3BtyVcX10FDNK1IzJoYfe0
	fHzQkKe0HtNUZLJPiFjoGGf4PKHI83h0icZBqnhTygpSDVLPILnqHGhnV/hMGgvkfNgVEhI8iV0
	ye+EjTwCeQqBtODF09He4qEvtxRA6x0L3e01tBiUNExeYUI8ZqH8i1SccgS1zG6lc/E7Nli3Rld
	DVGb2s7KudanoT5lu7p/PjhRM5s5iqAbYy7Xu3P75CfJxywPMuHH0Fp6O9GPBX3ay0A8ZP8IXmw
	D7d56pGgDNLZBiLBWJRLQUHY1EsAPLbhkrAri9LmyVtXlQV/vqbEhdy5DnEozAMvOwfHjclc/dI
	Uo8CzW1vOiX1ZoZDcrbmU+YWvhM6ZZkMuCFS2WLit6UGVfGl9BOWntbE29vhnbXt9NEdkOPjmFg
	OrRbUGu5Om3nDIM+P1N3ia3GiyxET8AOXMiSLZeuemSlQbUZMQOQD70ET1+Cejhz/mz7jF5X8lJ
	RT+wiyrLvsnnX0r8iDbrnaRR9RpazZeWEqprA68LrII58Qw
X-Received: by 2002:a05:6122:2214:b0:5c9:a60b:e5ab with SMTP id 71dfb90a1353d-5c9f165e8eemr3028577e0c.13.1790174812005;
        Wed, 23 Sep 2026 07:46:52 -0700 (PDT)
Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com. [74.125.226.235])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ca541220c5sm1219901e0c.0.2026.09.23.07.46.51
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 07:46:51 -0700 (PDT)
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-9851d513a70so406470241.0
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 07:46:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxBf56s06TLdmqu5wgkjOC1Hrsml2EaPgx9iINoj5DvumDV9xKKf9NcSYVc/eNUt9q1Q8GjIG5bS8g=@vger.kernel.org
X-Received: by 2002:a05:6102:5709:b0:7a1:f7e2:aadf with SMTP id
 ada2fe7eead31-7ac1d0cb10emr2412732137.17.1790174811407; Wed, 23 Sep 2026
 07:46:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-5-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-5-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 16:46:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWUt7w8Y=fmX2PtdJhZJ0k0YaKkoaC2ifx+LSYL5PijHg@mail.gmail.com>
X-Gm-Features: AclHuK_0TFDwROATeFWc5QcEb9bj6YWPyy6x8RXwybT5t7YWLi1_s9QYUiwmNRs
Message-ID: <CAMuHMdWUt7w8Y=fmX2PtdJhZJ0k0YaKkoaC2ifx+LSYL5PijHg@mail.gmail.com>
Subject: Re: [PATCH v8 05/11] arm64: dts: renesas: add support for solidrun
 rzv2l som and hb-iiot evb
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
> Add support for the SolidRun RZ/V2L [1] SoM on HummingBoard IIoT [2].
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
> The RZ/V2L SoM shares PCB with RZ/G2L, differing only in the SoC itself.
> RZ/V2L is adding a powerful DRP-AI NPU which G2L lacks.
>
> Due to the similarities most code is shared, including DT overlays for
> eMMC, microSD, and RS485.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
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
