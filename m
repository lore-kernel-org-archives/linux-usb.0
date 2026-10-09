Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A4F3A2543
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 03:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791517918; cv=none; b=G2IahFEwCbZbCIf5zizeYduUEYjQgPjyOPZljjmCJdk38vmVvAu6+spR6wBnm53cESxjtlr8U01JJr0r9E+j3GuXx6jtIcL7TVoiPSpaJQ6zq64DzSYqOmgQbYRFnoRXU7O0yrtFTdU0+3RTrwZwqywNyONzAOd6J92Bdpf1UKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791517918; c=relaxed/simple;
	bh=E/pWwLr0orQNrkgxNrintr2pclO+otuGo8KKyeedY3E=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=jUAgYG9ujvK2638yB1sbD8Pj3OsjDk9hPz33/DFdy1k5S2+EGg1hYRj0hEQDDsrrsbBrPrcYNOE0xTsBE/PUYpS2mjEdYRZKSA7mBz6a9u6TmdLZGrHTher3Q5nlfKiwtHXqa+ymXT3h07X+HMIDdsjUajjXO1oRBR9zao8rxl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lsgcYTfM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lsgcYTfM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B1E61F008A0;
	Fri,  9 Oct 2026 03:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791517908;
	bh=bPfXRaXQdfFw3cN+CQXeQJ3iIi9/85JcqDAkshTW17E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lsgcYTfMWkX2id/H/yhu8MMtDHQ41KIX2deTZp5OnjStXp73tkupiJbz9Z1Ua+lGD
	 3PFDt2BdgJXBfBoUI1cchP94FdJ6/R/DySrqNfhImj3aWthApPrNlvMqjDfscsSe1V
	 uHhtdcId0ggL0zPfV7xlYqBZm99eI3DIYDYvjhtg2qTELfKmeiAUDC5W8YZyI8S0we
	 foTvDRcva3QLypB9WaTD02TOjn/LgbS+bL/XT8l9nG16xBQPupP/cQOfgi/YqWL/X5
	 Ar/5nc04N/JMqC0vBGahDMk1/sbuAgc8ZjLlLuCx7ZkL+YTTrMtMMBJNeTtU5j2FTN
	 a4SlqPcwVzh3g==
Message-ID: <sashiko-outbox-164803@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v18 13/13] ax88796b: Add support for AX88772D,
 AX88179A and AX88279
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008-ax88179a-v18-13-6fa1d4c40422@birger-koblitz.de>
References: <20261008-ax88179a-v18-0-6fa1d4c40422@birger-koblitz.de>
 <20261008-ax88179a-v18-13-6fa1d4c40422@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 03:51:47 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] net: phy: ax88796b: missing 10M half-duplex cleanup causing mismat=
ch
- [Medium] net: phy: ax88796b: missing aneg restart when changing only 2.5G=
 advertisement
- [Low] net: phy: asix: Dead code in asix_ax88772D_get_features()
--

commit 86e7d1e2ad82ba6062c7e69eccd21649d9c81f47
Author: Birger Koblitz <mail@birger-koblitz.de>
Subject: ax88796b: Add support for AX88772D, AX88179A and AX88279

This commit adds driver support for 100MBit, 1GBit, and 2.5 GBit PHYs
found in ASIX USB-Ethernet controllers.

> diff --git a/drivers/net/phy/ax88796b.c b/drivers/net/phy/ax88796b.c
> index f20ddf6491499..99abb0af3296d 100644
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

> +static int asix_ax88279_config_aneg(struct phy_device *phydev)
> +{
> +	bool adv_2500;
> +	int ret;
> +
> +	if (phydev->autoneg =3D=3D AUTONEG_DISABLE) {
> +		phydev_warn(phydev, "Disabling autoneg is not supported\n");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	adv_2500 =3D linkmode_test_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT, ph=
ydev->advertising);
> +	ret =3D phy_modify(phydev, MII_ADVERTISE, AX_ADVERTISE_2500,
> +			 adv_2500 ? AX_ADVERTISE_2500 : 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	return genphy_config_aneg(phydev);

[Severity: Medium]
Will this fail to restart auto-negotiation if a user only changes the
2.5G advertisement?

Because phy_modify() returns 0 on success, the changed state of the
AX_ADVERTISE_2500 bit is lost. When the rest of the configuration is delega=
ted
to genphy_config_aneg(), it internally evaluates standard advertisement bits
using a mask that excludes this custom 2.5G bit. If no standard changes are
detected, genphy_config_aneg() returns without restarting hardware
auto-negotiation, and the link partner won't be notified of the new 2.5G
advertisement.

Could we check if the register was actually modified, perhaps by using
phy_modify_changed(), and manually trigger a restart or pass the changed st=
ate
to __genphy_config_aneg()?

> +}
> +
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

[Severity: High]
Does this code also need to clear the 10M half-duplex capability?

The read status function unconditionally forces phydev->duplex to DUPLEX_FU=
LL,
indicating the device only supports full duplex. However,
genphy_c45_pma_read_abilities() populates both 10baseT_Full_BIT and
10baseT_Half_BIT. Since the 10M half-duplex bit isn't cleared here along
with the 100M one, the PHY might still advertise 10M half-duplex capability.

If it negotiates 10M half-duplex with a link partner, could this lead to a
duplex mismatch between the MAC (forced to full) and the link partner?

> +
> +	return 0;
> +}

[ ... ]

> +static int asix_ax88772D_get_features(struct phy_device *phydev)
> +{
> +	int ret;
> +
> +	/* MDIO_DEVS1/2 empty, so set mmds_present bits to allow reading abilit=
ies */
> +	phydev->c45_ids.mmds_present |=3D MDIO_DEVS_PMAPMD | MDIO_DEVS_AN;

[Severity: Low]
Is the assignment to mmds_present needed here?

It seems this might be dead code, as genphy_read_abilities() and its helpers
like genphy_c45_read_eee_abilities() do not appear to check the mmds_present
mask to determine capabilities.

> +
> +	ret =3D genphy_read_abilities(phydev);
> +	if (ret < 0)
> +		return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-ax88179a-v=
18-0-6fa1d4c40422@birger-koblitz.de?part=3D13
