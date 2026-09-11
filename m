Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994C6320CBE
	for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 14:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789135262; cv=pass; b=Pc3s+5Bbv2xnyLi6gOqk8lwzKYSrh93TGtLPoWYHvin7yH6OWj3NhHzKKv/WLPk4N2K+xq2Nhyi4IaK8LZPk4KIhMairqUBJMoJcnMBfX44PCkaUOkHA7hfLuBrbi05aM3HYSztcQ9BlJWbsU/dHzM+APy0piBZ+CHd12N/yz2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789135262; c=relaxed/simple;
	bh=NRvv2CvBhQfSSHuxoZHX834hrUfwPP0XyLc6xmcOP4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VXcRzCVXlKQyhzjYxh/FKc1f7uqqVMCF8JjeI6AjSPjGyaDZuxgMO1vCQqrPWCy1z4XGgpSTNftJjF7J/lzoc5GDJ3ZYA2RpGyIs6fE5xasd4f+aWj3vZp7MbQGcCC0C80Vt8pkIXI77qAhCpZmmOUT+ytIAdhdPuma5aZgBucM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xy/3YGsy; arc=pass smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xy/3YGsy"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-980c4f5c921so477017241.2
        for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 07:00:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789135256; cv=none;
        d=google.com; s=arc-20260327;
        b=pc3x0S5vcJsGbJ6qEHnLovRfb7dM1U5v4973r5vSsh2IcZFzJLEwEu/SheIgDBPxvL
         w1DDAaDX/IQxsPTRZedpoON58b7hOvi5Br+/9frgUneEV7Jy6s7dAeJw/rcVMScfC5mk
         u5SiTfgMcuV1+9l7JHm3quA9Kc7kYQCflOEMrdfECrJGM8qskZw5dLu6p7wkRjvmCIWh
         CVbenDjAiyOY5qcpyBC7kXFbQGHFqUS6vWMbpy3JzabeGJVwN5f4hNZpWtZu1th/MNY7
         DIwXxzmqgtZPRp0TjhUXgLXhZ5fgnf8nc+T21jCH609vDb2SIx0RJ5ntyoGvz660mKDW
         FVLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AFZKX0Bh8yI6tq49fsjAsZ3QlB7gksDmYTTq4uLYACo=;
        fh=wWlU/U1QBTTomnSHNacwboivggBVm0o2ilaDZtDygG8=;
        b=O/QcdPmIF/CmdVbV9ahdEmvWeF4ohuArAYsDdlxvj1YyECYfkVbd4iSUNRYbWD0KYA
         OF4reTHuyGQH78i5fQZEB0r4XnazmBBOSD8uvnrdZbyzK4lBk1I6EgNXBE9WMyp/hDqW
         iUcDNSBOzgZN/u8kDgoOR5tZTaKNee97uoA0LMexK7fzttE0PQSRmI66mOo9Czh6MnHl
         P7xTSWJl9R4yvoQAYHZsYgFQyPCsmjoud8lbZX+VlqS89PsEvR2ke93/mXikgM8G396k
         xDLRRp1HEwNueoqzOleIwsXZOvaWw5JT0wnVpo3XMKsP47HPVOO63MD+HgG86R3ePkGW
         soKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789135256; x=1789740056; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AFZKX0Bh8yI6tq49fsjAsZ3QlB7gksDmYTTq4uLYACo=;
        b=Xy/3YGsysWacMGCvZbiZTfm/OXuNH2LU6n9nI8/I/hVH6o3lZnNzWV7eGAf8zEucWS
         T+K7aroUl1OGdo26Mm5iO2pUg1GE40Zh3CPYvpBtuz2Wwo4Gtxim2oQ6T2YhtIJ/Usi0
         sFlEvIdaezfEJ7m0RUZUzC51BIZK+ez6BvPPE0Y6bJRkG1ruOquy+JPw+v36KyGO66BP
         unUMvG7WkGmfxkf9qUdFR3GSxn8ZDOw9UtwOIf6RfTKOgDy+ZAcxvbd6WR6/P1iZRCis
         aOprCFQQcjlLl2awWckGDjs4mGSu2TeO43YLGONLjqBen3FwhVQCv6dVqP0QHXI3MlKt
         7dmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135256; x=1789740056;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AFZKX0Bh8yI6tq49fsjAsZ3QlB7gksDmYTTq4uLYACo=;
        b=Nmk4XedPZUss/oqZ1RJE7RSf/HsN8j2HAAQG/wxnSrmr8TWAZ+0p4tPtrFECqNZxjc
         A3tSgufyq9Lyv/6hGCHacLNuUAO9c9JfJmEoGK5TcfH+fwElrMUPh9aGEM6NSl5bVi8r
         lUiEq+akO9pdbpw2QtmpDKbKR1XfvK7FkO6NDolde+AnVZaK+DAxh8u9syX8JKTSmVCE
         mOgud1BM8XLyB1SDd9KCPRBp+w6xW3rw7G1ipLQn0bbcdhJExWcO9ipLv6Yy0wzb3mq1
         2F45DntWqtqXrOALzop1KncUkCL6YvfsItPltZ8l0a8+kK/Qh0zTE7tC/Q2YI36wTKT6
         GjtA==
X-Forwarded-Encrypted: i=1; AKwUvBxj7E0ZInwl6JYsdeXRnp2HkMdKEbrCVseB2XOuWGol6XgCvcjBfj6a/o+dP6E1j8O6fF76GPUCk2E=@vger.kernel.org
X-Gm-Message-State: AFuF++nomhLJAvINZn/TiWX8zEd5p5QWk+c99LPs+ZaBIBUcEPXhKcOs
	aZJq9hQvODgbd2jLQVYZ5G0d20BKFpigRmpknU0uGaFA6PWPuStwDbTSXKWcv1zdvOgHz0UhcRf
	WESvuQePTMloDbz2/8M00VCjck+r8BBQ=
X-Gm-Gg: AYBFou0fBEDVEORNmAQrjVwbtm3vOfTt9tsgVRT2+yyUMkfXGQ0vOi9DCcOxmYB7u5t
	ycvMzaWVAyT1ABlFVl66XjUUXg1uZMon1GHmsP+o9P8IYfgnibU3T72Pjiopl30MjJLCk71WY6K
	TBTSRE/uJmWMSLApgAXkrGWz71o5kaTNIB9nxxriPuCHmJ1xZqmMV0s8naIGgTiFUGEPbW3qe+P
	nmp415ST4/3VYC4/RxTc3LGxowZsHyz134z5rG+GnOtYinHJkJ3qs8tiZ3fGftok0/7LM5r7Fzw
	HsFXqUNDwn6BkqDXJgCIkm/5TBMuoLWcJjGIv6ze6nzj4HGIecYk5wHPu3HvO4Wr42gVNt3QbQQ
	b3+IjQSPn0McHUPxO1+YcM+A8kSgqa8Xz4S8RTWdBDOC1K6J2QpmOGWcy6XQiZE4qQPTlHDfTFF
	Veg7pC9A==
X-Received: by 2002:a05:6122:428a:b0:5c7:a9ee:dcfb with SMTP id
 71dfb90a1353d-5c8462c1d9cmr6354196e0c.5.1789135246821; Fri, 11 Sep 2026
 07:00:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0305182d-5914-4022-a0a6-1ab4221b0a6c@rowland.harvard.edu>
 <CAFmvuTULxq6O0t7FyhEwnGVdMMpbj1yZrPN6mVRDWTgF0ODJxg@mail.gmail.com>
 <1b92cd86-fe64-43eb-9539-53a559cd14e3@rowland.harvard.edu>
 <CAFmvuTWw90k+Fvs5Ve=1nxCDSQrzH7rytY-3vjGwv=edQOCBPw@mail.gmail.com>
 <fb56064c-6481-44b3-88e5-8e5ff7b85703@rowland.harvard.edu>
 <CAFmvuTXWxQJUZfAAC=vs5QM=myDLE-o0jZZ8OXdqiGioPkRwfA@mail.gmail.com>
 <f928b74b-ce57-4454-bdd4-511b823bf742@rowland.harvard.edu>
 <CAFmvuTXwUiap39-FHv6aqGbJVzORRx8tV1QfN0BDjJaPsbfKHg@mail.gmail.com>
 <cec9b2a0-3454-45a6-b128-51d708cc8cbc@rowland.harvard.edu>
 <CAFmvuTUwGr-=joWrsYMu-Ra3XpHTe_HFhaY5inJnhg=e5b=1PA@mail.gmail.com> <1a93bb26-9ded-4b71-b409-62896a2681a6@rowland.harvard.edu>
In-Reply-To: <1a93bb26-9ded-4b71-b409-62896a2681a6@rowland.harvard.edu>
From: Minseo Kim <neck3922@gmail.com>
Date: Fri, 11 Sep 2026 23:00:00 +0900
X-Gm-Features: AcwNN1Xqh3GyctgJruY5InWmnsoX-qNccIhI0RH8WTu6wKnaxxMjL09bKKt9J28
Message-ID: <CAFmvuTUogd8MyQM02VpM7iHaopzrOoex+X-McQE28X1fgb_AeQ@mail.gmail.com>
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF in ep_aio_cancel()
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrey Konovalov <andreyknvl@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Thank you for the questions. I reran the tests to distinguish the
request's endpoint-queue state from the callback's execution state, and
the unbind flush from workqueue destruction during module cleanup.

> I didn't think this was possible.  gadgetfs_unbind() calls
> destroy_ep_files() before doing the flush, and destroy_ep_files() calls
> usb_ep_disable() for each active endpoint.  usb_ep_disable() doesn't
> return until the completion handlers for all the outstanding requests on
> the endpoint have finished.  This means no copy_work items should have
> been left to queue when the flush occurred.

With both patches applied, this ordering was possible in the dummy_hcd
test because the target request had already been removed from its
endpoint queue before ep_aio_complete() ran. When gadgetfs_unbind()
subsequently called destroy_ep_files(), dummy_disable() found the
endpoint queue empty. The request associated with the already-running
callback was no longer on that queue, so nuke() had no queued request to
give back and dummy_disable() returned while the callback was still held
at the gate. The unbind flush then returned before the callback queued
copy_work.

I confirmed this with markers recording the request and endpoint
pointers. The gate was inside ep_aio_complete(), after the request had
already been removed from its endpoint queue. It used a bounded,
non-sleeping loop. dummy_hcd had already released dum->lock before
calling usb_gadget_giveback_request().

In a control with the host-side transfer delayed, the request remained
queued when usb_ep_disable() began. dummy_disable() called nuke(), which
removed it and invoked its completion callback through
usb_gadget_giveback_request(). While I held the callback at entry,
neither usb_ep_disable() nor the ep0 close returned. After I released the
gate, the callback returned before usb_ep_disable() did, matching your
expectation for this pending-request case. The AIO request produced
exactly one completion with res=3D-ESHUTDOWN.

In a separate run with GadgetFS still mounted, the unbind flush and ep0
close returned while the callback was held before queuing copy_work. The
reproducer had no GadgetFS file descriptors left open in userspace, but
the module usage count was 2. rmmod was rejected because gadgetfs was in
use, and gadgetfs_cleanup() had not begun. After I released the callback
and the reproducer exited, the count was 1; subsequent unmount and rmmod
succeeded.

> What prevented rmmod from completing after iocb->ki_complete() had
> finished?  Was it waiting for the flush to finish?  If any additional
> work items were added to the queue after the flush started, they should
> not have blocked the flush.

In a separate worker-tail run using the same late-queueing ordering, the
unbind flush had already returned before the callback queued copy_work.
I then held the worker immediately after iocb->ki_complete() returned.
The module usage count was zero before rmmod started. When rmmod was
started, it waited in destroy_workqueue() during module cleanup, not in
the earlier unbind flush. The relevant part of the blocked rmmod task's
stack was:

    __flush_workqueue
    drain_workqueue
    destroy_workqueue
    gadgetfs_cleanup [gadgetfs]
    __do_sys_delete_module

The __flush_workqueue frame came from drain_workqueue(), which was
called by destroy_workqueue(). Thus, the late copy_work did not block
the earlier flush_workqueue() in gadgetfs_unbind(); it was already
running when gadgetfs_cleanup() called destroy_workqueue(), and
drain_workqueue() waited for it instead. Markers confirmed that
destroy_workqueue() returned only after I released the worker, and rmmod
then completed successfully.

This is consistent with the entry-gated ep_unlink_worker result in my
previous message. In that test, unlink_work had already been queued
before the unbind flush began, so the flush and the ep0 close remained
blocked until I released the worker. In the late-queueing run above,
copy_work was not queued until after the unbind flush had returned. A
separate control with copy_work queued before the flush likewise kept
the unbind flush and the ep0 close blocked until I released the worker.

Thank you for asking me to check this more closely.

With sincere appreciation and great respect,
Minseo Kim

2026=EB=85=84 9=EC=9B=94 11=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 12:50, =
Alan Stern <stern@rowland.harvard.edu>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
>
> On Thu, Sep 10, 2026 at 11:00:00PM +0900, Minseo Kim wrote:
> > Hi Alan,
> >
> > Thank you for the second patch.
> >
> > > In your earlier testing, didn't you find that with the unpatched driv=
er,
> > > the driver module's usage count remained elevated as long as the
> > > ep_user_copy_worker() was pending on the workqueue? And therefore it
> > > was impossible to unload the module while a work item was still queue=
d
> > > or running?
> >
> > To check that point directly, I tested the unpatched upstream copy-work
> > path using diagnostic gates at two points in ep_user_copy_worker(). The
> > module usage count remained elevated when I held the worker at entry,
> > before iocb->ki_complete(). When I held the worker after that call, the
> > usage count reached zero and the module was unloaded before the worker
> > finished; the kernel then warned and panicked. This suggests that
> > AIO may not retain the file reference throughout the worker tail after
> > ki_complete().
>
> Okay, it's good to know that.
>
> > > Could you test it and verify that it prevents the problem you observe=
d
> > > with only the first patch installed?
> >
> > Yes. I applied your first patch and then your second patch to upstream
> > v7.2-rc1, commit dc59e4fea9d83f03bad6bddf3fa2e52491777482.
> >
> > With the first patch alone, I reproduced the earlier module-unload
> > failure with ep_unlink_worker() held at entry. With both patches applie=
d
> > using the same reproducer and ep_unlink_worker() entry gate,
> > gadgetfs_unbind() reached the flush point and the ep0 close remained
> > blocked, while unmount and rmmod attempts were rejected. After I releas=
ed
> > the worker, the close completed and subsequent unmount and rmmod attemp=
ts
> > succeeded. Holding ep_user_copy_worker() at entry with both patches
> > applied produced the same result.
> >
> > I also tested the boundary where gadgetfs_unbind() reached the flush
> > point before the completion callback queued copy_work.
>
> I didn't think this was possible.  gadgetfs_unbind() calls
> destroy_ep_files() before doing the flush, and destroy_ep_files() calls
> usb_ep_disable() for each active endpoint.  usb_ep_disable() doesn't
> return until the completion handlers for all the outstanding requests on
> the endpoint have finished.  This means no copy_work items should have
> been left to queue when the flush occurred.
>
> >  After the
> > callback queued the work, I held the worker tail immediately after
> > iocb->ki_complete(). In this ordering, rmmod did not complete while the
> > worker was held; after I released the worker, rmmod completed cleanly.
>
> What prevented rmmod from completing after iocb->ki_complete() had
> finished?  Was it waiting for the flush to finish?  If any additional
> work items were added to the queue after the flush started, they should
> not have blocked the flush.
>
> > I reran the exact pre-queue cancellation matrix, the original
> > null-ptr-deref reproducer, the directed cross-CPU UAF reproducer,
> > deferred giveback, forced dequeue failure, the earlier NULL-endpoint
> > case, payload checks, and CPU hotplug. With both patches applied, all
> > produced the expected results without a KASAN report, Oops, or LOCKDEP
> > warning. Strict KCSAN did not report a race involving GadgetFS or its A=
IO
> > work functions.
> >
> > In my x86-64 QEMU and dummy_hcd tests, the second patch prevented the
> > module-unload problem that remained with the first patch alone. I did n=
ot
> > find a new failure attributable to the second patch in these tests.
>
> All right.  So once these last few questions have been resolved, I will
> submit both of the patches (with your Tested-by: added to the second as
> well as the first).
>
> Thanks again for all your hard work running multiple tests.
>
> Alan Stern
