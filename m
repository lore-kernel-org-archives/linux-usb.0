Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6032D47FF;
	Sun, 12 Jul 2026 21:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783893406; cv=none; b=ZfGaI2y7wAECxIsE/3PbGs/iXKa0HBzS/lLKZ9JdGclyyzZ4bzIK+MD6WLHJ6atwYePG3uqgw6UucraaG8bC9/bA9dEiNYgKfs/f/OahvOhxvKxlmWBYvI5MwdLr3KsW7myCqbaK/P9tOYDIWVbDTqU6uSnHXCUNcAVwWLwegSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783893406; c=relaxed/simple;
	bh=P08yXbmetIfi/1c31UxqWMpF8Oxn4JUghpS1BSCCuXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F+9jMrzunNl36Nr4r5BYBtqzuOwnVnJZvYYxzgTtpjaQYAehgfv2wP/eYYGH9GYspkYz8zlBko2HJ74x5LCf1HTmvawjcV3hl5bSh+d/uuByiTd+fTgmlgQ0KOspooUcTzk6EXMky+MWDddCusCDK3Src4vUzr4dqGEKVP7+jSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iYIznFcd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iYIznFcd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE69E1F000E9;
	Sun, 12 Jul 2026 21:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783893405;
	bh=P08yXbmetIfi/1c31UxqWMpF8Oxn4JUghpS1BSCCuXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iYIznFcdZx4Ws6w23yKte4ohGHvCpdBRhWhBoYBni2fkVeVpUPC7DFo3/QBMHtBX8
	 KogQRSq3tGqrmIKuAfzJyNj8aZoJX85bmnTVW0aLak8okRwGYCTlcwvxvmGQGlMK/j
	 Bf5yTaNhnUqU8xAojz/DFRWrEYMIO86KW5ApNimf4/aupuhEuVruxF5EwXz4WyLsL7
	 7GTuOzWl44pbiMoNIrXU5tL70fFX5ZMyYYx+M1XVgC7PxPRebxCpwrL5vJ1oY5rsNi
	 r/FccJ3Ai+ZjJUs4DYqA88+xaml1Dx5N0ZG185Rbp3eYI3y61cqtcY2YjFfIWWLvZr
	 QyeEvfjxC2JOw==
Date: Sun, 12 Jul 2026 22:56:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	conor.dooley@microchip.com, daire.mcnamara@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, claudiu.beznea@microchip.com,
	Jassi Brar <jassisinghbrar@gmail.com>, a.zummo@towertech.it,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, wsa@kernel.org,
	ben.dooks@codethink.co.uk, heinrich.schuchardt@canonical.com
Subject: Re: [PATCH] usb: musb: fix dead select of USB_MUSB_DUAL_ROLE
Message-ID: <20260712-parole-stoning-d7e66a0961a8@spud>
References: <20260711130349.592545-1-julianbraha@gmail.com>
 <f4ef4d30-51de-4b58-807a-0fed243b2fe4@app.fastmail.com>
 <1705e4f2-a0a3-4be0-a033-eacc1d54fcc7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EZleqkRWnBYHwJcG"
Content-Disposition: inline
In-Reply-To: <1705e4f2-a0a3-4be0-a033-eacc1d54fcc7@gmail.com>

--EZleqkRWnBYHwJcG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 11, 2026 at 04:09:58PM +0100, Julian Braha wrote:
> Hi Arnd,
>=20
> On 7/11/26 15:39, Arnd Bergmann wrote:
> > Good catch, but I wonder if this is actually a real dependency
> > at all. What would happen if you just remove the 'select' line
> > here and build a polarfire kernel that only supports
> > host or gadget mode but not dual-role?
>=20
> The kernel builds just fine for me with USB_MUSB_POLARFIRE_SOC=3Dy and
> USB_MUSB_DUAL_ROLE=3Dn
>=20
> But I don't have this hardware so I don't know what would happen at
> runtime.
>=20
> I've CC'd more people involved in patches to this config option.

This is the setup I've been using in my development environment for
(probably) years.

Probably the select should just be deleted.

--EZleqkRWnBYHwJcG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCalQNlwAKCRB4tDGHoIJi
0qXGAQCHoXC+y5AgTqqF24kg0M0a/YUlxySAVhUTCfKIq6vpiwEA3NTON3A12BvX
BjXoxFKsFqqDoplYURe8aojMnllIswI=
=PhPt
-----END PGP SIGNATURE-----

--EZleqkRWnBYHwJcG--
