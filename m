Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED595311C35
	for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 04:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791694495; cv=none; b=pJTY5HAEBbstRfzm7HYtmWlPrxlRsmkCGarXKSWofMv8uPFCL7QiKi8xUzTxluAIaGmOhQfyhPGJt6yMsyqS6LBVoSWEW7ydhWZnVS4mz6JPWGBLnfFPfgveeYJISo5k3HGjCb2S5djyEJE8NJXx5qUynfolb9X1jjkbeiZJL1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791694495; c=relaxed/simple;
	bh=7gBSGWLGD9ST0/Hmtf0pN+e531s4d/FYIeLOfOhJVG8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=dlaF9keWYVersBz9z/VGCEgkA909dRoTvnZmjiNgCLaq4D6JJQ1TFAtDxRjCFa/pQ6UWZjN2y6VWpm0t1f5PlBSKAdhq1s13xbMzrXHjunvC+Qzhsl3LmpVrFRo8XyLRKCyW3xzDJnBNCzhgPQoW7ee5H5+73dAr9xk+rkhIYak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UhVpgw+k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UhVpgw+k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB8A1F0089C;
	Sun, 11 Oct 2026 04:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791694493;
	bh=72YGL0vVYC3Mo7WgVtoBm3weRRA8EpRtulfL7GZWrws=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UhVpgw+kzCeIakz8bhyV9KJgtNAc2MzR6FbxqCGX4VB11hYxW8v52xWiypSJzg2jL
	 wWv9ROC2xewpoXsjQ9jXe0sebb7cR66K6XuzEyGkYO3M5iNbGSLO+LLStjzMIIAXGv
	 sJyb8eGVup+AYHuzQ9XmoZdkWEI6w9lWznRSjTbaw3UCHFcLyAfIM2SnZ+EYczeK/f
	 ufjVO6SNke41BCoa99PDH7TNQChj4Hn+lrEXHh0LsgAM3LaxddhDwkScTpFLgM/ump
	 N1l5hJKYMQQFOBjq6nYymjjurao2Cu5enGUvqpv6X5sT386VFgmN3R58fZq3PPsKE0
	 jcZiUh8JIrQrA==
Message-ID: <sashiko-outbox-167009@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v19 07/13] ax88179_178a: Add VLAN offload
 support for AX88179A
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261010-ax88179a-v19-7-7475173cfb56@birger-koblitz.de>
References: <20261010-ax88179a-v19-0-7475173cfb56@birger-koblitz.de>
 <20261010-ax88179a-v19-7-7475173cfb56@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 04:54:53 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] net/usb: ax88179a: missing hardware VLAN filter restore on resume/=
reset
- [Medium] ax88179a: TOCTOU race in TX VLAN offload drops tags on ethtool t=
oggle
- [Medium] usbnet: uninitialized stack variable on short read in ax88179_re=
ad_cmd callers
- [Medium] net: ax88179_178a: missing error checks in VLAN filter init loop=
 causes syslog flood
--

commit 72ebe9676fd7ac72cac32f21e8967a26afd4c569
Author: Birger Koblitz <mail@birger-koblitz.de>

    ax88179_178a: Add VLAN offload support for AX88179A
   =20
    The AX88179A-based chips support VLAN offload. Add configuration
    support in netdev_ops. Features supported are:
    NETIF_F_HW_VLAN_CTAG_TX, NETIF_F_HW_VLAN_CTAG_RX
    and NETIF_F_HW_VLAN_CTAG_FILTER.

> diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179=
a_devices.c
> index 272e923656832..4207d2cc2b865 100644
> --- a/drivers/net/usb/ax88179a_devices.c
> +++ b/drivers/net/usb/ax88179a_devices.c
[ ... ]
> @@ -258,6 +258,88 @@ static const struct ethtool_ops ax88179a_ethtool_ops=
 =3D {
[ ... ]
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

[Severity: Medium]
If a USB device returns a 0-byte short read, usb_control_msg() returns 0.
Does ax88179_read_cmd() propagate this 0 here, allowing the error check to
pass?

If so, reg8 would remain uninitialized. Because the 1-byte read path direct=
ly
uses the caller's buffer without explicitly zero-initializing it, this
uninitialized variable is then modified and written back to the USB device.
Can this result in device state corruption and a potential 1-byte kernel st=
ack
memory leak to the USB device?

> +	if (ret < 0)
> +		return ret;
[ ... ]
> @@ -517,6 +599,75 @@ static int ax88179a_mii_ioctl(struct net_device *net=
, struct ifreq *rq, int cmd)
[ ... ]
> +static int ax88179a_set_features(struct net_device *net, netdev_features=
_t features)
> +{
[ ... ]
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
Since this loop iterates 256 times issuing 3 USB control writes each without
checking for errors, what happens if the device experiences transient USB
errors (like -ETIMEDOUT or -EPIPE)?

__ax88179_write_cmd() will log netdev_warn() for every failed write.
Could this spam the kernel log with up to 768 warnings, significantly delay=
ing
execution while holding the RTNL lock, and leaving the device's hardware VL=
AN
filters in an inconsistent state?

> +			vlan_state |=3D AX_VLAN_CONTROL_VFE;
> +			ret =3D ax88179_write_cmd(dev, AX_ACCESS_MAC,
> +						AX88179A_VLAN_ID_CONTROL, 1, 1, &vlan_state);
> +			if (ret < 0)
> +				return ret;
> +		} else {
> +			ret =3D ax88179_read_cmd(dev, AX_ACCESS_MAC,
> +					       AX88179A_VLAN_ID_CONTROL, 1, 1, &tmp);

[Severity: Medium]
Similar to the issue in ax88179a_vlan_rx_add_vid(), if ax88179_read_cmd()
returns 0 due to a 0-byte short read, does tmp remain uninitialized here
before being modified and written back to the device?

> +			if (ret < 0)
> +				return ret;
> +			tmp &=3D ~AX_VLAN_CONTROL_VFE;
> +			ret =3D ax88179_write_cmd(dev, AX_ACCESS_MAC,
> +						AX88179A_VLAN_ID_CONTROL, 1, 1, &tmp);
> +			if (ret < 0)
> +				return ret;
> +		}
> +	}
[ ... ]
> @@ -612,9 +766,11 @@ static int ax88179a_bind(struct usbnet *dev, struct =
usb_interface *intf)
[ ... ]
>  	dev->net->features |=3D NETIF_F_SG | NETIF_F_IP_CSUM |
> -			      NETIF_F_IPV6_CSUM | NETIF_F_RXCSUM | NETIF_F_TSO;
> +			      NETIF_F_IPV6_CSUM | NETIF_F_RXCSUM | NETIF_F_TSO |
> +			      NETIF_F_HW_VLAN_CTAG_TX;

[Severity: Medium]
By enabling NETIF_F_HW_VLAN_CTAG_TX, this activates the TX offload path.
Is there a race condition against ethtool toggles in ax88179a_tx_fixup()?

If the network stack creates an skb with an out-of-band VLAN tag because
NETIF_F_HW_VLAN_CTAG_TX is enabled, and an admin concurrently disables the
feature via ethtool:

ax88179a_tx_fixup() does:
    if ((dev->net->features & NETIF_F_HW_VLAN_CTAG_TX) &&
        (vlan_get_tag(skb, &tci) >=3D 0)) {
        tx_desc |=3D AX179A_TX_DESC_VLAN;

Could it directly read dev->net->features, see it as disabled, and ignore t=
he
tag? This would result in packets with out-of-band VLAN tags losing their t=
ags
and being transmitted as untagged, potentially leaking into the native VLAN.

Should the driver unconditionally check skb_vlan_tag_present(skb) in the TX
path instead of checking device features?

> =20
>  	dev->net->hw_features |=3D dev->net->features;
> +	dev->net->hw_features |=3D NETIF_F_HW_VLAN_CTAG_RX | NETIF_F_HW_VLAN_CT=
AG_FILTER;

[Severity: High]
Does enabling NETIF_F_HW_VLAN_CTAG_FILTER here require restoring the hardwa=
re
VLAN filter table during resume and reset operations?

When the device is resumed from suspend (in ax88179a_resume()), or when a M=
AC
reset is issued (e.g., from usbnet's tx_timeout), the hardware VLAN filter
table is wiped since power was lost or the MAC state was reset.

ax88179a_reset() re-enables the AX_VLAN_CONTROL_VFE bit based on
dev->net->features, but does not appear to restore the previously configured
active VLAN IDs by calling vlan_get_rx_ctag_filter_info(dev->net) or replay=
ing
a cached shadow table.

Will the hardware silently drop all incoming VLAN packets because the VLAN
filter is enabled but the hardware table is empty, breaking all VLAN
connectivity after a suspend/resume cycle?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010-ax88179a-v=
19-0-7475173cfb56@birger-koblitz.de?part=3D7
