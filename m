Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EBA3914FE
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 22:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791497025; cv=none; b=CMHHBbiP0m7U7hOvP/OknveLv8B/998A/iHeI0UgB10MJVP6/yon+pA6yc8n4NqBLnMQR/537VZ+zf2DfA9wNgDJ9OKrTtGaFOyYGnsrXV1WkCUHzrClLdISw98xo8lnm61w3SJeNRSY5mrk+ZpP8p8JOXvHIVNswpJ9un32WPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791497025; c=relaxed/simple;
	bh=KUqstKQPCybMyo/G3wzq8AHOGlfMoOZvs76rj7nL86M=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=WyWxCCIMauBnbIg97OAzeqjVQH0wWPhHevtZFT9PZ68/jFx/10y+6aEsH+Vhxa0yo2YhXFoo9JoSdaGQ2zKAgPZ43oyVmGqizWF3iMQvD+PDHW4699eMktb9XPHc3K1HeB2UgrTfJ6zWnSnc9/llxiukD01MgUbS8+NrfPl1GQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F4y3mtT/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F4y3mtT/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E8A1F000FF;
	Thu,  8 Oct 2026 22:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791497024;
	bh=gR+1TYsisYm6rP7UH2m4vPHUWNrSsv7UlFKOa+WPIEk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F4y3mtT/W/q2uc0ufue7QsrsCT91s5B5gZmFlgZ7nIWh9eClMq+F5XqJBYLDw0H5V
	 7uCFU+tl/w9m4BLzXbrQsi6zAOprv4Q16urEY7J3KDZYiL82kEcmGkq4iU7iIhOi5l
	 P6+tYT1OGRgEnA/d3Jm2dgsrG6HoXcD/xdYQQt40fvdy7yyvYIxFRX7i20hZtzmWvV
	 84KYoXiy9h7QH2O0P8irPK0C1MV/CYYWkhLXYptRNb2swiUPFcxVlFF8b2M0q00E51
	 yqkfyBIhJ0C0ndG5e2mmN3PM9+MMrZdvonrYxwa7T4ezrp/NgrlNT7fU5TIkOzqOaM
	 sRC+4F49WxlBg==
Message-ID: <sashiko-outbox-164620@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v3] usbnet: fix EVENT_RX_PAUSED race in
 usbnet_skb_return()
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?w5ZtZXIgTWV0ZSBLYXlh?= <omermetekaya0@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261007220311.113827-1-omermetekaya0@gmail.com>
References: <20261007220311.113827-1-omermetekaya0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 22:03:43 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net: out-of-order packet delivery during RX resume
--

commit 7148b0b2b0b945f31b2120d7f4cbc269acf91635
Author: =C3=96mer Mete Kaya <omermetekaya0@gmail.com>

usbnet: fix EVENT_RX_PAUSED race in usbnet_skb_return()

This commit addresses a race condition in usbnet_skb_return() by protecting
the EVENT_RX_PAUSED flag check and enqueue operations with a double-check
pattern under the rxq_pause lock. It also protects the clear_bit() operation
in usbnet_resume_rx() under the same lock.

> diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
> index a19ecf718f36a..d1ec3ba1e10e6 100644
> --- a/drivers/net/usb/usbnet.c
> +++ b/drivers/net/usb/usbnet.c
[ ... ]
> @@ -700,15 +705,16 @@ void usbnet_resume_rx(struct usbnet *dev)
>  	int num =3D 0;
> =20
>  	local_bh_disable();
> +	spin_lock(&dev->rxq_pause.lock);
>  	clear_bit(EVENT_RX_PAUSED, &dev->flags);
> -
> +	spin_unlock(&dev->rxq_pause.lock);

[Severity: Medium]
If a new packet arrives concurrently on another CPU via usbnet_skb_return(),
could it observe EVENT_RX_PAUSED as false here?

If so, it would bypass the pause queue and immediately deliver the new SKB
to the network stack via netif_rx().

>  	while ((skb =3D skb_dequeue(&dev->rxq_pause)) !=3D NULL) {
>  		usbnet_skb_return(dev, skb);
>  		num++;
>  	}

This seems like it would cause the newly arrived packet to be delivered bef=
ore
the older packets in the rxq_pause queue are fully drained by this while lo=
op,
leading to out-of-order delivery which can degrade TCP performance.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007220311.1138=
27-1-omermetekaya0@gmail.com?part=3D1
