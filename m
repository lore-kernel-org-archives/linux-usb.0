Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792842979;
	b=vhBYOY6jm3OiZcV1PEhP/pySECY4KOfibbWg1PQWo11+EJ+YjkC+IMuDsu2cV9qws5/R
	 Lrj7Ex3WbdRI015fxGh2iT78NjQb744qt2WPLJSniX9d/gZ8mAA+5krbRyUK9pZ3z5Nvj
	 AXZIe/XsZPxohklHnndwQ6jZdMLU1GgG5J0Y8tGGBYJ7Gferhf3cJvRZuHrQXCDgxz7bm
	 jZFiole6qCPSlpgDNmYRbeYA00RFuA5WJMhtgsWdNAhsfRK+86BtnOhudlKBz83htOySq
	 hr1om07+SeXjZDozq3SK6zuoOLr4HQVPPcOAwF036P1QLMgOLMJFmVeOFgpdinokSKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792842979;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Rr0BTGLTYzFd1DBC1KsgZcxTtX6rEB8+QmerSgXv+6M=;
	b=Apy+9qMh3JtWZO+4HQFhTHUIsYk2MyUJ17gbfoirpkn1ixlrRw/Q8A9lRPWykFhVwgVW
	 5CA/vrGgUJe4HuZ3QfRiVhrwE4w8tOIMRua6GPNvtijWlldUsy8OJNYjiAjv9Hi/lnJ2L
	 dlL9lyr0UMdHlT9Fmfo5dIHHgvqzNnY+r6v24SGZBiWGiNjxF6odJM1Y9wv/28cYVTV6r
	 5JR+MlPWeGgS/va7IKOegpYfBnLHVOQTqQUULlJnzO1nrVzAsevT6vUuVt/v0BLWg5Szj
	 GPGDCdKq+oauJIkba2yL+heB4DA0pK40HLQm1TC+BmAKk0m5qwsf7ZvfpWsxIdxPLiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gNFRJ5Gm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82E8606A320
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 11:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gNFRJ5Gm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F3861F01825;
	Sat, 24 Oct 2026 11:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792842978;
	bh=Rr0BTGLTYzFd1DBC1KsgZcxTtX6rEB8+QmerSgXv+6M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gNFRJ5GmZWscd9P6IhXgpjY8IAcaNr4auOiYn2aUNeVnwW8GhXSOsu9qqRAKLmgD0
	 Pd9KnUbL8Cs953pvbyZqgEKkoXOXVVeJTvGyI+ZTihLGSHsAo7YLs3gGdg9ScOxnIk
	 b6j/SKRTSiRu50e3v87aOLGDa4bQIZT51PclmSNts2dskEfO+P2B4hjOOlGdMSOVd/
	 OgBJ9Gj4JXUYXqhREdYrfhiOkeBXEt7VBHr8Zo6qtr+bbZXwSRx+yBJHggJixyzLGX
	 3GL/f0/pywKnnxdnNYYACb13j9FYs3V3qpuEbi7U2aSFa7vDG/carRHwNZ03ogvwRG
	 LwDGfCtVl7u6w==
Message-ID: <sashiko-outbox-183695@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: dwc2: Disable gadget descriptor DMA for Sophgo
 CV18XX/SG200X
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Yeh" <chenyou910331@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261024115220.823159-1-chenyou910331@gmail.com>
References: <20261024115220.823159-1-chenyou910331@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2026 11:56:17 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> dwc2_set_cv1800_params() disables gadget DMA (g_dma) but leaves
> g_dma_desc at its default, which dwc2_set_default_params() takes from
> the hardware capability. Descriptor DMA requires g_dma, so
> dwc2_check_params() rejects the combination at probe time:
>=20
>   dwc2 4340000.usb: dwc2_check_params: Invalid parameter g_dma_desc=3D1
>=20
> The check then clears g_dma_desc, so the final configuration is
> already correct and only the warning is spurious. Disable g_dma_desc
> together with g_dma in the platform parameters instead.
>=20
> The gadget parameters are only set up when dr_mode is "peripheral" or
> "otg". All in-tree CV18XX/SG200X boards use "host", which is why this
> has gone unnoticed.
>=20
> Tested on Milk-V Duo 256M (SG2002) with CONFIG_USB_DWC2_DUAL_ROLE=3Dy and
> dr_mode =3D "peripheral": the warning is gone.
>=20
> Fixes: 63aa7ab955e7 ("usb: dwc2: add support for Sophgo CV18XX/SG200X ser=
ies SoC")
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024115220.8231=
59-1-chenyou910331@gmail.com?part=3D1

