Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793686716;
	b=icWPqCH5GFbyny/gzqz2yK/ohushzITgz4aTLxpPSy5NR1DmIRKfAq77QYsGC0f0EztI
	 mycvdnhV/24HTyZT/Rx//FvCL1HJh4tjScYoVNFUcZhcMlv6pXNDjHhVs76JSeuzx1Uhf
	 LL7tQAbbgy10HQEJh+4G1PfxJbUGFw6LLdkdAQ2sdoYQXhfAmvVbpcDYp7vQpwwiJV7WB
	 cvBvKHf7p+5oXfqYbFrpVd/jtu9DieQS6p/kzQGhJvgpsyWL+KYngoJD5WOOaViemkJOi
	 7k4o9+WILiVf+9T0RQhISbt50NxpWmOwxW1b/pbdQ5b62kR80miN3eyzkxwqSh3Dpeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793686716;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IE9SYHIo5vGX9Mw3uWmKYIJoNxMrGsdiRfVObJODqcU=;
	b=SfHgGtvfWEjP2AOrnkTcUl5kubjJimlkDvCVng5PYS+7+DdI/DDj2j8nFKOjaoOCnu3c
	 bHTnv1quz1hcpGChj1241vgLtzjAaaYY1tn4Ml/o9zTCX5aBWyzExzxPRT7JbVrWWoyZE
	 EViiXAE94jxC0wDw5s2B7YxUUOSA3j780/r+iEO/xwRKYHdJRXorCkyk/JKzvqe4yEwao
	 7G9Vkbesgd5i2gpT3+ICQKwBR0T83gGaez0T0dIuRyBxY8YlPvbdguXS4huOJN6ysmSzI
	 KtfAyoLb2G4kxAW8yIf4GAqIuWybYYGhkSipyfPD4RyGDZ+VlyOssGY0/DhUpJwRsaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c2q8Jqq6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9423A606A329
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 06:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c2q8Jqq6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 137271F000C1;
	Tue,  3 Nov 2026 06:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793686716;
	bh=IE9SYHIo5vGX9Mw3uWmKYIJoNxMrGsdiRfVObJODqcU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c2q8Jqq67qC0sDJyc63O/fELi8OxW343c4MJZ8Q89/knmobJ6aZiZiVgX7b49PQ9D
	 5DWma2lgQ+EJXoJeGCIHT8g5UfKk36Dbq/W6s4UAweGWMFcgSqERwPYPzcJ8NGZWDZ
	 W9csksRWFHK40i0Rcjxl28778blW5XG2Ifrmtb9vXx/Z+K7av/CSRfopfnlE8VRU1D
	 aBvXsAzrx+KvJtzV/yZhg2sSBUKncGtfUgreVb11VRtewl2jzmW/iOAMa8DbHq93CB
	 zF6ssP3+Nv+a0tUFmKBCUwN1nTrVtwgJQ/9zWqmgBKWso9K+v0ogoXNQFnYeim9IBH
	 2gZ9P9Yxrj+yQ==
Message-ID: <sashiko-outbox-194613@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] USB: hub: call ACPI _PRR reset during port
 power-cycle on enumeration failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mario Limonciello" <superm1@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20260706080117.3754550-1-v3-1-0e3069228fe9@kernel.org>
References: <20260706080117.3754550-1-v3-1-0e3069228fe9@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 06:18:35 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Some USB-connected devices (e.g. MT7925 Bluetooth on Dell laptops) expose
> their hardware reset line via an ACPI Power Resource for Reset (_PRR)
> rather than relying solely on VBUS cycling for recovery.  When the reset
> GPIO gets stuck low the device stops responding on USB; a VBUS power-cycle
> alone cannot recover it because the chip remains in reset regardless of
> VBUS state.
>=20
> Add usb_acpi_port_prr_reset() in usb-acpi.c that, given a hub device and
> one-based port number, looks up the port's ACPI companion handle, evaluat=
es
> _PRR to obtain the power-resource reference, and then calls _RST on that
> reference to toggle the reset line.  The function is a no-op if the port
> has no ACPI handle or no _PRR method, so it is safe to call unconditional=
ly
> for every port.
>=20
> Wire it into hub_port_connect() during the mid-retry VBUS power-cycle
> [ ... ]
>=20
> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Link: https://patch.msgid.link/20260706080117.3754550-1-acelan.kao@canoni=
cal.com
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706080117.3754=
550-1-v3-1-0e3069228fe9@kernel.org?part=3D1

