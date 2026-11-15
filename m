Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739915;
	b=0zg591kh2jiv+Avwgi2fNMuGQYPth3KY2FDidLmV6FkHJ0bUMCT5kRo6vKhYg3S01EVV
	 +S/mR6fXfMQ8QXREm9AJA7hQT4fG7FNWNU8Jqb22OM00o/lUSRaoKTMyQpDVfl6mvy4nC
	 jE0t0rfHwAoH9Q91QPniqEkPdkWTbn7ZpbLvjLLMFz50CbgBR6lyK03A+qLrwrM5Vndt2
	 /XI97CBISuvcYOX1m/E1zcPlJEibg5p1dyP31z0AIJU1nKmjq+hCb1eIlkPk2TqrDze85
	 CeBiyrl6BixGcJn2Qlr7VGu/y3CbVd22Xo0mEUJb5Qe9QdwAhXFpGSZyXVytf1nVU5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739915;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/O6ravDzhcUqLGS5JNMnStICCjh9+Auzj0N3oNa5gMY=;
	b=1AEFdHJCeekIgKZ2NHgDAEqYBFA5hoPVJr6ABVmUrAR/C4gVAMNdABa/YR+CgoSYKfZB
	 1J/n5YMJIJtTpOi9SIdu5eDiUpRPJ2icCfd8iGJlfa9oMKCAnygNyDASzeHNhwiuGZOIs
	 BDd94NlQg4FwfzrfUq+QfgKnfm00LTH7pP3qMHgrNPwY5b8SgWRaLskTCkskz5LZB7tsN
	 jdYh60vqHi1xXZUrUjaUrU2X+XDwxC05Qol6aNLhTix9zKi5TSwOi4TwaoX+rACzM5X0f
	 nvCuAiCVj0rsN+4go8ajxeYhp8EhMzt2kW6wZANHPX/JKY20LOPp57QeVkoc6rLUEbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XtoxYEOy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8861C606A88A
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 10:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XtoxYEOy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 474431F000C4;
	Sun, 15 Nov 2026 10:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739915;
	bh=/O6ravDzhcUqLGS5JNMnStICCjh9+Auzj0N3oNa5gMY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XtoxYEOyv8rls2gB3qksSQ9BA0PcCSsKoGQ93dQZCgS40Gf4ibwi3QKqXIJnhkaHx
	 wxES4RgEOzy/0v8ROQEEF0ZSnk0Soc1ZG1nbxNTXbb4fWDvXnWKFLYGb4eEk52WtWl
	 NaGPfInB9r8rbv4STWOTJr62kPgs33/XkRIHV/mk07EfIcc3XLHk0T5q25B9slmeE9
	 rh1RXee+6QHWtuDl/UDs8tZbggCI9xWJLL/x3CyB+2tc+78HnqjJiOBVFZdFL4kRqI
	 0Kd6KnisO6iKEhD6tkJIAEkvQse1HpwgZw2hqvYDfhdawdSnOxZQubgXheqBv3/mA0
	 OKmk43FaxotBw==
Message-ID: <sashiko-outbox-215420@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v21 07/13] ax88179_178a: Add VLAN offload
 support for AX88179A
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261114-ax88179a-v21-7-c2d34410bcbe@birger-koblitz.de>
References: <20261114-ax88179a-v21-0-c2d34410bcbe@birger-koblitz.de>
 <20261114-ax88179a-v21-7-c2d34410bcbe@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 10:51:54 +0000
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
- [Medium] net: usb: ax88179: uninitialized stack read and short USB
  read in VLAN ops
- [Medium] net: usb: ax88179: unchecked USB writes in
  ax88179a_set_features() loop
- [Medium] net: usb: ax88179_178a: TX VLAN tag drop race in
  ax88179a_tx_fixup()
- [Low] net: usb: ax88179_178a: partial feature state in
  ax88179a_set_features()
- [Low] net: usb: ax88179_178a: duplicated VLAN filter update logic in
  add/kill vid
--

commit a2245f1909a4b4c924abeed75400e9c875dcb39c
Author: Birger Koblitz <mail@birger-koblitz.de>

ax88179_178a: Add VLAN offload support for AX88179A

This commit adds hardware VLAN offload and filtering callbacks
(NETIF_F_HW_VLAN_CTAG_TX, NETIF_F_HW_VLAN_CTAG_RX, and
NETIF_F_HW_VLAN_CTAG_FILTER) for AX88179A-based USB network devices.

> diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179=
a_devices.c
> index 272e923656832..4207d2cc2b865 100644
> --- a/drivers/net/usb/ax88179a_devices.c
> +++ b/drivers/net/usb/ax88179a_devices.c
> @@ -258,6 +258,88 @@ static const struct ethtool_ops ax88179a_ethtool_ops=
 =3D {
>  	.get_ts_info		=3D ethtool_op_get_ts_info,
>  };
> =20
> +static int ax88179a_vlan_rx_kill_vid(struct net_device *net, __be16 prot=
o, u16 vid)
> +{
> +	struct usbnet *dev =3D netdev_priv(net);
> +	u16 reg16 =3D 0;
> +	u8 vlan_ctrl;
> +	int ret =3D 0;
> +	u8 reg8 =3D 0;
> +
> +	ret =3D ax88179_read_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL, =
1, 1, &reg8);
> +	if (ret < 0)
> +		return ret;
> +	vlan_ctrl =3D reg8;
> +
> +	/* Address */
> +	reg8 =3D (vid / 16);
> +	ret =3D ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_ADDRESS,=
 1, 1, &reg8);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Data */
> +	reg8 =3D vlan_ctrl | AX_VLAN_CONTROL_RD;
> +	ret =3D ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL,=
 1, 1, &reg8);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D ax88179_read_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_DATA0, 2,=
 2, &reg16);
> +	if (ret < 0)
> +		return ret;
> +	reg16 &=3D ~(1 << (vid % 16));
> +	ret =3D ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_DATA0, 2=
, 2, &reg16);
> +	if (ret < 0)
> +		return ret;
> +
> +	reg8 =3D vlan_ctrl | AX_VLAN_CONTROL_WE;
> +	ret =3D ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL,=
 1, 1, &reg8);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int ax88179a_vlan_rx_add_vid(struct net_device *net, __be16 proto=
, u16 vid)
> +{
> +	struct usbnet *dev =3D netdev_priv(net);
> +	u8 vlan_ctrl;
> +	int ret =3D 0;
> +	u16 reg16;
> +	u8 reg8;
> +
> +	ret =3D ax88179_read_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL, =
1, 1, &reg8);
> +	if (ret < 0)
> +		return ret;
> +	vlan_ctrl =3D reg8;
> +
> +	/* Address */
> +	reg8 =3D (vid / 16);
> +	ret =3D ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_ADDRESS,=
 1, 1, &reg8);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Data */
> +	reg8 =3D vlan_ctrl | AX_VLAN_CONTROL_RD;
> +	ret =3D ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL,=
 1, 1, &reg8);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D ax88179_read_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_DATA0, 2,=
 2, &reg16);
> +	if (ret < 0)
> +		return ret;
> +	reg16 |=3D (1 << (vid % 16));
> +	ret =3D ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_DATA0, 2=
, 2, &reg16);
> +	if (ret < 0)
> +		return ret;
> +
> +	reg8 =3D vlan_ctrl | AX_VLAN_CONTROL_WE;
> +	ret =3D ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL,=
 1, 1, &reg8);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}

[Severity: Medium]
Can a 0-byte USB read in ax88179a_vlan_rx_add_vid() or
ax88179a_set_features() write uninitialized stack memory into
AX88179A_VLAN_ID_CONTROL?

For 1-byte reads, ax88179_read_cmd() passes the caller's pointer directly
to __usbnet_read_cmd(), which only copies into the buffer when
usb_control_msg() returns > 0.  If a control read returns 0, reg8 in
ax88179a_vlan_rx_add_vid() and tmp in ax88179a_set_features() remain
uninitialized because the callers only check ret < 0, and that stack byte
is then modified and written back to AX88179A_VLAN_ID_CONTROL.

Similarly, the 2-byte reads of AX88179A_VLAN_ID_DATA0 only check ret < 0
instead of ret < 2, so a short read leaves reg16 zeroed or partially
populated and causes the subsequent write to clear the other 15 VIDs in
the same (vid / 16) filter entry.

[Severity: Low]
This isn't a bug, but ax88179a_vlan_rx_kill_vid() and
ax88179a_vlan_rx_add_vid() duplicate the same five-step register sequence
and only differ in whether they clear or set BIT(vid % 16) in reg16.
Could they share a common helper taking a boolean flag?

[ ... ]

> @@ -517,6 +599,75 @@ static int ax88179a_mii_ioctl(struct net_device *net=
, struct ifreq *rq, int cmd)
>  	return phylink_mii_ioctl(data->phylink, rq, cmd);
>  }
> =20
> +static int ax88179a_set_features(struct net_device *net, netdev_features=
_t features)
> +{
> +	struct usbnet *dev =3D netdev_priv(net);
> +	netdev_features_t changed;
> +	int ret;
> +	u8 tmp;
> +
> +	changed =3D net->features ^ features;
> +
> +	ret =3D ax88179_set_features(net, features);
> +	if (ret)
> +		return ret;
> +
> +	if (changed & NETIF_F_HW_VLAN_CTAG_FILTER) {
> +		if (features & NETIF_F_HW_VLAN_CTAG_FILTER) {
> +			u8 vlan_state =3D 0;
> +
> +			ret =3D ax88179_read_cmd(dev, AX_ACCESS_MAC,
> +					       AX88179A_VLAN_ID_CONTROL, 1, 1, &vlan_state);
> +			if (ret < 0)
> +				return ret;
> +
> +			for (int i =3D 0; i < 256; i++) {
> +				/* Address */
> +				tmp =3D i;
> +				ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_ADDRESS,
> +						  1, 1, &tmp);
> +				/* Data */
> +				ax88179_write_u16(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_DATA0,
> +						  2, 0);
> +				/* Write-Execute */
> +				ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL,
> +						 1, vlan_state | AX_VLAN_CONTROL_WE);
> +			}

[Severity: Medium]
Should the USB writes inside this loop check for errors?

If any write fails transiently while the final write enabling
AX_VLAN_CONTROL_VFE succeeds, hardware VLAN filtering is enabled over an
incompletely cleared filter table with stale VID entries.  On a persistent
USB error, the loop also runs all 768 synchronous control transfers under
rtnl_lock instead of bailing out on the first failure.

> +			vlan_state |=3D AX_VLAN_CONTROL_VFE;
> +			ret =3D ax88179_write_cmd(dev, AX_ACCESS_MAC,
> +						AX88179A_VLAN_ID_CONTROL, 1, 1, &vlan_state);
> +			if (ret < 0)
> +				return ret;
> +		} else {
> +			ret =3D ax88179_read_cmd(dev, AX_ACCESS_MAC,
> +					       AX88179A_VLAN_ID_CONTROL, 1, 1, &tmp);
> +			if (ret < 0)
> +				return ret;
> +			tmp &=3D ~AX_VLAN_CONTROL_VFE;
> +			ret =3D ax88179_write_cmd(dev, AX_ACCESS_MAC,
> +						AX88179A_VLAN_ID_CONTROL, 1, 1, &tmp);
> +			if (ret < 0)
> +				return ret;
> +		}
> +	}
> +
> +	if (changed & NETIF_F_HW_VLAN_CTAG_RX) {
> +		ret =3D ax88179_read_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL,
> +				       1, 1, &tmp);
> +		if (ret < 0)
> +			return ret;
> +		if (features & NETIF_F_HW_VLAN_CTAG_RX)
> +			tmp |=3D AX_VLAN_CONTROL_VSO;
> +		else
> +			tmp &=3D ~AX_VLAN_CONTROL_VSO;
> +		ret =3D ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL,
> +					1, 1, &tmp);
> +		if (ret < 0)
> +			return ret;
> +	}
> +	return 0;
> +}

[Severity: Low]
Can a late failure in ax88179a_set_features() leave hardware offload state
out of sync with net->features?

When multiple features are changed at once and a later register access
fails, __netdev_update_features() aborts without updating net->features or
repopulating the VLAN filter table, while earlier changes stay active in
hardware.  For example, if enabling NETIF_F_HW_VLAN_CTAG_FILTER succeeds
and the NETIF_F_HW_VLAN_CTAG_RX step fails, AX_VLAN_CONTROL_VFE remains
enabled with an all-zero filter table, and any checksum bits already
toggled via XOR in ax88179_set_features() remain inverted relative to
net->features.

[ ... ]

> @@ -612,9 +766,11 @@ static int ax88179a_bind(struct usbnet *dev, struct =
usb_interface *intf)
>  		dev->mii.supports_gmii =3D 1;
> =20
>  	dev->net->features |=3D NETIF_F_SG | NETIF_F_IP_CSUM |
> -			      NETIF_F_IPV6_CSUM | NETIF_F_RXCSUM | NETIF_F_TSO;
> +			      NETIF_F_IPV6_CSUM | NETIF_F_RXCSUM | NETIF_F_TSO |
> +			      NETIF_F_HW_VLAN_CTAG_TX;
> =20
>  	dev->net->hw_features |=3D dev->net->features;
> +	dev->net->hw_features |=3D NETIF_F_HW_VLAN_CTAG_RX | NETIF_F_HW_VLAN_CT=
AG_FILTER;

[Severity: Medium]
Can toggling NETIF_F_HW_VLAN_CTAG_TX at runtime cause ax88179a_tx_fixup()
to transmit VLAN-tagged packets without their VLAN tag?

drivers/net/usb/ax88179a_devices.c:ax88179a_tx_fixup() {
    ...
	if ((dev->net->features & NETIF_F_HW_VLAN_CTAG_TX) && (vlan_get_tag(skb, &=
tci) >=3D 0)) {
		tx_desc |=3D AX179A_TX_DESC_VLAN;
		tx_desc |=3D FIELD_PREP(AX179A_TX_DESC_VLAN_ID, (u64)tci);
	}
    ...
}

CPU0                              CPU1
dev_hard_start_xmit()
  validate_xmit_skb()
    validate_xmit_vlan()
      /* tag left in skb->vlan_tci */
                                  __netdev_update_features()
                                    /* clears NETIF_F_HW_VLAN_CTAG_TX */
  ndo_start_xmit()
    ax88179a_tx_fixup()
      /* skips AX179A_TX_DESC_VLAN */  <-- sent untagged

Now that NETIF_F_HW_VLAN_CTAG_TX is exposed in features and hw_features,
disabling it while packets validated under NETIF_F_HW_VLAN_CTAG_TX are in
flight causes both the feature check in ax88179a_tx_fixup() and
vlan_get_tag() to ignore skb->vlan_tci.  Checking skb_vlan_tag_present(skb)
and reading the tag with skb_vlan_tag_get(skb) avoids dropping the tag.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-ax88179a-v=
21-0-c2d34410bcbe@birger-koblitz.de?part=3D7
