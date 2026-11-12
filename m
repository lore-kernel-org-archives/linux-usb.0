Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472046;
	b=iWur9QMmwHMHmyMM4jsudhw52XDDgbNIi1e0A1PyY+lSAWZsGqDaARX64jANpR6Xxq8v
	 l+GRAnxxt8AeG0jbiZg9UyS9uRb6VBa5t8ovxXorzTdaMp2h8SgtV/xKATZr+k7I4EDxp
	 /ei7IQHQfYFEEaX/nuJIw+1eCrA42yZYS8iWXVOrts5+V+Mj8w1pyjXjUIj3qYPY3ib13
	 OXdsGTsee4Dy70i+lfJKKZwBxH0YA69HgvLEnh+aKaWl2u5G7zSmRZdgVoavWayKVuBfU
	 iG8p1IwcdiGj436b1HCn9yj+oWkbeyYcDsNgXN4KX5BteGaOCCSc2OSn3jcnK93DQwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472046;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QtJy9BmcQI5fB649DYomIzPGIa5oPwhS9bxDW+6QmNU=;
	b=KchZUf9nNHnTxwmvZOoaPvN0/QLB1scscGKx5t3/Jusi7V+qsxJLVGqOjCMV+0c9oZYl
	 qE3T3EWJ6NzmtS7qCAEhtOgd0UduRRu5KVoaxFQ3+PeK6Gn3Qy0MtWE8/yfYj9Szu9Akp
	 NWMqlc3wSi7lLFCyOQ0EdbtN/QAz0AJGKhi1iZEiRu5w06U11c+RqVSEQHLObeXs6GlAF
	 auQJcgDB636rfpN5/gkCIElNWo79NLnNFgYGNaTQH1+iXFHaq2Z/ykcS/0OKiuNKqmmvd
	 YnrlRaTyrz8gs/txoCOLh8kycY37ZVTEXA7upWPX44vu3lVdi/5bigfkbITckT0dnjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xz+1Qu6W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A01606A31C
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 08:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xz+1Qu6W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 820861F00A06;
	Thu, 12 Nov 2026 08:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472045;
	bh=QtJy9BmcQI5fB649DYomIzPGIa5oPwhS9bxDW+6QmNU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xz+1Qu6WmbXPTUa50x+dr7/01QDGW74lGdm2RHEDyfYqWTbprjuaA0AfQ8J55Tp5E
	 65VYPUuNHiOJLO1p4fjVs+JeiTcCF7aazp4USvcZCAVKHBBX47f+ODpIw43rBe7fil
	 +EukiXNVJeZp7MvBSUp0Dp6Y4SQU4oosnDGH9OXYbQpiOTlk7GGk5Ul+vPY6ZuzRFn
	 WZq1/RrEtmhnKRmsGtrLSv0XbOPPXx4Uc29yb9J7bf5H4v+b2YxX2RGciTVU91QDaD
	 YA3K5PR7/x7CcEPcLoQTEhnf5EdmrDN2lkr4+lxHOcXn8vl4WEguTsnROf2NwkedcA
	 Hs043geGVJQdw==
Message-ID: <sashiko-outbox-210715@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v3] net: usb: cdc_ncm: fix out-of-bounds read of
 chained NDP32 offset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Prinz" <rc4d5a@protonmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261112082022.995351-1-rc4d5a@protonmail.com>
References: <20261107140432.647365-1-rc4d5a@protonmail.com>
 <20261112082022.995351-1-rc4d5a@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 08:27:25 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The NDP offset read from dwNextNdpIndex on the 32-bit NTB (NDP32)
> path is not checked for a negative value before use. A
> device-supplied dwNextNdpIndex in the 0xFFFFFFF0-0xFFFFFFFF range
> sign-converts to a small negative int. cdc_ncm_rx_verify_ndp32()'s
> existing bounds check then double-wraps: promoting the negative int
> to size_t first produces a huge value, and adding
> sizeof(struct usb_cdc_ncm_ndp32) to that wraps it back down to a
> small value that passes the "> skb_in->len" check, causing an
> out-of-bounds read of up to 16 bytes before the skb's data buffer.
>=20
> Fixes: 0fa81b304a79 ("cdc_ncm: Implement the 32-bit version of NCM Transf=
er Block")
> Signed-off-by: Ryan Prinz <rc4d5a@protonmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112082022.9953=
51-1-rc4d5a@protonmail.com?part=3D1

