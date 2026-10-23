Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792761603;
	b=ZQE0bGDsiY8FiPoeCkxz8HBTlt4DcJC4V+vSaouX59KKYQnEo4XUBFRqh9+ElZofj/kK
	 kcW3sT4+MGTHdo24BTI1xjHyYYBIKjm+EDcSmsPzhwTsIKg9O8bnhHPL4a4SXyKwii4bP
	 lyHpoJTI7qi0jHo8VXZ/NqzL1zS7SRtImct7J//aVY3hpFQ0tOWhnHgyWcGm03E309QKd
	 9zzSHk6F9LFO6Szyx/RQ9YAB3sZZEi0zfRdumGZcB52GnGY0kxBzjND5zePgwQKzKLthE
	 lK/P6ZxmXAtvOqRLtPjeEJakXKF4pOEaWnnf5o/L1eSlrnIwNTgVljlWGFyxVNLwyAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792761603;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5a9w3PI4GWKsVKmG0RVOlKAXaDDDKpJWLD4OQACBtiE=;
	b=QZN8rXhW8oaZzDI9sxW7Q7RZijT7rAr48xZv6kiWkYj6DIgLCGtSZi32FEXHO0xRaCnz
	 /rZB8efrau2ZeGoKe+GOFTokLohfbqPCODe7tyGx/soyATtcpMOY45uM2CLCqC7heHI32
	 CjxXMqDV8PXAc3h9trxzv/of9/198TfeMl/hhbmHehikenPWmiMNaLx/2NhXPkZ2t/faW
	 OkxUez552IBYEFIOmOXcsqPvQEBmGJIhQzFDN9YRCm2dJlzc8Bm7kPmrHShvK8zWX0icL
	 vkv2Jg64hskESgT585Bt7BvmsqoyI6Nw/DBbQ2ufmCyimG4NcXpKDxm/np/X8kKjqpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JFvs2Q5k;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF797606A32C
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 13:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JFvs2Q5k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7AC1F031E0;
	Fri, 23 Oct 2026 13:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792761602;
	bh=5a9w3PI4GWKsVKmG0RVOlKAXaDDDKpJWLD4OQACBtiE=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=JFvs2Q5k2PJe4WSS4W3V26GIfFESJR2alLNjMJ4w50pFR51dRBw7ZrrfN2vGHqrQG
	 rGH87oD3COJ7sexbtHSN14uu8ivNgGYrkJa/2ujzqCgjHzUP4bIu18TlnOp6Q4pURW
	 n4BzB8WEM1cgPcIES7Bf/gARJwdEj6rurGrkKfMioUOQJtv45g7DTiYl4DubY5fY1K
	 Q/r2h5sgB0GHTGVacIUXnR+GDuHbcNmCKc3GkZYXWatGk0q57EDE40QXwKp5ZAqZK1
	 qXcjC7A0ZypC2riDf4OKW/K5ewSUOBP9B7fToCMjBaHFTrPhvU98nCcM3SISsaphV+
	 LF8+2X7bhp86Q==
Message-ID: <sashiko-outbox-182817@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] usb: dwc3: Add Exynos8855 to the generic
 platform driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvarasu Ganesan" <selvarasu.g@samsung.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261023131501.3157463-3-selvarasu.g@samsung.com>
References: <20261023131501.3157463-1-selvarasu.g@samsung.com>
 <CGME20261023131548epcas5p2aeea6d1ff5351907df204e7b3fbe6030@epcas5p2.samsung.com>
 <20261023131501.3157463-3-selvarasu.g@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 13:19:55 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add the "samsung,exynos8855-dwc3" compatible string to dwc3-generic-plat
> so the Exynos8855 DWC3 controller can probe through the generic DWC3
> platform glue. While at it, alphabetically reorder the existing entries.
>=20
> Co-developed-by: Muhammed Ali <muhammed.ali@samsung.com>
> Signed-off-by: Muhammed Ali <muhammed.ali@samsung.com>
> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023131501.3157=
463-1-selvarasu.g@samsung.com?part=3D2

