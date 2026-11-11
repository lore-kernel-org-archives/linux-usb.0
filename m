Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365892;
	b=Vw245f+2iLIbbAEcfDVFlhVfGNFJzVjTtrQZPrxkzq7KK2Hlz6OHOm0u89an37vlZFkz
	 MGMB+t5ygEioduBK+dvtOSrEXAibWtqrwa6YfRRD2Xfrn2LQcfX+POMVY9VsG4CtbJoUD
	 nj8KJx2ziX0lWIHCj3jkkEbzoUP2ovLhmYJykwLa8Yczl7zcWpmRBb11xKuoa+WX2frt1
	 01ptVwdWY6yKKsrNV87aT73s0RUjLVr8YAZaTH8J+xOsbLrofItpyNYY/2gOJKkb7WqBV
	 mWIw/mVX2bu+YVrSIa1xWE3BC6tHpSTCbih7lFlBbz/XcyNGOZJfso1MfDY6o/yfeSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365892;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gpAlmhXGG6gASqzCwEnDKABZMhn9wCgLuWyIAbaWX74=;
	b=H8/aVlFgptymS5KVltCCwsew1OWO6jKBpxjNd9eN5y+RlCCuL0bAIl/iqaEdUArSx3/2
	 RwVXF/6qQv96qOC6J36/P9SoSU8hFcM3VUBi22+gOL8w2ag7GkYPDS0vPG6t7IS+nXdvW
	 RTATiFCwviArhearQc5Vo8D81NtSiYwm+W06rTOBz056vehgFtBDoMHs0aNas0LSSHGZZ
	 kL3N09iSBzV4oYrGL8uMSHCbCN88zYasPRophjWx5tI3wT2ob3ZGCzqSi+87ZggviXI81
	 fR6iow+zoLcam4r3I1ZLWnfFdouuIStNm/csPhr0oa+PmkIfRnVUXPJkh9WLR436EXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ZqB/sG+b";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDED2606A320
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 02:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZqB/sG+b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 238FC1F0089F;
	Wed, 11 Nov 2026 02:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794365892;
	bh=gpAlmhXGG6gASqzCwEnDKABZMhn9wCgLuWyIAbaWX74=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZqB/sG+bAz7xk5wQeHQul8vsaRL883NoatCC/+7upfJ0ymMW6HVkW+Ed5+mJu/EMs
	 PSfimPGbZfrauKVWQMpFGOFK8cvE1NvSeSyzm1S4GSFZ4HCTcbWd6VIIzjRkU2k7ni
	 1yCLp+h3hlPBeXsD2+g5bOOEAzyiZOll/Q93uYrHoHAR3KxbOrxSlSAojNS5R7LYT+
	 duaHJilmoovYLeJmUsQon+z2obg0wttAZ36wpylFJEowf9b4Kx0gi/wikGOIUlHJ/n
	 ZckbqRSZI8UF3/bBrqIWUrgbgKmzRLDfy9c0pRO9tBhHjArlzSmjPnAC++ZltdwEQ9
	 kxcZZCLX6unDQ==
Message-ID: <sashiko-outbox-208138@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: udc: snps_udc_plat: use platform_get_irq
 for IRQ lookup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261111023221.70102-1-rosenp@gmail.com>
References: <20261111023221.70102-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 02:58:11 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Replace irq_of_parse_and_map() with platform_get_irq() and move the
> IRQ acquisition to the top of the probe function, before any resource
> allocation. This provides proper error propagation including
> -EPROBE_DEFER support and removes the need for a manual error message.
>=20
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111023221.7010=
2-1-rosenp@gmail.com?part=3D1

