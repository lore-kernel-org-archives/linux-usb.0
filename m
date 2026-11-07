Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794036114;
	b=LwKuNby8aOm5Dw9+3evkgjB3OR0BdXz6qoQ8YeDNBw6mpeyUy87RI/LoxmIBHgwR2yyC
	 E9Jdqh/9zgLQ6g8LwngDV672bvA8PpRxYdOZ+m3RtUDbsA9xJ8N4CKVaya4onL5j1CVxm
	 ibGsuRwgKkU+t3cywMChcaKnlmsd/8QPYzOoWWxF1oRD/KExwKSB8nLHnNcC4aFxwW2Ry
	 8K0lQzZhCdy5ehLDmUWfymq8cM812ff+N3BOCKpNiHfzbN9mr/RQilPjmEoqzXXgwtLq5
	 Iis0Cd12K/uL4ANqXZ/vFV/6PuTBra4e1ES9/xx303wetSrx0LbaZtPPKRyzntsMnXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794036114;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Y+gLa+a1qI4Gp0mpq9I+mnEt9AaYfyfBic0+FSXs+Dw=;
	b=LK+jakqcMr7Gl4e92JZs7bQtsLmDVzamEA0q0GtHAmq303ed3pzeTnVTYee/piDTM0VL
	 3bMiWjYBdsrMKcTcYd5ioPUs7VTkfMNYHqnARG8bkx1xuXUywUpWSRyxUz34WZjkk2M4m
	 iDkvK6Im1hpmif7gGJVfOcY00CJs/ct1FUopS/JThcjOPPIezKAz7O6yrUaanw/K/BGD/
	 +INz/x04Q6kIbQCZ6GFOJTTfbToAxqk3WQzzGTJ1/kZW9eec2ukZ5pjPJRVPN74ATsFOg
	 WJVgSCmls7wBEqnusbINu6MxTCoZ82iAQ9hHBEtjNXfsKMDqQ+n9B+an62ARV+oj0ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cdix3qhO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D59F606A326
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 07:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cdix3qhO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FF721F008A1;
	Sat,  7 Nov 2026 07:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794036114;
	bh=Y+gLa+a1qI4Gp0mpq9I+mnEt9AaYfyfBic0+FSXs+Dw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cdix3qhOxYf+I44yQ+O11dGo0CluTonthmbzXRTfK0sUE/cHJ55apx7q+WLe3JO5P
	 ViJXPquytecotYJ3VC88pRnEhyisJqTfffpHhANJhnACexGM5s0hhIE2CzfhYq4utT
	 iwj6NKbCOVnzkIbcDRGEv7V/uohsgKOedsNIvAiR1yirw1mzTZhbisoCWBVq5znh02
	 bEQ/LtNTHephWjRoFYaeR1dy2Ig5unsqsOLpCmJeNlw0hKDXf423ZmianWjN0+quke
	 HNdrPOUzo6q+6VDmRwLKi/+ra9vscajBHniYFxbOuCS2KlvaI2jAETd6wp067GGIVp
	 qmPRwk2j6P6iw==
Message-ID: <sashiko-outbox-202698@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v20 08/13] ax88179_178a: Add AX179A/AX279
 multicast configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-ax88179a-v20-8-37b5a1189983@birger-koblitz.de>
References: <20261106-ax88179a-v20-0-37b5a1189983@birger-koblitz.de>
 <20261106-ax88179a-v20-8-37b5a1189983@birger-koblitz.de>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] net: usb: ax88179: TOCTOU race updating AX_RX_CTL in
  ax88179_set_multicast()
--

commit f3a2f1850ef2ba90e3243642ec0642d91a64aa9a
Author: Birger Koblitz <mail@birger-koblitz.de>

ax88179_178a: Add AX179A/AX279 multicast configuration

This commit updates ax88179_set_multicast() to configure AX_RX_CTL_DROPCRCE=
RR
and conditionally set AX_RX_CTL_IPE, and wires it up as .ndo_set_rx_mode in
ax88179a_netdev_ops.

> diff --git a/drivers/net/usb/ax88179_lib.c b/drivers/net/usb/ax88179_lib.c
> index a314db4c97666..b4b00c8b4b623 100644
> --- a/drivers/net/usb/ax88179_lib.c
> +++ b/drivers/net/usb/ax88179_lib.c
> @@ -321,16 +321,21 @@ int ax88179_set_eeprom(struct net_device *net, stru=
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
> @@ -351,9 +356,10 @@ void ax88179_set_multicast(struct net_device *net)
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
Can a concurrent ax88179a_mac_link_up() overwrite AX_RX_CTL with a stale
rxctl value after ax88179_set_multicast() updates it?

ax88179_set_multicast() runs in BH context under netif_addr_lock_bh(net),
while ax88179a_mac_link_up() runs in process context from the phylink resol=
ve
workqueue under medium_status_mutex:

drivers/net/usb/ax88179a_devices.c:ax88179a_mac_link_up() {
    ...
	ax88179_write_u16(dev, AX_ACCESS_MAC, AX_RX_CTL, 2, READ_ONCE(ax179_data->=
rxctl));
	mutex_unlock(&ax179_data->medium_status_mutex);
    ...
}

If an RX mode update (such as an IPv6 MLD multicast join on link up) runs
while ax88179a_mac_link_up() is entering usbnet_write_cmd(), the control UR=
Bs
can be queued in the reverse order of the data->rxctl accesses:

CPU0 (kworker)                        CPU1 (<softirq>)
ax88179a_mac_link_up()
  val =3D READ_ONCE(ax179_data->rxctl)
  ax88179_write_u16(..., val)
    ...
      usb_autopm_get_interface()
                                      ax88179_set_multicast()
                                        WRITE_ONCE(data->rxctl, rxctl)
                                        ax88179_write_cmd_async(...)
                                          usb_submit_urb()  [new rxctl]
      usb_control_msg()  [old val]
        <-- overwrites AX_RX_CTL with stale rxctl

This leaves the hardware AX_RX_CTL register out of sync with data->rxctl and
silently drops multicast or promiscuous traffic until the next RX mode or
link state change.  Deferring the work via usbnet_defer_kevent(dev,
EVENT_SET_RX_MODE) or re-checking rxctl in ax88179a_mac_link_up() would avo=
id
the race.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-ax88179a-v=
20-0-37b5a1189983@birger-koblitz.de?part=3D8
