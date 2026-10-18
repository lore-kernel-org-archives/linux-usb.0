Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50383EAC68
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 16:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792341524; cv=none; b=Wx1vXQmfKLTHCL6Wn/IyCfFYAgSk52VmQNRTW4OZhyoJq9MW7KbTakPOYfVrezOPS2TFjK2CKgwXXH3CakRfdv0IMt0MMwrkAPTGzw7j9YxYizE6oqK0bzz89++7K+kxkl8/MzDMLSlmt+YjA5jph9+9yz40xTbBFpULIKUFc0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792341524; c=relaxed/simple;
	bh=TtBpAy5QB5p6B2r0aIJueeBngm/B+qAIHywUH3SAspk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=gQIYyhsMnnnRHKaoXXFlgfRW7MTX53p3psMQgCKKwvjPGThIeoFMRKyUCxg+b5OCN/7k5KhacSTeUX4ukBCiFo7rEJqvqbtsW4a1dVyPtdcDbSxsG6MhCWRcmeWNk4j15mPmSoKNgry2LNZWEWv0t/1njWQl3G2yeoudJgGWJAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mPI1co+3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mPI1co+3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F07E01F000C4;
	Sun, 18 Oct 2026 16:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792341517;
	bh=/WXu6rvbkLN0sDY7eD5Kfia3wK71S2Fq1FJgC1ooOf8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mPI1co+3kakyM9EeLM5WURdcAUocQYR5Z7RPPKmmZKnqT1klQongUhdEOMHH8aDtl
	 Mkxli5v6PDw8WlbtYymWSPJswfUb+9QQb1Pkek/h+t5llCUw4KQhq9pagmvGHg9ABN
	 qyyCEHgjvVwvraNAoIlN6Gd9bnKF9n4VGGP7t0bVDsyY/O6HB2E1mDJ409mOj1dxDO
	 CeIzxQ2C7rr5cnTxC0m9Q84DwTwmKlnlN2n053Fq3CRXX1zmsRFdXSkVk+ASA+MVI0
	 hofZqSVU3r/9vn+w6Z9SnbxqJjZkF9qmt/L6p70eGX771sHydVhJpO9yst6cMhYzV7
	 0KuM286fXTtIw==
Message-ID: <sashiko-outbox-176279@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadgetfs: fix use-after-free after a failed bind
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eklavya Singh" <eklavyasingh2106@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261018163434.129569-1-eklavyasingh2106@gmail.com>
References: <20261018163434.129569-1-eklavyasingh2106@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 16:38:36 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> gadgetfs_bind() takes its reference on dev_data only right before it
> returns success, but its error path calls gadgetfs_unbind(), which
> always calls put_dev(). So when bind fails it drops a reference it
> never took.
>=20
> With ep0 open the count is 2, one for the superblock and one for the
> open file. A failed bind takes it to 1, closing ep0 frees dev_data,
> and the superblock still points at it. The next open of ep0 then takes
> dev->lock on freed memory:
>=20
>   BUG: KASAN: slab-use-after-free in _raw_spin_lock_irq+0x3d/0x50
>    gadget_dev_open+0x4b/0x1b0 drivers/usb/gadget/legacy/inode.c:1919
>=20
> syzbot gets there by making an allocation in bind fail, which is the
> "failed to start USB Gadget filesystem: -12" message right before the
> [ ... ]
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: syzbot+1459655b2bf1e798f9d0@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D1459655b2bf1e798f9d0
> Cc: stable@vger.kernel.org
> Signed-off-by: Eklavya Singh <eklavyasingh2106@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018163434.1295=
69-1-eklavyasingh2106@gmail.com?part=3D1

