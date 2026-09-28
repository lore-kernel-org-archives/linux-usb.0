Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E7D4E1C97
	for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 14:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606407; cv=none; b=dSmNKy+qt8uGuXV3F2O3Efax2rsivM5pRcxSYVv9t9vtxYx+w3dJgFTWjGBmBwPTKJZzg3P0X2AXG8wUu9vdbmQ//W/XNEoXvHopb0rmDo+vjrAQ02tXp/72E4RPJcupdr5i/YdjyRzSjlAUAXQLxJQA2Wy8gcVQFL8xenCpu+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606407; c=relaxed/simple;
	bh=ll5jxnO1LxSP6VOdbTEMyX5P1KDm9LihOkdaoeyDm7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rB8ibC37fT6WHPdBrfDxuFiGBUif2Xlp0Q62dYNHPHM7FcCk2UbYbGEikJ7JjjsarQUAbvM3Hw7L7m/nFlTVnCA5c0Ovg6RmmX8ATs31WTVWwgEvoQSK5lJoqraNwEuDP2L5mq1OziL39Wa6O6VsSbhYa37fzbBILRFibvd+Vto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk2-f41.google.com with SMTP id af79cd13be357-93bfc58ed04so140232985a.1
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 07:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606396; x=1791211196;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/3m9boaHoB6pESjCzvTfI8L4swM5eZahhrdnO03H/Os=;
        b=EQKXzVKkZW26mfMTwEeEjJAD0zXOymVIB2NUmb0gQorFMMZH1Xlfj/8OY2NNzykBoB
         Bj9twCHwIrLuNk70YrG4R0db/+aXFhDaqCYVm+hJBHXN8/sr9mG0vJnA3HxaKOcoQEf9
         /BDVeC1b9y1MYgUN3UQl7CSQ1BH/J38MJklbntfEZFZuc9Jm+5K06L5zYKZywvl5i6GR
         rxpknxdtcnYpUJFpngfQths/Mdp04g+SS1yMkbVfpwGbtvnh+8biz0IzOvnCNVqPVJCt
         gCWlVDqtbBEC2b5vxsW6DIdSG3/h0gtUj/YdcnMPBgwWq5RQxnOIRS+vJZseaHEY2g8J
         QHqg==
X-Forwarded-Encrypted: i=1; AKwUvBy/wIHn8MNS24cFZ5bKeLBPhGD4fU3G+ovWzkqpo3YfP2kRGhJ57PvZnN5T5CUwc0/S58K/vGUDmbM=@vger.kernel.org
X-Gm-Message-State: AFuF++nUaYhdK3pZRa5PvayykTV+k6oqe5jqQTZOdhGwtK6hY4hskdRx
	/hN7/eHbLx4G99M0t/oypL3cd8oKJksNYUX5fZdFI27SXKNkRN7jLBLBLH+lzOuL
X-Gm-Gg: AYBFou21nF9fANVeApGkA54lmdeXz8+wAqCzFeQPHflIt81Sex/NzBSbNmJUy8LB1Dx
	k2mkVMnECRxKEbfXU1748IygqFoqlY6cXOPWjl6ME/ONVuVnj2FftIad10yW0PEVd+D9lCr19Gg
	tf++k4f/gptqolfN9QSKahby8cYi4gCjJE2zkN2P27L3MC8hkhhGkf1afkZiXBRPA9v15CNx3o9
	83eVnhXq9OsK6Oo3rjTATcLkcJ9uubBHrwZUh9tfPDlzH1y70GwGikBRRMJuwHOUtnqGkf5RIbQ
	52GGbv1Z6eRqvvNjgXE7J2e8uibwVwBxzFKiclj4Kj5Nt97JZoQClGFCGJA4tEFTCWE4Q+mw7qX
	AlthIKlC6NLwiHoanL/zyQQ4k85pOmX9irI3m2MO3whhVRBERoKiru+0ei/9ZHGFY3NgravIhZg
	0nxSOkK8f3gFoRR5ySrp4A2ROkqgr4se2IXW3eyhYOIPtfrQlGD3FEaB/bVNsrwIeFN81/bq8X3
	A1wgKkSDubgJUwNPsTO2T1slJrI+2+4fisC2aYm
X-Received: by 2002:a05:620a:444f:b0:93a:1091:e692 with SMTP id af79cd13be357-93c43bebd80mr1894101585a.7.1790606396201;
        Mon, 28 Sep 2026 07:39:56 -0700 (PDT)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com. [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c813fee09sm162153485a.24.2026.09.28.07.39.55
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 07:39:55 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93c7014af8eso109520685a.0
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 07:39:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxFhHwxGJsQhfbK5N1KmhufrOqKNNRxTQ401KNOpK/rNoxhiYQ9GQBC7blLzQg0hb3TMnnBoWLorg8=@vger.kernel.org
X-Received: by 2002:a05:6102:1a02:20b0:7af:efe6:2bbe with SMTP id
 ada2fe7eead31-7afefe63c7fmr2495728137.16.1790605902970; Mon, 28 Sep 2026
 07:31:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com>
 <20260904-rzg2-sr-boards-v8-4-94c4674927e8@solid-run.com> <CAMuHMdUGOLr6TQvfS9i2W1ihBWUUuTG0=TcfyZ-Seb02+XW_3w@mail.gmail.com>
 <133af08e-be3d-4eb5-aa64-63090aef6e97@solid-run.com>
In-Reply-To: <133af08e-be3d-4eb5-aa64-63090aef6e97@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 16:31:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW9NTOgPR_Xd+YVOZzd8V=uOnwjoJxRPL_-wy3i_n45mg@mail.gmail.com>
X-Gm-Features: AclHuK_hO01Uu8W5tQcoOhC1vcw0bnPcJI__NCNgulHZI0GJtePof15Jh2gc_yQ
Message-ID: <CAMuHMdW9NTOgPR_Xd+YVOZzd8V=uOnwjoJxRPL_-wy3i_n45mg@mail.gmail.com>
Subject: Re: [PATCH v8 04/11] arm64: dts: renesas: add support for solidrun
 rzg2l som and hb-iiot evb
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

On Mon, 28 Sept 2026 at 16:11, Josua Mayer <josua@solid-run.com> wrote:
> Am 23.09.26 um 16:37 schrieb Geert Uytterhoeven:
> > On Fri, 4 Sept 2026 at 13:56, Josua Mayer <josua@solid-run.com> wrote:
> >> Add support for the SolidRun RZ/G2L SoM [1] on HummingBoard IIoT [2].
> >>
> >> The SoM features:
> >> - 2x 1Gbps Ethernet with PHY
> >> - eMMC
> >> - 1/2GB DDR
> >> - WiFi + Bluetooth
> >> - SDHI Mux switching between eMMC and Carrier Board
> >>
> >> The HummingBoard IIoT features:
> >> - 3x USB-2.0 Type A connector
> >> - 2x 1Gbps RJ45 Ethernet
> >> - USB Type-C Console Port
> >> - microSD connector
> >> - RTC with backup battery
> >> - RGB Status LED
> >> - 1x M.2 B-Key connector with USB-2.0 + SIM card holder
> >> - 1x DSI Display Connector
> >> - GPIO header
> >> - 2x RS232/RS485 ports (configurable)
> >> - 2x CAN
> >>
> >> Descriptions for eMMC, microSD and RS485 are provided as overlays due to
> >> their dependency on configurable mux states.
> >>
> >> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
> >> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
> >>
> >> Signed-off-by: Josua Mayer <josua@solid-run.com>
> > Thanks for your patch!
> >
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-common.dtsi
> >> +       aliases {
> >> +               gpio1 = &tca6408_u48;
> >> +               gpio2 = &tca6408_u37;
> >> +               gpio3 = &tca6416_u20;
> >> +               gpio4 = &tca6416_u21;
> > The TCA64xx driver does not seem to support gpio aliases,
> I have confirmed this now. My expectation was that setting gpio aliases
> helps make /dev/gpiochip numbering predictable, however this does
> not currently work.
> > so please
> > drop these.
> Is this a good reason to drop the aliases, or better to define them
> regardless?

Yes please.  Aliases are meant to identify labeled (numbered) connectors
on a device, e.g. first serial port is serial0.
A GPIO expander usually doesn't have such a connector, and the various
GPIOs are typically routed to a variety of places.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
