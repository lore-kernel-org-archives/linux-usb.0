Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510128;
	b=DnjLPFMw8GPeyHsYJU7IjQA877uz+zqovtJZXioJqJt998QkpoJap97O5cIk/kJn4dDD
	 PFLZ9Bi3/i70m6iHhsQrRmUZ3EAxq4Uu+R42V5zTmbyQXQ3fr1o7CQEDYhnfOUv4fNlQ9
	 mfLBA5ujYWqUqNKDjMK2XNfO9KKEO3NoT71wF5mhw8QsZRYfOT0Veem4yrYOTptFzJpNk
	 S8LQXzy4ClwPRgUaySIo4qffZF0O/l1vxvPUou4dNAiB9WKer1PjJpjRzwGd0XaOTL1G0
	 nQaSrEZt3jeB1bOW9nmSlVi4LLQgaJB/3sZ1E42JD3gfx+KZZyAadV/zeqo9VxAGc8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510128;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dvrT9lUN/zM1GEHHwCiDiHeGVxyDO79KCfHUKeBBQMs=;
	b=arNe8PQIvOne93ukHPDoClTQCPUAU2seedMDW2bAKF8R8BA6NsrcKXj9R/Jvxbg4LkvO
	 3ci8WsmRlOxMk9QPmysIywLLwau+weKdM7Zu77MniKsl3F/3Cs518b+acZ3WUj6onGTwm
	 Kc0uRSvqewiU3iiTMTXZeqH+V/5qcUcRBv2Jcz3EeLwpEvx7bj1WiPaP4DdWSfkF8B/6I
	 MqWGhJgrsuDBVZflzgnEpdTxpAj3XdKkRQjk2iCxHD/eB4DLuU2RjVxEB5/MQuwEFsEKP
	 uB25l/PmLtWvMEZpL5otpqE34YuC0HVDgOmRrVfXjnXchXjQKZiZq/ZEWhUjKnQZhvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KgnJ7ux+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52263606A31E
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 08:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KgnJ7ux+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA9681F000CA;
	Tue, 24 Nov 2026 08:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795510127;
	bh=dvrT9lUN/zM1GEHHwCiDiHeGVxyDO79KCfHUKeBBQMs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KgnJ7ux+0UxbtyP3q2Pd1y091LcsgurTikZHLhzxjOfnrm7pHnI1CEnQHfTsK2e+P
	 Kr0j1nO2nohUgtT+2p+TFmh1VQWL7y43RfN0P6/bAwtld1wXm8azSAMQSIuVHGcXlk
	 UmKGrpYqkMgp6e9aS8YR6pERw3eqFxD0KTXwYATZLw8o8Tfqgc5mnvhIZ3mbRwT9vb
	 8/ZnXoVO0H986dN4tfF6LRB1EgDsrdD0kDn8ZeVuAszlZhr4aCtnnJynelmq6y8S9U
	 OMkMLaJa25vBohFmryXkdX6gXpwS2u8fN16E1X573GGrf+gDONuIrbEKes+yDpHMUh
	 sk6leMOZ8OO2w==
Message-ID: <sashiko-outbox-230743@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] usb: gadget: inode: fix use-after-free of struct
 ep_data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adriano Cordova" <adrianox@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261124084144.3208824-1-adrianox@gmail.com>
References: <20261124084144.3208824-1-adrianox@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 08:48:47 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> gadgetfs_unbind() -> destroy_ep_files() frees each struct ep_data via
> put_ep(), but the inode still points at that ep_data through ->i_private
> with no reference of its own.  A concurrent openat() on an endpoint file
> can therefore reach ep_open() and dereference the freed ep_data (the
> mutex fast path), even while the inode outlives it.
>=20
> Give the inode its own reference: take get_ep() when the endpoint inode
> is created and drop it again from a new gadgetfs_evict_inode(), so an
> ep_data can never be freed while any inode still points at it.  This is
> also safe against dcache pruning, since the inode reference keeps the
> count >=3D 1 until the endpoint is removed from dev->epfiles.
>=20
> The inode now holds ep_data for its whole lifetime, so an open() racing
> with an unbind never dereferences freed ep_data.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: syzbot+7bf725ed337e37307001@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?extid=3D7bf725ed337e37307001
> Tested-by: syzbot+7bf725ed337e37307001@syzkaller.appspotmail.com
> Cc: stable@vger.kernel.org
> Signed-off-by: Adriano Cordova <adrianox@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124084144.3208=
824-1-adrianox@gmail.com?part=3D1
