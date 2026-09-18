Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B960B4E780B
	for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2026 13:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738295; cv=pass; b=oG1YlOytZMnqbjvEXkqUvQWNktcmzjGkulLg/vWnbt9bSpJxXIpc6C0bF3n+8g54rb2HqrEwxCZzw9lRYBRn+l5xYZ0VPuV6i9FFwrgX+P+z+hcWws4da1ep1siG8oMZEZqsR7ocHQUr/LlhdD4bj9ah3K8yeBHDrcVNU2+yXHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738295; c=relaxed/simple;
	bh=YGbURim4cmcPP/3VARCvlaukbWUiutuCypcLCVBV5lc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kZnnThtq4XzyeeWZV+80WUx8inwa8Pw7Rb9zS+kKlGAxTd7hJB/I7q0S4LqflZnEKxb6AqEBe88eDxw5BjWA5zGWEWKFxzkwY71NyeSCjG7wWISvWV0mU9w2pK+um/xPYI+3rsP4WkT9IvO+hWL/PSx4Fvx2zH7Wz4V/tvTCQ+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NrSRaS1H; arc=pass smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NrSRaS1H"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e512ee9so222069e0c.0
        for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2026 06:31:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789738292; cv=none;
        d=google.com; s=arc-20260327;
        b=qk6HuyFCOyXsx/VENXe9u99XCzEiJ8h+qx2XPWjt0qu5sw2JnYwpnOiOFDVZjx8zRM
         DX63/cdZie8FSlptNtsjQqb86Nq6lhsUc+/vxo3Qp38drKeQ5o8aerWoEV9cgt7RAcOs
         iCYkfOvaNTI54ywtHUZLxdf3u+aiv/Zi/vgP0KWqVhXV1CL8XyymOqw3AEyvvq16RjuS
         MOkvCj4LPSFq1HeSrGRmWgg9F0SZ69v0sYG5BWY9VGu7jBTfDhORLgs7hWNiomyfL8Va
         vf7Sjkb2r2ivA+gLHFcsI2lgO3Fs7lYjn1qfnO0UlwE0lwRC4t+vBrwCXIgR3Q1V1Va7
         d2lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gM3qzf5HyIbeFr4VStpJH9Lqmc3PhcQZvkxVrBDvbGo=;
        fh=AQA7VKCK6bNDjnc9EYBE16wT/WK6aaWJRPjEhE8J2aY=;
        b=UidHww54zgGum06qs4espJY5YGgxYFgyZq4yKThQRB7ED66INLk1eMwxCyjBy3vo8u
         z1b+w52AM8bWEIW0pIDgcvmd9IPrB6S8/wpUBpOwNyRVytGlpg0FWQBGanlGSHiOf7R8
         szCvg9JQrLm0RPeC5qnJKk2RSgzYM0iUOS+PSpok+BfdIPXYMcsoZfWoyEinhcNgGlvg
         0LQ/rE2e33krAu9N7nVduUlE+i4jMWthmULRqgaMTxqpv48BSGmhNckUPp/ss5fY+bmN
         BIEc2wSqz3GlEZjbFNhGHfVkplDFWljE6UDMnN69BMrjaI7jGQMAf5F/Oq7oMZw2UDel
         j8kg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738292; x=1790343092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gM3qzf5HyIbeFr4VStpJH9Lqmc3PhcQZvkxVrBDvbGo=;
        b=NrSRaS1HYEQCHazIaxVUO5/FMrQ3z2SeGkGi/TZl61g8ze+pq+5+zZSBvRYqAXsAmW
         tD2o9oh4XC922xba1j72J8j7Q/BivNYGN/QiLCWngLOhFR/zLSOVKB5mQRXSgQ6k7w+/
         6qSFLkZqugDbjvOgthBKlMNFLFCTUq6MA5fBFmAQU3jKIC9jiye6RTepnOi4QAyXV+dl
         irF0W4g0hkF3n6x1vSnSh5ZlGDaRwKMvk6X0p6acoYEEyhP29K9fYKV+A0lm1L3oZjZU
         f0USgeumzw+TcW4v+cB0N07zl53tvZKmanpeaQ2aVkel7zFhhQ/j+sJcOuTDPlJHkPwJ
         5EFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738292; x=1790343092;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gM3qzf5HyIbeFr4VStpJH9Lqmc3PhcQZvkxVrBDvbGo=;
        b=AnRavEcl38ygVRjrpGVpXt+GOqRjyjARiDVqleA1Tq9M7sXmfxy2RRzfczGCGaMM+k
         BZ4uoot+14KI7HG7XZw8EwlRYpkAzNRSqA2mGf6TIiA1ka5JrQxz5A8BJ/DYiabWAAxJ
         XLlJGn5DVLoxdpIF0yKIUihChQzt4zCRsT625u6Xf/O0M4jisQNyhwyULo+r7gAoXQ0i
         RxR8K1UlMmvNyLEjzgIaCkYNKyJRQ7LYZPj/RLxnmbEQYSEhjQJpRuFsRFX60t28gB3a
         aLApxHvNzyRF6qk0xAeFtN3C0SquxjPHDHJMTrj9nV0kqWaHr1G4Ose21BHfqDTQr4s/
         DytA==
X-Forwarded-Encrypted: i=1; AKwUvByJ4CthqpT2euuxcJKU0ZvfEXk/Sq0MjgOVQcMHgwcRAh4ZrL3KRm60MP4MoZX0yOxB5OjyCHZqnrU=@vger.kernel.org
X-Gm-Message-State: AFuF++n1qJRBu762gdTpWN6GunLYN0LnSoC+e4+EuwqOI0Q07pzWygc3
	89XiRDK+UgX1gF+uQyprHewD0b0e8MWO3JdvJINwFpSkh59O5R2n3Se41Eew2ykIuiMr4ARmR92
	tlxnQelKy8AsynnsvreCfU8Rsxs3A+HU=
X-Gm-Gg: AYBFou0UkIiiyTl75Wmvt4eTBGqPuqjxwJxMrG1XkhFFqxnF/6TfYxNiK2a0mUo9t4X
	EU9tUBCfqR4xHjxswvu8Jjx+z+BVwd5iaqUCM8knX6HCn/8KpvmRXa4m1jgdP+SM9yjbbDirb+x
	ocTrYyldd0FaNheCB2DZDs/mC5Sdpu0PUQ1Q2tgTm35cCd6rSwer1g2aBqohbRYyI0Oi0Llj8a6
	0rgp1v3Z++EUpzqHbvUBCnsanaUbgAqZn6RyBBejbeNnzZ3Hj0tjVaA+4clJwkJSEiM2MeCHe4f
	xC5VKzjtWXyN9rXae93TB8Ll74fdNl6m/fSLi2x41oWw9fkvZJPqjG/LCwmC8BznmHjg7pNtYJD
	87ipiZ/0T3qYsGrWnht8lhFy+xoKBfirIgSnDItq2geDx8RMRm9BGrOKXyjOvctd+6eOh7LibqK
	cZK/G2cHnR779LwiM2
X-Received: by 2002:a05:6122:208d:b0:5c9:a60d:327b with SMTP id
 71dfb90a1353d-5c9b59cc72cmr1153759e0c.15.1789738289484; Fri, 18 Sep 2026
 06:31:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cec9b2a0-3454-45a6-b128-51d708cc8cbc@rowland.harvard.edu>
 <CAFmvuTUwGr-=joWrsYMu-Ra3XpHTe_HFhaY5inJnhg=e5b=1PA@mail.gmail.com>
 <1a93bb26-9ded-4b71-b409-62896a2681a6@rowland.harvard.edu>
 <CAFmvuTUogd8MyQM02VpM7iHaopzrOoex+X-McQE28X1fgb_AeQ@mail.gmail.com>
 <0b6b13ff-789e-4ba4-9765-1052a154ef27@rowland.harvard.edu>
 <CAFmvuTXeg2LykJa060WUYAhhQpdwGV74VFkMb6Wu5zjyqWzxmw@mail.gmail.com>
 <f42b44ef-b083-4976-bf06-f2a21098474b@rowland.harvard.edu>
 <CAFmvuTUZ+iP313qz5J5vaT7QGz2y-tHQ6XMrq2tnvStZqXDECg@mail.gmail.com>
 <7a87e293-633c-4100-aa8d-91560ba5e5c5@rowland.harvard.edu>
 <CAFmvuTU9xfCWFaoXzE6J0uC6y6eCZ43CRg+JWkLV3dgLNYu5Cw@mail.gmail.com> <9c07ce98-a5bf-4bcc-9304-e7f5e1747842@rowland.harvard.edu>
In-Reply-To: <9c07ce98-a5bf-4bcc-9304-e7f5e1747842@rowland.harvard.edu>
From: Minseo Kim <neck3922@gmail.com>
Date: Fri, 18 Sep 2026 22:30:00 +0900
X-Gm-Features: AcwNN1UqtmHPZUOiNvw-c88pw_9TsnHt3gCNAZsUMJy2r2Yq4nJ5sbmxYbHOujk
Message-ID: <CAFmvuTW5kqF8zNp7wSxB3abhD9ZvfJ0gu9Si8kRTiwcuXOeVuw@mail.gmail.com>
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF in ep_aio_cancel()
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrey Konovalov <andreyknvl@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alan,

> I wonder which part of the code was holding udc_usage above 0?

It was the udc_usage increment in ep_aio() during request submission.
The increment occurs before dev->lock is released to call
kiocb_set_cancel_fn() and usb_ep_queue(), and the corresponding decrement
occurs after usb_ep_queue() returns:

    ++epdata->dev->udc_usage;
    spin_unlock_irq(&epdata->dev->lock);

    kiocb_set_cancel_fn(iocb, ep_aio_cancel);
    value =3D usb_ep_queue(ep, req, GFP_KERNEL);

    spin_lock_irq(&epdata->dev->lock);
    --epdata->dev->udc_usage;

In the matched control, a request with a length of 64 bytes took the
direct giveback path, where dummy_queue() calls
usb_gadget_giveback_request() before returning to usb_ep_queue().
usb_gadget_giveback_request() synchronously invokes the request's
completion callback, which was ep_aio_complete() in this test. Because I
held ep_aio_complete() at the diagnostic gate immediately after
iocb->ki_complete() returned, the nested giveback call could not return.
Consequently, neither dummy_queue() nor usb_ep_queue() had returned, and
ep_aio() had not reached the decrement. gadgetfs_unbind() therefore saw
udc_usage at 1 and waited.

In the normal transfer test, by contrast, usb_ep_queue() returned and
ep_aio() decremented udc_usage before the later completion callback ran.
I confirmed this ordering in three runs without enabling a callback
gate.

I verified the sequence for direct giveback with markers after the
increment, after usb_ep_queue() returned but before the decrement, after
the decrement, and immediately before and after the unbind wait. In each
of three runs, markers with the same dev pointer showed ep_aio()
incrementing udc_usage to 1 and gadgetfs_unbind() entering the udc_usage
wait with the count still at 1. After I released the diagnostic gate,
usb_ep_queue() returned, ep_aio() decremented the count to 0, and
gadgetfs_unbind() left the wait.

> I will submit the patches, with your Signed-off-by:
> added to this one also, if that's okay with you.

Yes, that is okay with me. Please add it as:

Minseo Kim <neck3922@gmail.com>

Thank you for taking this forward.

With sincere appreciation and great respect,
Minseo Kim

2026=EB=85=84 9=EC=9B=94 18=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 12:38, =
Alan Stern <stern@rowland.harvard.edu>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
>
> On Thu, Sep 17, 2026 at 11:02:13PM +0900, Minseo Kim wrote:
> > Hi Alan,
> >
> > Thank you for the patch.
> >
> > > Can you repeat these tests with the patch below applied on top
> > > of the other two?  It should cause usb_gadget_unregister_driver() to
> > > wait until ep_aio_complete() returns (the actual wait loop is in
> > > dummy-hcd's dummy_udc_async_callbacks() routine).
> >
> > Yes. With the new dummy_hcd change applied on top of the two GadgetFS
> > patches, usb_gadget_unregister_driver() waited in
> > dummy_udc_async_callbacks() until the held ep_aio_complete() callback
> > returned in both the normal transfer path through dummy_giveback() and
> > the direct giveback path in dummy_queue().
> >
> > I used upstream v7.2-rc1 as the base. Because dummy_giveback() is not
> > present in v7.2-rc1, both matched test trees also included the changes
> > from upstream commit d5e5cd3654d2b5359a12ea6586120f05b28634ee
> > ("usb: gadget: dummy_hcd: prevent fifo_req reuse during giveback").
>
> Okay.  I recently rebased my kernel tree to v7.3-rc3, so a few
> discrepancies are to be expected.
>
> > In the normal transfer case, I held ep_aio_complete() immediately after
> > iocb->ki_complete(). Without the new dummy_hcd change,
> > dummy_udc_async_callbacks(false) saw callback_usage equal to 0, and the
> > ep0 close returned while the callback was still held. With the change,
> > it saw callback_usage equal to 1, and the ep0 close task remained block=
ed
> > in dummy_udc_async_callbacks(). The relevant part of the blocked close
> > task's stack was:
> >
> >     dummy_udc_async_callbacks [dummy_hcd]
> >     gadget_unbind_driver
> >     device_remove
> >     device_release_driver_internal
> >     driver_detach
> >     bus_remove_driver
> >     driver_unregister
> >     usb_gadget_unregister_driver
> >     dev_release [gadgetfs]
>
> That is just as it should be.
>
> dummy-hcd emulates a UDC driver.  With a real driver, givebacks would be
> triggered by a device interrupt (signalling completion of a request) and
> the synchronize_irq() call in gadget_unbind_driver() would wait until
> outstanding calls to the IRQ handler (and thus the completion handler)
> had completed.  But dummy-hcd doesn't have real hardware, so instead of
> device interrupts it relies on timer interrupts and its
> dummy_ucd_async_callbacks() routine is supposed to emulate
> synchronize_irq().  Thus it should wait until all outstanding completion
> handler calls have completed.
>
> > After I released the callback gate, ep_aio_complete() returned,
> > callback_usage fell to 0, and the same close completed. I observed this
> > sequence in four separate runs with the new change.
> >
> > To exercise the other accounting site, I separately tested the direct
> > giveback path for a 64-byte write in dummy_queue(). With the change, th=
e
> > close task again waited in dummy_udc_async_callbacks() with callback_us=
age
> > equal to 1. In the matched control, dummy_udc_async_callbacks() returne=
d
> > with callback_usage at 0, and gadgetfs_unbind() then remained in its
> > existing udc_usage wait until I released the callback gate.
>
> I wonder which part of the code was holding udc_usage above 0?
>
> > I also repeated the case where the request was still on the endpoint
> > queue when usb_ep_disable() began. Neither usb_ep_disable() nor the ep0
> > close returned while the completion callback was held. After I released
> > the callback gate, io_getevents() returned one completion with
> > res=3D-ESHUTDOWN, and a subsequent check returned no additional complet=
ion
> > event.
>
> It all sounds good.  I will submit the patches, with your Signed-off-by:
> added to this one also, if that's okay with you.
>
> Alan Stern
