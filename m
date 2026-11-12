Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794486073;
	b=LSvrYJ267PmgYAf1XLnnW1D/Fbhem1xc++1gu8mfnqQUdQbmmd19WASeK7wrThnZQiNK
	 p2rkc+nTg6lJPfw7YHzRZqZoKZm9dD8n9If78ZysvplX2/qO91yKtTFHTXu+026jIer7U
	 eugXpb8afPDgWD0DdcAlzIFTZEgKGIkzpUc46OLWlPv7nSWxuhmtojRQIjP/DkXaCCmMb
	 zJK2N0WRmR7cabrLEVNK5dSslYjyqI2ZxQLoizlpmFDZbuX2uamop8LSUQPSZXcXDSxv9
	 yBvq8DYE52oRAM57S+28PO5qz2r1YGt2rDy+ogbrfLkBi2FLXExgAjPXzytzDH0lSSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486073;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZVaEIlvJ3ZYQOpmyBaCMi4N+fbZ49KR5PDeeChgN8YI=;
	b=1sqdEhb+oOSsF9pthKZZe81Ru41h47a2SR8aCFuuisK9T1TGT1N7BbhJdkLvD7yDyhW9
	 Tj3qheM57ZyXDhnDegJjLamOySCtCcNczHbhrcNO8t/4zE0YnyNh+dtuwbA6sZVbJDUm7
	 QupN0OftMHSf4gIWMM218VQJSM/N+tDkwKsVQmLFkqAynMOlNsEzQzQUga2v6/b99K5vc
	 ZvDXSeY7pRmDLa/MxCIsQTrFr07dJLhnFAY5cF/6h8w1DUha2Oz8cFnDItC4D3oL0QpM7
	 f4gnZrJBEoOqHaiSQx2qeBiLocQBiv5uzNfe0UdBF6w4UJPLriemPgTY8HTuTNZVeLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DVwRrdJl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8E9606A321
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 12:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DVwRrdJl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C39BA1F00A05;
	Thu, 12 Nov 2026 12:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794486072;
	bh=ZVaEIlvJ3ZYQOpmyBaCMi4N+fbZ49KR5PDeeChgN8YI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DVwRrdJlSir+2d6HD044E8He/200GevawciQRTIaIJA75+qYQ/XCSA7qCfZpOM8e8
	 AnO5cduclUBIwwtNPF4kTt9+0hFOqsxcn4YclgXIkxFcckO1+ESVD4eq9vaJDp1Y44
	 Y4QUiPyyHdT9llH8EX9wcETMkk4lkfAy+iKheS5wYv0lILfaSdG7qZXia+vGcoX1+q
	 lvQrFff4Dw1Uj1f7pbCghVqRltuj0LuCDgTIUJOLwU2myI9cL05lG/1HqIcn8supuy
	 9Ur6ug0rLzMf5JQ5AVFNMxQGRbZSoTBwBi7YytYyTIeOC6u+XTXj8RADK2oExzH/I5
	 HdeswMWKNreIw==
Message-ID: <sashiko-outbox-211080@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usbip: Close all listening sockets in request workers
Reply-To: sashiko-reviews@lists.linux.dev
To: raoxu <raoxu@uniontech.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <E063498E65C71B8D+20261112121648.1458957-1-raoxu@uniontech.com>
References: <E063498E65C71B8D+20261112121648.1458957-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 12:21:12 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Xu Rao <raoxu@uniontech.com>
>=20
> process_request() forks a worker after accepting a connection, but the
> child only closes the listener used for that connection. All other
> listening sockets are inherited and remain open until the worker exits.
> This occurs when usbipd listens on multiple addresses, including the
> default IPv4 and IPv6 setup.
>=20
> A worker waiting for a client request can therefore keep an unrelated
> listener alive after the main daemon exits. Restarting usbipd then fails
> to bind that address with EADDRINUSE, or starts with only the addresses
> that are still available. A single-listener configuration is unaffected.
>=20
> Pass the complete listening socket array and its count to
> process_request(), and close every listener in the child before handling
> the request. The accepted connection remains open, and the parent's
> descriptors are unaffected. Make process_request() static as its only
> caller is in the same file.
>=20
> Fixes: 328f7f8a0a1c ("staging: usbip: userspace: eliminate glib dependenc=
y")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Rao <raoxu@uniontech.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/E063498E65C71B8D+20=
261112121648.1458957-1-raoxu@uniontech.com?part=3D1

