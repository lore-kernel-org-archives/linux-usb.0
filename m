Received: from mail-vs2-f36.google.com (mail-vs2-f36.google.com [74.125.227.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F3B442B3B
	for <linux-usb@vger.kernel.org>; Fri,  2 Oct 2026 09:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934895; cv=none; b=OtHE+zRtXcabiaANmZo33VAXaJu19O5KIp3YFhbzsdI8cO+Tlm8UupnmU0iKhxBou9vcbs+sMp1vGfJkVsFjjLbg7zZeYvri6vbVCvcJenjMb3VEsELOfw1gjNcQ7FI76WquM0Fq2CwdnuzqUyDReV2sv8RMxYfnXYfx+eMP3Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934895; c=relaxed/simple;
	bh=GzAnx2xBXfEPO5tzd00AnUoKCvkCiQ5XrGLMnwGIK18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aqHOXjrLeZiZx9i/LFDn1OgEz7mDXlqJZX6V0wNoo5rstskkKgHTccCdScKeFGuvEshl8zEcd0KTzbuoeaqYmulo9QARNebSmLuqmu1b/M73T24iTT82lxobaN5w8HfKhwowI61UVhMDqeTp/RbJe8EzHHCxd6KM7gdoxuoRjf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f36.google.com with SMTP id 71dfb90a1353d-5d762b6ce2fso1286053e0c.1
        for <linux-usb@vger.kernel.org>; Fri, 02 Oct 2026 02:54:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934892; x=1791539692;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z0fxwGjBjqcCfabEbDLAIlWYoRpsrY3klbqZYJ/Lvy0=;
        b=sAUDrL5VYDyjTONBbM4bNMVA/x+/yU68diCDSXXauLn5tekOwDxh1iDyX8TRODYH31
         W04dTfRHDY3Kcp63fAUjE8uIPnIw3N1kytgDfzQLMdewE69/Cx/VaACThCUDAlZ5hy1p
         6FKih3LEAyJcx/h+qg0+8MrgpjD7esg3qYdYZa+u81gMWHb9VvJTr4AZEWRC7iPyhgfP
         wTwJcPNPci/mFewU88DgeO5PtTFob44QLEchgq0qrYKDDDJdyufENNXOyL+R4Ja2my0c
         jxZ6AgIFV4Meif9peLdEMKUQzj87bSqjCgt5S4w5ZrxYZjJj/EasZc1T1F6eAAc3pyjY
         AawA==
X-Forwarded-Encrypted: i=1; AKwUvByoVesMT83jP3WaaUdola/VCX09Uv+gVIfVbyBPuGybyWUSwpSoicVXIeHp2JCWY6KfyQ6ZOod3lFk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvKB+V0jJLpIlTzAHA+qqvkuX9Ltzq7i7ecq3LgueUHbyvHi1p
	zW1VwRVwTyvRXcpJXk7ZbRVpNIA/EZu/JLbEMnWVmjZKu3w2tI3nskM8PilztBaX
X-Gm-Gg: AYBFou1KBZ3KSbY5JWaRUN/XBKsxSDUW49vyXBvj63H7m/L9ktYefestc16nmM8TSxT
	wQ1RbfkYMQ1/BHTW8h9SUqTTMVn5rmmjQ5RardHh5Sxar2KjJaSDvkwqj3NIXAkL0LXVO36U+U8
	J1YYOAZP9/HRMxpGcaNubh9XyFTlxwlYvJQ448dNLkKXFsCVn8LT+SFEwAbexJuB5xG1stUi6ao
	OoIa4Jd4XwErh9uYON5ik8kPOu2iK9RQEZJNsS08zJJyHUlicmU1Fo75OMOtDsqQQ5DvjE/PK3A
	Ug4F4rPG1sgPwKFivBDqALpT5XFIQb7/BufUiop6koehcC0tXBeSe839TQnVsr9NnDphwYkM9Lv
	Ft/kqGDj0kbukVz/9i0joPmI52l7TNtfnCp1KHjiZESzp4sS8dlvPBh/9iuj9sLj0zwyJ5khNeO
	0kHaIzQtBiHBBtC2EH/4OpC66Jr5CUCn1Db+qyrlgsg7isZMfoE5vnEUq1sQ6Ct48e3g64iUbLj
	kTm0xlYVtQu1q62kj9jd12EML00+2X9CUx0uGr82FrpNFE=
X-Received: by 2002:a05:6122:2898:b0:5c9:a60b:e5b1 with SMTP id 71dfb90a1353d-5dab0607202mr653920e0c.10.1790934892571;
        Fri, 02 Oct 2026 02:54:52 -0700 (PDT)
Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com. [74.125.227.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5da61f8fe4bsm2903348e0c.8.2026.10.02.02.54.50
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 02:54:51 -0700 (PDT)
Received: by mail-vs2-f41.google.com with SMTP id 71dfb90a1353d-5c979c5eca8so5633537e0c.2
        for <linux-usb@vger.kernel.org>; Fri, 02 Oct 2026 02:54:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx9/dMfBlSgP26XxkXmoIKbUvQrskD6w/DNFNEYtt5oVu9RQFya6J3Iicjn1v823wI0svHXkPPlqWE=@vger.kernel.org
X-Received: by 2002:a05:6102:162c:b0:7b5:6bb2:53a3 with SMTP id
 ada2fe7eead31-7c0f498afacmr661636137.10.1790934890369; Fri, 02 Oct 2026
 02:54:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-rzg2-sr-boards-v10-0-91752ea39cbc@solid-run.com> <20260928-rzg2-sr-boards-v10-4-91752ea39cbc@solid-run.com>
In-Reply-To: <20260928-rzg2-sr-boards-v10-4-91752ea39cbc@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 Oct 2026 11:54:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXZMcdpgmZ8r3khF2er_ZNLsHJOXULbPmWj8ikCyeigew@mail.gmail.com>
X-Gm-Features: AclHuK95-pOI_InJ83kxtHngxLL78Cpy4C0cuDPVuyEs-ntx9z4X1Kg0cbn21cw
Message-ID: <CAMuHMdXZMcdpgmZ8r3khF2er_ZNLsHJOXULbPmWj8ikCyeigew@mail.gmail.com>
Subject: Re: [PATCH v10 04/11] arm64: dts: renesas: add support for solidrun
 rzg2l som and hb-iiot evb
To: Josua Mayer <josua@solid-run.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Josua,

On Mon, 28 Sept 2026 at 19:34, Josua Mayer <josua@solid-run.com> wrote:
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
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-sr-som.dtsi

> +       sdhi0_4bit_pins: sdhi0-4bit {
> +               sd0_ctrl_dat03 {

> +               sd0_dat47 {

Node names should not use underscores.  I  will replace them by
dashes.

> +       };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
