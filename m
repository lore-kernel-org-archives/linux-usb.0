Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793481960;
	b=o/OE1VyZZxwB/u4fbFRCJcR+PraONvTyX8CXKTQO3ykO31jioCfqah3G1JDZnsGd44T7
	 nXhgnyb2/Mp+vs5SM/gzZwCBPl0EHJFLLPuUXzUhc2yJYsG+mjBSP6mjbssLjs/qihnDG
	 1wA9Tw7Csj+YCOQ/WyTpMJGg4bltrMvvHK9I8CedFDH0j0NA67lOV1VBhq133ZQSGYBfd
	 wa2SzY6CLsFN4Yiqb8olBuIzdpXHz0hJZ2RmmNFsr3KIyEgyYCN/bAEdyMaJ/B+lHRl9Q
	 SlEZSJox2+tBc/aQOPcWyBI10huj3GW/8FLKfUd0HiCm9jIFBIiZfudI1LFWK58a0ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793481960;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=TbW2aiepzu7WOsaoWbYAV4o95Ij9WnnRdSiveSOVn6k=;
	b=xwXXlKGCUhRc6XibWXuh6+XHzU4KjhGhSzRNpIbmq1GGpZSzNtGaLbB6FpfP/wxe/+Cg
	 jc5cYeUhdnChlKiEtqGW2+I9XO9jl3kz8SAnrkPXG8ADp2q4+G3AhgzZIlprrjvMBw/Jy
	 4i1n+4uKwR31d4IA1oYTsT1mahPEeL7ULYdrSGaUQuW5bmjgHaPUJqfMGGYXpgkb5XM0b
	 2TxVSA/oAcw+IXrSgU3yuuPqJ95YRyNc0cWBxVzdLyF3Ha/LldoCPn9w7oiPXD9ls/rXL
	 5reAQ+DhVIZvckcV3cqk/CWnbknhepG/qCrp5iuxwk/Y7Xx/a0srwNJSyWbCmKkjNmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MMRnHYq5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245F0606A31C
	for <linux-usb@vger.kernel.org>; Sat, 31 Oct 2026 21:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MMRnHYq5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CEEF1F000C1;
	Sat, 31 Oct 2026 21:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793481959;
	bh=TbW2aiepzu7WOsaoWbYAV4o95Ij9WnnRdSiveSOVn6k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MMRnHYq5Zs1sF5Dnna4fpME7pSooTvc5Exe5oK/gtxhYdCuXwLc1x4pTUwVpbzXt2
	 AJeH8sBiFGktG+rJN1jA2u5d545KlLmiFP+cGUfZIr0qj81Ego5YCaPnyP2nAvvZBj
	 psEbQdk5a3LK1SP+C4doo1KG8pMeow07WEe3wwb1sGLvi1kznnSkOrl43i057JeAJy
	 EwPBfLoHbQDWsTrVaLBq5veZI4ZJNbPS8kUfkB/nHmPIRREyOKWungEPneohcRlS/u
	 p+mRRoZS2UluYCnPzXEdocSTAR6Utj5MhwvH2ouhXBUzC89W/b6zSzENwlsnCY6J3S
	 LdAuDwjouZz7g==
Message-ID: <sashiko-outbox-192175@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] media: em28xx: fix v4l2 use-after-free after failed
 init
Reply-To: sashiko-reviews@lists.linux.dev
To: "Drif Abdelmalek Mohamed Said" <drifabdelmalekmohamedsaid@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261031210922.323-1-drifabdelmalekmohamedsaid@gmail.com>
References: <20261031210922.323-1-drifabdelmalekmohamedsaid@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 21:25:59 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> em28xx_v4l2_init() publishes the new object in dev->v4l2 before the
> video device is registered. If a later initialization step fails -past
> v4l2_device_register-,  the error path unregisters the device nodes and
> drops the initial v4l2_device reference, but previously left dev->v4l2
> pointing at the freed object.
>=20
> syzbot reported:
>=20
> BUG: KASAN: slab-use-after-free in v4l2_device_disconnect+0xa4/0xc0
> 		drivers/media/v4l2-core/v4l2-device.c:78
>=20
> em28xx_v4l2_fini() is called later from USB disconnect. It reads
> dev->v4l2 before taking dev->lock, and on the failed-init path it owns
> no reference. The last close of the video node can therefore drop the
> final v4l2_device reference and free the object between that read and
> its use in v4l2_device_disconnect(), causing a use-after-free.
>=20
> Fixing this by clearing dev->v4l2 under dev->lock in the init error path
> before dropping the initial reference, and read it under dev->lock in fin=
i.
> This makes fini see NULL after a failed init, while the successful path
> continues to hold the initial reference until fini is done.
>=20
> Fixes: 288254383674 ("media: em28xx: use v4l2_device release callback")
> Reported-by: syzbot+1e71765881a6fc43185f@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D1e71765881a6fc43185f
> Cc: stable@vger.kernel.org
> Signed-off-by: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gm=
ail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261031210922.323-=
1-drifabdelmalekmohamedsaid@gmail.com?part=3D1

