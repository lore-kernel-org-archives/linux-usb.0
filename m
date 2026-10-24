Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792848819;
	b=kUyIJvY5AhuIAQBkHGLJovUYI8JYlDZ62Idkpetony4bfTPv2VAnhXQpIMwUbqmpyvrx
	 5hquR+aIapv1STH7pZvw0etAfic5peR3yqT51LruUoteQi1vRNU4Jn3ooDXOnGqq6EXTR
	 J5kQXOwFxclnTEaaL96FJxrEzYoTLDLToZytuIlqj/yorl/6djFceK7U3a33+9EjV8hk1
	 anPO4ZSX1G4LjJKOOD/7YLvTbPwICNXLmbzqv1RQJUn+95L04IKAdhd+bAzOPD0n/YBPK
	 TGFdarEy/xlKznShCLtbwxnHMxGQZT1XM7+N3vpQHmfq78tFnB9BGQ1N39x7OoghJHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792848819;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qfgYQciZs861CF0Y/2VkCoAIrUZW4+NhI0NDrhn5kbc=;
	b=QJZD2ruUYklY1L9DLV+6bupE583YLiJlE6HCx7Qo6H5ue7lVOrwY0HsYbEOvVW2xnTe6
	 3IrYjCBnnMkx6dV0CQnRP1NzERfYSav5NpxlOl9v4LLeZ650d5xTHP5RGhRjnnAKzf9GK
	 Y+mA2a0sJ2bbFDHXbJvc1x1ZrLATTwNgY58n0CAizOmyABkBG2c8QmmtUukL9/Kq0Kz6x
	 +ql989+wlZ6mtzMq2ap0jpn+kPNOMTZqC37xVzSUD1Rt012R55Nqp4jij56874mQQxtYv
	 HRHuVT41GRPYVfHpB04Yqp1gQO9xOGwHDqK1dDfeE1dNOF4z/mBJZkrcOrhBfhCgIIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=apaqx+Lo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8405606A31B
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 13:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=apaqx+Lo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CFD81F01828;
	Sat, 24 Oct 2026 13:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792848818;
	bh=qfgYQciZs861CF0Y/2VkCoAIrUZW4+NhI0NDrhn5kbc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=apaqx+LocitkGBd7MiS+aelGiZcIf4sCDuI2da6LxrBT3NAuZ3LYCoyxp6Ll/7RH9
	 rvuljgxZWWMXZZc47qMOOYZ4FzbLpheasebN/ySsI2Y5VY0ryaa1qtfHgox7xyip6o
	 MzKmBVb0NrwGmNsBZ1WhWKcnryMMokdSI8Q5YHXPLEa83FMUhXm1Y9rh6Hm3u6GLT3
	 ofWUIyuQrx8xiicCzyFlwLcbjd2OW9IQ0vIsrr43YlleB/j9JRCTAiiQ76H0Gs2kGM
	 35MAaKKJ8VCUzIJqm56wQNGWxUV67nkaF98kLUEm/N1Q5zUeyGZ0p0W7L35OwT9HqD
	 w143HTD9QIf+w==
Message-ID: <sashiko-outbox-183743@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v3 2/2] net: usb: cdc_mbim: don't enable BHs in
 tx_fixup under netpoll
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nicolai Buchwitz" <nb@tipi-net.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261024-cdc-ncm-netpoll-v3-2-6284ca03f967@tipi-net.de>
References: <20261024-cdc-ncm-netpoll-v3-0-6284ca03f967@tipi-net.de>
 <20261024-cdc-ncm-netpoll-v3-2-6284ca03f967@tipi-net.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2026 13:33:38 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> cdc_mbim_tx_fixup() has the same spin_unlock_bh() as cdc_ncm_tx_fixup().
> Under netpoll it runs pending softirqs while the txq lock is held, and
> a transmit from one of them spins on that lock.
>=20
> Use plain spin_lock() as in cdc_ncm.
>=20
> Fixes: 9bf211a30b3f ("net: cdc_mbim: adding MBIM driver")
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-cdc-ncm-ne=
tpoll-v3-0-6284ca03f967@tipi-net.de?part=3D2

