Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631037;
	b=WKrk8rtAsseJtwF0u1szjpkBDN9623r2Jnm92I/t4zn1UyX0Fba1sggBI9RZ8vZ1h58L
	 SKPf7FHciUoPm32rr6pW6EUtRaNkTinlck4pio9YNqiOrnFy/wAubffRvPgyZlXmmpx7b
	 LjUkhsqpghZTeyRGRcFvLimd6gtc2kBgwfb6aXlbJSWbE5d9ttd0bC9cdYBCLy8qUeHF6
	 xNgrSu2MMZZ5PPYfFB9JqyKKwvebbpNvihZ3ke6l+0rBV2qPEibQwjq1q/4uDq72NShIQ
	 VYT1WvK0otYb47NyC5CUsVGnZvmfI8lEvBJSzWMkGTTeWuTEHEUG7n8bM/b1rmvy7aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631037;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=TB+00NTJ8YI7Y5l9Rr385lbT8RbGXWXYwnFdxTz8nKw=;
	b=I59hIcAmfQT2VCkE2Y5uT6DqgpXDIbwPK7NWQcavNc4/GFomn1Stkq8vqmlN+QXqraPR
	 SyBdqPvjpB2wYhdUuEQbfLOORRVNuf2elmwCNAkkJbUhmz1LvL3BbqlQrommPk+cmqh/U
	 GtkP93b1BYlX0Uv8J9EHEx7OroLFReFTbYkzYAw+BXYqSCF7reOBE/JYLW0OPXNKGpb8q
	 ucDE1NZmfSj0Ih+B0OdHthkMUf31VJsuVdj4LVMBY5/PQwoUml5q4getI1dHkc4PFbYz7
	 F34dYOXAINI2UMyyvHi7Ld8OBAuQ3RVMEGvXfL5uJUTxCl9Mu3Ye7QOKJSnO+TyzLoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bz8kOoAG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB51C606A6A4;
	Wed, 25 Nov 2026 18:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bz8kOoAG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64B201F000D4;
	Wed, 25 Nov 2026 18:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795631036;
	bh=TB+00NTJ8YI7Y5l9Rr385lbT8RbGXWXYwnFdxTz8nKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Bz8kOoAGqPJ/JyMejI8bUJg4uJiVHVqtA0+VIu73mQG8tW0ozRru6pkHQ2ss05KXN
	 +IKzLMd8AUZ+Ah1rUUBzoUl+tomWn9Ext5Ca8LEIMCZpyphy15ioBlBzaEQvd8q06Q
	 sxiFlC0lSA81Wg3V8eeX12JoSiygQli3aamGuHW1/OSDahjh3ZTgovFhdGw8wy9fht
	 zZV4GdLkuwk6pnBJK30JnSYzfHb9T1rDP/qggqM6ZVuz9lxWn9dhgXbc2yVO8+eMU3
	 GVOykE2LAp4VNWAvUhkK87xbLN2MNsWuNqQ4SXUBSHmGQf6pjWos8Wv6knY/2/8lAi
	 yIQe5A1j9X9xw==
Date: Wed, 25 Nov 2026 18:23:52 +0000
From: Conor Dooley <conor@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Kaehlcke <mka@chromium.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Anand Moon <linux.amoon@gmail.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: usb: vialab,vl817: use
 unevaluatedProperties
Message-ID: <20261125-savings-stung-e41cfcdc7842@spud>
References: <20261124-vl817-uneval-prop-v1-0-137c093fb300@iscas.ac.cn>
 <20261124-vl817-uneval-prop-v1-1-137c093fb300@iscas.ac.cn>
 <20261124-rehab-overlord-9b7f44ee7e0f@spud>
 <f818f0facb3af35e31b8346546c1aa23b10bd529.camel@iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="vM6FGX+N7kRbpXgy"
Content-Disposition: inline
In-Reply-To: <f818f0facb3af35e31b8346546c1aa23b10bd529.camel@iscas.ac.cn>

--vM6FGX+N7kRbpXgy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 03:32:10AM +0800, Icenowy Zheng wrote:
> =E5=9C=A8 2026-11-24=E4=BA=8C=E7=9A=84 18:16 +0000=EF=BC=8CConor Dooley=
=E5=86=99=E9=81=93=EF=BC=9A
> > On Tue, Nov 24, 2026 at 04:31:01PM +0800, Icenowy Zheng wrote:
> > > Currently the VL817 binding has additionalProperties set to false
> > > instead of unevaluatedProperties, which disallows properties document=
ed
> > > in the parent schema.
> >=20
> > This is not quite true though, they're permitted if the binding contains
> > "foo: true" etc - which this one does.
> >=20
> > > Change it to unevaluatedProperties, which is the better practice for
> > > derived schemas.
> >=20
> > Not really, it's fine to do addtionalProps: false + foo: true if only
> > a subset of the inherited properties are valid.
>=20
> The main meaning here is to allow downstream nodes described in the usb-
> hub.yaml file, especially downstream device nodes (which was a regular
> expression match in usb-hub.yaml).
>=20
> I don't think it wise to duplicate that regular expression in all hub
> binding files.
>=20
> However maybe I should change the commit message?

Please, and include the reason you've given here.

> > IMO this series should be two patches, or maybe even just one that
> > changes the ref (as your patch 2 does) and sets the then derived
> > property to true. Otherwise, this should be two patches, with patch 3
> > split into whichever of patch 1 and 2 is relevant.
>=20
> I'm okay to just drop patch 3; in fact I send it as a split patch just
> because I'm feeling that it's not so needed.
>=20
> In addtion I'm also okay to squash patch 1 and 2.

Yeah, you can probably just do the whole thing in one go.

>=20
> Thanks,
> Icenowy
>=20
> >=20
> > >=20
> > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > > ---
> > >  Documentation/devicetree/bindings/usb/vialab,vl817.yaml | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/usb/vialab,vl817.yaml =
b/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
> > > index c815010ba9c2e..d0484e48e319c 100644
> > > --- a/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
> > > @@ -40,7 +40,7 @@ required:
> > >    - vdd-supply
> > >    - peer-hub
> > > =20
> > > -additionalProperties: false
> > > +unevaluatedProperties: false
> > > =20
> > >  examples:
> > >    - |
> > >=20
> > > --=20
> > > 2.56.0
> > >=20
> > >=20
>=20

--vM6FGX+N7kRbpXgy
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCawcnuAAKCRB4tDGHoIJi
0mdBAQCMJAB1PANs5IFLdU2153Z5C6uqCxk18PrgCZjz1yApTwEA2uY6P1smeIT5
KWFGDaM0Rr2e+Z+ECb52aFcvqFdxwAo=
=KTU3
-----END PGP SIGNATURE-----

--vM6FGX+N7kRbpXgy--
