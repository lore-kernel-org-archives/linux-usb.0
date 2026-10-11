Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831BA3C8700
	for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 04:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791694498; cv=none; b=Zds0oprw73CpBf2bMj30XI7jCxpCKQhwu3ZjBjkv0gV/y+RIXOalKBz3eGzFthzH1f0NzC2VlLZvnGkipTVYcbNLj3jkZuXNaFTnixwRPyudpoRzLcyFjIlixTJPlMnLNuMLol9+athI1GdVBrbs4PmPp2QnNHDpVss5pRHKrLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791694498; c=relaxed/simple;
	bh=rE+w2/QbDZ/FaRvmsOPRJySPK55fLIFgykpLJfdfIQk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Jltzl4dAwpPcvi31oth4EnaIMPFMij/vdJ7c5UIpqYCzSm+mMJsNcN4/xTDLky8n06QQM0yFNFHOI/aZ/6W2onMWyezY6jCbeDT8T32PQF4F2txocGTlCELxRZTB4ThFSbonEqsSxkZwtZIrTui8oMYg3HdE2sMxfU+mQSlbJ+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MAu7KYQc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MAu7KYQc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41CE51F0089B;
	Sun, 11 Oct 2026 04:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791694497;
	bh=8fRz8aDVr4MXitPk52JA5rQ8hUeG0ZmSYk0d/nvJUJY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MAu7KYQct/3YBoxHwfnocHAxL8Rkt3E1L6Q+1Ascj5QenPJcH07E8+xC/prz8DbS/
	 C3o2I+zx+L2Sg4PhRihIYWkVTF0YhfL9+LKrTTgcVItwvI7qkC5Mqnb13Jku0MkPEg
	 rXweToeWn90xnACOuqW7qk8OHt6mtUplojvyU9PfhKTv3USB8wXULzfivSJW0XNoEN
	 Ofw51m+A/7BKKmTYP8vJ2O6q/VQ0ngargvccEU31ArgKhVsEPwiTbFGPOuTMJBJ0yQ
	 GVp7Ch7IOlSU4N0FSk4fdoZzxDg8yrybhSZB80fOqLcKemYdVEXRihwEfS21kMRunX
	 pkyNQXFgEMfSA==
Message-ID: <sashiko-outbox-167014@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v19 02/13] phylib: Add support for PHYs with
 broken forced mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261010-ax88179a-v19-2-7475173cfb56@birger-koblitz.de>
References: <20261010-ax88179a-v19-0-7475173cfb56@birger-koblitz.de>
 <20261010-ax88179a-v19-2-7475173cfb56@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 04:54:56 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] phy: C45 MDIO writes falsely trigger C22 register handlers corrupt=
ing state
- [High] phylib: NULL pointer deref due to TOCTOU race on phydev->drv
--

commit f3ec63e34d550025dac6b66482995851d8d99969
Author: Birger Koblitz <mail@birger-koblitz.de>

phylib: Add support for PHYs with broken forced mode

This commit adds support for PHYs which only support auto-negotiated speed
modes. This prevents a kernel warning and stack-trace within the
phy_state_machine when PHYs return -EOPNOTSUPP from config_aneg() because
they do not support forced modes.

> diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
> --- a/drivers/net/phy/phy.c
> +++ b/drivers/net/phy/phy.c

[ ... ]

> @@ -354,6 +354,9 @@ int phy_mii_ioctl(struct phy_device *phydev, struct i=
freq *ifr, int cmd)
>  			switch (devad) {
>  			case MII_BMCR:
>  				if ((val & (BMCR_RESET | BMCR_ANENABLE)) =3D=3D 0) {
> +					if (phydev->drv &&
> +					    (phydev->drv->flags & PHY_BROKEN_FORCED))
> +						return -EOPNOTSUPP;

[Severity: High]
Can this unlocked check on phydev->drv lead to a NULL pointer dereference?

If a concurrent sysfs unbind calls phy_remove() and sets phydev->drv =3D NU=
LL
without holding rtnl_lock or phydev->lock, the compiler might fetch
phydev->drv to verify it is non-NULL, and then fetch it again to read flags.
This double-fetch could result in a NULL pointer dereference if the pointer
is cleared between the two operations.

Also, for C45 accesses in phy_mii_ioctl(), devad holds the MMD address but
is matched against C22 register definitions like MII_BMCR (which is 0).=20

Does adding this early return mean a C45 write to MMD 0 (with zeroed reset
and anenable bits) will now incorrectly hit this C22 handler and fail with
-EOPNOTSUPP?

[ ... ]

> @@ -1190,6 +1193,10 @@ int phy_ethtool_ksettings_set(struct phy_device *p=
hydev,
>  	      duplex !=3D DUPLEX_FULL)))
>  		return -EINVAL;
> =20
> +	if (autoneg =3D=3D AUTONEG_DISABLE && phydev->drv &&
> +	    (phydev->drv->flags & PHY_BROKEN_FORCED))
> +		return -EOPNOTSUPP;

[Severity: High]
Does this present the same time-of-check to time-of-use race as above?

A sysfs unbind could set phydev->drv to NULL between the NULL check and the
flags dereference, since ethtool operations and unbind operations do not
share a common lock here.

> +
>  	mutex_lock(&phydev->lock);
>  	phydev->autoneg =3D autoneg;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010-ax88179a-v=
19-0-7475173cfb56@birger-koblitz.de?part=3D2
