Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794036113;
	b=jpF4KBa+ohsu3MyBfTWbNHMCywkj4sARdkxC8NKqjP5WwgGxrfbyoKefj/5N4p/cVaaP
	 HDLoG48Okv+TryXWacES1YI56GpMJuNY7/2lUO9bF1fEu0I8V4p6NQKDZHRz3vJUQQ6hS
	 TTgVOmIwsx7H+SPdim57P0ZE/HinBAuwxUyR/Ku42dIb4Fso8zFuntiCBH0sC1AemNj5a
	 N/Xl1IqupgLAgfSHxTfN6uDxiLuzjYZ+9/eZECWzN7UCAxDtX454B8oeF6n2kgrWbnnOf
	 P4MCW2Hisd/IpiBHzwJTTfSpbnreX01RKvY1AzWttJ+8v93Yx/y0CqVWQ6GwJPD7RGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794036113;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KBM1V5z67Nw97qmnmhbQOJxEumKXgQkEAZh+I/1ve3Q=;
	b=c5e9CUxQbzxctNVInKOjlckKePJiAG/uc78eJxz6pD/RelV0wUz9RaTCPTCAz/9cVBiE
	 Z/hO5qI+lzm1AhlMwpuhX1bjJWJ5m7oLxtelaW8PUCeuS0QDyZUQgQ3GK4QoiKl1a7Pm9
	 Ko5OFrZq6X8T90kK6FAhQGBqs/5Y/CqCTiIHx6kdEC5s+mFP2S4o9mqbdu2ZyvdcH/AoP
	 DyY5WxkkysR8Bqkbox18vsfNn5NHlNOx4LvmBqA0UVyK6btd769OJEMvt/kipY/ajXeW2
	 KQmzdq9RpWbM7NJqyie5me6Kt76ehJjY2NMTSGOrtk+mFkoifLh/0PXlqqHg8rqFsdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a0lKs9BN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB7A606A338
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 07:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a0lKs9BN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C7841F008A1;
	Sat,  7 Nov 2026 07:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794036113;
	bh=KBM1V5z67Nw97qmnmhbQOJxEumKXgQkEAZh+I/1ve3Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a0lKs9BNJPxHjRgFo7X6Y1qp1aetrWcn8HyI/sOGzj5cJN2vw9ZEAQy8zVbawEZnk
	 V0Mu8wIYMkhl2ffylb5TlbkiRGDo9QQaZfWnyiEN7Xv4emCSunwLzOEi69sE5ztLtW
	 6nUfK8ZsaOPHNd6tpoQBL/jMvZRHpAP/zkV5OpcTGVeiECvARmzrhQleDW1GnFaLq0
	 90rHxP/gjNEVRG5WO3U5gJMxJNgoNTEUtBlvVbezM64P8Q96zhRWEAmrGyLOBFvp+m
	 uXb7pfYMloZoMN/TTcrzdpiZIjT5zlxTlzbCQ4D1f1Is8FFE+ulrN4Y/L/c7gOQ6Se
	 gmB6/+AFOh5dQ==
Message-ID: <sashiko-outbox-202696@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v20 06/13] ax88179_178a: Add EEE configuration
 support for AX88179A PHYs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-ax88179a-v20-6-37b5a1189983@birger-koblitz.de>
References: <20261106-ax88179a-v20-0-37b5a1189983@birger-koblitz.de>
 <20261106-ax88179a-v20-6-37b5a1189983@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 07:21:51 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Configure phylink to work with the PHYs in the AX88179A controllers
> and provide ethtool get/set eee operations calling into phylink.
>=20
> Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-ax88179a-v=
20-0-37b5a1189983@birger-koblitz.de?part=3D6

