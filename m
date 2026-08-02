Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD152737F8
	for <linux-usb@vger.kernel.org>; Sun,  2 Aug 2026 06:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785650905; cv=pass; b=ECRDVhUSb5GXEpeI+hGdlCFWy/C1aPSJOI3dYxWwT6nuSqdWCbP5zE4HMHPbSpabuBmmMwxPQ6hFRAqZKGEIOJPaPOiyfbao3+hax971dKH+4jnVaFjGKsCv+9+9GFYe8A9v4c5e57z6flDss1Kuym8LyXiHIvaNpBPidF2NbTw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785650905; c=relaxed/simple;
	bh=Kf17WANs6JfhL1xqclAYA1dpuPciti323x4GqPklwSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J6bPnuwMgKm7CPEZFUnKwWxgXdfT7Iylbu4cAclTl28sQFBA7vkKobLEatg2EcPDEGdpn1nnT4vqbgb005yYvHJTuqMrntYwlK9wYoL78ahM+SjMqM4oxngfrhD4wWbCnmTnQ1qGC7yKUmZficG6mOVRqZE+zOxlFDGso6LsG3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h0DgXYnA; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h0DgXYnA"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-51c2149571dso21151251cf.3
        for <linux-usb@vger.kernel.org>; Sat, 01 Aug 2026 23:08:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785650903; cv=none;
        d=google.com; s=arc-20260327;
        b=Pv+4GocOSr/qam783nFPNERhQ9jrK9FI9Ecx4AUFENcl8YlqMAurBEL5xZtHavWI8y
         +D9F+kfpfPuF32Ky6sd6oEPGPeRjiSK/PcvSHJM7AONmNQQzwfA9EXEbxxqxFXu/XaPD
         bK/5Y2a1vrKYwEfSP1kTjjjmXYWUVS6dgn7OwkOCbKLG/YEn1TUMD46ETHJokink6ZMt
         agMywAnA7cJna/HCxnFSe9/EZeyJ9oxDXLL+TWsMdXQJ90Q4axmoeOcQIcUg2xXVp17o
         tiKBHyAtEVepiU6oLjMDi6yLVyWo9xj26GwZg63rEjQmR4TpOcKE7T8RVcZ11UxWHK+H
         RTEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CetZ3P9aPepyqJKQ2nK4mmdcMjZOCOyFw6y06lUHTEI=;
        fh=ehwrrNQqLx3weruk7Lgxkk9jD+XY3Sv8ZiUPaKjqYxQ=;
        b=I3cGe5VxDX5cFe37Z4FfdjdP5m7/7fy7Oy3VkSVMaf2NxnFsR0Syvph58cW9o/88QS
         Ard0RVeiwzNb//WsFWTqOrRDQAuH+15J77WpIJsuF6MvpgtJLecTkQ57XUKH+uJjqRJd
         sGb1E/QO4SCHl/fA+Nd8p0iym7fsJXpXVbXbIhZPVQR43p3vXJU7jaYhZTyhO11pF3CR
         r9kCoVwfKJg5h0TM6tfrsEtye4gJLfquAF5mvuzVClHDNX3zeQtR9l9k6CubFKAKdvGw
         dOJBqXHX6kVXj+wsKyF0PITsd9KRdcESE1Y5wRnqh0ucYYqC7nbboJOPwQreOl+TnShr
         lY6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785650903; x=1786255703; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CetZ3P9aPepyqJKQ2nK4mmdcMjZOCOyFw6y06lUHTEI=;
        b=h0DgXYnAYmRt0tPADMYuNU3ETlk4Fl7igGwr8q+jo5ZmXCOFKyO86lqEPpowRrP+Ch
         dAEtCpmIUgroGjTF8mCMDtQ9Zka4e5mk6XmhakpY7SGEZoLvqMLOMt6ZuhDMakV0YScz
         l/i1cpTxrNyzo7VLUXAGjK8xekL1yaonnQ6mXtQ6ebjHagveCxLHGhA5yNTwBpupUly2
         WR3eGFiMNR4NTyAshmWrSq1YHrb1OyXlKVAk6OJZ4U3/KU2i1zc1y5Z0tp8vDMbNom4e
         dVSzv6jN38BUeULsi3uUKROuvnzwST3kCyODopOkrHeSSqZt6xWYwhpNSRLS+3+y2n1w
         0P2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785650903; x=1786255703;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CetZ3P9aPepyqJKQ2nK4mmdcMjZOCOyFw6y06lUHTEI=;
        b=BcuMj7HCTocoRvjU9VNkh5cVGEW+2sg2CPtEMTRs9uTkx/2xQyQOgoTa3A9cApyEtK
         lXMglTrskUDVHKw1+HBa2T2YfwGKmKqyziFQOrFCJdVO9RbgTmnQAIgzen9EH6i7acgX
         26xqgiYqMy6q+Heuiu5iDQH6GtYW+EzxacoHCiLcniEMbz4eQ/GZfF9avZl+3TX0aQ7W
         V7i1AIf84YSmUZrNF0WgwB0IJOEWPf7uW0sVzw6QZsvNyD5ADlbOmDf5+BFahV/Gna3q
         vK965QRFOk4/uP56dzAkASJyKIOMR8D/vVPWZjsIrlafqHxcsixNaMKjhIjHBMxkfgxv
         uuIw==
X-Forwarded-Encrypted: i=1; AHgh+RqdljABPwPKg/41y90cdniOoPIXpxpIS6TExQ+F66rw4xc7zdkq263S9IeQmX6Cx/G7tw7YVELvGck=@vger.kernel.org
X-Gm-Message-State: AOJu0YzymRgnSrNgkiiSOqucZbWNvwfqkiSGnhK6Gj187KV4zT7JBccr
	F/Ay895dSLhcdFa5Bj4EJBIb4dGUnycYZxVXDozPU0E0IzysFHncavEhXy/OJNo8qq9YUEvB/3u
	PAeByo8DSbTM4CrUfya5OfG+CFwPTbAcoZFFU
X-Gm-Gg: AR+sD11zeqB32BJ2RMhSqy6mBCcJbnl80LA60IL5W8ECoXswsYg5jXuO4Z/OBtajiS4
	PgPuBHXa6kRMbooNHl5zv7fWcxNQzYMLnR0kmCdIXSphYlsWjMjlV+Ks0d8fGP1flBSyBM84trN
	BSYwHm0G4wArtVGjpOoA4+TXETobWbRAd771xdqCXJC1RaY9hPl2yPcM1XVAzSEsg6hj+wXlQeU
	hxojtOMxaEMojOGr3s/GfcDd1fIWwGkbhjwNkL5IE0M5BNNmN5R6dlQ1EvLPUJ9gCrmag3rFy5t
	2RmSsm8aXtQWPyAi1eNfQL+N+a/KTdk42/a+nRpS+vKqzb07jsKMXcGt
X-Received: by 2002:a05:622a:4d8f:b0:51c:1568:3a53 with SMTP id
 d75a77b69052e-52b566af242mr121956511cf.16.1785650902696; Sat, 01 Aug 2026
 23:08:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFmvuTWq7TKZaj6R9JJzWhwe1WB1FanZ17T1-TFL1g2wsUBZ4w@mail.gmail.com>
 <8067503d-1c0d-4319-adbd-225a03e16ea3@rowland.harvard.edu>
 <CAFmvuTUEg8fr8pY91WpEk=CxHuackJfr0c2c4jxexNy9wkiS0A@mail.gmail.com>
 <a5e0e32a-7e49-4112-bcbc-92da449eb303@rowland.harvard.edu>
 <CAFmvuTXQbqbt3qxqUXitzboZhiMxAC7aaOqAtyZXs+QtJvAjBg@mail.gmail.com>
 <a7f9d958-7f9d-40eb-89ea-56094f60c075@rowland.harvard.edu>
 <CAFmvuTXx6bOEEusjf=bw5c-RDVu-bzRLbd_RVnhn2tLe4n4upQ@mail.gmail.com>
 <887e75d3-dd11-4d98-b6e6-5f6a2c3a6ae8@rowland.harvard.edu>
 <e05c6ba1-48f9-49e7-9d56-25db41e70f6e@rowland.harvard.edu>
 <CAFmvuTVYt2bVaqcyJVUSvNZfss6yzVdPbA5Wk2dtr89w2tz+5w@mail.gmail.com> <483692a4-8fb7-419e-90d5-1784b71fbb9f@rowland.harvard.edu>
In-Reply-To: <483692a4-8fb7-419e-90d5-1784b71fbb9f@rowland.harvard.edu>
From: Minseo Kim <neck3922@gmail.com>
Date: Sun, 2 Aug 2026 15:08:11 +0900
X-Gm-Features: AUfX_mwFrZQjyqSvzEr7J2gSBiXjMgiseXAleDJX9urKsR1oN0LWsgSXorJjKqA
Message-ID: <CAFmvuTXvwuUrfbvsAQ_VvC9jH5iS62J+Ei23TD0NfQ_igFRJ_A@mail.gmail.com>
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF in ep_aio_cancel()
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Thank you for the new patch. I applied it as posted to upstream v7.2-rc1,
commit dc59e4fea9d83f03bad6bddf3fa2e52491777482.

Across the timing ranges I tested, I did not reproduce the originally
reported ep_aio_cancel() stale-priv failure on the kernel with the new
patch applied. In a targeted diagnostic comparison, the original
ep_aio_cancel() UAF was reproduced on the unpatched kernel. Using the
same kernel configuration, reproducer, and arguments, the diagnostic
runs on the patched kernel produced no KASAN or Oops. I also did not
observe the original null-ptr-deref or UAF signatures in non-diagnostic
runs of the patched kernel.

However, I observed a different slab-use-after-free in ep_aio() on the
patched kernel:

  BUG: KASAN: slab-use-after-free in ep_aio+0x573/0x660
  Read of size 4
  drivers/usb/gadget/legacy/inode.c:647

This UAF was repeatedly reproduced on the patched kernel. It was not
observed in control runs on the unpatched kernel using the same kernel
configuration, reproducer, workload, and timing settings.

The ordering appears to be:

1. ep_aio() registers cancellation and successfully queues the USB request.
2. ep_aio() releases epdata->dev->lock before acquiring aio_lock.
3. ep_aio_complete() can run the immediate-completion branch, clear
   iocb->private, call iocb->ki_complete(), set priv->req_state to
   AIO_GIVEN_BACK, observe that cancel_state is not AIO_UNLINKING, and
   reach the path that frees priv.
4. ep_aio() then acquires aio_lock and reads priv->req_state at line 647.

Thus aio_lock serializes the post-queue state check and update, but it
does not keep priv alive until ep_aio() has finished that transition.
This is not the original ep_aio_cancel() stale-pointer window. The
observed UAF and the code ordering are consistent with ep_aio()
dereferencing priv after the completion path has freed it.

This suggests that the submitting path may need an additional lifetime
handoff. Either priv must remain alive until ep_aio() has finished its
post-queue work, or ep_aio() must no longer access priv after the point at
which the completion path may free it.

In diagnostic runs, I also tested cancellation while the request was in
AIO_SUBMITTING. In the queue-success ordering, I observed one completion
event with res=3D-ECONNRESET; in the forced queue-failure ordering, one
event with res=3D-EINVAL. Neither case produced KASAN or an Oops.

I also rechecked the potential unbind race you mentioned earlier. Using
pointer-correlated tracing on the patched build, I observed an
ep_aio_cancel() operation overlapping the gadgetfs_unbind() path while
that path called usb_ep_disable() on the request's endpoint. The
ep_aio_cancel() entry and ep_aio_complete() records referred to the same
iocb, priv, and usb_request, and the corresponding usb_ep_dequeue()
record referred to that same usb_request and endpoint.
ep_user_copy_worker() also ran for the same priv while gadgetfs_unbind()
was still in progress.

Corresponding runs with the probes disabled, using the same delay settings
as the traced runs, produced no KASAN or Oops.

Supporting files:

  C reproducer for the ep_aio() post-queue UAF on the patched kernel:
    https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main=
/gadgetfs_candidate_v3_validation_20260802/repro_v3_ep_aio_postqueue_uaf.c

  Build:
    gcc -O2 -Wall -Wextra -pthread -o repro_v3_ep_aio_postqueue_uaf \
      repro_v3_ep_aio_postqueue_uaf.c

  Symbolized KASAN report:
    https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main=
/gadgetfs_candidate_v3_validation_20260802/symbolized_report_v3_ep_aio_post=
queue_uaf_unified.txt

  Kernel config used for the post-queue UAF reproducer and unpatched
  control runs:
    https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main=
/gadgetfs_candidate_v3_validation_20260802/kernel.config.v7.2-rc1-candidate=
-v3-unified

I hope these results are useful.

Best regards,
Minseo Kim

2026=EB=85=84 8=EC=9B=94 1=EC=9D=BC (=ED=86=A0) =EC=98=A4=EC=A0=84 3:59, Al=
an Stern <stern@rowland.harvard.edu>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Fri, Jul 31, 2026 at 12:55:03AM +0900, Minseo Kim wrote:
> > For a fix, I think the important invariant is exactly-once completion a=
nd
> > teardown: each GadgetFS private object and USB request must be released
> > exactly once, the iocb must be completed exactly once, and no path may
> > dereference any of these objects after its lifetime has ended.
>
> Okay, the new patch below guarantees this.  Or at least, I believe it
> does.  :-)
>
> > One additional point from the v2 results may be relevant to the approac=
h
> > you outlined: delaying kiocb_set_cancel_fn() until after successful
> > submission. Moving it after a successful usb_ep_queue(), by itself, may
> > not be sufficient: once the request has been queued successfully, its
> > completion can run before cancellation is registered. The revised-patch
> > UAF demonstrated this completion-before-registration ordering. The
> > registration and completion paths therefore appear to need an additiona=
l
> > ordering or lifetime mechanism.
>
> The new patch registers the cancel function before submission, so this
> will be okay.
>
> > There is also a locking constraint: io_cancel() and free_ioctx_users() =
can
> > invoke the cancel callback while holding ctx->ctx_lock. A synchronous
> > dequeue giveback must therefore not cause aio_complete_rw() to reacquir=
e
> > that lock while the iocb is still linked and the original caller still
> > holds ctx->ctx_lock.
>
> In the new patch, nothing more complicated than kfree() happens while
> the new aio_lock is held, no new locking cycles will be created.  Of
> course, your testing may reveal a pre-existing cycle.
>
> On the other hand, we have no control over whether dequeue givebacks are
> synchronous.  If necessary we could complete the aio in a different
> thread, but that would be wasteful if it isn't needed.
>
> Thanks for your help, and let me know how the patch below works out.
>
> Alan Stern
>
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
> @@ -433,6 +435,19 @@ static long ep_ioctl(struct file *fd, un
>
>  /* ASYNCHRONOUS ENDPOINT I/O OPERATIONS (bulk/intr/iso) */
>
> +enum aio_req_state {
> +       AIO_SUBMITTING,
> +       AIO_RUNNING,
> +       AIO_COMPLETED,
> +       AIO_GIVEN_BACK,
> +};
> +
> +enum aio_cancel_state {
> +       AIO_NOT_CANCELLED,
> +       AIO_UNLINKING,
> +       AIO_UNLINK_DONE,
> +};
> +
>  struct kiocb_priv {
>         struct usb_request      *req;
>         struct ep_data          *epdata;
> @@ -443,24 +458,53 @@ struct kiocb_priv {
>         struct iov_iter         to;
>         const void              *to_free;
>         unsigned                actual;
> +       enum aio_req_state      req_state;
> +       enum aio_cancel_state   cancel_state;
>  };
>
>  static int ep_aio_cancel(struct kiocb *iocb)
>  {
> -       struct kiocb_priv       *priv =3D iocb->private;
> +       struct kiocb_priv       *priv;
>         struct ep_data          *epdata;
> +       struct usb_ep           *ep;
>         int                     value;
> +       enum aio_req_state      req_state;
>
> -       local_irq_disable();
> -       epdata =3D priv->epdata;
> -       // spin_lock(&epdata->dev->lock);
> -       if (likely(epdata && epdata->ep && priv->req))
> -               value =3D usb_ep_dequeue (epdata->ep, priv->req);
> -       else
> -               value =3D -EINVAL;
> -       // spin_unlock(&epdata->dev->lock);
> -       local_irq_enable();
> +       spin_lock_irq(&aio_lock);
> +       priv =3D iocb->private;
> +       if (!priv || priv->cancel_state !=3D AIO_NOT_CANCELLED) {
> +               spin_unlock_irq(&aio_lock);
> +               return -EINVAL;         /* Already completed or cancelled=
 */
> +       }
> +       if (priv->req_state =3D=3D AIO_SUBMITTING) {
> +               priv->cancel_state =3D AIO_UNLINK_DONE;
> +               spin_unlock_irq(&aio_lock);
> +               return 0;       /* ep_aio() will call us again if needed =
*/
> +       }
>
> +       epdata =3D priv->epdata;
> +       ep =3D epdata->ep;
> +       priv->cancel_state =3D AIO_UNLINKING;
> +       spin_unlock_irq(&aio_lock);
> +
> +       value =3D usb_ep_dequeue(ep, priv->req);
> +
> +       spin_lock_irq(&aio_lock);
> +       req_state =3D priv->req_state;
> +       priv->cancel_state =3D AIO_UNLINK_DONE;
> +       spin_unlock_irq(&aio_lock);
> +
> +       /*
> +        * priv->req and epdata are freed after unlinking and completion =
are
> +        * both done.
> +        * priv itself is freed after unlinking and giveback are both don=
e.
> +        */
> +       if (req_state >=3D AIO_COMPLETED) {
> +               usb_ep_free_request(ep, priv->req);
> +               put_ep(epdata);
> +               if (req_state =3D=3D AIO_GIVEN_BACK)
> +                       kfree(priv);
> +       }
>         return value;
>  }
>
> @@ -482,7 +526,12 @@ static void ep_user_copy_worker(struct w
>
>         kfree(priv->buf);
>         kfree(priv->to_free);
> -       kfree(priv);
> +
> +       spin_lock_irq(&aio_lock);
> +       priv->req_state =3D AIO_GIVEN_BACK;
> +       if (priv->cancel_state !=3D AIO_UNLINKING)
> +               kfree(priv);
> +       spin_unlock_irq(&aio_lock);
>  }
>
>  static void ep_aio_complete(struct usb_ep *ep, struct usb_request *req)
> @@ -490,11 +539,16 @@ static void ep_aio_complete(struct usb_e
>         struct kiocb            *iocb =3D req->context;
>         struct kiocb_priv       *priv =3D iocb->private;
>         struct ep_data          *epdata =3D priv->epdata;
> +       enum aio_req_state      new_req_state;
> +       enum aio_cancel_state   cancel_state;
>
> -       /* lock against disconnect (and ideally, cancel) */
> +       /* lock against unbind */
>         spin_lock(&epdata->dev->lock);
> -       priv->req =3D NULL;
> -       priv->epdata =3D NULL;
> +
> +       /* Prevent future cancellation */
> +       spin_lock(&aio_lock);
> +       iocb->private =3D NULL;
> +       spin_unlock(&aio_lock);
>
>         /* if this was a write or a read returning no data then we
>          * don't need to copy anything to userspace, so we can
> @@ -503,10 +557,9 @@ static void ep_aio_complete(struct usb_e
>         if (priv->to_free =3D=3D NULL || unlikely(req->actual =3D=3D 0)) =
{
>                 kfree(req->buf);
>                 kfree(priv->to_free);
> -               kfree(priv);
> -               iocb->private =3D NULL;
>                 iocb->ki_complete(iocb,
>                                 req->actual ? req->actual : (long)req->st=
atus);
> +               new_req_state =3D AIO_GIVEN_BACK;
>         } else {
>                 /* ep_copy_to_user() won't report both; we hide some faul=
ts */
>                 if (unlikely(0 !=3D req->status))
> @@ -516,12 +569,23 @@ static void ep_aio_complete(struct usb_e
>                 priv->buf =3D req->buf;
>                 priv->actual =3D req->actual;
>                 INIT_WORK(&priv->work, ep_user_copy_worker);
> -               schedule_work(&priv->work);
> +               new_req_state =3D AIO_COMPLETED;
>         }
> -
> -       usb_ep_free_request(ep, req);
>         spin_unlock(&epdata->dev->lock);
> -       put_ep(epdata);
> +
> +       spin_lock(&aio_lock);
> +       priv->req_state =3D new_req_state;
> +       cancel_state =3D priv->cancel_state;
> +       spin_unlock(&aio_lock);
> +
> +       if (new_req_state =3D=3D AIO_COMPLETED)
> +               schedule_work(&priv->work);
> +       if (cancel_state !=3D AIO_UNLINKING) {
> +               usb_ep_free_request(ep, req);
> +               put_ep(epdata);
> +               if (new_req_state =3D=3D AIO_GIVEN_BACK)
> +                       kfree(priv);
> +       }
>  }
>
>  static ssize_t ep_aio(struct kiocb *iocb,
> @@ -532,11 +596,12 @@ static ssize_t ep_aio(struct kiocb *iocb
>  {
>         struct usb_request *req;
>         ssize_t value;
> +       struct usb_ep *ep;
> +       bool need_unlink =3D false;
>
>         iocb->private =3D priv;
>         priv->iocb =3D iocb;
>
> -       kiocb_set_cancel_fn(iocb, ep_aio_cancel);
>         get_ep(epdata);
>         priv->epdata =3D epdata;
>         priv->actual =3D 0;
> @@ -547,10 +612,11 @@ static ssize_t ep_aio(struct kiocb *iocb
>          */
>         spin_lock_irq(&epdata->dev->lock);
>         value =3D -ENODEV;
> -       if (unlikely(epdata->ep =3D=3D NULL))
> +       ep =3D epdata->ep;
> +       if (unlikely(ep =3D=3D NULL))
>                 goto fail;
>
> -       req =3D usb_ep_alloc_request(epdata->ep, GFP_ATOMIC);
> +       req =3D usb_ep_alloc_request(ep, GFP_ATOMIC);
>         value =3D -ENOMEM;
>         if (unlikely(!req))
>                 goto fail;
> @@ -560,12 +626,37 @@ static ssize_t ep_aio(struct kiocb *iocb
>         req->length =3D len;
>         req->complete =3D ep_aio_complete;
>         req->context =3D iocb;
> -       value =3D usb_ep_queue(epdata->ep, req, GFP_ATOMIC);
> +
> +       priv->req_state =3D AIO_SUBMITTING;
> +       priv->cancel_state =3D AIO_NOT_CANCELLED;
> +       kiocb_set_cancel_fn(iocb, ep_aio_cancel);
> +
> +       value =3D usb_ep_queue(ep, req, GFP_ATOMIC);
>         if (unlikely(0 !=3D value)) {
> -               usb_ep_free_request(epdata->ep, req);
> +               spin_lock(&aio_lock);
> +               iocb->private =3D NULL;
> +               spin_unlock(&aio_lock);
> +
> +               usb_ep_free_request(ep, req);
>                 goto fail;
>         }
>         spin_unlock_irq(&epdata->dev->lock);
> +
> +       spin_lock_irq(&aio_lock);
> +       if (priv->req_state =3D=3D AIO_SUBMITTING) {
> +               priv->req_state =3D AIO_RUNNING;
> +
> +               /* Cancelled before or just after submission? */
> +               if (priv->cancel_state =3D=3D AIO_UNLINK_DONE) {
> +                       priv->cancel_state =3D AIO_NOT_CANCELLED;
> +                       need_unlink =3D true;
> +               }
> +       }                       /* Otherwise already completed */
> +       spin_unlock_irq(&aio_lock);
> +
> +       if (need_unlink)        /* Redo cancel that was too early */
> +               ep_aio_cancel(iocb);
> +
>         return -EIOCBQUEUED;
>
>  fail:
>
