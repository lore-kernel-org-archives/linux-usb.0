Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4FA4192EE
	for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 16:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782835700; cv=none; b=nRM2ApGXar7yJSEfwRcaSAHP7lc0c80m/VYOa0tPRbgzIRegM8hC+sTppbb2SlFoYFyrRsi6T+RqMbq0y1ibSNDCHiXv3XmHzfM+S8BQbJw+jNoChhItaP4dX9J+0x71+zPwyQxhXImz5gDbSW6wyhum9OdRxGSyzUwgQgC5iY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782835700; c=relaxed/simple;
	bh=y9uuZkEeJae++MbeR+TNLsbet2X1rPdv40pKLNu47dg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WALa9NnXMahC6GMN4Pwcguct+v3tPQYJjIaUr2O3wXUzZe2Hqg5B6FF2PDkI1sd3lYuSaKHGR5jk+adfJA7XNA4Zbedxpj1lm765dOyNLvjXmhkmL2YmbkzByEX5OTwFeD60cr9CIkmQTpZOKlm6rz0ZAl8PUGBbYB5J1sszpbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c9b1edf2bdso18666135ad.1
        for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 09:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782835698; x=1783440498;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqnNDF5VKQ+E0vRBcJ/LtO+JWbWwBxQUs2IGvWvjH/Q=;
        b=gGNDly7zzbkkp77jhrkQbWwt8JusbP2SoJLWwsiNoNOdWU21E+FA/HuIzfmFion3N5
         5KjHRt08s1HdHDNIv1KU0ehEARbkFT55ZQILyhy7+K1TbylujIhjN188QcBtht8gjQxw
         k2Q9YIZ5/OXvd86VGaiuQhs/BBS57wp+wYY0yCplRs4d9WXrxgAa0NM8e85oHvYkvFqK
         /cmpGklNUgnUX9TX/D1qL23IyRGxxplYUiQngy4cPo3JU/cNc8SfG0I93PtNtY0gq4W2
         9BKp2OAz7/KQ3iH3wSjFMhwGGOelSiJchfkkgpqOydeuCYz9Nlz3qFEsG8HEQHJj7zD+
         nGPA==
X-Forwarded-Encrypted: i=1; AHgh+RpYoHGbjrcbUuA+urteNz4WV/a7xDW/9ngqLtNTpD764I7/HnDDy/lS1RE0yyZ9OiAKjLf04PKXLGw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpTJC4LrrHMWzg79J0XqjI2upmadIwVpx/6sA0JTc0T786FurX
	8y9R0e7+9tSjegG3gYFu8fiU6BWG5wcrb9m8cxllCUz7hdQ4PqoJ44ZFLurRW9uB1mI=
X-Gm-Gg: AfdE7cnAiHKiofXZriJOP5Y5UaUK+g4EmGVphny49VvgcY7AZDSo4xmPWM/SmpQqOFP
	qsTSz9/9QPZ+dB0NJ7BDs96Buxuh6oEPrZHdruAgvMXzadHxLPpPeA/Nx7Jluf0I320GliXFsTp
	9CFaGsk7rd8EVDdmHamGU3srhOhhtq5OfmibX6isvWvo7K/iULcLPFBflr/4deu2kcDJ7ASjRI4
	+O2MgqOqJAEa831S+uCOwSU0CefaCVrCpy8m9HWAXnOSB6ODtARmsuJOMRRg/J1NP1VIFse2eTi
	lLqbBUNLhiDFdf8L814pZ2Mu7FK+BKxS3BlytbEsVKv8iI/c0D0+dpotOMuHlPG/M/An8xFAWq5
	Cte0S4kDXFHVvexLY7Aue9h7SxTjxKkhsN3Aqo2ENS8iOoQc2cYyx4ci593dW42dmelYqD7jb4a
	ub+0Nd6tH9TK+y49vxFRN8vTKgRRUA7FcfMmx6A/+3182oVygg
X-Received: by 2002:a17:903:185:b0:2c7:9b17:6676 with SMTP id d9443c01a7336-2ca2ed31929mr34818905ad.23.1782835698335;
        Tue, 30 Jun 2026 09:08:18 -0700 (PDT)
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com. [74.125.82.45])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382c25b4sm17458045ad.77.2026.06.30.09.08.17
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 09:08:18 -0700 (PDT)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-13b2b08a553so2223707c88.0
        for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 09:08:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+2WNF4UZuwI5CSKlWs0D31fr96rxl+haSGAF0bK1+bhB44nvmOmuUCvmdLSqtIBgRi99cHwBHrB7o=@vger.kernel.org
X-Received: by 2002:a05:6102:598c:b0:738:9dd5:9b03 with SMTP id
 ada2fe7eead31-73a38838db6mr1792608137.20.1782835280090; Tue, 30 Jun 2026
 09:01:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629135917.1308621-1-arnd@kernel.org> <CAMuHMdXhsM4JzArRuB=A46N-Ogbn2Fans+PVJVA-hEytFq=DeQ@mail.gmail.com>
 <ff4d7043-1929-4fa1-ba5e-f28403ad6fcc@app.fastmail.com>
In-Reply-To: <ff4d7043-1929-4fa1-ba5e-f28403ad6fcc@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jun 2026 18:01:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWhv8i6tkmOJU_ee9LAV7mMcQHe9FXgqTHCjGiEMWvn8Q@mail.gmail.com>
X-Gm-Features: AVVi8Cc-rLKbwzFvmIKs2_rpHMNLxVULzvudUQINxHMw-KOr8IArAqRSnLCM1D8
Message-ID: <CAMuHMdWhv8i6tkmOJU_ee9LAV7mMcQHe9FXgqTHCjGiEMWvn8Q@mail.gmail.com>
Subject: Re: [PATCH] [RFC] gpiolib: introduce gpio_name() helper
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Andy Shevchenko <andy@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-input@vger.kernel.org, 
	"linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Mon, 29 Jun 2026 at 19:54, Arnd Bergmann <arnd@arndb.de> wrote:
> On Mon, Jun 29, 2026, at 17:29, Geert Uytterhoeven wrote:
> > On Mon, 29 Jun 2026 at 15:59, Arnd Bergmann <arnd@kernel.org> wrote:
> >> From: Arnd Bergmann <arnd@arndb.de>
> >>
> >> Most remaining users of desc_to_gpio() only call it for printing debug
> >> information.
> >>
> >> Replace this with a new gpiod_name() helper that returns the
> >> gpio_desc->name string after checking the gpio_desc pointer.
> >>
> >> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

> >> --- a/drivers/gpio/gpio-aggregator.c
> >> +++ b/drivers/gpio/gpio-aggregator.c
> >> @@ -758,8 +758,8 @@ int gpiochip_fwd_desc_add(struct gpiochip_fwd *fwd, struct gpio_desc *desc,
> >>
> >>         fwd->descs[offset] = desc;
> >>
> >> -       dev_dbg(chip->parent, "%u => gpio %d irq %d\n", offset,
> >> -               desc_to_gpio(desc), gpiod_to_irq(desc));
> >> +       dev_dbg(chip->parent, "%u => gpio %s irq %d\n", offset,
> >> +               gpiod_name(desc), gpiod_to_irq(desc));
> >>
> >>         return 0;
> >>  }
> >
> > Before, this printed:
> >
> >     gpio-aggregator gpio-aggregator.1: 0 => gpio 589 irq 188
> >     gpio-aggregator gpio-aggregator.1: 1 => gpio 590 irq 189
> >
> > After, this prints:
> >
> >     gpio-aggregator gpio-aggregator.1: 0 => gpio (null) irq 188
> >     gpio-aggregator gpio-aggregator.1: 1 => gpio (null) irq 189
> >
> > Same results for instantiation using sysfs or configfs[1], although
> > the latter does have optional support for specifying the name.
>
> I wonder how many of the other instances have the same problem
> then. Would it be appropriate for gpiochip_fwd_desc_add() to set
> a name itself to address this one?

I don't think it would be appropriate for the GPIO aggregator to set
that name.  What we want to print here (for debugging) is the physical
GPIO that an aggregator's GPIO is mapped to, not some consumer or line
name (which is not guaranteed to be unique).
E.g. "<chip-name>.<offset>" would be fine.  As gpiod_name() can only
return a fixed string or an existing string, it can't return such a
formatted string, though. And consumers don't have access to chip info?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
