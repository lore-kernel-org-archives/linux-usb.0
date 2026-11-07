Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794036117;
	b=MGsbAB4e7gc3C1JMycfm8dzUz+43zc//vPKaKsb5sa4g1+a2iDw+/as1eGl61uGvP5gM
	 2+C0yxB6xeFGsevQvx7TejlvyaygLjqTtFlT6LimDIUMW7yjYAuwVkcaNtZImCsJiAQgU
	 rZHGQysOMivkNDwvDm9tW8ro6tq+eS7tvp1AuzbKaSwV2saMZ1X+zNy13PJyj6GqlgqWF
	 DIVRyzkQVdrY44Yup/RHuq3qvGyF8HyR2lh7XE8RpIGAwBgb9Ye1CV/IrGf495Uql9s1t
	 s/PtMri64tiDxs4QrSNpbxtg9sZSjOfMnRlu0QMOwYlL7r4NR2sSwk5x4jkbySR0HSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794036117;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yxofnR+VxUx6Y54F+5tbEaAhWagrAK4CwaWtcVsA8I8=;
	b=snF3OWa5bXiu/Jx/rxXU63EBr/c+BKD6YDQJ9d07gzijytWTb1ug2SuqsFV6FCB5g9cW
	 4MxxCG04K7XYnR9BxwYwLlx4bjEOqusWwohwtbQsT9kew7bcUQhbl5Z1gaQFGymaq8QAh
	 zgQ6EB1w20NWx9gHfGlXfh2r3BcXFXYdg74R8nhW7Jom0TkkTVQWkFI46SdIEndix6gs5
	 U9p01nBnLzTn2FL0ZoY5cwGwRNJ11aRct+eBzZbnxt6dWYUmDQ/L25WrmpThupfwYbI0w
	 NyFxrWY0dfXQAeBa3kkyKl9Rivkk2bnL2LRBp32kxWqM44B5iwcJykiQ1TFjU+aSQPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Bkxuow7/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87875606A32D
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 07:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bkxuow7/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 476401F0089F;
	Sat,  7 Nov 2026 07:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794036117;
	bh=yxofnR+VxUx6Y54F+5tbEaAhWagrAK4CwaWtcVsA8I8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bkxuow7/KAw3r22Pjm131hiIiVZL0pQR8XB6jKjms1WSYf3KPFkiIG1gPoZpT34F4
	 as7yK5KEdMTtoODpjg8XqA/aDYerLftqHVqHoLmjF8Auc/kVMdPzhmQzfj5JgaaUuU
	 /2RxYLlUy1RzprZdE0pC3HKXCIwvAYEWLUc75STxtu7T0rH4JMoVISkNfjdIZj2VuD
	 0WS8io5Sy5BmHWonWlbbxguOGzAa48jtvN/bArfsUq2Q6BFQrxkaC2TMP/IaPbtros
	 ocaK7FugbvXPu3XEymkYBmRvuui+rvFbd/iRK+XH9qa/XRvXsOxez1n11iFdyznHCF
	 ALewU+i8Yp2JQ==
Message-ID: <sashiko-outbox-202703@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v20 13/13] ax88796b: Add support for AX88772D,
 AX88179A and AX88279
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-ax88179a-v20-13-37b5a1189983@birger-koblitz.de>
References: <20261106-ax88179a-v20-0-37b5a1189983@birger-koblitz.de>
 <20261106-ax88179a-v20-13-37b5a1189983@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 07:21:56 +0000
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
- [Medium] net: phy: ax88796b: stale 2.5G LPA and pause bug in
  asix_ax88279_read_status()
--

commit 15d79caef25783090283820b8fda304017ab1973
Author: Birger Koblitz <mail@birger-koblitz.de>

ax88796b: Add support for AX88772D, AX88179A and AX88279

This commit adds PHY driver support for the ASIX AX88772D, AX88179A, and
AX88279 PHYs, including status reading and auto-negotiation configuration
for the 2.5G AX88279 PHY.

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

[Severity: Medium]
Does updating phydev->lp_advertising and phydev->duplex after
genphy_read_status() leave ETHTOOL_LINK_MODE_2500baseT_Full_BIT stale on
link down and prevent pause resolution on 2.5G links?

When a 2.5G link drops, genphy_read_status() -> genphy_read_lpa() only
clears Clause 22 10/100/1000 link modes in phydev->lp_advertising.
Returning early on !phydev->link skips clearing
ETHTOOL_LINK_MODE_2500baseT_Full_BIT, leaving it reported via ethtool while
the link is down.

Also, genphy_read_status() runs phy_resolve_aneg_linkmode() before
ETHTOOL_LINK_MODE_2500baseT_Full_BIT is set in phydev->lp_advertising and
before phydev->duplex is set to DUPLEX_FULL.  When 2500baseT_Full is the
only common speed mode, phy_resolve_aneg_linkmode() leaves phydev->duplex
as DUPLEX_UNKNOWN, so phy_resolve_aneg_pause() does not set phydev->pause
or phydev->asym_pause:

drivers/net/phy/phy-core.c:phy_resolve_aneg_pause() {
	if (phydev->duplex =3D=3D DUPLEX_FULL) {
		phydev->pause =3D linkmode_test_bit(ETHTOOL_LINK_MODE_Pause_BIT,
						  phydev->lp_advertising);
		phydev->asym_pause =3D linkmode_test_bit(
			ETHTOOL_LINK_MODE_Asym_Pause_BIT,
			phydev->lp_advertising);
	}
}

Setting phydev->duplex =3D DUPLEX_FULL afterwards without calling
phy_resolve_aneg_pause() leaves negotiated pause flow control disabled.
In addition, if phy_read_mmd() fails with a negative error, that error is
silently ignored rather than returned.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-ax88179a-v=
20-0-37b5a1189983@birger-koblitz.de?part=3D13
