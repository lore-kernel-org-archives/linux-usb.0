Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203620;
	b=YYFsv8U8o79+JAPyvTURwNCGAdM2QzHxoWUpo1gwr1Gt+57v5XMHJtReLziOOKZVG4AU
	 hIoYGALCyMIhJLUTiiw8J4vhUEC0xiI8siPgcUMoVngjxzQ+5X9HsVA10ZxsXKHzHRrkW
	 IvMBouK/bNy2UnFvYcF7mGgJbb9knRMFSa++ujVZscykwZjnIQ1NZmZlkHwSLmDiPphYr
	 CT3+KZqiQWjl2Eh21wJ9IgJD5xLJdFLzMU+rb/ZwGTgc/+nRape1LF3jiIdZ9JAHfs2fq
	 tg7cgBDKglnunKvXGnji0dZ3itDHJyaVsrjbHFiXZ6lva9mLEke40xDO9pcUm/4j68A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203620;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZlIUgNeCJej6P6gG3sC9wVLuR3KUB6+0bnBoo4k4LtE=;
	b=HlfrvlexWtVZWycpl1ywlCD7w5NnqfSReHQe2FEcr/+ZtpSHclf731RvGhG6VrvocOxA
	 lYzNzut3QsaXnmIYMD1CyB/WXwHr6icDguRRSSQaG3WjcvGq0SXT//j8DM+0uLnMxhACu
	 mSucS5CMMGrONy2ieI9jJ6Y2fHOut1RVJlYL9EDeK/fJ3n4mT63qaGTCmnni92MOISvnK
	 f+dwnFnAUCYimnkLYudwPKxX5FydeTZizzXhfkKhlvMmQEOvEtkd/w6kumFIu4k3c1L3/
	 p1QBIKiI+d4faBU263PlmpxujiduF/cW5HzaldHVUsdV8+DMn25B8zAWJOhSu+oXrlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bi6cY+lG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1A4606A6C2
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 19:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bi6cY+lG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56F0D1F008B2;
	Fri, 20 Nov 2026 19:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795203620;
	bh=ZlIUgNeCJej6P6gG3sC9wVLuR3KUB6+0bnBoo4k4LtE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bi6cY+lGlnKpU8G82i2DVh+LjSpT7IdUhZQbCNVXKcA+s8sTtlIpZyUp/iCg9gf9u
	 4557Gcq0poTi1KxqwMsGniJB/a4GYSUvc5n8d5YnH4G5HHA35rdCXVF9NPREsxv+xd
	 IjE/8oWb2tqp9ey+bP1bmmeJ13LcjNhOYanQ9scZ3+P2FYrc5zMpib4ybUMkLpGhPj
	 RyoxLUIHQ7OBjj1Gh8nwEE73s5hk/H64kXONLBE0gZZolOUr7oMq0IJtkPwdFCnkEw
	 irYbS+hjJSeXEijCtmBh+MXeFi4fAiPsDLjYBZ0CY7XNuwcJtdbQtgo40vpvLHt/ra
	 ymAWw5IvU2mYA==
Message-ID: <sashiko-outbox-225940@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] usb: gadget: f_fs: fix use-after-free in
 ffs_closed() on umount
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Mosafer" <mohsafer@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261120192415.335646-1-mohsafer@gmail.com>
References: <2026112030-aflame-skid-859a@gregkh>
 <20261120192415.335646-1-mohsafer@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 19:40:19 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] usb: gadget: f_fs: Fixes trailer cites 5920cda627688c instead of
  ecfbd7b9054b
--

commit cfe09aaba9522f24cae9e22dc082e6797e54adda
Author: Mohammad Mosafer <mohsafer@gmail.com>

> usb: gadget: f_fs: fix use-after-free in ffs_closed() on umount
>
> ffs_free_inst() releases the ffs_dev with ffs_release_dev() and only
> then re-acquires ffs_dev_lock to free it with _ffs_free_dev().  In
> between, the dev is still linked on the ffs_devices list while already
> marked unmounted, so a concurrent mount(2) of functionfs finds it by
> name in ffs_acquire_dev() and links a fresh ffs_data to the doomed dev
> (ffs_data->private_data =3D dev).  _ffs_free_dev() then kfrees the dev,
> and when that mount is torn down, ffs_closed() dereferences the stale
> ffs->private_data:
>
>   BUG: KASAN: slab-use-after-free in ffs_data_clear+0x438/0x530
>   Write of size 1 at addr ffff88810594664a by task repro/116
>     ffs_data_clear+0x438/0x530
>     ffs_fs_kill_sb+0x7b/0x510
>     deactivate_locked_super+0xa9/0x200
>     cleanup_mnt+0x255/0x380
>     ... reached via umount(2)
>   Freed by task 112:
>     kfree+0x127/0x3b0
>     ffs_free_inst+0x10c/0x1a0
>     usb_put_function_instance+0x8a/0xc0
>     configfs_rmdir+0x773/0x9c0
>   Allocated by task 113:
>     ffs_alloc_inst+0x109/0x360
>     function_make+0x138/0x330
>     configfs_mkdir+0x48b/0x1090
>
> Hold ffs_dev_lock across the release and the free so that a released
> dev is never findable, splitting ffs_release_dev() into a lock-assuming
> _ffs_release_dev() (matching the _ffs_* convention in this file) and
> enforcing its caller-holds-the-lock contract with lockdep_assert_held().
> For the same reason, re-read ffs->private_data under ffs_dev_lock in
> ffs_data_put(): the argument read there was unlocked, so a concurrent
> ffs_free_inst() could unlink and free the dev while the putter waited
> on the mutex, and the subsequent ffs_release_dev() would dereference
> the freed dev.  The now unreached ffs_release_dev() wrapper is dropped;
> its remaining callers use _ffs_release_dev() with the lock held.
>
> The race was reproduced with a multi-threaded harness racing configfs
> mkdir/rmdir of the ffs instance against mount/umount of functionfs on
> a KASAN kernel: the unpatched kernel reports the use-after-free
> reliably (2/2 runs), the patched kernel survives an extended soak with
> identical churn (2/2 runs clean).
>
> Reported-by: syzbot+6227549bd2c8a1ec8ba0@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D6227549bd2c8a1ec8ba0
> Fixes: 5920cda627688c ("usb: gadget: FunctionFS: convert to new function =
interface with backward compatibility")
> Signed-off-by: Mohammad Mosafer <mohsafer@gmail.com>

[Severity: Low]
In 5920cda62768 ("usb: gadget: FunctionFS: convert to new function
interface with backward compatibility"), ffs_free_inst() only acquired
ffs_dev_lock() once around ffs_free_dev(opts->dev) without calling
ffs_release_dev(), and ffs_release_dev() took struct ffs_data * and read
ffs_data->private_data under ffs_dev_lock().

Both the lock gap between ffs_release_dev() and _ffs_free_dev() in
ffs_free_inst() and the unlocked ffs->private_data read in
ffs_data_put() were introduced later by ecfbd7b9054b ("usb: gadget:
f_fs: Fix setting of device and driver data cross-references").

Should the Fixes tag reference that commit instead?

  Fixes: ecfbd7b9054b ("usb: gadget: f_fs: Fix setting of device and driver=
 data cross-references")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120192415.3356=
46-1-mohsafer@gmail.com?part=3D1
