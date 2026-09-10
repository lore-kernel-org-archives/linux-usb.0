Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B3945A28B
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 10:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789037845; cv=pass; b=oQ8tTnNJPW1YUOid8cyr6jrPIpja1VtZTIf7XJoInqCQlJBFxuvQ08FPrmWPhk/VdpyO9RjHiZ6c611mHtgFfXZIBpx5GGOI6Nn7Fvezmaym09secBU0Cm66wNLj/yFeoBCE58CrVmomiEY1Xpyz9erqHMyOwNC0i8P7Qp08200=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789037845; c=relaxed/simple;
	bh=G98wm182ByRQjNH5zsXThdRTx0J7xMSr1hsaIvb95Fk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KWYauEfbl4+5+V8BFDv//XB8+Fx1vc0EXwC8kmmRbeLVSQI+Lc6c0KylbOX6OlZaOp+Z70WUNql+MaPMYD9NC+s9Kclxd3STTxCP6LvK35jRhn2+hKezeA8ZIm36DPe0A/abMMHUVsHMZqLUd5kbyQjAtRTdofmvJ9WfAvUQ95A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jGXGpp8/; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jGXGpp8/"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d0e19300cso6379875e9.1
        for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 03:57:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789037841; cv=none;
        d=google.com; s=arc-20260327;
        b=S9fr2DzpEUlGODXZ3Wu8cL7aUxT+Nt5PUohSv6z1JIp65VkfMS5M4bCjmD75B/ATqd
         0xr30GD8/vN8BD13J4ZYtGeZzSiJydMiWNnP68tovzVdmtMSPddOmbSEz4reqrx9PhQ/
         fq2lt8ONwnURuANg+Y5D1+/Jf8lnGtfSffdCI5T+c32bOr+NLMCXX93BROCpBy25RbIV
         LKZqZ7D/yXDp1r6VRi73y65KIxVXVqW/930bOHTVlzwmt82nvGmQib0RyqaDkDRN/rxb
         hbRjF0xGdocpUvTGWwJCehKxzefacdd06thVKqxDW8jM2FC7m153s1yzIrLDax51F9rK
         njTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sqo1ROF5ElJGcJZJBe8UZKlFcnLYT8iWyrDB0Jbm0Bc=;
        fh=AMTTW8SLN4dH957jAoU5DFBRKycNIcB5Hz3xWHoq4oU=;
        b=OTOkYV1fuEEyuoKHOEqLI2m1FQs+0vm1/stjLYvdKdq+US8bfKslRBxbMB7w8zxkMI
         AxB1wOui3jqqlQBLlWRID7heTnEo2sv130+AEzOVU9s4uAz0vS4fUVYHoVqzzNy+zToM
         F278EyQjNtHykC/VYVknJPq0++6v0BVD5wkP2o9zF77jeKceepZM59Eoy8/ceygu73Hl
         Qp8iou6NTdBR4myh46atr9LWFV1vP4IPyXCUr6h+BAtsUfP067Zc3YIj8YXxLv5DE3xr
         V226ekO33LKNxTkj/5ehZc2UF1LvKuoMrUVDg184odtLAa9TWVRpEabG2YQbQAIgVoKV
         R8iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789037841; x=1789642641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sqo1ROF5ElJGcJZJBe8UZKlFcnLYT8iWyrDB0Jbm0Bc=;
        b=jGXGpp8/UdJzSiM3Vy5EJ8ovzGB/y0KliV6/IA4Wc0w05nrj+Cz16G4kQeJsQc1eXp
         XU9fod3KD2qrUN32ZGR3xblO2EfVHQz6LGwCFdH0Yc0CQEakeHCurfW7U5Np1vdnlLvd
         /Y3N9sQApu9P24YQrYkN2741W4Lu0QVwj/2csEMIbGVAkxdKbX52mNEtX/fMiGXDOZSP
         O3FvGLCgCZJ3wNTyuEy1qBy1ZaNluV9unTcTxxhIKZBM+0we+u+asD3TVMPbApli2sTF
         ZMSTK93KSsTNoWji3CgKDRTjlOurnYf8pQmcJeeZPrupiH+lkwzGTHfdmxtfGGr9LBpi
         4bxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789037841; x=1789642641;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sqo1ROF5ElJGcJZJBe8UZKlFcnLYT8iWyrDB0Jbm0Bc=;
        b=kqe2owBDlOifgo2nPJA5P08ND81MUDR3SWy3TcM8UD1NX8N7D1hJIEJUeqd0/juVYA
         a7guZ3Razydbsq3EHsyMG7NH/PSuhyBd5dkrLY1kwVkk9ZN7LkKLKAPOPgGkGwX5nBKZ
         49to9GicqMF7pRe9f3u4eUUu9C0SSMSSH29SB4bgkyfi2tZh0oR7WoFe30hR1Ro42s8G
         SImioZLYF6xocSE3dO8N2FW6NPJEPLijcdN40soKLZDmkfzKDeWp7S6l80I7kuE9CQpw
         uCbm7bi/6ffQK+nJ8Ha3x/DRszETFfI1NvhFKM5/A2/BbxKPRQopxcj9fMY8vg164XGK
         ECTg==
X-Forwarded-Encrypted: i=1; AKwUvBxVBHWE0Q9Vh5ERLTbSrPZtFVJV2ONJ0Xkva0YQ5fM5ce/obZ/un/KN6afNi4BCUMgFxPCg/dBmRO0=@vger.kernel.org
X-Gm-Message-State: AFuF++lFrMFKmoHk3o8z4M7NVJ8tWqJrnjJju8Glek2gE1HQx3xUAyc3
	J4woVnBUJltWVAudY5hGPRYTWwqOIcPABmh31+JvF9SRg/AQKvWF+2PGaPwu7lfc8NzihTMd13J
	HJMAW/d7NaHFOoyayOh5bqV60rV8ELek=
X-Gm-Gg: AYBFou15x4e+mus5GFOS1DYU1OpBQci9LL9MFQVXlEnK0vdwoz1lGvR2LjPbfOQGNi4
	OSxE5Q4yl6IzEBgrVbWSdc4nTjlDGBq29U5xf+SqU1MkcWoOSi1et8VTaqM1UOozmWL0mmzr+ib
	pbcolKOK/ZzzbWH/s0gW0oGk7zs0prLJ8e8efiBxnzTltCEMJ9XQnpn2KGKA0nwJdt9cf/Z8gDQ
	DY1TaKbH7Ri3Bd+ltmQFRtO6rjRnB16auEy0aAXc7qMGnNZbVrq8YlZxRCHXdRSlScW9aoX7GG6
	eqs4HfcYsVx/00ZaS3Rh/5VGyK8vy0x6Odbzvyw6TlX9tVzaVdJTqeS9DBfK8piMtBg=
X-Received: by 2002:a05:600c:4f44:b0:49d:e0c:e55e with SMTP id
 5b1f17b1804b1-49d25914e45mr64006245e9.23.1789037841326; Thu, 10 Sep 2026
 03:57:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910082008.12397-1-syedtayyabfarooq08@gmail.com> <2026091034-slicing-same-692a@gregkh>
In-Reply-To: <2026091034-slicing-same-692a@gregkh>
From: Syed Tayyab Farooq <syedtayyabfarooq08@gmail.com>
Date: Thu, 10 Sep 2026 15:57:10 +0500
X-Gm-Features: AcwNN1UYDtkvMAOTQp5N6tgZWBENzlNjkY4td5DzUUFN3PGSmoQuBP93u4dW6oQ
Message-ID: <CAKD4hN5x9McTTAVKSK90VfcPTZZJmUAXwXyzY9m3RkZYnygJVQ@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: u_serial: fix use-after-free between tty
 open/close and gserial_free_line
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Brownell <dbrownell@users.sourceforge.net>, 
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	syzbot+fe63e4d633540f230624@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for catching that. Yes to both. I have sent a Patch v2 with the
added assisted-by tag.

Best Regards,
Tayyab

On Thu, Sep 10, 2026 at 1:38=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Sep 10, 2026 at 01:17:19PM +0500, Syed Tayyab Farooq wrote:
> > syzbot reports a slab-use-after-free in tty_init_dev()/gs_close()
> > involving struct gs_port. The port is allocated when a gadget serial
> > function instance is created via configfs mkdir (gserial_alloc_line())
> > and freed via a plain kfree() in gserial_free_port() when the instance
> > is removed via configfs rmdir(). Nothing prevented a concurrent
> > open("/dev/ttyGS*") from racing with rmdir: the tty core could still
> > reach gs_open()/gs_close() and dereference the gs_port after it had
> > already been freed, since the ports[] table entry these functions
> > looked up was a bare pointer with no refcounting tied to the tty core.
> >
> > Fix this by giving struct gs_port proper tty_port-managed lifetime:
> >
> >  - Add gs_install()/gs_cleanup() tty_operations. gs_install() looks up
> >    the port once under ports[idx].lock, takes a tty_port_get()
> >    reference, and stores the result in tty->driver_data. gs_cleanup()
> >    drops that reference when the tty_struct is released. This ties the
> >    gs_port's minimum lifetime to the tty_struct using it, so it can no
> >    longer be freed out from under an open tty.
> >
> >  - Give tty_port a destructor (gs_port_destruct()) that does the
> >    kfree() that gserial_free_port() used to do directly, and
> >    switch gserial_free_port() to tty_port_put() instead of an
> >    unconditional kfree(). Also, tty_port_destroy is automatically calle=
d
> >    when the reference reaches 0. The struct is now only actually freed =
once
> >    its last reference (held by either the ports[] table or a live tty)
> >    is dropped.
> >
> >  - Stop gs_open() from independently re-deriving the port from
> >    ports[port_num].port and reassigning tty->driver_data. gs_install()
> >    is now the single place that looks up and pins the port; gs_open()
> >    re-deriving it separately could, on an unlucky race with the port
> >    index being freed and reallocated, leave tty->port and
> >    tty->driver_data pointing at two different gs_port instances, with
> >    the one gs_close() uses left unprotected. gs_open() now just uses
> >    the already-validated tty->driver_data, while still holding
> >    ports[port_num].lock across the first-open kfifo allocation to
> >    serialize concurrent first opens against each other (kfifo_alloc()
> >    needs GFP_KERNEL, so it can't run under port_lock).
> >
> >  - In gs_close(), a tty's .close() can legitimately run against a port
> >    whose port.count is still 0, e.g. when gs_open() fails and the tty
> >    core unwinds via tty_release(). The previous code treated this as
> >    an impossible state (WARN_ON(1)), which trips panic_on_warn on
> >    syzbot and isn't actually a bug -- it's an expected outcome of a
> >    failed open. Treat count =3D=3D 0 the same as any other "not the las=
t
> >    closer" case and return quietly instead of warning.
> >
> > Reported-by: syzbot+fe63e4d633540f230624@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3Dfe63e4d633540f230624
> > Fixes: c1dca562be8a ("usb gadget: split out serial core")
> > Signed-off-by: Syed Tayyab Farooq <syedtayyabfarooq08@gmail.com>
> > ---
> >  drivers/usb/gadget/function/u_serial.c | 64 +++++++++++++++++++++++---
> >  1 file changed, 57 insertions(+), 7 deletions(-)
>
> Did you forget an Assisted-by: tag?  And did syzbot test this?
>
> thanks,
>
> greg k-h
