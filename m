Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0613257459
	for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 04:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791694494; cv=none; b=cwtsOBN1tBJa7OnpqTiwYBBib99ZihChXT0PythSDReNZCyJkNyznOVVBW8C4O/XxvxZul4L1twVH0JX7EYZb+bjfax4trJZebFuiF/Y9nCvq6pyRW8qWJOb5SIsp5M0jx15FrAA+bYdfeq46+cXuC7FBWUMrW7j+quZHIrgyD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791694494; c=relaxed/simple;
	bh=SlsJVpFLL3RTy8NY/yyfWw+A+egV801Y3NWRiEBVDRw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=aUGYwgm20MaMh61uGGvI1GNAQ/JzNEOuZqCoH/nAx/jvNLI5pkaiYmjN/fwgWXJbRCEhVDU7a2dnBQfv6K+rBCwz+QF5DoXH5Xh28eexgcg7IlJdKr6T17XfDylmG5GsOaD4x6GRcPb1FKCN0LqHiaVnGRNNfycMgPctYd5Lv7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KXosw2cZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KXosw2cZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 065AE1F0089B;
	Sun, 11 Oct 2026 04:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791694493;
	bh=vWOpBSCS1udYQ3hy2zw12wSExyc/yQfZqPU6W8OPAfg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KXosw2cZOgvujbCmLVexvIQ88MgXKGnJpvYALKyTblILlUtb19ZIFF8yOFBdFYdym
	 2sxZYSqFdTy0lZmaU0AnQJ1rua/6sDrm0TheRqYvIpYvTbTTFi9kkWFBlJ1O7hDTTZ
	 uE4LmqZMqKXXpaZt2ofmA5ZBoJrqsG/U0DvoUL+OPtgHoWpRThYBXn1xvfJhtqUNJd
	 PSqU8PjfXgSQbjoh5re6Bu465Raleng+tWMoOr7O/Iimf0R/5QCsgT+pKxT6/XiNVM
	 Zop10xdjREeQ0nkGEuJczZsL9W95GGKxY0xgVUdRLvSjz5ddDgmwW5NZ/rtohss7nH
	 lWzq9Jb4pxnYg==
Message-ID: <sashiko-outbox-167008@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v19 01/13] phylink: Add phylink_mac_interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261010-ax88179a-v19-1-7475173cfb56@birger-koblitz.de>
References: <20261010-ax88179a-v19-0-7475173cfb56@birger-koblitz.de>
 <20261010-ax88179a-v19-1-7475173cfb56@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 04:54:52 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] phylink: UAF and TOCTOU in phylink_mac_interrupt due to lockless p=
hydev access
--

commit 667c3fb1a09bf0994b40559aee9027d3f9775442
Author: Birger Koblitz <mail@birger-koblitz.de>

phylink: Add phylink_mac_interrupt

Adds the phylink_mac_interrupt() function to phylink, passing link-change
interrupts received by the MAC to phylib.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index a7d086cdc9b25..a3ca7993eb7e0 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
[ ... ]
> @@ -1612,6 +1612,26 @@ static bool phylink_link_is_up(struct phylink *pl)
>  	return pl->netdev ? netif_carrier_ok(pl->netdev) : pl->old_link_state;
>  }
> =20
> +/**
> + * phylink_mac_interrupt() - wrapper for phy_mac_interrupt()
> + * @pl: a pointer to a &struct phylink returned from phylink_create()
> + *
> + * Passes a link-change interrupt received by the MAC to phylib.
> + * This function may be called in interrupt context, and therefore canno=
t take
> + * a mutex. However, it is safe to assume that the reference to phy does=
 not
> + * disappear during the call, as only an SFP module may be unplugged to =
make a
> + * PHY disappear. SFP modules however do not support interrupts.
> + */
> +void phylink_mac_interrupt(struct phylink *pl)
> +{
> +	struct phy_device *phy;
> +
> +	phy =3D pl->phydev;
> +	if (phy)
> +		phy_mac_interrupt(phy);

[Severity: High]
The function comment notes that SFP modules do not support interrupts. Howe=
ver,
when an SFP module is physically unplugged, the electrical link drops. Could
this link drop trigger the MAC interrupt being handled here?

If so, can this race with the concurrent SFP unplug worker and cause a
use-after-free?

The SFP unplug worker concurrently clears the pointer without RCU
synchronization:

drivers/net/phy/phylink.c:phylink_disconnect_phy() {
    ...
    pl->phydev =3D NULL;
    ...
}

And then immediately frees the PHY device:

drivers/net/phy/sfp.c:sfp_sm_phy_detach() {
    ...
    phy_device_free(sfp->mod_phy);
    ...
}

Because phylink_mac_interrupt() reads pl->phydev locklessly and without an
RCU read-side critical section, is it possible for the interrupt to fetch t=
he
pointer right before the worker frees it?

Additionally, does the lack of READ_ONCE() here allow the compiler to reload
pl->phydev after the if (phy) check, potentially causing a time-of-check to
time-of-use NULL pointer dereference?

> +}
> +EXPORT_SYMBOL_GPL(phylink_mac_interrupt);

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010-ax88179a-v=
19-0-7475173cfb56@birger-koblitz.de?part=3D1
