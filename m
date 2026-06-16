Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4959547B42C
	for <linux-usb@vger.kernel.org>; Tue, 16 Jun 2026 17:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781631822; cv=pass; b=i5T0OOEHz3HIdMz8W8QqHx8qpX2dLsQe1SsBdkQNmyef5BwILvTl9cYIPEvEcn0hoHyBAmuF5x7OrijXrzfGC2+IkomwLHPIURK4CxpBeaPEhTlNpt2ttoLx8vJnWVvT37dfdZngHit9iaASVWrY8GkKDIV3SMlG28VfZ3xf3Jg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781631822; c=relaxed/simple;
	bh=vwbDjwm7A+RW5akweFv5F9AqjleNOlBoQgRfrF6rPR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UJkx5cvl18oksXz2bFhUFAbM5sro4/hY5k207iba0KlPgKuSZlcB7pZhjuX3wxHzV1HpSFcM7zwlQsRipm2mEYsMRqq6rA5iwSiy/82SXNN8/QhV3eMr7r3+qCZkCRnHnW509cUPjUjfPEb/VtneFvOgd5wCR7xuoMrL6pyi0gM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQixdRYe; arc=pass smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQixdRYe"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-91587626a3eso512314585a.2
        for <linux-usb@vger.kernel.org>; Tue, 16 Jun 2026 10:43:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781631818; cv=none;
        d=google.com; s=arc-20240605;
        b=efxbc2KNnMYDppgboFQd8Ji9U7f7gfuqNQPuDPuU2cS8Pvxe33wBMWwPUgUUM8Pxr3
         mlg0SnfbOacO8fJ9vTuY7lSq+8nDjjrNgHdo2+bMeHY4VR4ejLl/b/GnApnJg9ukubtZ
         rjXW/Buo55LPsiea2xdiuPo3FqJKvUaGUUupZ5Y8Ak/TTbJf/QUB0PZ2zluhZWNbscko
         NW96e1UCuD5WXFpbjFKDcPcuA6/aoMcH8CC/I78w+T78M5csW6lrn1lfXZrl3jlqHXQc
         JeMUZ1ek3F4lBA5aktDvJzUTGG5mX0RsxFu1GBeOg0FLO57SRZXQJUQJiV1iofm90rEj
         wasQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vwbDjwm7A+RW5akweFv5F9AqjleNOlBoQgRfrF6rPR0=;
        fh=W6swb5c7SZOnz8qBPeLc4aJkn4Hr2BP3rpQ9VmAFPYE=;
        b=NL0R6cFGU4f66FrfLv33N7c2HpcNAYXLC3lgnDJW5Fm8OCU6rZFjFDwbz8QwMU3BnN
         Lzdi33duYoWkvsvSuIyJPfxjYdteHresY+GzYm4wNNdXNzeIsoNkiSyNMgMu6NvrtZD+
         mlf7rKubIUVxAwYsR4q269uE8HP5aQLWkgimf8bjCXNRGu5XsKMSTJH+2AVslUpOpL4m
         9mrABRp6Y2XmuDqjsKG/eSHe/M4cqo0g8usxKm36mS2LSxJv+GBb9BNGu6pNVDkWI2xE
         E2XYxbChvcd2clu/L8rjKkltvd+2gfoBcg9Ve7dsDEpKBa1Qlz3tMR62f6b+4Y/fgj/g
         83Lg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781631818; x=1782236618; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwbDjwm7A+RW5akweFv5F9AqjleNOlBoQgRfrF6rPR0=;
        b=HQixdRYeMco0YM478bwom3xvwR3M0rTY64Xdzb8ddn24bpAG7SXynyLKzHF9yyLyup
         0aCJAPOrpEWkMsp3lGHf4bg8vdtAVP6EnD4AoNzUySCUpUNnRW4FViF611zzHr3HoA5w
         3e0yT6t0BG6Ml3u4O8ts7npLAV/ZVZSsclRZUk4l8MhpznN7Ip3iNxTHDCxrHRD9kRrt
         WaPZCTQcuHy97a6arUKt/34gymx+DQk1sM8b1QD+YFy92D94G1RQIoSupyUDUPJEpDuQ
         bZ97xOazH2pq4VJl/Trsx23FQjkjZtZA7y5JDrr2xbAEHzkM5s8N+zwRvGxvpYvgvdpk
         pKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781631818; x=1782236618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vwbDjwm7A+RW5akweFv5F9AqjleNOlBoQgRfrF6rPR0=;
        b=tNi4b0YRPLxke7AJpYxp0XzQtDQlXZPOGBEsTg1srmrbLA0E6oCxfvlHrqz5WCeUUR
         Yavm3+X48tk6X2SxHxGhgSF7RRTTugwKsy+oxYTop4po04jYHtId5p2MKK3mEw1DckHn
         juyNseFkdfXanX31fMDGUBLW9VZLgXtbYIkIKGnwofHQ0wCumMDeNPh6N6L0BPL23ovG
         yHaVIwTAWzxAvK7cHNe3yECQl5b6KmYpWhuFu+pObp//gYeCq0RUGo3T30auVXvidizi
         8j+FdqietMqxjZUl/yR5Fbgrkw5FEGxty5WoSkKShuj/uBckydNJ9tj+vwIl2hqCwpoV
         A3/g==
X-Forwarded-Encrypted: i=1; AFNElJ9ma71jZO/PMR4jzpUE/o+BEhZeuZlS1i5XOsEexqg0jB9iQH0x3lDAUJP6T8ZNdjllbCdLs/h4MJA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwopK36OmmnzV6AWn5h5osHyvVEuUhPqcCGjJCfFvAD5VfWAvnh
	qh4JbVVoKx+2RVkMHGfIHqBpxK4KmUWtLyN3kBglFGBKTV/t5EIItjyfkLkl8FngoEY7XfvY1bx
	Et2hfYRBaenyPm/vg1LCa8d3Gfyrcn9fnHSpC
X-Gm-Gg: Acq92OF9UtOovtcPlkEufSSmC8WAPSh+iGud9Tf2y5rbXKuYTVDS04lq+XfnFkNNN2N
	y51EQ9W/HCoNJPvEJWq6PqNUuST8nMmG3lA7JNcvp8XYWsRS6PZMv5EuvC555p4JD0Zo1N8J6wl
	9O1r5o0D596QncI4oN7gbFb7AM3ZHSYET3hyRSdXI8pAqn13lt1YMMtyO1l8gYq5B0jysD0vlVu
	GvUenLv3p7KVWxBRWbvFYKDrDCB1CqnH45KW+gIyaNo4XJBYP8GSJFE0NQTY1fEksevrMjDamwG
	TKwB1E0DKqCAsTTFedE9MViIPHR2A0NsNYp4oA==
X-Received: by 2002:a05:620a:8014:b0:915:e932:e07f with SMTP id
 af79cd13be357-91d8a7f76ddmr92213685a.8.1781631817899; Tue, 16 Jun 2026
 10:43:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+_z3hRjPnQOrEp7uXsNsu6wzqQp9O6FT18i=XcSC7k74Xd2QA@mail.gmail.com>
 <20260330020749.18fbe433.michal.pecio@gmail.com> <CA+_z3hRTD-QAgv3jZhOZUUPA0sNZ8946jfYwYsZ=RnQJ0LG7cw@mail.gmail.com>
 <20260404152438.582f0451.michal.pecio@gmail.com> <CA+_z3hTMfggtv+u_A_SRyb2FRzVjm=Nav5NRCTuhmEthb8x0jw@mail.gmail.com>
 <20260509180603.6f67c9d8.michal.pecio@gmail.com> <CA+_z3hT_n09fAszT+DkoTHLzracB7fQZwkiiTxGGBJxhFcD8hg@mail.gmail.com>
 <20260512120334.4eef3d0b.michal.pecio@gmail.com> <fc2d9862-6c46-4161-8fd5-68b9e6c2e8bb@linux.intel.com>
 <CA+_z3hRdXfZm2ziCmsXEDEY-i8XJjxnw2oe6mkTf+O+B0fx91A@mail.gmail.com>
 <20260529001057.1e0403c4.michal.pecio@gmail.com> <CA+_z3hQF-EGKr11Yaa5vwMLt9TUB1mL9ESUAQU5Rnd=UZDXrBQ@mail.gmail.com>
 <20260529122210.6d2c5543.michal.pecio@gmail.com> <CA+_z3hSMRvW6qhZ4wB54hQyY89z+Mm0C48MGA40aqG7_+spX2g@mail.gmail.com>
 <20260530005742.25893efa.michal.pecio@gmail.com> <CA+_z3hS4sdnZAhAvO+dDTR9hZVwGudDrsw93Do6dZkva8vK=5A@mail.gmail.com>
 <20260613112648.2ea61301.michal.pecio@gmail.com> <CA+_z3hTJh1fiC_cqXWAseAyFVjWf8c2Qht8dPt4MUTX+DJqDXA@mail.gmail.com>
In-Reply-To: <CA+_z3hTJh1fiC_cqXWAseAyFVjWf8c2Qht8dPt4MUTX+DJqDXA@mail.gmail.com>
From: Martin Alderson <martinalderson@gmail.com>
Date: Tue, 16 Jun 2026 18:43:26 +0100
X-Gm-Features: AVVi8CdxD180y6tCM_bte6cNsC1b2huPzdmn9OwpBcsxNsZSo_ybitZSgbadvsg
Message-ID: <CA+_z3hShppxx3xvMJEEVw__ZxSPzVehBrtywbEtQYnuseyj-_Q@mail.gmail.com>
Subject: Re: xhci_hcd: AMD Raphael/Granite Ridge USB 2.0 xHCI [1022:15b8] dies
 on resume from suspend
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

FYI, I had Claude look thru the current kernel sources. It thinks
these HID drivers are potentially at risk of triggering this same bug:

hid-logitech-hidpp.c
hid-corsair-void.c
hid-playstation.c
hid-steam.c
hid-lg-g15.c
hid-uclogic-core.c
hid-asus.c
hid-lenovo.c
hid-bigbenff.c
hid-kysona.c
hid-steelseries.c
hid-elo.c
hid-cp2112.c
hid-nvidia-shield.c
hid-apple.c
hid-sony.c
hid-nintendo.c
hid-rmi.c

So I think this is quite a widespread issue; so your thought on fixing
it at this level would probably fix a lot of other suspend issues!

Cheers
Martin

On Sun, Jun 14, 2026 at 5:41=E2=80=AFPM Martin Alderson
<martinalderson@gmail.com> wrote:
>
> Hey,
>
> Yes agreed - would be great if could fix it for all. FYI I have had no
> failures with my rebuild logitech hid driver whatsoever, so that
> approach definitely works.
>
> Happy to test patches. And yes, it does happen on subsequent suspends
> so can repro a bit easier that way!
>
> Thanks
> Martin
>
> On Sat, Jun 13, 2026 at 10:26=E2=80=AFAM Michal Pecio <michal.pecio@gmail=
.com> wrote:
> >
> > On Sat, 6 Jun 2026 14:12:22 +0100, Martin Alderson wrote:
> > > So the ordering that kills the controller is:
> > >
> > > 1. dj work issues a control SET_REPORT on ep0; the URB lands on the r=
ing
> > > 2. usb_suspend_both() =E2=86=92 usb_suspend_device() drives the port =
to U3
> > > 3. only afterwards does usb_suspend_both() set udev->can_submit =3D 0
> > > and call usb_hcd_flush_endpoint() (drivers/usb/core/driver.c) =E2=80=
=94 and
> > > that flush unlinks the still-pending ep0 URB
> > > 4. xhci issues Stop Endpoint to an endpoint on a U3 port =E2=86=92 5s=
 timeout =E2=86=92 HC died
> > >
> > > That matches the trace exactly: the "Cancel URB ... ep 0x0" appears
> > > after "Set port 7-1 link state ... U3", and the debugfs command ring
> > > shows the single stuck Stop Endpoint TRB (slot 1, ep 1).
> >
> > Makes sense. And good point about usb_hcd_flush_endpoint() - if this
> > gets stuck then usb_suspend_both() can't complete, which explains why
> > the HC still isn't suspended either.
> >
> > > I had Claude patch the driver and this seems to fix it:
> > >
> > > --- /tmp/hid-logitech-dj.orig.c 2026-06-06 14:08:26.580516662 +0100
> > > +++ hid-logitech-dj.c 2026-06-06 13:42:15.702948099 +0100
> >
> > Improving HID drivers is one thing (which should be discussed with HID
> > maintainers - see Documentation/process/submitting-patches.rst), but
> > other drivers may behave similarly and it would be nice if this didn't
> > crash xHCI controllers.
> >
> > While URBs on a suspended device are weird, it turns out that xHCI
> > spec (4.15.1) doesn't prohibit that, it only says that endpoints should
> > be stopped. Which they are - problem happens when we try to stop again.
> > I'd expect such a command to simply complete with Context State Error,
> > which it does in my tests on different HW, but yours gets stuck.
> >
> > I'm not sure what specifically triggers this failure - is it stopping
> > a stopped endpoint always in general, or only after using the SP flag,
> > or on a device behind a suspended root port, or something else.
> >
> > Would you mind testing some patches? I'm thikning about reordering
> > things in usb_suspend_both() so that URBs are flushed before suspending
> > the port, or investigating what exactly breaks your chip and adding
> > some workarounds. We don't need to stop a stopped endpoint, we could
> > proceed immediately to Set TR Dequeue, but it's uncertain if your HW
> > would accept that.
> >
> > BTW, you initially stated that this happens on the first suspend after
> > new boot, but are you sure that it can't happen later? This would make
> > it possible to test patches by suspending repeatedly until failure.
> >
> > Regards,
> > Michal
