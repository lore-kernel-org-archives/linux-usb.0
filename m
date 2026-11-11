Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794401161;
	b=duuLgu4E70RU8aRT0LoefFzXJPP1kkUtL7DrNZOgVmLVcUy45vpRmO6WZgsRO/btIXHd
	 IZKIPhZ5j+i+cJUnaVMWVJ3+JizHXlGzLemAdhuCqyoYiqKemHZQ7MuHuxeBnUbDjEmRY
	 ih1ezsI0vshI0vNfYdRMAEOxevbiDSDedCyPBwG866fQwQUGxFDraEV8Lw5dkitZE/V6X
	 0YKXN6N3oro2sm5WM8bRXG2anJ6i6J1/DZMCJgfoRY9aEyZw2loHcEkymZAsXazOiA2HK
	 UXUCtgt7hARXfMjRmcVlUn0KIuBjOGMLvRYbN3niqtTjSX4BDTibfrJBTf9ZCebHXYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794401161;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lcBs4OdlonBE6tu2mUoCicob4FXAl1C/Ax1sUjhw7RA=;
	b=yPS+isDgSlJSnxZRBItD1/4rl7gACqzaKH0iQKG36JSqXXTt6gHiiV4Lt/pyaJd/f0FQ
	 E03EiULZTKF6/oWfdSPqFjrtkwHBREeXvKgC3+gDAMSNbg7dwF/cHw6phBLocMetlWhPx
	 n2Oi+ZEg5inJFIFnHAo5YLbUKud5OVQx3duL3p8ky9hK80qr0pZOPTTCkPgHXqaP8OVPh
	 VCpzlurfhj58h8G3I4DbyDHO8OfXyOTp/6YyAJy5YjNB0/xbkLsp5cgnlLOMOsu9SOmaV
	 dWLDBNkWHAAvLeHiAHWj2jhr3Mpw8BjNSuRafmfv84HfmcduvApy53qkWnPBmXKn7UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kC5hPj76;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE160606A326
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 12:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kC5hPj76
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FF7F1F00A06;
	Wed, 11 Nov 2026 12:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794401161;
	bh=lcBs4OdlonBE6tu2mUoCicob4FXAl1C/Ax1sUjhw7RA=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=kC5hPj76dDxODecHDXoj9RwLr4Vhrty4vvfBh2I3Qm8M3PuEoK6bdufZjIEh8JyMx
	 MXg/EC8YUQv198YBrmijlfJzxbAajNZ2QowzvMlsVn4Lf9d71vJFlWAn55I4ukXZhq
	 FRgunMV6nfPNWFNWMJ+xB705Zsr+FpzCEGVmfQmcwEvhbMWvl63BiydWwZ/CsgLouV
	 qRfBgw3N1cyTOMeF09S66SOMOK5+fvAVizNpNl7jNat0c0NChpoalRV5JSHPDmC0C2
	 nqBIhDXCJLLE/02fBUbn57IqLXhuUo8J2cTZ6BI9dBNWuQTrUEu+YdytMbvASD+qyO
	 gP1/KWslc/DyA==
Message-ID: <sashiko-outbox-209007@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] Documentation/thunderbolt: Update Mika Westerberg's
 email address
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mika Westerberg" <mika.westerberg@linux.intel.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261111124149.1324711-1-mika.westerberg@linux.intel.com>
References: <20261111124149.1324711-1-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 12:46:00 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Mika Westerberg <westeri@kernel.org>
>=20
> My @linux.intel.com address will be going away soon so switch to use my
> @kernel.org address.
>=20
> Signed-off-by: Mika Westerberg <westeri@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111124149.1324=
711-1-mika.westerberg@linux.intel.com?part=3D1

