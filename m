Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FCF3E4C7A
	for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2026 08:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784277180; cv=pass; b=Fm7zLFy3nKUAQyaW0se0dain1j83+p4reLC54eYgXxAjtGyqhfCYugIxDdaXnSlF7Vtz0RgbCm1UnYR+KDjczgIhGRe2UfevuCWcADJjRgd56qx1klj0ZtgPMF69WH3A2Pyz9wA3jR9XXdHAhHX1ruCRdcF0R4N/Gn71cm1ESkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784277180; c=relaxed/simple;
	bh=K1k6G6+5zpiLdWHibg60JQFt+WiCSRiOFiAgjC0rwxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GysQWkhr2ZxzaSdk3PNd/+qRLhE49c1depQvtz7g4pwYZ6M24WkILQJrUtfZMf5r4pukt3JTABUfosekg8dDsI+xRldbynzDgnGn7IgYtJrgSIpP7aiujHls9gj1UFcffeyoWD+Wkc2OdQ5wE7NIGo6I140RC+5UA5qzgob6LmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=l2kCj847; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l2kCj847"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-667bae10ba3so4053132d50.2
        for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2026 01:32:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784277177; cv=none;
        d=google.com; s=arc-20260327;
        b=PtfxDHn1of9TDFFxMIbuyRseWSN/gEiPEVmWxYetF8WU+9OIeu2Soy1jxObC3R+/I/
         ahR9jNlmIpQTv2oRUyvN/YmsIyirpinUZKaW2EHWFKsB9bWd9dilrj1/GJVfGVuH2Vsn
         n3ugHiayxdAEnaF1bFIB9IqoBEy38v++ADtitygZuOz1FDCxdkXnUEFRgB1ffgNLsZNj
         zJW/QOGWSA2TD+LGXDKTKqK/O2vhT4dS2noFErrJY33ZAptxZrJRBgD/i2i5z9jXbtkb
         6fzlcb7FfONR8AhS5I4Ik82KzRtczf+Q86E4BnJENCXdkRe+QRp0RCoqqHh8ephHUKFK
         qTYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1UhkOJ+I5quk7xrKkpQoT029NfPFJUjtkpwNCEPA8Ig=;
        fh=u/xPYw35dzwxkvXbzHMb1/ADppXjzSeXsQonwbTyjUc=;
        b=JRQwoiCb4ND4qAXMu3UtKwBf4/RqT2VTLrcy5S8NcuttkRoKOT0qhxp/4s0lDM0uwE
         X1+VVd7hDIwN4u15f/1dMR4aUG8kIXHMC4hmtX1y2FqB457c64EMQLfLQj08LeyrLBWl
         zHtqbSO8nYuEhCCk1SSRU3tCFEvJY1fI9NIy32ziSiOkN9dOoZGMmLzGo/EtgngXqLuL
         jiRiOpSGbbU89+VRA5VUacP1DFbAjY8Wdv2kAH7FX0WK/e3PgLAkdXkGESCITK9K2ChO
         rDVnrq4DRVpGt4GWUVVsUqMBl6v3SNM+1mD7SlZz7dsjlVQgEWhSmoNKyB5gCCBByE1z
         vJQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784277177; x=1784881977; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1UhkOJ+I5quk7xrKkpQoT029NfPFJUjtkpwNCEPA8Ig=;
        b=l2kCj847J02c+DpoVjLzUfMi5eK3O+d8hOmWkSba4h1OeBWn02zqqnCMEZfsFR5NnQ
         6uZVDWY9PNLRBlnnAmmS6gLMB0U8yjYxTt+730Xfts+gWiaiJKGEVNhsD8oG+Br5IV/K
         S4Vwq0BI0f/o8pRRZ4vw9ouPi0UFxLlEPUi5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277177; x=1784881977;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1UhkOJ+I5quk7xrKkpQoT029NfPFJUjtkpwNCEPA8Ig=;
        b=qE5JQ/cvG+pnMNe981qh6+kDIzsF6WAT2CFqwF43/O1WmBPwCqqgjTuEW3974Pi4SA
         ttJiOD7lq77GetLKdtpcGxxZzua2KE1Cw5tENq9+hx2ZeAqjgHCzkE+BSiPY/nZXRKod
         yBW5fr8fSwiLan7CNnJW8oXWor0nrREtBPIakPEKvO5Tf2UvIL1bGBgphndhNU2CZ4md
         QhbhyBGxv42K1wcKI70wh6dYmGcImf2fo9IBsNnh7Ahe8iY9Azvp2nldqc5WsNgGI7yJ
         HGME4Co6xzpifHAq9vLHbQzqOBcYehir8oigSY83JVZujgzXAu4QbAHX/9FE7mEr5eUI
         nsLQ==
X-Forwarded-Encrypted: i=1; AHgh+RoChdbxeXFJPqSMfXROl2kCwmeP0Ux4ApBg/xIRn3MARYzdmdXJ2Pr5EFzuF9UQJBgmrrz3+YzvIAw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvOWZfTLiD4/Xvs491HPhopbjn4oBy6hGasHTjp1yD/OK6WFRo
	mdj0nFt3G9Zn7tZ+y196xowrW+C57UajYfZWsCNY7pkMJI2e7a2HfokTGbZ9WcOWgqGvh1EdWP4
	bNy2+rtaYPJ6kRpE85e2qw5LBQRrGS3Xow/pC5Nrz
X-Gm-Gg: AfdE7cmzzyL5WKkQ37XOopQEff/I2ylswEvsauVKC13pNaORbr89vL8lpF+ddXqoBGR
	lZiu5T6KO7JyWoT7eFwZ2bEnfEZHAVg9KymTZRwjJauTItEIRoFIAEmcZnqB06u+/4c86yfQLoW
	5qNPHnl4WlY0YowXeDYj7SSD0iIwMJEBhEGQh4HCg/I4AvDZ+FfohHTjBo9DLsdeyrxq1VmCaPD
	g1t285yNzSaXGerSdVew14g3Qp+b490w0X3vNDgd6wGQjRd0ke+3FoK6ZQDEEHPjKUaqTYKpTQH
	MiAV1coV//+G
X-Received: by 2002:a05:690e:1644:b0:667:af05:2e8d with SMTP id
 956f58d0204a3-6683bde30b0mr341998d50.79.1784277176987; Fri, 17 Jul 2026
 01:32:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715085348.3457359-1-wenst@chromium.org> <20260715085348.3457359-11-wenst@chromium.org>
 <aleKQKH2V-ck-SX6@ashevche-desk.local> <CAGXv+5Ed9Cn-NeHiXJ58er7NJs1P2ZUMrjqYac-gSky-TNV8Lw@mail.gmail.com>
 <alkWE-bQ9gGIXIJj@ashevche-desk.local>
In-Reply-To: <alkWE-bQ9gGIXIJj@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Jul 2026 16:32:46 +0800
X-Gm-Features: AUfX_mzoGIeMcv7EV_g3RqR3VRvLvguofP9ZSODwjiLGO0JAlL2g0unPo14vZls
Message-ID: <CAGXv+5FJkmOJgpwRBp4nAea6_moF=gH6wGmNpP+g8URNd--jbQ@mail.gmail.com>
Subject: Re: [PATCH v5 10/16] usb: hub: Power on connected M.2 E-key
 connectors with power sequencing API
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wei Deng <wei.deng@oss.qualcomm.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 1:34=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Jul 16, 2026 at 06:02:38PM +0800, Chen-Yu Tsai wrote:
> > On Wed, Jul 15, 2026 at 9:25=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Wed, Jul 15, 2026 at 04:53:40PM +0800, Chen-Yu Tsai wrote:
>
> ...
>
>
> > > >       fwnode_handle_put(dev_fwnode(dev));
> > > > +     /* usb_hub_create_port_device() could leave an error value */
> > > > +     if (!IS_ERR(port_dev->pwrseq))
> > > > +             pwrseq_put(port_dev->pwrseq);
> > >
> > > Hmm... I would rather make pwrseq_put() NULL and error pointer-aware,=
 so
> > > it will be no-op in such cases. But I think Bart has his own opinion =
about
> > > this.
> > >
> > > >       kfree(port_dev->req);
> > > >       kfree(port_dev);
> > > >  }
> > >
> > > >               put_device(&port_dev->dev);
> > > > +             hub->ports[port1 - 1] =3D NULL;
> > > >               return retval;
> > > >       }
>
> ...
>
> > > > int usb_hub_create_port_device(struct usb_hub *hub, int port1)
> > >
> > > > +     port_dev->pwrseq =3D usb_hub_port_pwrseq_get(port_dev);
> > > > +     if (IS_ERR(port_dev->pwrseq)) {
> > > > +             retval =3D dev_err_probe(&port_dev->dev, PTR_ERR(port=
_dev->pwrseq),
> > > > +                                    "failed to get power sequencin=
g descriptor\n");
> > > > +             goto err_put_kn;
> > >
> > > OTOH, how pwrseq can be non-NULL and at the same time port be created=
?
> >
> > I assume by non-NULL you mean returning an error?
> >
> > device_register(&port_dev->dev) is called some lines above this.
> >
> > usb_port is weird in that usb_hub_create_port_device() does a bunch
> > of stuff that is normally done in a driver's probe function. However
> > usb_port's driver is just a stub driver add for userspace compatibility
> > reasons. See commit d99f6b4130877 ("usb: rename usb_port device objects=
").
> >
> > So at this point the usb_port device has been added to the driver model=
.
> > Or we can just zero out port_dev->pwrseq instead? I guess that is clean=
er
> > than having some weird check in the release function.
>
> So, why do we need to assign the error pointer to the field directly then=
?
> Make a local variable and assign it if and only if there is no error poin=
ter
> in it. Would it work?

That's the next thing to do on my list. :)


ChenYu
