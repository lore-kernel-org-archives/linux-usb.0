Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AABF2580F3
	for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2026 01:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.125.188.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784511603; cv=pass; b=p6X13qtymOCDsrjn3o+pbTPG3u6SUsPoqBAnnWlvC+hrcrYs/cWc/+y3U5E9vw3VgLU8d6L+vHF+l6os1ZR8aXlUMW6ajNbs9R78wmDCI1a8/9STQqXOQjUlsPGWeup4OJEO5SUJ174lkRpqoTi93gkQgtu2vQJLnnUFpCQuVOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784511603; c=relaxed/simple;
	bh=595BmH/lCTJdPDeXWDVyRrxPEOh/AnHZAr7Ks2QHBTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KJTDZsLLMOz1tgf04psPYPMDd9zWKcaKT+TRL/5bjQNXsxg6n9vrVjMNIGnm/7Tf6ZeX0mqMXYA0lglZn0n97G5efRCkLe1fLUfQ/wEHWJsjS/T/Uujkdwyasvl0q8wQI4XO1Nls7VCAwG/UPIx72rp7jmPf8p2fho5upfGkBVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=pLUEqqkp; arc=pass smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="pLUEqqkp"
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 612CB3F97B
	for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2026 01:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1784511598;
	bh=KrV982p2oDQOanTM7bqAd9tJi+woxY7sC/2KYelgzDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=pLUEqqkpsy3opVwos6JvjrgiRuJW94wC2PuCXbeII5NIepAGiI/oRuvdxcqXMF2bV
	 QPO0LnFuSDL1etBiiFTKvs/hx6vRWmB26Wqr37Up8DGD/hPGG/7+zcfYqXhdaH45G1
	 eXxmHLxtUO7BnGiqTQBvtit1vR2kASX4tDi84X8DJhB6grTzkAKq3kZ5sMNngfkSg5
	 ngAV4Izbw/gjoLrMK+x1dGFmwjno0qVArziuDHWVdwy1SdcyXlz2NOluY3OohyDRF7
	 U4KR8/JeOmFRvFTQ4xl/jK5d3DKAWob0QpHizn5TUIUfXwQv59ug10NbHGSVGbZ5oU
	 IjtURmPP1ITuBCkLDEVgsCxmcr8J3QArMV3iEzsR85zBOjox9q9e2Qilaj/c3ytt96
	 abz3jQO5KV9DtxySJO5XwbJRjp9Djfm2bG7X9i9UMvJFhDGWYBd+PybSRyc1sRAv8t
	 2NWA9a9T88B4CWJufum0vcOpdDi2GFw2kvwOgejFRv3yKWGD2zluN5HycRYQKDi38R
	 YUqlyLP6Asd1RrQvxxDt2e1W7wfaNhv2xa+Ky1gVgVeUMJ+5RWx5fxQzeT3Xs8lRss
	 w8x5B0OPCnbW3bOibup5xEfogmWCa9PZxuDDvtLKxWCUJ4WBXollYI3oUbhqipXB/U
	 oNPS5t3OR4tVE8o16y0wd6eI=
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-44af3a11aa9so2387379fac.0
        for <linux-usb@vger.kernel.org>; Sun, 19 Jul 2026 18:39:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784511597; cv=none;
        d=google.com; s=arc-20260327;
        b=RySBSixliDdw20EbgHZCIsww3qS5zcqoMBm69SBT4i9ArQo8AL3q8zaPtpFljt+ykg
         C019u3fAoLsxLMdnhTWzQQIoetX+anrUNzbxUNiTVoPcmskKQfZzbJcl/svaEdqLZ9A8
         Adx5l/bIw220BB/VFQzQGTosrznQ4sMNx/fX0JTT5cU/zbDwVtMO4FaFMO9gsFzkZ4LQ
         56yApOqwwu5GBoODTYWCH2m+otNauwO8fbjMsL7CtTg3QUNGeizuYDzHZ83xB0/PxMsz
         Z//4yqpqbHv6AwCo1HHqacswlW+jhHNo84Y+Sb334ERVDEx/3Te+Cs7wS0j69R/3t/Kq
         rsew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=KrV982p2oDQOanTM7bqAd9tJi+woxY7sC/2KYelgzDU=;
        fh=903A+6zeeNw/70ND688gGXpCfdJ9pCusyRDpD25M56I=;
        b=gTpM+muJ7DK1HpqCLDbOToNxsZRhUCMXSZjk5wQHtV0J7bA51RyfGWf1btHWGPYWTF
         qTLU88q5n1ZWg0h2AQj3aXGRnnV6HIC8YTMNMQfJvwu2Z4SzlNtSDzAavXpckkhv0joG
         6/aSeIBrz9qiM5l2ZSILGuYjClZHg8UqhlKCQUgHC09iCjOcyKezLiJMOL4QCa5H8DPi
         kfzH5AkQToph5XtZeqoku0USSXBmznlSknyGgR8P2j0pSOiknADWN0p7bBO+Kiw7r7zt
         8DKc8QCFfnHkVi6I5oe/IHnbe5qkIZdSqNoz2KGksUzDiYpEka9HKqmQVzoM5pcUFCeL
         XkkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784511597; x=1785116397;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KrV982p2oDQOanTM7bqAd9tJi+woxY7sC/2KYelgzDU=;
        b=e1KMtXDXAFgILdS06wz/LCT/S9WqPddKGhUmB1pXR+1NVU8EUV5qXyjRGyG3HHMQ6I
         HzNo8bw/9iD52c1qWkXoFXK80P6tD/nhL20ymqMuy5VSI9ZBy5wCf3AMOdzvgYc4czfe
         3TSBMJQywcTUTcphm7MtQx0gXY2qraG5yioKp7QAwWDXEKPaZmqAwEwUuMWEMtdliMd6
         og9pZOJ96phM2Lg2q6NF7szHgjDTa9p2LJwWKnja1iDnVVDKOAMjOF8byWzibd1subDF
         bXocm/xt7h7jcW2RDP4h/5p4rH3kkgN9zkUA6tpQaEya9/q2uazoWzY1A78EK/LMVvMk
         bU7A==
X-Forwarded-Encrypted: i=1; AHgh+RquJ9TeQtwz0YBnywjnpYb0C6DIYMEP/lz2Vnct9JV3HK6QYmWWJvXuhkrJSQwluFVR/16CJZZvZUk=@vger.kernel.org
X-Gm-Message-State: AOJu0YydAfYBQVc86M3AVe3+F2n9IeosHQEBnLxhrUm7ujfLJgg92hoa
	i/hj8JdLzy/wl6IDEMxq4gZY6CcUJ4oO4hmFlnMK0tagLj1HxCdL6OWb0EwFGBCkgSczlB3+3su
	ARpmDqPHNnbOKLmVeb+AYc6RBbNP4VWnM1qSfmm+qKtTdWsDqXJkJonMyoKHeOJI9yFO0i6bAfZ
	VdwOtkaJI6zpASPkO8zjy36peI753iKvNebJEz6M9XHqrTR79nuD57
X-Gm-Gg: AfdE7clOSZZN9+7faeEoCcfEeadn6VL53Rb+Bvti18TGj3V19VqjTW2g5OELVoqOJsw
	3+tYLyBg4e+8Cy1abz9RURZ5RjfG4dtH6Rnt+zyqAm21qkgqAy1VUadT4UxW9LS4vWgOz9FWCjC
	P2ISIV/Xo/lmrPd+09/0ffBcK96zs8ivfNEjRl2q2rf6iZ9YmgfVkPQ2fxvaQoBj485m7l8K9s3
	PV1vrFc264uK0eoZ04z0E6DpwaBMa68PYVfjEElYRqt7SCBV/YOEJ+kUBoTs6HDUNEFD7EAinll
	ZhcUFTrHn4Tvdg==
X-Received: by 2002:a05:6808:2209:b0:486:39db:ebde with SMTP id 5614622812f47-4a4d047cd58mr5363848b6e.7.1784511596889;
        Sun, 19 Jul 2026 18:39:56 -0700 (PDT)
X-Received: by 2002:a05:6808:2209:b0:486:39db:ebde with SMTP id
 5614622812f47-4a4d047cd58mr5363834b6e.7.1784511596560; Sun, 19 Jul 2026
 18:39:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527064121.173952-1-an.wu@canonical.com> <20260527064121.173952-2-an.wu@canonical.com>
 <20260527071445.GB3102@black.igk.intel.com> <CAO4Mv0Y-zAZKCQTvOAb+AS-iMh1Fa97f+BqaLTdDocBWm-_B7w@mail.gmail.com>
 <20260528102934.GH3102@black.igk.intel.com> <CAO4Mv0aUjtc66AkPmsRyEFTiV5etNNXoBqocMyKpOfS7uKTVKQ@mail.gmail.com>
 <CAO4Mv0ZbazqxzM9Sjd9=7YzMzZs6w54SLkhq+NtragOau5-eAA@mail.gmail.com>
 <20260601070439.GO3102@black.igk.intel.com> <CAO4Mv0bnSd8Vm1raj5bnUqywkuKNjtM-W6zPr0dzGJDKwi0ZNQ@mail.gmail.com>
 <CAO4Mv0YdUm_36fJWrvqtGDp6nsQHJFteh_TKFjM31Exygj2-4w@mail.gmail.com> <bc7c80ab-4604-45d3-862e-6b7d0a2ea723@amd.com>
In-Reply-To: <bc7c80ab-4604-45d3-862e-6b7d0a2ea723@amd.com>
From: An Wu <an.wu@canonical.com>
Date: Mon, 20 Jul 2026 09:39:44 +0800
X-Gm-Features: AUfX_mx7qD1frX3MCsCxAoHS8bojh4mNzUMpy3YIASW6Z3_ts8aqlw7oTegWAHU
Message-ID: <CAO4Mv0YsoS8=eeD3gNAM9f6ExyoXGki_xgUmSF4JL7QRwmuXJw@mail.gmail.com>
Subject: Re: [PATCH] thunderbolt: Defer DP tunnel teardown until display
 driver is ready
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, andreas.noever@gmail.com, 
	michael.jamet@intel.com, YehezkelShB@gmail.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Anthony Wong <anthony.wong@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mario
 Thank you for your valuable advice. This approach could help us
overcome the current limitation of displaying the LUKS unlock screen
through a Thunderbolt dock.
It would also allow us to drop the patch for the timeout issue. I=E2=80=99l=
l
propose this change to the team.

For 2) and 3), I'll bring them up for the team to evaluate.

Thank you~

BR
    An

On Fri, Jul 17, 2026 at 2:32=E2=80=AFAM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> Hi,
>
> I had a few thoughts while reading this thread I wanted to share.
>
> 1) Ubuntu builds the initramfs locally with dracut.
>
> It should be possible to know at the time of building the initramfs
> which hardware is actually on the system and only include the modules
> you need to avoid this issue.
>
> For example if you're on an I+N system you can avoid amdgpu and if
> you're on a pure I system you could avoid nouveau and amdgpu.  Does that
> help the size concerns for the initramfs?
>
> 2) Do you really need thunderbolt.ko in the initramfs for keyboards and
> the like to work?
>
> I don't think so.  I thought x86 UEFI laptops have a pre-OS connection
> manager that will remain resident until the OS connection manager takes
> over.  I know this is the case for AMD, and I think this also applies to
> Intel.
>
> 3) Are you including boltd in the initramfs?
>
> If not; you have a secondary problem you might not realize that defeats
> your entire goal of having USB keyboard connected to a dock working
> during LUKS.
>
> If the keyboard is connected to a USB3 controller behind a TBT3
> controller the USB4 router topology gets reset when thunderbolt.ko
> loads.  This is because the firmware often doesn't reserve enough memory
> for hotpluggable PCIe devices.  Linux resets it and assigns enough
> memory for this to work.  This is the same thing that Windows does.
>
> Well after that reset happens the TBT3 device won't be authorized
> meaning any PCIe topology behind it isn't authorized.  At runtime this
> is solved by boltd checking that the IOMMU is enabled (and was enabled
> Pre-BOO) in order to authorize the topology.
>
> I've raised something about this in the past, but AFAICT no one in
> Ubuntu looked at it.
>
> https://bugs.launchpad.net/ubuntu/+source/initramfs-tools/+bug/2078573
>
> 4) This patch may have been dropped upstream, but I still see it
> included in Ubuntu's kernel.
>
> https://lists.ubuntu.com/archives/kernel-team/2026-June/168287.html
>
> What happens with NPI hardware that doesn't have a display driver ready?
>   It seems like this is going to cause thunderbolt.ko to infinitely
> reschedule work looking for one, wasting CPU cycles and otherwise
> blocking CPU low power states.
>
> Thus I don't think this is very good tech debt to adopt in Ubuntu's
> kernel when there are other technical solutions available to consider.
>
> On 6/5/26 05:16, An Wu wrote:
> > Hi Mika
> >      After further consideration, we've decided to drop this patch and
> > probably to note it as limitation. Really appreciate your patience and
> > sorry for the noise.
> >
> > BR
> >      An
> >
> > On Mon, Jun 1, 2026 at 4:18=E2=80=AFPM An Wu <an.wu@canonical.com> wrot=
e:
> >>
> >> Hi Mika
> >>      We tried putting graphic modules into initramfs and the size
> >> increased from 56 MB to over 200 MB. We will discuss with the team the
> >> possibility of fixing this in userspace and follow up once we have a
> >> clearer picture.
> >> Really appreciate your time and patience.
> >>
> >> BR
> >>      An
> >>
> >> On Mon, Jun 1, 2026 at 3:04=E2=80=AFPM Mika Westerberg
> >> <mika.westerberg@linux.intel.com> wrote:
> >>>
> >>> Hi,
> >>>
> >>> On Mon, Jun 01, 2026 at 02:50:21PM +0800, An Wu wrote:
> >>>> Hi Mika
> >>>>
> >>>> Another approach I considered is using register_module_notifier() to
> >>>> detect when a display driver module is loaded, then retrigger the DP
> >>>> tunnel setup. However, since struct module does not carry any device
> >>>> class or subsystem metadata, there is no generic way to identify
> >>>> whether a loaded module is a display driver. We would need to mainta=
in
> >>>> a hardcoded list of known GPU module names (i915, xe, amdgpu, etc.),
> >>>> which is fragile and not scalable.
> >>>
> >>> Indeed. Perhaps not to try to solve this in the kernel and instead do=
 this
> >>> in userspace?
> >>>
> >>> Have you actually measured how much initramfs size "increases" if you=
 do
> >>> include the relevant graphics drivers and their dependencies?
> >
>
