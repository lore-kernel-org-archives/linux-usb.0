Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792493385;
	b=Yi3TWNU42sprVlASXeaE+IyGrY9nk7x4q/QwF/Wq6t+jNuZBXzGUePw6VvIlXvMUq1H8
	 6z3Zxl3FUj2aocdH6A+eKDQ5ZuvfxSVKP8oOxVbxwtqUFwXDh6UCNgpjdPPmy28SowmIr
	 glVDb6a9kHgz3hXpO3yAzda9KcwdrolzZbMBxucIQ7YwlHSbSJWm56830EFGgAdgzvhOG
	 ttwYNDvpsW8DX/elxlCfkF//9ybmTGqSM6aMPzIcmQyqFGCbOO/+wbkXBOCPg0qE1gb4q
	 f5VwSn4GAfgxld1MGALya4PtKNaaGQcqfCM8EBoA97Y0XeBDgjrlW7v0RQnqV+p13kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0ERjj3b6jlFN0zemFoMz78y4i9w1Q1w2xDGBIcTZIVk=;
	b=KRCcK30Vxj83F/zDwqJNtX2C0kAU75O0cyp+j2RsZXTN+KaHKpEx58hf5a53B92k667a
	 h2DaZbqxqHtuCsSF8NYwwR0F4UssUc4YkgldVHEMCEl2HqYDgVxCu6EoS8RNPk4UXiCxl
	 k0Jg5GlJRiwfvOgGeN7L0C9gJgKeUw2Yvmp31FdMkv9oXSTIynn6z93qSGM9NQGjagKUU
	 E7jV+sTNQLPCq7mYszD3HBLUFK62riL1DBfl/83kfVBvG4Ca+gydb94WaxPrmOWRY5bHe
	 WnfuHPFFZfWmWdd3B0gdF08jFvnpoINpW+8kPdwMnjn8bKZtODtQsla//2+tHUbAcwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TPpX3wnG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80717606A31C
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 10:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80717606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TPpX3wnG
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1df146015so18212735e9.0
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 03:49:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792493383; cv=none;
        d=google.com; s=arc-20260327;
        b=pDXeH2CxvNBYODT7vTa2PATT6oMomT2ehh8dbH1J5ISpogwbgtNR4ZtMhZZrn9A+hC
         aj5sfigx7PIP4wIbLZnLr3unaNyCVgYmcuBhgLszonVPBRGAXEY56PhrwiPzer0rbllf
         TkGOjLvt/T8ZLIbtmf4WFEYfpdZIziGNbYTvSVmDn0FPXGTv95vbQw7BNGvdIOzbLJxu
         MM0saEJaOvoY+PmpAIHGcB8SXe5ExEhtTAA1BwwHYEYmcwPJfcKZ3B3uhFxTQ0DA972/
         DkY7uKgbnz+VsL9jySiKuO/gIlS2hpm8gnNKGbVrPw0pz6ZWh3khwkMuhQhV63rY5Wn5
         RnJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0ERjj3b6jlFN0zemFoMz78y4i9w1Q1w2xDGBIcTZIVk=;
        fh=OEkzcLstg0R3bw8fPNqoNszC56Fydqb+llaaXuShOAU=;
        b=ZTjzRSOa9zLrHqwhgHMJwG+7h7FtXUcXUkJfCpiz2+le37sbeOo1Ql1g9pPChfjQwm
         tpx4ypwE304QTSW4e5fic8YSQuLXeO1uEbCYaq12g9WxjFV3lzQ5In4vdUE23axYzb5r
         PuQ7mj/wwbYIVmqG4HguOxoVVqojXMw8G0w6tM0XZ71p05w/K0I/vX9TDh9/HfUXvVG7
         ZS2a/Ko2Weu/CYcSAaKxrVMKF1ci5vgoyF+kiCsdM92RLbtRvGmE9zJghrHgdyfW2cLr
         vRuH7qZl8IML33QFIsq7OuSaGrIUzAHFNr8RHTdWdBZ23Uj8t+cbiuutEwW8iqnhnD8v
         jM9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792493383; x=1793098183; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0ERjj3b6jlFN0zemFoMz78y4i9w1Q1w2xDGBIcTZIVk=;
        b=TPpX3wnGOQahTvPAnK4i+JyMtHVrDR7xB/ESQEn0GoaTeyr2uJOBhZTChKBSNtqOER
         axyxhisG3PqQBrVJfLr7QITFq4C9TqSb0pW0KeX8gAaroLBxl2rUQyy82Xi7RY+lgagN
         s/Qt1CaXs5KtqdKfsiTWmgPaVHUwAZ5TIVDUMm70Oj68PXNJj4FKbWKK97povLrVTD/e
         5oSPp/z6eOuu8ZUWen1h2kTW4Iw56CiMm6gdZXT9vR/N9zF9xmQu9nO2dlpHXCaChdcq
         rOC13SLEBU855JgZJIcQyNkWuHeOW1bNQSh+wuSALXsvbCWZEqe0Em6nyqbzv9jE6qUm
         Lj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792493383; x=1793098183;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ERjj3b6jlFN0zemFoMz78y4i9w1Q1w2xDGBIcTZIVk=;
        b=xErzD9jn7QWBJhMlCu8YID98WOVyow9hMSNIneDTgnKFDXRMryxLGdPPUrwJHeD0uZ
         e9q1olMVtOw3kVwf3XuWHrPgQ7z/+CodPHCFAfxtKT9/m6fGOm7kM5QzyHRZL+3MuovQ
         FglL2+2D+KQo9NUWYWqfsusTZtvq7tNjoUXe5B1q9REaFACAI3A/7ngoNoG/POmFxx9+
         6N1uEqrBRLEwOg/IDHDALFf4WPAgDLyy6ligMYQERZW4+sKRSpCmnYTRuJGA5XMbUfzm
         u5zD9AHF348zEdQ6MYpMyAQ0XHkKSn9uhTGuZlyMMGCTgceg8eEpLMxGVpnm3FQHiQr+
         k8tA==
X-Forwarded-Encrypted: i=1; AKwUvBzmwrn5lPvpZz/0HxJaGetxuHMerkFlNJa2CB8S+162af+8OU9848ShkNQhHsipxxvvPvOJb6Bj1+Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbmLD8IkKtfNqeZX8dzJ74FftxzraLgqSJCg0WZ7wXiqAS0NEx
	gN1q7NuYLW4au9NmMz5agRS/73zrW80bQDltLo0cWtwb4fGdOxc6/+Ousj8egjn2loci2qouv/I
	y6sepsUViJJK0I/JEGbGuaLy3kYIN6Sw=
X-Gm-Gg: AYBFou25Ms8PDHxTSqnuqC96dVC5tpVdqp1++ovrOknb2dhEERLXZ/ynQ8hUnl5Qn0i
	TeQjHa6mmxLUSh8r8QCks19D3Q2J6UmEBJS/WFX7rVHiGbjNSFD6SPUDVhs/GdusQ4wKRPcZC0s
	amf7TcYRRkO+y3ytCSRpsbwOFcLcjw6m9ro3qj2FXKIU8rD6mId+z4MFvEpi/qo64TjX+9e0Fps
	f9l+jTu9CUuT083PGKnDyHFWtNVpUMKxckH4Lcn6uaaURp3EmMiy4S7Z5LANiol3xoNEcGQZ740
	IZo1Fq6rDnlnskcGEjHwnuYVnL5vKGyyI9aM/uUXoQsPEHrQB23n/ljXzJBFC3MLvXxOyrSLSs3
	0jg==
X-Received: by 2002:a05:600c:4e8a:b0:4a1:cedc:ab51 with SMTP id
 5b1f17b1804b1-4a1d76315d7mr240612575e9.35.1792493382711; Tue, 20 Oct 2026
 03:49:42 -0700 (PDT)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260910082008.12397-1-syedtayyabfarooq08@gmail.com> <2026091034-slicing-same-692a@gregkh>
In-Reply-To: <2026091034-slicing-same-692a@gregkh>
From: Syed Tayyab Farooq <syedtayyabfarooq08@gmail.com>
Date: Tue, 20 Oct 2026 15:49:29 +0500
X-Gm-Features: AclHuK-mv7z6N1nztlZcm0gQ1fK6qCovt-jNOk4zF2MaRkNEXkkLjayfgXV9GsU
Message-ID: <CAKD4hN41w_bRPAY3i9=tD1tWQLag3r-FGsngD5U6igM=FWe-_Q@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: u_serial: fix use-after-free between tty
 open/close and gserial_free_line
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Brownell <dbrownell@users.sourceforge.net>, 
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	syzbot+fe63e4d633540f230624@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I wanted to follow up on this patch, if anyone has had a chance to review i=
t.

Thanks,
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
