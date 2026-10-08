Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B509145A1F
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 00:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791420577; cv=none; b=DUI79sOGASbqC1GZVgH8AcQXLs58r+0rS9by7U2gCAuTaJQbAHeoh3VZI55gKwCxcRFJCqDcs69QIioFtyF0EEiQ0ZXPLLokxYULVKzXetBwSEKQf7gs3ZIAo/vEHfYq4/ul199cqCKhmDX6s1rCGvv9lQPjCZxmNBLNjZjVgg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791420577; c=relaxed/simple;
	bh=0sUu/AN3X8RNeCjNDDPu2dhEt4lrJmJMgvOfL0AzzMo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=aukfTt19xeB09VHI44LqCqGg9+KDyy36eAehDAjvxSrE6IwWq0KiUGWUg9z6VRmL1YIq4cKMKgCHjnBiQHpilHNJE4EgB03kitPaTDZTaQYyLUZStl2116FlplQm+1qw61ewpgYW8E5J/oLXQCgCvkQs+XXMz31IG2+FuTYpUt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bcVWvMrJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bcVWvMrJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C75E1F00893;
	Thu,  8 Oct 2026 00:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791420576;
	bh=0sUu/AN3X8RNeCjNDDPu2dhEt4lrJmJMgvOfL0AzzMo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bcVWvMrJrdyRVhdk/A6wDaMxZ0i9Lwd2izA4BEZJbjEKo+ACHwIo8mIm3B7Kq2tlm
	 34M1kvl0HpMy1mbYWT8Ud3Iw8F7hhJucJKr751BF43p7aBLkEHRVIigZ2IcEFjBC5Y
	 YVTslBZMO48+S6er3Hycpkp7lEFF43bz05VCHA5FNwAajQ4bbT+4nUP78oZVRgPEaY
	 4ljuIg3DRJWEa2hItXydU5T5GWkoRe1wd4XHeyvF6tYGovvQDoWDbw1pROsM2BN6qy
	 uMZ+1t4zSAbV/pizFuGU/1PBlUYVYSV+T8r45hzZoK31Ak000yOhuS0Xi1+6FGY37d
	 7MIvRErxi1ZcQ==
Message-ID: <sashiko-outbox-163481@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: f_fs: fix use-after-free on umount
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eduard Zateev" <hackerowskiy@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008003955.1191-1-hackerowskiy@gmail.com>
References: <20261008003955.1191-1-hackerowskiy@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 00:49:35 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> ffs_free_inst() releases a device and drops ffs_dev_lock before it
> removes and frees the device. A concurrent FunctionFS mount can find
> the released device in that window, attach a new ffs_data to it, and
> then use the freed device from ffs_closed() during unmount.
>=20
> Keep ffs_dev_lock held across release and free so a new mount cannot
> attach to a device being torn down. In ffs_data_put(), read
> ffs->private_data only after acquiring the same lock, since a concurrent
> ffs_free_inst() may clear and free the referenced device while the
> putter waits for the lock.
>=20
> Fixes: ecfbd7b9054b ("usb: gadget: f_fs: Fix setting of device and driver=
 data cross-references")
>=20
> Reported-by: syzbot+6227549bd2c8a1ec8ba0@syzkaller.appspotmail.com
>=20
> Link: https://syzkaller.appspot.com/bug?extid=3D6227549bd2c8a1ec8ba0
> Signed-off-by: Eduard Zateev <hackerowskiy@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008003955.1191=
-1-hackerowskiy@gmail.com?part=3D1

