Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B87D3DDAED
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 23:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785885186; cv=pass; b=XU6bRflnhC5AsjTJjcR1rIo5JIdmhWjXVxBJfKFGwhstoKYf/51OIBrbpBdo7687m3feSwQa2kS61vd+5ag8VZykoCFybsfnsQ5WcVDVn0KeVD8LqfQZFeSg5JfcIe0a1xbdvzJ5fda2tOQhb+D9pxVWOIS7vhLRMhrPLduDVLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785885186; c=relaxed/simple;
	bh=P2gfZnROtoP2WGcCxlC09qyLPQ17Reoi2bVD3UASLjA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NpxK7zshnmNa7D6h7f//o30oT5TGLQXJGGKd6o8hJ9doki5r1j7QG3WWQWO94iYCQqaOanXxDGMLB3l8nolRngUvETaN6/PsE85NAFKU9/GMbxznQyRq3ct41A2BfV8qvReir40nSSBN5c4R0TtBv+r6gJ2p+aRgJjlZz/JX1SA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aOjPhOIj; arc=pass smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aOjPhOIj"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8efbafa1bacso2400146d6.1
        for <linux-usb@vger.kernel.org>; Tue, 04 Aug 2026 16:13:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785885183; cv=none;
        d=google.com; s=arc-20260327;
        b=W35Yq/lYU2x0rdUf0JnFirn4nDS0X5SdrAz5wPPjGu7Kh57KYIR9zBwKOw9iwQiWlM
         iaVX72rW849In4dbC0MNk2YuriqTY42z6TNDCw70L4+jq4mTu/4xpWu+C3o4WbJHPiO3
         Ox7c1Y+sTUq90EbegbNqnWEHO5CYhZTf4HTPi80OhQcY7F8ByXk8+Bp5iD7Afnp7vyE6
         iPLn0nw1shexW5q3JWf25eH72m9+cYHTxZx4Eadm2oY/o1KHbg3c2Urq0Rp2gut5gJID
         coUphmNJd+kP0M44CiO4S55hu3PKcqi1oInIkt191w/ggf10Norjpi1f3isqR06v6eZ1
         fXAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9bP7vj3exkNfhVnWLJ/8n3qywL3Fz7m9okgnE9kbwMA=;
        fh=MehAn7UZDTGKxgSQ/oH7rmojnG0gL37S1Lg3bDiqX9g=;
        b=LqZwg850AjgKNLYZyRkr5BdEOuD4Gj6D41K+M8WyBxHKlitE1DcHauJHr5pAw7nG/B
         4XtOgqeSgSuo9dt0JsKErdulmdBu4sn12VMr1r+PQPDAooT4Ddx0HpUTfX0aELqCYLmD
         70zuCfg+m3NjRJyC8GWitxMJ1Hs9ZS6k97b1tK5PaQ3A0wN745vvyDjK9huBshBPFb7h
         1iGeaMjRmWA6qTW2b0aAo2riEBVfAbjTG9hA2sb+AAPPSNI5J5ElHu1UaCQ+A02MxjK9
         LRkRF4HiAx81kCJKFw2czbnTLZHTat1UgQOlJwydEBdEb1ymogh2j0QLxpHYDItkzH1E
         Gb4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785885183; x=1786489983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9bP7vj3exkNfhVnWLJ/8n3qywL3Fz7m9okgnE9kbwMA=;
        b=aOjPhOIjS2O+toTuU124VV7k68Sf3co2PIsmX/6o6lNw3+Pk8Z49qM3cMxJczTkvhj
         vLt4vf7l1pjtfdIDK1DFtYiJ+t4AduCUfrm/RhBQlK17wZIf6VrWT0beRBROOnkn8UB3
         DNUPh4jK0sZwaEn8UqvPpHezz7zhiGEQ+WljwvlRJzSDxzXNEN0MiM7BWhlndo2t/d/t
         /KiZoAvakWn9wCQ2MX1/uI/nc06QMT/JMN0GbEHGXipHoqRaP4Z0PFefy1I//AVvttk3
         O0sNBeesc6zOZam9gawfTCnQTqw0Js+aTVac0U08o/EVW3yDu7V63xE2FLCWEoJQfshQ
         u9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785885183; x=1786489983;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9bP7vj3exkNfhVnWLJ/8n3qywL3Fz7m9okgnE9kbwMA=;
        b=ZziHAjQqivQeC3RaLXinpqBQ0jWnotz8GUgD0vTK0sMsj7jGNYw3XkBXcNJE9s2jx/
         wvm/fBaon873kwWDMFpn0kMF9+jyixhqX/HcpG4N/rsVl/nOFcC8vQD2P92DXY+mFNJr
         M2C80+LVEPgc8WHeya0idUds4yr5IG5nvGpTZXlJzBxX42ODXYD7Vi+9SKnJ2bzPtL0O
         sBlOA47h+61p6WFO8JRHhARYGaKFddVhc+UPUhstTLrLsKoIx1jN84OmdrVBofk2RV0x
         v7EcCCokXnn7qq5h+rDebtNvTedYJPUb0PMMercjKgh7jRi/MmSgniwTbusaxJctUI+9
         gpYg==
X-Forwarded-Encrypted: i=1; AHgh+Rr5HD9olthdbugAyS8hQy9JFYEKayhRThx/Z/byLGp5QcRUeSjknobMqM6zmAc+DsE6Cp693OW96uQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQKnY34BGGznvt55E3qL/XIpdWJFRaHGpLL0U/v7BVP10F+9b0
	fZK2+nZpn6qcIqPOiz0e9p7SfRuJNb5lpwMLUOszZhH+3Pqqb3EvBrMhTWPZyJhr4x6UGgo6ZAs
	S/EhqaPY+f52r4wK6vdOHAN2pasF0G4M=
X-Gm-Gg: AR+sD10n/Egslngx2YgRMYGkZPRbdwyNqGi0L8NniO8APDI2Kr+JAiE4AwW591nCGKG
	CIkp7YJp1WCsY5CXwcsj6WB/PZ8rXdOln3yhzyXV80JVQSX/E9GhXZdqU2/SmY1i607MOB/gtqs
	L1wmzdNRyJbGd83fz1FwJHIeD2XJDzPV1OK4jao6fMo16RDSYnO5lU0tzDJs9w78KPFoFtqdxNm
	+dEOIKkDkFoRPu0QdeKLrt/VcrADVGll6yF1PV+pFMQF8dLxpMtA0HQdMMzCAJ8QwLdqoSl0Vh0
	o5AyGmzIs2UOpmVYQSklQHr2G3dRjYB3A0lq8kve1Trji5IdwJsg+Bk=
X-Received: by 2002:a05:6214:4343:b0:908:3e1c:647f with SMTP id
 6a1803df08f44-908813903e8mr36047056d6.32.1785885182972; Tue, 04 Aug 2026
 16:13:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFmvuTUEg8fr8pY91WpEk=CxHuackJfr0c2c4jxexNy9wkiS0A@mail.gmail.com>
 <a5e0e32a-7e49-4112-bcbc-92da449eb303@rowland.harvard.edu>
 <CAFmvuTXQbqbt3qxqUXitzboZhiMxAC7aaOqAtyZXs+QtJvAjBg@mail.gmail.com>
 <a7f9d958-7f9d-40eb-89ea-56094f60c075@rowland.harvard.edu>
 <CAFmvuTXx6bOEEusjf=bw5c-RDVu-bzRLbd_RVnhn2tLe4n4upQ@mail.gmail.com>
 <887e75d3-dd11-4d98-b6e6-5f6a2c3a6ae8@rowland.harvard.edu>
 <e05c6ba1-48f9-49e7-9d56-25db41e70f6e@rowland.harvard.edu>
 <CAFmvuTVYt2bVaqcyJVUSvNZfss6yzVdPbA5Wk2dtr89w2tz+5w@mail.gmail.com>
 <483692a4-8fb7-419e-90d5-1784b71fbb9f@rowland.harvard.edu>
 <CAFmvuTXvwuUrfbvsAQ_VvC9jH5iS62J+Ei23TD0NfQ_igFRJ_A@mail.gmail.com> <6761b47f-0230-4f3e-942c-26ed8dd6d0d4@rowland.harvard.edu>
In-Reply-To: <6761b47f-0230-4f3e-942c-26ed8dd6d0d4@rowland.harvard.edu>
From: Minseo Kim <neck3922@gmail.com>
Date: Wed, 5 Aug 2026 08:12:51 +0900
X-Gm-Features: AUfX_mwAYI8u4pwj2lEz-vHDa0tEqaRWPTaXPyhrOPcOmhI9buUbC3wDZ_0Si1s
Message-ID: <CAFmvuTW2cfj5dzkRR8ymenWoA7tw1WAYsMitorvppTwcZ+xfbg@mail.gmail.com>
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF in ep_aio_cancel()
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Thank you for the updated patch. I applied it as posted to upstream
v7.2-rc1, commit dc59e4fea9d83f03bad6bddf3fa2e52491777482.

In my runs, the post-queue ep_aio() UAF reported against the previous
revision did not recur with this update, including on a diagnostic build
that deliberately widened the same window. I also did not observe the
original ep_aio_cancel() null-ptr-deref or UAF signatures in the timings
I tested.

> The possibility I was worried about was that gadgetfs_unbind() might
> complete while ep_aio_cancel() was still running.

I was able to reach this ordering in a diagnostic build. I paused
ep_aio_cancel() after usb_ep_dequeue() returned and before the
cancel-side usb_ep_free_request() and put_ep() calls. The
pointer-correlated trace showed gadgetfs_unbind(),
usb_gadget_unregister_driver(), and dev_release() returning before those
cleanup calls and before ep_aio_cancel() returned.

No KASAN or Oops occurred under dummy_hcd. The trace establishes that,
in this instrumented run, the unbind and unregister paths returned before
the cancel-side cleanup finished.

> Even worse, the aio file descriptor might get closed and the entire
> module unloaded from memory while ep_aio_cancel() is running on another
> CPU.

I also tested this case with CONFIG_USB_GADGETFS=3Dm. The only difference
between the built-in and modular test configurations was
CONFIG_USB_GADGETFS=3Dy versus CONFIG_USB_GADGETFS=3Dm. In a diagnostic run
with a longer pause, gadgetfs_unbind() returned while ep_aio_cancel() was
paused. At that point, the trace harness found no file descriptors
referring to /dev/gadget/* in the process's file descriptor table, and I
then started the unmount. While the unmount was still blocked and
ep_aio_cancel() had not returned, the reported reference count for the
gadgetfs module was 2 and an rmmod attempt failed with:

  rmmod: ERROR: Module gadgetfs is in use

dev_release() and the unmount completed after ep_aio_cancel() returned,
and rmmod then succeeded. I therefore did not reproduce the module being
unloaded while ep_aio_cancel() was running in this path.

Several existing references are relevant here: the AIO request holds a
file reference in ki_filp until iocb_destroy(), the endpoint file
operations and GadgetFS filesystem type both specify
.owner =3D THIS_MODULE, and ep_aio() takes an ep_data reference through
get_ep(). The reference taken by get_ep() keeps ep_data alive at least
until its matching put_ep(); the final put_ep() also drops the dev_data
reference held by ep_data.

These references do not by themselves establish whether the UDC-provided
usb_ep object and the request allocated from it remain valid long enough
for the later cancel-side usb_ep_free_request() call to be safe after
gadgetfs_unbind() and usb_gadget_unregister_driver() have returned. The
outstanding-AIO reference count you suggested, or an equivalent teardown
barrier, may therefore still be relevant to this narrower lifetime
question, unless the USB core already guarantees those object lifetimes
through this ordering. Any such wait would need to avoid blocking a
disable or giveback operation needed for an outstanding AIO to finish.

Separately, in the matched LOCKDEP run I did not observe a cycle
involving aio_lock. The patched kernel reported:

  &ctx->ctx_lock -> &dev->lock#2 -> &ctx->ctx_lock

In that report, one recorded dev->lock-to-ctx->ctx_lock dependency comes
from kiocb_set_cancel_fn() being called while dev->lock is held. The
reverse direction is exercised when free_ioctx_users() holds
ctx->ctx_lock and a synchronous dummy_hcd giveback enters
ep_aio_complete(), which acquires dev->lock. The cancel-function
registration placement was already present in the preceding patch
revision and was unchanged by the one-line update.

The matched unpatched control reported a direct recursive attempt to
acquire ctx->ctx_lock in the same synchronous-giveback call chain. I
therefore regard the synchronous ctx_lock re-entry itself as pre-existing
rather than as a regression introduced by the one-line update.

These reports confirm that, under dummy_hcd, the dequeue giveback can
re-enter the AIO completion path synchronously. They do not by themselves
establish that GadgetFS AIO completion must be deferred to another
thread, but they identify the synchronous callback chain that such
deferral would be intended to avoid. I have included both reports because
this ordering may also be relevant to the design of a teardown barrier.

Supporting files:

  Unbind and cancel lifetime trace:
    https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main=
/gadgetfs_candidate_patch_v4_validation_20260805/reports/unbind_cancel_life=
time_trace.txt

  Module-unload lifetime trace:
    https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main=
/gadgetfs_candidate_patch_v4_validation_20260805/reports/module_unload_life=
time_trace.txt

  LOCKDEP report from the patched kernel:
    https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main=
/gadgetfs_candidate_patch_v4_validation_20260805/reports/lockdep_report_can=
didate_v4.txt

  Matched unpatched LOCKDEP control report:
    https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main=
/gadgetfs_candidate_patch_v4_validation_20260805/reports/lockdep_report_unp=
atched_control.txt

I hope these results are useful.

Best regards,
Minseo Kim

2026=EB=85=84 8=EC=9B=94 3=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 1:07, Al=
an Stern <stern@rowland.harvard.edu>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Sun, Aug 02, 2026 at 03:08:11PM +0900, Minseo Kim wrote:
> > Hi Alan,
> >
> > Thank you for the new patch. I applied it as posted to upstream v7.2-rc=
1,
> > commit dc59e4fea9d83f03bad6bddf3fa2e52491777482.
> >
> > Across the timing ranges I tested, I did not reproduce the originally
> > reported ep_aio_cancel() stale-priv failure on the kernel with the new
> > patch applied. In a targeted diagnostic comparison, the original
> > ep_aio_cancel() UAF was reproduced on the unpatched kernel. Using the
> > same kernel configuration, reproducer, and arguments, the diagnostic
> > runs on the patched kernel produced no KASAN or Oops. I also did not
> > observe the original null-ptr-deref or UAF signatures in non-diagnostic
> > runs of the patched kernel.
> >
> > However, I observed a different slab-use-after-free in ep_aio() on the
> > patched kernel:
> >
> >   BUG: KASAN: slab-use-after-free in ep_aio+0x573/0x660
> >   Read of size 4
> >   drivers/usb/gadget/legacy/inode.c:647
> >
> > This UAF was repeatedly reproduced on the patched kernel. It was not
> > observed in control runs on the unpatched kernel using the same kernel
> > configuration, reproducer, workload, and timing settings.
> >
> > The ordering appears to be:
> >
> > 1. ep_aio() registers cancellation and successfully queues the USB requ=
est.
> > 2. ep_aio() releases epdata->dev->lock before acquiring aio_lock.
> > 3. ep_aio_complete() can run the immediate-completion branch, clear
> >    iocb->private, call iocb->ki_complete(), set priv->req_state to
> >    AIO_GIVEN_BACK, observe that cancel_state is not AIO_UNLINKING, and
> >    reach the path that frees priv.
> > 4. ep_aio() then acquires aio_lock and reads priv->req_state at line 64=
7.
> >
> > Thus aio_lock serializes the post-queue state check and update, but it
> > does not keep priv alive until ep_aio() has finished that transition.
> > This is not the original ep_aio_cancel() stale-pointer window. The
> > observed UAF and the code ordering are consistent with ep_aio()
> > dereferencing priv after the completion path has freed it.
> >
> > This suggests that the submitting path may need an additional lifetime
> > handoff. Either priv must remain alive until ep_aio() has finished its
> > post-queue work, or ep_aio() must no longer access priv after the point=
 at
> > which the completion path may free it.
>
> In fact it's simpler than that; I didn't think to add a test in one
> spot.  The updated patch is below.  It differs from the previous patch
> only in that one line.
>
> > In diagnostic runs, I also tested cancellation while the request was in
> > AIO_SUBMITTING. In the queue-success ordering, I observed one completio=
n
> > event with res=3D-ECONNRESET; in the forced queue-failure ordering, one
> > event with res=3D-EINVAL. Neither case produced KASAN or an Oops.
> >
> > I also rechecked the potential unbind race you mentioned earlier. Using
> > pointer-correlated tracing on the patched build, I observed an
> > ep_aio_cancel() operation overlapping the gadgetfs_unbind() path while
> > that path called usb_ep_disable() on the request's endpoint. The
> > ep_aio_cancel() entry and ep_aio_complete() records referred to the sam=
e
> > iocb, priv, and usb_request, and the corresponding usb_ep_dequeue()
> > record referred to that same usb_request and endpoint.
> > ep_user_copy_worker() also ran for the same priv while gadgetfs_unbind(=
)
> > was still in progress.
>
> That's okay.  The possibility I was worried about was that
> gadgetfs_unbind() might complete while ep_aio_cancel() was still
> running.  If that happened, the usb_ep_free_request() and put_ep() calls
> near the end of ep_aio_cancel() might run into trouble.  Even worse, the
> aio file descriptor might get closed and the entire module unloaded from
> memory while ep_aio_cancel() is running on another CPU.
>
> I don't know if that's possible, but I also don't see anything to
> prevent it from happening.  It might be necessary to add a reference
> counter for the number of outstanding aio operations.
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
> +       if (iocb->private !=3D NULL && priv->req_state =3D=3D AIO_SUBMITT=
ING) {
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
