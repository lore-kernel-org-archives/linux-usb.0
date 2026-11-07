Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794036111;
	b=acRSRWzXqV41A+gtERlnSVpmsvTBl/6ibtgK9K1jAV15clR3GmghrBB3cABRakjhiZfj
	 s5qF/z+nqv7EJeguapM3KSm6Ih1TAxKarcf2x7zmYTA9HMvXRP4GD+CRvb8ANheUA6Dux
	 dxQIeUSLQaiGMm2DAXThkdvUt5CKL2htNq+Wm5gWWOgEN9ACaVNgo1SJaQoSbTlXi5Zo6
	 X+fSgKP5hWOvIeI+F0DdzQzJdDZ1ubkmCoucAZ/tjGB1g6OhVf6MGhbN0ynEgdx3DKVWx
	 xfZ6MZVFeWG1nt3xQFXhM9vJL0PXXLj54wMynzixuD0JqSIiod+jirCu9PRGtwaXUDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794036111;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Z0XJKv9YGHyQYBFJOUN5JdVrw+PomqIBsYj7NoJn5k4=;
	b=m1tomsKkeuDsVuM5fsGttbBr9IS1uSDibt9H4C63Bdvj0yNwjsArZ4TUmlHfnk4NKRVL
	 +F/vMxfQTtWox9qxMPZdCB7Oek5gJ8RAhRrD+bOlRuuY5TKViLUh/sQmSV4dTz3PK+GeN
	 xif3nSwjvnQU5G0dx58BrkzOhJcm286ridlD6keMonAIFoiaiGl+U+PKFqPrPM65vyQkc
	 OhoNjNyr9xhYvVYy9J+Lf3sj/KrN5wB+c+wX0VqsjkGDHzIJtmKfCt8i1v5KyG+MK8v+H
	 DjRFDHBaV9hcS4t4aY81yRUS3FIxAj+83d/4GpjFKkYz7N4jmFgkDxuijhlt5C5eJ4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jKAN+jvj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90480606A33D
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 07:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jKAN+jvj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 063791F008A1;
	Sat,  7 Nov 2026 07:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794036111;
	bh=Z0XJKv9YGHyQYBFJOUN5JdVrw+PomqIBsYj7NoJn5k4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jKAN+jvjPKSlAgH/ajzsN3qH77tL4Lfztx7s9na9OgQFkqxdGY/Vg0YDrYmOpeCoW
	 Rt/1t3H5DK544ChenOQcLPhtsZQe5PayC+NJPKWCiUMrSBq6RQjgYMDXWI2d8LXxQk
	 zSCy/4jG8iZvr4BCdcM3XekH1HlTJWhpJTK1VlVD0r2VnGBBwivvuz6vy0VzyldUSm
	 R0ngsm9JFQzsZUOWZObbxETGQOZH+8bjGG+PiKrOSt43fje6Tn0K71HocS3A+KwQ0h
	 4/RQocDiXYjJ1M871wUSoGMoM3d5JQtFm1k/JtoX7Hkt8zQcFgFCAGYv0z/4QeX587
	 LfBw+jJmtuZZg==
Message-ID: <sashiko-outbox-202694@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v20 04/13] ax88179_178a: Add HW support for
 AX179A-based chips
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-ax88179a-v20-4-37b5a1189983@birger-koblitz.de>
References: <20261106-ax88179a-v20-0-37b5a1189983@birger-koblitz.de>
 <20261106-ax88179a-v20-4-37b5a1189983@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 07:21:50 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 7 potential
issues to consider:
- [High] net: usb: ax88179_178a: missing usbnet_link_change() in phylink
  callbacks
- [High] net: usb: ax88179: UAF on unbind when down due to
  FLAG_AVOID_UNLINK_URBS
- [Medium] net: usb: ax88179_178a: positive return from
  ax88179_mdiobus_write()
- [Medium] net: usb: ax88179_178a: byte-swapped pause waterlevels in
  ax88179a_mac_link_up()
- [Medium] net: usb: ax88179a: ax88179a_reset() clobbers custom MAC and
  perm_addr on open
- [Medium] net: usb: ax88179: ax88179a_stop() powers off PHY while
  attached to phylink
- [Low] net: usb: ax88179a: unaligned u16 pointer cast of u8 buf[5] in
  ax88179a_reset()
--

commit 745d111b6d1daea09390fe18d715cc6358070656
Author: Birger Koblitz <mail@birger-koblitz.de>

ax88179_178a: Add HW support for AX179A-based chips

This commit adds bindings and hardware support for the AX179A family of
USB-Ethernet controllers (AX88179A/B, AX88772D/E, and AX88279) using
phylink.

> diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179=
a_devices.c
> new file mode 100644
> index 0000000000000..1aa8479422517
> --- /dev/null
> +++ b/drivers/net/usb/ax88179a_devices.c
> @@ -0,0 +1,983 @@

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

[Severity: Medium]
Do ax88179_mdiobus_write() and ax179a_write_mmd() return 2 instead of 0 on
a successful MDIO write?

ax88179_write_u16() and ax88179_write_cmd() return the number of bytes
transferred by usb_control_msg() (2), whereas mii_bus->write and
mii_bus->write_c45 must return 0 on success and a negative errno on
failure.  Callers checking for non-zero return values, such as
phylink_mii_ioctl(SIOCSMIIREG), will receive 2 instead of 0.

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
Does this 16-bit write swap AX_PAUSE_WATERLVL_LOW and
AX_PAUSE_WATERLVL_HIGH?

ax88179_write_u16() converts 0x0410 to little-endian via cpu_to_le16s(),
writing 0x10 to AX_PAUSE_WATERLVL_LOW (0x54) and 0x04 to
AX_PAUSE_WATERLVL_HIGH (0x55), whereas ax88179a_reset() writes 0x04 to
AX_PAUSE_WATERLVL_LOW and 0x10 to AX_PAUSE_WATERLVL_HIGH.  Setting the low
pause threshold above the high threshold breaks hardware flow control on
link-up.

[ ... ]

> +	ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_MAC_PATH, 1,
> +			 AX_MAC_RX_PATH_READY | AX_MAC_TX_PATH_READY);
> +}

[Severity: High]
Should ax88179a_mac_link_up() and ax88179a_mac_link_down() call
usbnet_link_change()?

During usbnet_open(), ax88179a_reset() calls phylink_start(), which turns
carrier off while autonegotiation starts asynchronously.  When
usbnet_open() schedules dev->bh_work, usbnet_bh() sees
!netif_carrier_ok(dev->net) and does not submit any RX URBs.  When phylink
later brings the link up, nothing calls usbnet_link_change(dev, true,
false) to schedule dev->bh_work or update queue lengths via
usbnet_update_max_qlen(), leaving dev->rxq empty so no packets can be
received.  Likewise, ax88179a_mac_link_down() never calls
usbnet_link_change(dev, false, false) to unlink pending RX URBs when the
link drops.

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
Does calling ax88179_get_mac_addr() and copying dev_addr into perm_addr in
ax88179a_reset() clobber a user-configured MAC address or permanent MAC
address on open?

ax88179_set_mac_addr() only allows changing the MAC address while the
interface is down, writing the new address to dev->net->dev_addr and
AX_NODE_ID and setting addr_assign_type to NET_ADDR_SET.  When the
interface is then brought up, usbnet_open() calls ax88179a_reset(): if a
Device Tree MAC address is present, ax88179_get_mac_addr() overwrites the
user-configured MAC address with the DT address; otherwise it reads the
user-configured address back from AX_NODE_ID, resets addr_assign_type to
NET_ADDR_PERM, and overwrites dev->net->perm_addr with it.

[ ... ]

> +	/* Configure default medium type =3D> giga */
> +	*tmp16 =3D AX_MEDIUM_RECEIVE_EN | AX_MEDIUM_TXFLOW_CTRLEN |
> +		 AX_MEDIUM_RXFLOW_CTRLEN | AX_MEDIUM_FULL_DUPLEX;
> +	if (!ax179_data->is_ax88772d)
> +		*tmp16 |=3D AX_MEDIUM_GIGAMODE;
> +	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE, 2, 2, tmp1=
6);

[Severity: Low]
As reported by Jakub Kicinski on v12 [1], casting the 1-byte-aligned stack
array u8 buf[5] to u16 *tmp16 performs unaligned 16-bit accesses here.
Using ax88179_write_u16() as done earlier in ax88179a_reset() would avoid
both tmp16 and buf.

[ ... ]

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
> +	ax88179_write_u8(dev, AX88179A_PHY_POWER, 0, 0, 0);
> +
> +	return 0;
> +}

[Severity: Medium]
Should ax88179a_stop() cut AX88179A_PHY_POWER while the PHY is still
attached to phylink?

phylink_stop() already suspends the PHY via BMCR_PDOWN while keeping it
powered for MDIO access.  Writing 0 to AX88179A_PHY_POWER powers down the
PHY hardware, so ethtool or MII ioctl operations issued while the
interface is down access an unpowered PHY, and bringing the interface back
up in ax88179a_reset() -> phylink_start() only calls __phy_resume()
without re-running phy_init_hw() after the power cycle.

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
Can setting FLAG_AVOID_UNLINK_URBS here cause a use-after-free on
struct usbnet if the device is unplugged while the interface is down?

When FLAG_AVOID_UNLINK_URBS is set, usbnet_stop() skips
usbnet_terminate_urbs(dev), and ax88179a_stop() disables MAC RX without
flushing pending bulk-in transfers, leaving submitted RX URBs queued in
dev->rxq after the interface is down.  If the device is then unplugged or
unbound while !netif_running(net):

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

Because the interface is already down, unregister_netdev() does not call
usbnet_stop(), and usbnet_disconnect() frees net without cancelling
dev->bh_work or deleting dev->delay.

[1] https://lore.kernel.org/r/20260919151247.1a340644@kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-ax88179a-v=
20-0-37b5a1189983@birger-koblitz.de?part=3D4
