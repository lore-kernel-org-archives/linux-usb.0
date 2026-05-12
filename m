Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18922385D65;
	Tue, 12 May 2026 17:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778605856; cv=none; b=K292Uxo5YgLYegPUQaMy9wvfgtkYNceXJ9UIocC5KLj5ACHFpSeQ7mDriNzN3yDq6zQ/C+HyNt8LrHljn6EGHNfA6z/5zob1K5JJd9FNBVa0bb3dUCIDse5g2fGGqPZEcnKOgzAySesKnJwN3air1UN3zB8ITD+qVqy3VAyNLKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778605856; c=relaxed/simple;
	bh=TIJBX+P9CzCwRxF+jvUWgDSddMwlDroZopIvlM9hajE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XqzCzUNYV4NLnJzDCLrKT77zW/5RnmzHECKmskKF8/rMBAyFH20uF4dISUqDo7EzrNrYDj2fg1XO0vc+U43I7PUQ1NAfywWhxY4mM0XtLKeZXVnjpvf8WHtPXU9PG/VDXyrVDYTtYOKwtedpkVnJfYdxxlk/8kH5IHghh3zXYQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hoUAX/ll; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hoUAX/ll"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE474C2BCB0;
	Tue, 12 May 2026 17:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778605855;
	bh=TIJBX+P9CzCwRxF+jvUWgDSddMwlDroZopIvlM9hajE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hoUAX/llYxZVh6keBLTBhxrOWv3H+yi0dLxXISPbUHGQDujkteJRuUs6+fXCG38FS
	 jyt/3vnocdgQlGnnJ/b40FL5pas3DrlD1w7hmeEXTb4UCdDqp7u0uEB3dfZRC93BXE
	 Hq8/Ng5zzmbhxv4hTKH+yufOTbSGOZPFuwdVmOudPXdGcDaMa02y/QtCOPYCaO+ZAS
	 Eq5sG3ox1+9eeVkijX8fKG1aZXzYFx+ge8g7/iUg8cuAfnT8MdlsSLTThA31XyT1bD
	 CnDclAEMClmOEJ4elxcN3wh3seEaa9TQgA44CHshLV2kTUsE6Kd8O17IWab5rkeiKp
	 v/BOmWdmO6n3w==
Date: Tue, 12 May 2026 18:10:51 +0100
From: Conor Dooley <conor@kernel.org>
To: pawell@cadence.com
Cc: Peter Chen <peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: usb: cdns3: Add no_drd property
Message-ID: <20260512-grasp-pacifism-18fa9bbb21aa@spud>
References: <20260512-b4-no_drd_config-v4-0-7b4e5dc96f81@cadence.com>
 <20260512-b4-no_drd_config-v4-1-7b4e5dc96f81@cadence.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GwzlsYKoX03N1q3W"
Content-Disposition: inline
In-Reply-To: <20260512-b4-no_drd_config-v4-1-7b4e5dc96f81@cadence.com>


--GwzlsYKoX03N1q3W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 01:44:24PM +0200, Pawel Laszczak via B4 Relay wrote:
> From: Pawel Laszczak <pawell@cadence.com>
>=20
> Introduce a new boolean property 'no_drd' for Cadence USBSS/USBSSP
> controllers.
>=20
> Some hardware configurations of this controller are designed without
> the Dual-Role Device (DRD) register block or have it inaccessible.
> In such cases, the driver must skip all OTG/DRD register accesses
> to avoid bus errors and cannot rely on hardware-based role switching.
>=20
> To accommodate these configurations, also relax the requirements for
> the 'reg' and 'interrupts' properties, making the 'otg' resources
> optional.

Why unconditionally? I think these hardware configurations need
device-specific compatibles and the constraints lowered on a
case-by-case basis.

Probably those compatibles should require no_drd too.

Alternatively to doing the conditions per compatible, if no_drd is
present, maxItems for these properties should be set to 2, and when
absent minItems set to 3.

pw-bot: changes-requested

Thanks,
Conor.

>=20
> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
> ---
>  Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Docum=
entation/devicetree/bindings/usb/cdns,usb3.yaml
> index 2d95fb7321af..8c7dc81708fb 100644
> --- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> +++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> @@ -20,19 +20,21 @@ properties:
>      const: cdns,usb3
> =20
>    reg:
> +    minItems: 2
>      items:
>        - description: OTG controller registers
>        - description: XHCI Host controller registers
>        - description: DEVICE controller registers
> =20
>    reg-names:
> +    minItems: 2
>      items:
>        - const: otg
>        - const: xhci
>        - const: dev
> =20
>    interrupts:
> -    minItems: 3
> +    minItems: 2
>      items:
>        - description: XHCI host controller interrupt
>        - description: Device controller interrupt
> @@ -41,7 +43,7 @@ properties:
>                       cleared by xhci core, this interrupt is optional
> =20
>    interrupt-names:
> -    minItems: 3
> +    minItems: 2
>      items:
>        - const: host
>        - const: peripheral
> @@ -79,6 +81,13 @@ properties:
>      description: Enable resetting of PHY if Rx fail is detected
>      type: boolean
> =20
> +  no_drd:
> +    description:
> +      Indicates that the Dual-Role Device (DRD) register block is not
> +      implemented or is inaccessible. In this case, the controller
> +      must operate in a fixed peripheral or host mode.
> +    type: boolean
> +
>  dependencies:
>    port: [ usb-role-switch ]
> =20
>=20
> --=20
> 2.43.0
>=20
>=20

--GwzlsYKoX03N1q3W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagNfGwAKCRB4tDGHoIJi
0v7RAQDiC4Tluqky2LeblRNu35HzrvBQLe3lVzFF1AlwPEohxgEAjrhCgT5tKvAR
+WfydHAN5mck8wl5rEM+qA9ZwHZlsAU=
=9kCC
-----END PGP SIGNATURE-----

--GwzlsYKoX03N1q3W--
