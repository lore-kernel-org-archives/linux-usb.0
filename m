Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA396359A6F;
	Fri, 21 Aug 2026 16:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787330263; cv=none; b=W1P6r3s8yb8vPLe2+DLFi/VAspFtD8FFRucIhGWW2IJbl2mND3OxKkEA6kaXgFb6tGI6Ppb6PY0VzFfBatU1DwO71nseib71mjuoHAgXeft2R70kEREPVukAMlJjJpHn2m0p0U4kd1kJcnQ5CLtyyU4hC370Vdz0PbsSD6mpVxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787330263; c=relaxed/simple;
	bh=984LjcXNfK3eUwajFg6jgG+gWuaIiViLqR92RGAN5Dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GyHlrwdER4lQeZYNXiw9EQQoWsbKkoInwYSRq62EjS8tKOYU2G1eARpb4uSE46K5OvfQ8TQqpeThd3vwEyEfg0ZXZbuPomhoYvyK17hWjq5Onr2W+LkId507vp0U3doKxSojuDLKiOy1x+tRoUzmwiNFQyzCRp64NKI853jW5BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aRxFLUT6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aRxFLUT6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85A0E1F000E9;
	Fri, 21 Aug 2026 16:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787330262;
	bh=984LjcXNfK3eUwajFg6jgG+gWuaIiViLqR92RGAN5Dc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aRxFLUT6TAuTrHARNaYbZt8xdNknr1aOufX+2ARB6ybskDMMufoAlOfn66z8Diuba
	 DhcIzPocnAi3Y/2sehKI8Hc4ow5S1YE+oNnopzBKVjLD6O+WRU9yvfo0rMq0EoNlub
	 m95fwUdjVquaoTXV9Xsqt8CgKE8hJo0288TofDWOeOdJ2J30efmo/w4peMunBT58r7
	 9uq3lx3aVcxtVkq/raf77bN1z6Gtkf52WLdJx1dxtsC9NA4oU6e1hqySsZFW2Moq86
	 tHSfWWBVQSkmqK/IKimNGHlxw9ixdJYL9b4VVeSt4qHA/CR9d4VDmTIwLLUtN+EFoj
	 sLr4KcDs1aNQQ==
Date: Fri, 21 Aug 2026 17:37:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexey Charkov <alchark@flipper.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: ti,hd3ss3220: Add support for
 supply regulators
Message-ID: <20260821-aqueduct-precision-b709b014ff21@spud>
References: <20260821-hd3ss3220-regulators-v1-0-405e5c4fb306@flipper.net>
 <20260821-hd3ss3220-regulators-v1-1-405e5c4fb306@flipper.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tD4I+AV58Rt9ETuc"
Content-Disposition: inline
In-Reply-To: <20260821-hd3ss3220-regulators-v1-1-405e5c4fb306@flipper.net>

--tD4I+AV58Rt9ETuc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--tD4I+AV58Rt9ETuc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaoh+0gAKCRB4tDGHoIJi
0oykAP4nrpjqUoQo3juVC/tGKPeUuI18f1ioxsAq9X6juF+/OwEA8o7KWhl4UN3M
9JGcF+sDS2mROY+zgO/MS5KKcBUCgw0=
=OwzB
-----END PGP SIGNATURE-----

--tD4I+AV58Rt9ETuc--
