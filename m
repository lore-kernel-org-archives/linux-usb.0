Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933AB46EF62
	for <linux-usb@vger.kernel.org>; Mon, 14 Sep 2026 14:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394523; cv=pass; b=pRtmb6PjK6GvEHu6ntdiZ+vH5Q78pQ8N/NPpd9z4TmMSIdYDQCN/Q5MeJKzT10/0rylE60VtGxlNEks9XQRQ7DCtwI/st7zz2QURf9lOkJDy6159ebgaf6GXwbAlpptbOGd6ldlGc1DMBuyQJts3MZwqeCtgxkLrWHCaU5x7PIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394523; c=relaxed/simple;
	bh=n/EaScN9MoRV8PZ+c8kj8NR4leBSAxXeyKiNesTlvaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fkbY8ICbj2SfoCZrkDEPxEq5kCqcaIgxuw4KFGabyHBsRtIeYM7wohOF5F8XCtKeARFrJd4Bnd9cUA6GR2ZWRYNY/Hc8L0XIgNGF0ib55JcRJuZJqoVvA5l8uwaesOz3DeoK9iWpjIOjgUoUlMxr+6/4sPlSJbQx7l7QFUOfjAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZA0f/Arx; arc=pass smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZA0f/Arx"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-78fb1fb9508so3377226137.1
        for <linux-usb@vger.kernel.org>; Mon, 14 Sep 2026 07:02:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789394520; cv=none;
        d=google.com; s=arc-20260327;
        b=hXiAmfUF8wNV1jrP3DOlOfSDMFRU5hI2iA4z30VLd5O52qfCswWiMlNwWJQMJl2oS+
         QxGl8KsXdsFoWBvpO7i3dPRunFtk8p6CZCSYEbH5K/sTixf7xJRkjC6aLlUN/30IVwI+
         1WsiYWjN5fDzkJASQWwrDZKxAl7xuZi6TIXD+MuRgr0DYUGwqFCBkhrqzNAQ9Kd2iy2H
         uDkGpkB2IUhXYjTCV82lu2XTl5GpcxhLToTruoSv+4p6hDOSdlGr5lGwz2L8Ye1Vv5MQ
         T1hiFDK/eA10/mTRaRAwtPwFADwFhItoNA31YAILU/M5YeTWoTR7xt7PNzC2Vt4Zrz8F
         6fDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=psmnJCev7iIwswL35syLQ47I/8GLWWKXEvnbx0Xoqvg=;
        fh=VJOv6A0uZ8qx/mnfVq2CzJzo6gaqv6Uzr0hKWV3k1Os=;
        b=RSKgHhH/oSZjSZhVgjFhqg88rk9HRNtvowBDtK+zPXXV22kkEx3ZwL60iJEaWBY+rM
         3vBrXcP3tS78rvuN5BzUZKS6eUCUAtmeeacfSioV5Nz5MVf77+mwVZKm+Nv8qhbNm4++
         W13baMRTaT0zBk5+U1coaOkM3aFgECeJP7aQyfenwaXSVJSH2UXwOhCERC2avdQ3lTC/
         hPKNxje5OWitpouQePCFhOqNd5U1RowhxufpCM0hbz7nj/b/ChemEVyZkkt24LOtPP0x
         dGOVxPolupmyrD/mJyppO20KqMWTDGwTomgiwLj7TNAdh53yvSaspd5+urtZs2yhJJjy
         4oFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789394520; x=1789999320; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=psmnJCev7iIwswL35syLQ47I/8GLWWKXEvnbx0Xoqvg=;
        b=ZA0f/Arx54XR6kAl+Fs0xBzSpUdf84w0FbJAxZU08rO+H3P+46CSV8KBpbLNu8T27G
         8VzNswn25SJyci0w799aSbP6KTtCrL1VmW9K1qXke9BITFElq+ySp3M8aQI/fYtd6wdN
         UaCoM7Ok6komAI8PY7eIFMmbcdLlPNVZ6jIEZEdZTG/gANDsvK9mPVProeBA8y7xew2t
         PbKYDSolZwvpIVDrOGPuuIpWSsKnvm9gMdJtCXBgrHMaQRSGeg/yTlX42aG9Jf/gcBQy
         1RlpwrxWuN7oOAPENt6TRcswcUBIKAo0Keq8eydj5zEudXn14lhfMRgTDoyyKQ6PY1ia
         KYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394520; x=1789999320;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=psmnJCev7iIwswL35syLQ47I/8GLWWKXEvnbx0Xoqvg=;
        b=c1gd0tJBvBf7JgSnLH5xk3moGdQ/54DX976HkcYjmDiI/GYM3A1t7DW9/Ci+q/w1wP
         QtQwVACXlRebxk91Nh8JWB/dicrdV84hxP3OebfOxV0FEWGV39WJLA+w7swCifdim6UM
         i+eefEmd5F6YWKCbOnRQUlJRtRY0MOO8UOd4mnI2HhKOVU09r6o6e5D7XhKljm793h1D
         DKTgo1eHd6bXUv4ajy7uR3p+4siP1ekjC2gkLhiUuSMQpN0xa3ARKEWuQpMPIl/sVzXD
         qONJ+IKi8C9z3+xK4ZcSUlAc9493Ra8WS/xdIYky5Kc46XizaO2kKpANa9rbQ41E5Tg3
         FHmA==
X-Forwarded-Encrypted: i=1; AKwUvBxb280B6/kJ3gUxAckiLyiRmNj9lUOW5pFPoiABSWey2yrP0VuRjj77hs4revuzeIZaBm4+emzsK3w=@vger.kernel.org
X-Gm-Message-State: AFuF++n+KTKpiJ7Wq0elpwKjw42ULI2Ij9v6MN15b1DAUORxa6XdntfY
	Pwgg/w6HySiCKh/Mf1gnXjFopskl4c62BD4p6fVq8A/T3JW02cmubZghI32PFsiibXmHgJz5c99
	OasE7h0bCXGFL6xueZvjLHZr3plxBilg=
X-Gm-Gg: AYBFou1PqAhtSzBf2S4Hl92TSZ2yeo2Q1sxkmQbRYHO02HNHxJx7EPID009pqwn4Q+D
	Cun3Vw+A9bWT37I+vaMFsEQHEWKuPkisEZTc0y6tD7Ef+Nqg7rDrWge2CwTecBZnriqdQ8EGQvW
	FhW8R/FtQj9ivThcScv9OiXdvpsWSDoB81PjnZBOGDw+j4HdwaAV8DGPRVo8AQAN2jOCe23peSz
	/GgfiAZ4/Z4kqcSeLhMPlkcddTtwVLoNasJOjt5UJzYeejXJ+epU5MIpTimLJBLF4in6UNbxr9z
	JUTWf0znRb8sVx1wekfQRJ2pA9XW+qsOePU5ckZ3tJXwsYENW8JEbzAG0oyaG70hzCeaaeOnpRm
	IB++uTzLVdsnG2fm43V4YOskRr1R7PONuERDbn/7DQFiX9q1K4mYiDJQXRXa/4D04gvQIwVFk0C
	r1gb4J2w==
X-Received: by 2002:a05:6102:a1c4:10b0:79c:ab2:6f6c with SMTP id
 ada2fe7eead31-79c0ac1d50cmr601381137.3.1789394519569; Mon, 14 Sep 2026
 07:01:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1b92cd86-fe64-43eb-9539-53a559cd14e3@rowland.harvard.edu>
 <CAFmvuTWw90k+Fvs5Ve=1nxCDSQrzH7rytY-3vjGwv=edQOCBPw@mail.gmail.com>
 <fb56064c-6481-44b3-88e5-8e5ff7b85703@rowland.harvard.edu>
 <CAFmvuTXWxQJUZfAAC=vs5QM=myDLE-o0jZZ8OXdqiGioPkRwfA@mail.gmail.com>
 <f928b74b-ce57-4454-bdd4-511b823bf742@rowland.harvard.edu>
 <CAFmvuTXwUiap39-FHv6aqGbJVzORRx8tV1QfN0BDjJaPsbfKHg@mail.gmail.com>
 <cec9b2a0-3454-45a6-b128-51d708cc8cbc@rowland.harvard.edu>
 <CAFmvuTUwGr-=joWrsYMu-Ra3XpHTe_HFhaY5inJnhg=e5b=1PA@mail.gmail.com>
 <1a93bb26-9ded-4b71-b409-62896a2681a6@rowland.harvard.edu>
 <CAFmvuTUogd8MyQM02VpM7iHaopzrOoex+X-McQE28X1fgb_AeQ@mail.gmail.com> <0b6b13ff-789e-4ba4-9765-1052a154ef27@rowland.harvard.edu>
In-Reply-To: <0b6b13ff-789e-4ba4-9765-1052a154ef27@rowland.harvard.edu>
From: Minseo Kim <neck3922@gmail.com>
Date: Mon, 14 Sep 2026 23:00:00 +0900
X-Gm-Features: AcwNN1VuCUgL_CUDlFNknPFYzvgT86hGkOAFVgtuMIDjMk_XupspcZtX0AfQ1g0
Message-ID: <CAFmvuTXeg2LykJa060WUYAhhQpdwGV74VFkMb6Wu5zjyqWzxmw@mail.gmail.com>
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF in ep_aio_cancel()
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrey Konovalov <andreyknvl@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Thank you for the revised patch.

Following your explanation, I focused this round of testing on how the
revised patch handles module lifetime.

I applied your first patch followed by this revised second patch to
upstream v7.2-rc1, commit
dc59e4fea9d83f03bad6bddf3fa2e52491777482, using
CONFIG_USB_GADGETFS=3Dm for the runtime tests.

With the unbind flush removed, I held ep_unlink_worker() at entry.
gadgetfs_unbind() returned and the module usage count reached zero, but
rmmod remained blocked in gadgetfs_cleanup()'s destroy_workqueue(). After
I released the worker, rmmod completed successfully. Holding
ep_user_copy_worker() immediately after iocb->ki_complete() likewise kept
rmmod blocked in destroy_workqueue() until I released the worker. In both
cases, the blocked rmmod stack showed __flush_workqueue(),
drain_workqueue(), destroy_workqueue(), and gadgetfs_cleanup().

To check whether module unloading could begin before a callback published
its work, I held the completion callback immediately before it queued
copy_work. At that point, the reproducer's file descriptor table contained
no GadgetFS descriptors. In two runs, each starting from a fresh boot, a
direct umount2() call failed with errno set to EBUSY while the callback was
held. The module usage count remained 2, rmmod was rejected because the
module was in use, and gadgetfs_cleanup() did not begin. After I released
the callback, it queued copy_work, the AIO request completed, and subsequen=
t
unmount and rmmod attempts succeeded.

I also held ep_aio_complete() immediately after iocb->ki_complete() on
the PWRITE path that does not queue copy_work. In two runs, each starting
from a fresh boot, after the reproducer consumed the AIO completion event
and closed all GadgetFS descriptors, unmount remained pending, at least
one concurrent delete_module() attempt failed with errno set to
EWOULDBLOCK, and gadgetfs_cleanup() did not begin while the callback tail
was held. After I released the gate, the callback returned, unmount
completed, and module removal succeeded.

In another cancellation test, both unlink_work and copy_work were
outstanding on gadgetfs_wq when rmmod entered destroy_workqueue().
Releasing unlink_work alone did not allow cleanup to return; it returned
only after I released copy_work.

Using the GadgetFS source with both patches applied and without the
diagnostic gates or markers, I reran the original NULL pointer dereference
and UAF reproducers and the relevant AIO cancellation, payload, teardown,
CPU hotplug, rebind, module reload, and partial read stress tests. All
completed with the expected results and without a KASAN report, Oops, or
LOCKDEP warning.

In these x86-64 QEMU and dummy_hcd tests, module cleanup did not begin whil=
e
a callback still had work to publish, and destroy_workqueue() waited for th=
e
remaining GadgetFS AIO work once module cleanup began. I did not find a new
failure attributable to the revised second patch in these tests.

Thank you for examining this issue with such care and for the time and
effort you have devoted to it.

With sincere appreciation and great respect,
Minseo Kim

2026=EB=85=84 9=EC=9B=94 12=EC=9D=BC (=ED=86=A0) =EC=98=A4=EC=A0=84 4:22, A=
lan Stern <stern@rowland.harvard.edu>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Fri, Sep 11, 2026 at 11:00:00PM +0900, Minseo Kim wrote:
> > Hi Alan,
> >
> > Thank you for the questions. I reran the tests to distinguish the
> > request's endpoint-queue state from the callback's execution state, and
> > the unbind flush from workqueue destruction during module cleanup.
> >
> > > I didn't think this was possible.  gadgetfs_unbind() calls
> > > destroy_ep_files() before doing the flush, and destroy_ep_files() cal=
ls
> > > usb_ep_disable() for each active endpoint.  usb_ep_disable() doesn't
> > > return until the completion handlers for all the outstanding requests=
 on
> > > the endpoint have finished.  This means no copy_work items should hav=
e
> > > been left to queue when the flush occurred.
> >
> > With both patches applied, this ordering was possible in the dummy_hcd
> > test because the target request had already been removed from its
> > endpoint queue before ep_aio_complete() ran. When gadgetfs_unbind()
> > subsequently called destroy_ep_files(), dummy_disable() found the
> > endpoint queue empty. The request associated with the already-running
> > callback was no longer on that queue, so nuke() had no queued request t=
o
> > give back and dummy_disable() returned while the callback was still hel=
d
> > at the gate. The unbind flush then returned before the callback queued
> > copy_work.
>
> Aha!  In other words, usb_ep_disable() doesn't guarantee that the
> completion handlers for all outstanding requests on the endpoint have
> finished -- it only guarantees that they have started.  That's an
> important difference.  Guess I should update the documentation for
> that routine.
>
> > I confirmed this with markers recording the request and endpoint
> > pointers. The gate was inside ep_aio_complete(), after the request had
> > already been removed from its endpoint queue. It used a bounded,
> > non-sleeping loop. dummy_hcd had already released dum->lock before
> > calling usb_gadget_giveback_request().
> >
> > In a control with the host-side transfer delayed, the request remained
> > queued when usb_ep_disable() began. dummy_disable() called nuke(), whic=
h
> > removed it and invoked its completion callback through
> > usb_gadget_giveback_request(). While I held the callback at entry,
> > neither usb_ep_disable() nor the ep0 close returned. After I released t=
he
> > gate, the callback returned before usb_ep_disable() did, matching your
> > expectation for this pending-request case. The AIO request produced
> > exactly one completion with res=3D-ESHUTDOWN.
> >
> > In a separate run with GadgetFS still mounted, the unbind flush and ep0
> > close returned while the callback was held before queuing copy_work. Th=
e
> > reproducer had no GadgetFS file descriptors left open in userspace, but
> > the module usage count was 2. rmmod was rejected because gadgetfs was i=
n
> > use, and gadgetfs_cleanup() had not begun. After I released the callbac=
k
> > and the reproducer exited, the count was 1; subsequent unmount and rmmo=
d
> > succeeded.
> >
> > > What prevented rmmod from completing after iocb->ki_complete() had
> > > finished?  Was it waiting for the flush to finish?  If any additional
> > > work items were added to the queue after the flush started, they shou=
ld
> > > not have blocked the flush.
> >
> > In a separate worker-tail run using the same late-queueing ordering, th=
e
> > unbind flush had already returned before the callback queued copy_work.
> > I then held the worker immediately after iocb->ki_complete() returned.
> > The module usage count was zero before rmmod started. When rmmod was
> > started, it waited in destroy_workqueue() during module cleanup, not in
> > the earlier unbind flush. The relevant part of the blocked rmmod task's
> > stack was:
> >
> >     __flush_workqueue
> >     drain_workqueue
> >     destroy_workqueue
> >     gadgetfs_cleanup [gadgetfs]
> >     __do_sys_delete_module
> >
> > The __flush_workqueue frame came from drain_workqueue(), which was
> > called by destroy_workqueue(). Thus, the late copy_work did not block
> > the earlier flush_workqueue() in gadgetfs_unbind(); it was already
> > running when gadgetfs_cleanup() called destroy_workqueue(), and
> > drain_workqueue() waited for it instead. Markers confirmed that
> > destroy_workqueue() returned only after I released the worker, and rmmo=
d
> > then completed successfully.
> >
> > This is consistent with the entry-gated ep_unlink_worker result in my
> > previous message. In that test, unlink_work had already been queued
> > before the unbind flush began, so the flush and the ep0 close remained
> > blocked until I released the worker. In the late-queueing run above,
> > copy_work was not queued until after the unbind flush had returned. A
> > separate control with copy_work queued before the flush likewise kept
> > the unbind flush and the ep0 close blocked until I released the worker.
> >
> > Thank you for asking me to check this more closely.
>
> These results explain a lot.  They mean that flushing the workqueue in
> gadgetfs_unbind() not only doesn't do what we want, it also isn't
> necessary -- because destroy_workqueue() will automatically do a flush
> for us.
>
> Also, it isn't really necessary to flush the workqueue when the user
> program closes ep0 or unmounts the gadgetfs filesystem.  We merely have
> to make sure that when the module is unloaded, no work items are running
> or will be started.
>
> Here's a revised version of the second patch, which omits the
> flush_workqueue() call from gadgetfs_unbind().  I expect it will
> eliminate the "module unloaded while work items are still running"
> problem just as well as the original version did.
>
> Alan Stern
>
>
>
> Index: usb-devel/drivers/usb/gadget/legacy/inode.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- usb-devel.orig/drivers/usb/gadget/legacy/inode.c
> +++ usb-devel/drivers/usb/gadget/legacy/inode.c
> @@ -237,6 +237,7 @@ static const char *CHIP;
>  static DEFINE_MUTEX(sb_mutex);         /* Serialize superblock operation=
s */
>
>  static DEFINE_SPINLOCK(aio_lock);      /* Protect aio cancellation info =
*/
> +static struct workqueue_struct *gadgetfs_wq;
>
>  /*----------------------------------------------------------------------=
*/
>
> @@ -514,9 +515,7 @@ static int ep_aio_cancel(struct kiocb *i
>                 spin_unlock_irqrestore(&aio_lock, flags);
>                 return 0;       /* ep_aio() will call us again if needed =
*/
>         }
> -
>         priv->cancel_state =3D AIO_UNLINKING;
> -       spin_unlock_irqrestore(&aio_lock, flags);
>
>         /*
>          * We are called with the aio core holding iocb's context lock.
> @@ -527,7 +526,9 @@ static int ep_aio_cancel(struct kiocb *i
>          * For this reason, do the dequeue operation in a work routine.
>          */
>         INIT_WORK(&priv->unlink_work, ep_unlink_worker);
> -       schedule_work(&priv->unlink_work);
> +       queue_work(gadgetfs_wq, &priv->unlink_work);
> +
> +       spin_unlock_irqrestore(&aio_lock, flags);
>         return 0;
>  }
>
> @@ -597,7 +598,7 @@ static void ep_aio_complete(struct usb_e
>
>         if (new_req_state =3D=3D AIO_COMPLETED) {
>                 INIT_WORK(&priv->copy_work, ep_user_copy_worker);
> -               schedule_work(&priv->copy_work);
> +               queue_work(gadgetfs_wq, &priv->copy_work);
>         }
>         if (cancel_state !=3D AIO_UNLINKING) {
>                 usb_ep_free_request(ep, req);
> @@ -2245,10 +2246,17 @@ static int __init gadgetfs_init (void)
>  {
>         int status;
>
> +       gadgetfs_wq =3D alloc_workqueue("gadgetfs", WQ_PERCPU, 0);
> +       if (!gadgetfs_wq)
> +               return -ENOMEM;
> +
>         status =3D register_filesystem (&gadgetfs_type);
> -       if (status =3D=3D 0)
> -               pr_info ("%s: %s, version " DRIVER_VERSION "\n",
> -                       shortname, driver_desc);
> +       if (status) {
> +               destroy_workqueue(gadgetfs_wq);
> +               return status;
> +       }
> +
> +       pr_info("%s: %s, version " DRIVER_VERSION "\n", shortname, driver=
_desc);
>         return status;
>  }
>  module_init (gadgetfs_init);
> @@ -2257,6 +2265,7 @@ static void __exit gadgetfs_cleanup (voi
>  {
>         pr_debug ("unregister %s\n", shortname);
>         unregister_filesystem (&gadgetfs_type);
> +       destroy_workqueue(gadgetfs_wq);
>  }
>  module_exit (gadgetfs_cleanup);
>
>
