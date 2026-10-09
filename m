Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F8A3A3822
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 03:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791517918; cv=none; b=ZT0NOloxqnvzIn6HejvsHEynYSp3BaeD5jJKsCfSUn7JI/KiWiO4WLt22FUCsTuvUkk/p8iDX4cXVaWAh2phz67V9otFl7OU0LKJroZ792LoaeoLirCQletiKOD4O4aIFHKgx+M8pPGuOBgjHMMK8flyFIcLT8pOo3/Gx1iC0q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791517918; c=relaxed/simple;
	bh=biD/KbcaYwMQqYL2edujLNZTD4gnFzvXdnarlsLaV2c=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=JtejBzxsH8sYS4tTAvXeAXBmfvEi1THxth/6epzzFAfjPQ2QJC1PJkFQti6LNh4VM9wArK9Uz81Z+/GFJIQTPIAV6EHAVi4kNjp87+/C8ke9RrVtYlwc4b3VJEq28aBnRYMXqUD1COh9xPSoO/Eblz4EqLcvGueJbq3xhNTEsf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hPbnfapY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hPbnfapY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 018251F0089C;
	Fri,  9 Oct 2026 03:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791517904;
	bh=nM+Lph5uK/2fy1BoraFGCeCBAOlQwItvegx9QKXQe14=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hPbnfapYhOLMFXJwLOfAkp6rdj1H7rlMA50b82nPFhRwOiT7xm6UwEsrlLgAWaoBt
	 v76trB3aVnsKbgTmtBrSXIqasdEil4mLW4snVrRCvPIW8RMZDzczMH0UtCtWQi9+z3
	 oNN6VbdjolffrJiV+mVbQqUeWpgroX8BVkA3U9mBoOR0touM/ZC59ysrhKImChHyYt
	 Jl2nXilfrGHu04WSJD7sRPKCRsqK+pdLU4ID/5WbG41geCDewc8C9bWNbr7wIp69rw
	 CS6qxbyyBhwKTx/1eRZCUcW062sp3tViD0qhLekyRqQvp7TIzxPIwh7FJiUyU4Dy3S
	 m/WWM4D/7r/qQ==
Message-ID: <sashiko-outbox-164797@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v18 04/13] ax88179_178a: Add HW support for
 AX179A-based chips
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008-ax88179a-v18-4-6fa1d4c40422@birger-koblitz.de>
References: <20261008-ax88179a-v18-0-6fa1d4c40422@birger-koblitz.de>
 <20261008-ax88179a-v18-4-6fa1d4c40422@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 03:51:43 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] net: usb: ax88179_178a: UAF on module unbind due to FLAG_AVOID_UNL=
INK_URBS
- [Medium] net: usb: ax88179_178a: Endianness bug in AX_PAUSE_WATERLVL_LOW/=
HIGH
- [Medium] net: usb: ax88179_178a: Double VLAN tagging in tx_fixup
- [Medium] net: usb: ax88179_178a: Uninitialized memory written to MAC on r=
ead failure
- [Medium] net: usb: ax88179_178a: Uninitialized bulkin_data written on lin=
k_sts read failure
- [Medium] net: usb: ax88179_178a: Race condition on AX_MEDIUM_STATUS_MODE
- [Low] net: usb: ax88179_178a: Unconditional AX_TXCOE_CTL overwrite breaks=
 features
--

commit 76ec5050c43a29d1f21256eec4c8a403f01e4f88
Author: Birger Koblitz <mail@birger-koblitz.de>

ax88179_178a: Add HW support for AX179A-based chips

This patch adds hardware support for AX179A-based USB-Ethernet controllers.
It introduces a new ax88179a_bind flow, registers new ethtool ops utilizing
phylink, and maps device IDs for the AX88179A, AX88772D, and AX88279 chips.

> diff --git a/drivers/net/usb/ax88179_lib.c b/drivers/net/usb/ax88179_lib.c
[ ... ]
> @@ -355,10 +378,17 @@ int ax88179_set_features(struct net_device *net, ne=
tdev_features_t features)
>  	}
> =20
>  	if (changed & NETIF_F_RXCSUM) {
> +		/* When we disable rx-checksumming, we need to clear the rx_checksum
> +		 * flag before disabling the engine
> +		 */
> +		if (!(features & NETIF_F_RXCSUM))
> +			data->rx_checksum =3D 0;
> +
>  		ax88179_read_cmd(dev, AX_ACCESS_MAC, AX_RXCOE_CTL, 1, 1, &tmp);
>  		tmp ^=3D AX_RXCOE_IP | AX_RXCOE_TCP | AX_RXCOE_UDP |
>  		       AX_RXCOE_TCPV6 | AX_RXCOE_UDPV6;
>  		ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_RXCOE_CTL, 1, 1, &tmp);

[Severity: Medium]
What happens if the USB control read fails here?

If ax88179_read_cmd() returns a negative error due to a USB timeout or
disconnect, the local variable tmp remains uninitialized. The code ignores
the return value, applies a bitwise modification, and writes the uninitiali=
zed
stack memory back to the MAC, which can cause unpredictable hardware state
corruption.

> diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179=
a_devices.c
[ ... ]
> +static void ax88179a_bulkin_config(struct usbnet *dev, u8 link_sts, u8 s=
peed, bool full_duplex)
> +{
[ ... ]
> +	if (ax179_data->chip_version =3D=3D AX_VERSION_AX88279) {
> +		bulkin_data =3D AX88279_BULKIN_SIZE;
> +	} else {
> +		if (ax179_data->is_ax88772d)
> +			bulkin_data =3D AX88772D_BULKIN_SIZE;
> +		else
> +			bulkin_data =3D AX88179A_BULKIN_SIZE;
> +	}
> +
> +	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_RX_BULKIN_QCTRL, 5, 5, &bulkin=
_data[index]);

[Severity: Medium]
Could this write uninitialized bulkin_data to the hardware?

In ax88179a_bulkin_config(), link_sts is populated via ax88179_read_cmd().
If the USB read fails, link_sts remains 0. When speed is ETHER_LINK_100
and link_sts is 0, the logic falls through the AX_USB_SS and AX_USB_HS
checks, leaving index at 0 (or 1 if half-duplex).

For AX88179A_BULKIN_SIZE, index 0 corresponds to BULK_IN_SPEED_2G5, which
is intentionally omitted from the struct initializer and is thus implicitly
zero-filled. The function would then proceed to write 5 bytes of pure zeros
to AX_RX_BULKIN_QCTRL. This could corrupt the MAC's RX DMA timers and size
thresholds, preventing the hardware from buffering packets correctly.

[ ... ]
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
Does this 16-bit write accidentally swap the byte ordering of the LOW and H=
IGH
constants on little-endian hosts?

The ax88179_write_u16 helper internally applies cpu_to_le16s() to the data.
On little-endian architectures, the value 0x0410 is stored in memory as 0x10
(LSB) followed by 0x04 (MSB).

When sent to the MAC, 0x10 is written to the first register
(AX_PAUSE_WATERLVL_LOW) and 0x04 is written to the second
(AX_PAUSE_WATERLVL_HIGH). This dangerously inverses the intended
logic, setting the LOW threshold higher than the HIGH threshold, which may
corrupt the hardware MAC pause frame control logic.

The correct 16-bit sequence here should have been 0x1004.

[ ... ]
> +	if (duplex)
> +		mode |=3D AX_MEDIUM_FULL_DUPLEX;
> +
> +	mutex_lock(&ax179_data->medium_status_mutex);
> +	if (dev->net->mtu > 1500)
> +		mode |=3D AX_MEDIUM_JUMBO_EN;
> +	ax88179_write_u16(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE, 2, mode);

[Severity: Medium]
Is there a race condition with ax88179_change_mtu() modifying
AX_MEDIUM_STATUS_MODE?

The medium_status_mutex is correctly utilized here to serialize updates to
the AX_MEDIUM_STATUS_MODE register. However, ax88179_change_mtu() performs
an unprotected read-modify-write on the same register without acquiring
this mutex.

Because ax88179a_mac_link_up() executes dynamically in the phylink worker
thread and ax88179_change_mtu() runs under the RTNL lock, these two paths c=
an
execute concurrently. This unprotected race condition can inadvertently drop
or corrupt the jumbo frame enable flag or receive-enable bits during dynamic
link renegotiations.

[ ... ]
> +static void ax88179a_unbind(struct usbnet *dev, struct usb_interface *in=
tf)
> +{
> +	struct ax88179_data *ax179_data =3D dev->driver_priv;
> +
> +	/* Configure RX control register =3D> stop operation */
> +	ax88179_write_u16(dev, AX_ACCESS_MAC, AX_RX_CTL, 2, AX_RX_CTL_STOP);
> +
> +	rtnl_lock();
> +	phylink_disconnect_phy(ax179_data->phylink);
> +	rtnl_unlock();
> +	phylink_destroy(ax179_data->phylink);
> +	ax88179a_mdio_unregister(ax179_data);
> +
> +	ax88179_write_u8(dev, AX88179A_PHY_POWER, 0, 0, 0);
> +
> +	kfree(ax179_data);

[Severity: High]
Does this introduce a use-after-free during module unbind due to the driver
registering with FLAG_AVOID_UNLINK_URBS?

During device disconnect or unbind, usbnet_disconnect() brings the network
device down. Due to FLAG_AVOID_UNLINK_URBS, it intentionally skips calling
usbnet_terminate_urbs(), meaning the RX and TX URBs remain active in the
USB host controller.

usbnet_disconnect() then immediately calls this .unbind() callback, which
unconditionally frees the driver's private data via kfree(ax179_data).

When a pending RX URB later completes, it invokes ax88179a_rx_fixup(),
which dereferences the freed ax179_data pointer.

[ ... ]
> +static int ax88179a_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
> +{
> +	struct ax88179_data *ax179_data =3D dev->driver_priv;
[ ... ]
> +	pkt_end =3D 0;
> +	while (pkt_cnt--) {
> +		u64 pkt_desc =3D get_unaligned_le64(pkt_desc_ptr);
> +		u32 pkt_len_plus_padd;
> +		u32 pkt_len;
> +
> +		pkt_len =3D FIELD_GET(AX179A_RX_PD_LEN, pkt_desc);
> +		pkt_len -=3D (ax179_data->ip_align ? 2 : 0);

[Severity: High]
This is where the freed ax179_data pointer is dereferenced by a
concurrently completing RX URB, as mentioned in the ax88179a_unbind() comme=
nt.

[ ... ]
> +static struct sk_buff *ax88179a_tx_fixup(struct usbnet *dev, struct sk_b=
uff *skb, gfp_t flags)
> +{
[ ... ]
> +	if (((skb->len + sizeof(tx_desc) + padding_size) % frame_size) =3D=3D 0=
) {
> +		padding_size +=3D 8;
> +		tx_desc |=3D AX179A_TX_DESC_DROP_PADD;
> +	}
> +
> +	if ((dev->net->features & NETIF_F_HW_VLAN_CTAG_TX) && (vlan_get_tag(skb=
, &tci) >=3D 0)) {

[Severity: Medium]
Will this erroneously double-tag packets that already contain a payload VLAN
tag?

Unlike skb_vlan_tag_present(), vlan_get_tag() falls back to extracting the
tag directly from the SKB payload if it is not present in the SKB's
out-of-band metadata.

If a user transmits a packet that is natively VLAN-tagged inside its
payload (e.g., via a raw socket or bridge), vlan_get_tag() will return
true and extract the tag. The driver then sets AX179A_TX_DESC_VLAN,
incorrectly instructing the hardware MAC to insert a second, duplicate
VLAN tag into the packet. This can cause double-tagging protocol violations.

[ ... ]
> +static int ax88179a_reset(struct usbnet *dev)
> +{
[ ... ]
> +	/* Enable checksum offload */
> +	if (dev->net->features & NETIF_F_RXCSUM) {
> +		ax88179_write_u8(dev, AX_ACCESS_MAC, AX_RXCOE_CTL, 1,
> +				 AX_RXCOE_IP | AX_RXCOE_TCP | AX_RXCOE_UDP |
> +				 AX_RXCOE_TCPV6 | AX_RXCOE_UDPV6);
> +		ax179_data->rx_checksum =3D 1;
> +	} else {
> +		ax179_data->rx_checksum =3D 0;
> +		ax88179_write_u8(dev, AX_ACCESS_MAC, AX_RXCOE_CTL, 1, 0);
> +	}
> +
> +	ax88179_write_u8(dev, AX_ACCESS_MAC, AX_TXCOE_CTL, 1,
> +			 AX_TXCOE_IP | AX_TXCOE_TCP | AX_TXCOE_UDP |
> +			 AX_TXCOE_TCPV6 | AX_TXCOE_UDPV6);

[Severity: Low]
Does this unconditional hardware enablement break the ethtool netdev
feature synchronization?

This logic blindly enables all transmit checksum offloads without checking
against the OS's dev->net->features. If a system administrator manually
disables TX checksums via ethtool, the feature bit is cleared.=20

If the device subsequently resets (e.g., from an MTU change or USB
timeout), hardware TX checksumming will be re-enabled without the OS's
knowledge, desynchronizing the netdev feature state from the active
hardware state.

[ ... ]
> +static int ax88179a_stop(struct usbnet *dev)
> +{
> +	struct ax88179_data *ax179_data =3D dev->driver_priv;
> +	u16 reg16;
> +
> +	phylink_stop(ax179_data->phylink);
> +
> +	ax88179_read_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE, 2, 2, &reg1=
6);
> +	reg16 &=3D ~AX_MEDIUM_RECEIVE_EN;
> +	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE, 2, 2, &reg=
16);

[Severity: Medium]
Similar to the issue in ax88179_set_features(), could this write uninitiali=
zed
memory back to the hardware?

An uninitialized stack variable reg16 is passed to ax88179_read_cmd() to re=
ad
the MAC's medium status mode. If the USB control read fails, reg16 is left
containing uninitialized stack memory. The code ignores the return value,
applies a bitwise modification, and writes the garbage back via
ax88179_write_cmd().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-ax88179a-v=
18-0-6fa1d4c40422@birger-koblitz.de?part=3D4
