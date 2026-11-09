Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794247326;
	b=NMh+wQaiEUY4n07aBvoH2iXwfOc1yGYc0YNoHhIrt7Pp4SZeirRK+Lh5a3vb5gH3p0ve
	 eqikKMEjlGM9gDQp7Ri1xCJnIWYVh4R3wPSVN6rPWWitEzdaGL6P4GYHNdiWI3wQGeMze
	 qQJnh8E6IKKZxpqW83tqaK/5ItOgGL/tQuPUQ4DiZsB1ukVTWVgksP7PBRRTrF8uV6u7c
	 UZoAOL0IZ8xKPM0c5BBTf0eI+n3aqE3EZWO2A8kYAn7oGnsVZNmKbYSULBK4j1rl7B6R2
	 DMCzMoOFoAVXVIIOGGt97SAC/ZmHLlZB5SOIjjz4CRXoaRs+EU37sUKzzgDF7hImmFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794247326;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Uk7OojTGo2t3Bzb8xgre/so9JJ7xwQk+dP6u4vmmeuA=;
	b=ucsxXRMCIgLQFklGG9plJAlvSgsMJ3PsZIj7bb0Wf9OQwEjfQ9yTFXqYDxNmMMxNyWED
	 RScmzFfrKYQEzIWd9UHFpF2jaH5UkaxBOpKR9nw0RBUd+tDBZ2jFc2YKwQOY1SXpqxKia
	 21WIs41k7qrPgsKNA4rbauef+M9wmC6lZRgvfpOdiouw/hiBcAiV3f9m05z3YGcUAa7xi
	 QwvTUZyHczKjBTSCn8NFFdbOs3ElE+4rzgqRfGzP8EuLUmHlN8wXbbkzl4sAEsKYRn3qQ
	 EZ+rTW1GozvoY16EdLIxIMFLMnQcWfJQXwPQPoUbmoU0hpSPUAHFJCgnRTw+9pAN41g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IWWK+3Ur;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28283606A321
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 18:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IWWK+3Ur
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA2C91F0089F;
	Mon,  9 Nov 2026 18:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794247326;
	bh=Uk7OojTGo2t3Bzb8xgre/so9JJ7xwQk+dP6u4vmmeuA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IWWK+3UrtaeR9XPmAdGP1WU5nwfQU3uWGKm/6DH9IiVF4FDqbPxJrUet8dyURUGRp
	 XjO2ycfNRSdLGiOYzVENa6ndZmoAiW/hgmsw7w4jLz4/kZKpAqN+EeVL7OVNsp3wBu
	 s6I4CtZJXuO0wCLQgJl+wCFnZpLlozWAKvj3A0UjzUEibyC8HUoveqO7Yu2q8GB4IB
	 BdM6S/vTEtl0VxE6q1YHqRfGqgUlGSDV0FfjhPG8d22jfNBHfPC5NAJpzfDgHXvliK
	 biWgBWP6guKbLvLliMX1Y8MLqFEhXJxu8n5u/rPqoDoGUNtJReNtJP++V4JBOee+4G
	 UxmnEzgmkrmDg==
Message-ID: <sashiko-outbox-205365@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next] net: usb: lan78xx: use phylink for Wake-on-LAN
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prashant Sengar" <prashantsengar25031@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261108180137.3488023-1-prashantsengar25031@gmail.com>
References: <20261108180137.3488023-1-prashantsengar25031@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 18:02:05 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] net: usb: lan78xx: phylink MAC WoL breaks suspend and
  lan78xx_resume()
- [Medium] net: usb: lan78xx: missing WAKE_PHY in
  lan78xx_phylink_setup() breaks PHY WoL
- [Medium] net: usb: lan78xx: pdata->wol overwrite conflicts with
  phylink PHY WoL
- [Medium] net: usb: lan78xx: inconsistent WoL state in lan78xx_probe()
  and lan78xx_set_wol()
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [High] net: usb: lan78xx: missing rtnl_lock() in lan78xx_phy_uninit()
  [1]
--

commit 2aa41b74c1faf1ee028bdb9727321bf174890b23
Author: Prashant Sengar <prashantsengar25031@gmail.com>

net: usb: lan78xx: use phylink for Wake-on-LAN

This commit converts lan78xx Wake-on-LAN handling to use phylink helpers
and adds a phylink .mac_wol_set callback so MAC-based Wake-on-LAN can be
configured with or without an attached PHY.

> diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
> index d73002b2c21ac..7d67dd150271b 100644
> --- a/drivers/net/usb/lan78xx.c
> +++ b/drivers/net/usb/lan78xx.c
[ ... ]
> @@ -1799,25 +1791,45 @@ static int lan78xx_set_wol(struct net_device *net=
dev,
>  {
>  	struct lan78xx_net *dev =3D netdev_priv(netdev);
>  	struct lan78xx_priv *pdata =3D (struct lan78xx_priv *)(dev->data[0]);
> +	struct ethtool_wolinfo actual =3D { .cmd =3D ETHTOOL_GWOL };
> +	bool old_wakeup, enable;
> +	int rollback_ret;
>  	int ret;
> =20
>  	if (wol->wolopts & ~WAKE_ALL)
>  		return -EINVAL;
> =20
> -	if (!netdev->phydev)
> -		return -EOPNOTSUPP;
> -
>  	ret =3D usb_autopm_get_interface(dev->intf);
>  	if (ret < 0)
>  		return ret;
> =20
> -	pdata->wol =3D wol->wolopts;
> -
> -	ret =3D device_set_wakeup_enable(&dev->udev->dev, (bool)wol->wolopts);
> -	if (ret < 0)
> +	phylink_ethtool_get_wol(dev->phylink, &actual);
> +	if (wol->wolopts & ~actual.supported) {
> +		ret =3D -EINVAL;
>  		goto exit_pm_put;
> +	}
> +
> +	old_wakeup =3D device_may_wakeup(&dev->udev->dev);
> +	enable =3D !!wol->wolopts;
> =20
> -	ret =3D phy_ethtool_set_wol(netdev->phydev, wol);
> +	if (old_wakeup !=3D enable) {
> +		ret =3D device_set_wakeup_enable(&dev->udev->dev, enable);
> +		if (ret < 0)
> +			goto exit_pm_put;
> +	}
> +
> +	ret =3D phylink_ethtool_set_wol(dev->phylink, wol);
> +	if (ret < 0) {
> +		if (old_wakeup !=3D enable) {
> +			rollback_ret =3D device_set_wakeup_enable(&dev->udev->dev, old_wakeup=
);
> +			if (rollback_ret)
> +				netdev_warn(dev->net, "USB wakeup rollback failed: %d\n",
> +					    rollback_ret);
> +		}
> +		goto exit_pm_put;
> +	}
> +	phylink_ethtool_get_wol(dev->phylink, &actual);
> +	pdata->wol =3D actual.wolopts;

[Severity: Medium]
Does overwriting pdata->wol with actual.wolopts here (and in
lan78xx_probe()) desynchronize pdata->wol from phylink's pl->wolopts_mac
when an attached PHY handles Wake-on-LAN?

With pc->wol_phy_legacy set, phylink_ethtool_set_wol() first passes the
requested options to phy_ethtool_set_wol() and strips any bits reported by
phy_ethtool_get_wol() before calling lan78xx_mac_wol_set() and recording
pl->wolopts_mac.  On a LAN7801 with an external RGMII PHY whose driver
implements .set_wol and .get_wol for WAKE_MAGIC, phylink delegates
WAKE_MAGIC to the PHY and sets pl->wolopts_mac to 0, but reading back
phylink_ethtool_get_wol() overwrites pdata->wol with the combined PHY+MAC
mask (WAKE_MAGIC).  On suspend, phylink_suspend() then sees
pl->wolopts_mac =3D=3D 0 and stops the MAC via phylink_stop(), while
lan78xx_set_suspend() programs WUCSR_MPEN_ on the stopped MAC without
enabling PMT_CTL_PHY_WAKE_EN_ for the PHY wakeup interrupt.

In addition, checking wol->wolopts & ~WAKE_ALL at the top of
lan78xx_set_wol() rejects PHY-supported modes outside WAKE_ALL (such as
WAKE_MAGICSECURE or WAKE_FILTER) even when lan78xx_get_wol() advertises
them via phylink_ethtool_get_wol().

> @@ -2617,12 +2629,24 @@ static int lan78xx_mac_enable_tx_lpi(struct phyli=
nk_config *config, u32 timer,
>  	return lan78xx_mac_eee_enable(dev, true);
>  }
> =20
> +static int lan78xx_mac_wol_set(struct phylink_config *config,
> +			       u32 wolopts, const u8 *sopass)
> +{
> +	struct lan78xx_net *dev =3D netdev_priv(to_net_dev(config->dev));
> +	struct lan78xx_priv *pdata =3D (struct lan78xx_priv *)dev->data[0];
> +
> +	pdata->wol =3D wolopts;
> +
> +	return 0;
> +}
> +
>  static const struct phylink_mac_ops lan78xx_phylink_mac_ops =3D {
>  	.mac_config =3D lan78xx_mac_config,
>  	.mac_link_down =3D lan78xx_mac_link_down,
>  	.mac_link_up =3D lan78xx_mac_link_up,
>  	.mac_disable_tx_lpi =3D lan78xx_mac_disable_tx_lpi,
>  	.mac_enable_tx_lpi =3D lan78xx_mac_enable_tx_lpi,
> +	.mac_wol_set =3D lan78xx_mac_wol_set,
>  };

[Severity: High]
Does populating .mac_wol_set break link recovery across lan78xx_suspend()
and lan78xx_resume()?

Once .mac_wol_set is implemented, phylink_mac_supports_wol() returns true
and phylink_suspend() ignores its mac_wol parameter in favor of
!!pl->wolopts_mac:

drivers/net/phy/phylink.c:phylink_suspend() {
	ASSERT_RTNL();

	if (phylink_mac_supports_wol(pl))
		mac_wol =3D !!pl->wolopts_mac;

	if (mac_wol) {
		/* Wake-on-Lan enabled, MAC handling */
		mutex_lock(&pl->state_mutex);
		/* Stop theWatchdog, but keep link up */
		__set_bit(PHYLINK_DISABLE_MAC_WOL, &pl->phylink_disable_state);
		mutex_unlock(&pl->state_mutex);

		netif_carrier_off(pl->netdev);
	} else {
		phylink_stop(pl);
	}
}

Because lan78xx_probe() enables WAKE_MAGIC by default, phylink_suspend() in
lan78xx_suspend() (which runs on both runtime autosuspend after the 10s
idle delay and system suspend) now sets PHYLINK_DISABLE_MAC_WOL and drops
carrier instead of calling phylink_stop().  However, lan78xx_resume() never
calls phylink_resume() (only lan78xx_reset_resume() does), and
PHYLINK_DISABLE_MAC_WOL is only cleared by phylink_resume().  After the
first runtime autoresume or non-reset system resume, PHYLINK_DISABLE_MAC_WOL
remains permanently set, leaving carrier off, dropping deferred TX packets
in lan78xx_submit_deferred_urbs(), and preventing phylink_resolve() from
bringing the link back up even if the interface is cycled through
lan78xx_stop() and lan78xx_open().

Skipping phylink_stop() during lan78xx_suspend() also leaves the phylib
state machine running in PHY_POLL mode on LAN7800/LAN7850 (since
pc->mac_managed_pm is true), so phy_state_machine() fires 1 second into USB
runtime autosuspend and calls lan78xx_mdiobus_read() ->
usb_autopm_get_interface(), waking the device back up.

> @@ -2848,6 +2872,10 @@ static int lan78xx_phylink_setup(struct lan78xx_ne=
t *dev)
>  	       dev->phylink_config.supported_interfaces,
>  	       sizeof(dev->phylink_config.lpi_interfaces));
> =20
> +	pc->wol_mac_support =3D WAKE_MAGIC | WAKE_UCAST | WAKE_BCAST |
> +		      WAKE_MCAST | WAKE_ARP;
> +	pc->wol_phy_legacy =3D true;
> +
>  	phylink =3D phylink_create(pc, dev->net->dev.fwnode,
>  				 dev->interface, &lan78xx_phylink_mac_ops);

[Severity: Medium]
Does omitting WAKE_PHY from pc->wol_mac_support regress link-change
Wake-on-LAN on LAN7800 and LAN7850?

Previously lan78xx_get_wol() advertised WAKE_ALL and lan78xx_set_wol()
accepted WAKE_PHY, which lan78xx_set_suspend() uses to program
PMT_CTL_PHY_WAKE_EN_ in the MAC's PMT_CTL register.  The integrated PHY on
LAN7800 and LAN7850 uses the Microchip LAN88xx driver
(drivers/net/phy/microchip.c), which implements .set_wol =3D lan88xx_set_wol
but does not implement .get_wol.  Because phy_ethtool_get_wol() leaves
wol->supported untouched when .get_wol is NULL, phylink_ethtool_get_wol()
only reports pc->wol_mac_support, so WAKE_PHY is no longer advertised by
lan78xx_get_wol() and is rejected with -EINVAL by lan78xx_set_wol().

[ ... ]

> @@ -4803,6 +4835,24 @@ static int lan78xx_probe(struct usb_interface *int=
f,
>  	if (ret < 0)
>  		goto free_urbs;
> =20
> +	/* Preserve the default magic-packet wakeup configuration. */
> +	rtnl_lock();
> +
> +	ret =3D phylink_ethtool_set_wol(dev->phylink, &wol);
> +	if (!ret) {
> +		struct lan78xx_priv *pdata =3D (struct lan78xx_priv *)dev->data[0];
> +
> +		wol.cmd =3D ETHTOOL_GWOL;
> +		phylink_ethtool_get_wol(dev->phylink, &wol);
> +		pdata->wol =3D wol.wolopts;
> +		netdev->ethtool->wol_enabled =3D !!wol.wolopts;
> +	}
> +
> +	rtnl_unlock();
> +
> +	if (ret)
> +		netdev_warn(netdev, "failed to initialize WoL: %d\n", ret);
> +
>  	ret =3D register_netdev(netdev);

[Severity: Medium]
Can this leave the driver's Wake-on-LAN state inconsistent with the
hardware and USB wakeup settings?

First, lan78xx_bind() pre-sets pdata->wol =3D WAKE_MAGIC, and after
register_netdev() succeeds, lan78xx_probe() unconditionally calls
device_set_wakeup_enable(&udev->dev, true).  If phylink_ethtool_set_wol()
fails here, phylink and netdev->ethtool->wol_enabled treat WoL as disabled,
while pdata->wol remains WAKE_MAGIC and udev->dev wakeup is still enabled;
calling device_set_wakeup_enable() after register_netdev() also races with
userspace changing WoL immediately after netdev registration.

Second, lan78xx_get_wol() checks USB_CFG_RMT_WKP_ in USB_CFG0 and reports
wol->supported =3D 0 and wol->wolopts =3D 0 when clear, but neither
lan78xx_probe() nor lan78xx_set_wol() checks USB_CFG_RMT_WKP_.  When
USB_CFG_RMT_WKP_ is not set, lan78xx_probe() and lan78xx_set_wol() still
enable WoL in phylink, pdata->wol, and udev->dev while lan78xx_get_wol()
reports WoL as unsupported and disabled.

[Severity: High]
This problem wasn't introduced by this patch, but if register_netdev()
fails right below (or if lan78xx_phy_init() fails after
lan78xx_phylink_setup()), the error path calls lan78xx_phy_uninit() ->
phylink_disconnect_phy() without holding rtnl_lock() [1], triggering
ASSERT_RTNL() in phylink_disconnect_phy().

[1] https://sashiko.dev/#/bug/linux-f22d0679-ab9c-4543-b756-3c93ec69c79d

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108180137.3488=
023-1-prashantsengar25031@gmail.com?part=3D1
