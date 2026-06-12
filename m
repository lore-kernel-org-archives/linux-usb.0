Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC263E314A
	for <linux-usb@vger.kernel.org>; Fri, 12 Jun 2026 07:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250692; cv=pass; b=L3iGOf9utWSk/PT65z5zjayQzrRTM/brB3iijSqL/unEybnEp+XFn2XA4/PzAKF63lwzb6SWBupD9GZilf2cSpYok0R2ipFBhgU7IY1ue2xYWfASeo914Sy8i9e1yLjyw6LCIPhcigDFVy+lCV97k485IFOoI84grRXHKMi0opE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250692; c=relaxed/simple;
	bh=AAW7Bc+70pQhpUTfJT214lM/e5AbzwxyHZSFmCFPS7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M56IpLpEL3hUjVYCVPOP8QDUkBqxmv7r01C0BrkOTUdMPRjow2ZPbwP3Tk/BKf8vzOQmvHY1if7KY+kq1G4BxlUGeXn0s9yCIPAgpoHJatoYT2+QUS+VS26EQxJsT5ooMsGRYdI467kp6cTiCnIx5QAruTSpsHvQ+TKxJi5xrwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FOExL29O; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FOExL29O"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7dfceeaf168so7509627b3.0
        for <linux-usb@vger.kernel.org>; Fri, 12 Jun 2026 00:51:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781250684; cv=none;
        d=google.com; s=arc-20240605;
        b=Z0MKnrbFLNdnuPdJQFOBsWfrigFHcO1g/Vna+uSuSxMRtK+IONjxpOg7VFGmdMKQ+x
         BIYfCFWhfnpXnl3m0oDNoUL4xPYt2WVrja29Pp7CdrLNwTtK2s2O9966ny6VDMzB169N
         geutoGpCioGbJ1rbfxtRkU8aTCcFEgUrtDRWIfHlmVzCowQudIlxEiJaDIxdaN3/sX3T
         SVBFUIsKuV9BiK5WWPJPFg1ik/Qtr2/b3qazV6MmTR/LR72AJHaiWghgNfxdH62n1yCS
         i9Dhw0VfCL6EDOLZCGjInO+uDV0kqhq8qs6b0LMAOeUJjdGtuvmXtf9UP/NuQiAutf4a
         NNHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SR0MIdclzqLJ5NMQX/zWd9Yh3H6pzRPWDeVIlwB7J0g=;
        fh=/9o5T0fcezb1uKaJWzs8MpevZ/SnS7zhbXMuKwV7e6A=;
        b=cgpKTuvEBKVnwSCDW+lip4PTWHo6l+Wvi8r4dTpYV8wLu5xneqvHBHoM03g3HYlXVz
         ukIc/NXq2oBWEvpFOr9+rOFsK8ynPjForDRDN0YY28KA8FhF2KmK9M1yJ1EIdFJaE6hD
         VPJS4HgJlqmcQstlJAXQVAYIuUnE9PUQq6QPhCKtVvzg1vZ5TvXXQTeBVfQ+tdbGtYAy
         PGg9Bs05p4973Hj2PG/4Csjbri8KSDaQ/3UMreBInLTW/zc6K94Xk/BHYZATneeE6FCm
         ZHue7cINDxBTo0DBvZte975vHTjGdjFTxSgGefYwmxAW6xaOOm2Ul6yUQCrbTvxeX3S5
         gGkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781250684; x=1781855484; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SR0MIdclzqLJ5NMQX/zWd9Yh3H6pzRPWDeVIlwB7J0g=;
        b=FOExL29OPYXtRjr1jFVeFa7zcPsHHFHr6diu6VMqNotYkNZv7Wjo3syPc4R8ExctZp
         dRfHQrQ1QbppC5ogpXbF12ugxXsiKvzABW9lOoaQg9awzs4dNN/NYp20PF5wDlT8hpjJ
         1S1xuuiqMchZQ6nCjXW2tI+NMR/LrTS+SDRC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250684; x=1781855484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SR0MIdclzqLJ5NMQX/zWd9Yh3H6pzRPWDeVIlwB7J0g=;
        b=goJAVUJ+j99hN6aFZzLDX6eFIy7INGk+C+SEivTOdKCQxcJt0un0MtS4rQGbEGq53d
         G+AohZS5Lk0qFsaIYBS69+rlHIQ6pj3SRzD54Z8pa66Oyv4k7rjpX1zcZLyDSy+K5lhC
         7VbXqBq/XQNG3v0Uq4MoP0UxVAUDjmK2N9TwR2jl2HD3Rd86lr/wSICN+omPta69hKY0
         YPyCKMnK1IT9+rJW6B1yYEWV+B6UtO8nWAmN5REy7C2C+bMt48ivEdUwC1/3vQc1slyH
         LysOH1HN0HGXAVkWIin42at8ULKTxcex47foSpQ2BwPBd87qJV+Icq6bWxuYyhz0lbId
         UlnA==
X-Forwarded-Encrypted: i=1; AFNElJ+mmeBL4SxpvTUc41ekPBuXc6LAoduRd8CoYq+XPDnkLaVQySSbt7SitoEMj28Mli3gLW97AzhPvxk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLz8Pu5PB9OexJqDxJ/RKlihjZ4R2IpmNaO8coqS6ebp/Q8yVc
	7XetGhp+cB7CkN/0SEZ2GXuTrGJFKmNoD+iO/rQNcNX30s7nMeG6QFjJWhbUxImLY9LTvJr0MQR
	okUipx9YEEdnOncBwI23l47F5Kd/pajWhqyrcOIi0
X-Gm-Gg: Acq92OFyk9mNN7oPmsVhVtIDR7tB2RhpuSlFt7rTFAkZwxqye8OqK9SLUf4/wi12jWf
	d0df9N8MA86YRXfLPKPW/fzaWGKXpdtvrBydsYbllIFtLsyXcusk+FRyw1SChRf4xkVZBxHZZrw
	9qeC38MzpQ5l6jRw+hJBExp1E+PSDg/1FJFDLSkiXHHvOI8aVmtfnNjBUy6m0iljd32SF7Xfri9
	R4LNWNQVn+gfvtNkg/izcvIYuL2OUdXSv2mCmPNYnP34yHxlJ0EI34F6Ezn3W48QAz6u1/Eb/lm
	bu/veO7d
X-Received: by 2002:a05:690c:ec7:b0:7bd:73f3:7a70 with SMTP id
 00721157ae682-7f7b8523999mr14898787b3.32.1781250684397; Fri, 12 Jun 2026
 00:51:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-5-wenst@chromium.org>
 <ailytpKQcvYTUH7j@ashevche-desk.local>
In-Reply-To: <ailytpKQcvYTUH7j@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Jun 2026 16:51:13 +0900
X-Gm-Features: AVVi8CeA8ndBvqsmj_bBdEg4mr2h2E0R3_zPJJzKBFEx0mTdugBDzHIodwmMGm4
Message-ID: <CAGXv+5FrD7abUvw5JgZECcGBvtOOpezDtmUrCRmVAbDx0ApxhA@mail.gmail.com>
Subject: Re: [PATCH v2 04/16] usb: hub: Return actual error from
 hub_configure() in hub_probe()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 11:20=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jun 10, 2026 at 04:40:38PM +0800, Chen-Yu Tsai wrote:
> > The addition of power sequencing descriptor handling in the USB hub cod=
e
> > requires dealing with deferred probing from pwrseq_get(). The power
> > sequencing provider may not yet be available when the USB hub probes.
> >
> > Return the actual error code from hub_configure() when it fails, so tha=
t
> > the driver core can notice the deferred probe request.
>
> Makes sense to me.
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> One nit-pick, though.
>
> ...
>
> > -     if (hub_configure(hub, &desc->endpoint[0].desc) >=3D 0) {
> > +     ret =3D hub_configure(hub, &desc->endpoint[0].desc);
> > +     if (ret >=3D 0) {
> >               onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
> >
> >               return 0;
> >       }
> >
> >       hub_disconnect(intf);
> > -     return -ENODEV;
> > +     return ret;
>
> Can we convert to regular pattern, id est checking for errors first?

Sure. Will do it together in the next version.


ChenYu

>         ret =3D hub_configure(hub, &desc->endpoint[0].desc);
>         if (ret < 0) {
>                 hub_disconnect(intf);
>                 return ret;
>         }
>
>         onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
>
>         return 0;
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
