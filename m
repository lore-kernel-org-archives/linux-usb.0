Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795847832;
	b=P7NGuobjFhLHH4Cocm/zn5YfMl/T3pDvned0y90j9TWr4Xs56lpFcMW3Ewgqxx4xzhIB
	 Pj4WFeZWDFr8unVpSPbMX8y8AYnKQLQoFyo89gSyr9sOGGt3v9a6DGL/EDbkt0wn0smZJ
	 +7WHwMky1Qk3JxLJRv0857QgrUlntwkdqe+wWSuZ5l2yt3D3Hk8I3LkhZgwTPHFQlHi/0
	 9yC2lp6GXg9zkvLmV+jTJp2T8F6ck9ZUj9WnFYHwWMaYvu2wErI8KQQYaW0wRpsAcw4xw
	 zXjrSamKDJaNveKl+7izzKUvQT5xxm8uOprF3D/aUamyXmo2jbUdK0sYI+6OwXwcG6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795847832;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5eLZScqjL3D+BnrmhVxrnIMCxFY75qonLZbQ9yPAmcc=;
	b=yUmkTzpxZheryQ9UGP0R8ClIkuPImolXqnNp1LAUqmGUNz2lGfaZ1gwN8XzE/lxRQI7p
	 +n7WBxUKeaPBtzO4NIXn2RbZgITiilpDIyGdjpVbZcApwkBc17s/PDMBGzQlBy9FKYUke
	 DdmKlLa+RFB+x/06uKhDOKhcKim1nAosdcPEmFmKfJMUCD1nYs7SbTaLt3QNw3wzB1QXj
	 HLC8+vEdA+VsPq5wuX7h6bcXDlQSn/aY57bjmBrLHe9Ja+J1h9w/snHNL5JCZza55364V
	 HpqnD0gmh5aJz86mhfKIGwf4baG1ppkkaS5Pe/Up+usXevYZFzdNEKCH+eDyveQa/LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ig8B2MRm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F230606A31C
	for <linux-usb@vger.kernel.org>; Sat, 28 Nov 2026 06:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ig8B2MRm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFB011F000C1;
	Sat, 28 Nov 2026 06:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795847832;
	bh=5eLZScqjL3D+BnrmhVxrnIMCxFY75qonLZbQ9yPAmcc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ig8B2MRmUegu8rpViJVHKlEs6wbGT5Ub8lbhR1jV3nOvktRci5NPm2RlQaZR8Cty6
	 WvJfCxSq0lZkxb2HrtrtAeh7CybM3WQBnGMQLuki9tJmulV/p/IwrR6s4ADFc7TpFK
	 +fWAnHFoOJyHm3RfFYvjx+bhg8wDZzO2f7DzZPrsHIfYZV1qnKfZqZrOMjSakmpo4O
	 IK8ANQ4zrT8LvseNW+HMp0+Tz88C9Y+qys4poTmsY3bflIngfNFm1ElrJd2qLjaFUS
	 Vj/wuS1gIWfeNClJkD7mnjL8nr/Ctyb4GtrIMK5dD6mprUbZckS9TBQlSBjzZOIHni
	 bRc6Z+g5+h/FQ==
Message-ID: <sashiko-outbox-238500@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 2/2] net: usb: ax88179: Support NETIF_F_RXFCS
 and NETIF_F_RXALL on AX88179A
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261127-fcs-v1-2-0c4ede015bf5@birger-koblitz.de>
References: <20261127-fcs-v1-0-0c4ede015bf5@birger-koblitz.de>
 <20261127-fcs-v1-2-0c4ede015bf5@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 28 Nov 2026 06:37:11 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] net: usb: ax88179: 32-bit truncation of features in
  ax88179a_rx_fixup()
- [Medium] net: usb: ax88179: unwanted FCS appended on RXALL in
  ax88179a_rx_fixup()
- [Medium] net: usb: ax88179: unsynchronized rxctl update in
  ax88179a_set_features()
- [Low] net: usb: ax88179: incomplete CRC error stats in
  ax88179a_rx_fixup()
--

commit 1060139744fbd9f7c43f8f37047d38dafe16412f
Author: Birger Koblitz <mail@birger-koblitz.de>

net: usb: ax88179: Support NETIF_F_RXFCS and NETIF_F_RXALL on AX88179A

This commit adds NETIF_F_RXFCS and NETIF_F_RXALL support for AX88179A,
adjusts the RX length check for the trailing FCS, and updates RX drop and
CRC error statistics in ax88179a_rx_fixup().

> diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179=
a_devices.c
> index 69095110e7043..a6b35ad7d5404 100644
> --- a/drivers/net/usb/ax88179a_devices.c
> +++ b/drivers/net/usb/ax88179a_devices.c
> @@ -717,10 +717,12 @@ static int ax88179a_mii_ioctl(struct net_device *ne=
t, struct ifreq *rq, int cmd)
>  static int ax88179a_set_features(struct net_device *net, netdev_features=
_t features)
>  {
>  	struct usbnet *dev =3D netdev_priv(net);
> +	struct ax88179_data *ax179_data;
>  	netdev_features_t changed;
>  	int ret;
>  	u8 tmp;
> =20
> +	ax179_data =3D dev->driver_priv;
>  	changed =3D net->features ^ features;
> =20
>  	ret =3D ax88179_set_features(net, features);
> @@ -780,6 +782,18 @@ static int ax88179a_set_features(struct net_device *=
net, netdev_features_t featu
>  		if (ret < 0)
>  			return ret;
>  	}
> +
> +	if (changed & (NETIF_F_RXFCS | NETIF_F_RXALL)) {
> +		u16 rxctl =3D READ_ONCE(ax179_data->rxctl);
> +
> +		if (features & (NETIF_F_RXFCS | NETIF_F_RXALL))
> +			rxctl |=3D AX_RX_CTL_DROPCRCERR;
> +		else
> +			rxctl &=3D ~AX_RX_CTL_DROPCRCERR;
> +		WRITE_ONCE(ax179_data->rxctl, rxctl);
> +		ax88179_write_u16(dev, AX_ACCESS_MAC, AX_RX_CTL, 2, rxctl);
> +	}
> +
>  	return 0;
>  }

[Severity: Medium]
Can this unlocked update to ax179_data->rxctl and AX_RX_CTL race with
ax88179_set_multicast() and ax88179a_mac_link_up()?

__netdev_update_features() calls ndo_set_features() before assigning
net->features =3D features, while ax88179_set_multicast() runs under
netif_addr_lock_bh(net) without rtnl_lock and rebuilds rxctl from
net->features:

CPU0                                  CPU1
__netdev_update_features()
  ax88179a_set_features()
    rxctl |=3D AX_RX_CTL_DROPCRCERR
    WRITE_ONCE(ax179_data->rxctl, ...)
    ax88179_write_u16(..., AX_RX_CTL)
                                      dev_mc_add()
                                        ax88179_set_multicast()
                                          reads old net->features
                                          WRITE_ONCE(data->rxctl, rxctl)
                                          ax88179_write_cmd_async(...)
                                            <-- reverts AX_RX_CTL_DROPCRCERR
  net->features =3D features

If ax88179_set_multicast() instead runs between READ_ONCE() and
WRITE_ONCE() in ax88179a_set_features(), ax88179a_set_features()
overwrites the new multicast bits in rxctl.  In addition,
ax88179a_mac_link_up() runs from the phylink workqueue under
ax179_data->medium_status_mutex without rtnl_lock, temporarily writing
AX_RX_CTL_STOP to AX_RX_CTL before restoring ax179_data->rxctl, so an
unsynchronized ax88179_write_u16() here can re-enable RX in the middle of
link configuration.

[ ... ]

> @@ -1039,9 +1058,14 @@ static int ax88179a_rx_fixup(struct usbnet *dev, s=
truct sk_buff *skb)
>  	pkt_end =3D 0;
>  	while (pkt_cnt--) {
>  		u64 pkt_desc =3D get_unaligned_le64(pkt_desc_ptr);
> +		long features =3D dev->net->features;
>  		u32 pkt_len_plus_padd;
> +		u32 fcs_trailer =3D 0;
>  		u32 pkt_len;
> =20
> +		if (features & (NETIF_F_RXFCS | NETIF_F_RXALL))
> +			fcs_trailer =3D ETH_FCS_LEN;

[Severity: High]
Does storing dev->net->features in a long truncate away NETIF_F_RXFCS and
NETIF_F_RXALL on 32-bit architectures?

netdev_features_t is u64, with NETIF_F_RXFCS at bit 43 and NETIF_F_RXALL
at bit 44.  On 32-bit platforms a long is 32 bits, so features never has
either bit set: fcs_trailer remains 0 even though AX_RX_CTL_DROPCRCERR
causes the hardware to append the 4-byte FCS, dropping full-MTU frames as
oversized and still discarding errored frames when NETIF_F_RXALL is
enabled.  Declaring features as netdev_features_t avoids the truncation.

[Severity: Medium]
When NETIF_F_RXALL is enabled without NETIF_F_RXFCS, does this deliver an
unwanted 4-byte FCS at the end of every received skb?

Setting AX_RX_CTL_DROPCRCERR for NETIF_F_RXALL causes the AX88179A to
append the 4-byte FCS to received frames, and ax88179a_rx_fixup() copies
all pkt_len bytes into ax_skb without stripping ETH_FCS_LEN when
NETIF_F_RXFCS is off.

>  		pkt_len =3D FIELD_GET(AX179A_RX_PD_LEN, pkt_desc);
>  		pkt_len -=3D (ax179_data->ip_align ? 2 : 0);
>  		pkt_len_plus_padd =3D ((pkt_len + 7 + (ax179_data->ip_align ? 2 : 0)) =
& 0x7FFF8);
> @@ -1050,10 +1074,18 @@ static int ax88179a_rx_fixup(struct usbnet *dev, =
struct sk_buff *skb)
>  		if (pkt_end > hdr_off || (pkt_cnt =3D=3D 0 && pkt_end !=3D hdr_off))
>  			goto err;
> =20
> -		if (pkt_desc & AX179A_RX_PD_DROP || !(pkt_desc & AX179A_RX_PD_RX_OK) ||
> -		    pkt_len > (dev->hard_mtu + AX179A_RX_HW_PAD) || pkt_len < 2 + ETH_=
HLEN) {
> +		if (((pkt_desc & AX179A_RX_PD_DROP || !(pkt_desc & AX179A_RX_PD_RX_OK)=
) &&
> +		     !(features & NETIF_F_RXALL)) ||
> +		    pkt_len > dev->hard_mtu + AX179A_RX_HW_PAD + fcs_trailer ||
> +		    pkt_len < 2 + ETH_HLEN) {
>  			skb_pull(skb, pkt_len_plus_padd);
> =20
> +			if (pkt_desc & AX179A_RX_PD_DROP)
> +				dev->net->stats.rx_dropped++;
> +
> +			if (!(pkt_desc & AX179A_RX_PD_RX_OK))
> +				dev->net->stats.rx_crc_errors++;
> +
>  			/* Next RX Packet Descriptor */
>  			pkt_desc_ptr++;
>  			continue;

[Severity: Low]
Should CRC errors also increment dev->net->stats.rx_errors and be counted
when NETIF_F_RXALL is enabled?

Because ax88179a_info sets FLAG_MULTI_PACKET and ax88179a_rx_fixup() skips
bad sub-packets with continue before returning 1, usbnet's rx_process()
does not increment dev->net->stats.rx_errors for them, leaving
rx_crc_errors unreflected in the total rx_errors count.  Also, because the
check is inside the !(features & NETIF_F_RXALL) discard branch, frames
with bad CRC received while NETIF_F_RXALL is enabled are not counted in
rx_crc_errors at all.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-fcs-v1-0-0=
c4ede015bf5@birger-koblitz.de?part=3D2
