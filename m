Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C3A286D70
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 20:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791319772; cv=none; b=Cl61vW1i8YcR3KvFzZKikFnQ7Ca4HWX4Cop4bFu4eRtheDH0BCafAAISfo7UJGwx/HqQOMXAg23Cm4aLNFuZ5Z922r369551dUeSKI8Xz+AvTiMSI0r2rLhp4B7xlgM8pwfnywfotCTMPzxlnEtUk0SRdPGbtEF5spgJsRJpbzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791319772; c=relaxed/simple;
	bh=9LcsOL93U7bn7xJkkpOyClrZ8PfPsyk8kjO+S6GUBbU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=I2UD9R06OiFFAK4qQ6O4PODPLXFCdWTnaS+k0RON0EZsc611cETuInon+dx4NrVhKha3dbZhSpKPzUk+IZjCqoA2pfC6FTMwUmwGW/iq2U/G9NTAzn1fWR3oDENVk0nZXRXc08KAMgMWxg0/kFMzIbweghoAxLWK3Zy9BrTURW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iJJn1+EL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iJJn1+EL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80D911F0089B;
	Tue,  6 Oct 2026 20:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791319770;
	bh=KklsX3Z6spYja1ghjgVLHDRR/doEve/AczgqkEWXOJw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iJJn1+EL+DyjzJHoacJmmG8oFymDYoq6YoX+eLJupTJwbl10i5vYGckQNEYR50kI/
	 3aeR3s5S4I1JupEawyzZGCgBPzqH8R7ks+8ReV9/3REwUyFW2WWYfdDFDY2HAMs6Db
	 BPK8Eu9cmJjhvKGfDC6msB0i0HdjZ16OUoHm2Tkpx6gpA5rXKRJ1XzeNtvNXAnPIzC
	 CFNOy7kMeO6uJ3XajU4W9MvEk5JAn4F5bwDzVkYWhMK1LjJmPQwREu3gBbng+nQUy4
	 vTLsP6bO1VyrxGydBtAnhHtPk2XYPafYmU1Dy9V5ni8BtwYgasZlQrRqbcKSLF7A5l
	 aZzCPryOf/0fQ==
Message-ID: <sashiko-outbox-162442@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: f_fs: fix use-after-free of ffs_dev in
 ffs_free_inst()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Palla Raghunath" <raghunathpalla.0209@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261006204202.59604-1-raghunathpalla.0209@gmail.com>
References: <20261006204202.59604-1-raghunathpalla.0209@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 20:49:30 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

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
> Fixes: ecfbd7b9054b ("usb: gadget: f_fs: Fix setting of device and driver=
 data cross-references")
> Cc: stable@vger.kernel.org
> Reported-by: syzbot+6227549bd2c8a1ec8ba0@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D6227549bd2c8a1ec8ba0
> Signed-off-by: Palla Raghunath <raghunathpalla.0209@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006204202.5960=
4-1-raghunathpalla.0209@gmail.com?part=3D1

