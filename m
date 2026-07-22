Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCC13BBFA7
	for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 09:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784710894; cv=pass; b=qQin/Ww2Wm2dwE5oaXal6B3w9787rQPsKtUkCgHYEHvKZ+aAE3SMCF3gd55H+2wKF3FxHgEteNYvmfn2k1xwVt+5aueD8LIP98YT81xh+SM9Ii+rgkdK14OZZjyg+EGc5pix6fObrcoj23zdPT+XmZP4/jJ7slHFuNJAcPnkz7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784710894; c=relaxed/simple;
	bh=kjMhhSUJeM58LyEBWOqNhoBXbBuuVqDLE8DYLHYzEqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ENGgagBCBuFYbDcnE7835/NEZPLyFabLk3p/0ItPddRjRrUwpQsRrWHsRgOUdYMoTfGCe+hsxYb7X948YN+K/2X0ai1UnrCsyt7Ftu+Iw9twGNqCPPv2tJEfsH/Sgdg7S3FtZRKtZgIaE9MZyvitQYwGxoj9Bbc7rYDuBYGMaqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mXJbWsPe; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mXJbWsPe"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8114a4542b2so72357987b3.1
        for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 02:01:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784710891; cv=none;
        d=google.com; s=arc-20260327;
        b=PoRNeqrFMymYSQNny6GUI9YQHyASrpG48ircJDrMz2m25TMOslsVHmiNGsYdtRLwkC
         VyCKMeZkLE6uj3HXnXiFqz5O3V9ZucWNiaIYJfX0VWEkOU7RCSmsxTQ15wgHO19auG4W
         iQZmtEE1KSjZQ0tZV6NyhTCpjLx0ouvEKlQrNHZK7ih4wQDJm9qI9cp2ZYWpmvnXP4jC
         4ZM/AbRuFUE+RO0RFa8QvDFecOtMakvtJHQQk7nCwa1Lis/XW9Dl8kwltkjuyV+R4PYv
         xv0PDky3FRyMIa2pXDi5pFpjLN7I8R8XxUASmN+MRMudjV4VwsC0Y+htqleGTjro3RdC
         QIiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BVQ32j56Dr60NJMwmM+X8AwJaAcbdmT9panK+KSnLpY=;
        fh=X6z9mE+n4QbBaaRll1qMUW63muwMzUdFhtiFFzfKwoM=;
        b=WvaQEs1askAC3IQK45lkDKn2FkmXMQPEkW8PRW42lcmc4wmMeZsPVFClKPWElwn9Ks
         JSNfUi0/nY2OYIkXpvIQzaKFkgNleWy3l9BbdBGW8V1J1J+Cz7ZrnrDbspErOX9mLN9s
         b2aKf/cdFVWQOclhOhqqxQOe0DMlEkR5KVBXDcnOOZLbuitYUVmV4SMI2eeoVNlpGMSO
         gzZmZ4TVzL7+kfIRvyZhk+fvEyunw0mmGf6EUocBozRVoXgXdkkI5LwZXS2/QoJirHr7
         I0G337sDv5Jis4kLaJma8TMUDGyH+RWY5jhPWOjLyDplZWSVig68jSjb9rDyAzPQbnN4
         A2Yg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784710891; x=1785315691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BVQ32j56Dr60NJMwmM+X8AwJaAcbdmT9panK+KSnLpY=;
        b=mXJbWsPeCO8FslQIu10GK72HjeWHi1GFyymj/tGTDhE5yi1vHwlRPV046PHgZ7VpF6
         NEAxPt8ne/efXzlFDPF3d0AZKJ1AtDazYWogGUm5jeMFvwz4KLohfxv1cU7ZnMbv00OG
         XoBwDO7yJNVGOswjqco0Vgsms2BhEWcHJ8IV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784710891; x=1785315691;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BVQ32j56Dr60NJMwmM+X8AwJaAcbdmT9panK+KSnLpY=;
        b=iRAeiBmjr/4qIF90uW5l3h4LLRHjVFk7tsthcin02nKm+CoP6yi5RUtsKFhoenDi1t
         vO2H9P2PmGmzaesg/y7+LHxAp31QAjZH1Xtnf4ZB+xFZrkAlohDqxtd3wkoWl/ZNuLf9
         mmmzjx42vVTjxcIE7GfCIx912XePjkwycMJkkWq6//6qDbTsHBOZjyJZvnpEiu7U/pdM
         +/r+ETn/OT1DUQZOyalqx/LA/c09YdjJFzGhnA2jWcPO95+aejVzUQoMuTSepad2A7Ff
         VwhKeUX/s4NKOOvBBmS5n+iv1zD0H1Nyu+uWyetop1R7y0h6WzAR10ckWdcrKHjb5PtB
         1xiw==
X-Forwarded-Encrypted: i=1; AHgh+RopG+RQNOITqiYVZtOXYlFidajimmiMOIA/DwjwR+TS/YdMNMyhsJpQAHgY3eqt9ta72FcBV3DxfKs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2+ZEQOh7azpCrQm8qPLKOSMpe6rMXk4CAfxnZbP+ihkMUreYJ
	JWhB3IbgIwcTUxPRGKOV5Ivd8jpMYVCR6Hnau3HALCT8wTPy57yrJ0GxhKHO3sEJ81YIQHxM4en
	gqgmBLaGGcyCJmPCrubRCdoDmLcQcNJZYkgq/wj9U
X-Gm-Gg: AR+sD12m8Rlg7qDUfIhIMhEi0AmPRk77pZUcl/qD0KKpjfhBirc+dtAK1ylcFyMrcgQ
	zIkYr4xwHld8cfBe5ci9PYuJnNSgHsJ1g9ZmBGhBsNDjrsbbJTVjkTG37Z4ov1O3ZWA5m16ELNd
	hDuesnqay8gl4FlxeAaKndqVnSsAzZ2yD8IN6wBjrk9+FsB1ipoG+2cSyFJXjyI2/mPWwMuxCy+
	AMn2O6d/PKfENPHtLB6+MU5g04q+hN9LNMSy1c8j0D1wlkMJFVXQrStzF74DXdfHYbYDzIk3oa9
	wQNads3knhHYPFfq
X-Received: by 2002:a05:690c:e0c:b0:81e:6a1c:e30b with SMTP id
 00721157ae682-81ef28da7b0mr69266347b3.67.1784710891191; Wed, 22 Jul 2026
 02:01:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721065413.2306137-1-wenst@chromium.org> <20260721065413.2306137-4-wenst@chromium.org>
 <CAMRc=McsCRBxXMj0xC8H0cgdZZ=Z9_4u_DS9b2z0pLE0=gZr+g@mail.gmail.com>
In-Reply-To: <CAMRc=McsCRBxXMj0xC8H0cgdZZ=Z9_4u_DS9b2z0pLE0=gZr+g@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Jul 2026 17:01:20 +0800
X-Gm-Features: AUfX_mzymMOrnzz3ZSisQQjvbDECVUbqfaXF7TwtpwvIT3XYymwiPHVmpWvFgt8
Message-ID: <CAGXv+5H_V+J0cvrYjMFdKAQVrPKxPdtimXMc+hwHenwxhb9mDQ@mail.gmail.com>
Subject: Re: [PATCH v6 03/16] power: sequencing: Add pwrseq_power_is_on()
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 5:08=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Tue, 21 Jul 2026 08:53:58 +0200, Chen-Yu Tsai <wenst@chromium.org> sai=
d:
> > The power sequencing consumer API already does power on state tracking
> > internally. Expose the state to consumers through pwrseq_power_is_on()
> > so that they don't have to reimplement it locally.
> >
> > Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v5:
> > - Reverted back to returning -EINVAL if descriptor is NULL
> >
> > Changes since v4:
> > - Make pwrseq_power_is_on() return 1 if descriptor is NULL, i.e. if
> >   the descriptor is optional, matching the other pwrseq consumer APIs
> >
> > Changes since v3:
> > - Added missing stub function for !POWER_SEQUENCING
> >
> > Changes since v2:
> > - New patch
> >
> > Needs to go in with "usb: hub: Power on connected M.2 E-key connectors"
> > as it is a build time dependency. Bartosz wants the change on an
> > immutable branch to pull into the pwrseq tree.
> > ---
> >  drivers/power/sequencing/core.c | 18 ++++++++++++++++++
> >  include/linux/pwrseq/consumer.h |  6 ++++++
> >  2 files changed, 24 insertions(+)
> >
> > diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing=
/core.c
> > index 02f42da91598..72b96d36920e 100644
> > --- a/drivers/power/sequencing/core.c
> > +++ b/drivers/power/sequencing/core.c
> > @@ -968,6 +968,24 @@ int pwrseq_power_off(struct pwrseq_desc *desc)
> >  }
> >  EXPORT_SYMBOL_GPL(pwrseq_power_off);
> >
> > +/**
> > + * pwrseq_power_is_on() - Queries the last requested state of the powe=
r sequencer.
> > + * @desc: Descriptor referencing the power sequencer.
> > + *
> > + * This returns the last requested state of the power sequencer.
> > + *
> > + * Returns:
> > + * On success, 1 for on and 0 for off; negative error number on failur=
e.
> > + */
> > +int pwrseq_power_is_on(struct pwrseq_desc *desc)
> > +{
> > +     if (!desc)
> > +             return -EINVAL;
> > +
> > +     return desc->powered_on;
> > +}
> > +EXPORT_SYMBOL_GPL(pwrseq_power_is_on);
> > +
>
> Didn't we agree on introducing an enum to make it future-proof for when w=
e
> also pull in pwrseq_is_controllable() from Loic?

My bad. I misunderstood and thought it wasn't needed yet.

> I think this should work like so:
>
> enum {
>         PWRSEQ_STATE_UNKNOWN,
>         PWRSEQ_STATE_ON,
>         PWRSEQ_STATE_OFF,
> };
>
> int pwrseq_get_state(struct pwrseq_desc *desc)
> {

I think you still want this here?

          if (!desc)
                    return -EINVAL;


>         /* Only once this is upstream. */
>         if (!pwrseq_is_controllable(desc))
>                 return PWRSEQ_STATE_UNKNOWN;
>
>         return desc->powred_on ? PWRSEQ_STATE_ON : PWRSEQ_STATE_OFF;
> }
>
> Bart


Thanks
ChenYu
