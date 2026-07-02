Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562F940E8FA
	for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2026 08:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782979712; cv=pass; b=OdGrPvw9OgwU8Je16Df3JkRbjZ9EKNSTTJKc3erI8PpNNan3lMOw/OHGqBRFZ2oGI4FxLwqCIEccPiO0y4J6HYdH/94UFfHeKlaor8hQO2iptFFU34gHUsFt3VTP4iPq23DjklS0ePZWx9JMClEfZbOFY0B804D10JTSekdWM0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782979712; c=relaxed/simple;
	bh=0OmRQMSNURFpZHlCxaa9jd72i7O7iJRzV9mt2X66YfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tr23tmqKE4aXMu2DCupSspXgEF660k6gks8EJiBbQAmvjhNvXqIZOx9CNVF7hFZDrtV3DtMFfrbbUyQMXJ712EPv1oHJDd9v8DME4WxjI7dusRN8yINC6vLCCzyW7xfkZUCEE/npCUjAXndtxSX0AQxP8q41qLLjyofRjSvJE8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lv4p8hEv; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lv4p8hEv"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-516d0db9372so11092021cf.2
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2026 01:08:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782979709; cv=none;
        d=google.com; s=arc-20260327;
        b=sfGbwBxqTKT1cQ9NvScEdliXtM8pRvOsSBmJ98b90qp7iB/ZXbVCDGUOeAC9hKc/+v
         JIxKxWX7XlRVe26ZIi4ALtFfD1uBWOPRXVglQ/3b998jhZ3T2jFMQ1yQNlQK8asvG2nH
         Z6+Gkapf3nYJKw9kPrRP9c41Prj/1w9qadTpR7nMTQlB7scF3h0ijR+Cx4tcS45XP6at
         2YLYwjh1GD+GuO++Ft6oHvFMemr/QOWlHq9DrS1v2AWmzDHpbjamO86cxQX1dyF9iQvE
         /0lo/WNbDAe4OVdfSpvQKyr15i6TJBfTmSUrGAG7Bw2Hbuagv/mv6xAzkgioGMLAnQ0A
         zodw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KXEe41/K89dG5eeUOVK9nnRwIp/NCaetuc1g8nKpwdM=;
        fh=9FTHRM1mjBEH3ELTv7TNt7FZHBCBGj4IuhffMItJ2hc=;
        b=IaKWmoeU+1/xlPGlzLQamRCaxT3fUFr4MjGxCqNtT2HDlQBmHsIfFbXbCd/fTf/0OV
         IYdZQk6A5nge6lGepDxKlgb7UfRDGtGggcZZFFaca2rkg+rSHRwKGH1BVz3K/cF2dg8L
         wHS4lFJ2QlbAoKps2Fd8RsKGUR3I1D9UKXQ/S1h0dauWocunbMsQQ0khkzJ6d7Ky6/kL
         usowVMppE7ZE2KKUJi8ys92E709KlN7YNxM/hRoaljQufxudib3el5CGWrevAWILYF2e
         K8aF2duZjVm+arPvMZ7iD5GObm3LvHzTAlxrYX6R5Yn0fQn8jlvP3hDm1Gx0q7LtRLK1
         W69w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782979709; x=1783584509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KXEe41/K89dG5eeUOVK9nnRwIp/NCaetuc1g8nKpwdM=;
        b=lv4p8hEvx4OdXud0F2J6017QzcdSwGshAAlhiRvS0hZXObsIUZSAhHOaFKDY8J6Ou0
         Tb+W7f+GwJbyq3b4ze5/CwEf2ngy6hd5nkkxgqPzFU/0MUHRdgZZXm4X8bJ4dIEWYx1y
         mDO/bAxgFYfWhizv4n8t7PaT5WjlJ4IpYyqenRZNyADR4c8ezRM5baLbHLkZtDzBEmPU
         gDEemTzhPcgasT7iclFkpAObKIfq2D/2l/O5YY4JFmkxxTN1xDezbbIxUpg2Fle5JMeU
         mhTZMMNULOGf4U9oeBDOYLBtjYl/BxF7r1v+VXfthRO9Ew1doa7PJbwgHD8d/Y2/rgGx
         NOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782979709; x=1783584509;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KXEe41/K89dG5eeUOVK9nnRwIp/NCaetuc1g8nKpwdM=;
        b=AYo94wVgOOor+1ZD5SdjD7J+uJmPjirQAedj+GQ6g/sY3J/u7qqJwndb4YoFm4FPm3
         MVOGBrmKithFlElwSvPf7mkNATwVY3V9A+3YllzbYpaVX6tQ5AKU5ezJPlPMfdUrqTCi
         eHVwRk0wa9vHCLx8PR6dHaYiPrALOjMdkfhOUyOT3Z7CbjMmpdrhMeYCFBDDFnTLKR0T
         AZhTP3qau1tjZBAt+DCWZtVnMTjhfegBxWTiDnpO3EH3/+7FTgf6g6x1de7yMKh31dLv
         euE+74LuV7iPULjfdbv91jxH+0O3Hmy71QBWOGtFA7GN9tBqwna7Fd0fdrDqDvOHWGmn
         ajEw==
X-Forwarded-Encrypted: i=1; AFNElJ8ryeEkg9YgF4O56spD0UcG+wx0LG7rWh/42cNgOBTXfIFzKPLIXe5KI79AQDpAHft3Z19rrNPLmAU=@vger.kernel.org
X-Gm-Message-State: AOJu0YykwxldR5FawTYmRw/FJ+eVbiaC0VSJZZ7PoztrdxtcKuCi9C0U
	eyj5rqAGFfsQpIw9dEe0xxOnlnWb7FnZEVk++Qn9RNpocjgqfC5j09qclxQIATwTg7kUyd9ScMo
	vYT/6+c8/BnIdYK7WEKIEEh/Yfvtd2Io=
X-Gm-Gg: AfdE7cl6JdOp+JAkwd1Vgorqne7dNGuKzmLxCumbl83G/QgPvyNxFGi9IUNQz7JgIDW
	L5kfeSmAY+Z1stM8I2vDX08WDdgkwct/h/rJI82SlY+eIlBDiu+0l3KbJODQYR9nkVC72w44lkX
	zItrVvYoy8kMI54cfU5TKcoC0zAhtcfRvR9iMuCDg0bz8SPyy79Mjn58hyvGf00K6uElnuHpGOA
	r5Solj4/tOxoyWRJan96ck4Q5SthqJbsGg6wDOmDKph3h08NbJq1z7DOmzbbiQa4XHDf8zc
X-Received: by 2002:a05:622a:588c:b0:51c:11ba:c51e with SMTP id
 d75a77b69052e-51c2aeff294mr54619341cf.56.1782979709363; Thu, 02 Jul 2026
 01:08:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFmvuTWc880R=mw7=kixfx3Yb8u9thLHPA7D=rm6a8p9dYBBDA@mail.gmail.com>
 <2d4a91dc-037f-4c31-8ce1-7bc840d42b0b@rowland.harvard.edu>
In-Reply-To: <2d4a91dc-037f-4c31-8ce1-7bc840d42b0b@rowland.harvard.edu>
From: =?UTF-8?B?6rmA66+87ISc?= <neck3922@gmail.com>
Date: Thu, 2 Jul 2026 17:08:17 +0900
X-Gm-Features: AVVi8CcnguiY9lR8V8FTCexkQoLaEn0LvMpJY6Q9a3p2TOsSxAUPOHEd8bw_Jyw
Message-ID: <CAFmvuTWq7TKZaj6R9JJzWhwe1WB1FanZ17T1-TFL1g2wsUBZ4w@mail.gmail.com>
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF in ep_aio_cancel()
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Thank you for taking a look.

I do not want to over-specify the exact fix, but my tentative view from
the reproducer runs and code inspection is that the key invariant is that
struct kiocb_priv should either remain valid while it can still be reached
by ep_aio_cancel() for the same iocb, or it should be made unreachable from
the cancel path in a synchronized way.

In the immediate completion path I am looking at, ep_aio_complete()
appears to clear fields in priv and then free priv before iocb->private is
set to NULL and before iocb->ki_complete() runs. Meanwhile ep_aio_cancel()
reads iocb->private and immediately dereferences priv->epdata.

That seems to explain both symptoms I observed: a NULL-deref if
iocb->private is already NULL, and a UAF if cancellation observes a stale
non-NULL priv pointer.

I may be missing some ordering guarantee in the AIO core, but from the
reproducer this is the window that seems relevant. So I think a NULL check
in ep_aio_cancel() would likely handle the repeated NULL-deref symptom,
but may not address the stale non-NULL case. A safer direction might be to
ensure sufficient serialization or lifetime ordering around iocb->private /
struct kiocb_priv, so that either priv remains valid for the cancel
callback, or cancellation is already unreachable before priv is freed for
that iocb.

Best regards,
Minseo Kim

2026=EB=85=84 7=EC=9B=94 1=EC=9D=BC (=EC=88=98) =EC=98=A4=EC=A0=84 11:13, A=
lan Stern <stern@rowland.harvard.edu>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Wed, Jul 01, 2026 at 08:08:34AM +0900, =EA=B9=80=EB=AF=BC=EC=84=9C wro=
te:
> > Hello,
> >
> > I am reporting a USB gadgetfs AIO cancellation bug reproduced on upstre=
am
> > v7.2-rc1, commit dc59e4fea9d83f03bad6bddf3fa2e52491777482, with KASAN
> > enabled. In my test environment, the reproducer repeatedly triggers a
> > KASAN null-ptr-deref/general protection fault in ep_aio_cancel(). I als=
o
> > observed an intermittent slab-use-after-free at the same dereference si=
te.
> >
> > Target file:
> >   drivers/usb/gadget/legacy/inode.c
> > Subsystem: USB gadgetfs
> > Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git
> > Git head: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> > Kernel release: v7.2-rc1
> >
> > Observed crash:
> >
> >   KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f=
]
> >   RIP: ep_aio_cancel+0x47/0xf0 drivers/usb/gadget/legacy/inode.c:455
> >
> > Additional intermittent UAF observation:
> >
> >   BUG: KASAN: slab-use-after-free in ep_aio_cancel+0x25/0x90
> >   drivers/usb/gadget/legacy/inode.c:455
> >
> > Relevant stack:
> >
> >   ep_aio_cancel
> >   __do_sys_io_cancel
> >   __se_sys_io_cancel
> >   __x64_sys_io_cancel
> >   do_syscall_64
> >   entry_SYSCALL_64_after_hwframe
> >
> > Root cause analysis:
> >
> > The crash appears to involve a race between gadgetfs AIO completion and
> > AIO cancellation.
> >
> > In drivers/usb/gadget/legacy/inode.c, ep_aio_cancel() does:
> >
> >   struct kiocb_priv *priv =3D iocb->private;
> >   ...
> >   epdata =3D priv->epdata;
> >
> > At the same time, ep_aio_complete() can clear fields in the same privat=
e
> > object and then free it on the completion path before setting
> > iocb->private to NULL:
> >
> >   priv->req =3D NULL;
> >   priv->epdata =3D NULL;
> >   ...
> >   kfree(req->buf);
> >   kfree(priv->to_free);
> >   kfree(priv);
> >   iocb->private =3D NULL;
> >
> > My current understanding is that completion and cancellation are not
> > effectively serialized around this lifetime transition.
> >
> > If cancellation observes NULL after iocb->private has been cleared,
> > ep_aio_cancel() dereferences priv->epdata through a NULL priv pointer a=
nd
> > reports the null-ptr-deref.
> >
> > If cancellation observes the old non-NULL priv pointer after completion
> > has freed it, or if completion frees priv after cancellation loads it b=
ut
> > before cancellation reads priv->epdata, the same dereference can surfac=
e
> > as a slab-use-after-free.
>
> Great!  You clearly put a lot of work into finding this problem.  How do
> you suggest we fix it?
>
> Alan Stern
