Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117805;
	b=JoiGx+TlQMi0hFW+8oBj4QqSSjnPfqP77SAR6Rb2dr67G+nF4GMGFoWckf0OdKaOOJd4
	 4zxmcCeI1TePQLvlDWSJcfAxVtJ5eBusObuYoYrFwYqyhsPIa4sn1wknHgjkd0yZnLeOV
	 /DD98YnJiTwKH62s6gOBH5e4fR1ObEOLxYPzGK0XDULxqg+c+tM7/jk392ZPFd8DqYGDl
	 HX0dDcCQ1+wVATPzoNs4P1Bx5raoxYtodNm+xp/sAFmkTVRxw2tPE62eMNyokQMPzGR19
	 fy+gAt8shaQb7tCDUQn7aqyC6KaU9ELHlO9u+5uqLAp0iDgOKhh58PnFV+vtud7P/mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117805;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=fUyQVC0O4SLGiBFFs/hrC1wx0v6ktDcqCyV3YsiVuYM=;
	b=Cv+a6/rsI96l2s43ym6pohuTrHWkFgFySBXNJ0tkutWeCv+cl5zlavQERz/FUaFft9Qb
	 pSbVVjsaZgv7aH+BDnYfyaIYiBEiQCkSN1Q/SjQ+Lp+c/50QdwNmzR1T53zVPr/XwtTrP
	 658spOhsqfeTnOWmo87G3f67u9CdCemttc3TfCa1TOEgM1A9JAwiypoe9kG0zdwP51h5q
	 H7HAuu6ynbTTBuAiH5jeqkQiaA21lk25R/kZnJ7boA04gVoZCtyqLOFNIkUqwry7MYgJk
	 8V9fdUmemnuz8TjyKV9l5wrJJyq7MM40DV+K3GZNooRR+kAuqi8n89M5B/uxW5jfKew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=goRymz7q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C01606A330;
	Thu, 19 Nov 2026 19:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=goRymz7q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D4A1F000C5;
	Thu, 19 Nov 2026 19:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795117805;
	bh=fUyQVC0O4SLGiBFFs/hrC1wx0v6ktDcqCyV3YsiVuYM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=goRymz7qc+F9X7GeudL+SVftj243LRVuK0NP51HwGvwG4MxSw8D/v0vvsff15WGCi
	 pM0BT3s9Uo7nD10v8Y7NAX4F3ZnV3sysDol62lOtWCYFdw8YLhaqvqzpiwl6ZbazEi
	 K+cIMAtkLkOLCfHE6+id1EoodSWkbUwQRss0pfnLqSfiyFkX7gW+GjVM1v+sIGaaiq
	 SmDJArtfz3jc/k1Jdx/bGc2H6vopXRQF0ULcdSIMYx1TP6sqm2p3nWxF4G3v4/v2mg
	 j/XRJ9RMMxDSKrygVXGhTVmnjrRXP2nIYPVm/QD4pYX/uyHZ3S7JNR9Qf59v3krPA6
	 6TEQgfEu3qzCw==
Subject: Re: [PATCH] net: hso: cap the MTU to the mux tx buffer size
From: netdev-bot+sashiko@kernel.org
To: chenaibing@cmss.chinamobile.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 19 Nov 2026 19:50:04 +0000
Message-ID: <179511780420.3136.11749400958773906297@kernel.org>
In-Reply-To: <20261116014904.556-1-chenaibing@cmss.chinamobile.com>
References: <20261116014904.556-1-chenaibing@cmss.chinamobile.com>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] This is an incomplete fix: the slab out-of-bounds write in
  hso_net_start_xmit() can still be triggered.

--

net: hso: cap the MTU to the mux tx buffer size

This commit sets net->max_mtu in hso_net_init() to
MUX_BULK_TX_BUF_SIZE - 14. With that cap, userspace can no longer raise
the MTU of an hso net device past the fixed 2048 byte mux_bulk_tx_buf.
The intent is to stop the memcpy() in hso_net_start_xmit() from
overflowing that buffer.

> diff --git a/drivers/net/usb/hso.c b/drivers/net/usb/hso.c
> index 71caa3764b239..45713c9940894 100644
> --- a/drivers/net/usb/hso.c
> +++ b/drivers/net/usb/hso.c
> @@ -2393,6 +2393,7 @@ static void hso_net_init(struct net_device *net)
>  	net->flags = IFF_POINTOPOINT | IFF_NOARP | IFF_MULTICAST;
>  	net->type = ARPHRD_NONE;
>  	net->mtu = DEFAULT_MTU - 14;
> +	net->max_mtu = MUX_BULK_TX_BUF_SIZE - 14;

[Severity: High]
Is this enough to keep hso_net_start_xmit() from overflowing
mux_bulk_tx_buf?

max_mtu is only enforced by dev_validate_mtu() when dev->mtu changes.
It does not limit the length of skbs passed to ndo_start_xmit.
hso_net_start_xmit() still copies skb->len bytes without checking it:

drivers/net/usb/hso.c:hso_net_start_xmit() {
    ...
	memcpy(odev->mux_bulk_tx_buf, skb->data, skb->len);
    ...
	usb_fill_bulk_urb(odev->mux_bulk_tx_urb,
			  ...
			  odev->mux_bulk_tx_buf, skb->len, write_bulk_callback,
			  odev);
    ...
}

mux_bulk_tx_buf is still a kzalloc(MUX_BULK_TX_BUF_SIZE) object
allocated in hso_create_net_device().

The stack does not guarantee skb->len <= dev->mtu at this point. These
paths look like they can send larger skbs whatever max_mtu is set to.

AF_PACKET packet_snd() with PACKET_VNET_HDR skips both MTU checks when
vnet_hdr.gso_type is set:

	if (!vnet_hdr.gso_type &&
	    (len > dev->mtu + reserve + VLAN_HLEN + extra_len))

If gso_size is at least the payload size, __virtio_net_hdr_to_skb()
leaves the skb as non-GSO:

	if (skb->len - nh_off > gso_size) {

So the skb is not segmented. validate_xmit_skb() only linearizes it, and
it reaches hso_net_start_xmit() at up to about 64KB.

AF_PACKET tpacket_snd() only clamps size_max to the MTU when no vnet
header is configured:

	if ((size_max > dev->mtu + reserve + VLAN_HLEN) && !vnet_hdr_sz)

The per-frame MTU check is skipped in the same case.

For IPv4, ip_dst_mtu_maybe_forward() returns the route's RTAX_MTU
metric. That value is capped at IP_MAX_MTU but not at dev->mtu or
max_mtu. A route through the hso device with something like
"mtu lock 4000" would send 4000 byte packets to the driver without
fragmenting them.

In each case, an skb longer than 2048 bytes writes data chosen by the
sender past the end of mux_bulk_tx_buf. The same length is also used as
the URB transfer length.

Would a length check in hso_net_start_xmit() before the memcpy() be the
right fix? For example, if skb->len > MUX_BULK_TX_BUF_SIZE, drop the
skb, increment tx_dropped and restart the queue. The max_mtu cap could
stay as an extra guard.

Since this is tagged Cc: stable, wouldn't the backport as written leave
the mux_bulk_tx_buf overflow reachable?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116014904.556-1-chenaibing%40cmss.chinamobile.com
