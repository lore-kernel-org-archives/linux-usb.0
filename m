Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795195668;
	b=4K6mH0aHlJMYdVg1dCyMQZJCLWu4bftlU5ly+SFpMq+r1I/czubIHMFvwfBtYEdiXAxh
	 EHTMsfzIc5UBJXjVxMprSawvL40HlRe7pVNhFHWDWOjk8B4b/4vhpxKhDCGgGlk2PO+vx
	 vf0WAa2wOaDvP+buGe4m3OJGdgU5xToSi4U/8pY6Lz+bAELnsCy+SjMVlqNiRBb1D6iy6
	 GdC21SdWZI1rJ/OBsbTqAuyEHZOFymnjd431n52S3hHQRiMWzrsPYzRJrER9oEwCCCupM
	 fagrdP1HyxtaES+0XRfkNAo5grC2L203Ry6QoLUWgWrJj76wlUOL7DS9WwSEMrz4wCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=piUlh1pDCE0su43+DcLPJxvz8UQFYkDV7njOU8o8Pjw=;
	b=39xEsChrqeenMtM/dOlB9sOyezQzCBB9M4IsqP2F15z9EEN3Kdt1hwJs6Qj86YPeWCWG
	 TgnKzZu1f30PMD4N7o/Kzf1AaltPd50Em24gN4wo6zpAyce+bkaVF8uW+AWiX4AcKnkMh
	 JiY0xh+3wFxdB/O67cCvhuHVVHPpKnfzbhzjBNT98fycYIH46+RYR5Gv/LaMVRF58u3e4
	 li5g/OPAu10yUua/W7nur/vCDHXvEfxIjFmI1NEzLvWmuwfWRncNu+GzkY+L8hRdLawiQ
	 FCifsiuVi6eTQ1YoPS1YmAkvlHQJNNf+j8CKxAOO3Z2N3ulZ6jENQb78JTNgictek5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kLoto1o9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC737606A331
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 17:27:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC737606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kLoto1o9
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-533202fe429so371261cf.0
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 09:27:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795195667; cv=none;
        d=google.com; s=arc-20260327;
        b=GmCl+t+qDxlm3SfUqfLUTw/1dWx4yl1SVGNpkImHQNpZvGglCDILLx2Okg4IsP6H0b
         bgb35S2lVzU9WTmdYD3VrYWh2q/y6gE6zFeDnf6wI5ad06o40WiRW2IZPKaOt7mXj9lA
         JEIrIXvFrdxIlYQ4kQOM0hP8Gsot4y7eO67MdXVpS2u2luYaQqRaKWTcW8Deawai3ot/
         Zmyybi96+axs6E43/ovHFYHYU6ykM7HiVmm+2E7UZr60Dh44FrlBF9GEVfWudmkudPtz
         2VkaI098TMyaGukQYGvn1cfrcpMTg/+l/S56/unvyUObgj9JXulUZBryekGIC8ZzMRQ3
         NkVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=piUlh1pDCE0su43+DcLPJxvz8UQFYkDV7njOU8o8Pjw=;
        fh=sRMxd4gcm2VUKUBumTiGPHiuuvTOQjC30W3U8X0ZDRg=;
        b=Q3rDFKSnENtwNKp7ufZ9+soRXIpYJxzKLuyWvi8LUYm9gIJNG+phWWcFmKVulPjBIl
         DP/ZZY9FKNinNlXz691w7LCPQEDLkL4nCXJl/WcShW5Lo7hTRYdw+uxqO/Ik3GTB6u5e
         B7fcgnuT9R2uedwlEW+z0tfhSKejQmEugAiVm/u+uLQhks07aNRgU/FdMcoeg2PYfl0X
         47IVULHIv8TU1GhpgTqnbPcahLXSfm9ScRWLH3hf8Q4VYiu/ex9zvDxkJywJirJYnQx/
         p33h21ote/nkRVF0UsuSY1Vm3ceQWdmiGBheYcijRCihA0xkhw70w+2K2xPd3NgmGky1
         gbrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795195667; x=1795800467; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=piUlh1pDCE0su43+DcLPJxvz8UQFYkDV7njOU8o8Pjw=;
        b=kLoto1o9tl/Dfq8V20TV+jBndKsu7ov5RESZIJPXu969lI6z1IAHVuXMDD38j3KQs8
         mRKs+zfp7xCPZs6CtbTnwZp+setGfSQE77c5hMDjV/T4Eb0UwgvltdXX0JXmqlQYaGp9
         wNlQhy4RM1KhGYlk5pjGuI0G9V9eT4+6piVhaEC9cBtTUWYOahnT4rbomvtGebQz2bcC
         Q918ezU3P7b+/ccMC9I5jcrkct4cd0nQZQCtZ4s+jFmIySe3/vLXTwU3ToJmNoMueJrK
         BDvLQhl0I9UySBlGIKfGWWfAjb1dXs04UXmKgKiB4w/Fn1QR9/SpY/pfzaGedH35bVxY
         0rCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795195667; x=1795800467;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=piUlh1pDCE0su43+DcLPJxvz8UQFYkDV7njOU8o8Pjw=;
        b=YSe0X67asy2cJqu8ZZ2gkLoORacWOqd1U+7vNydFYyJJR++reZtAIfGrnWAzf37xLl
         BcRfX5SqOTvmHTwBCOBPBN4qK/Urea4XFlECjm+Jl6SgMCIHIl0TDqQLwgX4PqJNqDEF
         X7d9IYAGKn4Kwdg9mju2qxqDu3yZguqN50oO/IuNxBCKI+gM8/y5LiHWLB08Hm5TQV03
         MvzBBTDSH55FjiNy/TNIT9IuwjLdMOoCUgKjf5xKvHYx8SioDjKA1zFLY0wDCijcuyhz
         ElwXFwluje6hAvphjxhy0A0E6En8LKDYAPmEP+NPg7TcWNQ/RqtDcgFzHrxINJ/VipGG
         SvVw==
X-Forwarded-Encrypted: i=1; AL+hErGIxt5S7T7QruYaqRjxuGsa38+W9JHzDxomW5CURMo9PNo9ZwjR/lp8/EMxQOkmLnurim6nU9m3XNY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AMWVwjXI93gu7Xxsu7sUhAOf7Q0qE1G0l8p6lL5TUtmUgOQbR
	yDqHe2HYttK9QuWhlalT28NKKg6LIu0hLNO16hOsD96L6tlUtsQBPvTtD823Aur5vCXpyMKUeev
	zsB3N6qW65+EU4G/C+NlbJNp4mRMtEBZ4wkLHmCW6
X-Gm-Gg: AYBFou1lHUKiWbB7OFg5j7LWT4CVj/f5yU4W5Y65e3TGw9r+aZCK/E7mbvn8/+dVuGw
	vqAK6RXgM40MyH68cCWZyPrWiZHCB0buVl188YmRKA7dfRR+B6Ry4I78ue2yND4XeoVhK30NaIf
	xL4q4pzU4oqf2BXlJu7fFzCj0UI0SuLUufMp9IbhnKyfGbDwfWe86+1nWeXlSDty5x5/PKut0/+
	QcWiJjPFvte6d9aOAyKkRDSX9Qdv1nhz5nx3+ynHKwD/IRsMdKpOVzya+XiNCsdKuVCbnimOtem
	KocMgqELORDOhwPSGX13kI+Px8WGqSmr1cghlbYCEL6ILzaLcnOdeWRyFkDmEpTcsr17qpQEjlg
	N3tkLNnOWw9D7wgSm4yrBbTHp0ePvsK0fqrFx
X-Received: by 2002:a05:622a:c15:b0:534:d386:c3f1 with SMTP id
 d75a77b69052e-55d7a315ba4mr21064171cf.9.1795195666028; Fri, 20 Nov 2026
 09:27:46 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119170650.1521609-1-irogers@google.com> <2026112003-dreamlike-tricolor-f055@gregkh>
In-Reply-To: <2026112003-dreamlike-tricolor-f055@gregkh>
From: Ian Rogers <irogers@google.com>
Date: Fri, 20 Nov 2026 09:27:34 -0800
X-Gm-Features: Aa3M54qV1ST3KDVbaaaVUVHrHiimI6d3jD3qxAM9oI-AuQL6wZNiVzw5o3Go7mg
Message-ID: <CAP-5=fWg=m_O4tbCFWZ_-_tvmxPcQqOxr3V2-Sz1T07CbAss5Q@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: hd3ss3220: Propagate regmap_read() errors
 from attached-state check
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 8:05=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Nov 19, 2026 at 09:06:49AM -0800, Ian Rogers wrote:
> > hd3ss3220_get_attached_state() has return type 'enum usb_role' (an
> > unsigned enum) yet returns negative regmap_read() error codes directly.
> > Neither hd3ss3220_set_role() nor output_poll_execute() checks for error=
s;
> > on a transient I2C failure (such as -EIO, cast to 0xfffffffb),
> > hd3ss3220_set_role() passes the bogus value to usb_role_switch_set_role=
()
> > and disables VBUS power. On role-switch providers without a .get callba=
ck
> > (where sw->role caches the value passed to usb_role_switch_set_role()),
> > reading /sys/class/usb_role/*/role subsequently indexes usb_roles[role]
> > out-of-bounds.
> >
> > Return an int status from hd3ss3220_get_attached_state(), pass the
> > resolved enum usb_role via an output pointer, and leave the current rol=
e
> > and VBUS state unchanged on I2C read errors.
> >
> > Found via an x86_64 LLVM=3D1 (Clang 21.1.8) allyesconfig audit with
> > -Wimplicit-int-enum-cast enabled; fix and changelog drafted with an AI
> > coding assistant. Build-tested under LLVM=3D1 W=3D1 (-Werror) and
> > -Wimplicit-int-enum-cast; not tested on TI HD3SS3220 hardware.
> >
> > Fixes: 1c48c759ef4b ("usb: typec: driver for TI HD3SS3220 USB Type-C DR=
P port controller")
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  drivers/usb/typec/hd3ss3220.c | 22 +++++++++++++---------
> >  1 file changed, 13 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss322=
0.c
> > index 60d6de9ba339..212c3624961c 100644
> > --- a/drivers/usb/typec/hd3ss3220.c
> > +++ b/drivers/usb/typec/hd3ss3220.c
> > @@ -163,10 +163,10 @@ static int hd3ss3220_set_source_pref(struct hd3ss=
3220 *hd3ss3220, int prefer_rol
> >                                 src_pref);
> >  }
> >
> > -static enum usb_role hd3ss3220_get_attached_state(struct hd3ss3220 *hd=
3ss3220)
> > +static int hd3ss3220_get_attached_state(struct hd3ss3220 *hd3ss3220,
> > +                                     enum usb_role *attached_state)
> >  {
> >       unsigned int reg_val;
> > -     enum usb_role attached_state;
> >       int ret;
> >
> >       ret =3D regmap_read(hd3ss3220->regmap, HD3SS3220_REG_CN_STAT_CTRL=
,
> > @@ -176,17 +176,17 @@ static enum usb_role hd3ss3220_get_attached_state=
(struct hd3ss3220 *hd3ss3220)
> >
> >       switch (reg_val & HD3SS3220_REG_CN_STAT_CTRL_ATTACHED_STATE_MASK)=
 {
> >       case HD3SS3220_REG_CN_STAT_CTRL_AS_DFP:
> > -             attached_state =3D USB_ROLE_HOST;
> > +             *attached_state =3D USB_ROLE_HOST;
> >               break;
> >       case HD3SS3220_REG_CN_STAT_CTRL_AS_UFP:
> > -             attached_state =3D USB_ROLE_DEVICE;
> > +             *attached_state =3D USB_ROLE_DEVICE;
> >               break;
> >       default:
> > -             attached_state =3D USB_ROLE_NONE;
> > +             *attached_state =3D USB_ROLE_NONE;
> >               break;
> >       }
> >
> > -     return attached_state;
> > +     return 0;
> >  }
> >
> >  static int hd3ss3220_try_role(struct typec_port *port, int role)
> > @@ -231,7 +231,10 @@ static void hd3ss3220_regulator_control(struct hd3=
ss3220 *hd3ss3220, bool on)
> >
> >  static void hd3ss3220_set_role(struct hd3ss3220 *hd3ss3220)
> >  {
> > -     enum usb_role role_state =3D hd3ss3220_get_attached_state(hd3ss32=
20);
> > +     enum usb_role role_state;
> > +
> > +     if (hd3ss3220_get_attached_state(hd3ss3220, &role_state) < 0)
> > +             return;
>
> No error propagation backward?

 Good point - hd3ss3220_probe() can fail probe and hd3ss3220_irq() can
return IRQ_NONE without clearing INT_STATUS if hd3ss3220_set_role()
returns an int error (the third caller, output_poll_execute(), is a
void delayed_work callback). I'll propagate the error out of
hd3ss3220_set_role() in v2.

> >
> >       usb_role_switch_set_role(hd3ss3220->role_sw, role_state);
> >
> > @@ -258,9 +261,10 @@ static void output_poll_execute(struct work_struct=
 *work)
> >       struct hd3ss3220 *hd3ss3220 =3D container_of(delayed_work,
> >                                                  struct hd3ss3220,
> >                                                  output_poll_work);
> > -     enum usb_role role_state =3D hd3ss3220_get_attached_state(hd3ss32=
20);
> > +     enum usb_role role_state;
> >
> > -     if (hd3ss3220->role_state !=3D role_state)
> > +     if (hd3ss3220_get_attached_state(hd3ss3220, &role_state) =3D=3D 0=
 &&
>
> Why test for 0?

I'll change this to '!hd3ss3220_get_attached_state(...)' in v2 (and
add Cc: stable@vger.kernel.org per Heikki's note).

Thanks,
Ian

> thanks,
>
> greg k-h
