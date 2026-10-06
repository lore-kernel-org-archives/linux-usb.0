Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D088754707A
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 21:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791321468; cv=none; b=kV3uinis9Y+2l7UyQUWnntTYsBGGbRzCm3zMCsPjZt5cGwt1YzkDstZQkC5w/RkoAzFq/1RhczkuoKFsRPJ1IjaRBVf5v+wr7/JLAio+3BCuPJHAMLLe1BoG3HZRhj/8kSABsRpMxkm5lgTMEd6ejJoJoiCWiCL7x+MeguKpEFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791321468; c=relaxed/simple;
	bh=xoavo/fxilz03iI6XzFVhp0DIw4P8tF4A55NoudKQnY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ujPe01amzac9mikbwstcm3IPvCtzLuICXaiET+2dXtNmJZzwt/Tj07xkrycn1wclQf3YL4zDHYJWNBA5l8DlUh3A+j60feG88Dk8nVpzYqCCPAFpsq4FiKnXdO1J7fiN1JhzhJuibJ1Jpgc5w1xr/HeJV1gvNintR2IwV5g8EuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GybA1r3v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GybA1r3v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F66E1F0089B;
	Tue,  6 Oct 2026 21:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791321466;
	bh=E89rz/F2Ao/c3y8yto4Ut8qYXyFeyJpWYKEZ2m8Q+5A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GybA1r3vCcLhm1/42fhcFMOb6hC2BllpSwvx97qp0x93inDlDTl+Hp9mYFRr8qSzU
	 JhPbqWhG3N3YFe36XlxKc3frcoNS78D8Sn5rT5yq60j8devFzdJ9VfLctlJkILw/EF
	 p4r9mYpNzLaAyy0K+3mHCWRxjTsagme45djzVrw8Mz2XYR3iOKOfrdarRZyyjEO2IM
	 qsSaRyicIlEkfid1u7P0Ur8Ylth362broueQv/mE008vPd7e57NO53XDqVFtMATf6A
	 bW850v1utB45j9MUVLp3z1NadssDgyQzpTzr/CLzAuvUaVxN9O86Z4FjIeKenTAoFK
	 vZhS17vIqvOgQ==
Message-ID: <sashiko-outbox-162459@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: f_fs: fix use-after-free in ffs_closed()
 on umount
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Mosafer" <mohsafer@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261006210523.150724-1-mohsafer@gmail.com>
References: <20261006210523.150724-1-mohsafer@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 21:17:45 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usb: ffs: TOCTOU use-after-free in ffs_data_put()
--

commit 215b73da4a8e129ed558d6bf4fd1b28619b9f490
Author: Mohammad Mosafer <mohsafer@gmail.com>

    usb: gadget: f_fs: fix use-after-free in ffs_closed() on umount
   =20
    This commit fixes a use-after-free in ffs_closed() during umount by hol=
ding
    ffs_dev_lock across the release and free operations in ffs_free_inst().
    It splits ffs_release_dev() into a lockless _ffs_release_dev() and a lo=
cked
    wrapper to ensure the device cannot be found by a concurrent mount(2) w=
hile
    it is being torn down.
   =20
    Reported-by: syzbot+6227549bd2c8a1ec8ba0@syzkaller.appspotmail.com
    Closes: https://syzkaller.appspot.com/bug?extid=3D6227549bd2c8a1ec8ba0
    Fixes: 5920cda627688c ("usb: gadget: FunctionFS: convert to new functio=
n interface with backward compatibility")

> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/func=
tion/f_fs.c
> index c64a268e98a43..5e7179b4250ef 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c

[ ... ]

> @@ -4147,8 +4148,17 @@ static void ffs_free_inst(struct usb_function_inst=
ance *f)
>  	struct f_fs_opts *opts;
> =20
>  	opts =3D to_f_fs_opts(f);
> -	ffs_release_dev(opts->dev);
> +
> +	/*
> +	 * Release and free the dev under a single ffs_dev_lock critical
> +	 * section. Between ffs_release_dev() and _ffs_free_dev() the dev
> +	 * would still be on the ffs_devices list while already unmounted,
> +	 * so a concurrent ffs_acquire_dev() could link a fresh ffs_data to
> +	 * the doomed dev, leaving it with a dangling ->private_data that is
> +	 * dereferenced in ffs_closed() when that mount is torn down.
> +	 */
>  	ffs_dev_lock();
> +	_ffs_release_dev(opts->dev);
>  	_ffs_free_dev(opts->dev);
>  	ffs_dev_unlock();
>  	kfree(opts);

[Severity: High]
Is it possible for this change to trigger a time-of-check to time-of-use
use-after-free of the ffs_dev object?

Looking at ffs_data_put() in drivers/usb/gadget/function/f_fs.c, it evaluat=
es
the device pointer locklessly before calling ffs_release_dev():

ffs_data_put()
    ...
    ffs_release_dev(ffs->private_data);

If a concurrent configfs_rmdir() invokes ffs_free_inst(), could the followi=
ng
sequence occur?

Thread 1
ffs_data_put()
    evaluates ffs->private_data (obtaining the ffs_dev pointer)
    calls ffs_release_dev(), blocking on ffs_dev_lock()

Thread 2
ffs_free_inst()
    ffs_dev_lock();
    _ffs_release_dev(opts->dev);
    _ffs_free_dev(opts->dev); // device is freed here
    ffs_dev_unlock();

Thread 1
ffs_release_dev()
    acquires ffs_dev_lock()
    _ffs_release_dev(ffs_dev) // ffs_dev is now stale

Inside _ffs_release_dev(), the code checks:

    if (ffs_dev && ffs_dev->mounted)

This would dereference the stale ffs_dev pointer.

Can this sequence occur when userspace unmounts and manipulates configfs
concurrently?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006210523.1507=
24-1-mohsafer@gmail.com?part=3D1
