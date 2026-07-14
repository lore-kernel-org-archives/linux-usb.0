Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34BC43FD1A
	for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 09:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784022619; cv=pass; b=icY5YrkoSrW8fQg2WN793JHp6I+oEmnUqPyNTQ0U5A/d7C+tO3ofx2PhDGBTv+KjzKjBlBN/mbtiJvzOytWra4gWKM8v1gPM3sAIA1hYtv/gLc7/d91l/ANmCA9+kE448fW3fos8v9labGW0c+8um3HfNPFh8RYoEuZ7W0YRwlk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784022619; c=relaxed/simple;
	bh=huCvrnU3agb3K1g1v38eQ/cuaEfOqKiSp5N0XzoCK8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f17XDSNd3AxcnILVaTC54KcRSuuANYrVPjx24vf8qGCpSu/wR2u8t+yxvUQmpFqRWIDQYAODJ9Nlgp9x9UPLIgNawD1Xt9Y1t47wAMdNHJFOITPSwuT7m9GsIDYORH097VrVyA210HKvXHl9R5Kiw0zcAw1Sl1UBhsVTZtbMB/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kV5GuwYr; arc=pass smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kV5GuwYr"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-4471b489240so1191802fac.2
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 02:50:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784022614; cv=none;
        d=google.com; s=arc-20260327;
        b=JFapvnw5PIfBg0KqmCwTWe8XL1qqqqO5d66hQdVsazC3SN1+70cP5let2cicsjXLre
         ZFVSUTScww3WOBZVxZUxxE268U/i5XAxwK76kDYnRya3H/6HIQcvfJU+MaBZ/GB8Wq5P
         M5ZNqn6T48SijU3Ml4hkCHoAK3MMMbBDkVa9eIsN8tXFgA4KqQt2eCN+f+VSnJcDc7gB
         3xwF/h31YhmCO2AV7pZpmCl0f9uMEe7Ks6gs3/8q37KQikpn6HJY3Jga92lkbS59R8xC
         gHj1YmZXeMqzi3GSsdYB0SltlJJu1Xp+MsTfP+CBx15lr1AjN+b6jDZfu5U/jy64XDqv
         kD+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uo7ygNwGoCghLpXG4mNtPsrN3LiH45hJxobzH5eEimQ=;
        fh=HbKWjWkAE7xwEpaIhbNQHI+jc4Tfd43ikc/iJ72WTSs=;
        b=noU9DVqsIFF73YeK+TQ4iBsDzGg2KaxXsr914XhywCuYxUoK834QIkwl8nCvBT31L/
         F7lnLKR+jKYMNEBIAGB2zwuQFe9xg3VGu+70Ta3u2a0RdkA+Cr5yowWG0ep+hPbhwkYO
         74QpVBRsEHhVyMOp38FIu+4PUN+8VWmr/e7hQs6+TB5y1yaLhwgKMkoZmzm3geg98Jfb
         EZDge35G9JojGapYAZ3iZ/mCd0FeL244IL8pmgPqhS+G8TlwxaV57HspkrQ0pwzCmup0
         uODTHQXwXivp53OwaR3SRLGqSyLp+uvdXVwDOL7tncP76Him9PlST8gK7+OL3Ldl93Fk
         uRfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784022614; x=1784627414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uo7ygNwGoCghLpXG4mNtPsrN3LiH45hJxobzH5eEimQ=;
        b=kV5GuwYrDMCEDWvOYCA4fwBusl3wD5FFygJXxfTxr8Mb1IK3udEx/j4ODKy7r4HVGi
         MksiwaFUA/3TAjb0Hnbaq8jm09zH7i7eeIY6OrZqROQjVL+5y1saXHRCWNWZ318/bLaQ
         +hciu/tMwJ6Siw43FZERWRKWlMhrXbXxeWVN9ZrdR1udTJVYREShxWdOkfNYJ23NsHhB
         3D9/DjG7cKnxHfdKa9hboAwCGHxUWHIODnOKgYUXrV2m7opfyFw6WggDz2eYPp1l4mPz
         2+u+jR16vsvt13sQUEEFfF7QgS+BgCi/pVZGG+nI9wMRmXaUGOp4FQmws7A7l+1v7ZP+
         SRUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784022614; x=1784627414;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uo7ygNwGoCghLpXG4mNtPsrN3LiH45hJxobzH5eEimQ=;
        b=IJdTVbOb+QYUxbObVdrW4aeXrHU/mUHooDHT4h0d9bZgZWx8wsSZX4foGSBmOm9DUE
         AuOhqHEM3Bbkzjg3MY3q/u+l1W8TVRpFFyRAcTB+/J2kmOEhyzkSj0FAFfp7uGym3vwV
         6+q/oCMPbcBNlrZKOtxl8vmV+NaCZdnPuSe0XHMc0nyycpWQXSY2+AAGBty8Jl2iWr0O
         2t1lo0aH023cTiRpg4OUX8rAo/CFwzCRLUvu399L/jqiM7Idq+hCzKFeXkbr1J/hy/O5
         OHhVCnXfUHIBvyvPPUdgMVlS0EKCBORJxNsHWuzc4GAsfAaY6X4yjs2ETJ0Aoe4rBqge
         KO3A==
X-Forwarded-Encrypted: i=1; AHgh+RqTgFm7cIMKKyKlIRmVdOSSAO+ugRTuiHy1+SGgko9B9rLLdsx5QmHeKH32TzGajoLiIYtHtMN+K+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcpjG5Aif+cCroxsBAJAwD5Q/Ft1+kvX1FAAgnwzakNXhZwemz
	a4lkUt3VhvbTJF+pBBgwv61lC42/vSCRfUuAdTqLPyU2j/2N5zwfO5HloaDXUpuwqHqa/5Az5eG
	79o2oHtyrL/0+oSz9ojGGa/pxAhpEg6Q=
X-Gm-Gg: AfdE7cl0er8qaiur67gcRBkeWmO5Lsv9lbLMR/QdS4aNiIKUFE066Qs0MS5T3VqU+e3
	XXDYx1TgUG/bSAo/db38Sfyw5v3BJTOiCpUwWLGI2t2VVm0I14B9Q3OC8duaiId4RkHx/joEgFN
	6njGqdkN7KuZyep5lCAVG66Ap49iCvHzbP3i1/cb0kzX4TnUPoxA6AuYijFGKOwQpuJ2BASgixt
	1HcXG+hZ5meq15kr3GEGKMX5ojbSU107YKFRk5idFMq+8QMgKR5oBYpHQ7yKSqv80Ezso4LxCXo
	Mh5Huw==
X-Received: by 2002:a05:6870:3122:b0:447:8d60:21b4 with SMTP id
 586e51a60fabf-451f142cc7emr7305285fac.31.1784022614617; Tue, 14 Jul 2026
 02:50:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714093424.737303-1-shpark061104@gmail.com> <2026071448-rigor-unspoiled-1ffd@gregkh>
In-Reply-To: <2026071448-rigor-unspoiled-1ffd@gregkh>
From: =?UTF-8?B?67CV7ISg7Zi4?= <shpark061104@gmail.com>
Date: Tue, 14 Jul 2026 18:50:03 +0900
X-Gm-Features: AUfX_mz2ewNxvE3x_hwAdTJnGGxyYgPaBWAUBzX5UX2MG8az-fvzWQXbdkM95K4
Message-ID: <CAEv4s6dLzZrXEovWL6Kevqqkh2XAvidib6O-jSUSgC6W=tPxPg@mail.gmail.com>
Subject: Re: [PATCH] USB: serial: io_edgeport: cap received transmit credits
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You're right, I'll use it in v2.

Thanks,
Sunho

2026=EB=85=84 7=EC=9B=94 14=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 6:38, G=
reg Kroah-Hartman <gregkh@linuxfoundation.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=
=EC=84=B1:
>
> On Tue, Jul 14, 2026 at 06:34:24PM +0900, Sunho Park wrote:
> > The interrupt-status packet reports transmit credits returned by the
> > device. edge_interrupt_callback() adds the 16-bit value to txCredits
> > without checking maxTxCredits.
> >
> > edge_write() uses txCredits minus the software FIFO count as the amount
> > of data that fits. Since the FIFO is allocated with maxTxCredits bytes,
> > txCredits exceeding maxTxCredits can cause OOB write in ring buffer.
> >
> > Cap accumulated credits at maxTxCredits. Conforming devices should neve=
r
> > hit the cap.
> >
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > Cc: stable@vger.kernel.org
> > Assisted-by: Codex:GPT-5
> > Signed-off-by: Sunho Park <shpark061104@gmail.com>
> > ---
> >  drivers/usb/serial/io_edgeport.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/serial/io_edgeport.c b/drivers/usb/serial/io_e=
dgeport.c
> > index 34ccf7820537..503b3b5bb647 100644
> > --- a/drivers/usb/serial/io_edgeport.c
> > +++ b/drivers/usb/serial/io_edgeport.c
> > @@ -646,7 +646,10 @@ static void edge_interrupt_callback(struct urb *ur=
b)
> >                               if (edge_port && edge_port->open) {
> >                                       spin_lock_irqsave(&edge_port->ep_=
lock,
> >                                                         flags);
> > -                                     edge_port->txCredits +=3D txCredi=
ts;
> > +                                     edge_port->txCredits =3D
> > +                                             min_t(unsigned int,
>
> LLMs really love to use min_t() as they haven't been trained on modern
> kernel code.
>
> Please don't use it, it shouldn't be needed here, right?
>
> thanks,
>
> greg k-h
