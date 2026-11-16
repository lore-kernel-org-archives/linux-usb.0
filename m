Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794794332;
	b=tAPHQ/GBPaW1UTxd7Imjq5MjZzTjVd1irpEnnpt5MZj5c2a7n7ZDpjENr8y00klAFHm8
	 umzyhiyqkquFs49lBEVGi59fWxpTv+sRFrnTNZgDzWmzIlE5MzzO+WFGH7zxQ4RyB1S/y
	 mXL+b5A27UOAO3UK8Hm2ffotF2NzWM81d3nbtIIrmHKJusArunrHpessxhvW99Q2BuvhK
	 ad+jiXWfV3i17zsT9h3+wYwuDbcBmkfMRU6NMR3b9D2Bg/9i3syqRq4VD5D+iq8Ec+fYU
	 xlJQWWtmvjvUjSvONJEouBscMNo1rJTi6NgfuZVDq2MDvku8qNWJzp2mbrPRcC/1K1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794794332;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/kc5Tn5a+A28BHU0kQYwy7XjG6ifuQkhwimZB9bXN0Y=;
	b=z95bAH2tgJ/zCLjFbO85qBHtZeIuIsNyOWokGf5LW8srX5/3P7YVnzwzrhdHyw2HfCVe
	 kEcJw3+Ju4SADi0YRVKvqff71qvthJovtSkiQMf1fEQCMN11hY8y68RBlluCWorjj+HQU
	 yOPY/EPOI8DbDsmKhS6J5DHaxRWSjERf/jv7+bG6XJ+Map3RFGdlh8Hx+07npxUed5De7
	 iJZ6t53OjFgp/R1ufR48GZXICH0Qdz69cQ8Jm1lCb2+ii0FtHmlRuE1NznyyqZJvISZOi
	 Qcwq3EM5t+MiqBJLpw1/56XpH+j4vWyxscCb60TbIgwpdfZyI9R1qRYiAx5mMC9sLbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FmLJ6en1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED24606A323
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 01:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FmLJ6en1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81F5B1F000C4;
	Mon, 16 Nov 2026 01:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794794331;
	bh=/kc5Tn5a+A28BHU0kQYwy7XjG6ifuQkhwimZB9bXN0Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FmLJ6en1ybCkKn7ckzsz12nKZk28NyTPgYiwQRqeecuyx1KEjSxgI7/Lx+vyf7Ion
	 g9SzXpKeivIgWzArayJSiYCG720L7sa9PtJV3+603KpdrxbefOAQ8rkYWs13StBboJ
	 jXJdWxng/Ye3bfp+ve7rebsyhzhR/QiudX0ymVLduJx7llQi0NkZb82HDuOpM8S1ER
	 0JHGTSMZPuVxHI9dORhpxIdaCt0AI7t0+hk05W+E6Dgh6D+ByJW7VxBFQBVSgrLC+K
	 1p1nl76SXFUfxfXdNVhGjUlpp+k0LEmpGh9ErMNlj1Gqtk0141+7SvRu9EMN+bM+EY
	 6R7wHH0oX+7GA==
Message-ID: <sashiko-outbox-216041@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] net: hso: cap the MTU to the mux tx buffer size
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aibing Chen" <chenaibing@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261116014904.556-1-chenaibing@cmss.chinamobile.com>
References: <20261116014904.556-1-chenaibing@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 01:58:51 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> hso_net_start_xmit() copies skb->len bytes into odev->mux_bulk_tx_buf,
> which is a fixed MUX_BULK_TX_BUF_SIZE (2048) allocation made by
> hso_create_net_device().  The net device does not set max_mtu, so
> userspace can raise the MTU up to IP_MAX_MTU and make that copy overflow
> the buffer; the same length is passed to usb_fill_bulk_urb().
>=20
> Cap the MTU at the buffer size, keeping the 14 byte allowance that the
> default MTU already uses.
>=20
> Fixes: 72dc1c096c70 ("HSO: add option hso driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Aibing Chen <chenaibing@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116014904.556-=
1-chenaibing@cmss.chinamobile.com?part=3D1

