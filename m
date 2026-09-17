Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F13E57C739
	for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 14:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789653748; cv=pass; b=TNExmQD0rCRwvNcSZ5mNsNkuCcSP6LX09Afwu5PshMnDP70prnFZbF9RWll81FpOMurwdeu03YjmxzXOER0R2yUTWSlueD7W9C+fnoaa0CgLlp7Kmzr3Wv43g4boiOKqqvHLg+IHVb4KtIIsD/0AJjW8iN40lgZ8OJGgqU3/GV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789653748; c=relaxed/simple;
	bh=Qt+RRi4ov/C/BgpmA8h6koMljAT9mu1K9gX4ZxYxfYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j46GLr6G5kCe80RRHWCWdg0h8nPlWGZjhZGbqPV3jre/QJ3uou3Z50vtoW462MBheJ7M+J3qqlDDw6my6pTWgvIXjIRd6Ad1Z5to9WboTSdX8x3hF9foDOAL/nOOITC/XdDAq5Jhze957BjPt5TvUP0EDFkOBFBA7k741VWfijI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xv5ry4QB; arc=pass smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xv5ry4QB"
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c98dc46a95so562610e0c.0
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 07:02:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789653745; cv=none;
        d=google.com; s=arc-20260327;
        b=S7LDdLDFdLyWo9X7C3Q3jHJ0+bWXI3YuSFCKsJj5r8lVtWud2zCO2fWjLfjffedXX2
         sbz9MHxclcO+P3gCk34hxyqRhpfgz6zdKBzOrhVnN0wVH1e28vytzLy4ukqKPLqth7Ji
         GcMsyytHestoyKCwJWm40eB36Ger1uwf5ldut64IdbvM8ees3G/ydgT0okjM9H44bnel
         BxvRvsoy7nfC9cCL2t1jM4nfiU0Ma9hwxoVrWECHsqhXBxQNmeDeCLfsaLvykyMHIaiR
         FJQS8bBROu0URT6pQht0oXqzGTo3a3uZ7ZwQf4vW+4c+7ApgCP5gO+9nqMC4tUh4X/3b
         XJ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+c7vgpkJTotylk9cqa9qUMorJlRska2RUHC3dbRFt6g=;
        fh=+YKvyklRkWpNNxHiIrTJPjVswB8wIcvYbO/S7JOkjvA=;
        b=pAnERlA+iGLAdGVoWOVKXzCNPMNHZvwXjIYhMLVSHYi7Zj/PpTfmx8NgN1r0rmb7wx
         c8YGRBCnitpFisj1kHjDyRP7iJO6Y5Rmm+vJgRVP1PPIAnLExyAmJTS4ajx2L4UKsnNh
         IKNhSXtnOAYL6Djz8kbXmGPAgUjIKibSJT/jfSgCGAu6yvhpVZezNKz1Dty/JkYu2MNy
         YeRXUsCW1qfN1+1E6/948t8wx/1pxq8eKYdYOAumGgamRP/sPgHCb0QHIYIp6+de1G5l
         B/PCyummWB9NCm1JDZYtgY66JeH4GDQdspHAnt165nH9AInDC4C7pkH+rwtKmlwWJRxV
         zCKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789653745; x=1790258545; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+c7vgpkJTotylk9cqa9qUMorJlRska2RUHC3dbRFt6g=;
        b=Xv5ry4QBiuuc40mWLYHkdXT6iX48MO6nomMKBpBayw7EziqNkFVZKDUBIs2AHjOMWP
         /MaSPC0RLRGsWf8E+NzH9j8tZb28JrR2UonMeF01z6udaCr0Hrpj/zM+STQKauaURDWM
         4mAh0AOkmWShdhoVUBDNZ+iP7SHfzpUBd4g1WYycWvfPl+aLgQ0rBQZ0rG/vZqX4J+UG
         GC9/BeE5SrytYE/RR/RZEMe/QnUSoBWGlNaJL5CkaybW8GCitS2Pio0fIDFnt1erdrlC
         fT3NFWYwffswZlSGyTYJxzxvXmJ2MI7wrCIkucsEbVfnfm9cG5e/nX6i2v5OGM/CpLSU
         Un8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789653745; x=1790258545;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+c7vgpkJTotylk9cqa9qUMorJlRska2RUHC3dbRFt6g=;
        b=n5QSxj7XBQ4e4Cv/XuZ2n3My2fTQ61trvBXfVyi4yntFSVKBbm9Iy/H06WReVzLswP
         y1b3ApAF6q4alc8dCHlvUB/j9GkZKCsRJ0bKeJAhY7BiBgNhcN++xp8CsDbZsvfTeWgp
         8T3+FszqIMaepTbkLYySrDdKghl94EOjf29x0qJju9MMFUOdQJPY3EHyl6FeW9z6/+hM
         IvqdOCXIQH4aaid+tkLr4FsHBTkJG7W4tnKY9wp2y4z7IQpt8jU4jGXx7bzcjxUfzdoO
         emDV9xp331j3obLloO9ig5jBzEgyOhD1UDu7dRrMgBNQKBM0Xpl1j7hBqbTtdHY1kEbX
         NiTQ==
X-Forwarded-Encrypted: i=1; AKwUvBy1O0HNmVzccXajHToMzCIw4utwWZ/1kWSZYtIBs6DKjTKnRRCDEIXMomiEjd5TnXv6+yHNbIj/ENs=@vger.kernel.org
X-Gm-Message-State: AFuF++ktIJUI8N1aTSMOJUkyJF515PcfkULWyrM6bKmb1Ci6+YMdZTmy
	vmRx2wMsQDmKRreAKCTfLoYUizGwJIO2XpENk+AshOVoImENTmSfv+oUXRVIT+xuhugwaV8ujEx
	xKkV/P5f75xbguG18sZJoEhmO0QriCAXYREd1Gzo=
X-Gm-Gg: AYBFou319TkIes0CQ3i602/oF4ogVm/QNCZmtzvu7Ttyn3NvLXXMN9hweg34bRfN5d7
	3108+ATwCNbadUuFxMZzE7bWT0vZBwPu/LptQtSQd2/NWcNbfjtIW2jISVT1cD1FB6F+C/DVT/i
	bh3zpAt4OY04Xup0HI+zSOlNfvSEC+3qMoyS2qo+fMYB4GgIJm6lBH85qXpwiFldBZsavBcNove
	fY6qq8BAGx+5dRigIc1txVpRIQxPCtYbRyDUFs3nc0LVVocmB/vYEAIAJkwG/8bYzxHUO2O2lO+
	NIfOpxTRjzlv1ELauqNrTFcgbPZhx14rhevQMiW2v1C9ccKbYdEuMJVrbyn9gXX2jcccCycKOQ6
	/wL+l3FRAOMU6i6a+6ubuvGzm4gjdyq9BGF8/kB3QnragU9v/utCn5Shwoa/QehOCcvTD5goZYM
	4ebW7CCA==
X-Received: by 2002:a05:6122:8713:b0:5c9:a6e6:f6de with SMTP id
 71dfb90a1353d-5c9a6e70177mr1518552e0c.7.1789653745139; Thu, 17 Sep 2026
 07:02:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <f928b74b-ce57-4454-bdd4-511b823bf742@rowland.harvard.edu>
 <CAFmvuTXwUiap39-FHv6aqGbJVzORRx8tV1QfN0BDjJaPsbfKHg@mail.gmail.com>
 <cec9b2a0-3454-45a6-b128-51d708cc8cbc@rowland.harvard.edu>
 <CAFmvuTUwGr-=joWrsYMu-Ra3XpHTe_HFhaY5inJnhg=e5b=1PA@mail.gmail.com>
 <1a93bb26-9ded-4b71-b409-62896a2681a6@rowland.harvard.edu>
 <CAFmvuTUogd8MyQM02VpM7iHaopzrOoex+X-McQE28X1fgb_AeQ@mail.gmail.com>
 <0b6b13ff-789e-4ba4-9765-1052a154ef27@rowland.harvard.edu>
 <CAFmvuTXeg2LykJa060WUYAhhQpdwGV74VFkMb6Wu5zjyqWzxmw@mail.gmail.com>
 <f42b44ef-b083-4976-bf06-f2a21098474b@rowland.harvard.edu>
 <CAFmvuTUZ+iP313qz5J5vaT7QGz2y-tHQ6XMrq2tnvStZqXDECg@mail.gmail.com> <7a87e293-633c-4100-aa8d-91560ba5e5c5@rowland.harvard.edu>
In-Reply-To: <7a87e293-633c-4100-aa8d-91560ba5e5c5@rowland.harvard.edu>
From: Minseo Kim <neck3922@gmail.com>
Date: Thu, 17 Sep 2026 23:02:13 +0900
X-Gm-Features: AcwNN1Uy16nqWZDA5Z8l-VCGmrF0_0ZP0EJJsPrAt_SyR-eGWA2-LB7Va-SFUvs
Message-ID: <CAFmvuTU9xfCWFaoXzE6J0uC6y6eCZ43CRg+JWkLV3dgLNYu5Cw@mail.gmail.com>
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF in ep_aio_cancel()
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrey Konovalov <andreyknvl@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Thank you for the patch.

> Can you repeat these tests with the patch below applied on top
> of the other two?  It should cause usb_gadget_unregister_driver() to
> wait until ep_aio_complete() returns (the actual wait loop is in
> dummy-hcd's dummy_udc_async_callbacks() routine).

Yes. With the new dummy_hcd change applied on top of the two GadgetFS
patches, usb_gadget_unregister_driver() waited in
dummy_udc_async_callbacks() until the held ep_aio_complete() callback
returned in both the normal transfer path through dummy_giveback() and
the direct giveback path in dummy_queue().

I used upstream v7.2-rc1 as the base. Because dummy_giveback() is not
present in v7.2-rc1, both matched test trees also included the changes
from upstream commit d5e5cd3654d2b5359a12ea6586120f05b28634ee
("usb: gadget: dummy_hcd: prevent fifo_req reuse during giveback").

In the normal transfer case, I held ep_aio_complete() immediately after
iocb->ki_complete(). Without the new dummy_hcd change,
dummy_udc_async_callbacks(false) saw callback_usage equal to 0, and the
ep0 close returned while the callback was still held. With the change,
it saw callback_usage equal to 1, and the ep0 close task remained blocked
in dummy_udc_async_callbacks(). The relevant part of the blocked close
task's stack was:

    dummy_udc_async_callbacks [dummy_hcd]
    gadget_unbind_driver
    device_remove
    device_release_driver_internal
    driver_detach
    bus_remove_driver
    driver_unregister
    usb_gadget_unregister_driver
    dev_release [gadgetfs]

After I released the callback gate, ep_aio_complete() returned,
callback_usage fell to 0, and the same close completed. I observed this
sequence in four separate runs with the new change.

To exercise the other accounting site, I separately tested the direct
giveback path for a 64-byte write in dummy_queue(). With the change, the
close task again waited in dummy_udc_async_callbacks() with callback_usage
equal to 1. In the matched control, dummy_udc_async_callbacks() returned
with callback_usage at 0, and gadgetfs_unbind() then remained in its
existing udc_usage wait until I released the callback gate.

I also repeated the case where the request was still on the endpoint
queue when usb_ep_disable() began. Neither usb_ep_disable() nor the ep0
close returned while the completion callback was held. After I released
the callback gate, io_getevents() returned one completion with
res=3D-ESHUTDOWN, and a subsequent check returned no additional completion
event.

With sincere appreciation and great respect,
Minseo Kim

2026=EB=85=84 9=EC=9B=94 17=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=84 4:39, A=
lan Stern <stern@rowland.harvard.edu>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Wed, Sep 16, 2026 at 11:00:00PM +0900, Minseo Kim wrote:
> > Hi Alan,
> >
> > > Hmmm.  Do you know where the unmount operation was getting stuck?  Wa=
s
> > > it the usb_gadget_unregister_driver() call inside dev_release()?  I j=
ust
> > > want to be sure about this.
> >
> > In these reruns, I found that the unmount task was blocked in
> > synchronize_rcu_expedited(), called from namespace_unlock(), rather tha=
n
> > in usb_gadget_unregister_driver().
> >
> > I reran the PWRITE callback tail test with both patches applied, using =
a
> > resident helper whose main thread invoked umount2() directly. A monitor
> > thread in the helper captured the blocked main thread's kernel stack. I=
n
> > three runs from fresh boots, the relevant frames were:
> >
> >     synchronize_rcu_expedited
> >     namespace_unlock
> >     path_umount
> >     __x64_sys_umount
> >
> > In each of those three runs, the same umount2() call returned
> > successfully after I released the callback gate.
> >
> > USB gadget request completion callbacks run with interrupts disabled, a=
nd
> > interrupt-disabled regions act as implicit RCU read-side critical
> > sections. The observed wait is therefore consistent with the diagnostic
> > gate delaying completion of the expedited grace period.
> >
> > I also added diagnostic markers around dev_release() and
> > usb_gadget_unregister_driver(). The test harness signaled the resident
> > helper only after the reproducer had closed ep0. In five clean runs fro=
m
> > fresh boots with these markers, both usb_gadget_unregister_driver() and
> > dev_release() had returned before the resident helper invoked umount2()=
,
> > while ep_aio_complete() was still held immediately after
> > iocb->ki_complete().
>
> Okay, that's not good.  We can't expect to rely on an unintended side
> effect.  All the completion handlers should finish before
> usb_gadget_unregister_driver() returns; we need to enforce that.
>
> I believe this misbehavior is caused by an oversight in the dummy-hcd
> driver.  Can you repeat these tests with the patch below applied on top
> of the other two?  It should cause usb_gadget_unregister_driver() to
> wait until ep_aio_complete() returns (the actual wait loop is in
> dummy-hcd's dummy_udc_async_callbacks() routine).
>
> Alan Stern
>
>
> Index: usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- usb-devel.orig/drivers/usb/gadget/udc/dummy_hcd.c
> +++ usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
> @@ -343,9 +343,11 @@ static void dummy_giveback(struct dummy
>  {
>         bool fifo =3D req =3D=3D &dum->fifo_req;
>
> +       ++dum->callback_usage;
>         spin_unlock(&dum->lock);
>         usb_gadget_giveback_request(_ep, &req->req);
>         spin_lock(&dum->lock);
> +       --dum->callback_usage;
>         if (fifo)
>                 dum->fifo_req_busy =3D 0;
>  }
> @@ -759,11 +761,13 @@ static int dummy_queue(struct usb_ep *_e
>                 req->req.complete =3D fifo_complete;
>
>                 list_add_tail(&req->queue, &ep->queue);
> +               ++dum->callback_usage;
>                 spin_unlock(&dum->lock);
>                 _req->actual =3D _req->length;
>                 _req->status =3D 0;
>                 usb_gadget_giveback_request(_ep, _req);
>                 spin_lock(&dum->lock);
> +               --dum->callback_usage;
>         }  else
>                 list_add_tail(&req->queue, &ep->queue);
>         spin_unlock_irqrestore(&dum->lock, flags);
>
