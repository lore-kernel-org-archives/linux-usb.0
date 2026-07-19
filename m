Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D0F309F08
	for <linux-usb@vger.kernel.org>; Sun, 19 Jul 2026 20:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784494772; cv=pass; b=tsaaICgoAyfY6as1cYlnb2Q0TrG6zybxYya3mciM0u88r6VMzPwwNxaaRfAuTo7regH4YYv5gL2WR+JElMytHlAsAPB5RRFPVIs6gGN9cgAhrVdYTWHldVVVs9JrD4XMDo8ewxk+5D/Zo1uAT6uP/T7j/104DphvQQhWmRmmfag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784494772; c=relaxed/simple;
	bh=kuk1yElYsMwPw4H4GxAwKjeHBrnyfrlKRreqq0OdCDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HbS5CyvZS42t04KrBicuskfA+iwhFIqUpp8SdrA4YczScrTh3WSZZO7b+mZVQ36S94b5LdxhR4ABWWrWtJbPQMCoM0jGW1b2wwqDuM/efnOWSXjbtPnJIDfGxUtFD9WuTIuOTscsKtwQZGjae7IYFkDHKCSohmi0dem5qkbLJPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vpsr2uWX; arc=pass smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vpsr2uWX"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8efb708b1a0so91921986d6.3
        for <linux-usb@vger.kernel.org>; Sun, 19 Jul 2026 13:59:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784494769; cv=none;
        d=google.com; s=arc-20260327;
        b=EE7VLEKIraHEtQ1ymqNjOJgmEpiFJIssYShb8NFXdienT9jRU61BDrQz3C7Cwnmckl
         O6nho6C8uPctkLi7GaVdamwArBk1U5lcWuX309bjqz3ByqGSBAW1UVzPn+sm3+jc/bAz
         zGH/YXDXaR/x/fffxTo0HuF7LXwTtBGjp907MNN6TqYFmd7dg1w08/xG+t1rrUaeF1xH
         1ZD2/d8R8aceXVD+T75Jlxv+/vu9PIJ1efuung7YsQNktspcxz1itVCgV3Nnd+//JFDf
         mzUhqpD0jzbFnsyxhhb1zSfWFJGGja2E8HMTo+CbxXTYCw9ufH9bea+Zr6j282JmwDOP
         sWSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m7BkNppdWyn2WjcFabhIKlgZJNNIKfvHcbs8JgcSDQE=;
        fh=cO0T/FuKj+UqT2nQekJWBpS28mUc2g/0TZ99RLhrUTM=;
        b=qMPvfX9ze67VzTVF40vQqcf8rp8r3mWijeTcUYxDezyEQ798RatwxBytjNsbpILuVd
         Tj6Ae0qng5jWhzx8Dw5pNlnQPz3AmDGOKT7vczNqstFPmaDwGOFHgEd3MU2mRZ0hTK7k
         D+nHQvpHxrHeL6VZwCp3Q5vzk+UnBFv7I+UC2WyDy/fhTMddtbuMq9d5xlEBh6bfB0Q4
         JdjjJSKGH1QmP2mCevcNuWaBQ4dsp0GFo7iYrC8ZwqDi4x47BQ0toYo085mQg6QRJCDU
         6AlMa5djFOSeCC6LuOmFYYl96m57ismlGY3Qi7RJiPskMSyktfRpwzvazvGAHOWxfy3S
         LIiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784494769; x=1785099569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m7BkNppdWyn2WjcFabhIKlgZJNNIKfvHcbs8JgcSDQE=;
        b=Vpsr2uWX0dWDH9zXLud7gqgRESve1IObS7UcC3rCROR3KUMDyY96lmTXEw0a/5s3vs
         7ULFz5lqawnSb/cXT74qHmb4bcy4guI/4hzJd1ZOP39rhteuSJOEme0zZtDpzH2oEbnt
         qfwqHfmS5Cgf9lGDaFT5jloTTxisDEkj4RW47J4ibTGG0nnIULOfhKmn6KGtUbfVF0XF
         1f5S5XUqzj4Aw1sihxz0JZv+T8qC02XuhooQ5Y+IJIE/ACCIslXIs1iHNC/g8uLS5dm7
         OWDZov4NkIpJ5aW1iI6zx9gW5PYmH+Y528aizz9MGKNOXBoKVLuN5XU/zNxB+HvyHWlo
         lD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784494769; x=1785099569;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m7BkNppdWyn2WjcFabhIKlgZJNNIKfvHcbs8JgcSDQE=;
        b=s6F8LEs38rfIfPwjpR2lc8OnBsa76Igz9D1QX84ufFe3knrZWA0kxAvWMxtFdL2rqm
         t6azX3NdRWnZJyzuGHOyiHXgizyVQJdI1lpflquFgD0Hn28XT09KwrLeoZhlBFymWiE4
         Ku5Xa0BDiKhLso76jgC+hnoyafAEzzIwf1YyhFW/FYg4tCUxnthSyLdObCM+7qTymTRT
         G4t67AI1v7WGF9vs/2XTIFV8Mjjkz7zP1WFPhT2ssFmL+rqXHMpZ7xyPUiUfGxEOrpwJ
         2HOQLwPWNmuIxW2+7615jhArc5/ifCJKrXqRoOCpi4Bjx7jpHh5iFQJuSyPV80udg0qX
         dEWQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr5NUnSwcjLDdK3pF9D5kW9nXz6ssUoIeJpxXLNn/iLIfhRNpu8F9y59nSfVER7LXTj6s56JvlqI00=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhTg+yFgpSy1WNN0rWHv3xc+IDtTvmsgQ+/zlytTzoQxOJjFXB
	y0H4PwrNM+mba2vebi7bwmkIq+3iBUQaMNzMPmoJUyvK97iR0QSYADHgFaJAYZg7JyVcOUb46KQ
	TKlSKwyTZefpbBr2dIZaBu5CZmBQdgVo=
X-Gm-Gg: AfdE7ckyAspwC20KPfuDhemKrImNHqFRMY2I1xeS772FRvTFjvR4XTK9rRrVzNS7r5W
	Y/wJf/XwR4xOQCIzz/fMX2+XdLHHIaRkqSEqfm0Ggqr7XCB4UcU6KzCpZGIy/oT36U3CUiJl+ts
	rDafGs3iRIDjIm1cLhkirDontNgiVKZabPHe5/J9Dz1J958w7A6xLubL0w4LnOmabXAxGidegqv
	ru+f4VbsHcdXXimccTv5gC+++eIoPFjW5rfgnc4NLlhraqquWXov9d+gaRO0ZhG1Pwh8r2e
X-Received: by 2002:a05:6214:5d0b:b0:8f3:469e:5051 with SMTP id
 6a1803df08f44-90778358215mr123343676d6.18.1784494769387; Sun, 19 Jul 2026
 13:59:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFmvuTWc880R=mw7=kixfx3Yb8u9thLHPA7D=rm6a8p9dYBBDA@mail.gmail.com>
 <2d4a91dc-037f-4c31-8ce1-7bc840d42b0b@rowland.harvard.edu>
 <CAFmvuTWq7TKZaj6R9JJzWhwe1WB1FanZ17T1-TFL1g2wsUBZ4w@mail.gmail.com>
 <8067503d-1c0d-4319-adbd-225a03e16ea3@rowland.harvard.edu>
 <CAFmvuTUEg8fr8pY91WpEk=CxHuackJfr0c2c4jxexNy9wkiS0A@mail.gmail.com>
 <a5e0e32a-7e49-4112-bcbc-92da449eb303@rowland.harvard.edu>
 <CAFmvuTXQbqbt3qxqUXitzboZhiMxAC7aaOqAtyZXs+QtJvAjBg@mail.gmail.com> <a7f9d958-7f9d-40eb-89ea-56094f60c075@rowland.harvard.edu>
In-Reply-To: <a7f9d958-7f9d-40eb-89ea-56094f60c075@rowland.harvard.edu>
From: Minseo Kim <neck3922@gmail.com>
Date: Mon, 20 Jul 2026 05:59:19 +0900
X-Gm-Features: AUfX_mxuIkyj7W06UsZDhzOtrJ2UYg7SBaxxkt6UIhCgiw8MsN3Kbctaamm37f4
Message-ID: <CAFmvuTXx6bOEEusjf=bw5c-RDVu-bzRLbd_RVnhn2tLe4n4upQ@mail.gmail.com>
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF in ep_aio_cancel()
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Thank you for the revised patch and for your kind feedback on my
analysis. I applied the patch to upstream v7.2-rc1, commit
dc59e4fea9d83f03bad6bddf3fa2e52491777482.

Regarding cancellation before ep_aio() returns, the reproducer I used
for that test has separate submit and cancel threads. After
kiocb_set_cancel_fn() links the corresponding aio_kiocb into
ctx->active_reqs and releases ctx->ctx_lock, the cancel thread can find
it and call ep_aio_cancel() before the submit thread returns from
ep_aio(). The synchronous reference retained by the submission path is
not dropped by io_submit_one() until after ep_aio() returns, so the
aio_kiocb remains alive during this interval.

With the revised patch, I did not observe the earlier setup-time
null-ptr-deref or the original ep_aio_cancel() null-ptr-deref and UAF
signatures.

However, with kiocb_set_cancel_fn() moved after usb_ep_queue(), I
observed a different UAF:

  BUG: KASAN: slab-use-after-free in kiocb_set_cancel_fn
  Write of size 8 in list_add_tail() at fs/aio.c:658

After the request is queued by usb_ep_queue(), its completion callback
can run before the iocb is added to active_reqs. In that ordering,
aio_complete_rw() sees an empty ki_list, skips aio_remove_iocb(), and
drops the asynchronous reference. ep_aio() subsequently links the
completed iocb into active_reqs. When io_submit_one() drops the
synchronous reference, the aio_kiocb can be freed while still linked. A
later active-list operation can then access the stale entry; the first
KASAN-detected invalid access occurred in list_add_tail() during a
subsequent kiocb_set_cancel_fn() call.

This UAF was repeatedly observed with the revised patch and was not
observed in matched runs on the unpatched kernel using the same
reproducer, workload, and timing settings.

Although the direct aio_lock-to-ctx_lock nesting was removed from the
completion path, LOCKDEP still reported the following transitive cycle:

  &ctx->ctx_lock -> aio_lock -> &dev->lock#2 -> &ctx->ctx_lock

In the immediate-completion branch, ep_aio_complete() acquires
dev->lock while holding aio_lock and later calls iocb->ki_complete()
while dev->lock remains held. If the iocb is still linked in
ctx->active_reqs, aio_complete_rw() calls aio_remove_iocb(), which
acquires ctx->ctx_lock. This preserves the
aio_lock -> dev->lock -> ctx_lock dependency, while io_cancel() supplies
the ctx_lock -> aio_lock edge.

I also exercised the unbind window you mentioned. Using
pointer-correlated tracing, I observed usb_ep_dequeue() from
ep_aio_cancel() for a given usb_request overlapping usb_ep_disable() in
the gadgetfs_unbind() path on that request's endpoint. In those
lineages, ep_aio_complete() and ep_user_copy_worker() also ran for the
same priv and usb_request. Neither those overlaps nor probe-disabled
runs covering the same timing ranges produced KASAN or an Oops. This
does not rule out an unbind-related failure at other timings; I did not
reproduce the suspected UAF in the timing ranges I tested.

Supporting files:

  C reproducer for the post-queue registration UAF:
    https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main=
/gadgetfs_candidate_patch_v2_validation_20260715/repro_v2_postqueue_uaf.c

  Build:
    gcc -O2 -Wall -Wextra -pthread -o repro_v2_postqueue_uaf \
      repro_v2_postqueue_uaf.c

  Symbolized KASAN report for the post-queue registration UAF:
    https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main=
/gadgetfs_candidate_patch_v2_validation_20260715/symbolized_report_v2_postq=
ueue_uaf.txt

  Kernel config for the KASAN reproducer:
    https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main=
/gadgetfs_candidate_patch_v2_validation_20260715/kernel.config.v7.2-rc1-can=
didate-v2-kasan-inline-dwarf5

  LOCKDEP report for the remaining transitive cycle:
    https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main=
/gadgetfs_candidate_patch_v2_validation_20260715/lockdep_v2_exact_cycle.txt

I hope this information is useful.

Best regards,
Minseo Kim

2026=EB=85=84 7=EC=9B=94 14=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 12:23, =
Alan Stern <stern@rowland.harvard.edu>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
>
> On Tue, Jul 14, 2026 at 03:47:55AM +0900, Minseo Kim wrote:
> > Hi Alan,
> >
> > Thank you very much for taking the time to prepare this patch. I applie=
d
> > the patch as posted in your message to upstream v7.2-rc1, commit
> > dc59e4fea9d83f03bad6bddf3fa2e52491777482.
> >
> > I repeatedly tested the proposed patch with the original null-ptr-deref
> > and UAF reproducers, as well as several reduced variants. During those
> > tests, I did not observe either of the original signatures.
>
> That's good progress.
>
> > While continuing the tests, I observed a new null-ptr-deref in
> > ep_aio_cancel() on the kernel with the proposed patch applied. It appea=
rs
> > to be associated with the initialization window in ep_aio(). Running th=
e
> > reproducer without command-line arguments triggered:
> >
> >   KASAN: null-ptr-deref in range [0x0000000000000028-0x000000000000002f=
]
> >   RIP: ep_aio_cancel+0xd0/0x2d0
> >   drivers/usb/gadget/legacy/inode.c:473
> >
> > The corresponding source statement is:
> >
> >   ep =3D epdata->ep;
> >
> > where epdata is NULL. The faulting task has UID 1000.
> >
> > One detail that may be relevant is the initialization order in ep_aio()=
.
> > iocb->private is assigned and kiocb_set_cancel_fn() registers the
> > cancellation callback before priv->epdata is initialized. Because priv =
is
> > zero-initialized and AIO_REQ_RUNNING is the zero-valued enumerator in t=
he
> > proposed patch, the state check can treat priv as RUNNING before the
> > explicit state assignment. The observed crash is consistent with
> > cancellation reaching this initialization window, because priv->epdata
> > was NULL at the fault.
>
> In the patch below, I moved the kiocb_set_cancel_fn() call down to after
> all the other initialization.  That ought to take care of the problem.
> But I admit, I don't understand how the I/O can be cancelled before
> ep_aio() returns.
>
> > I also ran the reproducer on a LOCKDEP-enabled build. LOCKDEP reported =
the
> > following possible circular locking dependency involving the newly adde=
d
> > aio_lock:
> >
> >   &ctx->ctx_lock -> aio_lock -> &dev->lock#2 -> &ctx->ctx_lock
> >
> > The cycle appears to arise because io_cancel() calls ep_aio_cancel() wh=
ile
> > holding ctx->ctx_lock, and ep_aio_cancel() then acquires aio_lock. In t=
he
> > other direction, the patched completion path holds aio_lock and dev->lo=
ck
> > while calling iocb->ki_complete(). In this path, the completion callbac=
k
> > is aio_complete_rw(), which can acquire ctx->ctx_lock.
> >
> > The reported cycle involving aio_lock appears specific to the proposed
> > patch, since aio_lock is newly introduced there.
>
> In the new patch I removed the dev->lock accesses in ep_aio_cancel() and
> moved the iocb->ko_complete() call outside the scope of aio_lock in
> ep_aio_complete().  This should break the locking cycles.
>
> There's still a potential race: unbind against ep_aio_cancel or
> ep_user_copy_work.  That would be a difficult race to trigger; you'd
> have to unbind the gadgetfs driver just as an aio request was
> completing or being cancelled.
>
> > I wanted to share these observations in case they are useful. Please le=
t
> > me know if I have misunderstood any part of the initialization or locki=
ng
> > sequence.
>
> No, I think you've done a great job of assimilating this complex
> information.  Let me know how the new patch works out.
>
> Alan Stern
>
>
> ---
>  drivers/usb/gadget/legacy/inode.c |   92 +++++++++++++++++++++++++++++--=
-------
>  1 file changed, 72 insertions(+), 20 deletions(-)
>
> Index: usb-devel/drivers/usb/gadget/legacy/inode.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- usb-devel.orig/drivers/usb/gadget/legacy/inode.c
> +++ usb-devel/drivers/usb/gadget/legacy/inode.c
> @@ -236,6 +236,8 @@ static void put_ep (struct ep_data *data
>  static const char *CHIP;
>  static DEFINE_MUTEX(sb_mutex);         /* Serialize superblock operation=
s */
>
> +static DEFINE_SPINLOCK(aio_lock);      /* Protect aio cancellation info =
*/
> +
>  /*----------------------------------------------------------------------=
*/
>
>  /* NOTE:  don't use dev_printk calls before binding to the gadget
> @@ -433,6 +435,13 @@ static long ep_ioctl(struct file *fd, un
>
>  /* ASYNCHRONOUS ENDPOINT I/O OPERATIONS (bulk/intr/iso) */
>
> +enum aio_req_state {
> +       AIO_REQ_RUNNING,
> +       AIO_REQ_CANCELLING,
> +       AIO_REQ_CANCELLED,
> +       AIO_REQ_COMPLETED,
> +};
> +
>  struct kiocb_priv {
>         struct usb_request      *req;
>         struct ep_data          *epdata;
> @@ -443,24 +452,48 @@ struct kiocb_priv {
>         struct iov_iter         to;
>         const void              *to_free;
>         unsigned                actual;
> +       enum aio_req_state      aio_state;
>  };
>
>  static int ep_aio_cancel(struct kiocb *iocb)
>  {
> -       struct kiocb_priv       *priv =3D iocb->private;
> +       struct kiocb_priv       *priv;
>         struct ep_data          *epdata;
> -       int                     value;
> +       struct usb_ep           *ep;
> +       struct dev_data         *dev;
> +       int                     value =3D -EINVAL;
> +
> +       spin_lock_irq(&aio_lock);
> +       priv =3D iocb->private;
> +       if (!priv || priv->aio_state !=3D AIO_REQ_RUNNING)
> +               goto Done;      /* Already completed or cancelled */
>
> -       local_irq_disable();
> +       priv->aio_state =3D AIO_REQ_CANCELLING;
>         epdata =3D priv->epdata;
> -       // spin_lock(&epdata->dev->lock);
> -       if (likely(epdata && epdata->ep && priv->req))
> -               value =3D usb_ep_dequeue (epdata->ep, priv->req);
> -       else
> -               value =3D -EINVAL;
> -       // spin_unlock(&epdata->dev->lock);
> -       local_irq_enable();
> +       ep =3D epdata->ep;
> +       dev =3D epdata->dev;
> +       spin_unlock_irq(&aio_lock);
> +
> +       value =3D usb_ep_dequeue(ep, priv->req);
> +
> +       /*
> +        * priv->req is freed by the first stage of completion or the
> +        * second stage of cancellation, whichever is last.
> +        * priv itself is freed by the final stage of completion or
> +        * the second stage of cancellation, whichever is last.
> +        */
> +       spin_lock_irq(&aio_lock);
> +       if (priv->aio_state =3D=3D AIO_REQ_CANCELLING) {
> +               /* Completion is not yet finished */
> +               priv->aio_state =3D AIO_REQ_CANCELLED;
> +       } else {
> +               /* Must be AIO_REQ_COMPLETED so completion is finished */
> +               usb_ep_free_request(ep, priv->req);
> +               kfree(priv);
> +       }
>
> + Done:
> +       spin_unlock_irq(&aio_lock);
>         return value;
>  }
>
> @@ -482,7 +515,13 @@ static void ep_user_copy_worker(struct w
>
>         kfree(priv->buf);
>         kfree(priv->to_free);
> -       kfree(priv);
> +
> +       spin_lock_irq(&aio_lock);
> +       if (priv->aio_state =3D=3D AIO_REQ_CANCELLING)
> +               priv->aio_state =3D AIO_REQ_COMPLETED;
> +       else
> +               kfree(priv);    /* Not cancelled or cancellation is finis=
hed */
> +       spin_unlock_irq(&aio_lock);
>  }
>
>  static void ep_aio_complete(struct usb_ep *ep, struct usb_request *req)
> @@ -490,11 +529,16 @@ static void ep_aio_complete(struct usb_e
>         struct kiocb            *iocb =3D req->context;
>         struct kiocb_priv       *priv =3D iocb->private;
>         struct ep_data          *epdata =3D priv->epdata;
> +       bool                    cancelling;
> +       size_t                  ret;
> +
> +       /* lock against cancellation */
> +       spin_lock(&aio_lock);
> +       cancelling =3D (priv->aio_state =3D=3D AIO_REQ_CANCELLING);
>
> -       /* lock against disconnect (and ideally, cancel) */
> +       /* lock against unbind */
>         spin_lock(&epdata->dev->lock);
> -       priv->req =3D NULL;
> -       priv->epdata =3D NULL;
> +       iocb->private =3D NULL;           /* Prevent future cancellation =
*/
>
>         /* if this was a write or a read returning no data then we
>          * don't need to copy anything to userspace, so we can
> @@ -503,11 +547,17 @@ static void ep_aio_complete(struct usb_e
>         if (priv->to_free =3D=3D NULL || unlikely(req->actual =3D=3D 0)) =
{
>                 kfree(req->buf);
>                 kfree(priv->to_free);
> -               kfree(priv);
> -               iocb->private =3D NULL;
> -               iocb->ki_complete(iocb,
> -                               req->actual ? req->actual : (long)req->st=
atus);
> +               if (cancelling) /* Cancellation started, not yet finished=
 */
> +                       priv->aio_state =3D AIO_REQ_COMPLETED;
> +               else            /* Not cancelled or cancellation is finis=
hed */
> +                       kfree(priv);
> +               ret =3D req->actual;
> +               if (ret =3D=3D 0)
> +                       ret =3D req->status;
> +               spin_unlock(&aio_lock);         /* Cancel now may free re=
q */
> +               iocb->ki_complete(iocb, ret);
>         } else {
> +               spin_unlock(&aio_lock);
>                 /* ep_copy_to_user() won't report both; we hide some faul=
ts */
>                 if (unlikely(0 !=3D req->status))
>                         DBG(epdata->dev, "%s fault %d len %d\n",
> @@ -519,7 +569,8 @@ static void ep_aio_complete(struct usb_e
>                 schedule_work(&priv->work);
>         }
>
> -       usb_ep_free_request(ep, req);
> +       if (!cancelling)        /* Not cancelled or cancellation is finis=
hed */
> +               usb_ep_free_request(ep, req);
>         spin_unlock(&epdata->dev->lock);
>         put_ep(epdata);
>  }
> @@ -536,11 +587,11 @@ static ssize_t ep_aio(struct kiocb *iocb
>         iocb->private =3D priv;
>         priv->iocb =3D iocb;
>
> -       kiocb_set_cancel_fn(iocb, ep_aio_cancel);
>         get_ep(epdata);
>         priv->epdata =3D epdata;
>         priv->actual =3D 0;
>         priv->mm =3D current->mm; /* mm teardown waits for iocbs in exit_=
aio() */
> +       priv->aio_state =3D AIO_REQ_RUNNING;
>
>         /* each kiocb is coupled to one usb_request, but we can't
>          * allocate or submit those if the host disconnected.
> @@ -566,6 +617,7 @@ static ssize_t ep_aio(struct kiocb *iocb
>                 goto fail;
>         }
>         spin_unlock_irq(&epdata->dev->lock);
> +       kiocb_set_cancel_fn(iocb, ep_aio_cancel);
>         return -EIOCBQUEUED;
>
>  fail:
