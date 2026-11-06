Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946462;
	b=0o9zDD4/JNc6Jw+eEyYJdz0BjVx0ytj08hRVNfluGgDUK15O8Bqz1qkopTHVWU1PiuRH
	 +nKqUm8ubkGwGV4yBOMmqnGRpwGBGfYdjkFoNd1134B12Ra5EubaUL/ibMiMzRKsbUV0L
	 KDB1pmWjV2dkb5jKqVJwAydYOozs5Rdl8/Lj/4yUIY5sUYFkOVpzxYO8hfMoEiknXqZpQ
	 KIUuMTitmwW7Q/Q1JqkRaJ9iESkJxAKcZDF/k5n5ohaM+SaCsf7KLRzxmFCNGMZYmbjic
	 t9t1QQgMTLIVzHFPY7v0e4MRUUo3kywvv7dKu1Ttxl5UYL3hDsOz6aBk3NC1IYoc0cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946462;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4ZyU/VhEDT3pmU5BRV8/OmnS6xzQeUcLW42+QE22lqE=;
	b=U7vnmCAx+T6XOo5K1iRK7R+FKEIdgtZ10SzeOrdgvg6aTelE5TEaxd9NZ1mzWZQC3d2o
	 80WeFg10/Eg3okRZW28BF6mMKeUP6WzjZ655pg7DLkorCWr9CcaxrxE5FllOBPsqZJuKz
	 djwI05smtdIMVIQhdMlgIgUWRBKrvG4F9VV36j3zkCDOFGblyyiLFYjZiRqLW0uQsFHi2
	 sg2RvzZ/VrSAuqMAwroKL++0K4oQrHsyh5LUiK08HcxndRh0lr0xjZ4H3p+nmX0XwKl8y
	 Iy9aQ/CEd12aAr/w2xluk6loNjfvHFKxLoIqHpgzNYIXIZ1ikrJ9WzAHafwhqQYi5qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C5zZubMp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB96606A328
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 06:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C5zZubMp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72D161F008A1;
	Fri,  6 Nov 2026 06:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793946461;
	bh=4ZyU/VhEDT3pmU5BRV8/OmnS6xzQeUcLW42+QE22lqE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C5zZubMpxY4skYHTHOX09BCAHv+6amo9z0hgS/MVFj1d8mNFWBr3vdqnrfRQfhzHS
	 t9G9QdG0hajm8m05R2GBOaHmlyrrTtsTJOmf2Ny+2wvxB+Nrd/vU+cPFzzZ8yOFjeL
	 Fd1kD3UXlEpViRkHdMaXnP19jz5Krwh3km+olsUWF6TS7uOaroBKlLXAAbcEm49rGr
	 J7sBLFF1934w6Tm5CTDyRgV+m5bz0cRP2rIB45iCYNDUTqmpurSdXQ8jMRjCvhLDsj
	 XcNTD02exJs+bYeZmoJGYCuExoGuIebPjNLWpwPI4lHH4dsZrF8xEKOZbfiq4JyRcP
	 dzOcNGUvEQLKA==
Message-ID: <sashiko-outbox-200894@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] usb: core: export the generic device driver's
 operations
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Clark" <jjc@jclark.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <c1fdf2ed4c508b08734c7a9de002336f60d3b865.1793941292.git.jjc@jclark.com>
References: <cover.1793941292.git.jjc@jclark.com>
 <c1fdf2ed4c508b08734c7a9de002336f60d3b865.1793941292.git.jjc@jclark.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 06:27:40 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Export usb_generic_driver_probe(), usb_generic_driver_disconnect(),
> usb_generic_driver_suspend() and usb_generic_driver_resume(), and move
> their declarations to include/linux/usb.h. This lets a driver whose
> probe may return -EPROBE_DEFER leave generic_subclass unset and call
> them itself, so that it can defer before the device is configured.
>=20
> Say in the generic_subclass kerneldoc not to set it in that case.
>=20
> Signed-off-by: James Clark <jjc@jclark.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793941292.gi=
t.jjc@jclark.com?part=3D1

