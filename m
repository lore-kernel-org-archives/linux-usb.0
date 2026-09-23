Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEDF53E308
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 14:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175131; cv=none; b=E8mSdzxp/GNXkEZ/s1x7VhJaHkzPRpu06k5U++IjVUcpnWpX+URG9CWHpXEZcf4LBG1cMmungzpdnPT5q6CNYMQ8WbUvVKbkBofphCfY21HlsU2oJOLPFWhLbsFct4dzTmZYIexiJDiUD1QImHjWcsyZmekU7DxZSOJNK+MynU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175131; c=relaxed/simple;
	bh=AfFgK5O94TRbSz0v+n2agZrfGhkoCKVuFplQhBhnZO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ULlu7AgHkrVDVWJsDBFKbeEK6qrjtRCs8vi4yNgE4WzH/4EaHcq1jNZB07UpxrZrJsZKv+3hp4JVEiM3/kPEzyE3AGWkYdRdjzEs3fO6KIpvitgO/qM8axOrP216PsrOfq1qHHyKC2w+ynehHhuAuLyUWckTP09wa4BzzcRnsm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e512ee9so408461e0c.0
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 07:52:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175127; x=1790779927;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OTVINLgc5+4Z1oNwbQRG/rtTEB6pkVDW8ACRGjhrMlE=;
        b=dUhGk03CxXy9Vx4hyP9zHhAA7n/AgWSX92GHr9IxqaUchmxJZ3RnUKCISfhLl6Gask
         KqdI06gI2e/0vYJgOsXf/ISXw/MHmpd/22UQItU/rtpEi21LqZL/DWlbEAdbYSLlzlZG
         AsdtHSqfDRnRTcbQ3Qm69v0boyeXyN8NL3DyawQzTNLvGMKqIpQdXyBQnBB/Yb3S6jB3
         7ZwV3djyj/kjfFRi13cxLXyA8fOLByGml986TuBQcDK4YaaMCeReIt25wXOnQFBYPpRh
         zIRfy1fbaj6PfNYNUhoLV356Ur9VMR7WNmJ3ggRfSfxFiKRDcTjVrGj+SbmnTOic6Q6M
         geqg==
X-Forwarded-Encrypted: i=1; AKwUvBy1nsrssdqn5R0Y3tAAbWmhf3of0dn982+Ez+/8I4kv/6Jps6d88wPfil/w/k5JBASETdp1jwp+5uo=@vger.kernel.org
X-Gm-Message-State: AFuF++m7HUv+j9HVthmJXoVNv/awf6obgYNnZhHn4dSNTXQ+VPqfhp8V
	ZrkNsTPAeUO8DBq+SVlq9TtStiYrakGj5gwfizbtuafpluYTM5GZb+7QYZv2/H9qNu4=
X-Gm-Gg: AYBFou35dr217PgVm9YKSSrsTgFCfZ1m//eRuzHpV8/FZd4YRcQwoLiKPmmIEDkyp+A
	jTAO2EagHe9VO2p4JryABtRUyhUVR86tC7b0gwE9LGindaN4YlFcNGekyvfIB5v+Vpzwdhm19ix
	t9g0aYmGYtULfUL/xsqbdrDpB7jy8EW8dY1z5o+1/Gsoevb+Khjb+t6zE2cGYATjOZs2rrTMrNT
	sYWplFO7QZKhNJd3r2kaa+hBiF6MNGnskfKBfku+AX4nb7SbyHE4hntl3c+nHiRea3AkxSmJy1f
	COaGK5wzgjnDCPZW2vBHpYs5ti/5DF3CgHJBvIk+/6wKTR8L0YUwCw3lFB4EZfxlkqQhvsn6wAk
	UG0nSPdcqSGUiG4LaZpD3ECqDQKJi93cG0Hv5yH5LnuiiwVlWZNIdDAZ074EaQUCdxdubGmYABY
	Z0VNSN7i1nIjfVqH+nr/o0v9DQvg8YVMYv0hERBGz04nXT0DmeWy/iwLdTvf5ksQxXU+GQyf09M
	OH2GrXBUddNuvpPvuaGSVqTylXxw9iiW3S8
X-Received: by 2002:a05:6122:547:b0:5bd:af82:fd9e with SMTP id 71dfb90a1353d-5c9f15a258bmr3101528e0c.8.1790175127263;
        Wed, 23 Sep 2026 07:52:07 -0700 (PDT)
Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com. [74.125.227.40])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f04fb621sm3602301e0c.9.2026.09.23.07.52.07
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 07:52:07 -0700 (PDT)
Received: by mail-vs2-f40.google.com with SMTP id ada2fe7eead31-7a03fe69236so373873137.2
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 07:52:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxIjfUX7zs/TIAJWDTW+iJ0Y3zLRen4SLXKa41twSM0YZSwoOPej0n9v3WUVFV4yODW9rIgqt02vQc=@vger.kernel.org
X-Received: by 2002:a05:6102:370a:b0:7a7:3485:33ea with SMTP id
 ada2fe7eead31-7ac1db33f0dmr2430482137.19.1790175126732; Wed, 23 Sep 2026
 07:52:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-6-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-6-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 16:51:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5HkURikoQjpm_tw7qnHfGbLFtug4nBMgO7vEtpyjA2g@mail.gmail.com>
X-Gm-Features: AclHuK-gsUhfafKUl3WYFPzbbNPmdS5PRweR7PwdMXMcSw8FWUkpxbAv7z94Jqg
Message-ID: <CAMuHMdV5HkURikoQjpm_tw7qnHfGbLFtug4nBMgO7vEtpyjA2g@mail.gmail.com>
Subject: Re: [PATCH v8 06/11] arm64: dts: renesas: add support for solidrun
 rzg2lc som and hb-iiot evb
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

On Fri, 4 Sept 2026 at 13:56, Josua Mayer <josua@solid-run.com> wrote:
> Add support for the SolidRun RZ/G2LC SoM [1] on HummingBoard IIoT [2].
>
> The SoM features:
> - 100Mbps Ethernet with PHY
> - eMMC
> - 1/2GB DDR
> - WiFi + Bluetooth
> - SDHI Mux switching between eMMC and Carrier Board
>
> The HummingBoard IIoT features:
> - 3x USB-2.0 Type A connector
> - 1x 100Mbps RJ45 Ethernet
> - USB Type-C Console Port
> - microSD connector
> - RTC with backup battery
> - RGB Status LED
> - 1x M.2 B-Key connector with USB-2.0 + SIM card holder
> - 1x DSI Display Connector
> - GPIO header
> - 2x RS232/RS485 ports (configurable)
>
> The RZ/G2LC SoM was designed to be pin compatible to G2L SoM, with
> slightly reduced feature set.
>
> Descriptions for eMMC, microSD, and RS485 are shared with G2L.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dts

> +&eth0 {
> +       phy-handle = <&phy0>;
> +       pinctrl-0 = <&eth0_pins>;
> +       pinctrl-names = "default";
> +       /*
> +        * ravb driver does not configure mac internal delays for RZ/G2L(C),
> +        * instead delays are added by the ADIN1200 phy driver.
> +        */
> +       phy-mode = "rgmii-id";
> +       status = "okay";
> +
> +       phy0: ethernet-phy@0 {
> +               reg = <0>;
> +               /* Level interrupts are typical for phy but not supported on rz/g2l gpios. */

Nit: "RZ/G2L" (in all patches)

> +               interrupts-extended = <&pinctrl RZG2L_GPIO(27, 0) IRQ_TYPE_EDGE_FALLING>;
> +       };
> +};

I didn't compare with the board schematics, but the rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
