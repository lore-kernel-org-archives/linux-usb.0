Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08BA13B7AE
	for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2026 01:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783300705; cv=pass; b=EJA1TNIxsC9TBDM6KR6/KDXqgc1Q2jHKwTI+PENbMzlPz9p4bIZpNrhC7ANNL7ItW6eMwc4ckbSCQdd3pxVu2RlBFh68K2OIQ9HNxvUGC/JP43XuGlattnBS0zw9Fkhr027Ep/3vBx7hZz40KrBZ35O/FnbH05KyU/xkiRDBWP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783300705; c=relaxed/simple;
	bh=eBG3n95Fye6RARoF48yKpMhQF54Rjqu3sElpJo2l/Pk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pbZrQEJCV6s3lr5fikY627Mr3n0QfgdFoVz16mJO0gNGIV3EJ7HtUhVXve/lluhvNQM/jOCam9HnM1VAqfxTrvzf8ZA4SEF0p+CJLLA0mdpsvx/xbMAvu/s2+WW3ai1DFGqTXxDQBsn5xUvs5OpdIvVOK9uLieFfsEPxC3b2pAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rYfFb0p3; arc=pass smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rYfFb0p3"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8f2509d6becso31777696d6.2
        for <linux-usb@vger.kernel.org>; Sun, 05 Jul 2026 18:18:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783300702; cv=none;
        d=google.com; s=arc-20260327;
        b=Wu32utRcKRllwCI3C1qHMHJaIh/Fq0/1jhOECjVAg/aOygIS7felcg9LzqRb/DWVjo
         QM4KiB+QWU6O4nHsMqhLA8f1Qx4c9q10cKu81TIG5e3pTEJA7m+Iw4ZGczb2adJGFudx
         K5UADa3W4HgGFElHl19k+iPtPq/Smh3AJhV+fL7XDRaxJIB6BDlUz6LLu30y4vaT5Yfh
         ZWPHDzxB519emqYTxEOq/M2+5p16tTzGcM36cem2W3rHwFkJA+F8QdWQDNGb6F5vgQvz
         /Rc+xTpz6vR1MGu8TjKXoHetu1bwGIYee13nMfqCEwIJJHcn/8WdYM40yNag9Aq02liP
         2xcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9Q/7dzmb2RbalFeqSGaqB4uD1Bc6/02dawHxYmYH+jk=;
        fh=NvoRvCUELQDV0JTFOBBbrhhe3RCW2Ug4vSW1q/AbH2E=;
        b=cA9YOaiZi05iOx7o8PieZYWBlFh282j+dMRVdN1zBBoVXSvy2Oe0Ze7YP97Yro+TpY
         TLkx1RabV+hi1GIUki3XoCXcnmS1EC3jPN7clwCgq2Za7JvaCQhv39mKcTB4dVJ5B5Sx
         mZQ9t5TKf54nXInc0P96To/mk6yUBTCUdSb7nR1wcEiQJbN92ftJ0dHdch58pSSoUCPq
         Fn9Arsu0Qkx3WUKJU/wphLPfZLu3Egtkgtsx+hjFVCizcgNmLKkQUOa7wvpgPYFYUPSe
         ys9hdtk+fvVnV+yR/igwA1lrJ6gYBKKbA1hUu5q9GmNEF06vS78+06v8aYa801WNXyy+
         bxFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783300702; x=1783905502; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Q/7dzmb2RbalFeqSGaqB4uD1Bc6/02dawHxYmYH+jk=;
        b=rYfFb0p3slf/XuH5WWT5sz1DLRlyclVRIcLM5vER/fYXNjAh6CRSKz6q468WaIHKLf
         L3SYASKLE+n14/FhZeB7KZ02IZTybr7YFRSh/iAX01U7qCA2Y7QwxGXrwQPHsPxD53z/
         dW3nvHO59wQYEZBx6OKa7VMJnt5AUcMMVDydQVs9TJ4Rn6P4HIaealHJBuxWXwnZmPKC
         519ZWWdf4wY25OjMhz9PyKndQX4/CTWofpBFY8lmVa0fjK+jHJnjPvoC4Fo93FVajP38
         Qf8N0yMaFRqwmS8f44xyWAC2D0cP6Fipi+ggaqANZCy0zV9yFHNPPXDmWHJgG0UX0B+/
         IJ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783300702; x=1783905502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Q/7dzmb2RbalFeqSGaqB4uD1Bc6/02dawHxYmYH+jk=;
        b=SkWW90BMq9+llbU5muba3wAtUV3GURFYiXYJF8U+tC/Bjsh2m5Bne2S9xbGJAX1eRI
         +B0PI+ocT6f70uFAa6b9L45ytFu1KZBIl02Aw+O+5qO4z7kI2UgQhPh4d47akFHQ7n4e
         zo3FbNKVfk9MkSRUu84qwC+yHuFpK5VSoc88jKvHYdegcEEW1bL+U7kvXcV4Sp+05W6B
         LBAmGiNixzX6jiXa/m92FOhJ/cfOhxjQiMWg3bi+8t9KbEIhnilTrMVwqq9PxzMJuKee
         3NouPfmkmAktYt3KbMPccgB54qn7sOKBdLb5Nkajw1GuSwIQJKBMoHAx8Ig8g2YP2B9j
         Ufwg==
X-Forwarded-Encrypted: i=1; AHgh+Rotqhh9yvpVwq4n1l8rJraH6VssVPLroCBlaqMGAZWFJLugaQVtfz4VHVKVDt6xuoEYhky8++1y5ek=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQOeV2F8P2uqbUk/c8mf8gB2R8OWhXSh5nv47JZAMG0cVW2F9E
	6Ikh8giGVUyzcDxput8piSfQNxMqToZynS4IX57Oh8stjf8pYHqf1kD3Z1Xt1or7vgdxgyFFClm
	E268s9UFDGcmw83seDhakknEUm3nCHXfTcjdqXO8=
X-Gm-Gg: AfdE7ck40QHMDrrIvRxVaV4vYYmbECMPkKjavKaB+vZty7JIb1q/iB8OGS4H0QdAGj4
	fdX60Hy5+xMz2j4Sm9HJwMdJ1rV1r7IDQIGvQp7qopbhqK6xJdec0mOKtqqoJZ45Baz+MJksMsk
	rNDFaXu0KjjC62HeEduv2KAGaSuccu2abtr18Xha2KGeUX8TNq68T85GcKVZ3gf78AQumwBgvf4
	6cLp0RscNABs6cg69DOxej4KxKvNaQAzcAWmFfvuTx1qjmcmGHaMAVGTFz8IIPKrH+Hmn94
X-Received: by 2002:ad4:4ee5:0:b0:8ef:ea2a:2728 with SMTP id
 6a1803df08f44-8f74a42150cmr139722286d6.19.1783300702505; Sun, 05 Jul 2026
 18:18:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFmvuTWc880R=mw7=kixfx3Yb8u9thLHPA7D=rm6a8p9dYBBDA@mail.gmail.com>
 <2d4a91dc-037f-4c31-8ce1-7bc840d42b0b@rowland.harvard.edu>
 <CAFmvuTWq7TKZaj6R9JJzWhwe1WB1FanZ17T1-TFL1g2wsUBZ4w@mail.gmail.com> <8067503d-1c0d-4319-adbd-225a03e16ea3@rowland.harvard.edu>
In-Reply-To: <8067503d-1c0d-4319-adbd-225a03e16ea3@rowland.harvard.edu>
From: =?UTF-8?B?6rmA66+87ISc?= <neck3922@gmail.com>
Date: Mon, 6 Jul 2026 10:18:11 +0900
X-Gm-Features: AVVi8CdZ6rwMNoWMTcUhXm-JqlZY0zWhuCPKJZI8UDBaQ5yLb5vPcUxKcjSf8a8
Message-ID: <CAFmvuTUEg8fr8pY91WpEk=CxHuackJfr0c2c4jxexNy9wkiS0A@mail.gmail.com>
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF in ep_aio_cancel()
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Thank you, that makes sense.

> Also, NULL checks don't fix races (cancel vs. complete).

Agreed. A NULL check alone would likely only address the repeated
NULL-deref symptom, not the stale non-NULL priv case.

> Serialization seems like the best
> solution (provided you can guarantee that it won't cause a deadlock).

That makes sense to me. Locking changes in this path could affect USB
request completion, AIO completion, and callback/deadlock interactions, so
I do not think it would be appropriate for me to send a locking patch
myself without first being confident about the deadlock implications.

> Maybe because at that point in the code there is no way to know whether
> epdata and epdata->dev are valid pointers?

Yes, I see that concern. Simply restoring the commented-out spin_lock() in
ep_aio_cancel() does not look obviously safe to me either: ep_aio_cancel()
would first have to rely on iocb->private (the priv pointer) in order to
reach epdata and epdata->dev, and holding epdata->dev->lock around
usb_ep_dequeue() could have problematic interactions with the completion
path, since ep_aio_complete() appears to use the same lock.

I can help validate candidate fixes under KASAN against the reproducer and
the intermittent UAF variant. I can also build a lockdep-enabled kernel and
run the reproducer against candidate fixes if that would be useful.

The clearest conclusion I can draw is still the lifetime invariant:
ep_aio_cancel() should not be able to use iocb->private as a
struct kiocb_priv pointer after the completion path has cleared
iocb->private or freed the underlying struct kiocb_priv. I would be happy
to test any candidate fix or approach you think would be worth trying.

Best regards,
Minseo Kim

2026=EB=85=84 7=EC=9B=94 2=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 11:22, A=
lan Stern <stern@rowland.harvard.edu>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Thu, Jul 02, 2026 at 05:08:17PM +0900, =EA=B9=80=EB=AF=BC=EC=84=9C wro=
te:
> > Hi Alan,
> >
> > Thank you for taking a look.
> >
> > I do not want to over-specify the exact fix, but my tentative view from
> > the reproducer runs and code inspection is that the key invariant is th=
at
> > struct kiocb_priv should either remain valid while it can still be reac=
hed
> > by ep_aio_cancel() for the same iocb, or it should be made unreachable =
from
> > the cancel path in a synchronized way.
> >
> > In the immediate completion path I am looking at, ep_aio_complete()
> > appears to clear fields in priv and then free priv before iocb->private=
 is
> > set to NULL and before iocb->ki_complete() runs. Meanwhile ep_aio_cance=
l()
> > reads iocb->private and immediately dereferences priv->epdata.
> >
> > That seems to explain both symptoms I observed: a NULL-deref if
> > iocb->private is already NULL, and a UAF if cancellation observes a sta=
le
> > non-NULL priv pointer.
> >
> > I may be missing some ordering guarantee in the AIO core, but from the
> > reproducer this is the window that seems relevant. So I think a NULL ch=
eck
> > in ep_aio_cancel() would likely handle the repeated NULL-deref symptom,
> > but may not address the stale non-NULL case. A safer direction might be=
 to
> > ensure sufficient serialization or lifetime ordering around iocb->priva=
te /
> > struct kiocb_priv, so that either priv remains valid for the cancel
> > callback, or cancellation is already unreachable before priv is freed f=
or
> > that iocb.
>
> Also, NULL checks don't fix races (cancel vs. complete).
>
> It's hard to make lifetime ordering work when you don't know whether the
> aio transfer will ever be cancelled.  Serialization seems like the best
> solution (provided you can guarantee that it won't cause a deadlock).
>
> However, I believe there is a valid reason why the spinlock calls in
> ep_aio_cancel() are commented out, although I don't remember what it is.
> Maybe because at that point in the code there is no way to know whether
> epdata and epdata->dev are valid pointers?
>
> Anyway, it would be good if you could figure out a solution and write a
> patch to implement it.  Perhaps a single global spinlock to protect all
> the aio pathways (or all those for a particular gadget) would work.
>
> Alan Stern
