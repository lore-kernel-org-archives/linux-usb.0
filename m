Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795825177;
	b=Nk/IcjT8q7TA1pTRgPCjIhw8uejFLoLslu+/tySRFfe3XtCgW1rxbTcvsMn/3HCXcra5
	 t3kAiUX0R4eqfNrjp6P1ZaaAYGmzxnAnDJwUxL7F8ecJr3B5wotOuMGTu7so4Tz+zScO2
	 cdeG7N5Ea0hKJ036dG1yGx2dkn2/nFJjT3Fx24UfQ6YY9yOewA2hqkyWK82X8M+cw+WcT
	 m98A/FsF4/18E2rh6ftIDkd5OxRxh8zEOYBzH8rQJNQSOGfCtoxJC+GuJQ/TCUPwF5ygg
	 lYGKuKi3DTRlINr7XCZO+bDLiSe/nd7H6h56zbZqkOv9FqSehop+A44zZ8L8eydeoFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795825177;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SiBAAyRlUN7ziZgNoUh06pW4vyVha1OBbWSZyBLTY4c=;
	b=Oy2UvuVRf25K0ZnHMMhaNwH1+LSJ0zXq8vIcVM1qk2Ggf1ewni542Xt96ZsjLe7ju3Ni
	 CPPMv8mKrxv9ZkPFkxkXiKJSlFD4DU9IeOQ6x9IcfT/iQbZi+ox5KF1xzOxDoDNplGP8q
	 nZ5QSDDMVx+RjDz8UEg8PNbEbCi4bTxWMtBcKB5z9rdNvI6CTwJNfEGTsvXTPAnQoo0hV
	 3IlaHowv964FP5MnP+9sqvVG9vCjX68pDIoj155vMe19U0owcmHFDWFBURq5YfPiADZXA
	 PmIdTHOogCMiWNHnGiN9duQjLjiBJBDTCui3Hs/dIepISAxqF2ZqubmmBvs+ZPX7ZHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="SPYZKoA/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302CC606A31F
	for <linux-usb@vger.kernel.org>; Sat, 28 Nov 2026 00:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SPYZKoA/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C869F1F000C1;
	Sat, 28 Nov 2026 00:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795825176;
	bh=SiBAAyRlUN7ziZgNoUh06pW4vyVha1OBbWSZyBLTY4c=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=SPYZKoA/sY8DUyDEppRbCvYTA7vduVDaTGFAc3sgJNLQRk0yq1HHsfQ3EXJpvyqTZ
	 gycZdQdUQTJMXAiRPum8QrddbZ3rmxI/C1hNm+mX6AQy4gD747En4Jy6uAxu94uJX/
	 GG0Ndvzs0BZCrpqQM1w8KpukMkVSiopbgf7PTESS9oyIzS6QPfnTHDTbn3S/bWXyRQ
	 zHRPFfrLjM7Fhiz11I6ER38cufK1cmuk4uvgYxl3ZRZBxxhOYmDsRBB+5+7Qm5qf/7
	 Z0hXiGgONAgb8khimm5D7INTQYv/Kjz8svTHndRaDdYJsYfk2MTaULdBEedly5/pBN
	 Ov4Eh85/YMhyQ==
Message-ID: <sashiko-outbox-238366@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5] USB: serial: visor: add vendor/device IDs for
 PalmSource devices from inf file
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adam Simonelli" <adamsimonelli@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261128001557.452362-1-adamsimonelli@gmail.com>
References: <20261128001557.452362-1-adamsimonelli@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 28 Nov 2026 00:19:36 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> PalmUSBD.inf from Palm Desktop 6.2's driver defines two PalmSource 'devic=
es'.
>=20
> Vendor ID 0x13e8 in the inf file indicates PalmSource as the vendor.
>=20
> PALMSOURCE_DEVICE_1_ID (0x0600) appears to indicate PalmOS 6.0 Cobalt. No
> devices were actually released with PalmOS Cobalt, but a development ROM =
from
> a Tungsten T3 made its way onto the Internet. This ROM can now be loaded =
and
> booted into RAM on a T3, which once loaded, the T3 now presents this devi=
ceid.
>=20
> PALMSOURCE_DEVICE_2_ID (0xff00) is also defined in the .inf file, but the=
re is
> no known device or ROM with this id for PalmSource.
>=20
> Signed-off-by: Adam Simonelli <adamsimonelli@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261128001557.4523=
62-1-adamsimonelli@gmail.com?part=3D1
