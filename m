Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794075069;
	b=nt2kGValBSz1I3yob0j6BUgOerpy2Cr0WjNcc5liCFWZWo+QwVMC0qnlfYqWchzIwJnA
	 3WV/iqEWdfuNut9I7+7Rqzz7uH12g8Wph0NEFvmzdwsB0O8p7hAay8mJd3SRhB5xdOOnE
	 zwJHf9hGnxkdtmvJ3DHZIPiOKnG9GD5u+4En8zalq/gQA6ATbDR/Zpuh6yqHRvn9SRuiR
	 6nlL3I+mAyzEZdqI0/HwXQ7cnj8FaeHmhJ3n5Gmy/5df9lxoEFqUqw/RPJxm42M6DZcKY
	 PGB5esFoN7qRn5Ao7SlOwdkUuiFq6kn2dfZdWMAhStyFCu8cgUGkiyXeTFmyU+YFQxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794075069;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6SL7bT/iYz7QrjoJnx89LBrgmfcZxPU5F4hbVqmaitQ=;
	b=uFLIHAYC9/FcMxH5IThYIM9JSfWpCabWFqtJqmzZrlTW3uYGhM2ohGE5D6UZWW+Ei7mT
	 E1inUGPhhY/fzXs7P55p1pk+XcHJRzItjdMQAxqX9OtTLtBhJHRHl0D76mmG8QAN63Xf8
	 IhsIEmq84lzZcyON7pnItdawjKeqcO3o1eVd25NtweniQcWLW13I/ua/2Hyn8Ds/vxnua
	 FyzE9n1qSofaJTEHdK2yZ/yWEsByJj8xtLJDauNivfxoXYLPfsxAwBT2JeRh/ZXmvac8k
	 z2KqwCiHEDq4L6uxt50fuEyAAIBhjhgVNxlmZgxvzqbhIglZBu4RANpqeu2rLjM8csg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G3qY1UPB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D445B606A326
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 18:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G3qY1UPB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F3951F0089F;
	Sat,  7 Nov 2026 18:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794075068;
	bh=6SL7bT/iYz7QrjoJnx89LBrgmfcZxPU5F4hbVqmaitQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G3qY1UPBWQnD2W9d4LoR5FzDjQ5lVhwz2eZr6eHjR57+W3e4vZTKD3kNb94TEMKPJ
	 i1xxMQ+QFeETz+J25Eg04hvMUtdMerX18hjfSkQGnPm/sdO7ZbGlEabbFr9GuEn6oX
	 ryhiVs75gNMs/qeaTgYBtsvE+ORK++5l8/n8pF2wCDvJghSSZCxtLTjrSvK9tgG7b+
	 VqGz1tvKq269S2h1+dNTSpMexmoP60Aj7kdHx+nN9znwF7R6BW6MSirG1pxZI5d7XK
	 lCOQnYxAV0ofyzeHGfbCzAQI6MDVf2zhvEIgyVz7Il3bWdtkd1+blb1RFddsnaQLjt
	 SX1uzs0IFRfUA==
Message-ID: <sashiko-outbox-203154@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] usb: musb: gadget: don't flush a waiting RX
 packet when queueing a request
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elvira Khabirova" <lineprinter0@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261107173601.63095-3-lineprinter0@gmail.com>
References: <20261107173601.63095-1-lineprinter0@gmail.com>
 <20261107173601.63095-3-lineprinter0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 18:11:07 +0000
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
- [Medium] usb: musb: gadget: premature and unlocked rx_kick queueing in
  musb_resume()
--

commit c9ae36b9b6933c41b159c85ef258637f80341755
Author: Elvira Khabirova <lineprinter0@gmail.com>

usb: musb: gadget: don't flush a waiting RX packet when queueing a request

This commit replaces the RX FIFO flush in musb_ep_restart() with a
system_bh_wq work item (rx_kick) to process waiting RX packets when a
request is queued or after an in-progress giveback finishes.

> diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
> index 73ac25f53698f..38469727acc6f 100644
> --- a/drivers/usb/musb/musb_core.c
> +++ b/drivers/usb/musb/musb_core.c
[ ... ]
> @@ -2866,6 +2868,7 @@ static int musb_resume(struct device *dev)
>  	if ((devctl & mask) !=3D (musb->context.devctl & mask))
>  		musb->port1_status =3D 0;
> =20
> +	musb_gadget_enable_rx_kicks(musb);
>  	musb_enable_interrupts(musb);
>  	musb_platform_enable(musb);
> =20
> diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadge=
t.c
> index b500e0d8b0bd3..08bb605aa0b31 100644
> --- a/drivers/usb/musb/musb_gadget.c
> +++ b/drivers/usb/musb/musb_gadget.c
[ ... ]
> +static void musb_g_enable_rx_kick(struct musb *musb, struct musb_ep *mus=
b_ep)
> +{
> +	if (!musb_ep->rx_kick.func)
> +		return;
> +
> +	enable_work(&musb_ep->rx_kick);
> +	if (musb_ep->desc && !musb_ep->is_in) {
> +		pm_runtime_get_noresume(musb->controller);
> +		if (!queue_work(system_bh_wq, &musb_ep->rx_kick))
> +			pm_runtime_put_noidle(musb->controller);
> +	}
> +}
> +
> +void musb_gadget_enable_rx_kicks(struct musb *musb)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < musb->nr_endpoints; i++) {
> +		musb_g_enable_rx_kick(musb, &musb->endpoints[i].ep_in);
> +		musb_g_enable_rx_kick(musb, &musb->endpoints[i].ep_out);
> +	}
> +}

[Severity: Medium]
Can calling musb_gadget_enable_rx_kicks() unlocked before
musb_enable_interrupts() and musb_platform_enable() in musb_resume()
wedge an OUT endpoint or race on endpoint and interrupt state?

During system suspend, musb_suspend() calls pm_runtime_get_sync() (leaving
musb->is_runtime_suspended at 0) and musb_disable_interrupts(), which
zeros musb->intrtxe, musb->intrrxe, MUSB_INTRTXE, and MUSB_INTRRXE.  On
resume, musb_restore_context() writes those zeroed masks back to hardware
before musb_gadget_enable_rx_kicks() queues rx_kick on system_bh_wq:

CPU0                                  CPU1 (system_bh_wq)
musb_resume()
  musb_restore_context()
    /* MUSB_INTRRXE is 0 */
  musb_gadget_enable_rx_kicks()
    queue_work(..., &musb_ep->rx_kick)
                                      musb_g_rx_kick()
                                        musb_g_rx()
                                          rxstate()
                                            /* clears RXPKTRDY */
                                      /* next host packet arrives while
                                       * MUSB_INTRRXE =3D=3D 0 or platform
                                       * interrupts are still disabled
                                       * <-- IRQ lost, endpoint wedged */
  musb_enable_interrupts()
  musb_platform_enable()

In addition, musb_g_enable_rx_kick() inspects musb_ep->desc and
musb_ep->is_in without holding musb->lock, and if musb_g_rx_kick()
completes a request via musb_g_giveback() before musb_enable_interrupts()
runs, the gadget completion callback (or a thread it wakes) can call
usb_ep_enable() or usb_ep_disable() and modify musb->intrrxe,
musb->intrtxe, and musb_ep->desc concurrently with the unlocked loop in
musb_gadget_enable_rx_kicks() and musb_enable_interrupts().

Calling musb_gadget_enable_rx_kicks() under musb->lock (or splitting
enable_work() from queuing rx_kick under musb->lock) after
musb_enable_interrupts() and musb_platform_enable() would avoid this.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107173601.6309=
5-1-lineprinter0@gmail.com?part=3D2
