Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CFA3E5A2F;
	Tue,  7 Jul 2026 16:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783440581; cv=none; b=ecILvWJ20oyvp8n7eEIc44y/dZZM0w4pFdnjcauvLVB+xzCGKQ6iGUzBRVhJXEEVBz1MaytXVk/dsFgt5eX18hL4XxO9U9/LZHk7UtukCMVOrcwTzQtJCq5okDC380bm30c6jjbAWuEalpajLwliJwhriqLPMA34Z5HZEA2ibCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783440581; c=relaxed/simple;
	bh=hAGem9sbD5yddz3QU0wSg6IZeEOtjZYZlPzWAZ2yam4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bKHkuOUJRcmA6fnEFtQqzJQoXIhAH6xo0+5mo6FKE9sz1YZwi3OVj3Qnfb+iNUHuyXgJ/eNF+JivEMHhMSSP0zrV4ORHKpzI0Fy359zGIWZUnoeN0OXBW2dMoMatk5RfzuCAKCRq1pZiryFL52gM+93HPR2wsIwY2otulZP0Xvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LShMF6sL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LShMF6sL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E84121F000E9;
	Tue,  7 Jul 2026 16:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783440580;
	bh=hAGem9sbD5yddz3QU0wSg6IZeEOtjZYZlPzWAZ2yam4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LShMF6sLsI3If9GLiWN1wwSdKiqwpf4tVyFOwbSg8yYG9Yn73Vg2xg14IrOipPV+e
	 QBqCLFxv+tkabej3eq5MYiOC28PPlhW6VINQex3mkDWwafycPIaMNh5uiLspAQ0aOl
	 XYFknsjqzVPqHoVnbPNJUhpsdbgykd/vrYaKkqu1LT6B6tVDcHnnfjkvexUTUT0Ihb
	 KPCfG5x0Qqm9avn0XXSwJTuMz2HFPyhlKpzCuDdBuVU9B9/eGaIK8uTPLZNf2szMi0
	 vYG76ZQn4Apc861SsDo3nfqkDlpTc1Up54j58BPTI8cnZGZkRZvn3o7i5dNafnN13M
	 WT1fZg4fIVJFQ==
Date: Tue, 7 Jul 2026 17:09:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/3] dt-bindings: usb: renesas,usbhs: Document RZ/G3L SoC
Message-ID: <20260707-delirium-proclaim-71ecc56ed957@spud>
References: <20260707145135.247565-1-biju.das.jz@bp.renesas.com>
 <20260707145135.247565-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vKH8xTLBi9NCIfXT"
Content-Disposition: inline
In-Reply-To: <20260707145135.247565-2-biju.das.jz@bp.renesas.com>

--vKH8xTLBi9NCIfXT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--vKH8xTLBi9NCIfXT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak0kvwAKCRB4tDGHoIJi
0l2mAP49LsK8oevrSlNE5JTdTVkZimlPDi9ucwCp/uNZLOwNcgD+LLUCUoc5hH33
vh4yRzbuctF+R01igZIu7crdgvyiXwg=
=IfMc
-----END PGP SIGNATURE-----

--vKH8xTLBi9NCIfXT--
