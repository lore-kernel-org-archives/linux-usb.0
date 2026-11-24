Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795544218;
	b=D831dJ27ugXNVaxm2hwRJaHLuOYi4/xJ+NQlVADc4ef+47JYz37RYAyqpwBKGBQVRXMe
	 RviQpsN0hQGqKN6PERYfX9QX/3DyEyD1JuMtljzGUBFN7iHR17mRoxGP+s1oISwJcp6V0
	 3QahU2XnN4uipYTmUYb9nLZHfsiEvPQwL02TD6TOx3f1Z0BhsRqFwsZy6BGKwQIoUYAke
	 aoNG8h48LIf9iW7z0BreZuGHeDsADAOj1tj5J6VmS9xqvcoulhieQ+9qJTC71iONwT2aZ
	 3dWhS6o7PaiIbHO8yiqAxf3X0nQoW/MfvZ/yaWPF/zv3Rkrm/zzeyCHkiLeEvcZu5Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795544218;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=iGCDQxlSZyNbpjb8HmmAXDh7kjSdNds3Y7zGFjiw20U=;
	b=u+OAP9hFkXUbKHZgq/cH27RqEu41p7o7J39OUOeC76793qpwqSDiY2SPgtojIappqCcM
	 F5RXuTiJ29YrB5IBCRycFjyj+//OFxnEiiWDn/GnVx/Frmp0vjn6A9JOXe0+4skiTy0rV
	 4dzVdfzlEdmTBcSCrlJmjocD+xpVi2u4AT4FBlHtiXDQ6S9YyCYxkPrr/MmzL0M6Vb1tG
	 Aeyu/+iiSYQ47GG6TJxmP04PmVcqdM2Q1ah/6M0Gxf96W3UTMHRZhjUiXsp5HarxDjXlr
	 X5DMKpQBlZcX1Hdw8q3q7acrDyuFIX3LSyUlbhuwgEPZjwwAke6XKMaR4Phme2FWSFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="SD/W5C0A";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D60606A326;
	Tue, 24 Nov 2026 18:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SD/W5C0A
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E43B1F000CA;
	Tue, 24 Nov 2026 18:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795544217;
	bh=iGCDQxlSZyNbpjb8HmmAXDh7kjSdNds3Y7zGFjiw20U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SD/W5C0ASolH9COBd9wxlzS8OhjBSOpB4GDhjPjv+hFUBmlFcx4gwAT655N1S2vZj
	 bHdogH/ywDxgK04aCxjYYb+n/0QrIDu4uoDoG5RAtbJYy+VUvGhkAEzPZJ/y6LHlBq
	 N5e5bMiy+ufbs0SdlC6LEUGUqpOH8LZVOgvlxRHYWQiMxVA3XYyqoACZwPfTOo0H6b
	 XKb0PGwAuBSU0SQjIkNXw9hthB0lPIRyZjd49KoGOo7brkRA4NvwKiDA3d2PNYH2rz
	 +YOuidcDP7JidcTZkYvit+ptJw4lH70khjbXvJA4oYfRkRPjcShYkxBU4MX6yH9Q+j
	 XC32QrDvrHVjw==
Date: Tue, 24 Nov 2026 18:16:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Kaehlcke <mka@chromium.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Anand Moon <linux.amoon@gmail.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>, Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: usb: vialab,vl817: use
 unevaluatedProperties
Message-ID: <20261124-rehab-overlord-9b7f44ee7e0f@spud>
References: <20261124-vl817-uneval-prop-v1-0-137c093fb300@iscas.ac.cn>
 <20261124-vl817-uneval-prop-v1-1-137c093fb300@iscas.ac.cn>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h5SN1Pgh8t8ElQFR"
Content-Disposition: inline
In-Reply-To: <20261124-vl817-uneval-prop-v1-1-137c093fb300@iscas.ac.cn>

--h5SN1Pgh8t8ElQFR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 04:31:01PM +0800, Icenowy Zheng wrote:
> Currently the VL817 binding has additionalProperties set to false
> instead of unevaluatedProperties, which disallows properties documented
> in the parent schema.

This is not quite true though, they're permitted if the binding contains
"foo: true" etc - which this one does.

> Change it to unevaluatedProperties, which is the better practice for
> derived schemas.

Not really, it's fine to do addtionalProps: false + foo: true if only
a subset of the inherited properties are valid.

IMO this series should be two patches, or maybe even just one that
changes the ref (as your patch 2 does) and sets the then derived
property to true. Otherwise, this should be two patches, with patch 3
split into whichever of patch 1 and 2 is relevant.

>=20
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>  Documentation/devicetree/bindings/usb/vialab,vl817.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/vialab,vl817.yaml b/Do=
cumentation/devicetree/bindings/usb/vialab,vl817.yaml
> index c815010ba9c2e..d0484e48e319c 100644
> --- a/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
> +++ b/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
> @@ -40,7 +40,7 @@ required:
>    - vdd-supply
>    - peer-hub
> =20
> -additionalProperties: false
> +unevaluatedProperties: false
> =20
>  examples:
>    - |
>=20
> --=20
> 2.56.0
>=20
>=20

--h5SN1Pgh8t8ElQFR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCawXUlQAKCRB4tDGHoIJi
0nO+AQCJAJQTo53plhDVm7UVgErvHVFbl7zCVtc+zoFcZcdSxwD/cwcY0/X1MXWN
jqxraemeI6fTwrwLeoYGLbzdaaRxYAw=
=fGFb
-----END PGP SIGNATURE-----

--h5SN1Pgh8t8ElQFR--
