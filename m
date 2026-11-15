Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739916;
	b=NmIL1LiXe6WyCNVfIYpmHNj5UepSdOeJpLqkM8YoNGGcLNeaZ17FEmbzfwaZPvSfmb2L
	 OS7GD/7Ls1WbgW7aDFI9c8tCj/s/GAxQ+uK/ec6MTsoun0BQDiITl1m6sbbbU9AZXNU4P
	 6p0F7ek7eVs3ZfBxsdD8GhPondG/91CJy+s1e9Lodp6TXDwIuZy7l5bULuVE4lAmvupji
	 MDEHAmp4UZd5UlKxBRFkgIZvzfpHtasPNHrZU8WX5TBC3b1dhOizKyrkdRd9OD2RZ1orx
	 bkiTdswfVFxPtLevfDxNHdfJ9U1ZOmQ/R/Gr/FhhHw7JAfjd4/WUgFKaVIu0/t83orQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739916;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+wswVxuU4Ma+si7FZTUa60Za0Tti7rGbZM62yqlBz+g=;
	b=HUNTcZa7SSICGhc+tzZYqRKQarmbmRHXOCU/71EBRT9JHuqlXRW1vVwDzQlUkFwQMmFu
	 k4tpp0J9iUP0EDQPfsUla8sMxqOqAPp3+CoUB//7TOdLFlf73o88lnzGsF0QP42DE2Qom
	 XjNezX/Rsjnk3UjqSw8O6Emqrt2x6h+Np/fN7HrAQ5qBkwRG0N5Fl8ZPpcaSvJ+eMXyus
	 +oLtqAqQz4DCtXIhCS2d5D8L33nmeXA4qiLNkzIN7bVf5SLTgM0Q5q/j8GqhlMZDCv440
	 lmfSpwTz7fiHKREipr/nEksZmKzCzWhqXorRz8jN2wW5eH9ACM9SEftrqwzPA+VJtiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AqQwwEZO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C22606A32E
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 10:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AqQwwEZO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86A701F000C4;
	Sun, 15 Nov 2026 10:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739916;
	bh=+wswVxuU4Ma+si7FZTUa60Za0Tti7rGbZM62yqlBz+g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AqQwwEZO2GOxRQK+3kcCeBSKiqe0mjLy1pLLPHjbARoPA85uSKQZjhN/y0ONU6cYl
	 alB1gR6i525vz4boZlmHTe7HYrGMuK2yoVi+Iu3tVyaYxDYuTp/0EeEQsc5R8JAuFY
	 p1nlKKRXYmKoT1r3+2rhNNiNZj0go2u5hvq0qX+I7cwm18XZOhcMtOLoq5ToSzynlZ
	 Iavb8gTkuMZTFlaYO78CnBOA8YEoSEePGLd+8j5cbaMwbMPSgjs0Xpaa/J5nmGOYRR
	 j9lHFLSMqBF94C2wPqXn7jr+k6DY+AqX+h7SRLS749fDvvnHRlsON6rbD1sBiPQ4/k
	 l3d/FyyRQBSTQ==
Message-ID: <sashiko-outbox-215422@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v21 09/13] ax88179_178a: Add Suspend/resume
 support for AX88179A/772D/279
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261114-ax88179a-v21-9-c2d34410bcbe@birger-koblitz.de>
References: <20261114-ax88179a-v21-0-c2d34410bcbe@birger-koblitz.de>
 <20261114-ax88179a-v21-9-c2d34410bcbe@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 10:51:56 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [High] net: usb: ax88179_178a: PHY power-cycle in ax88179a_resume()
  breaks WoL resume
- [High] net: usb: ax88179_178a: missing MAC address restore in
  ax88179a_reset()
- [Medium] net: usb: ax88179_178a: ax88179a_resume() enables PHY and MAC
  when netdev down
- [Medium] net: usb: ax88179_178a: dropped error code in
  ax88179a_resume()
- [Medium] net: usb: ax88179_178a: unaligned u16 access in
  ax88179a_reset()
--

commit 5db223d1e5c5523038980ec1d7429f2d0d6d6dd9
Author: Birger Koblitz <mail@birger-koblitz.de>

ax88179_178a: Add Suspend/resume support for AX88179A/772D/279

This commit adds suspend and resume callbacks for AX88179A, AX88772D, and
AX88279 devices and dispatches USB driver suspend and resume calls through
per-device function pointers.

> diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179=
a_devices.c
> index a6b0a3f47118c..01d6a35f68b2c 100644
> --- a/drivers/net/usb/ax88179a_devices.c
> +++ b/drivers/net/usb/ax88179a_devices.c
[ ... ]
> @@ -126,6 +128,63 @@ static void ax88179a_status(struct usbnet *dev, stru=
ct urb *urb)
>  	phylink_mac_interrupt(data->phylink);
>  }
> =20
> +static int ax88179a_suspend(struct usb_interface *intf, pm_message_t mes=
sage)
> +{
> +	struct usbnet *dev =3D usb_get_intfdata(intf);
> +	struct ax88179_data *priv;
> +	u8 tmp8 =3D 0;
> +	u16 tmp16;
> +	int ret;
> +
> +	priv =3D dev->driver_priv;
> +	ax88179_set_pm_mode(dev, true);
> +
> +	if (netif_running(dev->net)) {
> +		rtnl_lock();
> +		phylink_suspend(priv->phylink, !!priv->wolopts);
> +		rtnl_unlock();
> +	}
[ ... ]
> +static int ax88179a_resume(struct usb_interface *intf)
> +{
> +	struct usbnet *dev =3D usb_get_intfdata(intf);
> +	struct ax88179_data *ax179_data;
> +	u8 reg8 =3D 0;
> +	int ret;
> +
> +	ax179_data =3D dev->driver_priv;
> +	ax88179_set_pm_mode(dev, true);
> +
> +	ret =3D ax88179_read_cmd(dev, AX88179A_PHY_POWER, 0, 0, 1, &reg8);
> +	if (ret < 0)
> +		goto err_out;
> +
> +	if (!(reg8 & AX_PHY_POWER)) {
> +		reg8 =3D AX_PHY_POWER;
> +		ax88179_write_cmd(dev, AX88179A_PHY_POWER, 0, 0, 1, &reg8);
> +		msleep(250);
> +	}
> +	ax88179_write_cmd(dev, AX_FW_MODE, AX_FW_MODE_179A, 0, 0, NULL);
> +
> +	/* Now, that AX_FW_MODE_179A is enabled, the PHY needs a power-cycle.
> +	 * PHY-power is re-enabled in ax88179a_reset()
> +	 */
> +	ax88179_write_u8(dev, AX88179A_PHY_POWER, 0, 0, 0);
> +	msleep(250);
> +
> +	ax88179a_reset(dev);

[Severity: High]
Does power-cycling the PHY in ax88179a_resume() break resume when
Wake-on-LAN is enabled?

When priv->wolopts is non-zero, phylink_suspend(priv->phylink, true) sets
PHYLINK_DISABLE_MAC_WOL and leaves the PHY running instead of calling
phylink_stop().  ax88179a_resume() then writes 0 to AX88179A_PHY_POWER and
calls ax88179a_reset(), which wipes all volatile PHY registers, drops the
physical link, and skips phylink_start() because ax179_data->in_pm is set.
When phylink_resume() runs next, it sees PHYLINK_DISABLE_MAC_WOL and takes
the MAC WoL branch instead of calling phylink_start() -> phy_start():

drivers/net/phy/phylink.c:phylink_resume() {
    ...
	if (test_bit(PHYLINK_DISABLE_MAC_WOL, &pl->phylink_disable_state)) {
		...
		phylink_mac_initial_config(pl, true);

		/* Re-enable and re-resolve the link parameters */
		phylink_enable_and_run_resolve(pl, PHYLINK_DISABLE_MAC_WOL);
	} else {
		phylink_start(pl);
	}
}

Because phy_start() is never called after the PHY power-cycle, phylib never
re-runs phy_config_aneg() to restore user-configured link modes, EEE, or
AX88279 2.5G advertisement, and phylink_resolve() immediately reports
carrier on from the stale pre-suspend pl->phy_state.link while the reset
PHY is still down.

[Severity: Medium]
Does calling ax88179a_reset() unconditionally in ax88179a_resume() power on
the PHY and enable MAC receive even when the interface is down?

When !netif_running(dev->net), the PHY was suspended or powered off by
ax88179a_init_phy() or ax88179a_stop().  Running ax88179a_reset() during
resume writes AX_PHY_POWER to AX88179A_PHY_POWER (clearing BMCR_PDOWN in
the freshly power-cycled PHY while phydev->suspended remains true in
software) and enables AX_RX_CTL_START and AX_MEDIUM_RECEIVE_EN, leaving the
link and receiver active while the interface is administratively down.

> +
> +err_out:
> +	if (netif_running(dev->net)) {
> +		rtnl_lock();
> +		phylink_resume(ax179_data->phylink);
> +		rtnl_unlock();
> +	}
> +
> +	ax88179_set_pm_mode(dev, false);
> +
> +	return usbnet_resume(intf);
> +}

[Severity: Medium]
When ax88179_read_cmd() fails in ax88179a_resume() and jumps to err_out,
does returning usbnet_resume(intf) discard the negative error code in ret
and resume phylink on uninitialized hardware?

[ ... ]

> @@ -1055,9 +1166,13 @@ static int ax88179a_reset(struct usbnet *dev)
>  	ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_MAC_SWP_CTRL, 1, 0);
>  	ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_MAC_TX_HDR_CKSUM, 1, 0);
> =20
> -	/* Read MAC address from DTB or asix chip */
> -	ax88179_get_mac_addr(dev);
> -	memcpy(dev->net->perm_addr, dev->net->dev_addr, ETH_ALEN);
> +	/* Read MAC address from DTB or asix chip, except when called
> +	 * from resume context.
> +	 */
> +	if (!ax179_data->in_pm) {
> +		ax88179_get_mac_addr(dev);
> +		memcpy(dev->net->perm_addr, dev->net->dev_addr, ETH_ALEN);
> +	}

[Severity: High]
When ax88179a_reset() is called from ax88179a_resume() with
ax179_data->in_pm set, does skipping ax88179_get_mac_addr() leave the
AX_NODE_ID register unprogrammed if the chip was reset or lost power?

ax88179_get_mac_addr() is the only place in the reset path that writes
dev->net->dev_addr to AX_NODE_ID.  Without an else branch writing
dev->net->dev_addr to AX_NODE_ID during resume, a custom, Device Tree, or
random fallback MAC address is lost in hardware after reset_resume or a
power-loss suspend, causing the unicast filter (AX_RX_CTL_AP) to drop
frames for dev->net->dev_addr.

[Severity: Medium]
In ax88179a_reset(), which is now also called from ax88179a_resume(), can
dereferencing tmp16 fault on architectures that trap unaligned accesses?

ax88179a_reset() aliases tmp16 to a 1-byte-aligned stack array (u8 buf[5])
and dereferences it as a u16 when writing AX_MEDIUM_STATUS_MODE:

drivers/net/usb/ax88179a_devices.c:ax88179a_reset() {
	struct ax88179_data *ax179_data =3D dev->driver_priv;
	u16 *tmp16;
	u8 buf[5];
	u16 rxctl;
	u8 *tmp;

	tmp16 =3D (u16 *)buf;
    ...
	*tmp16 =3D AX_MEDIUM_RECEIVE_EN | AX_MEDIUM_TXFLOW_CTRLEN |
		 AX_MEDIUM_RXFLOW_CTRLEN | AX_MEDIUM_FULL_DUPLEX;
	if (!ax179_data->is_ax88772d)
		*tmp16 |=3D AX_MEDIUM_GIGAMODE;
	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE, 2, 2, tmp16);
    ...
}

Using a u16 local variable or ax88179_write_u16() would avoid the unaligned
access.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-ax88179a-v=
21-0-c2d34410bcbe@birger-koblitz.de?part=3D9
