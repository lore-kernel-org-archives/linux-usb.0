Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162349;
	b=TFMr0HKnyMpnvbNPeHTmN3uAD52gcvL4kgTVo15a/k+gR4FqS+p0ID62i0Sjtsqc10aF
	 1MUZtiyyaUcnscb7ELeRPGqeIf8uX+2dLyOjpS2tFWAKPsol8GqJNrKtMZrWXJRb2Oiwe
	 ACoHef0aJHXP7V6huzLXuzQAAP1di+zs6k1Rx/7/QfKcyIOtUlExcGeYw+NzF6EkA+23G
	 A3F8LWgk2T17Zv/zQSpPbTIh4E9zwzfgQBNB52H8iXml14H/h1e+X3/gMVi5U+Zr0pOEB
	 N9NN5qudZ93SAcz1QjND3UVB+JAsWiZvvJAVaZsN3XOe55yH7Noyhpq+hZ5UD3suDsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162349;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=4vMb3ekuP5rbHIehlChmRxIZBP259zDPbkBrUKJPOh8=;
	b=jhpCxNOP6VIOo4FXufD/HJDxT3NYXjUevayjkelDVhMjxpgRLs3h41IgA3WEtL11rNHz
	 c5doDVfocqvP7KztZdXbaNIqLzlwhZWvAxmb3VhXGNygdB4yRpJYjLlUccWzhS3qyBu3+
	 MzW0yEXm4VqgvzKGIoPQKKSOjmYyOA6XP5n73ViudydH678lNF/aK11CPIm+24DLsD26b
	 W0sYkG0OM4rVF+7otd8ey9Eqa6nlVctbKnK9GRIWTab/wtvdBTKik/X8qx+TWJtkKpnBJ
	 WAAtcyxQgkYuXLnfk6WVy0+LOs1cvgPaaDB210bj6juY+6D10SQ4ZgjIqPRRGcW18uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=uzYQJ5qk;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6561606A320;
	Fri, 20 Nov 2026 08:12:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6561606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=uzYQJ5qk
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AK8BiJnA3244419, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795162304; bh=4vMb3ekuP5rbHIehlChmRxIZBP259zDPbkBrUKJPOh8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=uzYQJ5qk83R6sDFwIISbiJ5oK4hURFziiBts83Tiywk9nUI/YJxNOopQ2ZBy9J1OY
	 AfE3qnGQma/EbQlfreMF9lUHrl+EIX4euvE78mrXqY+rpXaGSNGNKXwZyOjT3tpYfK
	 fayumIx9sCznUDc4fs3rqP3krLoAnxT6NrRfM7T4Ufp3Qz5KT0DGIqxN40ogLvypX6
	 qWol6NhiRw+wCGeFxwF3eacUJeqHavoIxCIQvg6viy3zJw98JhBVoA2zIkbc/MXO6q
	 jp1hVnGuwp7r/SU9rftiN1OKpv2cjjFCOHdD+Cls0M9ng2/KUnHBaEdTozFUuiiwab
	 dlSEp9q6A36gA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AK8BiJnA3244419
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 20 Nov 2026 16:11:44 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 16:11:43 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Fri, 20 Nov 2026 16:11:43 +0800
From: Chih Kai Hsu <hsu.chih.kai@realtek.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Birger Koblitz <mail@birger-koblitz.de>, "netdev-bot+sashiko@kernel.org"
	<netdev-bot+sashiko@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>,
	"kuba@kernel.org" <kuba@kernel.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, nic_swsd <nic_swsd@realtek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"edumazet@google.com" <edumazet@google.com>, "bjorn@mork.no" <bjorn@mork.no>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "andrew+netdev@lunn.ch"
	<andrew+netdev@lunn.ch>
Subject: RE: [PATCH net-next v8 10/11] r8152: add TGPHY register access for
 RTL8157 and RTL8159
Thread-Topic: [PATCH net-next v8 10/11] r8152: add TGPHY register access for
 RTL8157 and RTL8159
Thread-Index: AQHdcMMAVp0iERnuiECMnOxwgdqzp7cszWwAgAbBatD//87JAIAAMkyAgAF2UFD//+4SAIABqmQw
Date: Fri, 20 Nov 2026 08:11:43 +0000
Message-ID: <6a2c635ba56d4deab25a25db9af91c10@realtek.com>
References: <20261110032416.16968-11-nic_swsd@realtek.com>
 <179464851836.2199510.10154643847175029122@kernel.org>
 <0c6318e175b14ce8b86a957c7c79d5db@realtek.com>
 <cafe3b8f-2b65-41d6-b31d-a1cabbf93720@lunn.ch>
 <2e601d9c-1271-4802-a45c-a16a0d9cfa8d@birger-koblitz.de>
 <b53ecd5dc96f4890956f051959b74e32@realtek.com>
 <1543707c-c121-4c35-8849-c4db1a71fb57@lunn.ch>
In-Reply-To: <1543707c-c121-4c35-8849-c4db1a71fb57@lunn.ch>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On 19/11/2026 9:58 pm, Andrew Lunn wrote:
> On Thu, Nov 19, 2026 at 07:18:16AM +0000, Chih Kai Hsu wrote:
> > On 19/11/2026 12:42 pm, Birger Koblitz wrote:
> > > On 18/11/2026 2:42 pm, Andrew Lunn wrote:
> > > >> I plan to add two new functions, rtl_nway_restart() and
> > > >> rtl8152_get_link_ksettings, to replace mii_nway_restart() and
> > > mii_ethtool_get_link_ksettings, respectively.
> > > >
> > > > Ideally, you should port this driver to phylink.
> > > >
> > > >        Andrew
> > >
> > > Indeed, all of the (integrated) PHYs on the adapters supporeted by
> > > r8152 I looked at are already supported under
> > > drivers/net/phy/realtek/ It should be straight-forward with many imme=
diate
> benefits.
> > >
> > > Birger
> >
> > I agree that a phylink conversion is a better long-term direction. I'd
> > like to keep it out of this series. This series fixes and completes
> > the existing RTL8157/59 support. The phylink conversion is a larger
> > change. r8152 has no MDIO bus and accesses PHY through OCP registers.
>=20
> It does have an MDIO bus, it just used OCP registers to access it. But th=
ere is no
> reason you cannot export it using a normal Linux MDIO bus driver.
>=20
> > , and the MAC code also does PHY configuration,
>=20
> Which is a layer violation.
>=20
> > firmware patching, UPS and EEE handling that would need to move or
> > coexist with the phylib drivers.
>=20
> Or just thrown away because the it already works in the PHY drivers and
> phylink.
>=20
> > The two helpers here are self-contained and will be removed by the
> > phylink port.
>=20
> phylink_ethtool_nway_reset and phy_ethtool_nway_reset exists, so there is=
 no
> need to add yet another version. phylink_ethtool_ksettings_set &
> phylink_ethtool_ksettings_get and phy_ethtool_get_link_ksettings &
> phy_ethtool_set_link_ksettings already exist, so there is no reason to ad=
d new
> ones.
>=20
> I'm tempted to just NACK it. The best pressure i can apply to make you mo=
ve to
> phylink is to not merge your patches. If you are adding stuff which shoul=
d really
> by done by phylink, i think it should be rejected.
>=20
>       Andrew

I will keep the MII APIs.

Our read_mii_word() returns a negative errno when a PHY access fails, so th=
at callers
can stop early. The MII library does not check for it: mii.c uses the mdio_=
read() return
value as register content, so mii_nway_restart() and mii_ethtool_get_link_k=
settings()
treat an errno as bits.

When the errno is -ENODEV, nothing reaches the hardware. The device is gone=
, so the
write that follows in mii_nway_restart() is blocked as well. The remaining =
case is a PHY
access timeout, where the device is still accessible. The root cause there =
is also that
the MII library does not check the errno, so a future patch could make the =
MII APIs
check the mdio_read() return value and propagate the error. That would fix =
it for
every user instead of working around it in r8152.

Moving r8152 to phylink is the direction we want to take. We want to study =
the design
before committing to it, and it's a larger change than this series, so I wo=
uld like to
separate it from this series.

Meanwhile, the legacy PHY access may cause bugs if the driver and the firmw=
are
access the PHY at the same time. So, the TGPHY patch is needed for RTL8157/
RTL8159.

Best Regards,
Chih-Kai

