Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794353671;
	b=MTmKFRfx5toOeyaMvzzKmS12y2LA/pXOTOBWXPkmUVeKmcNPCHtPuZBFkFF7TAHB6YAW
	 5uKvVKNFEvB+yb0vZ5piZIy82eJGrXkZpYV5A2HzfPGCPBVoR9WL8u8xwRqlUWzy/eL8b
	 w0uuS5YfEFJKOjn+m710AyrAghSBA17Z4eyuVNyDp0ZWW7ggD3+TYqJ0UGhsr23sa7GgV
	 uYO7ywPF1t+P9pi58oj1zr3PWbL4xU39KvugYg6U8wdBsIX1fy2AEI229NPDzKd/OFUKp
	 V5KWiIAKVTl6gWpGJZrm+Q9mqOOrAlNaZWE6b8hncY0eaLwrMEnFDNrlgm02ahvTXZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794353671;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3C809RgrG8gG1foNrD4EjHCbfCuDQcGTY+XecWmJF78=;
	b=K5ez42vGBnlljW+fblvvqGLNes4pKD2BNNtSlEiIVBGhWku8+7Bc+NUbY6RhqE56gQ6j
	 ir+x4RWOlcOKXaDIq2/u84kOwVN6Bn/kxvbz+SA8etPaoxj5ZD7ucKrATMaPnyyGiVFS8
	 3VmyJK8AOdnPiRlb+xVsTL+KjbYUxVWGXXrRixTtYpRpWh+brrGIkuYqzhMnMU9u5WeNt
	 xBMknhv6xuI4ZUpf/3rE7fOyXP0+aAtVrRTp+/Fp4Q1ubdUgAr62VokTljxYeRBLC5+am
	 kUQatfIZpsoiHNH1Va2TldYXl3j0eKUbYuP27zUDHY5AyfV8Fj6TfKrCRGoDPpZBA8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gRt+57vf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8170A606A31C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 23:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gRt+57vf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35BB61F0093C;
	Tue, 10 Nov 2026 23:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794353671;
	bh=3C809RgrG8gG1foNrD4EjHCbfCuDQcGTY+XecWmJF78=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gRt+57vfIXDFljlA0uZ9x1cbWfWPoqTpk1Wjb1ncDrvuR9EM3ShJX+ooi9v55+U3K
	 NlMB0NyjaS+g65+FInjxJTuHlGxRN8tDFTtNc6SRdn+olq1WSufhMZML0gHbGa951H
	 fXfJNcX+vyjtbyp6mIxtMqMPkE1OGukD3LSsBpnNOR9vSH+Cfg+FK1FnzFGLH3e6TW
	 TjEHq4A3GiP3QiZoBccUTHacDjPP1RgG0z9wi7e5kLTf7+ihygoe7/qTn8fut6iIKy
	 JKhiauk/AA6T0rXtteZzBD3s5RW+9/xkWuCpLev3W8s6RbO0um+472yxWxc9faSiLe
	 8z70moJ6Pfl1A==
Message-ID: <sashiko-outbox-207939@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 18/22] usb: roles: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110075825.24946-19-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-19-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 23:34:30 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> No functional changes.
>=20
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110075825.2494=
6-1-shishunbo@cmss.chinamobile.com?part=3D18

