Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCED951B199
	for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 22:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029026; cv=pass; b=MOjEiLM/kR/hcXhTmUiI+FBReY2ZH+o/Xlmn+sfANLwMGlShpHhsJ0YHNIVXmjqglgI+dAhUkDtbaAgHinyLPZGxnKt/BZhlyP8zYJLcEX+dZ5DWyEgvuYG/mcOdawt7riUfLYxYn3p2BJhGqWFCJMj/Rb4hkangJKllEPMSowo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029026; c=relaxed/simple;
	bh=ygxQGrVULTuQLXHw/7/JdMV/ZQLiV+IGlcOGZt/F2D0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j7qKf27IuWGd57baRw9aZTqNQYIEhGFeF9NqM3SFxVmqyiquSFped+iV4eW/kpbYwJsSIvOSVGPRWK+wJLXFxn+8SiyWiLHOCGr0yLVykGvyKguvDL4cT0YXuOhaoX48R3MGNmHlvZxepawIEWbwCZIUcMjd/b3lsSTkcnis2AE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o16dsyQu; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o16dsyQu"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9a2b95b72so5680210a12.2
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 15:17:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790029022; cv=none;
        d=google.com; s=arc-20260327;
        b=nYzd3dan3V+03xvZve5o8ku7MEyjXGhFPexCEo7Yb5a/MXKhhfvhNq8miD5r4m1BKy
         a5zCEnYGP5qdrv2KP115VE1bpYkBjVrIlH+CwxVEABu2nytdSfyi61HWRNqFqqkYFi7e
         LJZe8hGY6YthhlAruj6Cd4bDgBPbQPnOQrnL0oEqpegG9FU+AXoZwGsPH8i8jFGwUEBN
         OY1JI3vN/2Luu1KMrYpHP32y0CoqkfVpYZ4rUiaqISQ5ytwr97LfYYg/Vxav+Uc6WA4a
         5Le57dC6qzZ/SaCOhbRjhmJ0whqr6b0PZj74Npwhdu2wDSLoPWvdcZKePVXuRIfSBbHq
         c1Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ck2dQ4iiA8x8tPtfYLzBLk9ACmAdSjWMpZnAG67iB4E=;
        fh=pVjjXFQhmHxX18On5P8Tewajwq35yS7ku3zqZVOsW5Y=;
        b=PJJhZMO2vD37aryEmwlhs0OX0Wm9qb90lco6NNfnO2z3JPDEV1QWowATDuRgeYTXy4
         TKy324ZLfGHv8htQ3pWCwcyXoLfjy/mtWYcHUqhH7ZuU0MVg3IhS1Q6vbFAEZRDajfZ8
         YtWKSQ+yh8z0EaxFkmk7O8CG7L5GdwEF13QGYuvK0jkZC4kpkaao5DIY0g+EfeYuV5vG
         ZBKfWDhvmBqJHsxpNDy56zcZU2ryJEuWluJJEQ0Tr4h3rjdheGdth6+wQSYipkUiMX0l
         cEBqXsiTE9ncIlAKaU1HFOH7+H23iQVRVybPRk3w+ZHS0fUvG7cOAKGdBikdZne6LwN5
         Sh8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790029022; x=1790633822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ck2dQ4iiA8x8tPtfYLzBLk9ACmAdSjWMpZnAG67iB4E=;
        b=o16dsyQumVzJ6ZQD9CBPZDz7YOyTg+pWyJM4BZxRIEkzasViSj7ryKk/YSR5KboqyD
         N83aI3rJno/AkfjPuoFBp8G0qX7X6KV8DXy75N9/Ih4AQ+dOPnVxxOVz/SFmwSdi8rXo
         PAckqX5bPQv6k1wOv0NO8MWWG4mlhF3YLJaPpnWql8Bro/IbTaTziifDN9OIeCQwtXn5
         eZKC//FrR3NTUiMsi+gtr6DnbmWadYllc02tNhue6HVursRuuwxEscIkUO0jujJxEQ5C
         Ge6Y5UMpXO0bjYGlDGZtvETsUXLC2BzMDi9cU38TvWYHuFAPaM4NgEoNeFH3zVB+ed0w
         vKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790029022; x=1790633822;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ck2dQ4iiA8x8tPtfYLzBLk9ACmAdSjWMpZnAG67iB4E=;
        b=sZAWouSViZvzE09JqAMCeKjm727cGBq72yj9JdM7upH2UStXHEout3WzOh+bqWPph+
         x/XltvSiQsgPceHG29kcmAjdYobgN2oSmNqfTLJkkWBjmisdlKoq3gBzhUcDUJl66opS
         3kRojuPX7iDAETLtufUJfbE5L4s4v/RQ9kqGIdmWBhm3J1a+y89tJ/eyNGZGEHOCUu+H
         Bib28OfZO+lCUm/HIB52ct4Tcdy4FocLHWBuC/4lZ+qGtm8vSRwrSojKH98sxEeH1xMF
         lrSnQaPTMKYsN9cDinemz3wgCYnXvbNlr9+OMf1CLvgUmPKHX6622YjFuUyUIpwDmWPa
         WTXw==
X-Forwarded-Encrypted: i=1; AKwUvBw70R+RuLiFEwo4ztOJanP4zTr6n7Ecy+xKXAlJx411khKaIJ8qF0BT00/SI7kefmi1ljJ3/KLjpqc=@vger.kernel.org
X-Gm-Message-State: AFuF++mqiOJkVQyJf2j3ILmapZFohMqn7DtV5IaDMRBZRqjfVP5gYVeW
	V5/i58SopJUUzHJaUqzhRTVjjGHl5mWFmmH2qrR3EHEcm3pccCD5eArJPaoThkfF124FmgIFk51
	Q8XEItZwarbZL6OnBDvi74fYFq2gDfw==
X-Gm-Gg: AYBFou1Q//5HWTFM0tN4TM8EpwBJBNOJkQ/BxCadHPHGU97HzEoCX8V+Papc+58kbcb
	6urp+Mp/I7PZVHi80KuSVGj+EIUXitf2F2qvHh5OwN5qyw5Cnm8yevjrNu6I7wRRBuXoQZOLQym
	Clqnb3fSgNgThtf+sbCtiqZ2wAaolRQg1X7YoWie8lIpGNh/olohGodoRq+2JEbRMpY2DoXHMeK
	/6+i7jDeY8FKf/0lLgxZcDY9iIV4iShKYdXaQmpFUeeDYokUvUh1dIaHeZ5oFRgLAITYfPm81Gf
	cpGfWwkXoDPxHJNdczREMtOgEBbRwk9+DSyhFRJJ0+w2txpByu2r3DbNbIuqzgDxjyu12rhby3n
	O7+A2GzwOUk/sDfzoUlyKSSF5fol5aiOG5YtoUfDz0AWb8LTM5RZYjrNKzOkrrN8W25DZ
X-Received: by 2002:a05:6402:2790:b0:6a7:ee56:8158 with SMTP id
 4fb4d7f45d1cf-6aa579b0382mr9106641a12.38.1790029021870; Mon, 21 Sep 2026
 15:17:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGEsz8F2eKsmV_tymO+9UD5xkS_tWhZo-b9Xom1_SiKuc-BCqg@mail.gmail.com>
 <arETYSjwaHytxyBu@orome>
In-Reply-To: <arETYSjwaHytxyBu@orome>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Mon, 21 Sep 2026 18:16:49 -0400
X-Gm-Features: AcwNN1ULiGgKpQwlzJhSBbDWZG7BlTQmkG_ouL-IXAT-QUCIcQoVWsAgftcR8FU
Message-ID: <CAGEsz8EpXPPD=S8uM4fex1_c5eV6byzOcYgVyqmJMKBLUAm67Q@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: tegra-xudc: Disable port reset work on removal
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review. v2 keeps the Fixes tag on one line and switches
plc_reset_work to disable_delayed_work_sync() as well, since the
port-status IRQ can queue it after cancel_delayed_work_sync() returns.
usb_role_sw_work stays on cancel_work_sync(). Its producer is the USB
PHY notifier, which v2 unregisters first. The two bugs are split so
the notifier fix can be backported below v6.10.

2026=EB=85=84 9=EC=9B=94 21=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 7:28, T=
hierry Reding <thierry.reding@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=
=B1:
>
> On Thu, Sep 17, 2026 at 07:20:58PM +0000, Myeonghun Pak wrote:
> > The port status interrupt can schedule port_reset_war_work to handle th=
e
> > Tegra210 port reset workaround. The remove path does not cancel this
> > work, so it can run after the PHYs and controller resources have been
> > released and access freed memory.
> >
> > Disable and drain port_reset_war_work before tearing down the controlle=
r.
> > Use disable_delayed_work_sync() so that the interrupt handler cannot
> > queue the work again while the managed IRQ is still registered.
> >
> > This issue was identified during our ongoing static-analysis research
> > while reviewing kernel code.
> >
> > Fixes: 49db427232fe ("usb: gadget: Add UDC driver for tegra XUSB
> > device mode controller")
>
> Please don't wrap lines like this.
>
> > Cc: stable@vger.kernel.org # 6.10+
> > Assisted-by: LLM
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> > ---
> >  drivers/usb/gadget/udc/tegra-xudc.c |    1 +
> >  1 file changed, 1 insertion(+)
> >
> > --- a/drivers/usb/gadget/udc/tegra-xudc.c
> > +++ b/drivers/usb/gadget/udc/tegra-xudc.c
> > @@ -3926,6 +3926,7 @@
> >
> >       pm_runtime_get_sync(xudc->dev);
> >
> > +     disable_delayed_work_sync(&xudc->port_reset_war_work);
> >       cancel_delayed_work_sync(&xudc->plc_reset_work);
> >       cancel_work_sync(&xudc->usb_role_sw_work);
>
> This is a preexisting problem, but given that we only delete the gadget
> below this cleanup, shouldn't the other two cancel_*() calls be
> disable_*() as well? Otherwise there's potentially a race condition
> between this and the interrupt handler (which is only unregistered after
> .remove() completes).
>
> Either that or the existing cancel_*() calls are enough in which case
> your patch probably should be using that variant as well.
>
> Thierry
