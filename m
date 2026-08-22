Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A913769F8
	for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2026 20:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787430394; cv=pass; b=jm+ZwjihR+3kYkkXtzmce9j6HhVQ3RYVkCIj7Wn4Xd0i1Yj6wSgOJfrzGnRUBszhDGLHB1UByUPkiIflQkSas0/DaVInBwLVGzRGyrFi28PyoEzZQLNNFClvYJ5rQKPMooTztaDAS0rbIfZvjrcmJKiefjwQFhNYMQYC5TvarYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787430394; c=relaxed/simple;
	bh=pEWvUyfJhZcdkI37lYpDQDs4aEG/hAGASOJrno/Ienw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aNDWvl2D40MkzA5Kq+ZyIeSTxDKHVBJcyPL7Wm+7MohbL9885dKvX864gcjxVk/y0gQu9C5R4lWaN4nrMkhLz/UFpE+F9oVK6eOkwaoKwh29nxoiqx6LIPLWHWv4G1SNyHngpdpbsZn0iBE6Mvjvxg8CiD0ft2+UP6fImE8TEn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XodugxiU; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XodugxiU"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-52b6543169fso14921891cf.2
        for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2026 13:26:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787430391; cv=none;
        d=google.com; s=arc-20260327;
        b=Tmz3k4GbJDCMoi7pk/V5UudjlRjupX9ajIqKtdGfRu3XFzh08APnivbs79ylKA4ydb
         yRhwbGrGMeZJQgDUzZAmP7orgq/vhvuZm3QJNuyy2HqhrdDqU79CbZjjoxzT6s97NiUO
         lrB5aRovujlcywka9KGHDjm1oqUXtPBX7RpgdQL5FHWAi1v6suYq2QmTiEHSYBGlIhz4
         K+NWldK13rgy2TuA/2SjvzJp+XVgwPUzIVFsIqLk/BufjMPB1xVxdmvUTdwGgzZuQ4cw
         Q1f+z5mc0VZVh4EvSsUCwb0QIUp6OVrHJHXagjQb61RUqicn8VliwYxH8hxtizQD0ESd
         Z1fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4880K5Uyl5DbrcQclB8w0r0VwShwsedoNhltErSO620=;
        fh=cIU/IooYoof5N++t4QNYYKJGl7Nck9FQYzWfLsaJ8pI=;
        b=DEFSp2BqcpYi54upDtblNbK/7P0fWoZOl6Pg+x+/QozAxCxewh1rvrGD+6607Wxe5a
         djv7aOM/kMzsq/q/3mEgEYr9tN3KDAlW/sPTcmVrkvEAM+FVNc3ljP7K9EB/np1vMKvv
         MEkkcCpr5WAzK5UgAaMJUSn3a7fSr3/dQlTHvmIyXXTn1nZQ8BngthIEV5Wcariup40J
         alQ4JGG3I4VHKfcVDsy1Y14C6qRvx3BNXsz7SEo2h3VO1QxxxUxX3JcZpHwn8Ly3BcbS
         hZCe6ozwGRd8k9Hxf5uWahIVKIYHhhrK/dDi8bIpiRNNuiRiE5OB1gPi8+TTwmIvqz3C
         xahQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787430391; x=1788035191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4880K5Uyl5DbrcQclB8w0r0VwShwsedoNhltErSO620=;
        b=XodugxiUQTlhSHtULxcw5dZ1wIw5CwjhbDsFooUPgvS2gxPWNhlRFeNKj8KD4UsiN9
         dcDDxfdBKi+8RjzADrxFA9MJyXxbhD/e+JF0KG4tcPrYFhq07GLsgXo7rbXaoffx/hmL
         d3lxoHG6c4A/YxcaxZitlJvm7llGtOZxcgMFIpR9ZbdxjiJZ/DyCHHiJzmrnLQRoUsDD
         Nfxx+icPZ3Cw+jMrFcioW/m6rio6iJfkzmeynRqT/hkQniYuyN/5HTLWWlpUTvC4n88Z
         VmT+QxNAW+LixnFqIXpUAwpXnFoaVNWxiQGrMBfV6+Yg926U2PLJR605PqV081WMAyfp
         8oHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787430391; x=1788035191;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4880K5Uyl5DbrcQclB8w0r0VwShwsedoNhltErSO620=;
        b=gUBx+fv3a4haUNmDtTZBM1k8GQZLRenEUMBiGLHaMNm18SrxElXV/cFaNF1H/Q00bB
         b05ygyeoQRbaYguvwMdYbccdGmoqyXOEQ+E0VsFM8whTvkYH+8LQQLycwbT22yBOVuOC
         +RZAn2hvF+q4u8pMWNU/RQ0KU2eVML9I+b0iHSgSOuhN9Ia/qNoymQYEteRB+yb1ulOg
         pDf1itVLwXEkeSJDkf5BJV2aK/ajRsvpe5nkbSqJXMPM+ZKhKU57Ox2292/wVvmdJsmX
         jNXxmfORXpEiWyP0Hqgfx51pMrehaVruNabH/4A39ynDF5C43ojf2w1w1pY73AN3dDJG
         6wNQ==
X-Forwarded-Encrypted: i=1; AHgh+RoQCzoj7XyU0Tl2TWq9vXS9ECnnOcxEffwZKjJY6S1YOYMgCFJqadIxOdTG6f4Kkl9oKZNZwO5zLpI=@vger.kernel.org
X-Gm-Message-State: AFuF++kFlRWRm0f5Uhcc9xt/UqkHRFPo/ZgwaS5HWfPS2SzJqJXLJmrn
	zQCcnX4es9K+UNoi2VIcjAlJpmlhbdO7qpj+sbDIXIqU9EwgOA7siKSPQPmJIr03KhPAMnPVFfr
	uXGsN8JIV0xyZ2gbyDvOq9J5klajIXpQ=
X-Gm-Gg: AR+sD126kWkvMuay8wj3+bnqmialLWnQAB1bDkvokfgVdP7antFx5t8TtS5DuyFpnXR
	XFoTw+uvB4FJWpMSL68HgwyyAQSiwc3lUE9XYfqYZvFf5xk3GYeOJvy5rGKX0S4JNNmwqBZalm1
	b5j+HKmSCm983gqy+UuTuO8+8B7qx9N3P4zm2rxuv9bgSJGWHcrQQlsh/CGyUsf4xtr989bNpHx
	yEZxFURGtS+6HzKySk73aPCmVAgslbFi+PE0KsHmmwP4iW2EmURjt1uBiZouBbnY6z1GU1c+Fx+
	3BGKkXgNH4XOOzbQ4j3UIkqteduenWeDYHahGPnSMO2V
X-Received: by 2002:a05:622a:244e:b0:528:3216:b802 with SMTP id
 d75a77b69052e-52df5740d84mr152215231cf.15.1787430391093; Sat, 22 Aug 2026
 13:26:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFmvuTVYt2bVaqcyJVUSvNZfss6yzVdPbA5Wk2dtr89w2tz+5w@mail.gmail.com>
 <483692a4-8fb7-419e-90d5-1784b71fbb9f@rowland.harvard.edu>
 <CAFmvuTXvwuUrfbvsAQ_VvC9jH5iS62J+Ei23TD0NfQ_igFRJ_A@mail.gmail.com>
 <6761b47f-0230-4f3e-942c-26ed8dd6d0d4@rowland.harvard.edu>
 <CAFmvuTW2cfj5dzkRR8ymenWoA7tw1WAYsMitorvppTwcZ+xfbg@mail.gmail.com>
 <e8655e37-02b3-40ef-9ce0-98c8fa25481d@rowland.harvard.edu>
 <15185c2d-4544-42cc-ba0a-79dd36e82a21@rowland.harvard.edu>
 <CAFmvuTU=t5TiZSpHmF1MXpVs+3K7G1VOTDeeazwGru4+1eozBg@mail.gmail.com>
 <cd57f283-71e6-4531-a311-1180ccc22ab8@rowland.harvard.edu>
 <CAFmvuTVH=mVMZNoYnU07_WA+cBc4m+UG2BBTLwF5KWhcj-z-KA@mail.gmail.com> <908a5b29-e6d8-4595-b451-6c328e25c60e@rowland.harvard.edu>
In-Reply-To: <908a5b29-e6d8-4595-b451-6c328e25c60e@rowland.harvard.edu>
From: Minseo Kim <neck3922@gmail.com>
Date: Sun, 23 Aug 2026 05:26:20 +0900
X-Gm-Features: AcwNN1V7YGob6VkPZxF-iHaUcBHWCt9_iS3wUCd77g5MN08rlXy1FhnbKoQLsMk
Message-ID: <CAFmvuTU5HnBKbve=v_C7Mhw2586rR_8qsRNua2XPokgKy_o31w@mail.gmail.com>
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF in ep_aio_cancel()
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrey Konovalov <andreyknvl@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Thank you. I am glad the testing has been useful.

> What was the cause of this warning? If it is sufficiently
> straightforward, maybe I can fix it as well.

The warning is caused by ep_aio_cancel() enabling local IRQs while its
caller still holds ctx->ctx_lock. io_cancel() acquires ctx->ctx_lock with
spin_lock_irq() and invokes the cancel callback before releasing that
lock. In the posted revision, ep_aio_cancel() uses spin_lock_irq() for
aio_lock and releases it with spin_unlock_irq(), which enables local IRQs
before the callback returns. LOCKDEP records the resulting SOFTIRQ-ON-W
usage; in the reported run, it later reports inconsistent
softirq-context use of the same lock in the free_ioctx_users() path.

When entered with local IRQs already disabled, the unpatched driver has
the same underlying behavior because ep_aio_cancel() unconditionally
calls local_irq_enable() before returning. Using the same reproducer,
arguments, and kernel configuration, I reproduced the warning on both the
posted revision and the unpatched kernel.

Would it make sense to change the aio_lock operations in
ep_aio_cancel() to spin_lock_irqsave() and spin_unlock_irqrestore(), using
the saved flags on every path that releases the lock? This would preserve
the incoming IRQ state both when the AIO core invokes the callback and
when ep_aio() replays an early cancellation.

I tested this change locally by rerunning, on fresh boots, the full
pre-queue cancellation matrix from my previous message and a longer
cancellation workload of 1000 rounds with 32 requests per round. Each
matrix case produced exactly one expected completion, and neither the
matrix nor the longer workload produced a KASAN report, Oops, or LOCKDEP
warning. If you prefer a different way to preserve the caller's IRQ
state, I would be happy to test that as well.

Separately, my understanding was that we had set the teardown issue aside
for a later discussion. I also tested that case and wanted to share the
result here in case it is useful.

On the posted revision, the reproducer repeatedly triggered:

  KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
  Workqueue: events ep_unlink_worker
  RIP: usb_ep_dequeue+0x2c/0x220
  drivers/usb/gadget/udc/core.c:333
  called from ep_unlink_worker+0x8d/0x1b0
  drivers/usb/gadget/legacy/inode.c:477

The endpoint argument to usb_ep_dequeue() was NULL. I also reproduced the
same teardown failure with the local IRQ-state change applied, so the two
issues appear independent.

The reproducer submits AIO FSYNC requests from a thread pinned to CPU 0
and verifies that at least 1024 remain outstanding. The cancel thread is
also pinned to CPU 0, so the work items handled by aio_fsync_work() and
ep_unlink_worker() are both queued through schedule_work() to the CPU 0
worker pool of the system per-CPU workqueue. In the faulting ordering,
after io_cancel() returned -1 with errno set to EINPROGRESS, the main
thread on CPU 1 closed ep0 before ep_unlink_worker() reached
usb_ep_dequeue().

Closing ep0 invoked dev_release(), which called
usb_gadget_unregister_driver(). The unregister path then invoked
gadgetfs_unbind(), where destroy_ep_files() cleared epdata->ep. When
ep_unlink_worker() later reached the dequeue call, it passed the now-NULL
epdata->ep to usb_ep_dequeue().

Quiescing or flushing the relevant unlink work only after
destroy_ep_files() would be too late for this ordering, because
epdata->ep had already been cleared before that synchronization began.
The teardown path therefore appears to need synchronization that prevents
ep_unlink_worker() from dereferencing the endpoint after invalidation,
whether by preventing new unlink_work from being queued and quiescing
pending or running work before invalidation, retaining the endpoint until
such work finishes, or using an equivalent state or lifetime mechanism.

Supporting files:

  LOCKDEP report for the posted revision:
    https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main=
/gadgetfs_candidate_patch_20260818_lockdep_teardown_followup_20260821/lockd=
ep_ctx_lock_irq_state_warning.txt

  Matched unpatched LOCKDEP control report:
    https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main=
/gadgetfs_candidate_patch_20260818_lockdep_teardown_followup_20260821/lockd=
ep_unpatched_ctx_lock_irq_state_control.txt

  C reproducer for the teardown null-ptr-deref:
    https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main=
/gadgetfs_candidate_patch_20260818_lockdep_teardown_followup_20260821/repro=
_unbind_unlink_ep_null.c

  Build:
    gcc -O2 -Wall -Wextra -pthread -o repro_unbind_unlink_ep_null \
      repro_unbind_unlink_ep_null.c

  Symbolized KASAN report:
    https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main=
/gadgetfs_candidate_patch_20260818_lockdep_teardown_followup_20260821/symbo=
lized_report_unbind_unlink_ep_null.txt

  Kernel config used for these runs:
    https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main=
/gadgetfs_candidate_patch_20260818_lockdep_teardown_followup_20260821/kerne=
l.config.kasan_inline_dwarf5_lockdep

I hope this clarifies the warning and provides useful information for
the separate teardown issue.

Best regards,
Minseo Kim

2026=EB=85=84 8=EC=9B=94 20=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 11:08, =
Alan Stern <stern@rowland.harvard.edu>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
>
> On Thu, Aug 20, 2026 at 06:40:19PM +0900, Minseo Kim wrote:
> > Hi Alan,
> >
> > Thank you for the revised patch and for your kind words about the testi=
ng.
> > I applied it as posted to upstream v7.2-rc1, commit
> > dc59e4fea9d83f03bad6bddf3fa2e52491777482.
> >
> > I did not reproduce the previously reported ep_unlink_worker() UAF with
> > this revision in the same directed cross-CPU diagnostic. I also reran t=
he
> > original null-ptr-deref and UAF reproducers and the reproducers for the
> > earlier candidate-patch regressions, and did not observe their
> > corresponding KASAN signatures.
>
> Excellent!
>
> > > Nor any of the old lockdep violations, I trust.
> >
> > In the matched runs, I did not observe any of the previously reported
> > LOCKDEP violations or any new violation attributable to this revision.
> > The only LOCKDEP warning I observed was a ctx_lock IRQ-state warning th=
at
> > was also reproduced in matched runs on the unpatched kernel.
>
> What was the cause of this warning?  If it is sufficiently
> straightforward, maybe I can fix it as well.
>
> > > What happens if the aio is cancelled exactly between ep_aio()'s calls
> > > to kiocb_set_cancel_fn() and usb_ep_queue()?
> >
> > I exercised this exact interval by pausing the submitting thread in a
> > return probe for kiocb_set_cancel_fn(), before control resumed in ep_ai=
o()
> > and before usb_ep_queue() was called. I released the submit path either
> > when the return probe for ep_aio_cancel() ran or, separately, when the
> > return probe for __x64_sys_io_cancel() ran. Both release points produce=
d
> > the same results described below.
> >
> > When I allowed the queue operation to succeed, io_cancel() returned
> > -EINPROGRESS in both the PWRITE and PREAD cases. ep_aio() then replayed
> > the cancellation after the queue succeeded, and exactly one completion
> > event reported res=3D-ECONNRESET.
> >
> > When I forced the queue operation to return -EINVAL, io_cancel() again
> > returned -EINPROGRESS in both cases, and exactly one completion event
> > reported res=3D-EINVAL.
> >
> > I also tested a 64-byte PWRITE for which dummy_hcd completed the reques=
t
> > inside its queue callback. io_cancel() returned -EINPROGRESS, and exact=
ly
> > one completion event reported res=3D64.
>
> Good, that's exactly what the results should be.
>
> > None of these tested orderings produced an additional completion event,
> > a KASAN report, or an Oops. In these tested orderings, the AIO_SUBMITTI=
NG
> > handling produced exactly one completion in each case: an early
> > cancellation was replayed after a pending queue succeeded, a failed que=
ue
> > produced one completion with its error, and an immediate completion did
> > not produce a second completion.
> >
> > I hope this answers the remaining question.
>
> Yes, it all sounds good.  This patch is just about ready for submission.
>
> Alan Stern
