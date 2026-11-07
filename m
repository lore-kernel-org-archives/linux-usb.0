Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794036114;
	b=3evHYxmCeyD3/EE0KvHlCjPJKz1Fgp4F7Mo673EsI0dOpCO1asW3/ZUBN/cVBwngpZav
	 h7EEDx0hHG8rxNo2OyeMYsthkqdzivrg+Jwal2eqGK9iLAKxWJ0+Uy9s7foUN4nZUhxfl
	 kkFWV9ryny71vFoXB0qPGgZ+aqv5M5eLBp4HZhs3f+dQWN02ep3YExS+4Mv/MIi8jgrFu
	 /OZzlkbcwKweoGgIJEhxH4fKL7BQhFYMyrFhIM7x+s7w1G6gVyL19ac5Wpn/Bbrmcm21C
	 wtWgwLwxVYyuoCM4YGYYGSiSa8ox8eRy7yGfgx9Fdx64U+fFiESyo9Ds8+fRyyHHzkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794036114;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vX3XmlvkaEolAsHX1HHql/y/44p/dMRTaTJrE3QCFic=;
	b=jCVRSR8rimQlF9Vh++0Z0O8WPM7EvDJDc5yGoGFLZfwIVFIZgRlt+gKsVwzGNnlEH6GK
	 44/hqhsvxrh9gEkUC/6auY9Mb6PXENe5ACNIGF3BBR9j4H1PrhEo2ZMupBC1991s4RLcX
	 Ofa+yqiFRaY47Yu1gNY7CYyZv3Q8GDGn+DHbjEwp3K32DSs9OFz6CU4kfiTB9dSo4IYv8
	 P3+FdDgLZ1iSSlWI3C0ttFeF2qokfgM15CdaAG8GD80hs6gKIeRa8GpRdSoSLi99Ftw87
	 mAS3LneFp7HQl3/2RpHe/XdUzO/OofUUIBwM/YS5fO7QlYjI4MwFhJBHTGdM/Mg1DWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cVkejBQP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF1B606A330
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 07:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cVkejBQP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74BA51F0089F;
	Sat,  7 Nov 2026 07:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794036113;
	bh=vX3XmlvkaEolAsHX1HHql/y/44p/dMRTaTJrE3QCFic=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cVkejBQPUktqvDq/0mc1JNyKPRi/FOQdpMxswjfOtujnrykb9ecwgyBiNjBsa355f
	 G8PuFs8s/BtB4o/R66cz2jMLkKh/ULmUv0xlHHkKMRlXfoU+rfd23Few8Kw804bpna
	 78p7GtcWTqQB9YXCWQBwoLhNOSl2YNSmSqczTHSxuCheSE6PoSjrFWPKZRcDNUqb8b
	 7MMaQFmC6OZP9ESxRzatLn144qP5bGFJyG9F5KJ+ZnsuM5sdtLgl/SZHqUknjNZsHy
	 BA7XWYG0bsGECY8dBkxtj+cdLjQDS16+NlUsuzHHpJaZHcL4ciCUTBjU9oSV9N4HAG
	 xUv1To4PASxCg==
Message-ID: <sashiko-outbox-202697@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v20 07/13] ax88179_178a: Add VLAN offload
 support for AX88179A
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-ax88179a-v20-7-37b5a1189983@birger-koblitz.de>
References: <20261106-ax88179a-v20-0-37b5a1189983@birger-koblitz.de>
 <20261106-ax88179a-v20-7-37b5a1189983@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 07:21:53 +0000
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
- [Medium] net: usb: ax88179: unchecked USB writes in
  ax88179a_set_features() loop
- [Medium] net: usb: ax88179: uninitialized stack read on short USB read
- [Medium] net: usb: ax88179_178a: unchecked writes and partial state in
  ax88179a_set_features()
- [Medium] net: usb: ax88179_178a: TX VLAN tag drop race in
  ax88179a_tx_fixup()
- [Low] net: usb: ax88179_178a: duplicated VLAN filter update logic in
  add/kill vid
--

commit 6bf60c56c4445f3486e6c4282f90f25fbd952f48
Author: Birger Koblitz <mail@birger-koblitz.de>

ax88179_178a: Add VLAN offload support for AX88179A

This commit adds TX VLAN tagging, RX VLAN stripping, and RX VLAN filter
offload configuration for AX88179A-based USB network devices.

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

[Severity: Medium]
Can ax88179a_vlan_rx_add_vid() and ax88179a_set_features() read
uninitialized stack memory from reg8 and tmp when a 1-byte
ax88179_read_cmd() returns 0?

Unlike the size =3D=3D 2 and size =3D=3D 4 cases in ax88179_read_cmd(), a 1=
-byte
read passes the caller's pointer directly to __usbnet_read_cmd(), which
only copies into data when usb_control_msg() returns err > 0.  If a short
transfer returns 0, reg8 here and tmp in the NETIF_F_HW_VLAN_CTAG_FILTER
disable and NETIF_F_HW_VLAN_CTAG_RX paths of ax88179a_set_features() are
left uninitialized and then written back to AX88179A_VLAN_ID_CONTROL,
corrupting the register and leaking a stack byte over USB.

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

[Severity: Low]
This isn't a bug, but ax88179a_vlan_rx_kill_vid() and
ax88179a_vlan_rx_add_vid() duplicate the same five-step register sequence
and only differ in whether they clear or set the bit in reg16 (and the two
copies have already diverged in how reg8 and reg16 are initialized).  A
shared helper taking a boolean flag would avoid the duplication.

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
> +						 1, vlan_state | AX_VLAN_CONTROL_WE);\n> +			}

[Severity: Medium]
Should the three USB writes inside this loop check for errors and break out
early?

If a write fails transiently and the final AX_VLAN_CONTROL_VFE write
succeeds, hardware VLAN filtering is enabled with stale entries left in the
filter table.  On a persistent USB error or timeout, the loop runs all 768
synchronous control transfers under rtnl_lock, stalling for up to 768 *
USB_CTRL_SET_TIMEOUT and logging a warning on each failed transfer.

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

[Severity: Medium]
Can a failure partway through ax88179a_set_features() leave hardware
offload state out of sync with net->features?

When multiple features change in one call (for example, enabling both
NETIF_F_HW_VLAN_CTAG_FILTER and NETIF_F_HW_VLAN_CTAG_RX) and the later
step fails, returning a negative error causes __netdev_update_features() to
leave dev->features unchanged and skip vlan_get_rx_ctag_filter_info().
AX_VLAN_CONTROL_VFE (or checksum offload changes from
ax88179_set_features()) then stays active in hardware with an all-zero
filter table while dev->features still reports the feature as disabled.

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
Does enabling NETIF_F_HW_VLAN_CTAG_TX here expose a race in
ax88179a_tx_fixup() that drops VLAN tags when the feature is toggled?

drivers/net/usb/ax88179a_devices.c:ax88179a_tx_fixup() {
    ...
	if ((dev->net->features & NETIF_F_HW_VLAN_CTAG_TX) && (vlan_get_tag(skb, &=
tci) >=3D 0)) {
		tx_desc |=3D AX179A_TX_DESC_VLAN;
		tx_desc |=3D FIELD_PREP(AX179A_TX_DESC_VLAN_ID, (u64)tci);
	}
    ...
}

CPU0                                  CPU1
validate_xmit_skb()
  validate_xmit_vlan()
    /* NETIF_F_HW_VLAN_CTAG_TX set:
     * tag stays in skb->vlan_tci
     */
                                      __netdev_update_features()
                                        dev->features &=3D
                                          ~NETIF_F_HW_VLAN_CTAG_TX;
ax88179a_tx_fixup()
  if (dev->net->features &
      NETIF_F_HW_VLAN_CTAG_TX)
    <-- false, frame sent untagged

ax88179a_tx_fixup() (added in commit "ax88179_178a: Add HW support for
AX179A-based chips") checks dev->net->features & NETIF_F_HW_VLAN_CTAG_TX
and calls vlan_get_tag() instead of checking skb_vlan_tag_present(skb) and
skb_vlan_tag_get(skb).  If NETIF_F_HW_VLAN_CTAG_TX is cleared after
validate_xmit_vlan() has already left the tag out-of-band in skb->vlan_tci,
the frame is transmitted without its VLAN tag.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-ax88179a-v=
20-0-37b5a1189983@birger-koblitz.de?part=3D7
