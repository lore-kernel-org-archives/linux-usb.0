Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABEC3D566E
	for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 12:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782217741; cv=pass; b=V4OxjyM1iipviDNv6TNK6yGcOfbeKyYcF2ZMXSwd4sNG9yrlvRuPsQ4auaLnXX3v15m9p+cmOehWEjIye/tpWMnvSqfhsUxbobBgQu6ZSc9Pnt8r7MxUMpn4L9cw9VKTA1biM5FPqULUJDAHUF4E3ZWl5wgTQaHed6ofJQ3qsN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782217741; c=relaxed/simple;
	bh=G9AWuLecJ2Nphi36x46hkpiC78tZMZFCzMzTzje8PLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kvTaCgc22Z56xy2WmCQY/CEieOp83MLVGYuG8E03NFeZUrRczoUwUhiCI4rJ7AN594AxqVq4Uwx75pcQlhrGFFr7Vwu3UwdUJc3G3qsel/9UNi7mYEWT2Mry/sLbYK7kt2C+LQ3UGM7MpwrR59nnBMmKdbPKrqHuRDHKcpzWLo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HfeMTZxD; arc=pass smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HfeMTZxD"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8e3d22c38a8so10371266d6.0
        for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 05:28:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782217738; cv=none;
        d=google.com; s=arc-20240605;
        b=Amvzjh/IRzMJLKd6hEOMDSisqHEZJWJ7TJ0/m9W+uxTbFlTsE5LUX5KCkIB7jizaX/
         gLR/5tlgf/qA0enPU/K1mCFU0q4zVZysLo/urt2R4JOu3OBaQlsMg7X7Dd+Edh6mSlDc
         Hulmw8ghOdpnJKh3TL7Untei9VvbN8jFddfEl96YDuIsVf29v7LvTW9Sc88IYCqHYacf
         JgzyrJ0nDYvAdhyFEUpkiUSz4bKQ1gE28M61oz2n8nQiJ+uiL/KE9ebINkX9jXIlRNJW
         AGK/KYy+rYfpXg4JeY+GhBlzhwPJFOOGfEXi2ub96lpsInDsjreHcEEpi9vopvSaFqoB
         o73w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=klFGfGOiyNoeDlXHZktG/T95z0v1j0p3/dcQkBxoN30=;
        fh=e+3qjnZaLG9ajobrTKfnmMaSmCk1oCpT1XaLHdA88L0=;
        b=d5pI5t3IHJqiFd57iuhpIKSx5UIEHsW6v9ObY2awuJHvEm8rsvtUt9nRs+eniqKbLI
         j/C7VfGslkNnkFWYtTH5Wz0KxtUIIjC6xXtB9rdK2KsB+yNvfwGiiCQGFLOXtRZCKIwH
         KplTnoKVRLFOOZWw9gFCzs/TX79WdMeG3muEdE5Q4qx49twH5312Ai5pV1VvVAxWGyDk
         72tFrAyHj0e5Xs3Fcapq6taTvz/fKJH6bQmMj6+bg42OKJIunXSy17500bQzVJ2SYjhP
         OCbbaaBTqUvzd48WbEk21ZeLa1bnoAJMRp/MDnRQIrSiswG+92SxznNZrDu9tWRgjO5U
         dpQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782217738; x=1782822538; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=klFGfGOiyNoeDlXHZktG/T95z0v1j0p3/dcQkBxoN30=;
        b=HfeMTZxDHarVA8ZU/dHDo7z3r0bmSN2W8W/XozOy9LS3yiw/Bbqu5wyJILYHwjTYnE
         KeP9jiJZg6f9xkB1Y0Fza33QmTnsD9PgRHgCvyY0EU8kPfROB+nNSf92Qp50WOWrZRSz
         flxa97wcZjw9Yr5ncwKfeEjXmREeH/E0csRvLSO2uLGmPQ0O2bKME/DwuQReXj1+o4IB
         nHKa078JQx5xibnTHi7aqroU3KXyTE7RFySopKFS5E/aOWYZIC+2EIGm0yeDJROJlqX6
         AamPM4wO75nftXWGnZHDcmLNqFzbxTApx3n1Wo7haews2lh4lKwsr29yoUX7XULgnb1h
         sFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782217738; x=1782822538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=klFGfGOiyNoeDlXHZktG/T95z0v1j0p3/dcQkBxoN30=;
        b=QE+Yq7j2OTcl8IVNU0vyxTvfGp2u841geiTdmz7C6ru6Ria6jtccgHa2D1SkUr1Tuc
         1ALjE1ijRt6w0XRANfRGIl7EXhWGDG+6fPApNBq1/tPgeMYi/rsMujqsBVaD2vDl7Zq4
         qid0Wn7HlKfBVSA+LMSi/2He/ofsPuL1pXbP8LG99dx6QU+gN9Jy4d9jbJebrHVluMGn
         mU5lQAzy1Nufa1IjEfVekg1YycUAaLSjwnrs7y163tCLzuoYCB5jdKOKyHvpbypJZuvh
         ZOkkqzjmzOCXLRnW+iu6yLujIu6/cUpLbiyHJcnDb33qtroRG1QzHGn5GF/8Whzwqt0G
         KAyA==
X-Forwarded-Encrypted: i=1; AHgh+RpFB/xC+7znaDghtj3FrGMjknHyCE2CROTiCEACJYboC81Ye7cQkD+zkpcOVWg3VMUv0Dor7GqCbZM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfvgnazSVez32V4GPSkM9LAr5jz8klaA9E00xbTtEYaAwJPZjW
	oT/eqb2AiKTgb5j6zZsi3JOvxCSRzsLqq0VJAB+axPY/Nwnd8p0TobWMV8X38WKmVDU9Mp0aT3v
	zjeBKQZ1POoIW/hZKEiNgHFYFQl0oGm4=
X-Gm-Gg: AfdE7clHgV9Y5d601ha1S6PnAA0E7kJzaQoeNqrinbDGVuMZp/f+Ci0X1garF+vRySe
	sGLACpn9PJf1u+nBGI/4f8hnFuwjdlHOQWcszZzngOXlbPAEnTjksmEdfCZCSUoiSn1UxUhAWkw
	kOsVm/FYkIB1XtC6KQEw5t+Y9lKaj1iL9OTBeG4JlwqfV/R9RbBlc9xB7GHr83C4pd6BlBB8Ynm
	iaqXr0AMPyFfCXnMKJAhN4UJDe4n87JKx4Eh9OuT0z0soLNrFiW+ojj+BrQewlOB4aAWVKSnw==
X-Received: by 2002:a05:6214:e6e:b0:8ce:b018:89f4 with SMTP id
 6a1803df08f44-8e403ae8ee3mr44998996d6.37.1782217737678; Tue, 23 Jun 2026
 05:28:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260619150340.65058-1-samsun1006219@gmail.com> <ajlZby4OXzCKECmJ@hovoldconsulting.com>
In-Reply-To: <ajlZby4OXzCKECmJ@hovoldconsulting.com>
From: Sam Sun <samsun1006219@gmail.com>
Date: Tue, 23 Jun 2026 20:28:46 +0800
X-Gm-Features: AVVi8Cf4VCtL9rBjPZc2_8xbjG1nFBoCBaRhdfEqyymBrSrB5TD-SsWKRoJR1m0
Message-ID: <CAEkJfYPgM19T+JWEfNdSwn7P8Pff+MECWwrfK1ujMHPFO5DrWA@mail.gmail.com>
Subject: Re: [PATCH] USB: misc: iowarrior: fix use-after-free in release
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Oliver Neukum <oneukum@suse.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2026 at 11:49=E2=80=AFPM Johan Hovold <johan@kernel.org> wr=
ote:
>
> On Fri, Jun 19, 2026 at 11:03:37PM +0800, Yue Sun wrote:
> > From: Sam Sun <samsun1006219@gmail.com>
> >
> > iowarrior_release() clears dev->opened while holding dev->mutex and the=
n
> > unlocks the mutex before freeing the device when it has already been
> > disconnected. If iowarrior_disconnect() is waiting for the same mutex, =
it
> > can acquire it while mutex_unlock() in release is still in progress,
> > observe dev->opened =3D=3D 0, and free the same object.
>
> The above description is not correct as it seems to suggests that there
> is a double-free here, which there is not.
>
> Either release() or disconnect() will free the driver data, but the
> other one may still be executing mutex_unlock() when that happens.
>
> > This violates the
> > mutex_unlock() lifetime rule because the mutex storage can be freed bef=
ore
> > mutex_unlock() has returned.
>
> Indeed. Thanks for catching this.
>
> > Fix this by adding a kref to struct iowarrior and holding one reference
> > for the USB interface, one for each opened file, and one for each
> > in-flight asynchronous write URB. Release, disconnect and write complet=
ion
> > now only drop their references after they are done using the object, an=
d
> > the object is freed only after all users have released it.
>
> You only need a reference for each open file (and one while the driver
> is bound). All I/O must cease on disconnect so there is no need to keep
> an additional reference for each outstanding write.
>
> Note that there is another bug here for which the fix has not yet been
> applied though:
>
>         https://lore.kernel.org/all/20260523170523.1074563-1-johan@kernel=
.org/
>
> > Reported-by: Sam Sun <samsun1006219@gmail.com>
>
> You shouldn't add a reported-by tag for issues you fix yourself. A Link
> to the syzbot report is good to have though.
>
> > Closes: https://lore.kernel.org/r/20260618080204.38322-1-samsun1006219@=
gmail.com
>
> I only saw your report last week and missed that you had posted this fix
> until today when I was about to submit a series fixing this driver and a
> few others that got this wrong:
>
>         https://lore.kernel.org/all/20260622152612.116422-1-johan@kernel.=
org/
>
> With the commit message fixed and the write references dropped they are
> mostly equivalent.
>

Thanks for taking a look and for the detailed explanation!

I agree that the per-write URB references are unnecessary once the
outstanding write URBs are killed unconditionally on disconnect. Your
series is a better and smaller fix.

I'll drop my version in favour of your series.

Best regards,
Yue

> > Signed-off-by: Sam Sun <samsun1006219@gmail.com>
> > ---
>
> > @@ -95,6 +97,10 @@ struct iowarrior {
> >       struct usb_anchor submitted;
> >  };
> >
> > +#define to_iowarrior_dev(d) container_of(d, struct iowarrior, kref)
>
> I know we have a few of these in the tree already, but it's not really
> needed for a single user and the "d" is a bit misleading as these macros
> are typically used to cast from a struct device (not a kref).
>
> > +
> > +static void iowarrior_delete(struct kref *kref);
> > +
> >  /*--------------*/
> >  /*    globals   */
> >  /*--------------*/
> > @@ -235,13 +241,16 @@ static void iowarrior_write_callback(struct urb *=
urb)
> >       /* tell a waiting writer the interrupt-out-pipe is available agai=
n */
> >       atomic_dec(&dev->write_busy);
> >       wake_up_interruptible(&dev->write_wait);
> > +     kref_put(&dev->kref, iowarrior_delete);
> >  }
>
> > @@ -454,12 +463,14 @@ static ssize_t iowarrior_write(struct file *file,
> >                       goto error;
> >               }
> >               usb_anchor_urb(int_out_urb, &dev->submitted);
> > +             kref_get(&dev->kref);
> >               retval =3D usb_submit_urb(int_out_urb, GFP_KERNEL);
> >               if (retval) {
> >                       dev_dbg(&dev->interface->dev,
> >                               "submit error %d for urb nr.%d\n",
> >                               retval, atomic_read(&dev->write_busy));
> >                       usb_unanchor_urb(int_out_urb);
> > +                     kref_put(&dev->kref, iowarrior_delete);
> >                       goto error;
> >               }
> >               /* submit was ok */
>
> All outstanding writes should be stopped on disconnect (and soon will be
> when the fix I mentioned above is merged), so this is not needed.
>
> > @@ -637,6 +648,7 @@ static int iowarrior_open(struct inode *inode, stru=
ct file *file)
> >       }
> >       /* increment our usage count for the driver */
> >       ++dev->opened;
> > +     kref_get(&dev->kref);
> >       /* save our object in the file's private structure */
> >       file->private_data =3D dev;
> >       retval =3D 0;
> > @@ -657,13 +669,13 @@ static int iowarrior_release(struct inode *inode,=
 struct file *file)
> >       dev =3D file->private_data;
> >       if (!dev)
> >               return -ENODEV;
> > +     file->private_data =3D NULL;
>
> This looks like an unrelated change.
>
> >       /* lock our device */
> >       mutex_lock(&dev->mutex);
> >
> >       if (dev->opened <=3D 0) {
> >               retval =3D -ENODEV;       /* close called more than once =
*/
> > -             mutex_unlock(&dev->mutex);
> >       } else {
> >               dev->opened =3D 0;        /* we're closing now */
> >               retval =3D 0;
>
> > @@ -918,8 +929,8 @@ static void iowarrior_disconnect(struct usb_interfa=
ce *interface)
> >       } else {
> >               /* no process is using the device, cleanup now */
> >               mutex_unlock(&dev->mutex);
> > -             iowarrior_delete(dev);
> >       }
>
> The unlock should now be moved after the conditional.
>
> > +     kref_put(&dev->kref, iowarrior_delete);
> >  }
> >
> >  /* usb specific object needed to register this driver with the usb sub=
system */
>
> Johan
