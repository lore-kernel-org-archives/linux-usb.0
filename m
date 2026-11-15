Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739919;
	b=qswDNzXIApod3c8NyGheLZSQZTCt6+q/NcXDeC6vfxHdWbBfPmdr1lgbndub+HhMhohq
	 8OCMiSxDgefjFRoMMtp3yd3r/CESRIIBcYusGyMJCxPnsR65JJIzBzGw8CgnpVMEfNc1d
	 O8oouhodAtvkh2wvp4tN7JPCeFmuyz35ri1Eel3y6j5QuWWDkLpnqOPTQLBTZ/l7xSzka
	 4Q7khvWK+yPfUe6zRgqqhCsnkv2NqdxkOKl2rnpBh1136Mntv3Zm8uzjxrE9k9qd0YVfL
	 xjIZ/AS6Lyeh4LQDlLw5FXJUVv1/JPkhHZDMGnb4Ukul0EJ1y+M1rubRyG35lmPj5cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739919;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rLzude81vRNVy2ltMpNyG08hR0y+QRHcJQpLmR6bRA0=;
	b=Ki3ddfi5xavGsgcxvABl7IXa8txdX3TigIRIWJTpPES1TlSamJdWLuENgVGQV7RnHG8n
	 ppBg47R9aZ+wxdtqulvcNAc1atUTIQ02cOi1496P3j0eAWgeyHpqp9lGmRDZE3YYuCDpd
	 Bn7jSKE7y/aIZFXMafW3bn46H5oOIH6NRgetW4yLXijZ2iE2qS0A7aV9NuDKu9BpGICRq
	 E9UArsp8/ASljfVE4VK3SkhbNblU6l0/SGwRe8DDaIDVnisXnBH09TglecPlASjikHIK/
	 Nr+ejaQhaRvVlXJrF1qx39i/vh+y888hxo/8w7I3uettJkibSLizOSSqlB0HJBJVQRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O2RPwIsB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7F4606A33A
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 10:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O2RPwIsB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A4411F000C4;
	Sun, 15 Nov 2026 10:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739919;
	bh=rLzude81vRNVy2ltMpNyG08hR0y+QRHcJQpLmR6bRA0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O2RPwIsBGGllmI3hcPnYK23Jn2+rNExlCf94DdU3Xm/ocJVzpOEKn24BnM8wNDhVX
	 CIOsPyY8yb2VFeDYGsas1BnvLixiX9UUdx8oKp7iA/RTAj18yfa+MMaX1vpwoIFynF
	 tcp6VBxHKN0d8BbcCo2+hMX2trvgfqrb+z5+PSgvQpefhg7GYP3GGnD08iqVlvl/hr
	 l1y3arFd8iV++33wE4W5NvIEqEO9GY9gb2w+GoNnCBApPfuHdIMdlHo1ptIAqKrcHD
	 mkGOS8QVS6sEdCgk0SqLLmKBJ4lUmgGdVWlNvloMwOn+lsGq1ng6dORLc4MEIQAo0Q
	 qsc2Er/p0PeTA==
Message-ID: <sashiko-outbox-215426@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v21 13/13] ax88796b: Add support for AX88772D,
 AX88179A and AX88279
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261114-ax88179a-v21-13-c2d34410bcbe@birger-koblitz.de>
References: <20261114-ax88179a-v21-0-c2d34410bcbe@birger-koblitz.de>
 <20261114-ax88179a-v21-13-c2d34410bcbe@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 10:51:58 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] net: phy: ax88796b: broken 2.5G LPA and pause in
  asix_ax88279_read_status()
--

commit bae79c8bab2ee5c87d5267f24efcefa71548bd4c
Author: Birger Koblitz <mail@birger-koblitz.de>

ax88796b: Add support for AX88772D, AX88179A and AX88279

This commit adds PHY driver support for the ASIX AX88772D (100Mbps),
AX88179A (1Gbps), and AX88279 (2.5Gbps) internal Ethernet PHYs.

> diff --git a/drivers/net/phy/ax88796b.c b/drivers/net/phy/ax88796b.c
> index f20ddf6491499..0df44e0e236ab 100644
> --- a/drivers/net/phy/ax88796b.c
> +++ b/drivers/net/phy/ax88796b.c

[ ... ]

> @@ -83,6 +96,107 @@ static int asix_ax88772a_read_status(struct phy_devic=
e *phydev)
>  	return 0;
>  }
> =20
> +static int asix_ax88279_read_status(struct phy_device *phydev)
> +{
> +	int ret, val;
> +
> +	ret =3D genphy_read_status(phydev);
> +	if (ret)
> +		return ret;
> +
> +	if (!phydev->link)
> +		return 0;
> +
> +	/* Read actual speed from vendor register */
> +	val =3D phy_read(phydev, AX_CTRL_STATUS);
> +	if (val < 0)
> +		return val;
> +
> +	switch (val & AX_CTRL_STATUS_SPEED_MASK) {
> +	case AX_CTRL_STATUS_SPEED_2500:
> +		phydev->speed =3D SPEED_2500;
> +		break;
> +	case AX_CTRL_STATUS_SPEED_1000:
> +		phydev->speed =3D SPEED_1000;
> +		break;
> +	case AX_CTRL_STATUS_SPEED_100:
> +		phydev->speed =3D SPEED_100;
> +		break;
> +	case AX_CTRL_STATUS_SPEED_10:
> +		phydev->speed =3D SPEED_10;
> +	}
> +
> +	/* MDIO_AN_10GBT_STAT_LP2_5G is broken, but we can deduce that
> +	 * the link-partner advertised 2500M if remotely AN succceded
> +	 * for link speed > 1000M and we locally have a link speed of
> +	 * 2500M
> +	 */
> +	linkmode_clear_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT, phydev->lp_adv=
ertising);
> +	val =3D phy_read_mmd(phydev, MDIO_MMD_AN, MDIO_AN_10GBT_STAT);
> +	if (val >=3D 0 && val & MDIO_AN_10GBT_STAT_REMOK) {
> +		linkmode_mod_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT,
> +				 phydev->lp_advertising,
> +				 phydev->speed =3D=3D SPEED_2500);
> +	}
> +	/* Only supports full duplex */
> +	phydev->duplex =3D DUPLEX_FULL;
> +
> +	/* PHY switches interface between 2.5GBit and slower modes */
> +	if (phydev->speed =3D=3D SPEED_2500)
> +		phydev->interface =3D PHY_INTERFACE_MODE_2500BASEX;
> +	else
> +		phydev->interface =3D PHY_INTERFACE_MODE_SGMII;
> +
> +	return 0;
> +}

[Severity: Medium]
Does updating phydev->lp_advertising and phydev->duplex after
genphy_read_status() leave pause resolution and 2.5G link-partner
advertising broken?

genphy_read_status() resets phydev->duplex to DUPLEX_UNKNOWN and
phydev->pause / phydev->asym_pause to false, then calls
phy_resolve_aneg_linkmode().  When 2500baseT_Full is the only common
advertised speed mode (for example, when local advertisement is restricted
to 2500baseT/Full via ethtool), ETHTOOL_LINK_MODE_2500baseT_Full_BIT is not
yet set in phydev->lp_advertising during genphy_read_status(), so
phy_caps_lookup_by_linkmode() fails and phydev->duplex remains
DUPLEX_UNKNOWN when phy_resolve_aneg_pause() runs:

drivers/net/phy/phy-core.c:phy_resolve_aneg_pause() {
	if (phydev->duplex =3D=3D DUPLEX_FULL) {
		phydev->pause =3D linkmode_test_bit(ETHTOOL_LINK_MODE_Pause_BIT,
						  phydev->lp_advertising);
		phydev->asym_pause =3D linkmode_test_bit(
			ETHTOOL_LINK_MODE_Asym_Pause_BIT,
			phydev->lp_advertising);
	}
}

Setting phydev->duplex =3D DUPLEX_FULL later without calling
phy_resolve_aneg_pause(phydev) leaves negotiated pause flow control
disabled.

Also, returning early on !phydev->link before clearing
ETHTOOL_LINK_MODE_2500baseT_Full_BIT leaves that bit stale in
phydev->lp_advertising when a 2.5G link drops, because genphy_read_lpa()
only clears Clause 22 MII_LPA and MII_STAT1000 bits.  Finally, if
phy_read_mmd(phydev, MDIO_MMD_AN, MDIO_AN_10GBT_STAT) returns a negative
error, the error is ignored rather than returned to
phy_check_link_status().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-ax88179a-v=
21-0-c2d34410bcbe@birger-koblitz.de?part=3D13
