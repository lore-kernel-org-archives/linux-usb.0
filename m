Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991667;
	b=mIERvov6rpvLuLJjr1yNoYDatRIyaOBcVGsDB/HLQCswzoBg/9rytUyx6743mDIG7Wkr
	 q/QrdRR7RJUHUYKMPuuKp5u0pr3FSt6lMsp4WMD/tAqz4kr4aYOP0sc5MQcw7Z2XrzUgq
	 U5htVpppvFTTSSsG1hI02mqSG8beg81puibCF/56CZ1uzGptDvePrAl9XRHetLigLDMTC
	 xup7yQ+sUnf8nTk80ihZWgq6zP/ZhtIdxpOefskcHIxm+GO5pfRzFFKpPMAG4aWRJL9m9
	 abe6OwVL7Dmx7Z31FQHd2TZj+AFwwzbxixyQAiaco3KKiLCb9Lrt5vJnQRU0EDk7B/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991667;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=S02MazyKmYzkjc/2eAzvubxUAkYAiyG5Z04BpIIFS7E=;
	b=m5kSbNa/8NKrImjjk8YcjtBctx6G/RPBEpvr9Vgks9NFVGsdIVPK6khcYHkhMrUqdfC4
	 l+Aza83Vt+dOjHXSxNYcRXzBnCgROt/deEToxoikdXmttQJSHSHCwcJKTtwbZfj0BHalF
	 pvVBCkQ4sCk0UNdfmTi5JsXcoZqt26qdtTsfC8j8qBYTJrzr2YUBXfrSsWOJxxFFTV54d
	 HxvodNys9ML6iFtRZZ+VUFShYgGCmriv+M+EEhbsI/HxtDE2x/aJySCvhGpczsjg3gL+r
	 4T9wwuIXfHQcuKv5Bib8rKdVdCmwLcK3kcFUeWlfjfNZXSN444nF8SuKLUZ+BqGZxdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K0ovqZlY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB032606A325
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 08:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K0ovqZlY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3F61F000C4;
	Wed, 18 Nov 2026 08:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794991667;
	bh=S02MazyKmYzkjc/2eAzvubxUAkYAiyG5Z04BpIIFS7E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K0ovqZlYnjeeGtGbHuQ0sEvj4TvqNRIApAz0LwwS6VjbgwixWRthnrgLbgSgQvjMj
	 rce9ztZTjax5VIjKK2G4YxeLyIgL4BO6/onjkgIFo24VVeocp8UoCwWLnUANJmNzbC
	 aTu4Lf51M5Lgl5aIdlH2/0KQxJcLM5WT/VMeSX71GQcD71agsMkYX0Dmpp42l6X2/f
	 Ip7ZLFIyhYlsWvZiwC/MxNgQvhVYtPQFk2HJU5U+r3yE8Yv5rfbOJ507QPCkN2bi7y
	 19Tz5rEuSUQafadUzy4Ttssq8wDQpTnbRZYjSbM88n2bXnGFtUqT+q61VjR/2HcB/k
	 uA6ETUmBikIfA==
Message-ID: <sashiko-outbox-220508@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v3] net: hso: fix stashed tx skb leak and replay
 race
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aibing Chen" <chenaibing@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117084732.297-1-chenaibing@cmss.chinamobile.com>
References: <20261114093133.465-1-chenaibing@cmss.chinamobile.com>
 <20261117084732.297-1-chenaibing@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 08:47:46 +0000
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
- [Medium] net: hso: race on skb_tx_buf and unlocked
  hso_net_start_xmit() in hso_resume()
--

commit 0ff5cfff5d764799a7628578e9a708235e69853a
Author: Aibing Chen <chenaibing@cmss.chinamobile.com>

net: hso: fix stashed tx skb leak and replay race

This commit takes the stashed TX skb with xchg() in hso_net_close() and
hso_resume() and adds a per-interface mutex to serialize replay during USB
resume against interface close.

Link: https://lore.kernel.org/all/6af74e31.fe96acdb.12252b.0009.GAE@google.=
com/

> diff --git a/drivers/net/usb/hso.c b/drivers/net/usb/hso.c
> index 71caa3764b239..43884234c4d8f 100644
> --- a/drivers/net/usb/hso.c
> +++ b/drivers/net/usb/hso.c

[ ... ]

> @@ -3051,21 +3069,28 @@ static int hso_resume(struct usb_interface *iface)
>  		if (network_table[i] &&
>  		    (network_table[i]->interface =3D=3D iface)) {
>  			hso_net =3D dev2net(network_table[i]);
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
> +				skb =3D xchg(&hso_net->skb_tx_buf, NULL);
> +				if (skb) {
>  					dev_dbg(&iface->dev,
>  						"Transmitting"
>  						" lingering data\n");
> -					hso_net_start_xmit(hso_net->skb_tx_buf,
> -							   hso_net->net);
> -					hso_net->skb_tx_buf =3D NULL;
> +					hso_net_start_xmit(skb, hso_net->net);
>  				}

[Severity: Medium]
Does hso_resume() still need netif_tx_lock_bh(hso_net->net) around the
skb_tx_buf xchg() and hso_net_start_xmit() call?

tx_replay_lock serializes hso_resume() with hso_net_close(), but
hso_net_start_xmit() runs under the netdev TX lock without taking
tx_replay_lock:

drivers/net/usb/hso.c:hso_net_start_xmit() {
	netif_stop_queue(net);
	if (hso_get_activity(odev->parent) =3D=3D -EAGAIN) {
		odev->skb_tx_buf =3D skb;
		return NETDEV_TX_OK;
	}

When the device is suspended, hso_get_activity() schedules async_get_intf
and checks usb->state !=3D USB_STATE_CONFIGURED before returning -EAGAIN.  =
If
hso_resume() runs between that check and the skb_tx_buf assignment, nothing
serializes the two paths:

CPU0                                    CPU1
hso_net_start_xmit()
  netif_stop_queue(net)
  hso_get_activity() -> -EAGAIN
    schedule_work(&async_get_intf)
                                        usb_resume_both()
                                          udev->state =3D USB_STATE_CONFIGU=
RED
                                          hso_resume()
                                            xchg(&hso_net->skb_tx_buf, NULL)
                                              -> NULL
  odev->skb_tx_buf =3D skb;  <-- TX queue wedged

Because usb->state is already USB_STATE_CONFIGURED and no TX URB is in
flight, write_bulk_callback() never runs to wake the queue or drop the
activity reference, leaving the TX queue stopped and the runtime PM
reference leaked.

In addition, when hso_resume() does obtain a stashed skb, calling
hso_net_start_xmit() without netif_tx_lock_bh() allows another CPU to enter
hso_net_start_xmit() concurrently if usb_submit_urb() fails or completes
before the replay call returns.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117084732.297-=
1-chenaibing@cmss.chinamobile.com?part=3D1
