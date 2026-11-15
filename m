Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739916;
	b=Die6qgAjggGPVmuhwiqHrCQ46zErYG1rft7CD5jCN+RGawCcDqPoi1KfVpDIC81+L/Mo
	 XUTk3vQMxPmiIKvHQ6/Ui79LPVCpG6odWVwfCuq3uCQHBH3MtJsWnj6BrvlFfop8T0DnQ
	 ZlVcSnuhbPt/Sd24t0Fmpedlm6VRNCjc0F0KIxiXGGvlal4/5aj8/O8095VEnaCj2fbvk
	 nrnI8e83YExguME45+AzCPOkCClB903m/7Za61USVHlloF5N7nRXldl7zfx7/Ee5e/BEj
	 pO+Fr2DMDvvKWW+ZEQ70ecgMd4/nbMgcf7xxYaPTehezzROiv3nTsyECORcT+owBgXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739916;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1QOCy+MvQwz2AaAfRh95ND32y4lKsyWsgmUD9ygXvXk=;
	b=gSVu+LpR2xyeLTXGM53uwYjbYMLa+q1yeRP3UdIW+PbKP2RzQ/C608ohMfuKqDw1VXmJ
	 ynRM00RHteh2rY3Jx9pdtmGAjgBEEsG4O0fNQDHtSMaWzks2arKXy6YCfA6oc/I8INkst
	 jdPK0PCCkqACKuwgoUGgqLFVFG3A4RzdFK5EveA3QzmcWJBbTP1LRB6HR3dKUURxgQUuZ
	 2w9M3tXWyzmFTp0UGzhGsa6/cT9KBXmCcI2zC9wwWGcsbsw12ZFB9mqzln9v+R2qiUPkU
	 aV1hMTJeHL2wtlbO8naJ6fazADsNqa/+jJdt8/uA+b47+IBtAjh2gibXJ9qJIfc1+QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iIZLsY1E;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B215606A331
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 10:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iIZLsY1E
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDD0E1F000C4;
	Sun, 15 Nov 2026 10:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739916;
	bh=1QOCy+MvQwz2AaAfRh95ND32y4lKsyWsgmUD9ygXvXk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iIZLsY1E9FHLIRwzoWpMBQXXUZfUKvTyve6eN5wGho5kVmVve/84WbpPyVtr4de9X
	 SoURQJ5zE5q/D9HqDWU53tUPDj6r9awkRiQ9RDne3IenTRLhQGrBhZli82UL4L9Ooh
	 W0fnglNPEKixujZYPI/XVdGYXs2Zkx+GioXpYj3qtIp+6z/7JTWrVDEHHfwG6c8FEx
	 E4PwOzmSF2BvZHpcrZ8L2nPXFSn9EUAuobEMLT8kBL2DKNTXgCt6njIlXzMQdHihyW
	 +JPtd0VwOTSimJ6sinfwjXFa41sfq4/vD4zKrYm8+fpJo4RM0r/uT5mkzGD/NQeaW1
	 5nXEIm70fZnxA==
Message-ID: <sashiko-outbox-215421@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v21 08/13] ax88179_178a: Add AX179A/AX279
 multicast configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261114-ax88179a-v21-8-c2d34410bcbe@birger-koblitz.de>
References: <20261114-ax88179a-v21-0-c2d34410bcbe@birger-koblitz.de>
 <20261114-ax88179a-v21-8-c2d34410bcbe@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 10:51:55 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] net: usb: ax88179: unsynchronized AX_RX_CTL updates in
  ax88179_set_multicast()
--

commit f349443476b08db9f2083703ec74ef889b46544c
Author: Birger Koblitz <mail@birger-koblitz.de>

ax88179_178a: Add AX179A/AX279 multicast configuration

This commit updates ax88179_set_multicast() to set AX_RX_CTL_DROPCRCERR
and conditionally set AX_RX_CTL_IPE based on data->ip_align, and wires it
up as .ndo_set_rx_mode in ax88179a_netdev_ops.

> diff --git a/drivers/net/usb/ax88179_lib.c b/drivers/net/usb/ax88179_lib.c
> index fa6423f51849e..f27b073e1bccb 100644
> --- a/drivers/net/usb/ax88179_lib.c
> +++ b/drivers/net/usb/ax88179_lib.c
> @@ -319,16 +319,21 @@ int ax88179_set_eeprom(struct net_device *net, stru=
ct ethtool_eeprom *eeprom, u8
>  void ax88179_set_multicast(struct net_device *net)
>  {
>  	struct usbnet *dev =3D netdev_priv(net);
> -	struct ax88179_data *data =3D dev->driver_priv;
>  	u8 *m_filter =3D ((u8 *)dev->data);
> +	struct ax88179_data *data;
> +	u16 rxctl =3D 0;
> +
> +	data =3D dev->driver_priv;
> =20
> -	data->rxctl =3D (AX_RX_CTL_START | AX_RX_CTL_AB | AX_RX_CTL_IPE);
> +	rxctl =3D (AX_RX_CTL_START | AX_RX_CTL_AB | AX_RX_CTL_DROPCRCERR);
> +	if (data->ip_align)
> +		rxctl |=3D AX_RX_CTL_IPE;
> =20
>  	if (net->flags & IFF_PROMISC) {
> -		data->rxctl |=3D AX_RX_CTL_PRO;
> +		rxctl |=3D AX_RX_CTL_PRO;
>  	} else if (net->flags & IFF_ALLMULTI ||
>  		   netdev_mc_count(net) > AX_MAX_MCAST) {
> -		data->rxctl |=3D AX_RX_CTL_AMALL;
> +		rxctl |=3D AX_RX_CTL_AMALL;
>  	} else if (netdev_mc_empty(net)) {
>  		/* just broadcast and directed */
>  	} else {
> @@ -349,9 +354,10 @@ void ax88179_set_multicast(struct net_device *net)
>  					AX_MCAST_FLTSIZE, AX_MCAST_FLTSIZE,
>  					m_filter);
> =20
> -		data->rxctl |=3D AX_RX_CTL_AM;
> +		rxctl |=3D AX_RX_CTL_AM;
>  	}
> =20
> +	WRITE_ONCE(data->rxctl, rxctl);
>  	ax88179_write_cmd_async(dev, AX_ACCESS_MAC, AX_RX_CTL,
>  				2, 2, &data->rxctl);
>  }
> diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179=
a_devices.c
> index 4207d2cc2b865..a6b0a3f47118c 100644
> --- a/drivers/net/usb/ax88179a_devices.c
> +++ b/drivers/net/usb/ax88179a_devices.c
> @@ -678,6 +678,7 @@ static const struct net_device_ops ax88179a_netdev_op=
s =3D {
>  	.ndo_set_mac_address	=3D ax88179_set_mac_addr,
>  	.ndo_validate_addr	=3D eth_validate_addr,
>  	.ndo_eth_ioctl		=3D ax88179a_mii_ioctl,
> +	.ndo_set_rx_mode	=3D ax88179_set_multicast,
>  	.ndo_set_features	=3D ax88179a_set_features,
>  	.ndo_vlan_rx_add_vid	=3D ax88179a_vlan_rx_add_vid,
>  	.ndo_vlan_rx_kill_vid	=3D ax88179a_vlan_rx_kill_vid,

[Severity: Medium]
Can ax88179_set_multicast() race with ax88179a_mac_link_up() when writing
AX_RX_CTL?

ax88179_set_multicast() runs in BH context under netif_addr_lock_bh(),
while phylink runs ax88179a_mac_link_up() in process context without any
shared lock:

drivers/net/usb/ax88179a_devices.c:ax88179a_mac_link_up() {
	/* Stop RX/TX for link configuration */
	ax88179_write_u16(dev, AX_ACCESS_MAC, AX_RX_CTL, 2, AX_RX_CTL_STOP);
	...
	mutex_lock(&ax179_data->medium_status_mutex);
	if (dev->net->mtu > 1500)
		mode |=3D AX_MEDIUM_JUMBO_EN;
	ax88179_write_u16(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE, 2, mode);

	ax88179_write_u16(dev, AX_ACCESS_MAC, AX_RX_CTL, 2, READ_ONCE(ax179_data->=
rxctl));
	mutex_unlock(&ax179_data->medium_status_mutex);
}

WRITE_ONCE() and READ_ONCE() only protect the in-memory ax179_data->rxctl
load and store, not the USB control transfers to AX_RX_CTL:

CPU0 (kworker)                        CPU1 (<softirq>)
ax88179a_mac_link_up()
  val =3D READ_ONCE(ax179_data->rxctl)
                                      ax88179_set_multicast()
                                        WRITE_ONCE(data->rxctl, rxctl)
                                        ax88179_write_cmd_async(..., AX_RX_=
CTL, ...)
                                          usb_submit_urb()
  ax88179_write_u16(..., AX_RX_CTL, val)
    usb_control_msg()  <-- overwrites AX_RX_CTL with stale val

This leaves the hardware AX_RX_CTL filter out of sync with data->rxctl
when RX mode updates (such as IPv6 MLD joins during interface bring-up)
overlap with link resolution.  In addition, if ax88179_set_multicast()
runs while ax88179a_mac_link_up() is between writing AX_RX_CTL_STOP and
restoring AX_RX_CTL at the end of link setup, its asynchronous write sets
AX_RX_CTL_START and re-enables RX in the middle of MAC and bulk-in queue
reconfiguration.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-ax88179a-v=
21-0-c2d34410bcbe@birger-koblitz.de?part=3D8
