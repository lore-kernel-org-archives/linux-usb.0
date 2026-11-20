Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204367;
	b=oyskbuV1RO+LzBv/5VC9VZ/g6qc55jDLjt4erwwZUMSr20ZjHhPYZ7D39jeQWBZlA2r7
	 b2HsxPavuT5g9m/wuqhAqthgbc5j2hESUXdlL3PxxzkQ6ZUgdJ0AiOUIj+hv8TMbz/Mge
	 hUGjmPlY+uQQv2edj+51LpMRVnWql7VEFpKvXa77qOHVAggWGPIzALuFlsnmuJgk3mO+5
	 +4ANedG7JUWLERvUhafWB8TxoiyvnnsXUaouwqmpKuOeexsiiC4tIs2HTAnEN4GdeNZBA
	 /XKb6Zo5ycpF3TOFhKwakFJaM6Joyqg660Wye1WNn/1d6e0axFSqXTqfUT8EK4tex2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204367;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mpqwp+bhW1VHTUduSW5XS4D8f/ntKh4hvUaR+/0Gmfk=;
	b=iXbn0Iq6KbXINeqr1BD7egFLPWej8FDWJ4dnr3oupNekJS00At+B/x4d1JPSOtNuUTw5
	 XC4G1nuLhsDKmgRhmms3XWKDfBSpVPS6/WIoSsQm1OG4WNLV8KSGknEbuG0BwOdzw7WDx
	 AGelXcN4mvyEDeAYqE11fePzrKXPOFZhMYdSSDZZfrMnmIv4G9kPYPr8bmozMfp3vPfRp
	 5Tb63hhOofTVqkQuzhWE4oNIMkzniTz8pbEO7WmdiHBxvBsEeQXwlqof6kh5Tvs6FaFe+
	 Itl3RRpr3HovnY4q4Y50phpa22T6C6uH0mxF7hCiKdRPXdWIzIGLxASU4hD99sKfTjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KBrMgk2l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F7B606A6CF
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 19:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KBrMgk2l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C2F91F000C0;
	Fri, 20 Nov 2026 19:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795204366;
	bh=mpqwp+bhW1VHTUduSW5XS4D8f/ntKh4hvUaR+/0Gmfk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KBrMgk2lpzc5pzIvmGIWg6nVoBfdPubzDK3EfwyMdyp1JuQUf0/HvwC+gzOSQ6JSA
	 LBm446G4XzMVDsyWIngXfiI1aFlWsIuQBXdXF0PSkkASCZU4D9zTtuG/iRI1C3v/Vy
	 9UcAUJPAqLJ+Y3oSjF6KDn1CLqxQGBPTfWt75f6gO6JAeLLF8qX8JFVqBjT8000rhX
	 ntsLkz4PAa1RkkdrllxbJGp+N6EQ7/YL2rxFVkeqsLupltXxmHdZIcTR9GKdrVrfO/
	 tamKa90Wj1CIIC0/mxxpi+jJMF9Vj5wS8efgC0HAkDbgfnZokkucd4HnBNhRprDApG
	 XfdwVX9fMK1qQ==
Message-ID: <sashiko-outbox-225970@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] usb: gadget: f_fs: fix use-after-free in
 ffs_closed() on umount
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Mosafer" <mohsafer@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261120194656.336875-1-mohsafer@gmail.com>
References: <sashiko-outbox-225940@kernel.org>
 <20261120194656.336875-1-mohsafer@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 19:52:46 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

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
> Fixes: ecfbd7b9054b ("usb: gadget: f_fs: Fix setting of device and driver=
 data cross-references")
> Signed-off-by: Mohammad Mosafer <mohsafer@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120194656.3368=
75-1-mohsafer@gmail.com?part=3D1
