Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913CA42EEA3
	for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 15:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782746985; cv=none; b=Gmt5Fh40d1oy/A4Drx29Mm7V3FSbdm/yWvhoIH9o2Y+ZL/EP+JLmtwz9tsM8LtbT/eNGtPYmEjEvDIwQpzDQECIa6xonzSYQg9vFWp1pQuxqcuVnqDK+FDHSglRjo4IDaz6ktMXvV3vKqew0ucz9SYBn2WN7np7JlE/F6tkyows=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782746985; c=relaxed/simple;
	bh=BODU8nH72xA0ScZ+HzwpHMr8UOUoOL0Z1xiarATGzqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nmKYgsTfBltbOZJWBQXLT5D1cZc08jAcG//m6oE1qglg+kCXFJWmwa2X8Tylnyue01XIr62qUQZAkGN/cmdw/ZBWnR6/mJHUJ/JJMd3oU/aRgwuZ39Ohr/VueUq5hwmaO6CTRcNtSs/hd1aBeQNzNHR2ZudavRbqAuR0QRPrtdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c1276b8c7e2so82288466b.3
        for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 08:29:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782746980; x=1783351780;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3PSkrSvBcOj2Vfr1tOG9HdESUGrp+uU5X3MHl1xNqsM=;
        b=eN6xfWJyEV4vqsHGF5zi4WitTucCgqgs0wCVGsAj0gEgcF1z2jMlupxhUvPPgFrfij
         pyIDn1uKf7sqFumdzFhofFRasI3+ldeRXHtQIya64mBu8S/IwSaySwqg/+Vd2EuJF8UI
         2awwbPqtXH8snbnYUmy4DT2OXlO6KcwloAFHBhikfuxKOPKJCJSMdxypUEHVR+xGNF1f
         UR/x1U3m42Jqvm9qg9zAb6h7PH+4O4Sbsl7NoP8dixld4BGUwIno5QOQhq1tnvILS61h
         XRunDOiqfUmcqOvhOz0gl8BcaA0gF/a2pP7jmLdcahkboEghxG4+gUBDgazvDiqbKHjw
         brJA==
X-Forwarded-Encrypted: i=1; AHgh+RrILWCB8ZPGglcgs0t1sw3F+592Ct/230b7J69Zm3TSULlMgD9JRBCARYU8RIP1zfnqSBDVDAClwaA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2DWBUrN7ZK4xKcHyiT50yL0xo+qROyvkDaKoOfT54FcoLwE9d
	PQEyWZVhzoCdRgugvkFXdDkp6N6ZTsIxBfvBk7Qs33CCf4chGXa5ekWmqiMD+/jx38I=
X-Gm-Gg: AfdE7cn6FWJe4dz4zUCFBDFVrEEMZ63ZorbllGDKEf33uF59aIYI+mdMXsrIHvrIRai
	NwhgeU/7eQN98u0u+tEy5b4CAPTJNb7pfFRqBr5Ibmgk/iYAQk9d7x0B+3fV6hNIJKlc3qt9NKH
	wcFx7jOx6iRjDp4F13qPxPDhX8AW6gb5geEIcVwkw14R+R/8NTxDnSgADw8v2H/L1Ndm4R1fTPP
	L1a/+hxTRYrD7Hyqt2rL5KX0LEEL1BUhlhHM8m3FJG4EpnRKEu3y6hAJPKri1haMZH2RX/Jj2Dy
	/LK1q2fMMSVfyUkjvLnjxjWZ0UybhD8ozAU42oM/r9seju3kQlRbBKEiMziNOEyh6LcGFFOuKdv
	i7IKs+4+Kn62EFLPhuSaFmeX0rMqVv/C+gT4zbi2dTFyWN8QdPs3bpgXFpo/5XdinMu/ZJ4Fh7T
	fm/Xsb8Qluv9LOzZiuvuMzlPPYYcgGX73CSYJHYGsRWxEb2cf3/w==
X-Received: by 2002:a17:906:f5a2:b0:c0e:840a:79a3 with SMTP id a640c23a62f3a-c12061eb76dmr998461766b.52.1782746979651;
        Mon, 29 Jun 2026 08:29:39 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbbaa46asm807045266b.10.2026.06.29.08.29.38
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 08:29:38 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-693c69b97e7so6671328a12.2
        for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 08:29:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrwdw2eAeS3ajby1hrCRDXS8qQ5ypwA6TwY7v7bzSYGXmEey0XY4JoRyKVjr0JQcARLpkJ5pXF2mz4=@vger.kernel.org
X-Received: by 2002:a17:907:3c8b:b0:c12:f84:85d4 with SMTP id
 a640c23a62f3a-c120f8487bamr796791266b.24.1782746977928; Mon, 29 Jun 2026
 08:29:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629135917.1308621-1-arnd@kernel.org>
In-Reply-To: <20260629135917.1308621-1-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 17:29:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXhsM4JzArRuB=A46N-Ogbn2Fans+PVJVA-hEytFq=DeQ@mail.gmail.com>
X-Gm-Features: AVVi8CfSSg4DcoB7CGCYddSfqoWpUaOwYUjpkorP-3LR7U8E7vJ9ucbePhiZLD8
Message-ID: <CAMuHMdXhsM4JzArRuB=A46N-Ogbn2Fans+PVJVA-hEytFq=DeQ@mail.gmail.com>
Subject: Re: [PATCH] [RFC] gpiolib: introduce gpio_name() helper
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Marcel Holtmann <marcel@holtmann.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Andy Shevchenko <andy@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Mon, 29 Jun 2026 at 15:59, Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Most remaining users of desc_to_gpio() only call it for printing debug
> information.
>
> Replace this with a new gpiod_name() helper that returns the
> gpio_desc->name string after checking the gpio_desc pointer.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch!

> Not sure if this the way we want to take this, or if the gpio name is
> an appropriate replacement in debug printk.
>
> Since most of the callers of desc_to_gpio() and gpio_to_desc() are
> otherwise in drivers that already depend on CONFIG_GPIOLIB_LEGACY and
> include linux/gpio/legacy.h, only a handful of instances remain that
> are otherwise in files that otherwise only use the descriptor interfaces:

> --- a/drivers/gpio/gpio-aggregator.c
> +++ b/drivers/gpio/gpio-aggregator.c
> @@ -758,8 +758,8 @@ int gpiochip_fwd_desc_add(struct gpiochip_fwd *fwd, struct gpio_desc *desc,
>
>         fwd->descs[offset] = desc;
>
> -       dev_dbg(chip->parent, "%u => gpio %d irq %d\n", offset,
> -               desc_to_gpio(desc), gpiod_to_irq(desc));
> +       dev_dbg(chip->parent, "%u => gpio %s irq %d\n", offset,
> +               gpiod_name(desc), gpiod_to_irq(desc));
>
>         return 0;
>  }

Before, this printed:

    gpio-aggregator gpio-aggregator.1: 0 => gpio 589 irq 188
    gpio-aggregator gpio-aggregator.1: 1 => gpio 590 irq 189

After, this prints:

    gpio-aggregator gpio-aggregator.1: 0 => gpio (null) irq 188
    gpio-aggregator gpio-aggregator.1: 1 => gpio (null) irq 189

Same results for instantiation using sysfs or configfs[1], although
the latter does have optional support for specifying the name.

[1] Documentation/admin-guide/gpio/gpio-aggregator.rst

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
