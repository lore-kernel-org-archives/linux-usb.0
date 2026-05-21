Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9783828373;
	Thu, 21 May 2026 19:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779393559; cv=none; b=PdsNtud4dpPU7qB4OngJi5JsGDlf++0mrXrUL8ofzlBeuZ1yrqsGJkVvYv/QKZP3e4xIsyEwgKq/9fs8RFgN34YOS+TNGxBlE255tuYcEi5C01WwOJYjteUwYyK9QEwhTrUiuR3Z4BMdZ9SAN43e1KHKs12EeGoj0BIBPXYp2TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779393559; c=relaxed/simple;
	bh=VJ2Jza8GIkCvdxqZvuYAHRvQI6OkK5ygN0bQ+CxmKs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RcFUOex9JO5+NReUizzZfhlcayvkk+2qJiOLm5TYjK/licKw+AmFylYaHh55IbJSAPodsFgoyaJJKzgyXwcibCUDHAtJy6zr89yG8IpA9jbR4m44wBY2MBZK8YLFbQW2zP7hWMTiMu1hREk0sK6elTbC67as6nnIYCH1mac0r5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ErkOf2+P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ErkOf2+P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C6181F000E9;
	Thu, 21 May 2026 19:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779393558;
	bh=EKFVy91srQVCZz2lyGffsrnpRSak1Uv6bnBCE1hfeNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ErkOf2+P3hDtKm4VzTIuu0Gf45sTk47FvLO0gMbbz+NIcPpXrrHBboWjDIQJMyeZ2
	 sGC22J0UkPzWxHHdYZMlBw+EXR6jckPXzrR5bI5jO0FxUuNWA6b1mURdGvYSs4UXEJ
	 KCoRlMC6UgiUaJkFbhHdfkg8How5kHLyLuNm3ni6HJqvZg6WEDPEQFF7SK6ut6EaUx
	 HNCA3iIoTwBwEhGGxuF5Kaohr0USc0I4Ch4zhCFf/SymV1qjOFn1uOCIievUIN9g6y
	 p8V3wzJZGFsp8R/e+ImjhZ7oE5B6CIAp87B7ZPeO/3uTLcr1Xwfppg9Djzuk+64kJp
	 MYRBzsEImt79Q==
Date: Thu, 21 May 2026 20:59:14 +0100
From: Conor Dooley <conor@kernel.org>
To: pawell@cadence.com
Cc: Peter Chen <peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 1/2] dt-bindings: usb: cdns3: Add cdns,cdnsp
 compatible string
Message-ID: <20260521-excretion-cheese-5e8f8c446c94@spud>
References: <20260521-no_drd_config_v9-v9-0-2512cef10104@cadence.com>
 <20260521-no_drd_config_v9-v9-1-2512cef10104@cadence.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="//oZKsA7NTUbhEgV"
Content-Disposition: inline
In-Reply-To: <20260521-no_drd_config_v9-v9-1-2512cef10104@cadence.com>


--//oZKsA7NTUbhEgV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 10:16:23AM +0200, Pawel Laszczak via B4 Relay wrote:
> From: Pawel Laszczak <pawell@cadence.com>
>=20
> Introduce a new generic fallback compatible string 'cdns,cdnsp' for
> Cadence USBSSP controllers to support hardware configurations where
> the Dual-Role Device (DRD) register block is missing or inaccessible.
>=20
> Following the maintainer's feedback, avoid generic property-like naming
> (such as "-no-drd") and use a clean generic fallback. To keep the schema
> resource-driven and strictly validated, define a two-string compatible
> matrix using an empty schema ({}) wildcard. This allows future vendor
> SoC compatibles to be prepended while safely falling back to the 2-resour=
ce
> USBSSP configuration.
>=20
> When 'cdns,cdnsp' is matched:
> - The 'otg' register and interrupt resources are not required.
> - The 'reg' and 'interrupts' properties are restricted to 2 items
>   (host and device).
> - 'dr_mode' must be explicitly set to either 'host' or 'peripheral'.
>=20
> The standard 'cdns,usb3' compatible remains unchanged, maintaining
> backward compatibility by requiring all 3 resource sets (otg, host, dev).
>=20
> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
> ---
> v9:
> - Dropped the "cdns,cdnsp-no-drd" string to avoid generic property-like
>   naming as requested by Conor.
> - Introduced the clean generic fallback "cdns,cdnsp".
>=20
> v8:
> - Update commit message to reflect schema changes.
> - Removed 'cdns,no-drd' boolean property as per Rob Herring's suggestion.
> - Introduced a new compatible string 'cdns,cdnsp-no-drd' for controller
>   variants that lack the DRD/OTG register block.
>=20
> v7:
> - Rename 'no_drd' to 'cdns,no-drd'.
> - Update commit message to reflect property renaming and schema changes.
> - Simplify 'reg-names' using a single enum.
> - Revert 'interrupt-names' to a list of constants.
> - Move 'reg' item descriptions to if/else blocks for accuracy.
> - Clean up 'if/then' logic (remove redundant checks).
> - Add explicit 'items' list for 'interrupt-names' in the 'else' block.
>=20
> v6:
> - Fixed validation error for 'interrupt-names' by correcting
>   the items definition.
> - Adjusted 'minItems'/'maxItems' to properly support the optional
>  'wakeup' interrupt.
> - Fixed 'too long' schema error in examples.
>=20
> v5:
> - Implemented strict conditional validation using if-then-else logic.
> - Enforced 2 register/interrupt items and required 'dr_mode'
>   (host or peripheral) when 'no_drd' is present.
> - Enforced the standard 3 register/interrupt items (otg, host, dev)
>   when 'no_drd' is absent to ensure backward compatibility.
> - Updated 'reg-names' and 'interrupt-names' to use enums in the main
>   properties section to support flexible resource ordering during
>   validation.
> ---
> ---
>  .../devicetree/bindings/usb/cdns,usb3.yaml         | 63 ++++++++++++++++=
++----
>  1 file changed, 53 insertions(+), 10 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Docum=
entation/devicetree/bindings/usb/cdns,usb3.yaml
> index 2d95fb7321af..e8082c5c05a2 100644
> --- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> +++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> @@ -17,22 +17,24 @@ description:
> =20
>  properties:
>    compatible:
> -    const: cdns,usb3
> +    oneOf:
> +      - const: cdns,usb3
> +      - items:
> +          - {}
> +          - const: cdns,cdnsp

I think this is reasonable now. If you respin again, could you add a
comment here to the cdnsp case to explain what it represents, unless
"cdnsp" will be really obvious to anyone who has this IP in their
device?
Otherwise,
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

Cheers,
Conor.


--//oZKsA7NTUbhEgV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCag9kEgAKCRB4tDGHoIJi
0gesAPwLX1ZVx/MC1rWFmQFrZ6a/Vb7h89B7I2lAJRvEbLManAD+J+7cPSAPCNQe
+837D8LsrGD1JUEhsYfW92vVkLFAugg=
=VQXJ
-----END PGP SIGNATURE-----

--//oZKsA7NTUbhEgV--
