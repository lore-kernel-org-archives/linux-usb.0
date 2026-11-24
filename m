Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510039;
	b=SkXT7s+kT4uWiqTAfU4M46oP21uWL+UhnnHceIy50l6W9PiMh1Li+B8XgLsYaZF4Y4Sz
	 OmViRQlpifzziIjUvc//euwYE7iQJAerg0ipx/+hjWCwknpc36FQaLyMj8JTpsYCV4oc6
	 +8C/UB3QmcGdYraxqKZ18L4R3mITan2LTFSRdRsg4DeAM0qDmcWUkv9fSvE/3ihak38Zb
	 hZufefIVIAnchOA9nlOuPT74bGGcNy64Q2jdkOWBnyUZwE2aWx6KpVEiAGRMRKf7pqrZj
	 GRof8UYLFgrodK3WaycNU912wih6DaH3bapMbGnoGn91wOiMcnGPj4tIsskJCQ3BNjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510039;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Z6PzzoXWOIRzCMGb6g8+u4EfwHQ4xdqrCwQk2A1Ulzk=;
	b=HgbM3qjw9vGW7DI8CcgrelYpI2BWzo7WgbkEhX55cFiMubp3ohG1pe6FnZ140pt4h4hP
	 H/YUXhoaRqH38Fpifb7UQ1YRYB5wI5x1kpxmSEWTXKHAya9tkZemmfDtjPAouUxPdwRvZ
	 /BJA6i4vH5YaVmyzsSaUw7F6a5dCYIG5fe8eZJA3EiOb5C4C+J5dQa9RVIgekUFxL4BHA
	 P/xsg8qI8r+vgpOR02CRfJzCUo04WfAePgqyOuKrwGtK9uwa0zRrGwtwsKHA9D7yO12z6
	 fQX+g/7L4jPSR3rN6UoB/9doQOtGCCHdV5pqIUOUS0kxv0jpg4VnAqrkZlZgfFJpWuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IbPWIC9z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9A1606A31E
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 08:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IbPWIC9z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE5F81F000CF;
	Tue, 24 Nov 2026 08:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795510038;
	bh=Z6PzzoXWOIRzCMGb6g8+u4EfwHQ4xdqrCwQk2A1Ulzk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IbPWIC9zWIhUcSLefh6Wd0EBj3lvym8VuIzo5wwKnWC7N/7pDGn93QdLXkb/rG2Ih
	 EHN+sKeWp9kYcGyO3vi2banvEmmJ/CjPA+G2mCOYAgmf64sVS7bsdsy9KU8nNgrV1n
	 PdIxYZU9sLqDN4LqBSx02tHDmHxZYggl9RK9vUrxU5+Hyj0zy9ZoZTkP6IoUivdr4t
	 07vtNljZCaGjdYKDNWRejBVR5XQkooVZtezQ0LyC1om92r9TZGxSFmcOG4lbGRlHHT
	 GIWIKJGoaA8qxgUtPbs/OAuaHz1Zb0nO/Bz+Cd0wFt1mIzeeLRjTD1k/TgIX1Er8m2
	 i3KYmILxb5e4Q==
Message-ID: <sashiko-outbox-230741@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: gadget: uac1_legacy: fix double-close of sound
 device files
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shuai Liu" <847807867@qq.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <tencent_574ADC21A5DB586EE40F9BE6714DC5382609@qq.com>
References: <20261123134853.1589732-1-847807867@qq.com>
 <tencent_574ADC21A5DB586EE40F9BE6714DC5382609@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 08:47:18 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> syzbot reports:
>=20
>   VFS: Close: file count is 0 (f_op=3Dsnd_ctl_f_ops)
>   kernel BUG at fs/open.c
>   ...
>   Call Trace:
>    filp_flush+0x...
>    filp_close+0x...
>    gaudio_close_snd_dev
>    gaudio_cleanup
>    f_audio_bind
>    usb_add_function
>=20
> gaudio_close_snd_dev() closes the control/playback/capture device
> files but does not clear the file pointers afterwards, so it is not
> [ ... ]
>=20
> Reported-by: syzbot+592c653b056459925299@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D592c653b056459925299
> Fixes: f3a3406b3f56 ("usb: gadget: f_uac1: convert to new function interf=
ace with backward compatibility")
> Signed-off-by: Shuai Liu <847807867@qq.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/tencent_574ADC21A5D=
B586EE40F9BE6714DC5382609@qq.com?part=3D1
