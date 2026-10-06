Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3AE388E6B
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 22:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791324006; cv=none; b=Kd6dMyNIfDf/oErHQWfwXGLp/4mUvXiS/iLBsgeFMgOAl6CKGXjnqaxkAwTMEmuOM6/p511wm95Y10dy47eI95wrl8VjEkilbDPkxde/wy3Gfga39b80vJqRafKl8QUTDMBsP8c1rOHs1Jek2ejOub9N54q9PbYzPxMxhoOaeWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791324006; c=relaxed/simple;
	bh=kElYFJSWopeK+INlZIsBVOM5idjiG3DYYX0s2kcaR5c=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=QvNas93tCra+NhHEF4YzXxvVcT0DJEZ0gfNOQYUl5mrpMe/CJ+ZyBByG/Ox7gCrQGwM/ZPkTu46LorPGiQbGj9wKqqfVXk7Sid29o9cas4vYkT4piT78AzZ/W1s/BJAhYUJg1HaDrLhJnNyX1gXm15NiV1DdSA9LQQGTXCXpcys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hV0+l49O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hV0+l49O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E61B1F0089C;
	Tue,  6 Oct 2026 22:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791324005;
	bh=DqFNe4X0Oz5SErJxiH3O1rl1wL+7sTgDusN7SXUDmB8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hV0+l49OZ4aCZPQvom3mmlYwATV0oV1s16Cih8F2VJUGGBCpsDm/bTK7kwsfZ9DZl
	 A9EwCWKkKF4E7xYx1d7V4b36iEBcZmqjCJYx7wCM+duNQ4mq7/K7JTYFT4wXF5Mi3P
	 705VoVqQVEWzl+Xmt+4L1WlQUbKfMFK3mBELmNh5p3x/javlec5ATe7VIGOW49uTbX
	 5FvJ+UGEaH/JOcNk24+lqZJjh9Fwo/5Nl8LoT56TINSh3n192dTK+KiPlCdHo3XkFp
	 hZPNFoP3DGdHl74pY+OBEi76vK6VBPTQ1XPQzzbNHlGEEAosVIyt1Q0SoTU1rwxg1s
	 KPTwtDU/Eju5A==
Message-ID: <sashiko-outbox-162472@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: gadget: f_fs: fix use-after-free in
 ffs_closed() on umount
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Mosafer" <mohsafer@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261006214940.158352-1-mohsafer@gmail.com>
References: <20261006210523.150724-1-mohsafer@gmail.com>
 <20261006214940.158352-1-mohsafer@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 22:00:03 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> ffs_free_inst() releases the ffs_dev with ffs_release_dev() and only
> then re-acquires ffs_dev_lock to free it with _ffs_free_dev().  In
> between, the dev is still linked on the ffs_devices list while already
> marked unmounted, so a concurrent mount(2) of functionfs finds it by
> name in ffs_acquire_dev() and links a fresh ffs_data to the doomed dev
> (ffs_data->private_data =3D dev).  _ffs_free_dev() then kfrees the dev,
> and when that mount is torn down, ffs_closed() dereferences the stale
> ffs->private_data:
>=20
>   BUG: KASAN: slab-use-after-free in ffs_data_clear+0x438/0x530
>   Write of size 1 at addr ffff88810594664a by task repro/116
>     ffs_data_clear+0x438/0x530
>     ffs_fs_kill_sb+0x7b/0x510
>     deactivate_locked_super+0xa9/0x200
>     cleanup_mnt+0x255/0x380
> [ ... ]
>=20
> Reported-by: syzbot+6227549bd2c8a1ec8ba0@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D6227549bd2c8a1ec8ba0
> Fixes: 5920cda627688c ("usb: gadget: FunctionFS: convert to new function =
interface with backward compatibility")
> Signed-off-by: Mohammad Mosafer <mohsafer@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006214940.1583=
52-1-mohsafer@gmail.com?part=3D1

