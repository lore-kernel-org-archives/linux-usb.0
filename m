Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814197;
	b=XQA+WuaDxM75QwOE1g7WlzS/utwQTdYZga7DWxH0/QAHE5Nb0akO/BZhoAznlH7z6TVp
	 RhW4goc+vOOg+P8FMaDM+71okWec0IDDCPtSH6aMmWD4jUq7BFiTG/NTO1RHmS/5Mxtu0
	 AW9Mg0Fg40zOuWVGlkl6UlDfhlVbsxciyrX5y6aTHeLFlmODA1SAAqJtMoqELw++viigq
	 quHHW/1XRMYYW6ev0K2IQb7kCi8yxio+tSXZld7qUdic725h3/pqvr+js+JD87YT56xja
	 fVnvWNd2p9fsEUDsl7hKk2YLY1sFZ5u3xlFtrbERZG2WQu8RiKaRwmsq4etp/3Wlwgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814197;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Iboy6YPzp+SlIhuXzpZvX9iwOX0BsDMPmD95MmXzcCU=;
	b=3QGx0G8D1pfCAgDAMn9X8NaFlV3CYYBrKijJeC+FFvIMl93UlXJ6GXPc8bzRDYXMYhTZ
	 /ZKTNVvfubQA2UtdztM9ZfZwhV3x71zGOlucXiGpGh2l/9LPSLBcQj9tT9EkBN9xLsYnV
	 6f7EgGRvwK9/bQrEGzQGcN07noAWNH0Dc7sRdFSE6TtL/5oTaada/264NwCwFBW4sAU+i
	 jDTg5j/LeUW9PcQWywAp043diSQd0g1q0ruZpUxLGH5C+cUepvKfkmmMaVHua0FUoEtCK
	 Hc9UtYLn9MPopKqwV46i27ZP/G+38BZmMqs+/8afArGSw/h47n6WsIf0NpqQfVIY9Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iggs6KDo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1652606A31C
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 07:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iggs6KDo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 231881F000C5;
	Mon, 16 Nov 2026 07:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794814197;
	bh=Iboy6YPzp+SlIhuXzpZvX9iwOX0BsDMPmD95MmXzcCU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Iggs6KDou+u41w16yEKjhB08GFOri2V96RpAeNcyHrI6BUTp/NGSKDceAS6xcTftB
	 ZiSG4tqNv+asaVgmpGUzuwqNspOvgMi2nHentkEUewxsXNuUrK2jrXYVrKoV5Jls3j
	 ZJ3rEsx0GeFFMFTrsLgro32CsOl+6t0i1wBQqZ51R0qN3dzndUkfYo2GI7Na7d2l6g
	 +DXH4/5+CEWsodfRfyLDSbLTnwmNKyNMPRGWR2XlU00DnjCu2yig3SQW+t+n+kwpEh
	 i9nM0DKnOiPCuIxakpK63/qWNAbijCVb2f/vHKmRLrYDqOevEGzpdLw22Qbj8HReG0
	 +uOk0rDM78elw==
Message-ID: <sashiko-outbox-216430@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] usb: dwc2: gadget: restart descriptor DMA
 isochronous OUT endpoints after BNA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vadim Yuzifovich" <vadim@yuzi.co>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261116070433.2813951-2-vadim@yuzi.co>
References: <20261116070433.2813951-1-vadim@yuzi.co>
 <20261116070433.2813951-2-vadim@yuzi.co>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 07:29:56 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] usb: dwc2: premature desc 0 HREADY in
  dwc2_gadget_handle_isoc_bna()
- [High] usb: dwc2: bogus completion and BNA storm in
  dwc2_gadget_handle_isoc_bna()
- [Medium] usb: dwc2: full-chain check bypassed in
  dwc2_gadget_fill_isoc_desc()
--

commit f0cc733bf787934eb1620a6db8b6da521ba5be31
Author: Vadim Yuzifovich <vadim@yuzi.co>

usb: dwc2: gadget: restart descriptor DMA isochronous OUT endpoints after B=
NA

This commit restarts isochronous OUT endpoints in descriptor DMA mode
directly from the BNA and endpoint-disabled interrupt handlers, keeping
descriptor 0 host-busy while building the chain and draining any packet
held by the core before enabling the endpoint.

> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index 6c8a9f05fff00..8adc90047c05b 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c
> @@ -900,6 +900,7 @@ static void dwc2_gadget_config_nonisoc_xfer_ddma(stru=
ct dwc2_hsotg_ep *hs_ep,
>   * @hs_ep: The isochronous endpoint.
>   * @dma_buff: usb requests dma buffer.
>   * @len: usb request transfer length.
> + * @hold: leave the descriptor host busy; the caller marks it host ready.
>   *
>   * Fills next free descriptor with the data of the arrived usb request,
>   * frame info, sets Last and IOC bits increments next_desc. If filled
> @@ -907,7 +908,8 @@ static void dwc2_gadget_config_nonisoc_xfer_ddma(stru=
ct dwc2_hsotg_ep *hs_ep,
>   * status.
>   */
>  static int dwc2_gadget_fill_isoc_desc(struct dwc2_hsotg_ep *hs_ep,
> -				      dma_addr_t dma_buff, unsigned int len)
> +				      dma_addr_t dma_buff, unsigned int len,
> +				      bool hold)
>  {
>  	struct dwc2_dma_desc *desc;
>  	struct dwc2_hsotg *hsotg =3D hs_ep->parent;
> @@ -956,7 +958,8 @@ static int dwc2_gadget_fill_isoc_desc(struct dwc2_hso=
tg_ep *hs_ep,
>  	}
> =20
>  	desc->status &=3D ~DEV_DMA_BUFF_STS_MASK;
> -	desc->status |=3D (DEV_DMA_BUFF_STS_HREADY << DEV_DMA_BUFF_STS_SHIFT);
> +	desc->status |=3D (hold ? DEV_DMA_BUFF_STS_HBUSY :
> +				DEV_DMA_BUFF_STS_HREADY) << DEV_DMA_BUFF_STS_SHIFT;

[Severity: Medium]
Does holding descriptor 0 in DEV_DMA_BUFF_STS_HBUSY bypass the full-ring
check in dwc2_gadget_fill_isoc_desc() when hs_ep->queue has more than
MAX_DMA_DESC_NUM_HS_ISOC (256) requests?

drivers/usb/dwc2/gadget.c:dwc2_gadget_fill_isoc_desc() {
    ...
	/* Check if descriptor chain full */
	if ((desc->status >> DEV_DMA_BUFF_STS_SHIFT) =3D=3D
	    DEV_DMA_BUFF_STS_HREADY) {
		dev_dbg(hsotg->dev, "%s: desc chain full\n", __func__);
		return 1;
	}
    ...
}

In dwc2_gadget_start_isoc_ddma(), the first request fills desc_list[0] with
hold =3D true, leaving its status as DEV_DMA_BUFF_STS_HBUSY.  If more than =
256
requests are queued, hs_ep->next_desc wraps from 255 back to 0 on the 257th
request, and the check above does not see DEV_DMA_BUFF_STS_HREADY.  It
overwrites desc_list[0] with the 257th request's buffer and sets DEV_DMA_L =
on
desc_list[0] without clearing DEV_DMA_L on desc_list[255], desynchronizing
the descriptor ring from hs_ep->queue and stopping the chain after one
packet.

[ ... ]

> @@ -1024,6 +1082,16 @@ static void dwc2_gadget_start_isoc_ddma(struct dwc=
2_hsotg_ep *hs_ep)
>  	/* write descriptor chain address to control register */
>  	dwc2_writel(hsotg, hs_ep->desc_list_dma, dma_reg);
> =20
> +	desc =3D &hs_ep->desc_list[0];
> +	desc->status &=3D ~DEV_DMA_BUFF_STS_MASK;
> +	desc->status |=3D DEV_DMA_BUFF_STS_HREADY << DEV_DMA_BUFF_STS_SHIFT;
> +
> +	if (!hs_ep->dir_in && !again &&
> +	    dwc2_gadget_isoc_out_held_packet(hs_ep)) {
> +		again =3D true;
> +		goto restart;
> +	}

[Severity: High]
Can completing requests during BNA recovery while hs_ep->target_frame is not
TARGET_FRAME_INITIAL cause dwc2_hsotg_ep_queue() to mark desc_list[0]
DEV_DMA_BUFF_STS_HREADY prematurely?

dwc2_hsotg_complete_request() drops hsotg->lock around
usb_gadget_giveback_request().  When the gadget completion callback
re-queues a request via dwc2_hsotg_ep_queue(), it checks whether
hs_ep->target_frame !=3D TARGET_FRAME_INITIAL and calls
dwc2_gadget_fill_isoc_desc(..., false).

This happens in three places while the core is holding a BNA packet and
polling desc_list[0]:
- in dwc2_hsotg_epint(), when DXEPINT_XFERCOMPL runs
  dwc2_gadget_complete_isoc_request_ddma() before DXEPINT_BNAINTR is handle=
d,
- in dwc2_gadget_handle_isoc_bna(), where dwc2_hsotg_complete_request() runs
  before hs_ep->target_frame is reset to TARGET_FRAME_INITIAL, and
- in dwc2_gadget_isoc_out_held_packet(), which calls
  dwc2_gadget_complete_isoc_request_ddma() while hs_ep->target_frame is set
  to the current frame number before jumping to restart.

Whenever hs_ep->next_desc is 0 (or wraps to 0) during any of those giveback=
s,
dwc2_hsotg_ep_queue() sets desc_list[0] to DEV_DMA_BUFF_STS_HREADY with
DEV_DMA_L set for the newly queued tail request.  The core immediately DMAs
the held packet into that tail request's buffer and races with
dwc2_gadget_start_isoc_ddma() rebuilding the chain.

[ ... ]

> @@ -2259,26 +2327,66 @@ static void dwc2_gadget_complete_isoc_request_ddm=
a(struct dwc2_hsotg_ep *hs_ep)
>  	}
>  }
> =20
> +/*
> + * dwc2_gadget_restart_isoc_out_ddma - build the chain of a disabled ISO=
C OUT
> + * endpoint again from its queue and enable it.
> + * @hs_ep: The isochronous OUT endpoint, in its initial state.
> + *
> + * After a BNA the core keeps raising BNA for the endpoint, as fast as t=
he
> + * handler clears it, and no OUTTKNEPDIS comes to restart the chain. So =
the
> + * chain is restarted here at once.
> + */
> +static void dwc2_gadget_restart_isoc_out_ddma(struct dwc2_hsotg_ep *hs_e=
p)
> +{
> +	struct dwc2_hsotg *hsotg =3D hs_ep->parent;
> +
> +	if (hs_ep->dir_in || list_empty(&hs_ep->queue) ||
> +	    hs_ep->target_frame !=3D TARGET_FRAME_INITIAL ||
> +	    dwc2_readl(hsotg, DOEPCTL(hs_ep->index)) & DXEPCTL_EPENA)
> +		return;
> +
> +	hs_ep->target_frame =3D dwc2_hsotg_read_frameno(hsotg);
> +	dwc2_gadget_start_isoc_ddma(hs_ep);
> +}
> +
>  /*
>   * dwc2_gadget_handle_isoc_bna - handle BNA interrupt for ISOC.
>   * @hs_ep: The isochronous endpoint.
>   *
> - * If EP ISOC OUT then need to flush RX FIFO to remove source of BNA
> - * interrupt. Reset target frame and next_desc to allow to start
> - * ISOC's on NAK interrupt for IN direction or on OUTTKNEPDIS
> - * interrupt for OUT direction.
> + * Give back the request that met the BNA and reset target frame and
> + * next_desc. An IN endpoint starts again on the next NAK interrupt. An =
OUT
> + * endpoint is restarted here, see dwc2_gadget_restart_isoc_out_ddma().
> + *
> + * The Rx FIFO is not flushed for an OUT endpoint. It is shared by all O=
UT
> + * endpoints and the host goes on sending, so a flush here can hit a pac=
ket
> + * that is being received, after which the core no longer drains the FIF=
O.
> + * The packet that met the BNA is not dropped by a flush either: the core
> + * holds it and writes it to the first descriptor of the new chain.
>   */
>  static void dwc2_gadget_handle_isoc_bna(struct dwc2_hsotg_ep *hs_ep)
>  {
>  	struct dwc2_hsotg *hsotg =3D hs_ep->parent;
> =20
> -	if (!hs_ep->dir_in)
> -		dwc2_flush_rx_fifo(hsotg);
> +	/*
> +	 * The core disables an OUT endpoint that raises BNA and goes on
> +	 * raising BNA for it until it is enabled again. So a BNA can be
> +	 * latched between the moment the interrupt handler clears DOEPINT and
> +	 * the restart below, and is then seen with the new chain running.
> +	 * Leave that chain alone. If the endpoint is still about to be
> +	 * disabled, the endpoint-disabled interrupt or the next BNA restarts
> +	 * it.
> +	 */
> +	if (!hs_ep->dir_in &&
> +	    dwc2_readl(hsotg, DOEPCTL(hs_ep->index)) & DXEPCTL_EPENA)
> +		return;
> +
>  	dwc2_hsotg_complete_request(hsotg, hs_ep, get_ep_head(hs_ep), 0);
> =20
>  	hs_ep->target_frame =3D TARGET_FRAME_INITIAL;
>  	hs_ep->next_desc =3D 0;
>  	hs_ep->compl_desc =3D 0;
> +
> +	dwc2_gadget_restart_isoc_out_ddma(hs_ep);
>  }

[Severity: High]
Does completing get_ep_head(hs_ep) in dwc2_gadget_handle_isoc_bna() consume
an extra request on every OUT BNA, and can an empty hs_ep->queue leave the
endpoint in a BNA interrupt storm or permanently disabled?

For an OUT endpoint, the packet that triggered the BNA is not dropped; it is
 subsequently received into desc_list[0] and completed in a second request =
by
dwc2_gadget_isoc_out_held_packet().  Completing get_ep_head(hs_ep) here as
well gives back an unstarted request with actual =3D 0 alongside the request
that receives the held packet.

In addition, if hs_ep->queue is empty when dwc2_gadget_restart_isoc_out_ddm=
a()
runs (for example when only one request was queued or the gadget driver
queues requests asynchronously from a workqueue or userspace rather than in=
side
req->complete()), dwc2_gadget_restart_isoc_out_ddma() returns early with the
held packet still in the core and BNA unmasked, leaving the CPU in an
infinite BNA interrupt storm.

Similarly, if hs_ep->queue had one request left for
dwc2_gadget_isoc_out_held_packet() to consume and its completion callback
does not synchronously re-queue another, the goto restart path in
dwc2_gadget_start_isoc_ddma() sees list_empty(&hs_ep->queue), resets
hs_ep->target_frame to TARGET_FRAME_INITIAL, and returns without setting
DXEPCTL_EPENA.  Because the held packet has now been drained, neither BNA n=
or
OUTTKNEPDIS will fire again, and later dwc2_hsotg_ep_queue() calls will see
TARGET_FRAME_INITIAL and never restart the endpoint.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116070433.2813=
951-1-vadim@yuzi.co?part=3D1
