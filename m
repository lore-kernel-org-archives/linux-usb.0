Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794886678;
	b=pufD4ls6GpWrXwYfKzlAUVADCm5fW/XKy1CHsx+1huUNw48JYlsBHhx+MTVYgsxSKNW3
	 smptUZr4p/qNvXCa7dGO92FJD7MNgZAWCMxvpL0CyD2pGcS4l4ziYISqLFeEwQLd3pnmh
	 aUIxNtSKtDNYLVV/rFr7zKZEm7xh1EZL45rnC/IjPN6OdbZ/6VXtoXJ0rk1f3k3/2ab7O
	 o9uHhX1nrgYrHkH+bJsYtbrmlwNPvfMsXB3jKwWOMaOgj5rFZv7DdDfKYgwClE8EAHVPz
	 Wa3kYkfNfNOmnNhWhBbeVajK3NM3njDueKRlyr2vhsVoHtw6BLTbcjCWIk4FgT3tMRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794886678;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=P89zmkPcEzhs/FTkZCXUZZZGU5Y8A6jCkUBBpLaMLsU=;
	b=2PsrVhqb4svSMGuTNs76WtCJduacpF4prbTup/lX6M0n1+kwKrLlAzabt0v9/+BmyFH7
	 DWc+KvapMtSyIpuPmDtplmnzUWPK8Y78XX2dyO2zk7kqRPlSy6c51GsTOSjzBJImigCi7
	 cbYSnN42XFLIm1Ia6fB3L1UE49kofyUYPbmVAl5V8rHjiEWL9zN+gu/7abYe8p4EJv/Po
	 eCL6BIdavHflGLJASPhaMfDPy1TWpmIMjik0o06wuZ/xG3HBYEyAZTQE/bpaGAsLmOSA6
	 nwguwUyyvNB2MW2io3LZf32EUuPIskwq83FKZiwMoLkKxjhTjn9MqXtoG7BKupbcCFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lpTePeqF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5419B606A323
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 03:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lpTePeqF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE4891F000C5;
	Tue, 17 Nov 2026 03:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794886678;
	bh=P89zmkPcEzhs/FTkZCXUZZZGU5Y8A6jCkUBBpLaMLsU=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=lpTePeqF09Ed3NH4REJYZeTjSrD0BK5JIcsdfOyMAFvmmc7f4/K1FEdzcwu8JyRHL
	 /DMvRIh13zSsuZoA0WJdHWxmaPrrHUlsr1SDcoimEB06vce0rRgvUwQjeoFD3SIIVw
	 KYvEl7CA22muYXt7PsF22yhopaQFqALZQE1CLVQaZvnl8P/QlRnXCIUzy/Ri0Y8Ojy
	 rHbuPy4/9sbfw51tV93ruc2RuTTuhsrxM4nPmdwIx/qyumafBrgnmXjcaJC2LkzCAS
	 AfmtvV9s9g1i0/aVXidP12FKQ/J2qVf3lf9snjQLKUbEf9lCR4w2AbY/dfeaJL7zZv
	 YRuTOkmH6A3pg==
Message-ID: <sashiko-outbox-218145@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: gadget: midi2: copy configfs strings for live
 functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yingjie Wang" <x-professor@outlook.com>, =?utf-8?b?bGludXgtdXNiQHZn?=
 =?utf-8?b?ZXIua2VybmVsLm9yZw==?= <linux-usb@vger.kernel.org>
In-Reply-To: <279d2387232d774116d674f718f381438abc90fe.1794886308.git.x-professor@outlook.com>
References: <279d2387232d774116d674f718f381438abc90fe.1794886308.git.x-professor@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 03:37:57 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> f_midi2_alloc() shallow-copies the card, endpoint, and block string
> pointers from configfs.  Dynamic ep.* and block.* groups may be removed
> after the function has been allocated.  Their release callbacks then free
> strings still used by live USB string descriptors and UMP discovery
> replies.
>=20
> Copy the optional strings while opts->lock is held, so configfs release
> cannot free the source strings during the copy.  Free the private copies
> with the live function and build the USB string table from those copies.
>=20
> On x86_64 with KASAN and dummy_hcd, USB string descriptor requests made
> after removing a dynamic block and endpoint trigger two
> slab-use-after-free reports on the unpatched kernel. With this change,
> the same requests complete without a KASAN report.
>=20
> Fixes: 29ee7a4dddd5 ("usb: gadget: midi2: Add configfs support")
> Cc: stable@vger.kernel.org
> Reviewed-by: Takashi Iwai <tiwai@suse.de>
> Signed-off-by: Yingjie Wang <x-professor@outlook.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/279d2387232d774116d=
674f718f381438abc90fe.1794886308.git.x-professor@outlook.com?part=3D1

