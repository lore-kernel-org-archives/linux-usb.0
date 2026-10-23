Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758129;
	b=fYFGbDgCGuh6ev8aaUHian6ygs5GCMeDcp33+DkNIvcMJU3J4N1F3yji8GLqTxfipWt2
	 iGe0D31Etbtenyt4VrOO9LJhl1m6PFhBt1MxokiEcwwEo39gZGw7RkOKPCN/ZgwHCcw6Q
	 zuhRK2dTERpJ7vNTO805/kh0SdShK+NkJq9Vh81JkXNK/OSiFv2I6C+UCmyQ4ZS+4RaCk
	 BvusGQOYxlOaAu533fMJN7ysVTpil+MTo5cjbu/XtuSBd4T9LHLrxxcDWHHDh+QvdHwae
	 Agnu2Fao+EcnyxbBGGKeL9Eqf1kBUL0b/eEvYxRKZl5/AkNkQaiwqlT4IdX58RF/w8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758129;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/z4AljDSzzGGZM7C0emaEaMGifsIR9RlR5bMvxIPjmw=;
	b=KsFlDxZxyxKukDR13zX3UIDV2Deg38ezq3JCOnMOCDPyAXPP0bhXWTdCBcv3NmqsH6kn
	 cbCam6infhpdvZ01DQ6BFfVo1PscN9u8P0HaJKnoCzVyAYOHZVFUm7O8ik7fCB4g9AW4r
	 Jg+GCF9mDOcMACP+BAeqHptoE/6z1x2EL/hgR+87ZdPwjOd2+1k3KEjxhf+Www/y0W9VP
	 7xD+SXj5D3lle4SwpThW71MmOjLXKgbsL48BAduMb0de1d0wYbc0pX5cHA2m9ZPh6JWFd
	 0CQlYS9bYR+y+jpCJX50iVQFiR50vyAWw06LkbWkFku9U7+Gzy0Sslzd/3aEfGOo9ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ElcLPKT0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65121606A31A
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 12:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ElcLPKT0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D6C1F01825;
	Fri, 23 Oct 2026 12:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792758129;
	bh=/z4AljDSzzGGZM7C0emaEaMGifsIR9RlR5bMvxIPjmw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ElcLPKT0aPYRveSUUFgdtDVwNcMK9ytmtBVh5XJ9Uef4HKuPeSropxPUHi7XO8swA
	 XtsnUVTlZnime+dU1+D28jujXH7cQWnUTfVY9OfhfbK0j8lPqtj+IHh+kykgGZgalA
	 bC2q44JjoLTqno1XA9hCG+h+Kw/DTFarLfRxNUy1YPXMx9/f/aSUaY1HbNUclAM2Vx
	 W++V4Wss/IPih4iVCKVfmeIGAeOc0viZ/sZ20Cm6v2i8ab2CXdYAuk940Uv/aMa3Ws
	 vdT4Edjd+m02cXdL9zL7u5jDEr275o4c3KIbHgtRHuxqldEQTnFN2o8jIe2/tZJSwm
	 l1Z20Vu7wjKww==
Message-ID: <sashiko-outbox-182755@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/12] USB: serial: io_edgeport: serialise MCR
 accesses
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261023121530.186541-8-johan@kernel.org>
References: <20261023121530.186541-1-johan@kernel.org>
 <20261023121530.186541-8-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 12:22:08 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add a mutex to serialise modem control register updates to prevent
> concurrent tasks from interfering with each other.
>=20
> Note that the register updates are currently asynchronous so a task may
> read back a value which has not yet taken effect.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Johan Hovold <johan@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023121530.1865=
41-1-johan@kernel.org?part=3D7

