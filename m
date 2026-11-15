Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739913;
	b=chmZmRJ8Uf1rINRtfUtf7eN369FRv2fbDLgK434jWGssql0iUwrBSFby4bkXW8to4hGO
	 kxhX/HLpyrVkczaTu2mpCFAdlbneEnSLUIGmcfblstpJmCJfKMLHBvs2d80ooJIQtAFxz
	 kN6Ke45rilwhUiod4ANK7ujr0vFIw5z4KCdTe8XN0P6v7zPUAH4mon7K7pOgV0iV8P/ub
	 KWqjXvZM4Hiqb66KA8gX40NoU4qdqbpjeV1pDJ+jgbGSqFpaCt+BaqFTwNjh9EK3FgVuJ
	 h8UWND6SxbK3lqD20EnyrdgQ1uWolFNEKy8/xPvrn0CiLNgt9OSnINbTZJ1zzWsxapA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739913;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BGoJOTUj1TEjcw++sUMJoW6v84cpo1qWn4CzfFDw5Hw=;
	b=HAgg4EFmwEJG6ZToIKW+JwDVo1ZZSYHHakU+forXDpIekEeWRaZlWg7fl+6cier8HYqv
	 aZiJN6mebWz6fnuZJrK/0cppMnpRnQxdWNQDeeS2BxXyHfW5+Rpy6DV9N6eElYE9Eiopc
	 CBtbA9PGWMzpF64h3gqbY+LOtVj4lWVbo8HmiKbXupqofXRgc+3gmOyPTxxI+ERT1lusK
	 dOSXz03Z+ZwvEejGvm9VXSorODoRZ1D0sc9tIHRcmKp8GhixfK8VQHSnWejj+0VDEzBRa
	 j89l+FBDB5K33A3dO+QCikKocb/eV8UAyuWWMs48T5LhGUYnx7VOApAWIjLi+hSkRuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CVMTPTpn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A34606A338
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 10:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CVMTPTpn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 479E61F000C4;
	Sun, 15 Nov 2026 10:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739913;
	bh=BGoJOTUj1TEjcw++sUMJoW6v84cpo1qWn4CzfFDw5Hw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CVMTPTpnmINoUiFtFNe+GQ6EpjTFqyZXCiSrIa2JNfEe25wXfabR7uLVXH42acni2
	 SOHSDOIJpUYyPd3gkMaTEXbVIdmbacuBFqQg7SsjaQ/1STzI6FQ7rKqASg3eGcBR1m
	 c9xPoGdiGpESmCCYZZWbhneM1VUwauCY0EL10XNhb39aPt2csa3JnBmjF6uW4Z79gk
	 Yag7VrfsPQcWVkVMZCLbO4yorKR4H8ivvM9oxGLtvwchGZUwfwTJnFWaTOhaPkQqcz
	 X7Sy7sioyHgp3IHx8O90TH1S/CCrqlR4wvTHACF6IXsL5nkHhfHMYRTO2ujwteGDOS
	 O2Ipq5/EXTkSg==
Message-ID: <sashiko-outbox-215417@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v21 04/13] ax88179_178a: Add HW support for
 AX179A-based chips
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261114-ax88179a-v21-4-c2d34410bcbe@birger-koblitz.de>
References: <20261114-ax88179a-v21-0-c2d34410bcbe@birger-koblitz.de>
 <20261114-ax88179a-v21-4-c2d34410bcbe@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 10:51:52 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 9 potential
issues to consider:
- [High] net: usb: ax88179_178a: missing usbnet_link_change() in phylink
  callbacks
- [High] net: usb: ax88179: UAF on unbind when down due to
  FLAG_AVOID_UNLINK_URBS
- [Medium] net: usb: ax88179_178a: byte-swapped pause waterlevels in
  ax88179a_mac_link_up()
- [Medium] net: usb: ax88179_178a: positive return from
  ax88179_mdiobus_write() and c45
- [Medium] net: usb: ax88179a: ax88179a_reset() clobbers custom MAC and
  perm_addr on open
- [Medium] net: usb: ax88179_178a: missing wol_supported init in
  ax88179a_bind()
- [Medium] net: usb: ax88179_178a: phylink_start() not unwound if
  usbnet_open() fails
- [Medium] net: usb: ax88179: ax88179a_stop() powers off PHY while
  attached to phylink
- [Low] net: usb: ax88179a: unaligned u16 pointer cast of u8 buf[5] in
  ax88179a_reset()
--

commit 2a91332d4bb64576008617e61fef57f6ed964420
Author: Birger Koblitz <mail@birger-koblitz.de>

ax88179_178a: Add HW support for AX179A-based chips

This commit adds hardware support and USB device IDs for the AX88179A,
AX88772D/E, and AX88279 USB Ethernet controllers using phylink.

> diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179=
a_devices.c
> new file mode 100644
> index 0000000000000..1aa8479422517
> --- /dev/null
> +++ b/drivers/net/usb/ax88179a_devices.c
[ ... ]
> +static int ax88179_mdiobus_write(struct mii_bus *bus, int phy_id, int re=
gnum, u16 val)
> +{
> +	struct usbnet *dev =3D bus->priv;
> +
> +	return ax88179_write_u16(dev, AX_ACCESS_PHY, phy_id, (__u16)regnum, val=
);
> +}
> +
> +static int ax179a_read_mmd(struct usbnet *dev, u16 dev_addr, u16 reg)
> +{
> +	u16 res;
> +	int ret;
> +
> +	ret =3D ax88179_read_cmd(dev, AX88179A_PHY_CLAUSE45, dev_addr, reg, 2, =
&res);
> +	if (ret < 0)
> +		return ret;
> +	return res;
> +}
> +
> +static int ax179a_write_mmd(struct usbnet *dev, u16 dev_addr, u16 reg, u=
16 data)
> +{
> +	return ax88179_write_cmd(dev, AX88179A_PHY_CLAUSE45, dev_addr, reg, 2, =
&data);
> +}
> +
> +static int ax88179_mdiobus_read_c45(struct mii_bus *bus, int addr, int d=
evnum, int regnum)
> +{
> +	struct usbnet *dev =3D bus->priv;
> +
> +	if (addr !=3D AX88179_PHY_ID)
> +		return -EINVAL;
> +
> +	return ax179a_read_mmd(dev, devnum, regnum);
> +}
> +
> +static int ax88179_mdiobus_write_c45(struct mii_bus *bus, int addr, int =
devnum,
> +				     int regnum, u16 val)
> +{
> +	struct usbnet *dev =3D bus->priv;
> +
> +	if (addr !=3D AX88179_PHY_ID)
> +		return -EINVAL;
> +
> +	return ax179a_write_mmd(dev, devnum, regnum, val);
> +}

[Severity: Medium]
Do ax88179_mdiobus_write() and ax88179_mdiobus_write_c45() return 2 instead
of 0 on a successful write?

ax88179_write_u16() and ax88179_write_cmd() return the positive byte count
from usb_control_msg(), whereas mii_bus .write and .write_c45 callbacks are
expected to return 0 on success and a negative errno on failure.  Callers
that check for a non-zero return value, such as phylink_mii_ioctl() for
SIOCSMIIREG or phy_suspend() when a PHY driver returns phy_write()
directly, will treat the positive return value as an unusual return or
failure.

[ ... ]

> +static void ax88179a_mac_link_down(struct phylink_config *config,
> +				   unsigned int mode, phy_interface_t interface)
> +{
> +	/* Nothing to do */
> +}
> +
> +static void ax88179a_mac_link_up(struct phylink_config *config,
> +				 struct phy_device *phy,
> +				 unsigned int phy_mode, phy_interface_t interface,
> +				 int speed, int duplex,
> +				 bool tx_pause, bool rx_pause)
> +{
> +	struct usbnet *dev =3D netdev_priv(to_net_dev(config->dev));
> +	struct ax88179_data *ax179_data =3D dev->driver_priv;
> +	u8 link_sts =3D 0, reg8[3];
> +	u8 bulk_config_speed =3D 0;
> +	u16 mode;
> +
> +	/* Stop RX/TX for link configuration */
> +	ax88179_write_u16(dev, AX_ACCESS_MAC, AX_RX_CTL, 2, AX_RX_CTL_STOP);
> +	ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_MAC_PATH, 1, 0);
> +
> +	ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_MAC_CDC_DELAY_TX, 1, 0xa5=
);
> +
> +	ax88179_write_u16(dev, AX_ACCESS_MAC, AX_PAUSE_WATERLVL_LOW, 2, 0x0410);

[Severity: Medium]
Does this 16-bit write program AX_PAUSE_WATERLVL_LOW and
AX_PAUSE_WATERLVL_HIGH with their values swapped?

ax88179a_reset() writes 0x04 to AX_PAUSE_WATERLVL_LOW (0x54) and 0x10 to
AX_PAUSE_WATERLVL_HIGH (0x55), but ax88179_write_u16() converts 0x0410 to
little-endian via cpu_to_le16s(), sending 0x10 to register 0x54 and 0x04 to
register 0x55 so the low pause threshold exceeds the high threshold.

[ ... ]

> +	ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_MAC_PATH, 1,
> +			 AX_MAC_RX_PATH_READY | AX_MAC_TX_PATH_READY);
> +}

[Severity: High]
Should ax88179a_mac_link_up() and ax88179a_mac_link_down() call
usbnet_link_change(dev, true/false, false) like ax88772_mac_link_up() and
ax88772_mac_link_down() in drivers/net/usb/asix_devices.c?

During usbnet_open(), ax88179a_reset() calls phylink_start(), which leaves
netif_carrier_ok(dev->net) false while PHY autonegotiation runs in the
phylink resolve workqueue.  When usbnet_open() then schedules dev->bh_work,
usbnet_bh() skips rx_alloc_submit() because carrier is off, leaving
dev->rxq empty:

drivers/net/usb/usbnet.c:usbnet_bh() {
    ...
	} else if (netif_running (dev->net) &&
		   netif_device_present (dev->net) &&
		   netif_carrier_ok(dev->net) &&
		   !timer_pending(&dev->delay) &&
		   !test_bit(EVENT_RX_KILL, &dev->flags) &&
		   !test_bit(EVENT_RX_HALT, &dev->flags)) {
		int	temp =3D dev->rxq.qlen;

		if (temp < RX_QLEN(dev)) {
			if (rx_alloc_submit(dev, GFP_ATOMIC) =3D=3D -ENOLINK)
				return;
    ...
}

When phylink later brings the link up and calls netif_carrier_on(), usbnet
is never notified via usbnet_link_change(), so __handle_link_change() never
runs to schedule dev->bh_work and submit RX URBs or update max queue
lengths, and pending RX URBs are never unlinked when the link drops.

[ ... ]

> +static int ax88179a_bind(struct usbnet *dev, struct usb_interface *intf)
> +{
[ ... ]
> +	ret =3D ax88179a_init_phy(dev);
> +	if (ret)
> +		goto initphy_err;
> +
> +	return 0;

[Severity: Medium]
Should ax88179a_bind() initialize ax179_data->wol_supported before the
net_device is registered?

Unlike ax88179_bind(), which calls ax88179_reset() during bind,
ax88179a_bind() leaves ax179_data->wol_supported at 0 until usbnet_open()
calls ax88179a_reset().  Any ethtool get_wol or set_wol request issued
while the interface is still down before the first open (such as udev or
systemd-networkd applying WakeOnLan link settings at probe time) sees
wol_supported =3D=3D 0 and fails with -EINVAL.

[ ... ]

> +static int ax88179a_reset(struct usbnet *dev)
> +{
> +	struct ax88179_data *ax179_data =3D dev->driver_priv;
> +	u16 *tmp16;
> +	u8 buf[5];
> +	u16 rxctl;
> +	u8 *tmp;
> +
> +	tmp16 =3D (u16 *)buf;
> +	tmp =3D (u8 *)buf;
[ ... ]
> +	/* Read MAC address from DTB or asix chip */
> +	ax88179_get_mac_addr(dev);
> +	memcpy(dev->net->perm_addr, dev->net->dev_addr, ETH_ALEN);

[Severity: Medium]
Does calling ax88179_get_mac_addr() and overwriting dev->net->perm_addr in
ax88179a_reset() clobber a user-configured MAC address or the permanent MAC
address on open?

ax88179_set_mac_addr() requires the interface to be down and writes the new
address to dev->net->dev_addr and AX_NODE_ID.  When usbnet_open() then
calls ax88179a_reset(), ax88179_get_mac_addr() either overwrites the custom
MAC address with the Device Tree MAC address if one is present, or reads
the custom MAC back from AX_NODE_ID, resets addr_assign_type to
NET_ADDR_PERM, and copies it into dev->net->perm_addr.

[ ... ]

> +	/* Configure default medium type =3D> giga */
> +	*tmp16 =3D AX_MEDIUM_RECEIVE_EN | AX_MEDIUM_TXFLOW_CTRLEN |
> +		 AX_MEDIUM_RXFLOW_CTRLEN | AX_MEDIUM_FULL_DUPLEX;
> +	if (!ax179_data->is_ax88772d)
> +		*tmp16 |=3D AX_MEDIUM_GIGAMODE;
> +	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE, 2, 2, tmp1=
6);

[Severity: Low]
As reported by Jakub Kicinski on v12 [1], casting u8 buf[5] to u16 *tmp16
and dereferencing it performs 16-bit accesses on a 1-byte-aligned stack
array.  Can this use ax88179_write_u16() with a u16 local variable like the
other 16-bit writes in this function?

> +
> +	/* Check if WoL is supported */
> +	ax179_data->wol_supported =3D 0;
> +	if (ax88179_read_cmd(dev, AX_ACCESS_MAC, AX_MONITOR_MOD,
> +			     1, 1, tmp) > 0)
> +		ax179_data->wol_supported =3D WAKE_MAGIC | WAKE_PHY;
> +
> +	/* Ensure EEE state is off, consistent with phylink setup */
> +	ax88179_write_cmd(dev, AX_GPHY_CTL, AX_GPHY_EEE_CTRL, false, 0, NULL);
> +
> +	phylink_start(ax179_data->phylink);
> +
> +	return 0;
> +}

[Severity: Medium]
If usbnet_status_start() fails in usbnet_open() after info->reset() has
succeeded, does phylink remain started while the interface stays down?

usbnet_open() calls info->reset() before usbnet_status_start(), and its
error path does not call info->stop().  Leaving phylink running when open
fails leaves phydev in PHY_UP/PHY_NOLINK/PHY_RUNNING, which triggers a
WARN_ON in phy_start() on the next open attempt.

> +
> +static int ax88179a_stop(struct usbnet *dev)
> +{
> +	struct ax88179_data *ax179_data =3D dev->driver_priv;
> +	u16 reg16 =3D 0;
> +
> +	phylink_stop(ax179_data->phylink);
> +
> +	ax88179_read_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE, 2, 2, &reg1=
6);
> +	reg16 &=3D ~AX_MEDIUM_RECEIVE_EN;
> +	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE, 2, 2, &reg=
16);
> +
> +	ax88179_write_u16(dev, AX_ACCESS_MAC, AX_RX_CTL, 2, 0);
> +
> +	ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_PHY_POWER, 0, 0, 0);
> +
> +	return 0;
> +}

[Severity: Medium]
Does powering off AX88179A_PHY_POWER in ax88179a_stop() break MDIO accesses
while the interface is down and lose PHY state across down/up transitions?

phylink_stop() already suspends the PHY via BMCR_PDOWN while keeping it
powered for MDIO requests.  Cutting power to the PHY while it remains
attached to phylink causes ethtool and MII ioctl operations performed while
the interface is down to access an unpowered PHY, and when ax88179a_reset()
later restores power, phylink_start() -> phy_start() only calls
__phy_resume() without re-running phy_init_hw().

> +
> +const struct driver_info ax88179a_info =3D {
> +	.description =3D "ASIX AX88179A USB 3.2 Gigabit Ethernet",
> +	.bind =3D ax88179a_bind,
> +	.unbind =3D ax88179a_unbind,
> +	.status =3D ax88179a_status,
> +	.reset =3D ax88179a_reset,
> +	.stop =3D ax88179a_stop,
> +	.flags =3D FLAG_ETHER | FLAG_FRAMING_AX | FLAG_MULTI_PACKET | FLAG_AVOI=
D_UNLINK_URBS,
> +	.rx_fixup =3D ax88179a_rx_fixup,
> +	.tx_fixup =3D ax88179a_tx_fixup,
> +};
> +
> +const struct driver_info ax88772d_info =3D {
> +	.description =3D "ASIX AX88772D/E USB 2.0 Fast Ethernet",
> +	.bind =3D ax88179a_bind,
> +	.unbind =3D ax88179a_unbind,
> +	.status =3D ax88179a_status,
> +	.reset =3D ax88179a_reset,
> +	.stop =3D ax88179a_stop,
> +	.flags =3D FLAG_ETHER | FLAG_FRAMING_AX | FLAG_MULTI_PACKET | FLAG_AVOI=
D_UNLINK_URBS,
> +	.rx_fixup =3D ax88179a_rx_fixup,
> +	.tx_fixup =3D ax88179a_tx_fixup,
> +};
> +
> +const struct driver_info ax88279_info =3D {
> +	.description =3D "ASIX AX88279 USB 3.2 2.5Gigabit Ethernet",
> +	.bind =3D ax88179a_bind,
> +	.unbind =3D ax88179a_unbind,
> +	.status =3D ax88179a_status,
> +	.reset =3D ax88179a_reset,
> +	.stop =3D ax88179a_stop,
> +	.flags =3D FLAG_ETHER | FLAG_FRAMING_AX | FLAG_MULTI_PACKET | FLAG_AVOI=
D_UNLINK_URBS,
> +	.rx_fixup =3D ax88179a_rx_fixup,
> +	.tx_fixup =3D ax88179a_tx_fixup,
> +};

[Severity: High]
Can setting FLAG_AVOID_UNLINK_URBS on these driver_info structs cause a
use-after-free in usbnet_bh_work() if the device is unplugged or unbound
after the interface has been brought down?

When FLAG_AVOID_UNLINK_URBS is set, usbnet_stop() skips
usbnet_terminate_urbs(), leaving submitted RX URBs queued in dev->rxq after
ndo_stop completes.  If the USB device is then disconnected while the
interface is already down, unregister_netdev() skips usbnet_stop() and
usbnet_disconnect() frees the net_device without cancelling dev->bh_work:

CPU0                                  CPU1 (system_bh_wq)
usb_unbind_interface()
  usb_disable_interface()
    ...
      rx_complete()
        defer_bh()
          queue_work(..., &dev->bh_work)
  usbnet_disconnect()
    unregister_netdev(net)
    free_netdev(net)
                                      usbnet_bh_work()
                                        usbnet_bh()  <-- use-after-free

[1] https://lore.kernel.org/r/20260919151247.1a340644@kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-ax88179a-v=
21-0-c2d34410bcbe@birger-koblitz.de?part=3D4
