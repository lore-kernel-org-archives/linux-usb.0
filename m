Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC2E3B27D3
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 03:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791342347; cv=none; b=BIZmyo3y0i+akF1eGpD/CNaQkLcZdI7e18k7y3S1PU0qRcmrgcwyNrRdZj4kidy3QjmjzJbe7rPQbgtaAUglY6hwLz5Kqs7gZDEcD9tAF4KgoCXpp/UEt0v7ZctD11d2BE4Jt/XJ1KH9/sa9aD1+1T3RLZvpZM2OoAKtIa067to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791342347; c=relaxed/simple;
	bh=uFyqO1YUBddVNsfDSABig1xb2RZpdDGlEQY3ph8bd5A=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=tGMLw8m206vChHOxs1v3ArdILXT3asTgMbI+60Phl7g64uodIpygaKKmy0QDSV9NujW/bwR+dEmsSVO/IWcnUim3t86sPS6E4gq7eiJ/aEddY/g58ZS2dDTuiJgCynyAhj0HWpoz2yydLhBe4/QTd9iqGh1PGlVmcUQYIX2t30Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mk0hhiiX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mk0hhiiX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 890401F0089C;
	Wed,  7 Oct 2026 03:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791342346;
	bh=o3SWo11YZQ+X5BRsunw6+AlONn4u7rSImPWJjAQUTxw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mk0hhiiXGQ7Utchy01xHWDBfnlcZ1U2lULXdgKZiBAjirzKN1XU/0KTUY6hK7v0CP
	 ti8bbEhEIpWcUg7tseWRp6HEaV3I0Yi2SL6UOpF1puOsbkFjt/me/k0UgcvPGU8zDr
	 lmOM7GES6Z+UqUe4ykf3i9p2jGYmktCVmXKLT1DuIViVNn+VwJ3RypAA5fz4ZnUXJU
	 /FllKzrCzb4oGrtM68OEw/tJW2/Y0ZxpN8LY4pUU7eozB4NkChzXkbHjxWpZzLE0+o
	 JIDo24SwQiLrPNBJTs7SKNSWJKp8tVmIGM0lTFsnXe0woRKRg1BCldG8wWvt8Cf0Zu
	 Lm5bQZuW1tQ1w==
Message-ID: <sashiko-outbox-162611@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v17 02/13] phylib: Add support for PHYs with
 broken forced mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261006-ax88179a-v17-2-252814fe35ea@birger-koblitz.de>
References: <20261006-ax88179a-v17-0-252814fe35ea@birger-koblitz.de>
 <20261006-ax88179a-v17-2-252814fe35ea@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 03:05:46 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] phylib: NULL pointer dereference in phy_ethtool_ksettings_set()
- [Medium] phylib: Userspace can bypass PHY_BROKEN_FORCED via SIOCSMIIREG
--

commit ba73f96bed1d2e99a191c06a9e1fb6f1fd49beef
Author: Birger Koblitz <mail@birger-koblitz.de>

    phylib: Add support for PHYs with broken forced mode
   =20
    Add support for PHYs which only supported auto-negotiated
    speed modes. This prevents a kernel warning and stack-trace within the
    phy_state_machine when PHYs return -EOPNOTSUPP from config_aneg()
    because they do not support forced modes.

> diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
> index fce9bc7be3304..b83f938fe7c3b 100644
> --- a/drivers/net/phy/phy.c
> +++ b/drivers/net/phy/phy.c
> @@ -1190,6 +1190,10 @@ int phy_ethtool_ksettings_set(struct phy_device *p=
hydev,
>  	      duplex !=3D DUPLEX_FULL)))
>  		return -EINVAL;
> =20
> +	if (autoneg =3D=3D AUTONEG_DISABLE &&
> +	    (phydev->drv->flags & PHY_BROKEN_FORCED))
> +		return -EOPNOTSUPP;
> +

[Severity: High]
Can this unconditionally dereference phydev->drv when it might be NULL?

If a PHY driver is unbound (e.g., via sysfs), phy_remove() sets
phydev->drv =3D NULL but does not detach the PHY from the net_device. A
subsequent call to ethtool -s ethX autoneg off reaches
phy_ethtool_ksettings_set(). The newly added check accesses phydev->drv
without verifying it is non-NULL, which can cause a kernel oops, allowing
a privileged user to crash the system instead of receiving a graceful error.

Later in the same function, _phy_start_aneg() correctly checks for
!phydev->drv.

[Severity: Medium]
Does this fix fully prevent userspace from bypassing the check?

While this patch aims to prevent a WARN(1) and stack trace in
phy_state_machine() by blocking AUTONEG_DISABLE via ethtool for PHYs with
PHY_BROKEN_FORCED, userspace can still bypass this via the SIOCSMIIREG
ioctl.

By writing to MII_BMCR and clearing the BMCR_ANENABLE bit, phy_mii_ioctl()
intercepts it to unconditionally set phydev->autoneg =3D AUTONEG_DISABLE
without checking the new PHY_BROKEN_FORCED flag:

drivers/net/phy/phy.c:phy_mii_ioctl() {
    ...
					phydev->autoneg =3D AUTONEG_DISABLE;
					if (val & BMCR_FULLDPLX)
    ...
}

When phy_state_machine() subsequently runs and calls _phy_start_aneg(), the
driver will return -EOPNOTSUPP, and phy_error_precise() will trigger the
exact same WARN(1) the patch intended to fix.

>  	mutex_lock(&phydev->lock);
>  	phydev->autoneg =3D autoneg;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006-ax88179a-v=
17-0-252814fe35ea@birger-koblitz.de?part=3D2
