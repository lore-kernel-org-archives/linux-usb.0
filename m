Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792535676;
	b=naNavl8k+k5lpdieeCbx/tZJ+VzsNlhlk/HUNOYBsEQowLqzZNGXY+IjohtEJzJ6E65s
	 Gf17CspOyQrdNGPyLCOpbDBXevTKaPY+gGhQOK+I0pMdTwlV0kkM4MDQ7CJn84Li2VDkI
	 UduOw/Za//TgPu2DNN2xlexiNfv+nJqT7lGyr8Hr9lnhlhZQoN7kMktMySfI2bNiAtLi0
	 lOHWmni0qvKuOQBSacfwJPjBj1huqx+2U8CCb326qUTLA5PYDI3BYzmHy6gOi7KQgDnuu
	 nmOcJ2uXJmieG94O70OUXcFVZ4Q7ybysh8m23bE7hrv/QcCKMLs9oAKxzLNMTusiI3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792535676;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aqQYj2bXdL/I+v5nc/+gO/DfYI+ZGWpLaytz2N6ksLk=;
	b=AETSDCjHWueOjzF8TdRL+d4Bxs1+fPLdwkM3nlJ0bpVXmoh3F8ry5NObJW1U4nsXjsyN
	 FSJ9+DHkQlCZHUFUwvBqY0gW4UF6VpVAChXQ8qOkORPli8+4DzzIT4WQOJDTB+Pyq2vtg
	 TbjESQmdqICLoc/+dByvyhBYWmBewGPzHnSiz8GrSioYFzcE65RSKzVSIF7tut19uxntz
	 NUs6uv+Acs2mwprTSto6xsNd5TSuiaTEjK8vlvYWueeuZGpoBlhqmGY5akJZCQhXZyXaF
	 kpaDgKk7st+O7mLVifpzk87Egp8Tv0oOGKva54aScvpDMdgRnOfvQC9cVVbXYlzRsjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RESU3dhX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E506606A319
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 22:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RESU3dhX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0EA1F000C9;
	Tue, 20 Oct 2026 22:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792535676;
	bh=aqQYj2bXdL/I+v5nc/+gO/DfYI+ZGWpLaytz2N6ksLk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RESU3dhXoB22uAONb90mLIiRnMAVccN2mjL3UFUVQ1Zewl/SaH6WaMtNVRAy1ZqaE
	 UhxGwB3W+48O+VPmqwTxo/06bhVMvbhHYYc1Lt2rW+jExQyu7KZeKLL1WQlh3h6are
	 AmuSlWLycwpkDtN8Dg1afEdKielsTcjLfU3e5EMzbWXxQS0OR0FccQBFxrKC+Dn1Do
	 KjVisYMniIl2xQeF3OUKXEOHYqD5uLCt2ShHimiro6qeANETIzbJOKCJiZE5R9EDuP
	 mIHnIS5W2DUOw74cLFaOakKPVfZbYk9+Q1m/eyEHR3l1rpsnExIu150XZth8g/RT21
	 /vLbn0xL5yiCw==
Message-ID: <sashiko-outbox-179541@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v2] net: usb: lan78xx: fix error handling in
 lan78xx_open()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Munari" <stefanomunari.sm@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261020202614.30277-1-stefanomunari.sm@gmail.com>
References: <20261020202614.30277-1-stefanomunari.sm@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 22:34:34 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> A failed interrupt URB submission leaves NAPI enabled and EVENT_DEV_OPEN
> set. A subsequent open enables NAPI again, triggering BUG_ON() in
> napi_enable().
>=20
> Clear EVENT_DEV_OPEN and disable NAPI on the submission error path.
>=20
> Reproduced using failslab on a Raspberry Pi 3 Model B+ (LAN7515).
> With the fix, the injected allocation failure returns -ENOMEM and a
> subsequent open succeeds. Verified connectivity with ping and SSH.
>=20
> Fixes: e110bc825897 ("net: usb: lan78xx: Convert to PHYLINK for improved =
PHY and MAC management")
> Signed-off-by: Stefano Munari <stefanomunari.sm@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020202614.3027=
7-1-stefanomunari.sm@gmail.com?part=3D1

