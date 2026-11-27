Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791247;
	b=ms2mD6LNQMNqHfXM2CrOlOkAR8102xqByfTPbiYTh9pPBVUic2BGTt/WFOrDfFasHzif
	 qAA6jfM32naZAlvIM9NrarPyJIzD8AXPbKjHZX9FkEXlPVdjZ7r7j8ZIh6Xxgr1e8Apfq
	 x51OWInPBFsGSn+W27fiskcyKj/XFxYQPS1wBQmr302hYytPJFq/fox6UD3m129GTkuhS
	 yszO3JtnexcIuB2QW+jqAHYxvfOR6X9NEpop+h1HlahkDgW4obdXe8wFHoK/1F3QOXQrF
	 zCsRklmA+PTUwi3yKsywzoeAIT1oBPafDBlsVJSsn7g371aoUITaIvJwROCxhtlgTxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791247;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=n3CR55Urpw5ntBwxT3tfssJ9BwDOlEDV0IFADyqWPxY=;
	b=MMymObj4HqHpjDuafwJc4TeUnM6IeVXALCJ2dOgYf4exE7A+Lw7CcwgZsW6TgeFOBvtN
	 okqfSnlqAEXEeOCcnJzKcqHBPQqE3GQzzNxB43WwQ2ZPvLxQJWmgZ0Z+PBOYBip8MAbja
	 RsaoEzvibYWHHnvoIe38UyFTN1OQD818MfwnsRSdAAYTioTR4WqYRHm7n41kHlgRE6Jg7
	 z+yw/Odx024oI57AdYyVg8EIfr0LrI+BjQWukSAZIY9sOCOJmfKBNxu1Sj2Ikh0Dhi1el
	 0HuYnOMf78HIc7a8ZPpabnoByeUukyjBMplY4ppN+Py7W7YpXMEFMfhHmF3eamAm43A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cigKfheP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D448C606A324
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 14:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cigKfheP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 053F71F00899;
	Fri, 27 Nov 2026 14:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795791247;
	bh=n3CR55Urpw5ntBwxT3tfssJ9BwDOlEDV0IFADyqWPxY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cigKfhePTCmO/bJr4BypYfLk+v28Pb5epbz2HfkgBbzl/JZ4BnkmDgJtMawVoXUxG
	 nJ4bQBdX+p3lMM/12OB+hxefc09vtvEXi7IxEJpYMxQIkbro0TNMS/B1jznhGsjdrv
	 FIX3L+cwjH8op5cDFGfNSYAFORM56uKSRnX1hQSWnTyjac9TKaN/sfTNG2giC8XyTV
	 qOcFeef6v8HdCqpFMPyOvmMamu5Xl+VNJ5hHfJ6ZddMpd/KX6USZjLBhOE6wv6qRCF
	 Ol6uXpYK27bFkbKxTze0xRcMOZ3nnIVbH87Ib9bCkyuqGJBKzDP72j3wib3h4oTTMk
	 ByA5mnhEqvQBQ==
Message-ID: <sashiko-outbox-237621@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usbip: usbip_host: fix invalid device pointer use in
 do_rebind()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lucas Pascal" <lucas.pascal@pqshield.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261127144551.350348-1-lucas.pascal@pqshield.com>
References: <20261127144551.350348-1-lucas.pascal@pqshield.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 14:54:06 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> stub_probe() saves the usb_device in the busid table without taking a
> reference, and nothing clears it when the device goes away. Writing the
> busid to the "rebind" attribute, the last step of "usbip unbind", passes
> that pointer to device_attach() to give the device back to its original
> driver; so does stub_device_rebind() when the module is removed.
>=20
> That pointer is invalid in two cases:
>=20
> - The device was disconnected since it was bound to usbip-host, and
>   do_rebind() uses a freed usb_device. This happens when a device stops
>   responding while exported: closing its usbip connection makes
>   usbip-host reset it, the reset fails and the hub driver disconnects
>   it. The following "usbip unbind" oopses:
>=20
>     BUG: kernel NULL pointer dereference, address: 00000000000000e0
> [ ... ]
> Fixes: a46034ca57ed ("staging: usbip: trigger driver probing after unbind=
ing from usbip-host")
> Cc: stable@vger.kernel.org
> Reported-by: syzbot+af76b01c9a0f0ab60fb0@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Daf76b01c9a0f0ab60fb0
> Signed-off-by: Lucas Pascal <lucas.pascal@pqshield.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127144551.3503=
48-1-lucas.pascal@pqshield.com?part=3D1
