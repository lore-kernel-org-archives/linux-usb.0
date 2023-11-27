Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="mXiOP2Dn"
Received: from stravinsky.debian.org (stravinsky.debian.org [IPv6:2001:41b8:202:deb::311:108])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0291CBE;
	Mon, 27 Nov 2023 07:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HgtuQJ7UgMWmy42filqR2trbCV0e/XwTQa8X17GEFdc=; b=mXiOP2DndTZG3lYIBphd0aXe4a
	qJGJwd4t9DW44u/J0D2CEsHW/LanhieO6vXEdhnj+zbWt6sS6hrWLSHQIi61q77BRXwzMHl0u5dEs
	ADDmRHwEvGwaNoGC3OMOeUPAAWFLnhfDxidRl7gc2qC2bTLFBpFHgMbH5dW4Vh79/XLlikjJ2BT6F
	IE1gl9kLc3yYYNlbehFkuPILqfqt3AFwYQAy+porbydp9QCJVezVdbXmS9MltsL9UjnvpwVCkmTjO
	FaqILoN3rBzGgCtN6NuDxew2lm85vMxkA0pq+1gOIh87E8tVJGMOZb6BZOlPO5S6SgPX3zYiVB1+r
	8ahXotWw==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <kibi@debian.org>)
	id 1r7e1W-00AISk-Ai; Mon, 27 Nov 2023 15:59:51 +0000
Date: Mon, 27 Nov 2023 16:59:47 +0100
From: Cyril Brulebois <kibi@debian.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	bcm-kernel-feedback-list@broadcom.com, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] ARM: dts: bcm2711-rpi-cm4-io: Enable xHCI host
Message-ID: <20231127155947.azqtlnwe7bhutikh@mraw.org>
Organization: Debian
References: <20231126025612.12522-1-wahrenst@gmx.net>
 <20231127003432.7aztwjxper2a3o33@mraw.org>
 <b1156fee-aa43-43b3-bb03-baaac49575f4@gmx.net>
 <20231127115538.npv23hhn7jfrk3fc@mraw.org>
 <892c2e2f-3187-491b-b464-56d099b6fd49@gmx.net>
 <20231127130225.lyk2jngfru5lw6sd@mraw.org>
 <91488944-64e2-4715-baaa-ff5c18d46840@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6vb4bvhtdxpz2y7i"
Content-Disposition: inline
In-Reply-To: <91488944-64e2-4715-baaa-ff5c18d46840@gmx.net>
X-Debian-User: kibi


--6vb4bvhtdxpz2y7i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Stefan Wahren <wahrenst@gmx.net> (2023-11-27):
> Sorry, i was a little bit unspecific. This the first level bootloader
> stored in the EEPROM. I meant the VC firmware version from the SD card
> which is logged in dmesg:
>=20
> raspberrypi-firmware soc:firmware: Attached to firmware from ...

[    2.677987] raspberrypi-firmware soc:firmware: Attached to firmware from=
 2022-08-26T14:03:16


Cheers,
--=20
Cyril Brulebois (kibi@debian.org)            <https://debamax.com/>
D-I release manager -- Release team member -- Freelance Consultant

--6vb4bvhtdxpz2y7i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEtg6/KYRFPHDXTPR4/5FK8MKzVSAFAmVkvO8ACgkQ/5FK8MKz
VSCMaA//XVqVA2MC6PrDzzA7PT6yS90bkoE1ADIIjeLZH0gTbkIUBvy1xY3KNNdF
u66qogxC+NQn2dARB4l07XmedUkMQ+zf1Jwemi6R1ET9XCzsKHY4/tBVszUb+9hb
1lBL8csqSdKcIOe9aBryAtToq1F/+2cZd6V4plpa/gF/xBk14m8/BOenHMjUDvAf
gS7FKEWn5obrCza1LLRt+XB6rLjj1yAHLRFlxTCLXFLXssKxzPnRl4GRiKL8tsmx
DnxlUEr1Q/KrOqT7UfwoAQQw/mXVsvX4NPZe9zk1ID9CEB0t+6TVPGZC8xMdDEQy
O7xqGLYLLKpws7nwA0/VzC6Vfh2+RW8CsKotSNDh7aUatSGBUOFwCTBDOLenQEAf
nJFSf+wnmhW432aLART0sqdEbIyXY+UukS9evDtxUVS9XzYbpfUpbQevWo5e3kRm
NIzQEexw7HIBuVqLs79OYoQkja4ZujmYtjyZNAO4hziUF+cJ+bn4goHvc6+6AYxZ
x2iXWkyRqPtKwIYWMB1Fz1S1rp/vPSzFEQdw0MoLklQlND7jIoRwCH11QI8t/tDY
0StOcBH6UorjPYQdyC4xbq3ncpEIJnw4gV0VPHHgQWjEfw3Q3d3qfbp3XNjryc5m
u59856uGEa5WV3XzesV8KYIIz0VglPoUwf01ihkjj/VOugyIIlE=
=AyeW
-----END PGP SIGNATURE-----

--6vb4bvhtdxpz2y7i--
