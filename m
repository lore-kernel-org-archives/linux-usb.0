Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6AD3B102F;
	Wed, 15 Jul 2026 18:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784139904; cv=pass; b=LAWCn3WyKifSygggzHh32QMXu5DilGxVFiE46WOMLEanZTZPXT7gLVyCz0YB8RA5FjWOKCSxi4bzq9xv+a1DpSt3EqvzwjvHIBilOj5Iz8vj1uSiCwI6yVP1BE0tUMDEfVEavP5+A/M/eTBgeRLc4vztTLeAgwpSBZ5t6CvRGfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784139904; c=relaxed/simple;
	bh=3PEo/RhuCHxy6yK+MqfZAEADxxCOppEH8wYLxe4Mw8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uxi+LVzw9+IHjRfdvp0MyJ2M3UEDNSGE6Kytb89F3Z88aPBqpi1hSBz8L/4QEVkEmg6RW+jNwAmREGgAsLRE5spqN7cjArPyDAxitaDxIE1ZP4QGG5wnzgOQpRy21B36ZQDTLR+ixTPSGb+xfDQpd9H09h1WIPXaGMS5V/yERio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=SgYolUAV; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="SgYolUAV"
ARC-Seal: i=1; a=rsa-sha256; t=1784139868; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IhvFUZ9pBGqNI8hYJqvQK2Jcng0vYzqCPomCvhDmMrZpi5SIDUyQzR4A94Yb8ZLXCufzR8r12iK9RWMJltZgj5yFqV5d4pm5bZAhPYYGbjn/t18MSg4xzt/lNI46e96FGwukJtr4YdmMOER8aEkucqr5h0e7fFSYmVAjYbX/0fE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784139868; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3PEo/RhuCHxy6yK+MqfZAEADxxCOppEH8wYLxe4Mw8o=; 
	b=UQU4E0ZsuUwsdmO/JAIgigAvKqoQQend4aF7p54tbAEDq95mhS62ky1yvpsNKqCs1LRjDQ0EXXctBepIyaT5/z4Gd+9ND/PHG5L0dg4pSbhfB/B9yqnoNNcFNlbToXjoKKaqCDWQeH0j6/Mceh+E9Fwfrf96fjQbaLkaOdWKE4M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784139868;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=3PEo/RhuCHxy6yK+MqfZAEADxxCOppEH8wYLxe4Mw8o=;
	b=SgYolUAVNq9GURPq0SYVmbEkFdioA0MSknOIEnslL0KvxWW2p0vM6CVdHarui+7F
	I2AaYEDPUsGsoSyOMThwADTyE/j+e/1++nekrt/ahuEcS4D71fZtLeXRAdnTFTwZK6Q
	4yFKUSz7DthkjvkzyunslsdSM2mI95MF+Lah4dsA=
Received: by mx.zohomail.com with SMTPS id 178413986565159.909473966743576;
	Wed, 15 Jul 2026 11:24:25 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id B554D180820; Wed, 15 Jul 2026 20:24:20 +0200 (CEST)
Date: Wed, 15 Jul 2026 20:24:20 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Frank Wang <frank.wang@rock-chips.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
Cc: Andy Yan <andy.yan@rock-chips.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Yubing Zhang <yubing.zhang@rock-chips.com>, 
	Alexey Charkov <alchark@flipper.net>, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>, William Wu <william.wu@rock-chips.com>
Subject: Re: [PATCH v13 00/35] phy: rockchip: usbdp: Clean up the mess
Message-ID: <alfM6dFBovHMaYn2@venus>
References: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k4qr3c4r65j5eyhe"
Content-Disposition: inline
In-Reply-To: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/284.121.97
X-ZohoMailClient: External


--k4qr3c4r65j5eyhe
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v13 00/35] phy: rockchip: usbdp: Clean up the mess
MIME-Version: 1.0

Hi,

I've gone through the Sashiko feedback for v13 and I do not plan
to submit a v14 for Sashiko feedback at this point. The issues
it reported in v13 are either fixed in later patches - especially
all those "pre-existing problems" - or do not apply.

The series fixes a massive amount of problems in the USBDP driver
and unblocks USB-C DP AltMode at the same point. It would be good if
we get this into 7.3, so that the DRM series is unblocked for 7.4
allowing users to have USB-C DP AltMode in 2027.

My proposed merge strategy is to route everything through the PHY
subsystem as the changes in the DWC3 driver are not very complex
(purely additions), so a merge conflict should be easy to solve.

Greetings,

-- Sebastian

--k4qr3c4r65j5eyhe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmpX0E0ACgkQ2O7X88g7
+poxnA//eiQ4tyVwFKkfyMZ9JF8oA/6H2JGA2Y/G7qxFaieN/qnANmrMdNepvlCd
pnmO9MYGhzn6u9/DcZYZdghysxLnFhVlMUuL+NqvNsb8z2rT90NylnGs1TVcgR0o
ZbvYy0pHQN2PQ2w4AKL+F5GtQknxLGY1KJaQA7fpFZEjz0HslQNUqCXS7d9wzYsd
K0F76bZnSX4brPeOKvcoDbHYCOZ8iIRlXvb1qUA/9SZbEpK1U/QzA7ahMxUhu+IS
xa22F+dy7s9lvmPrdVXGAs7AobMp1GwRfo/jDnyylXFoR8iARi1qeqYL++Yb3TwI
NjbAeY9qEQhSG2u4MY9sbf3NIqEeJdEjV9hnPnktialwkPP7N0DFNtJhS8077KNj
R1Zt/ljWN9tdUdrZuXpJsDNBiTzJ4QpfzWyU454gIl3VYmIYLv5OyblufmMfAn0S
QWE1Zo256J0upomvc4Jk+KNRCq2qqWLAkH3/OPYqVS4WnWINqt/NmKPevz5r0Pol
sjIjH7OL8C0KJdvfCMLyYiyfMeWexEPBHw7LzN0UJWVqtuY4HW/0m7qG8N5MRxOz
xpfZB+Wni1X/nX0Vhb7ueSYRTcZVaiW7EWn/svWoMpsW9ZV2cdRReoZIHExSjl4d
6s5dtmoRfN1xtFKbqEOBRcyYqaWyZmliqGCAebpOANvlLXto7AQ=
=fvwk
-----END PGP SIGNATURE-----

--k4qr3c4r65j5eyhe--
