Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF47B3CB907
	for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 04:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791694502; cv=none; b=oPJ02fstNqKF+9AMuIMmGeyz+MDIuZgUGaiKB9jxd0OAUvPRFS6YS0W30BrzdvGDS90ywFoOcu61mLNIShKDF/9zGDaaqS4izFxogPul70s0Ds7+QF2abE42OltYzgm9eLyMIRYyG2nN7b8b+5hjQ8Tr483qgm5IAdXLpvzds5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791694502; c=relaxed/simple;
	bh=9V/AouXy8QohMawrLZCZTPgDOVXAtQyfELdL5/V+SzY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=i1ds9etEwKzGPmQxZFU4kUxu24gfvI1lBRyoKgqnHkrP3Q1QS67YjSgfaJq1rRtIWWdNbjS0OOjmAbYdh2RvQQPH7S+yZG0Uj1AJsNPTN/0kusyer9udC6OKNI7Wxsqi2YuwBIyjCnwASOyBPMUMpZaV8QMvUEVVYjFBXziI4BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U+wOD2PG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U+wOD2PG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E7EF1F0089C;
	Sun, 11 Oct 2026 04:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791694501;
	bh=vz32h6+Abvt07dPYhDLQmJMCeDoRwoAIPIJShNXCKYk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U+wOD2PGgMm4MWbZ9d+tMKEewhBn9sGVbrnP8efCGNH17eX7bgL9bG2C2/AzUVJpL
	 draqnFR+3TuEA7fMs3HzZbfqO44eA0ccMxH1I27qbSQCJvgwPa+K+t73jEnUcgIKOn
	 5Gnqt+kguW5vyOdxPsLsrU+r/7LqcJHbkgxvupTAZPrD5gWgs7BaKT96r83Ee5T7/e
	 qVki7SA9HFeMuny5yn9AanhYZU2032qtrtK+CNCF/fMhtGRQPAPjTIvo17bC2jNTUg
	 WiW7aYass9omnCDw1+uh8ATRpfs5cpIkmCHU/DnoGRQJwtWCoZ1ODE7oXecGDlKtOv
	 g3Bj29dMUTQjg==
Message-ID: <sashiko-outbox-167020@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v19 13/13] ax88796b: Add support for AX88772D,
 AX88179A and AX88279
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261010-ax88179a-v19-13-7475173cfb56@birger-koblitz.de>
References: <20261010-ax88179a-v19-0-7475173cfb56@birger-koblitz.de>
 <20261010-ax88179a-v19-13-7475173cfb56@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 04:55:01 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net/phy: ax88279 leaves 10baseT_Half_BIT in supported modes desp=
ite being full-duplex only
--

commit fca1c63dd8d205ab9ae6d1280f70589e1b085eb0
Author: Birger Koblitz <mail@birger-koblitz.de>

ax88796b: Add support for AX88772D, AX88179A and AX88279

The AX88772D, AX88179A and AX88279 are 100MBit, 1GBit and respectively
2.5 GBit PHYs that are found in ASIX USB-Ethernet controllers of the
same name.

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

[ ... ]

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

[Severity: Medium]
Since the driver unconditionally forces the MAC to full-duplex here, could
this cause a duplex mismatch if 10M half-duplex is negotiated?

In asix_ax88279_get_features() below, genphy_c45_pma_read_abilities()
evaluates extended abilities and will set ETHTOOL_LINK_MODE_10baseT_Half_BIT
if 10Mbps is supported. If a peer supports only half-duplex (or
auto-negotiation otherwise selects it), the link will come up in half-duplex
on the wire while the driver unconditionally reports DUPLEX_FULL, leading to
late collisions and packet loss.

> +
> +	/* PHY switches interface between 2.5GBit and slower modes */
> +	if (phydev->speed =3D=3D SPEED_2500)
> +		phydev->interface =3D PHY_INTERFACE_MODE_2500BASEX;
> +	else
> +		phydev->interface =3D PHY_INTERFACE_MODE_SGMII;
> +
> +	return 0;
> +}

[ ... ]

> +static int asix_ax88279_get_features(struct phy_device *phydev)
> +{
> +	int ret;
> +
> +	/* MDIO_DEVS1/2 empty, so set mmds_present bits to allow reading abilit=
ies */
> +	phydev->c45_ids.mmds_present |=3D MDIO_DEVS_PMAPMD | MDIO_DEVS_AN;
> +
> +	linkmode_set_bit_array(phy_basic_ports_array, ARRAY_SIZE(phy_basic_port=
s_array),
> +			       phydev->supported);
> +
> +	ret =3D genphy_c45_pma_read_abilities(phydev);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* AX88279 does not support reported 100baseT-half duplex mode */
> +	linkmode_clear_bit(ETHTOOL_LINK_MODE_100baseT_Half_BIT, phydev->support=
ed);

[Severity: Medium]
Does this code also need to clear ETHTOOL_LINK_MODE_10baseT_Half_BIT?

The driver manually clears 100baseT-Half due to a lack of support, but
appears to leave 10baseT-Half enabled in the supported modes despite the PHY
being full-duplex only.

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010-ax88179a-v=
19-0-7475173cfb56@birger-koblitz.de?part=3D13
