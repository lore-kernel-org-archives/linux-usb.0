Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D3830C16D
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 18:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783968490; cv=pass; b=VEnvWYVlM2ReqbY8inTGXXUzV5jYVvCD1G5MRHpnFserbSblIDYlLbaFHh7Qsqf+nA5ueQAWiRImnllZfFopivX8p3p603+TG1I4U0MGkVfB0IrqXIF0dc6AYuDYxbBvpqk6M12sRYYXOQpWytMPZ7e3aeV3K+jicL2Ooy+IRGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783968490; c=relaxed/simple;
	bh=p2+ancBqB+/PWriZ1qeumRKh19lC4MUvhHNPFM6VebA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mk/b8EiIq0tnNE9qs5U95dSJsN7rzND7JTEjmsHTKd5kjcZSv6Uy7STCFZDAtK8H0AvfqMIuYQzBufrr19ZYzKq56q4y5XHJ8OYSmFVa7LV06hd4hTuQlMRoxB4GN1vfvPU545WeIf4s5U4AmDhH1g0Be4SLm7gu1Z0W0D1vr0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FkPieiGu; arc=pass smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FkPieiGu"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8eeadbc5e21so1325816d6.3
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 11:48:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783968488; cv=none;
        d=google.com; s=arc-20260327;
        b=N98TCsXRxInuvTOB8lM4/OKkKGU5Qm2E6fSzq5rdyuF7ui9VlTiOVH6iYs0P00Ayxk
         uQ5lv75IrKgiUihhSJJs0mJUboeeH6oaxwbu4yDXlIw6FEOoJd8TxDVu/CuY/gmMrJzD
         7pZe/G9IwOUg12f7trA0/FUnmtaDJ1VyR7aXJSyClqQEWnO+OwCFZfHOc7Kev1x1NtPm
         eMKC6h/PqBEsuZT78O+nCXs0oUSYQGK8KbsRV511Zm4Vubb50eBGf8oLcYq5VJ79SN/S
         0CwOGf2LzygGtX8cw8vaF1CY4rAVtCRZl/HcUaH5Qp5hr0VpmjYSH7eU7TPxbprg3D0T
         MqLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dbq4+zAZBqSFySomI1TvnGQ+7C7DLWx0sJgjnsAQvxo=;
        fh=siKunlVU+M/hbcNFNfnG+hn/8sCCSLI7Bpdl81vhWZQ=;
        b=FqzJSzdr0d9rX95HRRIBUtqZWdHoK20yyV6UmwYxmVxnY1hn7TGK92DFKkIayPirBT
         BcEPBwvRQf9cNxnrIzZjKy0vdY7KyWP/i433TswnqEdVUMuxCJhpvBAR8mT8lpowMH28
         7xbufFpliDYXiDq5kjeMruI2meBAnSNNzbhGrnHey9SPAdg6ONxtq0NRrQJMnd9Ct+Gv
         7JyPRv1BPx/n5HNJpQdhgD9CvDGreprz65XKXseu+c27HprDGl4Bfo037wj+EAeRH/b8
         x0JbUmp99fE1yBo/8c175kkA3RjGXpfS5ZOzwBPd1k/PxwY2uvEy0JBPOYcEB/YWsclI
         gQgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783968488; x=1784573288; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dbq4+zAZBqSFySomI1TvnGQ+7C7DLWx0sJgjnsAQvxo=;
        b=FkPieiGuxlI07qfSJeOoGHjjeXaIzPj/aa+TRu2dsGXBCUUSWFJZank0eTZBHI/fM7
         8qDSF1G6yhpVdLUFtHu+w0OWUQczj5yjXHs49DLAanGOvxhWHXc2E/lySvZZTf/oahgz
         wFUUpoQtvNaGrAdzJbL+vsTSI04+UmIx/UG1qHajSZ2GFCGSFrkUho52u3qG6Ju0NAEB
         AphsveFdYDWWCaaZPeEoo+4jX3PFUUiw4hZ6+Z/PSwLjJDpk/Vxw2o68FSOSN3Oh5s7h
         /6RH+R0H7Xdt/m0nG3CctbLDQHXTBpkFwmnSzHIDm8ywgz9WADQtE4mj3C9tmvQMx/cQ
         iMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783968488; x=1784573288;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dbq4+zAZBqSFySomI1TvnGQ+7C7DLWx0sJgjnsAQvxo=;
        b=gj6Z/gLq1I4YTGcCqOU5HGWDXykCJlyMSwzvbJ2iVsJy8g8eJPDqPBI+W6DY8nHBy9
         G0paeZ8HgRUTUCmrWehPlZn/544qW88kfs8pnlRAOeQgfMMbbc9s/7OE+UDIc9hhTaAx
         NmR8z8cJBNUtz3YQ5DnuDhBkPHP5z+DerxsQmtaIXgQp7V5F49DLMVomF5qwfHBK7kt6
         4XZTziFPHJ/FrClR2lOkWt21DjbDdcFl50xrIvhaUxmjQBDALVmTEaJ/6g2nm4LilXO0
         +5zC1BBuwHZOan/yfSayCcATUYcWPIL7Xigohf2NBs9JQgqDFa+9Xk6RW+xbCM1k5/AJ
         nzSQ==
X-Forwarded-Encrypted: i=1; AHgh+RqWJ3nXAVw/fW+F5LvBwjQY0VAyC6DosV+O9iKUqQDqBK/jBb6rtep1kRixAyajNq7VBmKrHUlrqWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvoHjfUTRG0UDZiRQJFxJfU9UMhq+ex4swELVviSi3Iv5jPzjD
	5rMDg8LHxs+s6QOmSPqhl6rBSn89UUJMbtmXptNSMcnJe4ITVkhRhz4wnnMsbpBWAgstgNhUS+m
	kIK0fM+7ZXlo4t7eCmP3hUv2qr6K1/28=
X-Gm-Gg: AfdE7cnIBvDHavpJIIM7BPCRRqieDHRzd6qWTqKfUsjZgQBAylaGtUK5N5Lrbb3ZSSD
	3FwKNrbt0wN34PBC+fZ8J361LWBP3JJa8eAxeHvFXZ6iqj0rX/ZPDLF6m07/rA59AkqzGkgn7cj
	cxeWOXhXUct9xNWzHjVkRWVlDlxDG4zAtYHTxFtiRjuqqX5xnqg50oBb+g6YlmtmOa0fkDZLk6I
	U9yMhObR1onYcBFWlCCiKWjjlZBz/vMHNGqiRNeLcNQ+zEUOl5vdT6PruwJHx/ApoaKEH+f
X-Received: by 2002:a05:6214:19e3:b0:8f2:860f:4dec with SMTP id
 6a1803df08f44-903fef4b667mr132979986d6.15.1783968488110; Mon, 13 Jul 2026
 11:48:08 -0700 (PDT)
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
 <CAFmvuTUEg8fr8pY91WpEk=CxHuackJfr0c2c4jxexNy9wkiS0A@mail.gmail.com> <a5e0e32a-7e49-4112-bcbc-92da449eb303@rowland.harvard.edu>
In-Reply-To: <a5e0e32a-7e49-4112-bcbc-92da449eb303@rowland.harvard.edu>
From: Minseo Kim <neck3922@gmail.com>
Date: Tue, 14 Jul 2026 03:47:55 +0900
X-Gm-Features: AUfX_mx3k5iU2VphYk_TDJYWLVLC7dImA982x_QA7uJF4saCtEROXkZ_taZq05k
Message-ID: <CAFmvuTXQbqbt3qxqUXitzboZhiMxAC7aaOqAtyZXs+QtJvAjBg@mail.gmail.com>
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF in ep_aio_cancel()
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Thank you very much for taking the time to prepare this patch. I applied
the patch as posted in your message to upstream v7.2-rc1, commit
dc59e4fea9d83f03bad6bddf3fa2e52491777482.

I repeatedly tested the proposed patch with the original null-ptr-deref
and UAF reproducers, as well as several reduced variants. During those
tests, I did not observe either of the original signatures.

While continuing the tests, I observed a new null-ptr-deref in
ep_aio_cancel() on the kernel with the proposed patch applied. It appears
to be associated with the initialization window in ep_aio(). Running the
reproducer without command-line arguments triggered:

  KASAN: null-ptr-deref in range [0x0000000000000028-0x000000000000002f]
  RIP: ep_aio_cancel+0xd0/0x2d0
  drivers/usb/gadget/legacy/inode.c:473

The corresponding source statement is:

  ep =3D epdata->ep;

where epdata is NULL. The faulting task has UID 1000.

One detail that may be relevant is the initialization order in ep_aio().
iocb->private is assigned and kiocb_set_cancel_fn() registers the
cancellation callback before priv->epdata is initialized. Because priv is
zero-initialized and AIO_REQ_RUNNING is the zero-valued enumerator in the
proposed patch, the state check can treat priv as RUNNING before the
explicit state assignment. The observed crash is consistent with
cancellation reaching this initialization window, because priv->epdata
was NULL at the fault.

I also ran the reproducer on a LOCKDEP-enabled build. LOCKDEP reported the
following possible circular locking dependency involving the newly added
aio_lock:

  &ctx->ctx_lock -> aio_lock -> &dev->lock#2 -> &ctx->ctx_lock

The cycle appears to arise because io_cancel() calls ep_aio_cancel() while
holding ctx->ctx_lock, and ep_aio_cancel() then acquires aio_lock. In the
other direction, the patched completion path holds aio_lock and dev->lock
while calling iocb->ki_complete(). In this path, the completion callback
is aio_complete_rw(), which can acquire ctx->ctx_lock.

The reported cycle involving aio_lock appears specific to the proposed
patch, since aio_lock is newly introduced there.

Supporting files:

  C reproducer for the new null-ptr-deref:
    https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main=
/gadgetfs_candidate_patch_validation_20260713/repro_candidate_setup_ndr.c

  Build:
    gcc -O2 -Wall -Wextra -pthread -o repro_candidate_setup_ndr
repro_candidate_setup_ndr.c

  Clean symbolized report for the new null-ptr-deref:
    https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main=
/gadgetfs_candidate_patch_validation_20260713/clean_report_candidate_setup_=
ndr.txt

  Kernel config used for the KASAN reproducer:
    https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main=
/gadgetfs_candidate_patch_validation_20260713/kernel.config.kasan_inline_dw=
arf5

  LOCKDEP report for the aio_lock cycle:
    https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main=
/gadgetfs_candidate_patch_validation_20260713/lockdep_report_aio_lock_cycle=
.txt

I wanted to share these observations in case they are useful. Please let
me know if I have misunderstood any part of the initialization or locking
sequence.

Best regards,
Minseo Kim

2026=EB=85=84 7=EC=9B=94 8=EC=9D=BC (=EC=88=98) =EC=98=A4=EC=A0=84 2:31, Al=
an Stern <stern@rowland.harvard.edu>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Mon, Jul 06, 2026 at 10:18:11AM +0900, =EA=B9=80=EB=AF=BC=EC=84=9C wro=
te:
> > I can help validate candidate fixes under KASAN against the reproducer =
and
> > the intermittent UAF variant. I can also build a lockdep-enabled kernel=
 and
> > run the reproducer against candidate fixes if that would be useful.
> >
> > The clearest conclusion I can draw is still the lifetime invariant:
> > ep_aio_cancel() should not be able to use iocb->private as a
> > struct kiocb_priv pointer after the completion path has cleared
> > iocb->private or freed the underlying struct kiocb_priv. I would be hap=
py
> > to test any candidate fix or approach you think would be worth trying.
>
> Here is a possible fix for you to test.  It's a little complicated,
> which is to be expected since this is a somewhat complicated problem.
>
> I believe it will solve the problems you are seeing but I have not tried
> using it myself.
>
> Alan Stern
>
>
> ---
>  drivers/usb/gadget/legacy/inode.c |   80 +++++++++++++++++++++++++++++--=
-------
>  1 file changed, 63 insertions(+), 17 deletions(-)
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
> @@ -443,24 +452,46 @@ struct kiocb_priv {
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
> +       spin_lock(&dev->lock);
> +       ++dev->udc_usage;
> +       spin_unlock(&dev->lock);
> +       spin_unlock_irq(&aio_lock);
> +
> +       value =3D usb_ep_dequeue(ep, priv->req);
> +
> +       spin_lock_irq(&aio_lock);
> +       if (priv->aio_state =3D=3D AIO_REQ_CANCELLING) {
> +               priv->aio_state =3D AIO_REQ_CANCELLED;
> +       } else {                /* Must be AIO_REQ_COMPLETED */
> +               usb_ep_free_request(ep, priv->req);
> +               kfree(priv);
> +       }
> +       spin_lock(&dev->lock);
> +       --dev->udc_usage;
> +       spin_unlock(&dev->lock);
>
> + Done:
> +       spin_unlock_irq(&aio_lock);
>         return value;
>  }
>
> @@ -482,7 +513,13 @@ static void ep_user_copy_worker(struct w
>
>         kfree(priv->buf);
>         kfree(priv->to_free);
> -       kfree(priv);
> +
> +       spin_lock_irq(&aio_lock);
> +       if (priv->aio_state =3D=3D AIO_REQ_CANCELLING)
> +               priv->aio_state =3D AIO_REQ_COMPLETED;
> +       else
> +               kfree(priv);
> +       spin_unlock_irq(&aio_lock);
>  }
>
>  static void ep_aio_complete(struct usb_ep *ep, struct usb_request *req)
> @@ -490,11 +527,15 @@ static void ep_aio_complete(struct usb_e
>         struct kiocb            *iocb =3D req->context;
>         struct kiocb_priv       *priv =3D iocb->private;
>         struct ep_data          *epdata =3D priv->epdata;
> +       bool                    cancelling;
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
> @@ -503,8 +544,10 @@ static void ep_aio_complete(struct usb_e
>         if (priv->to_free =3D=3D NULL || unlikely(req->actual =3D=3D 0)) =
{
>                 kfree(req->buf);
>                 kfree(priv->to_free);
> -               kfree(priv);
> -               iocb->private =3D NULL;
> +               if (cancelling)
> +                       priv->aio_state =3D AIO_REQ_COMPLETED;
> +               else
> +                       kfree(priv);
>                 iocb->ki_complete(iocb,
>                                 req->actual ? req->actual : (long)req->st=
atus);
>         } else {
> @@ -519,8 +562,10 @@ static void ep_aio_complete(struct usb_e
>                 schedule_work(&priv->work);
>         }
>
> -       usb_ep_free_request(ep, req);
> +       if (!cancelling)
> +               usb_ep_free_request(ep, req);
>         spin_unlock(&epdata->dev->lock);
> +       spin_unlock(&aio_lock);
>         put_ep(epdata);
>  }
>
> @@ -541,6 +586,7 @@ static ssize_t ep_aio(struct kiocb *iocb
>         priv->epdata =3D epdata;
>         priv->actual =3D 0;
>         priv->mm =3D current->mm; /* mm teardown waits for iocbs in exit_=
aio() */
> +       priv->aio_state =3D AIO_REQ_RUNNING;
>
>         /* each kiocb is coupled to one usb_request, but we can't
>          * allocate or submit those if the host disconnected.
