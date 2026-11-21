Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795271576;
	b=UwXpMwtE42ZZPdjra3TuK/Hw7X/kAJC8ISiOI9jrhou5ILrFdEhWSMRSFf6a/gVp9nh0
	 +QJa5aPFcVt8YqAQnhw+Sw0Gmdx0UijWGYYqKfPB+e4kU2K2+Gc7MuddsRYzF8ucRH5Xt
	 J0RRRSn46vQeqof7FZY5f0wVL4VJ5JzJa7se6J1nNVRW0pcfwHwAu+sHmGEKTh0fkuOnu
	 kRljk5z4VTmxkpnTawJDQxni/5OTrsXgCiJh7aMOjia9JVREFfSWIUgPTmsz7mbq/SqX0
	 0wAoUKVmEgRuaHK4FnVZ8gDBcMfcPdb9tIqQw4V0ispGjCI5SoeRKkmA80bBwIXz7CQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795271576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hs8aL8jqLi6Sp7RY2WcrcPYPV8X7Hau2KEkDpcTQGQ4=;
	b=NramxBx8XLmKdujdIEmovVolSE/6LrZjOCS9kFlunOio3EROz6MBjH6iL2kiDIkak+r/
	 N0tN1GFF+/5rPKOYK0vwViGzIdPJBocrILwbIEcj1NRWeIgzJ2r0YbI8HEg4d1N9OKbUk
	 5KwGcDpYH/E5TTRudkWaM/8nMlOcUJPC9rSB0EAm7peyy4b3x5Uy02HEHPg99AZtq1IbY
	 ThPq3LPIUz14FCMoT4XE19Uob7RyZrXyCce0eyJpBgvo2I/r5362w838DJz9MgTtimyNR
	 wJMlY7+6La2LHXitU1pL1Jj/VtBDqMCv+CBkyaXZ9AUB9E5j1JosWEJLtYYDgajEvNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m2vq4kFx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59BC606A320
	for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 14:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D59BC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m2vq4kFx
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b4efdc8c20so11981837b3.1
        for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 06:32:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795271575; cv=none;
        d=google.com; s=arc-20260327;
        b=jFKOHDquEMB1c1DD/z9BG8pmXVQbKQ/bTw1qXJFN683NPPBtcLv97qrH8SVYVdsQTv
         PqWguVimeXk7AVSLlSPqd4Os3oSFCE4tyKlAqQ5ROzNlbb715FAjtuxfCsJyP4dbQzHU
         8FwkdVhW1QAbe8CPpJuUS1Wn//Juf6B+ttGSleQd50ViT8QPerDMEtGSXwRo2ROkwVfN
         NKw/IOB6mXx9f+X1CTpyvGNDXmvipsYrOQif6ufRtbtOsiAf9t7mukXY3N4RA/RZ/91B
         bDYdaD7+gQJYc09aPKgHF4Fa1eLtgPkB/idot79bQegwhHMt877qFlavluiGgYtRU1GO
         whDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hs8aL8jqLi6Sp7RY2WcrcPYPV8X7Hau2KEkDpcTQGQ4=;
        fh=FFOPTD6Fv1kAwyD34Ox1FdRZAj5mUwBUnXLZPRiUCWI=;
        b=Xk7jpqa0araIzpSNLgHjt8DFtc4uKGj0ClHHv5vzDYAAM0gz2CXkjnvIvITL8X3joJ
         N6z0My6DjmerzfCdLsqzE2wIxbEVPjRdC2TPZszExyMQ8xXTlH28up/8znh94dRbj0mg
         knODH6PracZDK3xE54+nULCh18gmaip5BgBaMUMHQoKq32APRaxgA1u6gnXopUtEwFuO
         xhVjR6zhx1wJ0uCIKLzYcswaCGboJO+bHrBsnX427UzCxIolXLIInKJOccwzmSvm2DiY
         pWMgYC0htSZ2E9qP8R2qmMvSRSmyftqcN9WHiSDDaU/6QjvitsMuw5//+Nt5d51GF0Lw
         Aplg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795271575; x=1795876375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hs8aL8jqLi6Sp7RY2WcrcPYPV8X7Hau2KEkDpcTQGQ4=;
        b=m2vq4kFxNBvRwZIpgD6G3WFh9q8jSMNeDEVeSRi8c1R/vzeW1yMmFIirqBxZORDIE/
         ALiddfk8sUyGQ8eYOzuzOfQpLWl7NGyTaE+hyMOBzbG6xIHvzJ9r59ClAwwE/BX69vSz
         Whx5f0cZwBi/SRkW9Kk2bRQUX/IhLVeRw8NPDbaglWO2o2DjJ+C33/GHYUlh62F/f/fQ
         KbMCbp47X1B6eJGRSM1QtU8LULHIfASDw8+4uGwx/W+DVwjdr4GXZLAm+QE2u0cAeyE/
         178A5veHonuWOlk6nvOkC5Mstfm9h+6LhgFMu4X40H5eWi0as3WcMJ3UnppqIHZXN7Dh
         6Yzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795271575; x=1795876375;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hs8aL8jqLi6Sp7RY2WcrcPYPV8X7Hau2KEkDpcTQGQ4=;
        b=nUTEY3hb08/fOMRuS+L8sp6/RiNmi5tjnafqS1m5SWFvt6I+++diS71zQUZcTctXUw
         r/efgmElC3t3rpPD3QbyXF8M4yA74uC6aBUlELYCA51KS/oht7iXHU6rqrjxblBUrsNt
         mWiJM4s9W8ZdImaeO6yDWTBy7kA0HGrY3xq3l+c4JP6hxDOXNw8Ng7FabObJltA1+fh2
         62sGP0ul0nRpH/rN+TMt8IDgze4tOhqmxQSNgveOZlri+Ew1V0Gyz7B1asB010uhmv0P
         prSQys5EZMCRiY8PCwqQZDtQB9Tkjq4hcloTOnCDL4QDDfyA6gF6JLLAAvKfhFjinxvP
         Q55g==
X-Forwarded-Encrypted: i=1; AL+hErGQcxbD2BsY1muVF4eUAkdE1LkdHnn/lIqrLq74NDqGq35h4E+Us7+GKLG4p12l3jISzp14lyhwCVs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uRuptTql5OZCE0bXmOE7EXviA/mPZMwxVRL8hggVx0VdhTBAU
	baAZxI+kI6F5nKEcmxe18cyJmnNOHqL/maE/ZtkRz8t6pBxqyesIF8Kv293VA+H6v9/Y5JTRIz2
	OwzPdSjlwNRoqvoDA3WhNKQGkzBkJYAc=
X-Gm-Gg: AZFdTZeepp1Yi7W8dS/gvswRn/zareCdO++6GyU7ka2JX7YxGvKrne7FQMwIEOJdVwK
	a04akSdQL+7WxI2OBsSko/bm/ph2Z9fNTXjIOw1rGfE1MGSGQUH4x9XttB91uxLuq72Jy2wEBQq
	9XwYLC1DNW1z0lREPIbgc9JJLrKdxoCsrnXVhDipmH7Wd2hRvbHK/ScJ6pcDIuwK7sv54NA5i1G
	iZ19Am1IU4u3T19MkdHQ6aCZuMycVJubOtbJBHLSyvNVRq7TGzYEjH5s9dqbFbUV/K6dHaz5NsO
	0OcoyZMR8ENCPNOwm1Jx6WFLAxHzvRlOCYzW2WoMfIWcOrzTPnJFyvXTp7TmpqbiqKJlztCXZnX
	l3bmsZrvJVYbYvr0S7iYif4fkMEuwmnM/EBG/cRwoe6cneTAYSepCdkNawGOD5+Kf97eS2EMJBO
	/3dKgMU3GcXoC9eBkDX2TvM2facaK7z1wmZaziQXGjndw+rvPd1Bq3QSb/7+AxPie1hhrnN/sDA
	zmlmEtHe3g=
X-Received: by 2002:a05:690c:c15:b0:8b3:27b8:2bd2 with SMTP id
 00721157ae682-8b52042f569mr29562167b3.10.1795271574490; Sat, 21 Nov 2026
 06:32:54 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260821114854.12218-1-kartikey406@gmail.com> <2026092925-licorice-strode-7905@gregkh>
 <CADhLXY6t7UL9Ys65qDSBBAUzj+sQkS26xFZX3YjkFZ8ufS16wQ@mail.gmail.com>
 <CADhLXY55XwzujRCg+xgm4v4UJmfdgUQ0oihS39f3iMwFDzXTRw@mail.gmail.com>
 <2026101828-oxidation-squishy-51e3@gregkh> <CADhLXY4N5ia9-J7ahmnOE2i6r5w-SMZC0KiezFu0P1n7=O_xrQ@mail.gmail.com>
 <2026112002-unshipped-refract-b827@gregkh>
In-Reply-To: <2026112002-unshipped-refract-b827@gregkh>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sat, 21 Nov 2026 20:02:42 +0530
X-Gm-Features: Aa3M54pmSP3r2RDx14c9yHGMuKb4EPQDSaLBIa-qjaYbhoQVx0B1zY6be2Acqk0
Message-ID: <CADhLXY6oXUKd7u+wXNxBOz6cVabUdnOjt6V+eeHL9n6WE9-cnA@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: u_audio: reject srate request for
 unconfigured direction
To: Greg KH <gregkh@linuxfoundation.org>
Cc: kees@kernel.org, pavel.hofman@ivitera.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 4:04=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Sun, Nov 15, 2026 at 07:16:56PM +0530, Deepanshu Kartikey wrote:
> > On Sun, Oct 18, 2026 at 5:24=E2=80=AFPM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> > >
> > > On Sun, Oct 18, 2026 at 04:28:49PM +0530, Deepanshu Kartikey wrote:
> > > > On Wed, Sep 30, 2026 at 1:48=E2=80=AFPM Deepanshu Kartikey
> > > > <kartikey406@gmail.com> wrote:
> > > > >
> > > > > On Tue, Sep 29, 2026 at 6:53=E2=80=AFPM Greg KH <gregkh@linuxfoun=
dation.org> wrote:
> > > > > >
> > > > > > On Fri, Aug 21, 2026 at 05:18:54PM +0530, Deepanshu Kartikey wr=
ote:
> > > > > > > u_audio_get_playback_srate() unconditionally locks and reads
> > > > > > > uac->p_prm.lock/srate, but g_audio_setup() only initializes
> > > > > > > p_prm.lock when p_chmask is set. On a UAC2 instance configure=
d
> > > > > > > without a playback direction, this results in acquiring a
> > > > > > > never spin_lock_init()'d lock when a GET_CUR sample rate
> > > > > > > request targets playback, triggering a lockdep "trying to
> > > > > > > register non-static key" warning.
> > > > > > >
> > > > > > > Reject the request with -EOPNOTSUPP when p_chmask is not set,
> > > > > > > before touching prm->lock.
> > > > > > >
> > > > > > > Fixes: eb3a1ce6f5ed ("usb: gadget: u_audio: Add capture/playb=
ack srate getter")
> > > > > > > Reported-by: syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmai=
l.com
> > > > > > > Closes: http://syzkaller.appspot.com/bug?extid=3De1d0e66badec=
c32d45eb
> > > > > > > Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> > > > > > > ---
> > > > > >
> > > > > > How was this tested?
> > > > >
> > > > > I have not been able to test this since there is no
> > > > > repro present in syzbot.
> > > > >
> > > > > I verified the fix by static analysis of the call path in the rep=
ort
> > > > > (afunc_setup -> in_rq_cur -> u_audio_get_playback_srate) and conf=
irmed
> > > > > in g_audio_setup() that uac->p_prm.lock is only passed through
> > > > > spin_lock_init() inside the "if (p_chmask)" block, so it is left
> > > > > uninitialized whenever p_chmask is 0. Leading to lock splat issue=
.
> > > > >
> > > > > This patch is compile test only
> > > > >
> > > > > > Did you forget a Assisted-by: tag?
> > > > >
> > > > > Sure I will add assisted by tag
> > > > >
> > > > > thanks
> > > > >
> > > > > Deepanshu
> > > >
> > > > Hi Greg,
> > > >
> > > > Please let me know the status of this patch.
> > >
> > > Burried with 2000+ other pending USB patches, please be patient, ther=
e
> > > is no rush here as this is not affecting any real device you have,
> > > right?
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> > Gentle Reminder. Please let me know the status of this patch.
>
> You said you would add an assisted-by tag.

Apologies. I have sent the patch v2 with assisted-by tag.

Thanks

Deepanshu
