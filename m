Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012338;
	b=K3IDp9UAbBur/Yj/vVBvbGGaXRGQYH0Vz6lxTp1KptAHbzY8d8kdMqa6dlhj1LLMD3DE
	 0wn1oDRLMDFdNOTcaICXd0Y9nnqnX1FxtLX4rXtvVS/nF8wn/66+aS7tyf31uFqDDUwbe
	 97A+hvdfJ3vppdO89Pgxux5RmPFuPOw+jr74GzcWSRIhbCTdQMOr/Wbeysb1RODwEgu2C
	 zEqYYvlxOnUd5HzkoGk5SVGewgIjLhG1tsDmA8/KY2wJ2YwQcQNcUJ9wE7blzADJ5cgNh
	 jWxibCZEudaPpyGejhG95OEpWx78UEyqa315UoFGATpLljyHs10NFyXcKgD51/NCVMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012338;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=bj4Of2lg9jjJRkKZbshB9eWCPQ0Rn/EaqW6nHd+oYFU=;
	b=iMrsWkBd8yaZdv3zYyHSM2+5Rrsu8e5TPdoTNtDNnh9jseZZZFq4n3wKlDKybHeA9o0+
	 AIy6XxpzqAjwdUOESInSKhKuQdFgU7HtLnmqH04E+mu+VZ1FTKFKS+kFk3vg9pmFD8rHk
	 t9xdWvbghDHEu6M0vHQZ1emg+JVnbhBUSnrtcjYNVf3nX9mCIuOHEYJLjVlt6rA47stao
	 u+qGz7+3ZnPzfvmbjjKBIpzF6B8afNuoRRR/p/1ye+tA5O1ApGQc8uY3nPkcQYn4M5fMh
	 Qafc3ZFZzqyIu0KLmvZLZrJT9ssaACUklhYIvKa4/U+bJE/LTmkzXLkNZNJiGHP9NZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KLclnYoo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F535606A331;
	Wed, 18 Nov 2026 14:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KLclnYoo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 122231F000C6;
	Wed, 18 Nov 2026 14:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795012338;
	bh=bj4Of2lg9jjJRkKZbshB9eWCPQ0Rn/EaqW6nHd+oYFU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KLclnYoo6SWe0dM3aBzBv6b6rhEFJH/oACH9Cp5pPN4EO9hJqkrK3qv/ReBW2J03Q
	 Kh50bFILPpipec6yYCxGZPKW5fAs3sDRTsMRvsRcXupJa4EdX+98/whBqKxWKfGH7a
	 zR92mmFDFCecB+DNNce7rEF6AVBW73wwQgWrtKXTgASBpTeb4i2tEaNOOY8aZC2d5R
	 hWqwu4wJpVFNSGz/mQqVJ+zvktf8j7PAR0rfd5CwDk51JRXX6vGmrdW7oCoswRDReR
	 mZSDYrtVNGDVxTeeAta98DAz5I2utRwFxHWiwrh6HXDq/L31n0NdwPkMxsi3nDwV+0
	 m+KIUeuZlA/Kg==
Subject: Re: [PATCH net v3] net: hso: fix stashed tx skb leak and replay race
From: netdev-bot+sashiko@kernel.org
To: chenaibing@cmss.chinamobile.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 18 Nov 2026 14:32:17 +0000
Message-ID: <179501233764.3136.7907862277727353181@kernel.org>
In-Reply-To: <20261117084732.297-1-chenaibing@cmss.chinamobile.com>
References: <20261117084732.297-1-chenaibing@cmss.chinamobile.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 (1) · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] net: hso: race on skb_tx_buf and unlocked hso_net_start_xmit()
  in hso_resume()

Pre-existing issues:
- [Critical] This problem wasn't introduced by this patch, but it is a
  heap buffer overflow in the hso TX path that the replay this patch…

--

net: hso: fix stashed tx skb leak and replay race

This commit frees the skb stashed in skb_tx_buf when hso_net_close() runs.
It also takes the stashed skb with xchg() in both hso_net_close() and
hso_resume(), and serializes the resume replay against close with a new
per-interface mutex. The resume path now checks HSO_NET_RUNNING instead of
IFF_UP.

Link: https://lore.kernel.org/all/6af74e31.fe96acdb.12252b.0009.GAE@google.com/

> diff --git a/drivers/net/usb/hso.c b/drivers/net/usb/hso.c
> index 71caa3764b239..43884234c4d8f 100644
> --- a/drivers/net/usb/hso.c
> +++ b/drivers/net/usb/hso.c

[ ... ]

> @@ -3051,21 +3069,28 @@ static int hso_resume(struct usb_interface *iface)
>  		if (network_table[i] &&
>  		    (network_table[i]->interface == iface)) {
>  			hso_net = dev2net(network_table[i]);
> -			if (hso_net->flags & IFF_UP) {
> -				/* First transmit any lingering data,
> -				   then restart the device. */
> -				if (hso_net->skb_tx_buf) {
> +			mutex_lock(&hso_net->tx_replay_lock);
> +
> +			/*
> +			 * First transmit any lingering data, then restart
> +			 * the device.
> +			 */
> +			if (test_bit(HSO_NET_RUNNING, &hso_net->flags)) {
> +				skb = xchg(&hso_net->skb_tx_buf, NULL);
> +				if (skb) {
>  					dev_dbg(&iface->dev,
>  						"Transmitting"
>  						" lingering data\n");
> -					hso_net_start_xmit(hso_net->skb_tx_buf,
> -							   hso_net->net);
> -					hso_net->skb_tx_buf = NULL;
> +					hso_net_start_xmit(skb, hso_net->net);

[Severity: Medium]
The new tx_replay_lock orders hso_resume() against hso_net_close(),
but the other writer of skb_tx_buf is hso_net_start_xmit(), which runs
from the transmit path under the queue's TX lock and never takes
tx_replay_lock (it can't sleep there). Can the stash and the replay
still miss each other during resume?

CPU0 (xmit)                       CPU1 (usb_resume_both)
hso_net_start_xmit()
  netif_stop_queue()
  hso_get_activity()
    usb->state != CONFIGURED
    returns -EAGAIN
                                  usb_resume_device()
                                    state = USB_STATE_CONFIGURED
                                  hso_resume()
                                    xchg(&skb_tx_buf, NULL) == NULL
                                    hso_start_net_device()
  odev->skb_tx_buf = skb

At that point the frame is stashed, the queue is stopped, and nothing
is left to replay it. No TX URB was submitted, so write_bulk_callback()
never calls netif_wake_queue() or hso_put_activity(). TX on the
interface stays wedged until it is brought down. If
hso_get_activity() scheduled async_get_intf on the way in, that
runtime PM reference is never dropped either.

The direct call is also not serialized against the stack.
hso_resume() invokes the ndo_start_xmit handler without holding the
TX lock. Inside it, netif_start_queue() (on usb_submit_urb() failure)
or write_bulk_callback() -> netif_wake_queue() (on a fast completion)
can let another CPU enter hso_net_start_xmit() before the replayed
call has returned. Both calls then update net->stats concurrently.

This window already existed with the old unlocked read of skb_tx_buf.
The changelog says only one path can obtain the stashed skb, though,
so it seems worth covering in this patch. Would it work to do the
xchg() and the replay under the queue 0 TX lock, for example:

  __netif_tx_lock_bh(netdev_get_tx_queue(hso_net->net, 0))

usb_resume_device() has already marked the device configured by the
time hso_resume() runs. An xmit that takes the lock after the replay
would then send directly instead of stashing. hso_start_net_device()
submits with GFP_NOIO, so it would need to stay outside that lock.

[Severity: Critical]
This is a pre-existing issue and was not introduced by this patch, but the
replay here goes into the same unchecked copy in hso_net_start_xmit(). Can
that copy overflow mux_bulk_tx_buf?

drivers/net/usb/hso.c:hso_net_start_xmit() {
    ...
	/* Copy it from kernel memory to OUR memory */
	memcpy(odev->mux_bulk_tx_buf, skb->data, skb->len);
    ...
}

The destination is a fixed size buffer allocated in
hso_create_net_device():

	hso_net->mux_bulk_tx_buf = kzalloc(MUX_BULK_TX_BUF_SIZE, GFP_KERNEL);

and MUX_BULK_TX_BUF_SIZE is HSO__MAX_MTU, which is 2048.

I don't see anything that limits the MTU to that size. hso_net_init() sets
net->mtu = DEFAULT_MTU - 14 but never sets net->max_mtu, and hso_netdev_ops
has no .ndo_change_mtu. dev_validate_mtu() only checks the upper bound
when max_mtu is set:

	if (dev->max_mtu > 0 && new_mtu > dev->max_mtu) {

So something like "ip link set hsoX mtu 4000" would succeed. After that,
any local or forwarded traffic routed through hsoX could produce linear
skbs larger than 2048 bytes. The device doesn't advertise NETIF_F_SG, so
the core linearizes them. Those skbs would then reach the memcpy() through
dev_queue_xmit()->hso_net_start_xmit(), or through this replay in
hso_resume(), and write up to MTU - 2048 bytes of packet payload past the
end of the kmalloc-2048 object.

Would it make sense to set net->max_mtu = MUX_BULK_TX_BUF_SIZE in
hso_net_init()? Another option would be to drop frames with
skb->len > MUX_BULK_TX_BUF_SIZE in hso_net_start_xmit(), or to do both.

>  				}
>  				result = hso_start_net_device(network_table[i]);
> -				if (result)
> +				if (result) {
> +					mutex_unlock(&hso_net->tx_replay_lock);
>  					goto out;
> +				}
>  			}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117084732.297-1-chenaibing%40cmss.chinamobile.com
