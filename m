Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270E941686A
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 11:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521042; cv=none; b=M1ckoKXuaHUVXm0dkn0igt+lW8SP03TivpOTqOWx7irZoSLr8C2Lrcd0/ZYYozEh5Ga5g7FxU4lAQVDS2fvkQ/1S9aEh0dOgnLNkV9Y3irohY7Jdvyd0DTCw3IhCBs4vY7MeG2wNBW/l4bBX99Q+MbfdGk/NPYsJ2e7yNe/w1d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521042; c=relaxed/simple;
	bh=V06IaIi4jTJzj1JK9gqz8ZBxdNpdoXx4g6Xhk1QdB8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=urI7wKvB5nXa1N8/WnK9/wVThgoaR16CM0wySiH7CSHQ3Rv5IR/kzsWdEFeXwwBvSy8Hdd3ve7f1QquTR9YL+rEKFyb8ZUnxv17/toiYnxeR6l3cdF9CdlyFc3dUrAhQfn7rEy8miLIXN5/wyVhZ0feMuW2jX1zmiMYriWTT/cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4b381337e1fso802672b6e.1
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 04:24:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521040; x=1789125840;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bKz0EbNXKgkRmHwAjHcE4su/TyTn7raXYOe8ludN9rM=;
        b=qF29km/oRa22oer8HUaMoqGabEYMNUFSPsmCxZE8z7Aq2Y9MIrIuwIW2GWvCQLt79m
         XzReuHgTH9nB9uizrzpApCIWgIH12s/uPnsvaV8nyX+OKWWdT0Uqjw+1R67spUnK+T3R
         y/I8GKvxOVfmKF+vARmxAmTWPZQK1Ws1g/p2Z5EZItz5skrW+ri8RECPTuGFW+6Gi0b9
         HZ6XcXxVpNBrhvsQecdCVQb4fEB8IIZhrqIPpYVmkV5InZMLBQmBzngnOpLSq1L6qW5B
         xVhZEiD4ZI1p/cYNvL+GLzsZ5JfLz2n+Zgixv1B56x5XAC2Wj0g62I9DHlQtt98lwTDh
         G+og==
X-Forwarded-Encrypted: i=1; AKwUvBxj4VpkoqLS1/aQ5KWpONGtxHbbltA0GP0mHWdligWV4sBKwUxRRBWLlglUYr18YGwRmbx51gzcohU=@vger.kernel.org
X-Gm-Message-State: AFuF++lbfSujK15XonbH5QtZkiP8WrIGteKRPOruy2oPNDqOIrUDMtGi
	aFNiFdu79L9tRr7yWdN29byAuEBT+jc05ZSiesrDsT7kakBe59Vqn/dnByFISjq6tFs=
X-Gm-Gg: AYBFou1gHkLIm7SGOoTRCZPv65dxFsbtoIVrnQmFrwbecRitSTA6u9xaJ2kYd0Y/btW
	hCkQ0xuCUDbk8nrUg71oENJIZBqX+vV4/OYQrkhFTZc1rWOhgtxZaUOk8SsL0FR2cDxVkFFchvq
	BaM5aww51zc0rqBcfBHaAm548GJrMrZpcBEpfaNL8VIZ8UO7PK8jKoLqgQpMDync0HdIVCUptmh
	hKr6RRn41QfKxsD+QVgdg4W506mZRmfneIK5Jf2QyKbkmGiQRWBeRGm7VWcEARKcjn7dPmsxUci
	3XDvqTyGFOA70Pjj/78Yn3Uiae21W/zQv9Ij3DQurOs4eSlt7fkRJKlvqsw0KPcdTqplbyMFk0t
	WPCOJUBTH31ceeH56KjjK5aktNqQwnPICdBNkVZbJ4tUhplJr1d7alaFt9pzm8vqrE+gtXAMExb
	nH+qjRP6iW0MTOmoLylQOfmbaKkgklTiT1qrgCq47ib4WJXbwXIGNkQGaRktJCA+AKZy4UJQV1a
	+K8tSul/1u1VflonWhiYeIS3A==
X-Received: by 2002:a05:6808:2228:b0:4b3:63a7:b955 with SMTP id 5614622812f47-4b961d9af7fmr4808180b6e.7.1788521039684;
        Fri, 04 Sep 2026 04:23:59 -0700 (PDT)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com. [209.85.210.54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971675f82sm1828172b6e.12.2026.09.04.04.23.59
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 04:23:59 -0700 (PDT)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7f48c750afcso813270a34.0
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 04:23:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxl43ScEkj+SoYyjcAXXL/ZFeJp2CmufuFMH8iCUVtMq8nSyA4guTAVP/PcYyWp0vzFgBdO7usg/vE=@vger.kernel.org
X-Received: by 2002:a05:6102:6b01:b0:77b:b14e:b670 with SMTP id
 ada2fe7eead31-78a4aa0794emr1096677137.8.1788520616710; Fri, 04 Sep 2026
 04:16:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-rzg2-sr-boards-v4-0-4a456a422fee@solid-run.com>
 <20260902-rzg2-sr-boards-v4-2-4a456a422fee@solid-run.com> <CAD++jL=fGonMHd0jitwAE8+w=JYPX_6YFW6CzS9kRZLbx3045Q@mail.gmail.com>
 <0435939c-2836-480d-9ba2-8de4c5e22cc2@solid-run.com> <CAMuHMdUE3+qBdy2CoSQMzJ1iePiv0PSTfOjxHAqgp78i_XpMPQ@mail.gmail.com>
 <c0a37ff2-b133-4bd9-82c6-732f58e2c5ec@solid-run.com>
In-Reply-To: <c0a37ff2-b133-4bd9-82c6-732f58e2c5ec@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 13:16:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUOqA_mNQ6-+rxcTxiJSWDBQbiaLqYAtVEko6T7DLgOdg@mail.gmail.com>
X-Gm-Features: AcwNN1U-uc-LOk3gvbh_6tN7N3DFNnBp7J17BKaRTYV7o3lPeDqXkvPWiYvEkoY
Message-ID: <CAMuHMdUOqA_mNQ6-+rxcTxiJSWDBQbiaLqYAtVEko6T7DLgOdg@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow
 input-enable pinconf
To: Josua Mayer <josua@solid-run.com>
Cc: Linus Walleij <linusw@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Jon Nettleton <jon@solid-run.com>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Josua,

On Fri, 4 Sept 2026 at 13:14, Josua Mayer <josua@solid-run.com> wrote:
> Am 04.09.26 um 12:12 schrieb Geert Uytterhoeven:
> > On Thu, 3 Sept 2026 at 11:23, Josua Mayer <josua@solid-run.com> wrote:
> >> Am 02.09.26 um 14:58 schrieb Linus Walleij:
> >>> On Wed, Sep 2, 2026 at 1:50=E2=80=AFPM Josua Mayer <josua@solid-run.c=
om> wrote:
> >>>> The list of allowed pinconf properties already includes input-enable=
,
> >>>> but has omitted input-disable.
> >>>>
> >>>> Both refer to the same hardware property, setting and clearing input=
-enable.
> >>>>
> >>>> Add input-disable to the list.
> >>>>
> >>>> Signed-off-by: Josua Mayer <josua@solid-run.com>
> >>> (...)
> >>>> +        input-disable: true
> >>> The Subject of this patch is  "Allow input-enable pinconf".
> >>>
> >>> But what you are doing is allowing input-disable.
> >>>
> >>> With the subject fixed:
> >>> Reviewed-by: Linus Walleij <linusw@kernel.org>
> >> Thanks!
> >> I'll fix the subject ... !
> >>
> >> ("dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow input-disable pin=
conf")
> > No need to resend, I will fix this while applying
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > i.e. will queue in renesas-pinctrl for v7.4.
> >
> > I will also add "output-disable", which is missing, too.
>
> Thanks!
>
> However I am ready to send v8. If I drop it my series will fail dtbs_chec=
k.
> Is it okay if I do resend it, and/or should I wait and cherry-pick your
> version
> so that it is easily dropped while applying without conflict?
>
> Or drop it and live with failing dtbs_check?

If you're ready, then please send v8 (and add "output-disable").
Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
