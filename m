Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795679558;
	b=DuLJ9HCCV9rAeVsTFK10foegYu/1ad7m8s8CiyqAjbYTHPOFXlBXJOGNWvGjcvPXF5eF
	 3mwX7oW4GnE2qaj/jQNpz2mXPu8s8m+aB12ydWOfVQHba+K4Lnwc0Nb6R0htCQHoV8r2r
	 qZ+HSgtOjJY1q3/KuKk9oyXTl0jGLCrgDyesbuxwTJD9pFO1nWRhcwcmgwXi4KJ0+/JY2
	 HpNDQj/63bfVl2D+eR3dcCCZ6H2f2UDVTu2DMM2W31k38qJg65jVjfTdiUZrbuTv7mIkE
	 /JMI8VdTJaz6LeHYy/d1xwN4+pPNpyGpWKLAB/NeDFVgfYKuVi9uTmfyqQtQbvMF55A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679558;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2ktD1Y8pBCdOpW+9cRWwzdDuTirxmYbiDl0J6o2++Os=;
	b=ZfXa+49KOv0ZoruIQb44ioqNKKxA/D2aFMK0J0wXhK0CYTpLlrCSFy2XtfePYdtvoSqG
	 Th1BdfU8hVQdrYPZeUp8+gbtnrzXCjupJ6zTM5wOamDVRgQiaxPT/7LbOFhjRQCwBloki
	 xnhPgP93xsGo47IGRpodF6oR6dmi9MLLqSDvvzvGt16WP3bFiCudM4HvYseC4QEA8+8I9
	 j09qAWPVQeFGBbZz9gmETMVJDvie7WbbXhNZXQoH8ooKldGruOFg0LkYUcsqOfQbzSBZB
	 EqNlkHC/Blf3LhZ3em4nQXe3F/D2iIlOkHOy/wfIdJwOgmo2y+PU43fK7tJq7iDSUKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QYCG6dep;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543FE606A338
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 07:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QYCG6dep
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C4131F000D1;
	Thu, 26 Nov 2026 07:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795679557;
	bh=2ktD1Y8pBCdOpW+9cRWwzdDuTirxmYbiDl0J6o2++Os=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QYCG6depjy9DASNQZckj0W5W9h9Q1TKN+t0jFeNL1E+KIM/5F5tlIUrBvpsoeU8md
	 WcPdcNE5UFQqVg/CNlTdCSqN8+HqTTWGwUzVnSpAoVUTtzJqpaJU74GiioFxn6B0vB
	 OpRFz0JkWfniueFZjf4B9P/71j+U0h5pTP/hlHQiGnTTUmZP62XpMQzPOP4hrCKRV1
	 GYoOebBiUURE/uF+wE5FL8gllwBI+Pwf+IXJZFSb4YFWV8of9iNuu+0kD8rQgdzEl/
	 V09m7ptNKpRHe2tumNyHxo6k2QojGaXI4HSES4wJm/oDfWv6g1NTbYvkA29l5qe63O
	 f7xUcMoDkXnhA==
Message-ID: <sashiko-outbox-234972@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: gadget: f_fs: fix UAF read in INTERFACE_REVMAP
 ioctl
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jaegyun Lee" <dreams200260@g.skku.edu>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261126-ffs-revmap-v2-1-445e86b561dc@g.skku.edu>
References: <20261126-ffs-revmap-v2-1-445e86b561dc@g.skku.edu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 07:52:37 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Jaegyun Lee <dreams200260@g.skku.edu>
>=20
> ffs_ep0_ioctl() snapshots ffs->func without any lock or reference:
>=20
> 	struct ffs_function *func =3D ffs->func;
> 	ret =3D func ? ffs_func_revmap_intf(func, value) : -ENODEV;
>=20
> ffs_func_revmap_intf() then walks func->interfaces_nums for
> interfaces_count iterations. ffs_func_unbind() first sets
> ffs->func =3D NULL, then after drain_workqueue() kfrees func->eps --
> the allocation chunk that also holds interfaces_nums -- and later
> still writes func->interfaces_nums =3D NULL.
>=20
> An ioctl that read ffs->func before the NULL write can therefore be
> inside the revmap walk while the chunk is freed.
> [ ... ]
>=20
> Fixes: ddf8abd25994 ("USB: f_fs: the FunctionFS driver")
> Cc: stable@vger.kernel.org
> Assisted-by: ZCode:GLM-5.4
> Signed-off-by: Jaegyun Lee <dreams200260@g.skku.edu>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-ffs-revmap=
-v2-1-445e86b561dc@g.skku.edu?part=3D1
