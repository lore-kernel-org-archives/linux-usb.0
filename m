Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39973441041
	for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 15:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785426918; cv=pass; b=TDp2MUbQ6hw/+BWqTx4ZoRY2q6GDcX4T5b1qAdCZMcm1bMo7MryAVMRUHUwABQ/qsE2tIzUYT/mYDkwhs0KWtKqhl7MbRY4ga1vPsFWeYLdB3kAymzZHSxDHyf8dEPKAfOFlRAAnllPJ3VpmDKBpudVu+V4s+NhOfHvU16OOU+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785426918; c=relaxed/simple;
	bh=OG+j75NhAHcd3BYSTTyVaqz/Dl5DXj2SrrDsxTDhTVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lpdq6/sWn+EhTeCfiwWnZzx6j3EltxeuyFNsHie/ulacZlTuivwQ0I9tUgvK0afPau9wSK2C/VLNNRWrJy1TQgwl8mN2i/zRhg7Vu6X56lyWjAYvjZ++QGbiuzAbFKJSGbFgXRv9rJ3wCa144EILBSLvhFXLQ77QqdDfRczMesQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZO+CdrzS; arc=pass smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZO+CdrzS"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-908239232adso5503146d6.1
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 08:55:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785426916; cv=none;
        d=google.com; s=arc-20260327;
        b=YhvIf3SfPynlC/QT2iZOzoH1FgCkN+fg/dhKWJzXzagfqVzBg6a9UzaDtnMTNeUeHb
         26UO25XYvBFC4C/V0FOUV/4eiqJIpRysxUqMBsfzzqotor4yZRQvWBP47oC1bXm/rNdK
         5fV9PPk0CD9DhdFDZXdLnnKF8mh5Xqwpwvms1Dp7H3ff9tfMfzy/IQXqA6bjd4R2UOUT
         gilrDnX/j2/OlyO5inSxadDYQO/Q4dsvsNEyMjEWdC1c1lSA7nsItdl99HyXxDx1hivf
         kMvMJh4RumF1COqP3VBX+pq+cTDzUt75htnbzomHZP0/BA7SC8UcKH/PhOM00tT/WN4G
         5puA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cJ6C4XbWu20lERxOYTG5hF1tJrtEIvIctdbpaEtxhUk=;
        fh=ykcJDM7RGIq295CVDcT+L/WCV+A88nf903gPSL8GqRI=;
        b=pfYbdAfRZNak8EaNjHSCiEPkJVNuXfBrcUFuwQV2wytVr5ZUhSTiq9lj7TGAbiJ0NU
         oKvbypC9WHW54VQbA64cT2RscaodgdL75pfXjzR5Le/6fOwJBmbccmKrBdEoW+vvhuZs
         eU3K0EFYgJCWCjHl73FWEEEf5cMjfflrl04EfFpkHbNmJqEVu+TNAvuXYgGxycqNnLlT
         D67W1mygNxrayAR1W2Hb4BFWNAi0ZtD1VtLay+EABAmqCIca1MDHskixvzD1ma4fb8Gj
         LMS5JkS07MdDuWZ39isGSWqqNGOj08LzXA0w9IxXy2WDo2wuE5TGo5e8F1DkLfdiQqHq
         tiww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785426916; x=1786031716; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cJ6C4XbWu20lERxOYTG5hF1tJrtEIvIctdbpaEtxhUk=;
        b=ZO+CdrzShBFzIpT4OAlFHY+oKsqvwpJswBbkF87ApwNSEqXpXY+hG8WTOzPilvlg8S
         f1xlF4PMpKX/9fjF8j0ZNQil1rb+Nywo2uch1YgyMDOeIe3CFbFg6AlbyBcRTgeHnaas
         iwbD4kkvVUyJhlwepxqU7ebPc84wOb5QcjFYcYT9HeuFDzWCQgDh2Q1gLdg0YfQ18cdL
         /J/xMxJZnH+05cifwH3elz93E9U9841LlGjsEy7EGcBkFHtgLFGppyT1gEsWKFhUR2kG
         y7kKviTlVJkx9FD5CHHOnfNZpI03Mr+z6Kx0q7VaF1/0M4bYqa+xNu+1+Hk6OyARC6S/
         fgkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785426916; x=1786031716;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cJ6C4XbWu20lERxOYTG5hF1tJrtEIvIctdbpaEtxhUk=;
        b=Fd0e8d1s26Udf2irLJwWej+0GfdyZfYVsCwz6lBMSTmEF9RKYkF+ClOwnJzUkAh8YP
         3iUS+jfLltKnwZf9ftICeiGPAOYoXSHzT8tQk7WGgLpv31mH2k5yUR+F710AuhChXheY
         do1myAm3HnDmsAmiAUuTIIVPQTvlVXNh+RBhvMaagt3rhM9mn1o5EDp70QJ2cHdyyNJR
         +mkAFeV6J7FJr5knlLy1kfAtz1vVJTbdlm5dlfCGjvExk4lMiaEchYDU/Cbonzk4GMiy
         kHdIUSOg+Jx62Zp9ZkLrbSWskSPDbxWWkvZgGruks+CesiNyhQ3xHEBr2ZpGlkc1Bwv9
         m9+w==
X-Forwarded-Encrypted: i=1; AHgh+Rq7DwphxXRBzVfIFkMCSKPnf/xLneyj33xKr3BMOqXzMwIVGK51vI33/jdGf/Ggzh9oaFtLTX9DJ4c=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnf0meoS0ml3qG2n2BbQ7BKnLpCsAlWZqlq4mTCcpXMbcqG08t
	TEvQYi/sDa+5JPFjxDX1m2oCHj27OCkWs0uI1CpYRGPrWTtWD2gwOvR4dh85itQqccDIz8lV998
	6eKybqif+u1sjyrjM2zotdkqG20u6s/A=
X-Gm-Gg: AR+sD123Z3eRcBM64ksmxq0ZOGohZkv8EPE1oU6rzDuUYZYJuPoe5AC7YINSMv406Qg
	LDlRfqNnyYv9nRHydxHknOlpR06EcWGS3wpc9tha0o2l4ZiGHCkVc4RLyJQoaU5/vjLzb4yvdi0
	gNNsAIjcCN4jp7sMnDv0s3Z3P9kjaxJ9CgFiZlUgP4SCl3Ksr9yWUWut4t23OWeRoS9feQ13hnX
	KwNGzMFqoD29xxItvLqBs38z5mPvBA0zmFwbo62dteReLUTkfkYkC3ta7Lw/ZimCV8DaYlH0u8m
	J1ZMvLEYKzlR3ntafp8aTHTMxiOTLw8L1epHxIBh28Tx2nFZKYhZrFqJ
X-Received: by 2002:a05:6214:4118:b0:8cd:d12a:3d with SMTP id
 6a1803df08f44-9083a66d3demr11525416d6.28.1785426916093; Thu, 30 Jul 2026
 08:55:16 -0700 (PDT)
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
 <CAFmvuTXQbqbt3qxqUXitzboZhiMxAC7aaOqAtyZXs+QtJvAjBg@mail.gmail.com>
 <a7f9d958-7f9d-40eb-89ea-56094f60c075@rowland.harvard.edu>
 <CAFmvuTXx6bOEEusjf=bw5c-RDVu-bzRLbd_RVnhn2tLe4n4upQ@mail.gmail.com>
 <887e75d3-dd11-4d98-b6e6-5f6a2c3a6ae8@rowland.harvard.edu> <e05c6ba1-48f9-49e7-9d56-25db41e70f6e@rowland.harvard.edu>
In-Reply-To: <e05c6ba1-48f9-49e7-9d56-25db41e70f6e@rowland.harvard.edu>
From: Minseo Kim <neck3922@gmail.com>
Date: Fri, 31 Jul 2026 00:55:03 +0900
X-Gm-Features: AUfX_mxGacbWf8uHP7nL84Bf0DriBdT7Jq1fTfCkhduH3mjXugzuEFZHDXvK_VQ
Message-ID: <CAFmvuTVYt2bVaqcyJVUSvNZfss6yzVdPbA5Wk2dtr89w2tz+5w@mail.gmail.com>
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF in ep_aio_cancel()
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Sorry for the delayed response, and thank you for following up.

> What is the cancel function supposed to do if it is called after the I/O
> has completed? Should it return an error code?

My current view is yes. If "completed" means that AIO-core completion has
removed the iocb from ctx->active_reqs, a later cancellation should fail
because the request is no longer cancellable. It should not invoke
ep_aio_cancel(), touch the completed request or its private state, or
produce another completion event. The current implementation returns
-EINVAL in this case, although the exact userspace error to use is a
separate AIO-core/API question.

The distinction between AIO-core completion and completion of the
lower-level USB request is important here. If the USB request has
completed but the iocb is still present in ctx->active_reqs,
ep_aio_cancel() may still be called.

In that narrower interval, the completion-side flow already in progress,
including ep_user_copy_worker() where applicable, should remain the sole
source of the resulting AIO completion. The cancellation and completion
paths must coordinate any cleanup so that the GadgetFS private state and
USB request are each released exactly once. If usb_ep_dequeue() reports
that the request is no longer active, ep_aio_cancel() should propagate the
negative result without initiating a separate completion. In the current
implementation, io_cancel() still removes the iocb from ctx->active_reqs
as part of its own bookkeeping.

Conversely, if cancellation reaches an active USB request first and
usb_ep_dequeue() succeeds, the request is returned through the USB
completion/giveback path, which should remain the source of the resulting
AIO completion. The cancellation and completion paths must still
coordinate cleanup so that the GadgetFS private state and USB request are
each released exactly once; ep_aio_cancel() should not independently
generate another completion of the same iocb.

The behavior I observed is consistent with this exactly-once completion
and teardown requirement. After AIO-core completion, cancel attempts made
both before and after io_getevents() consumed the published event returned
-EINVAL and did not change or duplicate the event. In a deliberately
widened lower-level completion window, dummy_hcd returned -EINVAL because
the USB request was already inactive, and the normal AIO completion
remained the only event.

Your expectation about partial transfers also matched the observed
behavior: in both the PWRITE and PREADV checks, after a 512-byte partial
transfer, the single AIO completion event reported res=3D512 despite a
negative USB completion status.

For a fix, I think the important invariant is exactly-once completion and
teardown: each GadgetFS private object and USB request must be released
exactly once, the iocb must be completed exactly once, and no path may
dereference any of these objects after its lifetime has ended.

One additional point from the v2 results may be relevant to the approach
you outlined: delaying kiocb_set_cancel_fn() until after successful
submission. Moving it after a successful usb_ep_queue(), by itself, may
not be sufficient: once the request has been queued successfully, its
completion can run before cancellation is registered. The revised-patch
UAF demonstrated this completion-before-registration ordering. The
registration and completion paths therefore appear to need an additional
ordering or lifetime mechanism.

There is also a locking constraint: io_cancel() and free_ioctx_users() can
invoke the cancel callback while holding ctx->ctx_lock. A synchronous
dequeue giveback must therefore not cause aio_complete_rw() to reacquire
that lock while the iocb is still linked and the original caller still
holds ctx->ctx_lock.

I hope this answers the remaining semantic question and clarifies the
constraints that seem relevant to a revised fix.

Best regards,
Minseo Kim

2026=EB=85=84 7=EC=9B=94 30=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=84 12:31, =
Alan Stern <stern@rowland.harvard.edu>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
>
> On Mon, Jul 20, 2026 at 10:18:33PM -0400, Alan Stern wrote:
> > I've got some ideas on how to fix these problems, but we should discuss
> > a few things first.
>
> Minseo, any responses to these questions?
>
> > The real problem is that I don't have a clear idea of how the kernel's
> > aio implementation is meant to work, and it isn't documented at all.  S=
o
> > there are a lot of questions about how the cancel function is supposed
> > to interact with the normal I/O pathways.
> >
> > For instance, what is the cancel function supposed to do if it is calle=
d
> > before the submission function (ep_aio() in this case) has returned, an=
d
> > the submission function eventually returns something other than
> > -EIOCBQUEUED (i.e., submission failed and no I/O was started)?  Or if i=
t
> > is called before the submission function has started the actual I/O
> > operation, so there isn't anything to cancel yet?
>
> Never mind this question; I can avoid the issue by not calling
> kiocb_set_cancel_fn() until after the request has been sucessfully
> submitted.
>
> > What is the cancel function supposed to do if it is called after the I/=
O
> > has completed?  Should it return an error code?
> >
> > What is supposed to happen if the I/O is cancelled and then completes
> > with no errors?
>
> Presumably nothing special should happen in this case.  It should look
> more or less the same as in the previous question.
>
> > How does the system handle a partial transfer, where the I/O was
> > cancelled part way through?  How does the user learn how much data was
> > transferred before the I/O was cancelled?
>
> Presumably the second argument to ki_complete() contains this
> information.
>
> This leaves only one question for you to answer.  :-)
>
> Alan Stern
