Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793679687;
	b=NZYHKrr9xvtDKERAi4z3/uJgH5ZDS9YsGToljlC5zydqmShHta8LtJIBWxvOh3JedAJv
	 8pyg2wfWCeb2JPXzS90oJ04VSnlrFfumYnplqlqwq1WhMQnZ74EATIAb3zLVjyX3N65jh
	 txsPO8/MSbRAQ8TW42j5QdnKqGwqjOh/xDOtBj+FUUb3hJDrXI5zuJ0UZROm6nbt6JHP2
	 MSbCMIxrAL1ay8JWuhdiZU6q575NpKzhoOWUEykeMEWEfmg/JaJZkTGWe3LuyqnbCOaJj
	 +dm42RXXcyzjM3hPZx5YIpvpKRh9MkgB5UwJIIQTu8sZv4GMK65pAbBdGVNXJpqjR5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793679687;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HZ5aIkojkabubstSsBAgMRbbIzeVgd/V5ib9EPQsShc=;
	b=OBZDJsdwd9ofA7e+YRtfPyFCmO7lYrUQwXBeyuDp/JKfRS9qrTnFEsPJ3GbGhmUJK0j7
	 kM5pBThfy5KroAVcWcmrDqdPwo65ShPRtr4zCpxkhkD5TmCLYlluJXSYHdKDO6WwE+a88
	 Rf4Z4q2jEHWSwj6jftJ6WvqfrQxYDeBEzluj/JS7XEqqCTXQdSgqZHog+liK5GiF3qfuq
	 5daAfiR/nN9PBu8v01DetWjr9ND9g6x7VB2xP2YylaPaHaGmI3nYMuoyiLcdLxDexazIc
	 IR5YoOI25/AyYBLcShBm2QfawcD7fXSmXnPNn6w/dj88/LUeaXx4XqC6xr/xsHhUSNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QVMTI0ob;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EF4606A32D
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 04:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QVMTI0ob
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F34E71F000C1;
	Tue,  3 Nov 2026 04:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793679686;
	bh=HZ5aIkojkabubstSsBAgMRbbIzeVgd/V5ib9EPQsShc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QVMTI0obrSzAeLKayqSDaGugRcqnezNLm7vRfvJcHd+J5bKkLNd1CBG3XDfA87uAV
	 UcvtgYlsAdCTAnwcM8mSOpALfa3LBlzJ6zvSSO+Sc3Gxi9qYFrdCGg9FORlMDHc9DW
	 GbmYMNGOJaWEJF4MereYL80wb4/dr4CsTsIEPRKm5U9f014QJQNt5v4LrjVHB/ST4X
	 x37uzki1+e5B3A6j4gI0AMl2eOj2z92QnflHpvv+E2ZRGqF0yyvf7D5Bb+ZjwVS8yn
	 BDwFOWjETPSb3Mv0bWNbYCcpaEz+3zR6DspwV9g684ywKQKSRm4v0Z8pOElY4P8ySa
	 26qhyoMOVXb0A==
Message-ID: <sashiko-outbox-194563@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: usb: Add onsemi FUSB15201 Type-C
 and PD controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261103041806.1885974-2-shengchao.guo@oss.qualcomm.com>
References: <20261103041806.1885974-1-shengchao.guo@oss.qualcomm.com>
 <20261103041806.1885974-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 04:21:25 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The FUSB15201 is an autonomous dual-port USB Type-C and Power Delivery
> controller. It runs the Type-C state machine and the Power Delivery
> policy engine on an integrated microcontroller, and exposes only a
> status and command interface over I2C, so it is not a TCPC.
>=20
> Describe the two ports as addressed connector child nodes, so that a
> board which wires up only one of them can describe just that one.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103041806.1885=
974-1-shengchao.guo@oss.qualcomm.com?part=3D1

