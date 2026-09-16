Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE1139902D
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 01:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789522424; cv=pass; b=e/Z08Tc7mZYHSNXVrpgI9POfkD1CGnAAcEsm8JpBctarjJEYjJNWObs3pPImzS+UBB3ymn8Iwsn/Hp7vvc24CMNw7wf8N4wbET3fftnLCp8Fl1PTq47pFNn3zPutpCIbMYzhP0K1wRJ009lcyEO0Z7/QGT6HJAJrSKWxQ+mCBYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789522424; c=relaxed/simple;
	bh=5Ztf0qMjYRT3YmteIgUtTBDw9tTq4t89/7WSQzzqUiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YOPxqrF16Zqm5uxivu9rIo/zc731sV1JrgiTthwvx7KUTvHURAu+gnOMqkN2jHaaMxxGlg6gfugffVltyn08DfII8dae36R+gDWGGiS52nwSrgCidvJO5ac5KZdqa5EJOsbZrCJxiEVlpzgd9VOPOxo5vVGrUK4/qR3oz5Hyfo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+DbufsI; arc=pass smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+DbufsI"
Received: by mail-oo2-f41.google.com with SMTP id 006d021491bc7-6b390bcab0cso285673eaf.2
        for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 18:33:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789522396; cv=none;
        d=google.com; s=arc-20260327;
        b=ikAFu9/VEEfoXsj2Pg2jYmbUQf+beIn/TO+FhWmKli3EKAUIK8fkteywQsPwNDZP/y
         muLsjxQtzF1jnYTdx6wtC6cw4RXLMVIB8RcY8xOdvebUMk9XJYR8JuAmMtJi2ZV1PXPI
         o4L4E3GsZG56xZgwGh0Bc1oiy9qB56rZBh1s6K8jhqb5FiivextvUgibfsewbFowKOSM
         ZZp8v6bTE69aING4UsegeGzWgIpTQj4MAD66chydtO1K2Hfvqli67tnukm5ZuHV0+jHL
         zF4SlFphSOCfBla53CgW+Buo/OiQVVr2VItiadHqSRMc/mIaysXAOfci4EnB9DqJwmf6
         YAOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NzYXWSSJlKGV+Gc5Rdc9JQPvWSUHP7lfXEi/F4mrLtw=;
        fh=KAMnwmhFvhmYuv+qZ99phEqKx19WR6pofr1pGjg1aXo=;
        b=hOU1bE6mAtqo6r61hoDl31YYg/YKk6Obo4Egi9N3f9g/FUTSY3+jqdTsOiuqr20vjm
         KIZ7FA33WO8nb/olyLbcAI3+F6uac0T+8kb63Eeo2I+z2r/laQymMlCw1+kMioPh2Hcz
         ZUNwmg6g5id7CYBXWV575EKT9nTIAXeMmgp5BacgHLlP7DeR596lHp2rOgby42K2M0M5
         DYEiZtdMYb38dPj8Rf3VKfRxTlGxDpzdT5lHQWEvjw9UufI+9eCwrWOQS8ZDZwF6SXcP
         pETm+iqQVcko9GO2yq2l+PIClZQhmQaVQgPKA6a8T4HP32D5AAPewjdCkG6awvQMC6H2
         USqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789522396; x=1790127196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NzYXWSSJlKGV+Gc5Rdc9JQPvWSUHP7lfXEi/F4mrLtw=;
        b=Y+DbufsI0ZZDqoM1aJiTrFXb65c2kNdiUwVT7icOKG4BwvmySAwLloArTnM6JPF6dc
         HWS8vRDjgXQklkZ36KLtQmHFFivqSYx9oqOHI7XsqxYnM7nnrBSXC33N6pTLDHU5bZNq
         fty/KR8BFHi7e+n2B5T54wwqjUK4Gz0YfKOGd92lAXAx8AmkiJcTsbKXQHCaK9LWXIDN
         HudqiRP/LHPStx/74lWsp3Wkl/Z0x7XUGtg9uq5usyE+omNhEYEySBiNsGC7Y5fGRwVu
         zv7OqrdvC9eQ33QyvN/yGDz4+Jez0QUnIctIGnp48iMykveUxp781mH4rGHepuloWsHU
         tcGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789522396; x=1790127196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NzYXWSSJlKGV+Gc5Rdc9JQPvWSUHP7lfXEi/F4mrLtw=;
        b=cT8QFEq0rAzJRgrNtXCJuY4K2gVdqWJVohSD19ui30ibAPavJ7/Z3VtdtdipEEu3bb
         nUjIjIXjzKUfWIDE8c1C4T0Bjy4/Ni+6XaN3LMh4cUkgotj9eHcC05Z2eEtpf9eIqKx1
         Sar0mg1pi4ClOzVALiHv6nF1I01tTzLYjxV+LHdYoL5Sq0AkNvlbotr61T5R8IeUjCsY
         j78/mJFGTsHcL62/UUm7f+uT6iUgCk/5n3mhMrDy1iI4X9R4mQ9Uma0STyiq5PWSNAff
         nWgLikjm9n4d8USGkeI3YcivnX14gx0q733pTIzAhEj+ODAnq405YKJvJhoEbwBL11nB
         Siyg==
X-Forwarded-Encrypted: i=1; AKwUvBzzCUYWHMmb0ATnIV83GAyy1ZNoehh9OscLiziEJyoOvy7rglEXFb7Bc+JNGY7pvx3l8RzX4pb9AB4=@vger.kernel.org
X-Gm-Message-State: AFuF++n3nwzQ9u/AB6FMo7p9Nw5ev/UU7mr5nTscs2BVteVH7eru7d+N
	T1ebbSPXUj7WSs4yVpR9NxlJ/n+l2x9hqPEVjGaNkdyYHbEuO9nYREfg56T2ZMURkh5Pm55XZqo
	jv0mxk0xMku+tE+P0FdZqGlaNJ/7KZYG/hciT
X-Gm-Gg: AYBFou2h0oVXcDHuvbz35zb/yctZ0Qzjv9EUIWMeMGDMQb+Egx8RUntl5thCcvUtMZW
	7Y92j6WuzY+B7SsiZGI888PGQT0XrmUsn0wYPuG3XR0woXnbMR7q0gt/LzVub126Vnr2ubXfoWI
	pz+4Wip60nUj5G8OlbHRx2gpyU37Gq9M+AMdr1s3Q2Ibao2H/RlmpfYJ+foK8wkgENfQCJsQxpZ
	rQeNex5sHboe0CGPzUV88SBA0T/pRRi63ISqA3ABdaBQRfCqKpCJGDwRIBlhLPSD+5b4ef4nj0R
	dSAa5LSEoIZ1Hl/IySTyoQ4HsXNOjbPI6rGgSPNofbtqhbIOaguKGkbOYQ==
X-Received: by 2002:a05:6820:81d8:b0:6aa:e573:9ce0 with SMTP id
 006d021491bc7-6c7d16ce206mr1034905eaf.16.1789522395927; Tue, 15 Sep 2026
 18:33:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914013033.3938-1-ki.chiang65@gmail.com> <20260914130907.749cd8e7.michal.pecio@gmail.com>
In-Reply-To: <20260914130907.749cd8e7.michal.pecio@gmail.com>
From: Kuangyi Chiang <ki.chiang65@gmail.com>
Date: Wed, 16 Sep 2026 09:33:05 +0800
X-Gm-Features: AcwNN1VLAxgU8jUn2SKIvvg4jEKPXKphx-A7W_IX-q6bjSUvDc3ySm2Ohv-nfKk
Message-ID: <CAHN5xi0NSJO=V0=eVd4_MGp2Lg5NrwB3D+hsF87ehTSmaeeSbQ@mail.gmail.com>
Subject: Re: [PATCH] xhci: Fix HIK camera control timeout on Etron hosts
To: Michal Pecio <michal.pecio@gmail.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for the review.

Michal Pecio <michal.pecio@gmail.com> =E6=96=BC 2026=E5=B9=B49=E6=9C=8814=
=E6=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=887:09=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On Mon, 14 Sep 2026 09:30:33 +0800, Kuangyi Chiang wrote:
> > Control transfers to the HIK 1080P Camera (2bdf:0280) can time out when
> > the device is connected through an Etron xHCI host:
> >
> > [   48.363671] uvcvideo: Found UVC 1.00 device HIK 1080P Camera (2bdf:0=
280)
> > [   53.465662] uvcvideo: Failed to set UVC probe control : -110 (exp. 2=
6).
> > [   58.585653] uvcvideo: Failed to query (129) UVC probe control : -110=
 (exp. 26).
> > [   58.592967] uvcvideo: Failed to initialize the device (-5).
> >
> > Testing shows that at least 125 us between control transfers is require=
d
> > to avoid the timeout. Limit the workaround to the affected Etron host a=
nd
> > USB device combination to avoid changing control-transfer timing for ot=
her
> > devices.
>
> Any idea why it happens or why the delay helps?

We don't know the root cause yet, but we did some more testing.

We tested delays of 50us, 125us, and 200us. The issue was still
reproducible with 50us, while 125us and 200us passed our test.

Our pass criterion is 30 successful plug/unplug cycles on each port.
So 125us is the minimum delay we tested that consistently works.

We also tried USB_QUIRK_DELAY_CTRL_MSG, but its 200ms delay is too
long and causes UVC initialization to fail.

> How many other HCs did you test this camera with?

The camera works with the EHCI host we tested without any delay.
We can also reproduce a similar issue with an ASMedia ASM1142 xHCI
host (1b21:1242). This patch, however, is limited to the Etron/HIK
combination.

> Does it help to reconnect and try again?

No. The issue is still reproducible after reconnecting the camera.

>
> FWIW, I tried a few USB 2.0 cameras with my Etron and they mostly work,
> except one. It passes probe just fine, but fails on streaming attempt.
> Adding 125us delay doesn't help, but 1000 works sometimes and 4000 even
> more often.
>
> Probably a HW bug. Honestly, I never use Etron for anything serious.
>
> > Perform the delay before taking xhci->lock so the existing state
> > validation and TD queueing remain in the same critical section. Use
> > udelay() because urb_enqueue() may be called from atomic context and
> > cannot use a sleeping delay.
>
> Actually, you would need to do that under lock if you want to ensure
> that multiple callers can't submit URBs closely together. But that's
> dodgy and we don't even know what exactly triggers it or whether this
> solution really is the best one.

Agreed. For the UVC control transfers involved here, the next transfer
is submitted only after the previous one completes, so they are
serialized.

The delay before xhci->lock does not prevent other callers from
submitting control URBs close together. However, this workaround is
limited to control transfers for the affected Etron/HIK combination.

Regards,
Kuangyi

>
> Regards,
> Michal
