Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBB01A682C;
	Wed,  5 Aug 2026 00:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785890635; cv=pass; b=KW+qNvRlpWL5YxxQ4OyG+JZcHaX17lyEp7NJjzmSkTXHgR5hxgo0fi/uVOYI+8OFPtoalJnL54SutfoGmf7W5YuPxaIJtwflifngnG9AQDueHaOzYK6Wye6LYBJ13q0vghEksQJ3rAaGuVfgNQMtEcCmKsiPbYIYeQCzx99o6yI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785890635; c=relaxed/simple;
	bh=3toGGzQ0hxyMbALG8j2jb4VVT/5DaLwXZscn0GiKX98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U54m+Znt4s9HLuCujV1BAH7/s4QAumhPxYU3w5K4gRWjEewajTiuVChyJ90FuM09HpKdKmtC5MXGRvCFD2nfV7DwWMaf7erSGrJ6+gRqPn+wGYAm8aLLthB9Pm8oSUnj7o6Ba8V1VIwo82nP5+IR2VJ0lIWtSRhhS5FACxN+uTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=CUcGSUEz; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="CUcGSUEz"
ARC-Seal: i=1; a=rsa-sha256; t=1785890613; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UQHnXoD//Gz2T8zIJBEkeBGLVOAXnVA33BGDBl8dAaTXzPbIAR1o+gQ3aVBLuowKR44uJpmsCMiSQ+ybjdpczh4U+tgnCn4V/mky/LKW/T42FaNmcujJHx9CHZkKoSYA+BaxLJ3j8p5z6pPq5WVqKKRVux9tBPvK7wSM9AWGWFM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785890613; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kMFxhAvlZbwz04r3OCur+VbCpZgLiP+AVky+d0HJcVc=; 
	b=KQGs0/qIzgwNmpZxuUz3p3GLKZrimd43ui0EtL4+uczdskEeREae1WYvsBDjZtJkvLkIU8NBWarZyenLJBGFvkEmP1tzTdMwlR3rnwB1zkeSpevyfmVEN/ycGUctDm5rtXib5nhdpi934G7C8BGVCP69SIGjkubXjjYez932ovo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785890613;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=kMFxhAvlZbwz04r3OCur+VbCpZgLiP+AVky+d0HJcVc=;
	b=CUcGSUEzavxdYeZiAV2laP8VnF3HD6RkSbGCtYaArWboaWY8l5QacHdfadXkKEsy
	k8Y+6XyLw2/z6RkBEGPv1/FFdThumXyYMcidpTIgP7AXy+C3Xr+qMD//sUUFi3vHZhi
	bzxHIfNHlm4wdVjVfxHsQNPatevPNjfXOv+ATiDQ=
Received: by mx.zohomail.com with SMTPS id 17858906112431002.6678491356571;
	Tue, 4 Aug 2026 17:43:31 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 2306118082F; Wed, 05 Aug 2026 02:43:27 +0200 (CEST)
Date: Wed, 5 Aug 2026 02:43:26 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v5 3/5] phy: snps-eusb2: Set phy type to EUSB2
Message-ID: <anKG8g7QdAKkYJDH@venus>
References: <20260723-eusb2-int-handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com>
 <20260723-eusb2-int-handling-v5-v5-3-f32ea6c1a318@oss.qualcomm.com>
 <amPdeL2GWkNhPoal@venus>
 <49d0e412-4561-4f4f-b00b-b77dc9cf143b@oss.qualcomm.com>
 <anJmrEe9IcV_iaac@vbox>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jcdpp3jngealual5"
Content-Disposition: inline
In-Reply-To: <anJmrEe9IcV_iaac@vbox>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/285.885.97
X-ZohoMailClient: External


--jcdpp3jngealual5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 3/5] phy: snps-eusb2: Set phy type to EUSB2
MIME-Version: 1.0

Hi,

On Tue, Aug 04, 2026 at 10:28:53PM +0000, Thinh Nguyen wrote:
> On Sun, Jul 26, 2026, Krishna Kurapati wrote:
> > On 7/25/2026 3:21 AM, Sebastian Reichel wrote:
> > > On Thu, Jul 23, 2026 at 04:09:06PM +0530, Krishna Kurapati wrote:
> > > > USB controllers like DWC3 are agnostic of the kind of phy (USB2/eUS=
B2)
> > > > connected to it. Set the phy type to EUSB2 to let the controller kn=
ow
> > > > the phy type when queried during its probe.
> > > >=20
> > > > Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > > > ---
> > > >   drivers/phy/phy-snps-eusb2.c | 4 ++++
> > > >   1 file changed, 4 insertions(+)
> > > >=20
> > > > diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eu=
sb2.c
> > > > index f90bf7e95463..e139b17bcda5 100644
> > > > --- a/drivers/phy/phy-snps-eusb2.c
> > > > +++ b/drivers/phy/phy-snps-eusb2.c
> > > > @@ -13,6 +13,8 @@
> > > >   #include <linux/regulator/consumer.h>
> > > >   #include <linux/reset.h>
> > > > +#include <dt-bindings/phy/phy.h>
> > > > +
> > > >   #define EXYNOS_USB_PHY_HS_PHY_CTRL_RST	(0x0)
> > > >   #define USB_PHY_RST_MASK		GENMASK(1, 0)
> > > >   #define UTMI_PORT_RST_MASK		GENMASK(5, 4)
> > > > @@ -597,6 +599,8 @@ static int snps_eusb2_hsphy_probe(struct platfo=
rm_device *pdev)
> > > >   		return PTR_ERR(generic_phy);
> > > >   	}
> > > > +	phy_set_type(generic_phy, PHY_TYPE_EUSB2);
> > >=20
> > > Isn't there a potential race condition if it's handled in this way?
> > >=20
> > > 1. phy-snps-eusb2 probe: PHY is registered
> > > 2. dwc3 probes
> > > 3. phy-snps-eusb2 probe: PHY type is set
> > >=20
> >=20
> > How about we do this get_type call after dwc3_probe call during
> > dwc3_qcom_probe. That way we can ensure phy is up for sure since core i=
nit
> > has to happen as part of dwc3_probe.
>=20
> There should be no race here. The phy_set_type() is called before the
> phy is registered. dwc3-qcom would get -EPROBE_DEFER if it probes before
> the phy is registered.

Indeed, it was me being stupid. I blame the heat :)

Greetings,

-- Sebastian

--jcdpp3jngealual5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmpyhysACgkQ2O7X88g7
+ppYFg/9FOy4dS3z38lF7xVBpJaJQCBs6P4YrVrHM76r5DgrcoqrPbL2bhsEa2X9
drQ6MVLNMTbUFblSmGPrhqc+j2pOnaREhsuvY3oV3uly0V3a98FoZGN/1jw/CPb3
xPeriVcMIsIGYgoUwFYDBBO+Nvg8esnHOl4KtjyqVxaOFdAN8qt0hLfknAtM6iYk
ibfblNSnTIql1bo7A/W9CrzWHa8jDPR9awAtZRBKij1hOXf6HkVBrhomZLb7IIdY
T3G14//GbWUWBhJsv0Ehzn3GV2Teh4TOT63xcKuM9D7R3r9pUy5K5+3UO3S/xKc4
YnCYyWVWYgqCnblXzg8gl6P+V7iM5fNhxu1Ah3JDWX7xl7YjfoqUd8cPx/zGjmNf
jvS98X/M8a/xaQBFVnkRXqhE5B4/YoVN60CcyVL+1QmI8pOmfKcdY0jjsOPp72e1
1FeXYzSeYRwP7gGrIoAsk8Cct6C5GJ/1dAkVnX7UV0MpFDSYE4uHuMmPNSpamXWl
Yi5mSdDnsAo5YtpxSRrz/S4YXda3pqRyue/hrtyHnmMdAdllHGak9TQOw5Bk1iJp
5Z+ksKnrzG5SUuDyCoGmPLh6bpcrOyQlc1vdBgScfRhjFW/7PxYZXrvdh06xdT0v
hYvCxGHPoSm2rw7YTlUhYXGX9/q3G5bxNk9U0ar5hDFpQ/7Tp48=
=pTrD
-----END PGP SIGNATURE-----

--jcdpp3jngealual5--
