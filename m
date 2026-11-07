Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794052577;
	b=Ss2hgxmW2KagLohGXxP1FNw+GP9qq5Qu/cNikCHDkI4AVbNONF7XJ/El8Em4y3IBF5t0
	 HFUkc90Dxpk+JceTVY+vEu7KWulz8Ae7YeiAo0AQhQ4WUHVtAhJkEiT5g0IxynIDlFsza
	 MDW5IzC+yN4QGihFM4F904ewgPxEvxv6qChhLQxLYqijh0v015HK7kXQ+5CRTy79EgzFa
	 hsA0na27tDKJ7TZaXBsppryIoUQMRAhKEJr9R1xrpglgw3E7XdjDTJ/0H15nG7tsa/sme
	 vM7OyAJiQSwNMsZOcTTVrhdRw1bSoHxtLbeeO3whPYuBfXVMdexunO1tlQsxNWZR+1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794052577;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZolRhi6fh9OzPtOQ4A8D3QYqK7WUs9h96nD8knqj57w=;
	b=RF25ilE2PzgXSGJt3x8onPdyyapC9pyrSBIXN1xHnPY1CZPLXzjpPWJex5i563Rc9RIW
	 9ltWwqP4JuUmQibA1Kk4A3a094ZyKrWFnC2lag4JeA37xPogu6tM+ASyuC3nYSf+NPdIv
	 FiHfR7fzT40e7QGGZR8Ct54hNPVcqrVRsoILjULABdEXCi08/4eswnCFjH6MZGWovctbE
	 MG2YoBepzsjvFyKKY7Hqc1lFQP9Gb2Oysjd93jlx5Puiz520pAh9ZligTA05RC4jor65D
	 vfzIAwMfN5HIrKtvwL1AD4SSWbMMkmFp5QFNCrh2SN1JanrmVZyP7GN+/s/w0Ld4ELA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mi1t4LYD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B8F606A326
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 11:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mi1t4LYD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A322F1F0089F;
	Sat,  7 Nov 2026 11:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794052576;
	bh=ZolRhi6fh9OzPtOQ4A8D3QYqK7WUs9h96nD8knqj57w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mi1t4LYDjJKI9t1BC/bRr6VV22Nkp25lWDfOhz89ZHbct49Z572fa6kXR/+bHg2UC
	 1gqiCd7DqMyX7vn+2e/DeGpABIApEC7ZBKbs51s3dLi/3bwVZJTowMuheCSp5TOATo
	 eoEE8ZD0Pl5HQsduGvCbC2QFTOd8NqgDBArtPXq2DtTPlm48JNQZVWugDrjmEUTTXD
	 I8fUqtGtmoT3BckQMU8vPJJmL624MiknrkbnN/5efYHUISbRlufL355O+8hO1aqsq+
	 yItKW9oxFIGLqTdGoczjMDKR7LI2Cx+tKhpwmGJs5Fiyfdyc4lV5Aj24gSCYl2hKSh
	 KXE/I1cNc/vCg==
Message-ID: <sashiko-outbox-202869@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: musb: fix use-after-free in musb_remove()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Crofts" <crofts@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261107-usb-uaf-fix-v1-1-ba33689d0ca3@kernel.org>
References: <20261107-usb-uaf-fix-v1-1-ba33689d0ca3@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 11:56:16 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Currently in musb_remove(), musb_platform_exit() drops the PHY refcount
> before usb_phy_shutdown() is called, causing a use-after-free bug.
>=20
> Reorder the function so that usb_phy_shutdown() is called before
> musb_platform_exit(), the same way as musb_init_controller() does in the
> error path.
>=20
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-d180c2b9-0006-4638-a22b-13df8c201=
235
> Fixes: 39cee200c23e ("usb: musb: core: call init and shutdown for the usb=
 phy")
> Cc: stable@vger.kernel.org
> Signed-off-by: Joshua Crofts <crofts@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-usb-uaf-fi=
x-v1-1-ba33689d0ca3@kernel.org?part=3D1

