Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794366693;
	b=z+50GEOmWT1I95lW0l2KbjsDryFHR1XykLNiTG49qntTvgSDSaZAbNbKQrtmZMv2QHDn
	 /B0ocIeSF2sxdsjgcbIYozZcCYNrmVQmoRrtMmy6ykpQpOUMF07sj6STm8azsR2L/dy+1
	 9ZS8Oqru4zKH/DAHM/x5ZRcBIvPnTsOlV0nW4A5uZEbpmo2JLBc6Teakvs9GYbKx3bSDA
	 Bs48aSikBb3rAVy6PrE+lIqKrPHYsmffwonsYorHif9VGZNUeKS+MDwPiW7Rntg6gCPQf
	 IdgtSuM9av/T9veYIKnpzi2UgnguIkp9NLlRisWXgxOHQAPTdMEN4ByoEyXyxCxZTKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794366693;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0CIbdC714JXMM3NOI20lV5BEiAymIqX69R/RY1nCHwQ=;
	b=mW/J3cVPI0TCg/l+OLP1mOcCbTcJOHtSneto08J7x5R4LFeIIvnZHIzCjMqI3/MEYgBL
	 BUX04vNHgdUvN4QPKo9kMt+O0WhICVomEqmS91aInvfMsfdJD5Y/X2AQ/0GxSCBNeuTM5
	 tHgAUBknnoZAb5c4RZTClNWlWNue/3Zhhu8BQiVQx6v4HTBwHMNFusK/7cJK1L+JC621j
	 tqqjK4ftPA2KuS14gyC1jaG3MPxNmD6ObPWbnswpCDoEHN/Tig7cqSv4qZf/xjZ9FA+ZN
	 saJTBJ7fmM5NaM5N6nMuSrp1/BMhrzf0u1zSMturDzeZKjUMQb/fBL3jYQpqoyLqxSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CRh+p0Ny;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655D7606A320
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 03:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CRh+p0Ny
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8E151F0089F;
	Wed, 11 Nov 2026 03:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794366692;
	bh=0CIbdC714JXMM3NOI20lV5BEiAymIqX69R/RY1nCHwQ=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=CRh+p0NyBxqqYTevFDAgWy9DG8WRmNkV6oSKt1jIgJQzH+fZqyjjws5qhuAbofFzi
	 Vde9Uh0kur1K1tssgihx6nqRhmdhEOQblvhbMQSnV9BHD9jhS1lyEDBNz1n2/qijHd
	 JwtOnsLpaIHf/hnUHUv1ocOnBgMDwWqv3K/dUI0fuAXVV0F/wyWs4gTrHkxVxhUAwG
	 2rAN7y4hbfBeNmVqEdDH0gfFhe8rKA7KGw7yv10gAAw0qqkMV29sw0BGKLLGvydlQQ
	 v4SksCG6vFBZ4/J9KP2rUbhxOhkXsrQPI3/Jo93Fl8ViYZ0SE+YJDF8JjO0KqK2+iu
	 ZZ+wNdUiZRTBA==
Message-ID: <sashiko-outbox-208161@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: r8a66597: fix NULL dereference for
 unmapped endpoints
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fang Xieyan" <fangxy@xiaopeng.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261111030206.64608-1-fangxy@xiaopeng.com>
References: <20261111030206.64608-1-fangxy@xiaopeng.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 03:11:32 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The epaddr2ep[] table is initialized with EP0 at probe time and
> populated for other endpoints when the gadget driver successfully
> enables them.  Entries for endpoint numbers that have never been
> enabled remain NULL.  The table is indexed by endpoint number and the
> lookup mask is USB_ENDPOINT_NUMBER_MASK, so the access itself stays in
> bounds; what is missing is the check for the NULL entry.
>=20
> get_status(), clear_feature() and set_feature() index this table using
> the host-controlled wIndex and immediately dereference the result
> without checking it.  A malicious host can send a standard
> endpoint-recipient GET_STATUS, CLEAR_FEATURE or SET_FEATURE request for
> an unmapped endpoint number, triggering a NULL pointer dereference and
> crashing the kernel.
>=20
> Check the looked-up endpoint before using it.  If the entry is NULL,
> stall the control pipe (pipe_stall(r8a66597, 0)) and abort the request,
> matching the existing handling of unsupported recipients.
>=20
> Fixes: c41442474a26 ("usb: gadget: R8A66597 peripheral controller support=
.")
> Cc: stable@vger.kernel.org
> Reviewed-by: Liu Chao <liuc63@xiaopeng.com>
> Signed-off-by: Fang Xieyan <fangxy@xiaopeng.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111030206.6460=
8-1-fangxy@xiaopeng.com?part=3D1

