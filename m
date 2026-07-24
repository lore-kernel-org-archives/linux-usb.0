Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3061138D687;
	Fri, 24 Jul 2026 21:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784929910; cv=pass; b=cOPrbOJqdt+KFLLaVmPw2C5aWuWct/GvHK2TJ6sQ/nzO3Xt57pBnsjrg4HU5V8XkKgBI/u5tzy3h9R6gdQqifK5gZb6cpQbWpSYCjC7QKpTA7VAW9nyIBXb/d/gMswJfpSFObFBYRB3zzXZQBMqtAMN1Mmm69jp6vr3vcOXQqPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784929910; c=relaxed/simple;
	bh=ua2qwYr6S4tpVPJjIjGVRtMMBQ8njszvyH/aingQNhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LbX9LNqTO3YWUCi2M/Vb+Cymqj0v/4vCVEXcGwxPnYIVfv/wt9+xaf18e3c8sVG2qQo5RVN8GgKUlK5CPPETlqf9YOLc2Jil9QedKX4aQM3Ulw2OjytBQ55a5Q2hravOkEqlLNvsLkYPan18JfpXB8PpIvjR6ZXZ++1T1cJBdKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=atvDK0mQ; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="atvDK0mQ"
ARC-Seal: i=1; a=rsa-sha256; t=1784929893; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=oDXJGvsrkabItjiH+v4NuUbnqaJXs9R5UMnFLoeALWPjgS3E9uwieCTPysdaXlqtQx7Y0glSQUdvXkPfVvwkEzwSRINfHfr0Q1JTW1Gok8jUaiRMueLjhndyiVQEcdMN1phJAxTCQh34jm06Q7hH3JUtXoJTqWw0NUTOdpQaSuI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784929893; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rxObKoBYz9bdL1QDIAY38u1ujROlN6uVzdz2O8QptDc=; 
	b=RB0co4FTwKqnrPA6pjLLZ713gW0Q0PTePi1zV+IyVeuuPquzonPTmhgnAhfuWaJPv04lBdj46SpdD9TGnXpn6cJGlDjgUZQSya+A1FsKRJWvrHzlfBdA6Fd+y5A5rgUwFKSsFa0Jp9kAN5jt+1/1gHDoZeDsN4gBtS8i2dIHzQQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784929893;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=rxObKoBYz9bdL1QDIAY38u1ujROlN6uVzdz2O8QptDc=;
	b=atvDK0mQ8rOk1q1Cl/hJbTPH1cdUWpWueM1L/ETUu7NRbP6HMTeR03A+Esw30YlC
	ANd/Z77xm6JykrrewsP96vFrCHkqSaW4mDpHqCtppyS2/nXIUvHMMI3ORKglr0bcjn/
	bD5iqewvFeSMvisjM9YKei0KR1agwMO2dn9+3vQ0=
Received: by mx.zohomail.com with SMTPS id 178492989200395.17774346570991;
	Fri, 24 Jul 2026 14:51:32 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id EE334181F16; Fri, 24 Jul 2026 23:51:27 +0200 (CEST)
Date: Fri, 24 Jul 2026 23:51:27 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v5 3/5] phy: snps-eusb2: Set phy type to EUSB2
Message-ID: <amPdeL2GWkNhPoal@venus>
References: <20260723-eusb2-int-handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com>
 <20260723-eusb2-int-handling-v5-v5-3-f32ea6c1a318@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m55f6i4q6qo7c2yd"
Content-Disposition: inline
In-Reply-To: <20260723-eusb2-int-handling-v5-v5-3-f32ea6c1a318@oss.qualcomm.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/284.919.37
X-ZohoMailClient: External


--m55f6i4q6qo7c2yd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 3/5] phy: snps-eusb2: Set phy type to EUSB2
MIME-Version: 1.0

Hi,

On Thu, Jul 23, 2026 at 04:09:06PM +0530, Krishna Kurapati wrote:
> USB controllers like DWC3 are agnostic of the kind of phy (USB2/eUSB2)
> connected to it. Set the phy type to EUSB2 to let the controller know
> the phy type when queried during its probe.
>=20
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  drivers/phy/phy-snps-eusb2.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
> index f90bf7e95463..e139b17bcda5 100644
> --- a/drivers/phy/phy-snps-eusb2.c
> +++ b/drivers/phy/phy-snps-eusb2.c
> @@ -13,6 +13,8 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
> =20
> +#include <dt-bindings/phy/phy.h>
> +
>  #define EXYNOS_USB_PHY_HS_PHY_CTRL_RST	(0x0)
>  #define USB_PHY_RST_MASK		GENMASK(1, 0)
>  #define UTMI_PORT_RST_MASK		GENMASK(5, 4)
> @@ -597,6 +599,8 @@ static int snps_eusb2_hsphy_probe(struct platform_dev=
ice *pdev)
>  		return PTR_ERR(generic_phy);
>  	}
> =20
> +	phy_set_type(generic_phy, PHY_TYPE_EUSB2);

Isn't there a potential race condition if it's handled in this way?

1. phy-snps-eusb2 probe: PHY is registered
2. dwc3 probes
3. phy-snps-eusb2 probe: PHY type is set

Greetings,

-- Sebastian

> +
>  	dev_set_drvdata(dev, phy);
>  	phy_set_drvdata(generic_phy, phy);
> =20
>=20
> --=20
> 2.34.1
>=20
>=20

--m55f6i4q6qo7c2yd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmpj3lsACgkQ2O7X88g7
+ppUyQ/9Em5Or2yxSmbUYLORK19KD1Ah9p71VebqMaZ/N4eIcJpgJ+U7LU//WbV0
K/UeAVFd7AFU0w/aPAQBgz/WgUW406YPriExgZsr8CWHDQyWlmVrr0LVeCHy+x+Q
UzeBQaZsXISMhjKClU0lVhcQHUoedsdj7CFydDsyuRoz/xZvc0TcJ79UMvrDqVAl
jlksFfBQQ8pDU0N81xv0F5ESB5GUID27RAAT3UnCub9WwKqoTvxcrpkwqsIw4EgQ
ttU/wwf7lM+9mzoYYXupTG8g2OuhpJSFdJTf0EHFh1una9EZ/5fy76xzESsSlQ6j
Q+V91T74J94m3His2Tm9SHXzv2JFj7GG8Ayk6uvYzBlZJ8VBvEZajNyR0zmYHq6v
TgNBh89YATTx/0QHiZPQC3bBiWNvsQDNkkQU/Rjk97UM2n09M3CH/Ymkcdgmb+f1
H9/8wYK4RLJPFnOodSPqQFsXqBvYXAIgembbFCupDvPz76EycTHDIiscGiXQhVfw
EdM2GOlvc77BrGSfCpjbULsLd1pqBHRwxQym15cTY8FUM4/d9ZqdS3+fDtY5URPv
eayatF4MyBo8+jhol6prDNPvKuSxuPZnMZaskylhUMYvEElxTnHBBlnkWGyRFsYO
T4pbgRFEclb/xZA/YYLdZ/7rtwsfqrAKjh2je+eKfh+eb3rpfxM=
=Pqf2
-----END PGP SIGNATURE-----

--m55f6i4q6qo7c2yd--
