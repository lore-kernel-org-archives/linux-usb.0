Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794207380;
	b=aF6VSgnWG58QEqWK9MtisHwJ2UAv9vD82K4cel7fJjvs4EMbuaaEJy2METB95GoRrP0K
	 OhwTT2btzfLOcoWNHi20R5BoYGL9SuEKDzlOS7dD0gccjEp2V/p9FAzAyHqhTlYbmZ3KH
	 IYj9vqe/2rkNUiaSY5dFIVIYJWFOIDvqxj+eyFX9c1seZ0ukVoCFmgaKVP9Ua+DSsxoqr
	 XpO6qK4CsJ+fAxCdKyJzc2dLUgRrLcyQ19RcfHolhiQEh6KVbKO4TnoI/cUdXeGa3zk4c
	 OTdfq19F9FfMRPgkQqGssxrknssH/k97dxr3vnrhKxr1K59D5fgr40D8C+CyNWVlSPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794207380;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5SK81n1fnPhgHd7KNjsKGEKgBNf8xJhq0rB18Gz6Izo=;
	b=q1/MdJYhZGbcnH2Mw7w4OTP419XNEghKewqWKjKpfOUsFLyE3OGiZeiuzlT7sUFaJ6mx
	 T6BgvbbE73T1vrsPdXf+91NvsjQBNg9ZAJV7ZHhckH8c7epJ6w/A6HPAP9mYRXCBmEwP1
	 2sFoWamivhze6Oij/rq5pOEpzQp7/IUnvMOtb+LoRNLxU0eIjkXLnlgFjeg0pdc/8y43t
	 9jsRaCw1bjS7Hggb8CdQWRuLMMF4E91lkduxJyLasVCvzsRHxdimdWjUox7vzNxiGYJfb
	 bKpBBr/iYKie0zevme1AYiZCxI4XRQL6toJ8gKvI1t9H+XT9GEE4cMK20kYkqt2tL1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nmdXGKhj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C7A606A334
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 06:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nmdXGKhj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 419301F0089F;
	Mon,  9 Nov 2026 06:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794207379;
	bh=5SK81n1fnPhgHd7KNjsKGEKgBNf8xJhq0rB18Gz6Izo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nmdXGKhjWwqWY31NY3jshkf+5uSJEQVRhE7YMF2C3+CSdN6HoCNpPioh9pnSt1AL7
	 fpxwZMUP2FvaAoufMReUuil5KW/XraHBvZleWLoimr/PhJlkdb6fLdXx5AsuPdz6MK
	 LfiodiYmKBAZXcNUjXhjB4M+CB74Y1lgizTg6iUzQ6N/z9TXyNzsNB33Y8bAKHSOrE
	 BDe8n4ImvTeGUXFY25U3CUSGCM5AaxzwHGJiOI5qqjTP6dJG1lP18X10pkXauvvMQe
	 3vFuzq2K+ntQaHM2C7HdwF5v55zSsz9VnaxYIj/MxJvaJpUngLvN3kA5XdtohRUw9m
	 5j4+517qYAMeA==
Message-ID: <sashiko-outbox-204510@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/3] usb: gadget: gadgetfs: avoid writing through the
 const setup pointer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jing Lin" <kayano050408@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261109-b4-gadgetfs-ep0-v6-3-b410e3dced89@gmail.com>
References: <20261109-b4-gadgetfs-ep0-v6-0-b410e3dced89@gmail.com>
 <20261109-b4-gadgetfs-ep0-v6-3-b410e3dced89@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 06:56:18 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Jing Lin <kayano050408@gmail.com>
>=20
> gadgetfs_setup() receives the setup packet as const, but clamps an
> oversized control IN request by casting away the constness and writing
> the truncated length back into the caller's wLength field.
>=20
> The setup() callback has no business modifying the setup packet.  Use a
> local copy of the request for the clamped length instead.  Userspace
> still observes the truncated wLength in the GADGETFS_SETUP event, and
> the queued request length is unchanged.
>=20
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Jing Lin <kayano050408@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-b4-gadgetf=
s-ep0-v6-0-b410e3dced89@gmail.com?part=3D3

