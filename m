Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C7A4963BC;
	Tue,  9 Jun 2026 15:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781020602; cv=none; b=Z+2fIITGGo+lmvURTMJLtXf9VxiTRlt5ZsnZnIn6q7Iy8xfMXWrMBlb+d2YwcqWwJ6XQUysMVn9tln2BMUPaSsRM8O2npjMOjd66gPgBgPLQZMwqc/qnuBWOLWAjMlNyrGyeCe3e8mP4i7odQZXWrxy9K7f/TlDGzMj+LB4tT0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781020602; c=relaxed/simple;
	bh=S3aQpyzWcbuiEjHkJj+J0gRZ5Klatf36ZnyjH1OVHuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S9moOFSmn0f7+lvjW6VoTtne5+AGkikt2oHnZzIJv35hq/4zPbZOfjdzz4Fmrfg9gK3rhDm7D4GET7aoJaG6oK0EpU5dMT8roj1UzCGIqoM3voxv/xErgHdeHeF5nDI/ccLEBqw+IPr3GWAZEGSxcb2kzhhXbvd9PuUTaPZA/Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BwDPKhWW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BwDPKhWW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 736691F00898;
	Tue,  9 Jun 2026 15:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781020600;
	bh=S3aQpyzWcbuiEjHkJj+J0gRZ5Klatf36ZnyjH1OVHuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BwDPKhWWNPaluMsVm3+c8Rbl8uSyH14i2hGsJJVwwtrTBqGL20ODP3cD6dXot4nZ/
	 l1yv0e5ojFFJ3soY97GaHwZsEkTwuPuNMG/2zcp0+V+FL1M7Ig1JWY1cX1F2sTZrhP
	 CMX1ISLeJFoAMWUDedLaCVnQ8Br7mXpGZrK1KzC6GBc3gI2Eq8i62mG5+m7/E36vcu
	 DbVriQd7GEKlF18l5IzECe0fvhz8bjI+lCT88rMFSSiwfSnK3UdCJXJ+KiZivU2lpq
	 JZ5CQrRl9B+jJkkTrNH2+nDRCd5YU7VvtvZp+CSsq0ZiBF7uyqQhJwtyLL0izl5xLD
	 BCJk6xZ69dNSQ==
Date: Tue, 9 Jun 2026 16:56:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Diederik de Haas <diederik@cknow-tech.com>,
	devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: Add Rockchip RK3568 compatible for
 EHCI and OHCI
Message-ID: <20260609-subsidize-saturate-051fb051536d@spud>
References: <20260609154124.445182-1-jonas@kwiboo.se>
 <20260609154124.445182-2-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WY+aMPj6M1r/J6Zt"
Content-Disposition: inline
In-Reply-To: <20260609154124.445182-2-jonas@kwiboo.se>


--WY+aMPj6M1r/J6Zt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 09, 2026 at 03:41:22PM +0000, Jonas Karlman wrote:
> The Rockchip RK3568 EHCI/OHCI controller depends on clk_usbphy1_480m
> being enabled, or the system may freeze when registers are accessed.
>=20
> Add Rockchip RK3568 EHCI and OHCI compatibles with a similar four-clock
> constraint as RK3588.
>=20
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> Existing DTs for RK3568 use the plain generic-ehci/ohci compatible,
> next patch make use of these new compatibles and adds the missing
> clk_usbphy1_480m clock references.

Reasonable complaint here from Sashiko.
pw-bot: changes-requested

Cheers,
Conor.

--WY+aMPj6M1r/J6Zt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaig3tAAKCRB4tDGHoIJi
0oLkAP0ZrNxgoceQzD4valaereWdt2Bj3s62HUkYP8wgyZEVngD/QekZpNu3e8iB
Owz8oicDuMBs516aLfpRuD2ENHNPeQ8=
=g7IK
-----END PGP SIGNATURE-----

--WY+aMPj6M1r/J6Zt--
