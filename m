Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CA71A682F;
	Wed, 11 Mar 2026 18:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773254646; cv=none; b=OjccFS/pHEVCsQsGf/iuRAvUcLrUtFRjOw5eaAEgnCYZ4VwjuqswvR0FkPz1mFthUD78YoRvdTTw53wzCcUJ05JifqJrg0OmO71Lah7OmtzwLEU2k/GGpw2i0KFFnHdHaGkScMWhHdYd/Z8D0U2cA21fDfqmpPlvbApmzudhC+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773254646; c=relaxed/simple;
	bh=lLDUMyEV38aCw8V0nWb79qsOsKSW/XYdptR0FCzveEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o6hQ/VAlS+m8weHQcFBQdKHL4SgSH0vjlJx0L4fdouCn+obNeR542+x9wO5vTAOUk9MnsGw3a2Ow8g2dTDIrTCt7uD95V54MvZlVYKIiwjodjPI0W7fAPeT1PBaHZXEkK9efqJnYf3BCPOXCPuvlHv8yKodKy7/k14tXh6ekFnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T4owwLaY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T4owwLaY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95FB5C4CEF7;
	Wed, 11 Mar 2026 18:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773254646;
	bh=lLDUMyEV38aCw8V0nWb79qsOsKSW/XYdptR0FCzveEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T4owwLaY8gUh5KvDcwuiCGIjbcjFnjtNWloM7SvYoLRNw2XPzaLn8ALVMaGsClunf
	 Y02IqO/fbSwQZolDqguxzkqi/3UbV9LlW9JUx4IEuQJlFfi/J4TfmFbxMM1aD3l0B1
	 1EJ1xg4Jibth4F2LL/GMO/HeLzUSVzz1sFcf/oO0v4P3yizU/gyttVNGCYtPZQB6Qg
	 CfC1R3/ogp2CNuH6rqyioEcElXbdCblXEMkUpxQTRVS0V7lK1QfqGgi5rnUfcTPfEr
	 ahAN99L18pEAkHj0RjuTOAKgDbYpOzWsh3HURZpwTm5iGfWcDAvt7HHCxcLM2eYiYH
	 B5GoeWzRLxQJw==
Date: Wed, 11 Mar 2026 18:44:02 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexey Charkov <alchark@flipper.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Kaehlcke <mka@chromium.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Shenzhen Corechips
 Microelectronics
Message-ID: <20260311-lubricate-figment-ec2fcf71f786@spud>
References: <20260311-sl6341-v1-0-0a890056f054@flipper.net>
 <20260311-sl6341-v1-1-0a890056f054@flipper.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SjfPcaz6RMqsvFCA"
Content-Disposition: inline
In-Reply-To: <20260311-sl6341-v1-1-0a890056f054@flipper.net>


--SjfPcaz6RMqsvFCA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 07:20:21PM +0400, Alexey Charkov wrote:
> Add Shenzhen Corechips Microelectronics Co., Ltd., which is a company
> producing chips for USB accessories
>=20
> Link: http://www.corechip-sz.com/enproducts.asp
> Signed-off-by: Alexey Charkov <alchark@flipper.net>

Sure.
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--SjfPcaz6RMqsvFCA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabG38gAKCRB4tDGHoIJi
0tOsAQDSlEn8I+c5I8GGpZl8hvteI6FGHPixABlqDJMULTAkhAD/ab7Mem0iZLZb
pRuCoURzJNJ/+qJ+jDEBq6rxwMvOpgg=
=qNPp
-----END PGP SIGNATURE-----

--SjfPcaz6RMqsvFCA--
