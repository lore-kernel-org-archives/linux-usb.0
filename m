Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CFF1D95A3;
	Tue, 18 Aug 2026 21:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787089423; cv=pass; b=CANXh5C/sGqGMGKTBfTrA4Eh+NfajVZSMORLBfyMUjXRnmsGGywWth4V6teN6FCzTtxo15JLyBqaOftiTqolWnpJkG2T9gezSJ1G8Ulo3xmOqjJPeyy47ZTeTTsDbxxf2EVQBIIqYIn6ls0BCzuwea1uldso8OO1LwivwlKcP8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787089423; c=relaxed/simple;
	bh=WHgLKUTzy+ajlOdMI/QUguwowgxNejsORdVHNAejODI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uaHRBbxZQl9d4Kw2bkxDhgmBmKY8QsTzr5nM6QmLtXUDkRKx8V2W+8W3Kw38kgrOBNeQx4SPJKgzjmpSPk/YY66K7+AJQgPi7VJE6E+Pnkc32beuRGzOdhhqDKdEY7lMtuvdUWNpNSKWc4F613vDnu3BAhP9cmBECPTnJ42y8ug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=EATAvhGj; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="EATAvhGj"
ARC-Seal: i=1; a=rsa-sha256; t=1787089379; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=R1G8loKEMmQgzBe9C8b6zMyzqfX1/4AwdWB/Sed7saPCbbb5AJ1w2bfRjaOxkT0k1TBvEcc2oEmyUyTsNMdI8Phm2NcIAh7ypJgfYcj82MG1VlDgfkS91sGe6+JPRbqnuWuVj8eJT3tUYgIhltGYMeCM9UvQFdlGGJCfMkqvhaA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787089379; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DpmVj5c9FDXQSwuSsbxK1L8of1AmrLOJ/cZ+cQrHX54=; 
	b=WmKuFoJbFK0zNMA+rIz0rvuCYT5grWtdUpzoLpsjOlcBjadqk9DuahFhWJU3JSJY7WisfrbNn8aDKtTSyB/C3qjU1M8Svhih2Rz43dO43PXbShJQGrdTOsbcYis/IBNfY2RUJgJ0JRNwki/oWUBgVLZBKmBW6DTMYSOjLFNImpY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787089379;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=DpmVj5c9FDXQSwuSsbxK1L8of1AmrLOJ/cZ+cQrHX54=;
	b=EATAvhGjB0BxlGsm+l29SdEaUqqx/UzPjLLQYionr+lI6JBS518mBhoqoQDUlDpH
	uoijmrTaLxXjR0zjXhhAM7w8DcArp/97HlffwENaSaj5bTGeCddzxwAP8Rg0Ox22vnj
	kdk3f7mNSWckQ2aigReGzhXzXeuUr2LYsg4Wjxr8=
Received: by mx.zohomail.com with SMTPS id 178708937710788.45877915239339;
	Tue, 18 Aug 2026 14:42:57 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 030B6182034; Tue, 18 Aug 2026 23:42:51 +0200 (CEST)
Date: Tue, 18 Aug 2026 23:42:50 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Frank Wang <frank.wang@rock-chips.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Yubing Zhang <yubing.zhang@rock-chips.com>, 
	Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
	William Wu <william.wu@rock-chips.com>
Subject: Re: [PATCH v14 00/38] phy: rockchip: usbdp: Clean up the mess
Message-ID: <aoTMQtpYYw8O-3cj@venus>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
 <h54c2hrcsv3zjzzgojzf5sjmu3vtpobz6rwloam5kp7mwqqn3n@bqjnlellvnz6>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lb64huk2f3isbo5n"
Content-Disposition: inline
In-Reply-To: <h54c2hrcsv3zjzzgojzf5sjmu3vtpobz6rwloam5kp7mwqqn3n@bqjnlellvnz6>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/287.68.66
X-ZohoMailClient: External


--lb64huk2f3isbo5n
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v14 00/38] phy: rockchip: usbdp: Clean up the mess
MIME-Version: 1.0

Hello Mani,

On Tue, Aug 18, 2026 at 11:27:07AM +0200, Manivannan Sadhasivam wrote:
> On Thu, Aug 13, 2026 at 10:51:43PM +0200, Sebastian Reichel wrote:
> > This series does a major overhaul of the Rockchip USBDP driver. The
> > initial main goal was to add USB-C DP AltMode support to the RK3576
> > and RK3588 and this series still prepares the PHY driver for exactly
> > that. But in addition to that I uncovered a huge amount of issues,
> > that are fixed along the way. Some of the more interesting ones are:
> >=20
> >  * Currently the driver might trigger a fatal SError on USB-C hotplug,
> >    since re-initializing the PHY stops the clocks going to DWC3. If
> >    the DWC3 driver tries to access its registers at the same time the
> >    system will crash.
> >  * The DWC3 hardware can get into a buggy state when the PHY is
> >    disabled, which results in the PHY not coming up properly again.
> >  * Swithcing the USB-C connector orientation during hotplug breaks
> >    USB3 speed, as the PHY is not being re-initialized.
> >  * The code always enables DP mode when USB-C is involved.
> >  * The driver has some locking issues uncovered by Sashiko.
> >=20
> > In addition to these bigger ones, Sashiko also found a bunch of
> > minor problems, which are mostly harmless, but were fixed while
> > going at it.
>=20
> 38 patches for a single series is too much to review. Please
> consider splitting it up into multiple series not exceeding ~10
> patches per series. Thanks!

So let me summarize:

 - Vinod wants Sashiko feedback to be acted upon
 - linux-phy does not want series with dependencies ( [0] )
 - You don't want series with more than ~10 patches
 - Generally fixes should be at the start of a series

This tremendously slows down any real work. The first series would
just be Sashiko fixes without *any* of the work I originally wanted
to do (DP AltMode). I would have to wait for it to land before
working on the next bits as there are massive code conflicts with
the same file being heavily modified. This simply does not scale,
especially when considering that there are more dependencies on this
series.

[0] https://lore.kernel.org/linux-phy/20260330233532.ulnqiqrogezswht2@skbuf/

Greetings,

-- Sebastian

--lb64huk2f3isbo5n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmqE0dMACgkQ2O7X88g7
+pp1WA/9Ehn7r1EMjla99QJRa2MMoOYd+t/cIFPVNbsUDA6t9qfCwIGxmOawRoog
uUDXe/RqRp5xObb+2jSPMuvb3jelMPX+1357dxVoYaqsmrvPG6jSEjjBFtf4z++7
62Ws1nWgH0YR1XO45vFBsrNCNv3ELThj/FALxPQmU0pZ/x/7bizhTQtx3PEHW104
kT+171AqELAfbpfUMM7lYcHHIy8D4hSy0Ah66RFTNpWl1obZCUCFL1B0zuDANnMJ
CAjqkPtwoJPpVaKRlY2h1YB5JREpQNfJCUl4XVPZ5Tuia+BOF5mvegHPXhU1F+ZT
lasrChZQHYnkJNOl7EDgMaYpKnc3bJbxagtA1Q3IbqdRZA3jm8GrWH6dLhq9Pdr6
kFsnhDJo5omh7AskYgm1uZ6ZL6ve/d+BUYS5Bkku8SJNbAb8eLqR20ntn45rDBIH
29NMHJ9OQ8DKzJ7dxW3x19A6RuLTCHsVd6cQgTqMbgkVgrQehq4ivCMBuPwrpBZO
fglWS7cNZGv+KYDnEJo9K2KrUOtyHfOYAjdbsOwQEyntf0QxDNtMoQ89LzIyJM7m
nUsBRW1ZxNJ3NvHrC+580iDz5c+F0yTRwv7LeUNcwcp8SF9+hBEme+EQL4Vid9lH
TrH9qhoHr/d7ZyZOOtQ4a3vRzVbBN4+cmrWofzpBfmyI7XtjNKU=
=cryx
-----END PGP SIGNATURE-----

--lb64huk2f3isbo5n--
