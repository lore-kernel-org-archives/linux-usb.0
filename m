Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF573FBEC1
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 09:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787218839; cv=pass; b=pXDA7YqsOZlctjT0U27TC0+K8BgTgE6g9qkyXynhqXSdVIXgXq4IOuBN1agvsmD+IHhqbTWy38sP/QzV6KYaiClHIgkNwdx+gONqETh14gI8poU06SY2fKnNHToLXMnJwqGqFjugHObIYm86il5l/95WU5aLHuGNOnPtvDOiGHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787218839; c=relaxed/simple;
	bh=LCJwnO4A+OLDgHQyQJ8IJc+X3WFBxaTAgrG2BKwg2PQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=axFkssi9QbQK1vIe6Py648uDiJQFVeu3iozm1tIqAcFwv9XSfIbR/wq0lvTzoPRCtIXL4VIkf1+bD57celMbdeUgbhMd53iEsktuWMHAD5ZdU5EJ2UBPbpOYS9JnzrVrLtRMUx+K0p6JDHl/rVEPmIIRq4J2/EzwqVAzK5sonlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zc56GKmG; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zc56GKmG"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-52de178a66aso7052941cf.3
        for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 02:40:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787218831; cv=none;
        d=google.com; s=arc-20260327;
        b=UUnHyK0M/ey88AMWKXCTdAsg+jsV1qslcyJjBbB10Oo5QCVEDqJ8bWrVVd2EQujWe0
         cfCzu9Ljx2pYd7cSDvyX+gEXYvhFxJuch1MhC0IxbdpnSqWn2TogPMg+nu+Voy59XWtn
         2Yp/8R35+yN5QPcy61FO/oNTcJQKajXE3Pc5DV7UVpg3J06p4QmtbvWhAogMHNf86s3o
         oh796DI5Xt5XDlcuVzCHDLB6zW54osRE/OLyYKou8Xhp/1Iy4TftoiqETFhBUdWDHPV1
         UZkQsRUfU1mdb+2eY3xxN5o4fywhFQDvo7RyDXCg91nNbnp0YjSMleP7pOQBgZ/9W8SG
         4tvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lp5eL6YtCj6o3iGA9Ja5lhd0XUJtCjpaK1NtxMS3fCw=;
        fh=L+exrEYM85d589o7UFwdHA40sSBb64homdvjwqXzrhc=;
        b=rH7QGJTbt1fzuIojKijMpwcjDdJJJWWH4HMPxpuxIVP3fE5yxUx2St1J++Tkglkm6Q
         e8A5dDjMgvgyFWuR3UUTJKNPpuRJ405naD5tZU0x4h9WASu6l/QXzyAvc/CkNyeA2cyq
         U+KtahEinMGyjMPTePjqthuQh1CWCXSXMUjH14uYDvGqy2EKxTvLiplMEU3kJZZsFzVw
         yI5UucLOF1hsdxn6DqKqHn5GWdKq2mDG11ZS0Qv7HE4cMnYNtFZuMiOfam8KFL+Ol6kE
         A8ferPCRHE2ivPhZWC6dmtly3N2a+uZw81or7MtwDrDBlduRiMeJoDEF3saMs2HAPD1P
         6MiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787218831; x=1787823631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lp5eL6YtCj6o3iGA9Ja5lhd0XUJtCjpaK1NtxMS3fCw=;
        b=Zc56GKmG4wF+dhvJWtJtCWT8Zn+Z6jnlKfU01Y+gjb7HlaNkemsfoA6DaH+lvIjalN
         knejx0eeFLfNvuOfh94YsLqzJ4u0XL7fLElPrT8tX69jDFrqwX7ZfK3UcycrhdKd8oyY
         LAj98Lr+I7s3gxEozmdH5gpOJVtYE7eQFezn0/8S1j1gxl0vkiKXmQFjv1QR1cQT0OMw
         C7ZsKnIrzpMysvUdgQbb/9um/LheX++8ENKkJBi73CIxoZaCWM0MCjv/msyweEC/LWC+
         nEYLm8EtS6a1Obn0CVUsoRiKOxJ3rcBdiqp6D4bMqH1Bm5NorHhGcQsHB2CPu68q7lL6
         JiNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787218831; x=1787823631;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lp5eL6YtCj6o3iGA9Ja5lhd0XUJtCjpaK1NtxMS3fCw=;
        b=VUolsAWhKfYXuoR8Agb2UXx8pBC6plkgAQclO0E9g3Yk1Ur+ohSejwn7YrP2tfRMvd
         Hr8GT9CsD7K2AneRfGIOm18iI2BE2wNzQU8s6xjLW73Yl4g8kV5TSkv2mxaz3SBFFvzT
         8bPjsApxcf93XKwX4SwjvKAliqhGNQ1BapGLoOvST+62IhkRY4vfeOpN6gOJpiHMEbml
         f//1Uo58nICBKsmK0reUmh13sG82J6RD3lmDAIGEBeenySdIgfAyH7H+vcXR/mQR9Hip
         h/TbVIIqT5tbZFsM/6n46YQwokfzMlMeMTA+Jb45uPUA8VV5Eg6qNunxo2nLQsy51C5s
         MeOQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp7rNsxqPsfeFsDme+C2C8EP5Mm/vpEpBdReYGkrq3YiJUKGM/Z9xxBs6T9bPoAv81VdMjwcxE88Og=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKeojsVLFM+MF2yOqccjIvjO8fCzK16Gou9QN1/IDA3lJ1DULn
	ekHWGZu8g8xNxkIbio5nDScgldOU+7I5TelNuPATUeP0Wc97RorT0Q4qpOxj01GqIK5UrG4dxn2
	YRaQmleY0ZEFGYekEfmkxK9vpVMdDOa/Ll79GLtU=
X-Gm-Gg: AR+sD10ljdhugdjPiWYtdPYih0KovxOKXWKuBUjikom21WB1JU9E0unceiX0YRL9xC9
	mvEfSoZeigXAV+JLNguJBR012pLa/ZhrwHZHi5Qgj4IsX8K41TBCfxJGg80CusuN9AbGCyXuqWe
	SMXbGvAQ0W8hobcG6pdT/6Ps+mXigPp0BDfhExzFEkp18iSRXDM2mMpKdykrwGp5ZPsKNlPAVTP
	8YTHKA1gFAW+JWq8p0A/lxTHc/xk/M+tixhFRs6/jII009eZCKFmw32Lqs8Wmy+JgBSPzYCPlxr
	t9Qy1rky9segUQTWD1kkJrGrrJNsivHXS443FUxUkk0L/xVytNlOOw8=
X-Received: by 2002:a05:622a:607:b0:52d:82bf:d4cf with SMTP id
 d75a77b69052e-52dd59f5ce2mr98057651cf.16.1787218830779; Thu, 20 Aug 2026
 02:40:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <887e75d3-dd11-4d98-b6e6-5f6a2c3a6ae8@rowland.harvard.edu>
 <e05c6ba1-48f9-49e7-9d56-25db41e70f6e@rowland.harvard.edu>
 <CAFmvuTVYt2bVaqcyJVUSvNZfss6yzVdPbA5Wk2dtr89w2tz+5w@mail.gmail.com>
 <483692a4-8fb7-419e-90d5-1784b71fbb9f@rowland.harvard.edu>
 <CAFmvuTXvwuUrfbvsAQ_VvC9jH5iS62J+Ei23TD0NfQ_igFRJ_A@mail.gmail.com>
 <6761b47f-0230-4f3e-942c-26ed8dd6d0d4@rowland.harvard.edu>
 <CAFmvuTW2cfj5dzkRR8ymenWoA7tw1WAYsMitorvppTwcZ+xfbg@mail.gmail.com>
 <e8655e37-02b3-40ef-9ce0-98c8fa25481d@rowland.harvard.edu>
 <15185c2d-4544-42cc-ba0a-79dd36e82a21@rowland.harvard.edu>
 <CAFmvuTU=t5TiZSpHmF1MXpVs+3K7G1VOTDeeazwGru4+1eozBg@mail.gmail.com> <cd57f283-71e6-4531-a311-1180ccc22ab8@rowland.harvard.edu>
In-Reply-To: <cd57f283-71e6-4531-a311-1180ccc22ab8@rowland.harvard.edu>
From: Minseo Kim <neck3922@gmail.com>
Date: Thu, 20 Aug 2026 18:40:19 +0900
X-Gm-Features: AcwNN1VfwZptTyYycw2co5J2JwcPFLfFfA5JHNpHzwz3Jk00iAcwCKeI_I1IQmU
Message-ID: <CAFmvuTVH=mVMZNoYnU07_WA+cBc4m+UG2BBTLwF5KWhcj-z-KA@mail.gmail.com>
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF in ep_aio_cancel()
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrey Konovalov <andreyknvl@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Thank you for the revised patch and for your kind words about the testing.
I applied it as posted to upstream v7.2-rc1, commit
dc59e4fea9d83f03bad6bddf3fa2e52491777482.

I did not reproduce the previously reported ep_unlink_worker() UAF with
this revision in the same directed cross-CPU diagnostic. I also reran the
original null-ptr-deref and UAF reproducers and the reproducers for the
earlier candidate-patch regressions, and did not observe their
corresponding KASAN signatures.

> Nor any of the old lockdep violations, I trust.

In the matched runs, I did not observe any of the previously reported
LOCKDEP violations or any new violation attributable to this revision.
The only LOCKDEP warning I observed was a ctx_lock IRQ-state warning that
was also reproduced in matched runs on the unpatched kernel.

> What happens if the aio is cancelled exactly between ep_aio()'s calls
> to kiocb_set_cancel_fn() and usb_ep_queue()?

I exercised this exact interval by pausing the submitting thread in a
return probe for kiocb_set_cancel_fn(), before control resumed in ep_aio()
and before usb_ep_queue() was called. I released the submit path either
when the return probe for ep_aio_cancel() ran or, separately, when the
return probe for __x64_sys_io_cancel() ran. Both release points produced
the same results described below.

When I allowed the queue operation to succeed, io_cancel() returned
-EINPROGRESS in both the PWRITE and PREAD cases. ep_aio() then replayed
the cancellation after the queue succeeded, and exactly one completion
event reported res=3D-ECONNRESET.

When I forced the queue operation to return -EINVAL, io_cancel() again
returned -EINPROGRESS in both cases, and exactly one completion event
reported res=3D-EINVAL.

I also tested a 64-byte PWRITE for which dummy_hcd completed the request
inside its queue callback. io_cancel() returned -EINPROGRESS, and exactly
one completion event reported res=3D64.

None of these tested orderings produced an additional completion event,
a KASAN report, or an Oops. In these tested orderings, the AIO_SUBMITTING
handling produced exactly one completion in each case: an early
cancellation was replayed after a pending queue succeeded, a failed queue
produced one completion with its error, and an immediate completion did
not produce a second completion.

I hope this answers the remaining question.

Best regards,
Minseo Kim

2026=EB=85=84 8=EC=9B=94 18=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 11:57, =
Alan Stern <stern@rowland.harvard.edu>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
>
> On Tue, Aug 18, 2026 at 04:49:08AM +0900, Minseo Kim wrote:
> > Hi Alan,
> >
> > Thank you for letting me know that the earlier results were helpful.
> >
> > I applied the patch as posted to upstream v7.2-rc1, commit
> > dc59e4fea9d83f03bad6bddf3fa2e52491777482.
> >
> > I reran the original null-ptr-deref and UAF reproducers, along with the
> > reproducers for the earlier candidate-patch regressions. I did not obse=
rve
> > the corresponding KASAN signatures with this patch.
>
> Nor any of the old lockdep violations, I trust.
>
> > A separate cross-CPU concurrency diagnostic appears to expose a remaini=
ng
> > lifetime race in the deferred-read cancellation path. As I understand i=
t,
> > copy_work and unlink_work are distinct work items queued through
> > schedule_work() and may execute concurrently on different CPUs. I did n=
ot
> > see an ordering mechanism in the posted patch that would serialize the =
two
> > work items. I therefore treated their concurrent execution as a possibl=
e
> > interleaving and modified only dummy_hcd to exercise it directly.
>
> That's right; the two work items are allowed to run concurrently.
>
> > On dummy_hcd's successful dequeue path, the calling path released
> > dummy_hcd's lock and restored its IRQ state before invoking work_on_cpu=
().
> > The diagnostic ran the giveback on another online CPU and waited for it=
 to
> > complete before usb_ep_dequeue() returned. GadgetFS remained exactly as=
 in
> > the posted patch. The target-CPU helper disabled local IRQs around
> > usb_gadget_giveback_request() and restored the previous IRQ state after
> > the function returned. The VM used a fixed four-CPU configuration and d=
id
> > not perform CPU hotplug.
> >
> > With this diagnostic, the C workload repeatedly triggered:
> >
> >   BUG: KASAN: slab-use-after-free in ep_unlink_worker+0x1d1/0x1f0
> >   Read of size 8
> >   drivers/usb/gadget/legacy/inode.c:488
> >
> > The faulting source statement is:
> >
> >   usb_ep_free_request(epdata->ep, priv->req);
> >
> > I did not reproduce this UAF with unmodified dummy_hcd under the same
> > kernel configuration, reproducer, and arguments. Those runs completed
> > without KASAN or an Oops and produced one AIO completion event with
> > res=3D512 for each request.
> >
> > The observed UAF is consistent with the following ordering.
> > ep_unlink_worker() calls usb_ep_dequeue(), and the giveback enters
> > ep_aio_complete(), sets req_state to AIO_COMPLETED, and queues
> > ep_user_copy_worker(). After usb_ep_dequeue() returns, the unlink worke=
r
> > observes AIO_COMPLETED, sets cancel_state to AIO_UNLINK_DONE, and relea=
ses
> > aio_lock. The copy worker can then set req_state to AIO_GIVEN_BACK,
> > observe that cancel_state is no longer AIO_UNLINKING, and free priv bef=
ore
> > the unlink worker reaches the access above.
>
> Ah, that's an interleaving I failed to anticipate.
>
> > aio_lock serializes these state changes, but it does not keep priv aliv=
e
> > after the unlink worker releases the lock. This suggests that the final
> > free must be deferred until every queued or running work item that may
> > access priv has finished accessing it. For example, a lifetime referenc=
e
> > could be taken for unlink_work before it is queued and released after
> > ep_unlink_worker() has finished its final access, or an equivalent
> > last-user mechanism could release priv only after both work items have
> > finished accessing it.
>
> It's an easy problem to fix; just make sure that the unlink worker does
> not access priv after setting cancel_state to AIO_UNLINK_DONE unless it
> sees that req_state was AIO_GIVEN_BACK.  The revised patch is below.
>
> > The reproducer does not close the GadgetFS files or trigger unbind duri=
ng
> > the request loop, and it consumes all AIO completion events before
> > teardown. A workqueue flush in gadgetfs_unbind() would therefore addres=
s
> > teardown ordering, but it would not serialize unlink_work and copy_work
> > during this race.
>
> Yes, I think that's an issue for a different discussion.
>
> > If I have misunderstood whether the USB gadget API permits a UDC to
> > deliver a dequeue giveback on another CPU before usb_ep_dequeue() retur=
ns,
> > please let me know.
>
> It all sounds good.  There's just one more thing I'd like to be sure
> gets tested: What happens if the aio is cancelled exactly between
> ep_aio()'s calls to kiocb_set_cancel_fn() and usb_ep_queue()?  This is a
> new possibility created by the patch, and we should ensure that the
> approach it takes is correct.
>
> Thanks a lot for all your testing and analysis!
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
> @@ -433,40 +435,99 @@ static long ep_ioctl(struct file *fd, un
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
>         struct kiocb            *iocb;
>         struct mm_struct        *mm;
> -       struct work_struct      work;
> +       struct work_struct      copy_work;
> +       struct work_struct      unlink_work;
>         void                    *buf;
>         struct iov_iter         to;
>         const void              *to_free;
>         unsigned                actual;
> +       enum aio_req_state      req_state;
> +       enum aio_cancel_state   cancel_state;
>  };
>
> -static int ep_aio_cancel(struct kiocb *iocb)
> +static void ep_unlink_worker(struct work_struct *work)
>  {
> -       struct kiocb_priv       *priv =3D iocb->private;
> +       struct kiocb_priv       *priv;
>         struct ep_data          *epdata;
> -       int                     value;
> +       struct usb_request      *req;
> +       enum aio_req_state      req_state;
>
> -       local_irq_disable();
> +       priv =3D container_of(work, struct kiocb_priv, unlink_work);
>         epdata =3D priv->epdata;
> -       // spin_lock(&epdata->dev->lock);
> -       if (likely(epdata && epdata->ep && priv->req))
> -               value =3D usb_ep_dequeue (epdata->ep, priv->req);
> -       else
> -               value =3D -EINVAL;
> -       // spin_unlock(&epdata->dev->lock);
> -       local_irq_enable();
> +       req =3D priv->req;
>
> -       return value;
> +       usb_ep_dequeue(epdata->ep, req);
> +
> +       spin_lock_irq(&aio_lock);
> +       req_state =3D priv->req_state;
> +       priv->cancel_state =3D AIO_UNLINK_DONE;
> +       spin_unlock_irq(&aio_lock);
> +
> +       /*
> +        * req and epdata are freed after unlinking and completion are bo=
th done.
> +        * priv is freed after unlinking and giveback are both done.
> +        */
> +       if (req_state >=3D AIO_COMPLETED) {
> +               usb_ep_free_request(epdata->ep, req);
> +               put_ep(epdata);
> +               if (req_state =3D=3D AIO_GIVEN_BACK)
> +                       kfree(priv);
> +       }
> +}
> +
> +static int ep_aio_cancel(struct kiocb *iocb)
> +{
> +       struct kiocb_priv       *priv;
> +
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
> +
> +       priv->cancel_state =3D AIO_UNLINKING;
> +       spin_unlock_irq(&aio_lock);
> +
> +       /*
> +        * We are called with the aio core holding iocb's context lock.
> +        * usb_ep_dequeue() is allowed to run synchronously, calling the
> +        * completion handler ep_aio_complete() before it returns.
> +        * But ep_aio_complete() may call iocb->kio_complete(), which
> +        * tries to acquire the context lock, leading to deadlock.
> +        * For this reason, do the dequeue operation in a work routine.
> +        */
> +       INIT_WORK(&priv->unlink_work, ep_unlink_worker);
> +       schedule_work(&priv->unlink_work);
> +       return 0;
>  }
>
>  static void ep_user_copy_worker(struct work_struct *work)
>  {
> -       struct kiocb_priv *priv =3D container_of(work, struct kiocb_priv,=
 work);
> +       struct kiocb_priv *priv =3D container_of(work, struct kiocb_priv,=
 copy_work);
>         struct mm_struct *mm =3D priv->mm;
>         struct kiocb *iocb =3D priv->iocb;
>         size_t ret;
> @@ -482,7 +543,12 @@ static void ep_user_copy_worker(struct w
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
> @@ -490,11 +556,13 @@ static void ep_aio_complete(struct usb_e
>         struct kiocb            *iocb =3D req->context;
>         struct kiocb_priv       *priv =3D iocb->private;
>         struct ep_data          *epdata =3D priv->epdata;
> +       enum aio_req_state      new_req_state;
> +       enum aio_cancel_state   cancel_state;
>
> -       /* lock against disconnect (and ideally, cancel) */
> -       spin_lock(&epdata->dev->lock);
> -       priv->req =3D NULL;
> -       priv->epdata =3D NULL;
> +       /* Prevent future cancellation */
> +       spin_lock(&aio_lock);
> +       iocb->private =3D NULL;
> +       spin_unlock(&aio_lock);
>
>         /* if this was a write or a read returning no data then we
>          * don't need to copy anything to userspace, so we can
> @@ -503,10 +571,9 @@ static void ep_aio_complete(struct usb_e
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
> @@ -515,13 +582,24 @@ static void ep_aio_complete(struct usb_e
>
>                 priv->buf =3D req->buf;
>                 priv->actual =3D req->actual;
> -               INIT_WORK(&priv->work, ep_user_copy_worker);
> -               schedule_work(&priv->work);
> +               new_req_state =3D AIO_COMPLETED;
>         }
>
> -       usb_ep_free_request(ep, req);
> -       spin_unlock(&epdata->dev->lock);
> -       put_ep(epdata);
> +       spin_lock(&aio_lock);
> +       priv->req_state =3D new_req_state;
> +       cancel_state =3D priv->cancel_state;
> +       spin_unlock(&aio_lock);
> +
> +       if (new_req_state =3D=3D AIO_COMPLETED) {
> +               INIT_WORK(&priv->copy_work, ep_user_copy_worker);
> +               schedule_work(&priv->copy_work);
> +       }
> +       if (cancel_state !=3D AIO_UNLINKING) {
> +               usb_ep_free_request(ep, req);
> +               put_ep(epdata);
> +               if (new_req_state =3D=3D AIO_GIVEN_BACK)
> +                       kfree(priv);
> +       }
>  }
>
>  static ssize_t ep_aio(struct kiocb *iocb,
> @@ -532,11 +610,12 @@ static ssize_t ep_aio(struct kiocb *iocb
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
> @@ -547,10 +626,11 @@ static ssize_t ep_aio(struct kiocb *iocb
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
> @@ -560,12 +640,45 @@ static ssize_t ep_aio(struct kiocb *iocb
>         req->length =3D len;
>         req->complete =3D ep_aio_complete;
>         req->context =3D iocb;
> -       value =3D usb_ep_queue(epdata->ep, req, GFP_ATOMIC);
> +
> +       priv->req_state =3D AIO_SUBMITTING;
> +       priv->cancel_state =3D AIO_NOT_CANCELLED;
> +
> +       /* Not allowed to manipulate the aio context while holding dev->l=
ock */
> +       ++epdata->dev->udc_usage;
> +       spin_unlock_irq(&epdata->dev->lock);
> +
> +       kiocb_set_cancel_fn(iocb, ep_aio_cancel);
> +       value =3D usb_ep_queue(ep, req, GFP_KERNEL);
> +
> +       spin_lock_irq(&epdata->dev->lock);
> +       --epdata->dev->udc_usage;
> +
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
> +       if (iocb->private !=3D NULL) {
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
