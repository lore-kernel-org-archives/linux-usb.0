Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414D83515D3
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 14:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785939186; cv=pass; b=lIrE/jj6hE+dZQ63rDDuL6tDnFqqyTnNB7EqhBVhHdceuZZKsilz8iMffeQwVswxphtGnepPmZ4VOANLJamTqTQedn8W4LAZuZm/YKeNjG99wR5yUCjp48vO1j8kOl46gDtlipP1NQmVTDKb0fgMexuusxeV5kVAv1NbhlPDgBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785939186; c=relaxed/simple;
	bh=0FgDUkeBaNSKWepg6S43lsmASYq6OUFxdv+y5bAuXAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UOpcLbEzOzussQF/WYpf5jNePlvio9EJaOYjt+LkPTcoqElsKnQ7Vzh45AJdOKRJQFUMVt3gZeGZlun7jkoJmnfiNSMceMA7aBZhMIiRKMhGu3BMQEZca3JllzirtTbqWhuzGjAmwMLwcWKrHThj5XRkWO5JWyFyetM7spc9xhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ByRkCpLB; arc=pass smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ByRkCpLB"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-45133d2974fso617814fac.1
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2026 07:13:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785939183; cv=none;
        d=google.com; s=arc-20260327;
        b=cZpUiIr7QH9wwNPgnjG+OaKlc/jQK/+3VjtVwphHKE00GuduGxjez+MvWN4pdyDRFe
         VcgFoV4Dv4+aSAaxcWQEGYpc0PSaF1iZlesPhseV8UYST7ws9vlK/CpVc4X7RhLQM5A4
         LYJlf3DNTSt46Vb07Qih7oP4MO8IuZw9vybdwP5Eivk9qrEBWK/1pb1Ss5LDjAsyTgYi
         dKQNLXrg+mFakQo0VXs0nIavgeyZWISNyMt5/gvAhOZZQfoVL834gNFH7RKJEHpiRQ8p
         h0jwOeLSiPwMLUVfMkkG9uDlFkKa+wn1AxmEyVTa4kGrnOh4801swGqIQ4A6VlNnnuBk
         DQ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RDod6rQyfTZzbG+avpqwefoM9i9P9+Ds1SjXYDiqpd0=;
        fh=zijSyQFwMXaCXEoNJ1Q0j247kOua35yYlj8pWDbpzuU=;
        b=GrbvlT++lfB5r8ol85jzdpl2JG7OHUbWBYXgtzBY0w6lpaH0hMMZMOBpyv5zIEFcnw
         pZxRC981NuymHXvOgVYvgyPiY+pETNxCjbMQ3SEa770qvu2ICKWYzbDomnhXzUxJkN4m
         5QUDzzbSlCJsvPEfqxYeEqowrrFobivkK7WbZR43u2L2PhJ5WIiKI1pvXYHMxHNVms3C
         mW+Eng2NWNdfZ3WuV9ci2u9ifszDn0QRqhOMy6P6PlwY+xp8n/AKDAWkx76AEV1LSioZ
         eROUq4eiZE+A82sjNb2EKcXvNiTzXmymINX4KM8lYBQkeP1GzogKCsUirnulk3hKwziC
         f+OQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785939183; x=1786543983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RDod6rQyfTZzbG+avpqwefoM9i9P9+Ds1SjXYDiqpd0=;
        b=ByRkCpLBLSf9BHyLluWi9ibt3HiVNtZ4QJDvl0lPJr6AV8N/e4Zr5/1aq6M4jRipmE
         sGyAN6M9vNQ+HPVzWg+6QHpC71ZM4nCpDKIM1iWWoI8trmHALBDMNRxViDVry+cTWI0m
         OtCovHZeox1onK5kl0vkWp70dHT5vHHxYs1XYLr4OxthM1681qLMNAbIdxkcZxLDHtw9
         0yre2PBJjjA18MrXIZ5ATwHpCX50g031QFJX5iBJu6dMvFjeJp7YlsTlYkEN0t/3mhgS
         HZ2gqhsiK9HiOmOBJlEtguGrpFaUOCHxGunPDGIoqT8G4QMD/XUwQF6fVfrpThj+X6CM
         ksww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785939183; x=1786543983;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RDod6rQyfTZzbG+avpqwefoM9i9P9+Ds1SjXYDiqpd0=;
        b=aXsNr982I9ipsGTLB4PzYZ3t3pvfRcl9KJXfHENJ9yX7rCwLIh3p0tf9yc3w8BzbdW
         9ojfy+LesOQI0o442a4/sdrIXYXYkEkHmvW1D0xmmqV1MCG59SLkV01Ci0Imjje8f6j5
         6EDMcf4GQ2N5j0OUSY8eZxFf3YrRXqKhHwGRZ4vW3IKTTqDZWeeM4/D6IDd2cp1/oeNk
         bBzOPQDlYolPj47527f/yzmFlej4Tr9d2zWSXgkfsggZGpk98K07iUnwpO8a/EbB3TXZ
         GQUxkBoPFAoHcMpaCPASEK//VFb07oqCOzjdoJbspfZHbRy4GsYT4k1/sguj6lg7Gteo
         2xIg==
X-Forwarded-Encrypted: i=1; AHgh+Rqx3n1onMO94LqZTcQwKJ70bgkxIscTWj0UtkuvWptplhmfxAk2tWxDExWw+yhymebI/1eEYOUFBQI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq5Rh1OrvfnUUgVCC16N0q+vTxce8WV0jS6a+Y2tOO+aIjJfzc
	eAahjMPmkfNRZPltLNUAcEToC/ILNA4StYGm+ciBQ2/kf8ffrZBRg6pSEYqlpyp3UiMR4yKPFM8
	GCEmoIZPh2/61AjlN29xwgRn1F3e/+EnZy12uNy8r
X-Gm-Gg: AR+sD10IlzsMpPfPDG2hT20y+6g4nbtVDkxAqo7g2tJAaHVSlqhlXVVeuNycLpttZ1A
	ku4H04MzbmXQ9h+7gt9cwXoYLt/d8FhFwYvc5uFJuCV9A2dF4AvSUDc+ZItqGjg+pwEai6AjAVJ
	tUVdPAyDimP5MI1JCP3fyxTwPlR6aMd78nDnYcR4KF86Bjm7sWDdpnpxgRacwet+A+hxAA3/aLQ
	SKWs6C6ZNhPY9d0nDvk6RtGrAC4/4tmZZ1e09ZybfYc8E2klRFGMsZM5panViAbalXa8R83xTlR
	JEFN+QQ0d7H436hy4bjBOVwMuBJBUgFpLBBgsm1XLS2ZEs6lIRS2qCoiJToTHhNjrWW2WXnF94H
	ugInvXAicMk1QW9/WAzaW7nB1h79QCO9LEDpyFBzIU6K2w/nJKM2AlfJK3X5fA5Rm3XYogCy4hi
	11s7mpwSgPkwoR
X-Received: by 2002:a05:6870:21ca:b0:459:fe2:ef54 with SMTP id
 586e51a60fabf-4599ea801eamr3729977fac.1.1785939182288; Wed, 05 Aug 2026
 07:13:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2650cf0f-26f9-48b5-b198-e4cb67c59cf0@mail.kernel.org>
 <2026080336-covenant-limpness-55cc@gregkh> <2026080322-obsessed-daringly-e6df@gregkh>
In-Reply-To: <2026080322-obsessed-daringly-e6df@gregkh>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Wed, 5 Aug 2026 16:12:51 +0200
X-Gm-Features: AUfX_myhx1UT7YuZLv76ps63pUQOVA0rWCMh7UFrFfX-goB0uNf0WfxNsQaXwwM
Message-ID: <CANp29Y7i54S8jXyd50uBU0TYgm5GmcKNxAsP6_XDuq8zSvG3cg@mail.gmail.com>
Subject: Re: [PATCH] usb: usbtest: fix NULL pointer dereference in usbtest_probe
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: syzbot <syzbot@kernel.org>, syzkaller-bugs@googlegroups.com, 
	linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, kees@kernel.org, 
	linux-kernel@vger.kernel.org, syzbot@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Thanks for the review!


On Mon, Aug 3, 2026 at 5:15=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Aug 03, 2026 at 05:13:00PM +0200, Greg Kroah-Hartman wrote:
> > On Wed, Jul 29, 2026 at 09:19:54AM +0000, syzbot wrote:
> > > From: Aleksandr Nogikh <nogikh@google.com>
> > >
> > > The usbtest driver relies on the driver_info field of the usb_device_=
id
> > > structure to hold a pointer to a struct usbtest_info, which contains
> > > necessary configuration for the device. When a new device ID is dynam=
ically
> > > added via the sysfs new_id interface without specifying a reference d=
evice,
> > > the driver_info field defaults to 0. When the USB core binds the devi=
ce
> > > using this dynamic ID, usbtest_probe() unconditionally casts the 0 to=
 a
> > > pointer, resulting in a NULL pointer dereference when attempting to a=
ccess
> > > the autoconf bitfield (at offset 0xa) of the struct usbtest_info.
> > >
> > > This leads to the following crash:
> > >
> > > Oops: general protection fault, probably for non-canonical address
> > > 0xdffffc0000000001: 0000 [#1] SMP KASAN NOPTI
> > > KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f=
]
> > > RIP: 0010:usbtest_probe+0x522/0xcc0 drivers/usb/misc/usbtest.c:2822
> > > Call Trace:
> > >  <TASK>
> > >  usb_probe_interface+0x653/0xc60 drivers/usb/core/driver.c:396
> > >  call_driver_probe drivers/base/dd.c:-1 [inline]
> > >  really_probe+0x254/0xae0 drivers/base/dd.c:706
> > >  __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
> > >  driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
> > >  __device_attach_driver+0x270/0x410 drivers/base/dd.c:1026
> > >  bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:500
> > >  __device_attach+0x2c4/0x450 drivers/base/dd.c:1098
> > >  device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1153
> > >  bus_probe_device+0x12a/0x220 drivers/base/bus.c:620
> > >  device_add+0x7d7/0xb80 drivers/base/core.c:3772
> > >  usb_set_configuration+0x1ad8/0x2180 drivers/usb/core/message.c:2268
> > >  usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
> > >  usb_probe_device+0x1c3/0x3b0 drivers/usb/core/driver.c:291
> > >
> > > To fix this, validate that id->driver_info is not NULL before proceed=
ing
> > > with the probe. If it is NULL, gracefully return -ENODEV. The check i=
s
> > > placed before any memory allocation to avoid unnecessary work and sim=
plify
> > > error handling.
> > >
> > > Fixes: 733260ff9c45 ("[PATCH] USB: add dynamic id functionality to US=
B core")
>
> Not really, but I can see why the LLM thinks this.  It's "just how this
> driver works" instead, right?
>
> > > Assisted-by: Gemini:gemini-3.5-flash Gemini:gemini-3.1-pro-preview sy=
zbot
> > > Reported-by: syzbot+7e1e5911f9eac50bedc7@syzkaller.appspotmail.com
> > > Closes: https://syzkaller.appspot.com/bug?extid=3D7e1e5911f9eac50bedc=
7
> > > Link: https://syzkaller.appspot.com/ai_job?id=3D9e476ca5-99d1-47d2-b9=
d1-f3b501897179
> > > Signed-off-by: Aleksandr Nogikh <nogikh@google.com>
> > >
> > > ---
> > > diff --git a/drivers/usb/misc/usbtest.c b/drivers/usb/misc/usbtest.c
> > > index 98071b25a..6410b3e26 100644
> > > --- a/drivers/usb/misc/usbtest.c
> > > +++ b/drivers/usb/misc/usbtest.c
> > > @@ -2786,10 +2786,13 @@ usbtest_probe(struct usb_interface *intf, con=
st struct usb_device_id *id)
> > >     }
> > >  #endif
> > >
> > > +   info =3D (struct usbtest_info *) id->driver_info;
> >
> > Extra space there, right?  Didn't checkpatch catch that?

The checkpatch was happy with the diff:
total: 0 errors, 0 warnings, 14 lines checked

You mean the whitespace after `*)`?
I've just looked at the other code in `drivers/usb/misc/usbtest.c`,
and it's inconsistent: in some cases there's a whiltespace, in some
isn't.

> >
> > And this really isn't the proper solution, just don't allow dynamic
> > binding for this driver.  That should resolve it, right?

I'll double-check that and send a v2, thanks for the suggestion.

>
> If you don't want to do that, you need a BIG comment here as to what you
> are trying to prevent, as a NULL check just looks like any other normal
> check, while you are trying to prevent a specific use case from being
> possible, and it WILL have user-visable affect.
>
> thanks,
>
> greg k-h

--=20
Aleksandr
