Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AAC3A5431
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 03:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791517909; cv=none; b=mnxjvW18yswniuNN9nCT5U44IEBJXanvZI04k/hmXsar1mvBQzTkB4m1PU8htjReRgKSLfQ9OKX1m8KoM3Wx0q0UWJR2GUJtZTZ1wwq/ZVbWEaE9EX2umOow8xE+6gIGvgEq+GnNBvPdItRdFVfIxjjukAYzDcY4TGMuuD5ykO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791517909; c=relaxed/simple;
	bh=LDM+5ZEtBCa0/6lFqPIwLAZPY3iKhJhuvqC9pvhVTKI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=O6TQA4yGs5TajHqCF4VDwdOqNp75a8gVzBiJbe+rOKFIpipwMcgX7ugB8TkYdist3fWXx0O0EFnjxfAvxVogqwS9C/SNOX1K7mtV1AMbKECJaPzquS6oMlZU0XeRPvqkkUUCTrcDEOis1XP8dlC7YymdGKiWQKkxDBHIz9KNNfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YihR8/wW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YihR8/wW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9381F000FF;
	Fri,  9 Oct 2026 03:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791517904;
	bh=+lM+i0ikQOo9OGTNz8RbIviX/2EJpCCNJ7DMKnfG5uA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YihR8/wWDspV2rxB+zUuyreqsciT3UyBFVQ2o6H9esTprNh1NXbW6NopRR+RsyFdF
	 6aS7Jy/iy9cx4HIpX8Nqlc+U2u+4qz1HH0DGE6kPvPciPLP7sAQ7b4BuVZJXsQ36zJ
	 g1Kel2aT88QnVIdxuhGXYqqEhIIxMGSUY+Fy9r5NG7rJ6zEbkZ7thh42yOLWIy85Iw
	 pLnjoIYg0Xwx6iwMXnNZimmumuWqy3HQDZLWIf4UhnlbBaPh8Vyn27VtlyMjCA+wsk
	 pNHvIC17SfSPSZzmKdSYLcEkJn0B/D5mLttfyOGRdAIIFqgb2bDkEmTlYEgBB+ahgU
	 PKZh0U5lu2LKQ==
Message-ID: <sashiko-outbox-164798@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v18 02/13] phylib: Add support for PHYs with
 broken forced mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008-ax88179a-v18-2-6fa1d4c40422@birger-koblitz.de>
References: <20261008-ax88179a-v18-0-6fa1d4c40422@birger-koblitz.de>
 <20261008-ax88179a-v18-2-6fa1d4c40422@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 03:51:44 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] phy: TOCTOU race allowing NULL pointer dereference in phy_mii_ioct=
l and phy_ethtool_ksettings_set
- [Medium] net: phy: data race modifying bitfields in phy_mii_ioctl
- [Medium] net: phy: SIOCSMIIREG C45 writes misinterpret MMDs as C22 regist=
ers
--

commit 38a1dbebb552f1b80a0aa4bb3db03459a68b3811
Author: Birger Koblitz <mail@birger-koblitz.de>

phylib: Add support for PHYs with broken forced mode

This adds support for PHYs which only support auto-negotiated speed modes,
preventing a kernel warning and stack-trace when PHYs return -EOPNOTSUPP
from config_aneg() for forced modes.

> diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
> index fce9bc7be3304..079c53516f424 100644
> --- a/drivers/net/phy/phy.c
> +++ b/drivers/net/phy/phy.c
> @@ -354,6 +354,9 @@ int phy_mii_ioctl(struct phy_device *phydev, struct i=
freq *ifr, int cmd)
>  			switch (devad) {
>  			case MII_BMCR:

[Severity: Medium]
Does this switch statement evaluate Clause 45 MMDs against Clause 22
register macros?

In phy_mii_ioctl(), devad contains the MMD for C45 writes:

	case SIOCSMIIREG:
		if (mdio_phy_id_is_c45(mii_data->phy_id)) {
			prtad =3D mdio_phy_id_prtad(mii_data->phy_id);
			devad =3D mdio_phy_id_devad(mii_data->phy_id);

If a user issues an SIOCSMIIREG ioctl targeting a Clause 45 PHY and
writes to MMD 4 (PHY XS), devad will be 4. Doesn't this hit the
MII_ADVERTISE case below, incorrectly corrupting phydev->advertising?

Additionally, will the newly added logic here improperly intercept C45 writ=
es
to MMD 0?

>  				if ((val & (BMCR_RESET | BMCR_ANENABLE)) =3D=3D 0) {
> +					if (phydev->drv &&
> +					    (phydev->drv->flags & PHY_BROKEN_FORCED))

[Severity: High]
Can the compiler double-fetch phydev->drv here without locks, risking a NULL
pointer dereference?

If an asynchronous driver unbind occurs via sysfs:

echo <phy_id> > /sys/bus/mdio_bus/drivers/<drv>/unbind

This calls phy_remove(), which clears phydev->drv to NULL without acquiring
phydev->lock. Could the second fetch of phydev->drv in the condition above
yield NULL, leading to a kernel panic when dereferencing flags?

> +						return -EOPNOTSUPP;
>  					if (phydev->autoneg =3D=3D AUTONEG_ENABLE)
>  						change_autoneg =3D true;
>  					phydev->autoneg =3D AUTONEG_DISABLE;

[Severity: Medium]
Is it safe to modify phydev->autoneg and phydev->duplex locklessly here?

These fields are part of a bitfield block in struct phy_device:

	unsigned autoneg:1;
	unsigned link:1;
	unsigned autoneg_complete:1;

phy_state_machine() modifies adjacent bitfields (like link and
autoneg_complete) asynchronously while holding phydev->lock. Because they
share the same memory word, could this lockless assignment in phy_mii_ioctl=
()
cause a read-modify-write race that silently overwrites the state machine's
updates?

[ ... ]
> @@ -1190,6 +1193,10 @@ int phy_ethtool_ksettings_set(struct phy_device *p=
hydev,
>  	      duplex !=3D DUPLEX_FULL)))
>  		return -EINVAL;
> =20
> +	if (autoneg =3D=3D AUTONEG_DISABLE && phydev->drv &&
> +	    (phydev->drv->flags & PHY_BROKEN_FORCED))

[Severity: High]
Similar to the check in phy_mii_ioctl(), can the compiler double-fetch
phydev->drv here before phydev->lock is taken?

If phy_remove() clears phydev->drv concurrently, could the second load yield
NULL and cause a dereference crash?

> +		return -EOPNOTSUPP;
> +
>  	mutex_lock(&phydev->lock);
>  	phydev->autoneg =3D autoneg;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-ax88179a-v=
18-0-6fa1d4c40422@birger-koblitz.de?part=3D2
