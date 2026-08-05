Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE39138E100
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 07:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785916424; cv=none; b=oaaY25c7uxQ9dRUDK3xUHtGeM6dAYAlqqAuVsIiiU37Q+hs6+G0fkX4L0H/wCnCVjqgSVY/hO85aCaWVNJvJuLrYs9LU4KwJsNGoFpS5hQMS7f6fpwKfMOrPVPO6P/mWjHZ83gw/HHjjSsJqiZn0p3rMCPLZaPfBecUA7+aUQSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785916424; c=relaxed/simple;
	bh=uwbTheRxj+yCut56Z2OBUgfjWKw49pVIDvBDA7a9KSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fjjIE3YHoppXe/sWnR7nWfJhtBIx1V8tBn5Bc+5BadElEfz40yltfemImHytnh7Yazo+YYHwXfS0aAwhYXyBeAISBpkA3y0S/9smTZnYPmaChyyYrARk5utFmTVtf6Ee2w6YEpyBftKPaaMeEHHH6aF1tNXywmLPt8lwEq/hI/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-97017a60b06so204401241.2
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2026 00:53:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785916422; x=1786521222;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0Jr0GgueyARZ20CCzQ9FDczXEeTxE2eTPx3t7jOdiD4=;
        b=oqG0pY++TekFnf/cvLXT2/LeROSn9KhzrynoV25bXHnGhk95xKCJ166S/lErFLyu+3
         i/5LIIi4ZTV27YRk/Zea2JblwjtUvGOXl4k6P7IfMSyyXZEkEv+jG7sGHzKywqeh5aKL
         tzyby929yZaQXVDXuhLMxK1XtOOHFxxRa98dSifDMntl0fhdy5lL9jQLDOXDC0FIyhPK
         oafY0db1uRyC9yV5K6aL09b+jZb0MiB2/1psiaTd0vDMhuowUYWztPgvwOOg8i+u9tuJ
         3SsUuCsh5ad308j5nYYefZEXRzm+ezzuoG+mRxr5ZNjKHw7CDWr8dOfsWrlOAP5rgwmv
         O87w==
X-Forwarded-Encrypted: i=1; AHgh+Rq8dd1JHw3SCjfByKTWwrtwYPewkCNrMFZHKUpgRFEnv2mhdOmKGSH1F+RE4PhCRmtreYVkeakBAz4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZx4GZFwBokF9we9o0mbPJsbyiG3zRHc8G4W+14nl6N6XpZBqF
	8cGNAOTVMk7Wbq7YoFVMnHpAylKuKsEwG5cdgzxR+uA7Xk+tr2UiAYGtzMGcTzT7
X-Gm-Gg: AR+sD10AwrtbcOhhLc9x/+0ecTdf0NR452hvHVR3WbsBpWrgehONbDD8lGymQ9rn1ln
	pJKhihcPlY/sTl/7OyJE4zY7zWtQGFIsxn9O+kKYftAJNRWVqdlcIu/eExIWvNyaWFu/loViqdW
	DtFc7v31FPiITYN1Tj/d9nrR7hQ2Ehaz4aup2CYzAYQ8385yQjd3mww8dRiSkyRo2xVQGUTVOpE
	JuYkMCvyygcOu4YYLXLf7DDCCsGOK1vzidimC3cHYkBgOWBjsWGr0EfHAjnDHL5JEFSctWN9/WB
	NR3WMsY4DtbUNNv2BCgoJr28ExglqgaTc9pianxigC5/u+coMMAmE7zMdhXHYARmvxiv8X7Wzr6
	2rOqbDf57StFKtApHZQpqIief00joWGQ0JXRd7GUVzaWHMxtHaYDB4Y2jrIJHbujw8OBHpvsp8B
	xG8qnsQXramoXUa9phfCG0qtwUdrdObXUw/hbo10r1xkPL1rX++xFuUX9WOWQlRtlVC2V9rt0kW
	Z3RPu6JroGJryBYX6bNpHXOpzTGxdydCrMw
X-Received: by 2002:a05:6102:149f:b0:6a2:b2a1:f16a with SMTP id ada2fe7eead31-760e6ed515fmr1056750137.2.1785916421608;
        Wed, 05 Aug 2026 00:53:41 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9782c8e8724sm1414050241.10.2026.08.05.00.53.40
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 00:53:40 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-9773c6ea885so212633241.3
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2026 00:53:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoLQAnqPWKhsAvZISPmXrShE2i5Sqzhr/DaZHGxoUlWYzoy0qAfj6+vAiyoU7ZxV8Pm7JRHSTFFkSI=@vger.kernel.org
X-Received: by 2002:a05:6102:4bc2:b0:738:84c:6b3 with SMTP id
 ada2fe7eead31-760e6ed510fmr1096569137.3.1785916420540; Wed, 05 Aug 2026
 00:53:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728011656.465040-1-marek.vasut+renesas@mailbox.org>
 <20260728011656.465040-2-marek.vasut+renesas@mailbox.org> <anJ6HkPgDb7I4xeL@vbox>
In-Reply-To: <anJ6HkPgDb7I4xeL@vbox>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Aug 2026 09:53:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVQRJv8zoQYmgiObivaOoOBnE53mVdF3hPsJBK4bu4-Ew@mail.gmail.com>
X-Gm-Features: AUfX_mxP7XFNZTbkOdgjKR201hDCIQfWC5qVjcrN0qm75x-GUJxSc7cxG09TMSI
Message-ID: <CAMuHMdVQRJv8zoQYmgiObivaOoOBnE53mVdF3hPsJBK4bu4-Ew@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] usb: dwc3: Add Renesas R-Car Gen5 DWC3 xHCI USB
 controller glue
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Thanh Quan <thanh.quan.xn@renesas.com>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Thinh,

On Wed, 5 Aug 2026 at 02:48, Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
> On Tue, Jul 28, 2026, Marek Vasut wrote:
> > --- /dev/null
> > +++ b/drivers/usb/dwc3/dwc3-rcar-gen5.c

> > +static int __maybe_unused dwc3_rcar_gen5_suspend(struct device *dev)
>
> Avoid using __maybe_unused. If it's not used, remove it.

Whether the function is used or not depends on CONFIG_PM_SLEEP ;-)

> > +static DEFINE_RUNTIME_DEV_PM_OPS(dwc3_rcar_gen5_pm_ops,
> > +                              dwc3_rcar_gen5_suspend,
> > +                              dwc3_rcar_gen5_resume, NULL);

As DEFINE_RUNTIME_DEV_PM_OPS() uses pm_sleep_ptr()
internally, the __maybe_unused annotations above can be removed.

> > +
> > +static const struct of_device_id dwc3_rcar_gen5_of_match[] = {
> > +     { .compatible = "renesas,rcar-gen5-usb" },
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, dwc3_rcar_gen5_of_match);
> > +
> > +static struct platform_driver dwc3_rcar_gen5_driver = {
> > +     .probe          = dwc3_rcar_gen5_probe,
> > +     .driver         = {
> > +             .name   = "renesas-rcar-gen5-usb",
> > +             .of_match_table = dwc3_rcar_gen5_of_match,
> > +             .pm     = &dwc3_rcar_gen5_pm_ops,

But as Sashiko pointed out, the pm_ptr() is missing here.

> > +     },
> > +};
> > +
> > +module_platform_driver(dwc3_rcar_gen5_driver);


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
