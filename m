Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793417807;
	b=yPykQF9//lcBB8CadrFsY60HgVYhqwaHHqxf6DulQU8kXS0AuYm4oNF2vliiQUpea6Tf
	 CyGj5aUpornwLGMb76bjBb/6J/xNssARCPQCzzy5rkbudGzoaDzBfazfiUjQK5pGt2Owg
	 FIv4QfdsWhoF8pSNo0KuyD4fWa4YKUDq/zHQ43ibzTYyNV5uS0ID9zwqKOeDwv75TU5sX
	 AKJIDNwyxf1oZtysAwHlkLuo3NLQp8h0eJC9vCe1j2MDDoQnHlefqQSN+CsVZYe6W3yAA
	 Q7U6KZs9l34QWPwCtRMDOnvDcuZrkzvbFpynSIGp4ftSGQrORfee2FC1C64K9FySMiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793417807;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HTZHfnp1tcIXMPPwGgwmV44lDYR9QCxdKiraQWV3gOA=;
	b=UDhj11niZQK03Gy0dyNEC9xGBVDSCNzdgt6Q9Tp201TBfiOYCbsvhr40G3X0da+G1+LB
	 uyfmV5qu0G9d0V+9NIWahEXdgu8k81f77GArOJnHXat4tONf89SFrdu4YVNCRBIkJJ+hd
	 mg820VoKaSQfdur7H9AmhqyYOB36W9oLzRq98TdIKvOmKpSr7SaS/rTOi/CbJtgDSvWWh
	 GHWHOQXXiiF6QrKIaT2TQQwzVl++uHAJaM57d7b0HgikPwvNHpErLip2mLkFAElG56ZcC
	 J3yAJc/h+z2wmrbhkHP0YMwPcC/BdAPw1zElHouBepSvj/nPC3YhgM63NZ2yk+8USKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lHO4y6Gq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088A1606A31C
	for <linux-usb@vger.kernel.org>; Sat, 31 Oct 2026 03:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lHO4y6Gq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E95B1F000C1;
	Sat, 31 Oct 2026 03:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793417806;
	bh=HTZHfnp1tcIXMPPwGgwmV44lDYR9QCxdKiraQWV3gOA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lHO4y6GqP0Q/Geb5cBrgsOPpf9CpROEohkD/ar5J4AB6AbuFDU1MnGB7AbDwZR4kL
	 Ao2/UM4JjjnwVbcCq6hwZuyIo2PyNzUMdDYLMCS5NSMHIlhpDvHdHCKhwMJ5ALRmYv
	 AbdmjgQJNo/BQOYSYhq1uaPkaMinOAaOYD7t6h0aJ0Y6Rhg0BUrl7kA2xgoXtaVcry
	 HJQvy8GGzBGwyRi3quTUNOexnmGtuNppstepsePa19deGxHsVglVf8Wuk936AjdFXo
	 dMB6SWI2BVi5tUOne9tXkcbwU9sPDvdf/7g8uQRlP02BipUMyxE16q47KVKZw+zpeX
	 eik2o8sp2EoVw==
Message-ID: <sashiko-outbox-191723@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: retry init only while the PPM is not
 ready
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacob Riff" <jacob@riff.dk>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261031032400.38349-1-jacob@riff.dk>
References: <CAHk-=wjGk9rBTphk1OAwcqGAE1__KJgMr3B-8X4hKFPX8Wm=BQ@mail.gmail.com>
 <20261031032400.38349-1-jacob@riff.dk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 03:36:45 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Commit 254261381538 ("usb: typec: ucsi: retry init when the PPM
> answers early commands incorrectly") makes ucsi_init_work() retry
> ucsi_init() on -ENODEV and -EINVAL, a hundred times over ten seconds,
> to cover a PPM that is not ready to answer commands correctly for a
> short window during boot.
>=20
> It catches more than that. ucsi_register_port() also fails with
> -ENODEV when no USB role switch is available, and logs that at error
> level, so every retry runs it again and logs it again. Where a machine
> without a usable role switch used to log
>=20
>   ucsi_acpi USBC000:00: error -ENODEV: con1: failed to get usb role switch
>   ucsi_acpi USBC000:00: error -ENODEV: PPM init failed
>=20
> it now logs a hundred and one copies of the first line, followed by
> [ ... ]
>=20
> Fixes: 254261381538 ("usb: typec: ucsi: retry init when the PPM answers e=
arly commands incorrectly")
> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> Closes: https://lore.kernel.org/r/CAHk-=3DwjGk9rBTphk1OAwcqGAE1__KJgMr3B-=
8X4hKFPX8Wm=3DBQ@mail.gmail.com
> Signed-off-by: Jacob Riff <jacob@riff.dk>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261031032400.3834=
9-1-jacob@riff.dk?part=3D1

