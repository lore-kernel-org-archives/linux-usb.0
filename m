Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5833B5E08
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 03:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791342350; cv=none; b=Jy17LK+A5iiSD7ZvsR941JMQFpKCHZWwhshCHuDCVyDtBUJopuecGsWAI3txXp4LrSSQBs0+mDEZiMA1IZxXYWWdk4zfje7K3de97qTMOnKDkESkgTOoMw9xklN4WL9ktmE/FmIvupVPdyIph89itTDwNeTeUTtM3TtIRc2Pvpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791342350; c=relaxed/simple;
	bh=t3Na+w0WLAkMNZf3688PI+h4VO5x1ntL4RO46Dwo/6s=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=s6FL+7KvLnv4+4ViX/+HR38JhTQNIJ7yCEjl+sHji4KiNKm215Nob10iEQtkr4i2iIUPXQ4McM1WVKeZzol1lJlydoCxRvj/W1d+vArvz4dPL0qZboffF3mQrknsDwBDpeb/QlILPZkPRSJl7oRARbJs7vpMRt4psKk1LTh4Hss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fxo8lap/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fxo8lap/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE2E1F0089B;
	Wed,  7 Oct 2026 03:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791342347;
	bh=fC+TEP/xgGE6OMJZNpl12V9SwLnTyOn06KnUtvZs1nM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fxo8lap/qigt9fBezP9Sok3XZKR/HWCzKetporFXn0jc6umQ9M/R9Cr2BK7v+dPL4
	 Bh11rxmfn1wIATKPeKFR9X3b2RP+aROS1yLad5NbePN6E9junp4nibfrYCW6/l5fsn
	 a7UtezKoojxjxrbYAf/P6CtFuUZqA9wrfjnOGxzGU0Yaevz1JOlvMR1QnrxhC75g9g
	 wpXqXCN+dwgvlaoDQ3JeIv3+kojO4jf4w9AT8UZy0mk6Tqbhz9dG1ZqPpMsCgAMo/i
	 g6Bw4bs4aXlUWSAaJCWIFxN10PmFf15jgROYXrPSqOkE/0sU1PqYt5Okk5qu8Cu3k7
	 YNYwUm6iV6EyQ==
Message-ID: <sashiko-outbox-162613@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v17 13/13] ax88796b: Add support for AX88772D,
 AX88179A and AX88279
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261006-ax88179a-v17-13-252814fe35ea@birger-koblitz.de>
References: <20261006-ax88179a-v17-0-252814fe35ea@birger-koblitz.de>
 <20261006-ax88179a-v17-13-252814fe35ea@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 03:05:47 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] net: phy: ax88796b: missing aneg restart and race in asix_ax88279_=
config_aneg
- [Medium] net: phy: ax88796b: incomplete clearance of 1000baseT capabiliti=
es for AX88772D
--

commit bc582050068fafd1fce54d8108ca8616b6ee048a
Author: Birger Koblitz <mail@birger-koblitz.de>

ax88796b: Add support for AX88772D, AX88179A and AX88279

This commit adds support for the AX88772D, AX88179A and AX88279 PHYs found
in ASIX USB-Ethernet controllers. It introduces vendor-specific configurati=
on
and status reading functions to support 100MBit, 1GBit, and 2.5GBit link mo=
des.

> diff --git a/drivers/net/phy/ax88796b.c b/drivers/net/phy/ax88796b.c
> index f20ddf6491499..a427292759a24 100644
> --- a/drivers/net/phy/ax88796b.c
> +++ b/drivers/net/phy/ax88796b.c

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
> +	ret =3D genphy_config_aneg(phydev);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	adv_2500 =3D linkmode_test_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT, ph=
ydev->advertising);
> +	ret =3D phy_modify(phydev, MII_ADVERTISE, AX_ADVERTISE_2500,
> +			 adv_2500 ? AX_ADVERTISE_2500 : 0);
> +
> +	return ret;
> +}

[Severity: High]
Can this ordering cause autonegotiation to either miss a restart or race
with the 2.5G advertisement update?

genphy_config_aneg() evaluates changes and restarts autonegotiation
immediately if required. Modifying MII_ADVERTISE afterward bypasses the
change detection for the 2.5G bit and races with the already-started
autonegotiation.

Would it be better to check for changes to both standard and custom bits,
apply all register modifications, and only then restart autonegotiation?

[ ... ]

> +static int asix_ax88772D_get_features(struct phy_device *phydev)
> +{
> +	int ret;
> +
> +	/* MDIO_DEVS1/2 empty, so set mmds_present bits to allow reading abilit=
ies */
> +	phydev->c45_ids.mmds_present |=3D MDIO_DEVS_PMAPMD | MDIO_DEVS_AN;
> +
> +	ret =3D genphy_read_abilities(phydev);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* AX88772D does not support reported 1000baseT mode */
> +	linkmode_clear_bit(ETHTOOL_LINK_MODE_1000baseT_Full_BIT, phydev->suppor=
ted);

[Severity: Medium]
Does this completely clear the errantly reported gigabit capabilities?

genphy_read_abilities() reads MII_ESTATUS and can also populate
ETHTOOL_LINK_MODE_1000baseT_Half_BIT and
ETHTOOL_LINK_MODE_1000baseX_Full_BIT if they are present.

Since this is a 100MBit PHY, should all gigabit modes be explicitly cleared
to prevent broken autonegotiation if the remote link partner attempts to
negotiate them?

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006-ax88179a-v=
17-0-252814fe35ea@birger-koblitz.de?part=3D13
