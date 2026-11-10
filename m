Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794294807;
	b=JJfPgRqCoRt/FZ1EX9IoQ0KKIhoOhN0fDEMGHbusyFLLX9W7cbKaifdZY0FXGmmJ3BTc
	 +IgUWQJCjehI+nRsGnYotDFxUVrck0DxTvS1ori2FeW/U3n64M0iWRC3XVP5gF1joMMXt
	 zQrCeOAxcjrdAkxGxPnqvBt1IvZ5U0iAZmQnLde9dvDgx5mEtDQ4EDc3Dz2z2HsrgtHnq
	 9y7n7IWX+i1zGFyiLhS3+JJ9lBb8i3mGEqagjwNPAqyHlJfUU0qyArS4VXRbMfm8ZdKdp
	 9mQQLtQ7WRF1axUkVZAWQeBZUC8BVPat8LkI5MNaIAiD6Zc0a3L6wNrpJFicv/sLsAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294807;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tuOnXWN26Gx9yCxHRA9W3AONlC3ntn1DbFpEBJCS/fc=;
	b=TSGPGmLXTaOOotFzS8eWbpv5l6u/ReNhTquPBSFdEs3b+ReE9CCbW3ALI0SHhVio+LBh
	 CleO5whF+jEkpzBv0R65+chvIFoqRoytm6u7eo9LJitrI+k5Uu+cFqwwrG7vcgb7xCZjx
	 84REaghKG9sUbnUxv80wtYgIVBWzlXJmV+aZAPaLk5lJd6ljyCkwFync0L/JCGNNMg04M
	 E9v9GZZu5/78fZxlN+It1i7kLJ16DUjZ68ye+LU+q0zYA9v6uH50HemGjj+14f+uJ8eAt
	 dfyhlOcz3+vde3koQT7u9y6PFnEgA5Ey4NNX+iUWi9r0770VUxs7ZWkUxgwNSG4y9SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O59hEkNM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42497606A321
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 07:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O59hEkNM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 035D51F008A4;
	Tue, 10 Nov 2026 07:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794294807;
	bh=tuOnXWN26Gx9yCxHRA9W3AONlC3ntn1DbFpEBJCS/fc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O59hEkNM2gwjge5mdM4yFMgVvbvu5IzxlcolPfIIH2WkuDChwT9dfGDShkiEnViHW
	 H23rJtDSA1xHurYBuC/IYUgkYxvIlPdKOQp2JXk2tIjx8rEWuqYnz5LSYD/Binjo6q
	 B82vNg00dXZWSDeGyHUlpu/QOqsU6VnNyS9ZMUb6iAnxPR7vYPzAd5DP5QriKoYNOO
	 ELsjB4jlsWKz0N8iMe24bKNM8bYquwy9QKR7NdqcRRWFEX8GM7HDq/mhIcdDcD4vFw
	 e7BjkvUyjNn+tfbD2QVr/OWtSa6YMrrSMDIxIfCgIvgJF4Y0vLr6uVIpsXZgDSa7n+
	 LriMUE/cUErOg==
Message-ID: <sashiko-outbox-206465@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] usb: musb: sunxi: Unregister the generic PHY after
 dropping its reference
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rajan Yadav" <rajanyadav0307@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110-musb-sunxi-unbind-v1-1-d821584fc4a4@gmail.com>
References: <20261110-musb-sunxi-unbind-v1-0-d821584fc4a4@gmail.com>
 <20261110-musb-sunxi-unbind-v1-1-d821584fc4a4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 07:13:26 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Rajan Yadav <rajanyadav0307@gmail.com>
>=20
> Unbinding musb-sunxi oopses on v7.4-rc1 (KickPi K5C, Allwinner A133,
> KASAN enabled, no out-of-tree modules):
>=20
>   # echo 5100000.usb > /sys/bus/platform/drivers/musb-sunxi/unbind
>   BUG: KASAN: slab-use-after-free in devm_usb_phy_release+0x2c/0x68
>   Read of size 8 at addr ffff0000057ef080 by task sh/329
>   ...
>   Allocated by task 48:
>    ...
>    devm_kmalloc+0x5c/0x140
>    usb_phy_generic_probe+0x30/0x184
>    ...
>    usb_phy_generic_register+0x9c/0xd8
> [ ... ]
> and ran the tests on the board.
>=20
> Fixes: 498dbd9aea20 ("usb: musb: sunxi: Fix accessing an released usb phy=
")
> Cc: stable@vger.kernel.org
> Signed-off-by: Rajan Yadav <rajanyadav0307@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-musb-sunxi=
-unbind-v1-0-d821584fc4a4@gmail.com?part=3D1

