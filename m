Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387807;
	b=hxGTTNVSivehXrMjHI0arpj6bt4kNm3P4dVqETDzGOY2BAiNfSPvJSHR/4NxjkR1tUK6
	 sGQ7MxRvy1lAndnB12+e6kxYvCshtMfcOFc3bWcpQg2IgvsSawxfFOr36U6NllAqlYVgC
	 WcjM7rcvqpTo0gOeRZJOGXXQ10ECgVV4stUA7iYddcQUPktLfZU2FjX51oUIMVqv6Q3a+
	 dxe+ifeUrcPZ2S3+gh6+5sZGMQDRyTAZoTXnkr5hq7zW4NJm3Ed4zPamAEkwv6mccC+g2
	 lTcRCOC4FzZmCpbBxyipNvAZkJ7MsMaj2pkwPXJK1Bdhcs6/CnpaQF4S0Zr2BmH0mkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387807;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OaO/cuO8wGEE6lFURN0id05OgY2a4r0QYE8lPAVuA2g=;
	b=v4WWKchyppccRLWD2aQh43sfWOXb5oI4a4RvKIruvrEgsQ5Rj7cnDNF2l2GfK7OKQDSC
	 zRXYyKEDOv3Yd5bcUlIF4jUYl+bALKoKKgOfRwv25lEed23TH+FCOptZJxwO4sKjZZEyf
	 +vzuL0nn071SBcr0zvWkQztTDQY6lxwy1FKPcPM9vHsZHpTmy54DaETOYQxOe4G1Hllhs
	 LM6Z2CAKq3v1tYMYw7hHzsKnfhWuZmkQ3rLe38arJIWaN02ZQ/tMnYn/QP0xvBEd61QoH
	 xOf32ZerBhI02+ss1j/QqnRtZc5Yz2WNdPDIkdNYp+aWX8kD6BQ/IPy1+J609Qlxxrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oqp7gfca;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E75A606A321
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 09:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oqp7gfca
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AEFB1F00A09;
	Wed, 11 Nov 2026 09:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794387806;
	bh=OaO/cuO8wGEE6lFURN0id05OgY2a4r0QYE8lPAVuA2g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Oqp7gfcaDhXui6/1+aVwNNAkpyWRxU4ivDtsxZnpuVd+DBxWe7EGtAFoGmHlPFN3K
	 8L9BydFp97OYmPHEK3CflC69HB0WAJ6x6PI1Fc6pJuujOFS9ToqRcllAo5WElnEPVQ
	 ehPYoS0CYa+tkc7vFa1QbRagd3WXyD3zXrqC9kl8R9/+B+qiyc9wKWUjlSvdNUsOdP
	 x1dODS1Isqh09FkKH83inST3T9XrFelH5GQ1VK06cD+uT9aXmBJ7r/zR1E+J2aaiTl
	 utWsdlMG94QM/7d+fszwpQphNCGumV+I05tZuhtU0m0XEtYdl9NMiBZZ5dwymm8MjX
	 ca7WO1P1vuI2w==
Message-ID: <sashiko-outbox-208652@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net] net: usb: smsc75xx: reject frames shorter than the
 FCS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joas Antonio dos Santos" <joasantonio108@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110-smsc75xx-rx-fcs-v1-1-4e048bfc28f3@gmail.com>
References: <20261110-smsc75xx-rx-fcs-v1-1-4e048bfc28f3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 09:03:26 +0000
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
- [Medium] net: usb: smsc75xx: short non-final frames in
  smsc75xx_rx_fixup() read uninit memory
--

commit c9531c5cff866a425adb994e4854a216487a72e0
Author: Joas Antonio dos Santos <joasantonio108@gmail.com>

net: usb: smsc75xx: reject frames shorter than the FCS

This commit adds a minimum frame size check in smsc75xx_rx_fixup() to
reject frames shorter than ETH_FCS_LEN before subtracting 4 for the FCS.

> diff --git a/drivers/net/usb/smsc75xx.c b/drivers/net/usb/smsc75xx.c
> index 6f72a3f159079..e923fa6c17857 100644
> --- a/drivers/net/usb/smsc75xx.c
> +++ b/drivers/net/usb/smsc75xx.c
> @@ -2217,6 +2217,13 @@ static int smsc75xx_rx_fixup(struct usbnet *dev, s=
truct sk_buff *skb)
>  				return 0;
>  			}
> =20
> +			if (unlikely(size < ETH_FCS_LEN)) {
> +				netif_dbg(dev, rx_err, dev->net,
> +					  "size err rx_cmd_a=3D0x%08x\n",
> +					  rx_cmd_a);
> +				return 0;
> +			}
> +
>  			/* last frame in this batch */
>  			if (skb->len =3D=3D size) {
>  				smsc75xx_rx_csum_offload(dev, skb, rx_cmd_a,

[Severity: Medium]
Should this check for size < ETH_HLEN + ETH_FCS_LEN instead of
size < ETH_FCS_LEN?

For a non-final frame in a batch (skb->len !=3D size) with size in 4..17,
smsc75xx_rx_fixup() copies only 0..13 bytes (size - 4) into ax_skb->data
and passes ax_skb directly to usbnet_skb_return().  Unlike rx_process(),
which checks skb->len < ETH_HLEN for the final frame, usbnet_skb_return()
calls eth_type_trans() unconditionally, where eth_skb_pkt_type() and
eth_type_trans() read eth->h_dest and eth->h_proto from uninitialized
memory past the copied bytes in ax_skb->data.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-smsc75xx-r=
x-fcs-v1-1-4e048bfc28f3@gmail.com?part=3D1
