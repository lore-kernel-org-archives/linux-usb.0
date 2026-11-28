Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795864069;
	b=2WKHCxAY33hunsHNidNF3SzDNPHSopNTJnJdMXTr19E/qyfLYSlrHhphcftAWZYS/twQ
	 qHMOV0w+3zwo1SPDko68qdyIyLDBPAbJqVJMNo4ESfCFN1N2ekeer7wH0SLykjmccMu2F
	 ZoZ8CJyNwE4Bj4MhgOzynoBcb/rvUFVxAxW4U8XDmBTWEKJCpn1/6mn8wmqnEuMdFUGH7
	 yu+t91auVVwemURjkYrZ1/6MQ14Gfgm4z6JwR9CLtTdSZywbhc2VmT3TXNTnpZclLez5a
	 rPpZLbJ4ZAVu28b4sHnCUdAoECq7wdIm689v4ma7DuiasKW8L6/T0ptNMN1WjFlfAyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795864069;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=dhEpXUDwJ1KCU+C5f7ZI1vtRh4Q+NQI9jx4jEzwEGOE=;
	b=ntEdobkL2aTgE6cEJ1RB54vh5yaxM0ovdS9uERjPog2IZqIcSU9AGPWRIVrZjAKZddNX
	 khhUcSCzMdn16hz1PuhWQN9Bwssfc3tg5jpxOZGTuHdhnBPLQBfEgSsWijXstuMH7ncwb
	 63jkS5ilFdASUPoOmMRfyUFRnkGwYWv0Qi/MTA06/rmFIUYWSJM3dqP5K6DoTn12y8mTM
	 iDBQgYi+m9c1fhiYAAi77+UaRrxR9SKyNgMVkXWvYFwEmNgbUAoLxWo+8vUoTJYJRqXKt
	 fWO9v00xuvIi/nqA/Kvi9GIZg3faenydmkBhPcsEyNtz3z/BzuQBXa4aaJ90H/OuuCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LnUKfdOe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551F7606A31C;
	Sat, 28 Nov 2026 11:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LnUKfdOe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 529AC1F000C1;
	Sat, 28 Nov 2026 11:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795864068;
	bh=dhEpXUDwJ1KCU+C5f7ZI1vtRh4Q+NQI9jx4jEzwEGOE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LnUKfdOecEKCcF+AqM0TU/K7CxUt4GYRJHG2Fn/10CsvxinCtO61w57MVH3s/yWsB
	 ZLQ8A07ZfXXh+6MxRvr726IPEdj5J97Yow/HpGm6Slw8fqg7G3CKSlDE/p9Sa3GbL8
	 AntxMdzXXksMjO2TsyzZu8eXyS6VKZHKQ0oH+ZeR84P/hEWvoR9PYSnxnT4P2ZrRBz
	 ZmeWM5hSambf9zgZmH419ul15lEX5Dy56TE4VQdEpqWGj+a+k9Pbwv0SUnJIhb7Uez
	 fZQBGksC9GsUNBHytXWJNuxfkOqx5KGoKWWr91mih4HVpqCexUgZyHAibdAkkRnsDX
	 rrdsPctiKu9tQ==
Subject: Re: [PATCH net v2] net: usb: cdc_ncm: send the NTB once another
 datagram would not fit
From: netdev-bot+sashiko@kernel.org
To: william@wkennington.com
Cc: oliver@neukum.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sat, 28 Nov 2026 11:07:47 +0000
Message-ID: <179586406785.3135.9027128089065565502@kernel.org>
In-Reply-To: <20261127110521.1235409-1-william@wkennington.com>
References: <20261127110521.1235409-1-william@wkennington.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The patch only narrows one way that a datagram ends up parked in
  ctx->tx_rem_skb.
- [Medium] Other usbnet queue stops cause the same drop, and a heuristic
  based on NTB size cannot prevent them.
- [Low] The new early-close check in cdc_ncm_fill_tx_frame()
  (drivers/net/usb/cdc_ncm.c:1382-1383) adds VLAN_HLEN to every reserved…

--

net: usb: cdc_ncm: send the NTB once another datagram would not fit

With this patch, cdc_ncm_fill_tx_frame() sends the current NTB as soon
as another MTU-sized datagram (with Ethernet and VLAN headers) would no
longer fit, as long as nothing is parked in tx_rem_skb. The goal is
that no datagram is held in tx_rem_skb when usbnet stops the TX queue,
so the timer flush in cdc_ncm_txpath_bh() no longer drops it into a
stopped queue.

> diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
> index e92dc7f011ea7..7fbce4846a044 100644
> --- a/drivers/net/usb/cdc_ncm.c
> +++ b/drivers/net/usb/cdc_ncm.c

[ ... ]

> @@ -1369,6 +1370,22 @@ cdc_ncm_fill_tx_frame(struct usbnet *dev, struct sk_buff *skb, __le32 sign)
>  			ctx->tx_reason_ndp_full++;	/* count reason for transmitting */
>  			break;
>  		}
> +
> +		/* Send now if another full size datagram would not fit.
> +		 * Accepting one more would park it in tx_rem_skb after
> +		 * this NTB has been handed to usbnet. If that NTB fills
> +		 * the TX queue, usbnet stops the queue and drops the NTB
> +		 * the timer builds for the parked datagram.
> +		 */
> +		if (!ctx->tx_rem_skb && n + 1 < ctx->tx_max_datagrams &&
> +		    skb_out->len + ctx->tx_modulus + ctx->tx_remainder +
> +		    READ_ONCE(dev->net->mtu) + cdc_ncm_eth_hlen(dev) +
> +		    VLAN_HLEN + delayed_ndp_size > ctx->tx_curr_size) {

[Severity: High]
Does this check cover every way a datagram can still be parked in
ctx->tx_rem_skb? It only reserves room for a same-signature datagram of
up to mtu + eth_hlen + VLAN_HLEN. The "no room for skb - store for
later" branch in cdc_ncm_fill_tx_frame() still looks reachable:

	ctx->tx_rem_skb = skb;
	ctx->tx_rem_sign = sign;
	skb = NULL;
	ready2send = 1;

Here are a few cases where that seems to happen.

MBIM with several IPS/DSS sessions, without NDP_TO_END. The first
datagram of a new session needs NDP alignment plus max_ndp_size, which
cdc_ncm_ndp16() and cdc_ncm_ndp32() check:

	if (skb->len + reserve + ctx->max_ndp_size > ctx->tx_curr_size)
		return NULL;

The new check doesn't reserve that space, so an MTU-sized datagram for
a new session can still be parked.

Devices with CDC_NCM_FLAG_NDP_TO_END, such as cdc_mbim_info_ndp_to_end
or any device with the ndp_to_end sysfs flag set. cdc_ncm_ndp16() and
cdc_ncm_ndp32() return NULL for any second signature, whatever the free
space:

	else if (ctx->delayed_ndp16->dwSignature)
		return NULL;

The comment above cdc_mbim_info_ndp_to_end says multiplexed sessions
cannot share an NTB. So each session switch parks a datagram.

Frames longer than mtu + ETH_HLEN + VLAN_HLEN on plain cdc_ncm. cdc_ncm
doesn't set NETIF_F_HW_VLAN_CTAG_TX. Stacked 802.1ad/802.1Q devices
inherit the real device's MTU, so they send inline frames of mtu + 22
bytes. Frames queued before an MTU decrease also qualify, because
READ_ONCE(dev->net->mtu) returns the new, smaller value. These pass the
new check and then fail the real fit check, which uses skb->len.

In each case, the NTB returned with ready2send = 1 can be the one that
brings txq.qlen up to TX_QLEN in usbnet_start_xmit():

	if (dev->txq.qlen >= TX_QLEN (dev))
		netif_stop_queue (net);

The hrtimer then fires, and the following runs:

cdc_ncm_txpath_bh()
  usbnet_start_xmit(NULL, dev->net)
    info->tx_fixup()    /* builds an NTB from the parked datagram */
    netif_queue_stopped(net) -> goto drop

Isn't this the same tx_dropped path that the commit message and the
Fixes tag describe? cdc_mbim and huawei_cdc_ncm share this code.

The commit message also says:

  tx_rem_skb is still used when a datagram needs a new NDP that does not
  fit, as with several MBIM sessions.

For NDP_TO_END devices the datagram is parked whether or not it fits.
Is "does not fit" accurate there?

Would it be more robust to fix this in the flush path? One option is to
check netif_queue_stopped() in cdc_ncm_txpath_bh() under netif_tx_lock
and re-arm the timer instead of flushing. Another is to keep usbnet
from consuming tx_fixup(NULL) data while the queue is stopped.

[Severity: Low]
Should VLAN_HLEN be added for MBIM? cdc_ncm_eth_hlen() returns 0 for
MBIM because the datagrams are raw L3. cdc_mbim sets
NETIF_F_HW_VLAN_CTAG_TX. Also, cdc_mbim_tx_fixup() strips the L2 header
before calling cdc_ncm_fill_tx_frame():

	if (vlan_get_tag(skb, &tci) < 0 && skb->len > VLAN_ETH_HLEN &&
	    __vlan_get_tag(skb, &tci) == 0) {
		...
		skb_pull(skb, VLAN_ETH_HLEN);
	} else {
		...
		skb_pull(skb, ETH_HLEN);
	}

So the largest MBIM datagram is mtu, but this check reserves mtu + 4.
Inside a 4-byte window, an MBIM NTB gets closed even though another
full-size datagram would still fit.

Would adding VLAN_HLEN only when cdc_ncm_eth_hlen(dev) is non-zero
match the header model that the helper encodes?

> +			ready2send = 1;
> +			ctx->tx_reason_ntb_full++;	/* count reason for transmitting */
> +			n++;
> +			break;
> +		}
>  	}

[Severity: Medium]
Can other kinds of queue stop still lose datagrams through the same
flush path? For -EPROTO, -ETIME and -EILSEQ, tx_complete() stops the
queue and arms dev->delay for THROTTLE_JIFFIES (HZ/8). EHCI hosts can
report these errors:

	case -EPROTO:
	case -ETIME:
	case -EILSEQ:
		...
		netif_stop_queue(dev->net);
		break;

usbnet_start_xmit() also stops the queue on -EPIPE and for
EVENT_DEV_ASLEEP.

After this patch, cdc_ncm_fill_tx_frame() still holds partially filled
NTBs in ctx->tx_curr_skb with the hrtimer armed. The flush interval is
about 400 us plus a few re-arms through tx_timer_pending. That is much
shorter than the 125 ms throttle window, so
cdc_ncm_txpath_bh()->usbnet_start_xmit(NULL) would build an NTB from
every held datagram and drop it at the netif_queue_stopped() check.

The commit message says "every drop came from cdc_ncm_txpath_bh()
calling usbnet_start_xmit(NULL, ...) into a stopped TX queue". That
diagnosis and the Fixes tag cover these stops too, since ad70411a978d
added the stopped-queue drop for every stop reason. This patch only
addresses stops caused by a full TX queue.

Would a flush-path fix that re-arms the timer instead of flushing into
a stopped queue cover these cases as well?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261127110521.1235409-1-william%40wkennington.com
