Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794036115;
	b=YxDSCS+R1S44SyJnb5P3+46Kc+2WWIgIoEInU1w4XR2s1FGCnTbn7P0gpWdozl+zulMg
	 QneGGofdf/o4htFTmT3HyKFh0VXLlBBDDx8pybIR0niefLwl1YxiP12SM/+AhEVDultNK
	 fASNOOWgTcnhejZr2lb9/qLMxU7TcIBonV21sc4UsW63hoJnKs+778DSmZuhZxaaUctmn
	 iUVDrTvHhjy4CqGgHQwyzW7plrHQmhg7G8Su4ilT5rEXqoq2tLUyoLQ9UBcfYLJgOAfxW
	 deTaVTRr3wRYhR/rOOvPHqztBOTq0EII/W/xSd5iAhGJp9cMgTfKtJqG2aySMYxg7ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794036115;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=y5izU1GVHVnbrglkF5GAxFx5RuGKoxnmHqkgFB3zC7E=;
	b=VG9jKAm4cVYM5xVAxRPfjmDHZf4IDdUkLWP+rJJH5IbmJ1B9FoCLk64XdhsVnixzZX9f
	 MaH8M61lhmvDi+Ad8m7qfpfcaLNtv1l7f3OtPbtSBFM280a3ZRI38z2HuOihBEO6xvYRV
	 w3qsn+rHkyfAsE6CgtOtDX6FO30Jw1SsgQClS7e7s87XFbw/dnCNSUvkhPWfXEoMrWst8
	 x2Uz28yAK+MhcCTG9wx539k2VsYRoxYUOM4LhgaPt71q1W8O/f4nPApm4IiTApfkUkYbQ
	 gg/EYm90P49vGeXrxemdFEFvyLh1wrCYPiSCuDFN/cyLAU1N2Tup3zGPebbI7zqeJaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oORjM7Cx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4E6606A32D
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 07:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oORjM7Cx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C6DF1F0089F;
	Sat,  7 Nov 2026 07:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794036114;
	bh=y5izU1GVHVnbrglkF5GAxFx5RuGKoxnmHqkgFB3zC7E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oORjM7CxJrsjUgOA/NHHHNK9m23YE5eroVqs7Hp7ckLGTFyqTp14GFTAvGh/t6XBQ
	 lngmXbpQw/opa3j3yhx72ogaLhMPQe2bWELNZZQZ+uGVDZb+eF+tQ7TjAhGuhPQpqq
	 zz7O9ahRqyudyyJb3M2jEGJZn5JHLTqxMwNkhn9xMtwZ/R8HYc2I05MN2YbFgU+QKy
	 lvWrZx/kjIqnt/NAEmHKgkPq5+q9jJKiDeF4VYEw/B4tHda8W6HXIK6A4mWyRphTIt
	 WBeStGXfziYSFGs+wIqeIqIpPd1jAQ+W4Hu9KVlh6q0CHuDio7sojCyQRfQ7Of9T9U
	 HdB1jkenOvkzA==
Message-ID: <sashiko-outbox-202699@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v20 09/13] ax88179_178a: Add Suspend/resume
 support for AX88179A/772D/279
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-ax88179a-v20-9-37b5a1189983@birger-koblitz.de>
References: <20261106-ax88179a-v20-0-37b5a1189983@birger-koblitz.de>
 <20261106-ax88179a-v20-9-37b5a1189983@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 07:21:54 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential
issues to consider:
- [High] net: usb: ax88179_178a: missing MAC address restore in
  ax88179a_reset()
- [High] net: usb: ax88179_178a: PHY power-cycle in ax88179a_resume()
  breaks WoL resume
- [Medium] net: usb: ax88179_178a: ax88179a_resume() powers on PHY and
  MAC when netdev down
- [Medium] net: usb: ax88179_178a: unchecked register reads in
  ax88179a_suspend()
- [Medium] net: usb: ax88179_178a: dropped error code in
  ax88179a_resume()
- [Medium] net: usb: ax88179_178a: unaligned u16 access in
  ax88179a_reset()
--

commit eccf6abb4371963954aebdd41a868bdc880dd767
Author: Birger Koblitz <mail@birger-koblitz.de>

ax88179_178a: Add Suspend/resume support for AX88179A/772D/279

This commit adds suspend and resume callbacks for AX88179A, AX88772D, and
AX88279 devices and dispatches USB power management operations through
per-device wrapper callbacks in ax88179_lib.

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
> +
> +	ret =3D usbnet_suspend(intf, message);
> +	if (ret && netif_running(dev->net)) {
> +		rtnl_lock();
> +		phylink_resume(priv->phylink);
> +		rtnl_unlock();
> +		ax88179_set_pm_mode(dev, false);
> +		return ret;
> +	}
> +
> +	/* Enable WoL */
> +	if (priv->wolopts) {
> +		ax88179_read_cmd(dev, AX_ACCESS_MAC, AX_MONITOR_MOD, 1, 1, &tmp8);
> +		tmp8 &=3D ~(AX_MONITOR_MODE_RWLC | AX_MONITOR_MODE_RWMP);
> +		if (priv->wolopts & WAKE_PHY)
> +			tmp8 |=3D AX_MONITOR_MODE_RWLC;
> +		if (priv->wolopts & WAKE_MAGIC)
> +			tmp8 |=3D AX_MONITOR_MODE_RWMP;
> +
> +		ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_MONITOR_MOD, 1, 1, &tmp8);
> +
> +		ax88179_read_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE, 2, 2, &tmp=
16);
> +		tmp16 |=3D AX_MEDIUM_RECEIVE_EN;
> +		ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE, 2, 2, &tm=
p16);

[Severity: Medium]
What happens if either ax88179_read_cmd() call fails here?  On a read error,
tmp8 remains 0 and ax88179_read_cmd() zeroes tmp16, so the subsequent
ax88179_write_cmd() calls overwrite AX_MONITOR_MOD and AX_MEDIUM_STATUS_MODE
with zeroed base values and clear the active medium configuration bits.

[ ... ]
> @@ -135,6 +194,47 @@ static int ax88179a_auto_detach(struct usbnet *dev)
>  	return 0;
>  }
> =20
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

[Severity: Medium]
Does ax88179a_reset() perform unaligned u16 accesses through tmp16?

drivers/net/usb/ax88179a_devices.c:ax88179a_reset() {
	...
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

buf is a 1-byte-aligned u8 array on the stack, so dereferencing tmp16 in
ax88179a_reset() and inside ax88179_write_cmd() can fault on architectures
that trap on unaligned accesses.  Using separate u8 and u16 stack variables
(or ax88179_write_u16()) avoids aliasing buf.

> +
> +err_out:
> +	if (netif_running(dev->net)) {
> +		rtnl_lock();
> +		phylink_resume(ax179_data->phylink);
> +		rtnl_unlock();
> +	}

[Severity: Medium]
When the interface is administratively down (!netif_running(dev->net)), does
ax88179a_resume() leave the PHY powered on and the MAC receiver enabled?

When the interface is down, ax88179a_init_phy() or ax88179a_stop() leaves
the PHY suspended/powered off and AX_MEDIUM_RECEIVE_EN and AX_RX_CTL
cleared.  Calling ax88179a_reset() unconditionally during resume sets
AX_PHY_POWER, starts AX_RX_CTL, and enables AX_MEDIUM_RECEIVE_EN, so the
hardware stays powered on and brings up the physical link while the netdev
is down.

> +
> +	ax88179_set_pm_mode(dev, false);
> +
> +	return usbnet_resume(intf);
> +}

[Severity: Medium]
Does jumping to err_out when reading AX88179A_PHY_POWER fails drop the error
code in ret?  err_out skips hardware initialization and ax88179a_reset(),
but returns usbnet_resume(intf) (which returns 0), reporting a successful
resume to the USB core while the device remains uninitialized.

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
When ax179_data->in_pm is true, does skipping ax88179_get_mac_addr() leave
the hardware AX_NODE_ID register unprogrammed after resume or reset_resume?

ax88179_get_mac_addr() is also what writes dev->net->dev_addr to AX_NODE_ID:

drivers/net/usb/ax88179_lib.c:ax88179_get_mac_addr() {
	...
	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_NODE_ID, ETH_ALEN, ETH_ALEN,
			  dev->net->dev_addr);
}

If the chip loses power during suspend or goes through reset_resume, any MAC
address set via ax88179_set_mac_addr(), read from Device Tree, or generated
randomly is lost in AX_NODE_ID, causing the hardware unicast filter
(AX_RX_CTL_AP) to drop incoming unicast frames.  Should an else branch write
dev->net->dev_addr to AX_NODE_ID when ax179_data->in_pm is true?

[ ... ]
> @@ -1117,7 +1232,11 @@ static int ax88179a_reset(struct usbnet *dev)
>  	/* Ensure EEE state is off, consistent with phylink setup */
>  	ax88179_write_cmd(dev, AX_GPHY_CTL, AX_GPHY_EEE_CTRL, false, 0, NULL);
> =20
> -	phylink_start(ax179_data->phylink);
> +	/* ax88179a_reset() may also be called from resume context,
> +	 * phylink_resume() will start phylink, then.
> +	 */
> +	if (!ax179_data->in_pm)
> +		phylink_start(ax179_data->phylink);

[Severity: High]
When Wake-on-LAN is enabled, does phylink_resume() actually call
phylink_start() after ax88179a_resume() power-cycles the PHY?

In ax88179a_suspend(), calling phylink_suspend(priv->phylink,
!!priv->wolopts) with WoL enabled sets PHYLINK_DISABLE_MAC_WOL and does not
call phylink_stop() or phy_stop().  On resume, ax88179a_resume()
unconditionally power-cycles the PHY (wiping volatile PHY registers and
dropping the physical link), but phylink_resume() takes the
PHYLINK_DISABLE_MAC_WOL branch instead of calling phylink_start():

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

Because phy_start() is not called on that path, phylib does not reprogram
advertised link modes or EEE settings into the freshly reset PHY, and
phylink_resolve() immediately restores carrier using the stale pre-suspend
phy_state.link while the PHY link is down.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-ax88179a-v=
20-0-37b5a1189983@birger-koblitz.de?part=3D9
