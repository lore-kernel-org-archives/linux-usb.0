Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795848162;
	b=P1h11YnGpNxbrgJAnGSlWPle6OB8f81raFP01RzoAsAuEo/jLZDo1K2TKLFLBFwtXAib
	 Zk+nOUK17BMyl6FabH8ymjTClrHbPfHNCDRO0XR/A0gsjIvDb9s2/E2d96103jBS4mH+B
	 IRKRlclQI9IJTJvq7papm56M+l3CxlLEbx5CWRAaVNBOfSBpOvTClFCgRcei6ejj2a8HK
	 4PanKCxZHSgH0UUSbpREhsOQVULNFXHKbsopKLGx7ViuxG993S8n/hy9Prfk/ApG9wlPK
	 HFUBfdDp/jOuLr62DoturyDqRQh3PGS1BzVdr0fblo7c5rE42nrNT3vnePXjNXHWb8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795848162;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=7MTpX8hhNGjTZWQl7NBe9YXeXCQl3edViQj49aUFKvE=;
	b=vjG0Zj3MG1c9oO5u1lEk6P9TCm3iBWWpHQ6LTybcRActw0GGwwIP8A+5X1nfyaDRUG/A
	 Hzfvv74+F3gR4vs52SN1xFQ7uzG8GlfTdpVOIVaZg1oRn6BsDuRJTIzOdZfABgn2hlCNV
	 /oIpsJt65xJ3DCpAB8N6DaknxAFdfMuaqCMfdR2xSZ/bPV5n1DVpz/xqomlG+LMnMq2qi
	 S1RW4oznhZAPPsXHcmS8OcGDNFoiyptM4ZjNzwoaal2HtkLqFZxJYJJXYt/+itFaVkHiK
	 UmQTzcec/PLWHho9yf1yObgvgab0AHlgCoSe65fec5WHtYLsWLcKVEEkZJpA3AhIX5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LQ6Zu6l0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9078606A321;
	Sat, 28 Nov 2026 06:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LQ6Zu6l0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 577CD1F000C1;
	Sat, 28 Nov 2026 06:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795848161;
	bh=7MTpX8hhNGjTZWQl7NBe9YXeXCQl3edViQj49aUFKvE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LQ6Zu6l0WKSvjktWjdIxbkemFnoW7r7CQQYAxb4ApbHA9zfbLS5NzmNsD9g6JSg9f
	 PXfkx8yCMr6/izQf9fnhhA1V2cDnUNDZldjavYtKMUY5WQPmw+Tfg1kvmHgN8KDBc+
	 VDmjYtE5q8br0+KGlzsa+UaWJL0rnu1c8FueZsRSiiXtcZW3ImJjhmiLh7u/NakMjQ
	 fiYt9yO15HRv2Hp6JuLDD9m5xmJA1HA260berd7HXbqTHHhiLcG7ILDhD1jl1YuWWu
	 wsTca9mtxAujz2Vti+IvAceZIr1zxpzY/Y1RFJISeVOf1ucrbtDNKJxqWjkK34i1P+
	 bph8Ce9C9Je8g==
Subject: Re: [PATCH net-next 2/2] net: usb: ax88179: Support NETIF_F_RXFCS and
 NETIF_F_RXALL on AX88179A
From: netdev-bot+sashiko@kernel.org
To: mail@birger-koblitz.de
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, benjamin.larsson@genexis.eu
Date: Sat, 28 Nov 2026 06:42:40 +0000
Message-ID: <179584816093.3135.9746795203481608268@kernel.org>
In-Reply-To: <20261127-fcs-v1-2-0c4ede015bf5@birger-koblitz.de>
References: <20261127-fcs-v1-2-0c4ede015bf5@birger-koblitz.de>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 7 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 4 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In ax88179a_rx_fixup()
  (drivers/net/usb/ax88179a_devices.c:1061) the patch copies the 64-bit…
- [Medium] Enabling only NETIF_F_RXALL, with NETIF_F_RXFCS off, also
  turns on FCS appending.
- [Medium] The new error accounting in ax88179a_rx_fixup() (lines
  1083-1087) breaks the rtnl_link_stats64 rules.
- [Medium] The new RXFCS/RXALL block in ax88179a_set_features() (lines
  786-795) does an unlocked read-modify-write of ax179_data->rxctl…
- [Low] The two functions that rebuild AX_RX_CTL use different chip-
  version tests to force AX_RX_CTL_DROPCRCERR.
- [Low] In ax88179a_set_features() the new RXFCS/RXALL block ignores the
  return value of `ax88179_write_u16(dev, AX_ACCESS_MAC, AX_RX_CTL, 2,…
- [Low] The new AX_RX_CTL write in ax88179a_set_features() (line 794)
  writes the cached rxctl, which always has AX_RX_CTL_START set,…

--

net: usb: ax88179: Support NETIF_F_RXFCS and NETIF_F_RXALL on AX88179A

This commit advertises NETIF_F_RXFCS and NETIF_F_RXALL on the AX88179A.
It makes AX_RX_CTL_DROPCRCERR (FCS append) depend on those features.
It also allows for a trailing FCS in the ax88179a_rx_fixup() length
check and counts dropped and errored frames.

> diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179a_devices.c
> index 69095110e7043..a6b35ad7d5404 100644
> --- a/drivers/net/usb/ax88179a_devices.c
> +++ b/drivers/net/usb/ax88179a_devices.c

[ ... ]

> @@ -780,6 +782,18 @@ static int ax88179a_set_features(struct net_device *net, netdev_features_t featu
>  		if (ret < 0)
>  			return ret;
>  	}
> +
> +	if (changed & (NETIF_F_RXFCS | NETIF_F_RXALL)) {
> +		u16 rxctl = READ_ONCE(ax179_data->rxctl);
> +
> +		if (features & (NETIF_F_RXFCS | NETIF_F_RXALL))
> +			rxctl |= AX_RX_CTL_DROPCRCERR;

[Severity: Medium]
Should enabling only rx-all also turn on FCS appending here? The same
coupling is in ax88179a_reset() and ax88179_set_multicast().

The earlier commit in this series, "net: usb: ax88179: Make receiving FCS
on AX88179A configurable", says this bit makes the MAC keep the FCS. It
also says the bit "has no influence on dropping of corrupt frames". So
rx-all does not seem to need it.

ax88179a_rx_fixup() expects the FCS under RXALL, but never trims it when
NETIF_F_RXFCS is off:

	skb_put(ax_skb, pkt_len);

With "ethtool -K <dev> rx-all on" and rx-fcs off, won't every frame reach
the stack with 4 trailing FCS bytes? netdev-features.rst says rx-fcs is
the feature that asks the NIC to append the FCS. It says rx-all only asks
for errored frames to be received. Other RXALL implementations such as
e1000e keep the two features independent. Bridged or non-IP frames would
carry the stale FCS as payload.

> +		else
> +			rxctl &= ~AX_RX_CTL_DROPCRCERR;
> +		WRITE_ONCE(ax179_data->rxctl, rxctl);
> +		ax88179_write_u16(dev, AX_ACCESS_MAC, AX_RX_CTL, 2, rxctl);

[Severity: Medium]
Is this read-modify-write of ax179_data->rxctl serialized against the
other paths that write AX_RX_CTL?

ax88179a_mac_link_up() runs from the phylink resolve work and only holds
medium_status_mutex:

	ax88179_write_u16(dev, AX_ACCESS_MAC, AX_RX_CTL, 2, READ_ONCE(ax179_data->rxctl));

It can read rxctl before this block updates it and write after the
hardware write here. The MAC then keeps the old DROPCRCERR state while
dev->features shows the new one.

ax88179_set_multicast() also rebuilds rxctl and calls WRITE_ONCE(). If
that happens between the READ_ONCE() and WRITE_ONCE() here, this block
writes back stale PRO/AMALL/AM bits and the promiscuous or multicast
change is lost.

Also, __netdev_update_features() calls ndo_set_features() before it
updates dev->features. A set_multicast in that window computes
DROPCRCERR from the old features and undoes the new setting.

Could this block share a lock with those paths?

[Severity: Low]
The return value of ax88179_write_u16() is ignored and the function
returns 0. If the control transfer fails, the core still commits the new
RXFCS/RXALL bits to dev->features. ax179_data->rxctl also holds the new
value, but the MAC keeps the old DROPCRCERR setting.

Should this check for ret < 0 and return it, like the VLAN control
accesses earlier in this function?

[Severity: Low]
The cached rxctl always has AX_RX_CTL_START set, so this write restarts
the receiver. ax88179a_mac_link_up() deliberately stops RX while it
reprograms the speed-dependent registers:

	/* Stop RX/TX for link configuration */
	ax88179_write_u16(dev, AX_ACCESS_MAC, AX_RX_CTL, 2, AX_RX_CTL_STOP);
	ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_MAC_PATH, 1, 0);

It restores AX_RX_CTL only at the end. set_features is not serialized
with that sequence. Can it restart the receiver while the bulk-in setup
is only partly programmed?

ax88179a_stop() writes 0 to AX_RX_CTL but leaves START set in
ax179_data->rxctl. Toggling rx-fcs or rx-all on a down interface then
turns the MAC receiver back on until the next ax88179a_reset().
ax88179_set_multicast() skips devices that are not IFF_UP, but this path
has no such check.

> +	}
> +
>  	return 0;
>  }

[ ... ]

> @@ -1039,9 +1058,14 @@ static int ax88179a_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
>  	pkt_end = 0;
>  	while (pkt_cnt--) {
>  		u64 pkt_desc = get_unaligned_le64(pkt_desc_ptr);
> +		long features = dev->net->features;

[Severity: Medium]
Does this truncate the feature mask on 32-bit kernels? netdev_features_t
is u64. NETIF_F_RXFCS_BIT and NETIF_F_RXALL_BIT are bits 43 and 44 in
include/linux/netdev_features.h, and a 32-bit long cannot hold them. So
both this check and the !(features & NETIF_F_RXALL) test below would
always see the features as off:

	if (features & (NETIF_F_RXFCS | NETIF_F_RXALL))
		fcs_trailer = ETH_FCS_LEN;

ax88179a_set_features(), ax88179a_reset() and ax88179_set_multicast()
program the hardware from the full u64 net->features. So the MAC appends
the FCS while rx_fixup() assumes it does not.

On a 32-bit host rx-all would never deliver errored frames. Frames near
the maximum MTU that carry the extra 4 FCS bytes would exceed
hard_mtu + AX179A_RX_HW_PAD and be dropped without being counted.

Should this local be netdev_features_t, perhaps read with READ_ONCE()?

>  		u32 pkt_len_plus_padd;
> +		u32 fcs_trailer = 0;
>  		u32 pkt_len;
>  
> +		if (features & (NETIF_F_RXFCS | NETIF_F_RXALL))
> +			fcs_trailer = ETH_FCS_LEN;
> +
>  		pkt_len = FIELD_GET(AX179A_RX_PD_LEN, pkt_desc);
>  		pkt_len -= (ax179_data->ip_align ? 2 : 0);
>  		pkt_len_plus_padd = ((pkt_len + 7 + (ax179_data->ip_align ? 2 : 0)) & 0x7FFF8);
> @@ -1050,10 +1074,18 @@ static int ax88179a_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
>  		if (pkt_end > hdr_off || (pkt_cnt == 0 && pkt_end != hdr_off))
>  			goto err;
>  
> -		if (pkt_desc & AX179A_RX_PD_DROP || !(pkt_desc & AX179A_RX_PD_RX_OK) ||
> -		    pkt_len > (dev->hard_mtu + AX179A_RX_HW_PAD) || pkt_len < 2 + ETH_HLEN) {
> +		if (((pkt_desc & AX179A_RX_PD_DROP || !(pkt_desc & AX179A_RX_PD_RX_OK)) &&
> +		     !(features & NETIF_F_RXALL)) ||
> +		    pkt_len > dev->hard_mtu + AX179A_RX_HW_PAD + fcs_trailer ||
> +		    pkt_len < 2 + ETH_HLEN) {
>  			skb_pull(skb, pkt_len_plus_padd);
>  
> +			if (pkt_desc & AX179A_RX_PD_DROP)
> +				dev->net->stats.rx_dropped++;
> +
> +			if (!(pkt_desc & AX179A_RX_PD_RX_OK))
> +				dev->net->stats.rx_crc_errors++;

[Severity: Medium]
Should rx_errors be incremented along with rx_crc_errors? The
rtnl_link_stats64 comment in include/uapi/linux/if_link.h says rx_errors
"must include events counted by @rx_length_errors, @rx_crc_errors".
rx_fixup() returns 1 on this path, so usbnet's rx_process() does not add
to rx_errors either.

These counters are only updated inside the drop branch. With
NETIF_F_RXALL on, frames with RX_OK clear or DROP set skip this branch
and go up the stack. Should they still be counted in rx_crc_errors?

Frames dropped only by the length checks (pkt_len > hard_mtu + ... or
pkt_len < 2 + ETH_HLEN) don't update any counter, such as
rx_length_errors. That doesn't match the commit message, which says
dropped packets are counted.

Is every !RX_OK frame actually a CRC error? The same frame can also be
counted in both rx_dropped and rx_crc_errors.

The commit message says:

    Count dropped packets and those with incorrect checksum.

Would "incorrect FCS" be clearer here, since "checksum" suggests L3/L4
checksums?

> +
>  			/* Next RX Packet Descriptor */
>  			pkt_desc_ptr++;
>  			continue;
> @@ -1216,12 +1248,14 @@ static int ax88179a_reset(struct usbnet *dev)
>  	ax88179_write_u8(dev, AX_ACCESS_MAC, AX_TXCOE_CTL, 1, *tmp);
>  
>  	/* Configure RX control register => start operation */
> -	rxctl = AX_RX_CTL_DROPCRCERR | AX_RX_CTL_START | AX_RX_CTL_AP |
> -		AX_RX_CTL_AMALL | AX_RX_CTL_AB;
> +	rxctl = AX_RX_CTL_START | AX_RX_CTL_AP | AX_RX_CTL_AMALL | AX_RX_CTL_AB;
>  	if (ax179_data->ip_align)
>  		rxctl |= AX_RX_CTL_IPE;
>  	if (dev->net->flags & IFF_PROMISC)
>  		rxctl |= AX_RX_CTL_PRO;
> +	if (dev->net->features & (NETIF_F_RXFCS | NETIF_F_RXALL) ||
> +	    ax179_data->chip_version == AX_VERSION_AX88279)
> +		rxctl |= AX_RX_CTL_DROPCRCERR;

[Severity: Low]
This forces AX_RX_CTL_DROPCRCERR only when chip_version is
AX_VERSION_AX88279. ax88179_set_multicast() uses a different test:

	if (net->features & (NETIF_F_RXFCS | NETIF_F_RXALL) ||
	    data->chip_version != AX_VERSION_AX88179A)
		rxctl |= AX_RX_CTL_DROPCRCERR;

ax88179a_bind() stores whatever AX_CHIP_STATUS reports and does not
reject unknown values. For a chip version other than AX88179A or AX88279,
reset() would clear the FCS-append bit and every later set_rx_mode would
set it again. Such devices don't advertise RXFCS, so rx_fixup() would not
expect the FCS. No current hardware is known to report such a version.

Could both sites share one predicate or helper?

>  	WRITE_ONCE(ax179_data->rxctl, rxctl);
>  	ax88179_write_u16(dev, AX_ACCESS_MAC, AX_RX_CTL, 2, rxctl);
>

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261127-fcs-v1-0-0c4ede015bf5%40birger-koblitz.de
