Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795216610;
	b=J7L2T0T2UYo5TgiQBoGMMh8uQDnSr6meidGbsEaTK9fn2+jkfprFzbpehiXxT6jUBe0e
	 xzAajNo3rT97+6BVjOcQyM7wtgOf9OgDOeewp7nyGOxE9gmsR9b//YPU4aBkCGekOC4p6
	 qh9G6t9K+wtmxsVDio317gY9DIEBKWK6d6PQx8AZwT5SSZZKqPNQeB9HWG1M/QfeM2jum
	 mSiGWfh0pTObSwskECCChffOSlvzyn+IfdDQKld8KY9Y/QwIiA6K6Ca0IzM4rS6tbtwKQ
	 /voFxFy0ehTm4P1hcgtr6W1eMHjCaRuNbeojY7P0Hn7S4Nr+ZEUExocNscZzJVyz0og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795216610;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jYCd4GVZHquaiq/Q28VE9KSZyasvn7yowcTywDh3zYE=;
	b=KFzig7wxxqrdoKzLbioUSDIO6/K9keQRpsb82/Px5VGzNolTHqxY4IoEdpsIC5ObNAZL
	 1Fzm/M5TnDrYHf0/QbKronLi0qoyd2MJ4AUSWwXU1lHw9vgQ6WawOg7tYjCUplozOCCWk
	 mhLSZ3U+Rmz5hHXOsnnPc8b5g6Zcvbyc0TQEvZQW0nM3qF+nQBSpgpIHUgOqmehbKpTNw
	 vCeaB50ZBliQwPOacYowSrVHUqbaxZbPWZ5tZ5y6gugbyvn9adYFiPwuXaanaw7xMWFOj
	 QUjd4XFxhoyFe6DFTvs5OhEHYRZ8P2gWy1jkCWp4u0vwkdVEgObYt1KU27u0/B+v0ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PosgJYt3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D891606A684
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 23:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PosgJYt3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E3C1F000C4;
	Fri, 20 Nov 2026 23:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795216609;
	bh=jYCd4GVZHquaiq/Q28VE9KSZyasvn7yowcTywDh3zYE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PosgJYt3zRNiFpoxtcrf2iQS/+gWFgVPEPiJFYJabg64x4W6NXdfeDHYWAA4AyuOK
	 sDoZ1FefTXU+PKL2wl7rjut/FAfpBLEcjbkTTyYdAyeUXdCcEE2CXFKEfGrBaEGFjw
	 yO4y3EKBQzDoAQGyHn3q/h3x4psq9Gx00JsVIHHjO3HYOJ/1BS64abjKBOeLwAzqPG
	 ehI+x4iMJi9PEcZ236EaIuWgtaGne+/2D69r42BJgyeI+J5zwfhDS111ijZc272f+A
	 dlp1kXgOw5DbTrACIxTWJ2Qz8razP3PkcMB0EXqAPYr1OvmSiEJovQrRFV3HBZlfDd
	 LJwFg0EbUibHQ==
Message-ID: <sashiko-outbox-226340@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: gadget: f_fs: fix use-after-free of ffs_dev in
 ffs_free_inst()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Palla Raghunath" <raghunathpalla.0209@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261120230711.14330-1-raghunathpalla.0209@gmail.com>
References: <20261120230711.14330-1-raghunathpalla.0209@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 23:16:47 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> When a function instance is removed through configfs, ffs_free_inst()
> first calls ffs_release_dev(), which takes ffs_dev_lock, detaches the
> dev from its mount and drops the lock again. Only then does it retake
> the lock and free the dev with _ffs_free_dev().
>=20
> Between those two steps the dev is still on the ffs_devices list. If
> someone mounts functionfs with the same instance name right then,
> ffs_acquire_dev() finds the dev, marks it mounted and points the new
> ffs_data at it. The dev is freed a moment later, and when that mount
> is torn down, ffs_closed() writes to freed memory. syzbot hit this:
>=20
>   BUG: KASAN: slab-use-after-free in ffs_closed drivers/usb/gadget/functi=
on/f_fs.c:4427 [inline]
>   BUG: KASAN: slab-use-after-free in ffs_data_clear+0x543/0x5b0 drivers/u=
sb/gadget/function/f_fs.c:2305
>   Write of size 1 at addr ffff8880237b1e4a by task syz-executor/11910
>   Call Trace:
> [ ... ]
> Cc: stable@vger.kernel.org
> Reported-by: syzbot+6227549bd2c8a1ec8ba0@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D6227549bd2c8a1ec8ba0
> Acked-by: Micha=C5=82 Nazarewicz <mina86@mina86.com>
> Signed-off-by: Palla Raghunath <raghunathpalla.0209@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120230711.1433=
0-1-raghunathpalla.0209@gmail.com?part=3D1
