Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AAD32B121
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 03:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791342343; cv=none; b=ruIeA1tAlzRqx1/+CZI6PKALnGtSxaYn3eVnUVXumFk1KmohaqAu82xaK7t+F3MjolwlCvykzKotKfWjN68fpW2krafP+Yv8HLgN8iAkEPW8PvA6K47b5snoG+arCdU0ihMvGDLInCy3zi/tJDFQH8o3nYqNi/ProgOE6NxCSZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791342343; c=relaxed/simple;
	bh=Kh3XVPRljRPNBQBBhEwBhvkM8Q6nkLaJP05vvTAIhiI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=AvolmzJIDbns7vWE5I+T0reAdIEIGJauv33LZtiDJX81VMP91kvyijvbvaWnf3FqCV81PYB/Tt+GMaByMKpbXPpTgIWnCHKCU5KAg95RRODbwxPWvS+aAQvTOXTc4JqC9R9R5xraYdvjx8IFeDeUTrPpkH1Xhv/x4Bvys6CnkrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gsV3o/Kg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gsV3o/Kg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B150B1F0089C;
	Wed,  7 Oct 2026 03:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791342342;
	bh=r5gkRJuOE919RKVKbjH6Py1Udgmv5IOwmPFsPJ9S0HA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gsV3o/KgAhtncEhuGDoqZ+EdhDsTBx52a/4MpfDQk9A/NTI4nnw5liWZMlsX/mt2u
	 yQk1DewY8FbptKmuwLCZyxnZOJQ3VMOLDWrulw1zK5zsXfn7Sk+BLI3kJZh/0TK0d7
	 iyiylYIl2ppnpugQJzxmdGS00lcR5Ld+3XD2ezj2dbqiqE2mCgs9VKI3vM5XRABt2T
	 D5Le9LkavLeKZ30faU1g3o7pww1zJRmCZDPsfNY2ORa+QKI2c9RYLTx/p7EImVW5xU
	 Az42C7pE5oPYSiD17VDa6INOm7Wo1teYGtsg8Lgp+ixHyWQ2UrBgkkV0vKZlSOLxt1
	 9h8L9AAaPD66A==
Message-ID: <sashiko-outbox-162605@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v17 01/13] phylink: Add phylink_mac_interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261006-ax88179a-v17-1-252814fe35ea@birger-koblitz.de>
References: <20261006-ax88179a-v17-0-252814fe35ea@birger-koblitz.de>
 <20261006-ax88179a-v17-1-252814fe35ea@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 03:05:42 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] phylink: Use-After-Free in phylink_mac_interrupt() on SFP unplug
--

commit 30d7b430d60b3d4dc2e6d650aaf0ceaacfbadbce
Author: Birger Koblitz <mail@birger-koblitz.de>

phylink: Add phylink_mac_interrupt

This commit adds the phylink_mac_interrupt() function to phylink, allowing
MAC drivers to pass link-change interrupts directly to phylib instead of
relying on polling.

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
Can this sequence lead to a use-after-free if an SFP module is unplugged
concurrently?

The docstring mentions that SFP modules do not support interrupts, but if a
MAC driver detects a Loss of Signal and calls phylink_mac_interrupt(),
couldn't the SFP subsystem concurrently detect the unplug and trigger
phylink_disconnect_phy()?

If that happens, phylink_disconnect_phy() takes phydev_mutex, clears
pl->phydev, and calls phy_disconnect() which drops the object reference and
frees the phy_device.

Since pl->phydev is read locklessly here, is it possible for
phylink_mac_interrupt() to read a non-NULL pointer, but hand it to
phy_mac_interrupt() after it has been freed?

CPU1 (SFP unplug)                 CPU2 (MAC Interrupt)
phylink_disconnect_phy()
  mutex_lock(&pl->phydev_mutex)
  phy =3D pl->phydev
  pl->phydev =3D NULL
  phy_disconnect(phy)
                                  phy =3D pl->phydev; (Reads old pointer)
    phy_detach()
      phy_device_free()
                                  if (phy)
                                    phy_mac_interrupt(phy)
                                      phy_trigger_machine(phy)
                                        mod_delayed_work(...)

This could then cause list corruption when phy_trigger_machine() queues work
on the freed phydev->state_queue.

> +}
> +EXPORT_SYMBOL_GPL(phylink_mac_interrupt);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006-ax88179a-v=
17-0-252814fe35ea@birger-koblitz.de?part=3D1
