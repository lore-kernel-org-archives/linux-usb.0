Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824217;
	b=ytTetau2luQYu8iOPNTL8eLVQMy6Wvsu2Q0vP1nNn6HnU0oKDcvKFSV0igOkpGaxqVRP
	 OfCA1mhHcO4Lhg7Q9+wg3L5n+ymZwnzd1K9YjWa1KzKwpn/OvgPocH1T4qdxDD68AdO3z
	 GagZnO2AjTr5REbMgEt5F81Q2rkBk+2j+cy9xULVvh0l8p5zNLGzM6NEIjbD9hhBn17Y6
	 9MwHiQ9bJiGw6vb8AhXmewphpVcAY8SGGI0atU09fWHbxiso3EnCkVRCa3w2nSxnSV7Zx
	 dFNU+GYpdFNAcMIz83iQ72SGOVO/x9LCAugENZqw5rLR428cptd2n1efclBR7UzDRcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824217;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wvjIcb489MNI+PAEjit7VZrKhYqtAsaZyCRmpVlWelw=;
	b=B1FJkhM/u2DUSdbxjGWZuNJpZhJNXTKFoKFEnpR4y0Ij98AQPDk8F1d7r7H/C7oETgjg
	 XOppnWQMk2HG7Cq1XiKMhcKjvveFBHd5QwJwnzT2iQjySSKPpvLKhdPfzlizxC89ksZJv
	 lor4lJeFss7EwEUlNTRPD9xFRWjIUzbM0XtHf3PW4GCuj9z94FPrpaSmE6rRQwWQzywGp
	 +GYXNMvcHwIcMmV0iuuK0sg09eGFlEU4hax4JFUS441h7MVqdLQK86tXS4LcuiGWyOnQ7
	 s3TXONpiw/GVdBGlmIAYowPDJkQXFdB8X142anBdCosSsel40ODbvn9+vlm6+qJbL+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LA1ylGsS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F20606A32A
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 10:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LA1ylGsS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CAD01F000C6;
	Mon, 16 Nov 2026 10:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794824217;
	bh=wvjIcb489MNI+PAEjit7VZrKhYqtAsaZyCRmpVlWelw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LA1ylGsSGhgZE3/AZ3n0oML+cKp+7LxeQ2LRfgvKqYMAOAmoucu2BMBqPVRI7ieFj
	 K3xNmOzNuR+Z+n7xOKhe1hEnFH2QZunjKycTs5/VO/xfNQHeaS0JGm8Nm5rEYvXEWC
	 UIsHynjYzaubJu0BHIljQzmPmcnHcam6qHtGrbatk1OJzYIeW5GwojmPh2t0kHrL/m
	 j1bhnj0/B0NOmANx2aXQ5vjYqCrAXGge9oredY/3pG9ibBasYaZP8Mn+o7aHN1vAfP
	 vk5TnjWfjGY6DHdMOD9zwHweDQeo+bE5SPTPrEcpeHe6iUPQtb1Li6jZ8wi+Oc+Q3g
	 slGwTTHLrjr0g==
Message-ID: <sashiko-outbox-216704@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] net: hso: fix tx skb leak and a race on the stashed
 skb
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aibing Chen" <chenaibing@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261115101646.244-1-chenaibing@cmss.chinamobile.com>
References: <20261114093133.465-1-chenaibing@cmss.chinamobile.com>
 <20261115101646.244-1-chenaibing@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 10:16:56 +0000
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
- [Medium] net: hso: race between hso_resume() and hso_net_close() leaks
  skb or starts URBs
--

commit 6454f405b890c90cd5c9d28c2b1b886b3625e833
Author: Aibing Chen <chenaibing@cmss.chinamobile.com>

net: hso: fix tx skb leak and a race on the stashed skb

This commit frees any pending skb in hso_net_close() and uses xchg() in
both hso_net_close() and hso_resume() to take ownership of skb_tx_buf.

Link: https://lore.kernel.org/all/6af74e31.fe96acdb.12252b.0009.GAE@google.=
com/

> diff --git a/drivers/net/usb/hso.c b/drivers/net/usb/hso.c
> index 71caa3764b239..ba59bdefd203d 100644
> --- a/drivers/net/usb/hso.c
> +++ b/drivers/net/usb/hso.c
> @@ -720,6 +720,7 @@ static int hso_net_open(struct net_device *net)
>  static int hso_net_close(struct net_device *net)
>  {
>  	struct hso_net *odev =3D netdev_priv(net);
> +	struct sk_buff *skb;
> =20
>  	/* we don't need the queue anymore */
>  	netif_stop_queue(net);
> @@ -728,6 +729,14 @@ static int hso_net_close(struct net_device *net)
> =20
>  	hso_stop_net_device(odev->parent);
> =20
> +	/*
> +	 * Take ownership of a frame stashed by hso_net_start_xmit() and drop i=
t.
> +	 * hso_resume() takes it the same way, so only one of the two paths fre=
es
> +	 * it.
> +	 */
> +	skb =3D xchg(&odev->skb_tx_buf, NULL);
> +	dev_kfree_skb(skb);
> +
>  	/* done */
>  	return 0;
>  }
> @@ -3032,6 +3041,7 @@ static int hso_resume(struct usb_interface *iface)
>  {
>  	int i, result =3D 0;
>  	struct hso_net *hso_net;
> +	struct sk_buff *skb;
> =20
>  	/* Start all serial ports */
>  	for (i =3D 0; i < HSO_SERIAL_TTY_MINORS; i++) {
> @@ -3054,13 +3064,17 @@ static int hso_resume(struct usb_interface *iface)
>  			if (hso_net->flags & IFF_UP) {
>  				/* First transmit any lingering data,
>  				   then restart the device. */
> -				if (hso_net->skb_tx_buf) {
> +				skb =3D xchg(&hso_net->skb_tx_buf, NULL);
> +				if (skb) {
>  					dev_dbg(&iface->dev,
>  						"Transmitting"
>  						" lingering data\n");
> -					hso_net_start_xmit(hso_net->skb_tx_buf,
> -							   hso_net->net);
> -					hso_net->skb_tx_buf =3D NULL;
> +					if (test_bit(HSO_NET_RUNNING,
> +						     &hso_net->flags))
> +						hso_net_start_xmit(skb,
> +								   hso_net->net);
> +					else
> +						dev_kfree_skb(skb);
>  				}
>  				result =3D hso_start_net_device(network_table[i]);
>  				if (result)

[Severity: Medium]
Can hso_resume() still race with hso_net_close() and leak skb or restart
URBs on a closed interface?

Nothing serializes the HSO_NET_RUNNING check in hso_resume() against
hso_net_close():

CPU0                              CPU1
hso_resume()
  skb =3D xchg(&hso_net->skb_tx_buf, NULL)
  test_bit(HSO_NET_RUNNING, ...)  [true]
                                  hso_net_close()
                                    clear_bit(HSO_NET_RUNNING, ...)
                                    hso_stop_net_device()
                                    xchg(&odev->skb_tx_buf, NULL)  [NULL]
  hso_net_start_xmit(skb, ...)
    /* if hso_get_activity() =3D=3D -EAGAIN */
    odev->skb_tx_buf =3D skb        <-- leaked after close finished
  hso_start_net_device()          <-- submits RX URBs on closed device

If hso_get_activity() returns -EAGAIN during hso_net_start_xmit(), skb is
stashed back into odev->skb_tx_buf after hso_net_close() has already
drained it, leaking skb on disconnect or the next hso_net_open().  If
hso_get_activity() succeeds instead, hso_net_start_xmit() and
hso_start_net_device() submit TX and RX URBs after hso_stop_net_device()
killed them; even if HSO_NET_RUNNING is cleared before test_bit() so skb
is freed, hso_resume() still calls hso_start_net_device() unconditionally.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115101646.244-=
1-chenaibing@cmss.chinamobile.com?part=3D1
