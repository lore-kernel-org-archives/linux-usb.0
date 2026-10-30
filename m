Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348957;
	b=ONpjaJ9zN1fqJSSm6NO8jL2Euama4dNeDJLB8wSJWVf43LANeUGGDMDc0fySJZD0q+Lg
	 aRIBA3S6BAMxzPADFKwtNWTQ6IoLORTYBZoE5RhJMYXiFTmozeNqp11NNVL7epN8YB3pN
	 Alq2ezfKgAgL1p9PVs8tOHqC9q4WWrt2nXgUr2qQd57GSE8SHizNBy0vH4ZEPWEmyGPpI
	 Q8T/ssCNZae+MA0ksc/nYxz/4SdZzcTggq8T+EBv3qWmK0aaSRAVElcc5DgpqCmaT0VK6
	 lafY4saygXw9Ag2bAuDVM6lLaCgLM3Pnl8Q9IPTIBwf+jXsln1c5f2KuoSVON1tSxwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348957;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IpheMjL2Vy8oENc9XcozqqOv+J5eyDR36FXYtB8F5Wc=;
	b=dYf4uCKOhIF3YziQH3uGSIFXb/Ta1eAwCO4fjOlMuMZjoJLzK3LMkbysTgNirERAPf9H
	 H6nzb5M5jqnU2ZSvUJINqi3kYHwIwqDihGCYK/Nepmzobpmk80N03lS5SUTE6nmD8n8kX
	 tS+lcmyzUKeML2Cf2wJI6uIZ/hMdwMdeq8n0zjYK5pBRYamkhGTeM1mnXedMF2vjld4eZ
	 hmb5stbSDRsvkzsh6vf5V0KW/eDyGS1VdqV4/oegCbQZQ0lD5lo8g8PdrgbMSd54w2866
	 Aew4HjrLJyDH5vLa1RWmk0fDIGI/3HYZX8Evc2bQJyHvp04CZnR4OhA1VW1QkId6DWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Apx0x2aY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBE7606A31C;
	Fri, 30 Oct 2026 08:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Apx0x2aY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B99A31F00A02;
	Fri, 30 Oct 2026 08:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793348957;
	bh=IpheMjL2Vy8oENc9XcozqqOv+J5eyDR36FXYtB8F5Wc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Apx0x2aYr30FMcZ6fna3vax86ThARHW+RI9/fpJOdQjYseqAe8rS7MUQVutljc8pL
	 zIKZm3ntmWyQCGSLvW+H8SnuPCXd1cUQPFVcP/2p3vTJ2xpBupqfOa5qyq2yz3Pw8A
	 DnYoByOZPWWoaRGFq5u5oPDFyNYWV8rjoSne7cF8L4/orsLxlMRpv2Y6b25GfsNznN
	 N4tJ4bd1XdvvgNIOCyoige5nuzK9EofSqsZO82bY6/kfa1wKi/0BmheWhzPOyhdFGA
	 +2TzvyS+GIRn++8a2X2H3/Nt+1uvuPcwe7KCT0zt0gzYepsjsICkbngiYFx1i3iP9T
	 5Yh/X1Wb+zZvA==
Message-ID: <sashiko-outbox-190689@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/6] usb: gadget: udc: crg: Add ring and transfer
 management
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261030-axiado-ax3000-usb-device-controller-v4-3-c5267b36a777@axiado.com>
References: <20261030-axiado-ax3000-usb-device-controller-v4-0-c5267b36a777@axiado.com>
 <20261030-axiado-ax3000-usb-device-controller-v4-3-c5267b36a777@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 08:29:16 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] usb: gadget: crg: out-of-bounds TRB read in crg_udc_update_dequeue=
_pt()
- [High] usb: gadget: crg: premature wrap skips pause in crg_udc_actual_bef=
ore()
- [High] usb: gadget: crg: crg_udc_process_event_ring() misses in-progress =
reset after lock drop
--

commit 050a1d6b53db454c24d8712a72246d62e4e494d9
Author: Petar Stepanovic <pstepanovic@axiado.com>

usb: gadget: udc: crg: Add ring and transfer management

This commit introduces memory management and ring buffer logic for TRBs and
event rings required by the Axiado AX3000/AX3005 UDC driver.

> diff --git a/drivers/usb/gadget/udc/crg/crg-udc-ring.c b/drivers/usb/gadg=
et/udc/crg/crg-udc-ring.c
> new file mode 100644
> index 0000000000000..f1de8893b790f
> --- /dev/null
> +++ b/drivers/usb/gadget/udc/crg/crg-udc-ring.c

[ ... ]

> +int crg_udc_process_event_ring(struct crg_gadget_dev *crg_udc, int index,
> +			       unsigned long *flags)
> +{
> +	struct crg_event_trb *event;
> +	struct crg_udc_event *udc_event;
> +	struct crg_uicr __iomem *uicr =3D crg_udc->uicr[index];
> +	u32 val;
> +	dma_addr_t erdp;
> +	int ret;
> +	u32 generation;
> +	unsigned int processed =3D 0;
> +
> +	if (!uicr)
> +		return -ENODEV;
> +
> +	val =3D readl(&uicr->iman);
> +	val |=3D CRG_U3DC_IMAN_INT_PEND;
> +	writel(val, &uicr->iman);
> +
> +	udc_event =3D &crg_udc->udc_event[index];
> +	generation =3D udc_event->generation;
> +	while (udc_event->evt_dq_pt) {
> +		event =3D (struct crg_event_trb *)udc_event->evt_dq_pt;
> +
> +		if (FIELD_GET(EVE_TRB_CYCLE_BIT_MASK,
> +			      le32_to_cpu(event->dw3)) !=3D udc_event->ccs)
> +			break;
> +		/* Read the payload only after observing device ownership. */
> +		dma_rmb();
> +
> +		ret =3D crg_udc_handle_event(crg_udc, event, flags);
> +		/* The giveback callback may release the lock and reset the ring. */
> +		if (unlikely(generation !=3D udc_event->generation))
> +			return 0;
> +		if (ret =3D=3D -ECONNRESET) {
> +			/* The disconnect path rebuilt and reprogrammed the ring. */
> +			return 0;
> +		}
> +		if (ret < 0)
> +			dev_dbg(crg_udc->dev, "failed to process event: %d\n",
> +				ret);
> +
> +		/* Consume malformed events so they cannot pin the ring head. */
> +		if (event =3D=3D udc_event->evt_seg0_last_trb) {
> +			udc_event->ccs =3D udc_event->ccs ? 0 : 1;
> +			udc_event->evt_dq_pt =3D udc_event->event_ring.cpu_addr;
> +		} else {
> +			udc_event->evt_dq_pt++;
> +		}
> +
> +		/*
> +		 * udc_event state is only re-read from crg_udc, never cached
> +		 * across this drop, so releasing and reacquiring the lock
> +		 * here is safe and lets other udc_lock users, and this CPU's
> +		 * other interrupts, make progress during a busy event ring.
> +		 */
> +		if (++processed % CRG_EVENT_RING_BATCH =3D=3D 0) {
> +			erdp =3D event_trb_virt_to_dma(udc_event,
> +						     udc_event->evt_dq_pt);
> +			if (!dma_mapping_error(crg_udc->dev, erdp)) {
> +				writel(upper_32_bits(erdp), &uicr->erdphi);
> +				writel(lower_32_bits(erdp) |
> +					       CRG_U3DC_ERDPLO_EHB,
> +				       &uicr->erdplo);
> +			}
> +			spin_unlock_irqrestore(&crg_udc->udc_lock, *flags);
> +			cond_resched();
> +			spin_lock_irqsave(&crg_udc->udc_lock, *flags);
> +			if (unlikely(generation !=3D udc_event->generation))
> +				return 0;
> +		}
> +	}

[Severity: High]
As reported by Sashiko on v3 [1], can crg_udc_process_event_ring() miss an
in-progress reset when crg_udc->udc_lock is dropped inside
crg_udc_handle_event() or across the cond_resched() batch boundary?

When crg_gadget_stop() -> crg_udc_reset() runs on another CPU while
crg_udc->udc_lock is released, it sets crg_udc->resetting =3D true, asserts
CRG_U3DC_CTRL_SWRST, and drops crg_udc->udc_lock while polling for SWRST to
clear and again during crg_udc_ep_nuke() -> crg_udc_req_done() givebacks.

Because udc_event->generation is only incremented later when
crg_udc_reset_data_struct() -> crg_udc_init_event_ring() runs (and is not
incremented at all if crg_udc_reset() times out),
crg_udc_process_event_ring() can re-acquire crg_udc->udc_lock during those
windows with generation =3D=3D udc_event->generation still true while
crg_udc->resetting is set.

Would this allow crg_udc_process_event_ring() to continue advancing
udc_event->evt_dq_pt, processing stale pre-reset events, and writing
uicr->erdphi and uicr->erdplo while the controller is mid-reset? Should the
post-lock checks in crg_udc_process_event_ring() also test
crg_udc->resetting, similar to crg_udc_queue_pending_trbs() and
crg_udc_handle_setup_pkt()?

[ ... ]

> +struct crg_transfer_trb *crg_udc_tran_trb_dma_to_virt(struct crg_udc_ep =
*udc_ep,
> +						    dma_addr_t address)
> +{
> +	dma_addr_t offset;
> +	struct crg_transfer_trb *trb_virt;
> +
> +	if (lower_32_bits(address) & 0xf)
> +		return NULL;
> +
> +	offset =3D address - udc_ep->tran_ring_info.dma_addr;
> +	if (unlikely(offset >=3D udc_ep->tran_ring_info.len))
> +		return NULL;
> +	offset =3D offset / sizeof(struct crg_transfer_trb);
> +	trb_virt =3D udc_ep->first_trb + offset;
> +	return trb_virt;
> +}
> +
> +dma_addr_t crg_udc_tran_trb_virt_to_dma(struct crg_udc_ep *udc_ep,
> +					struct crg_transfer_trb *trb)
> +{
> +	unsigned long offset;
> +	int trb_idx;
> +	dma_addr_t dma_addr =3D 0;
> +
> +	trb_idx =3D trb - udc_ep->first_trb;
> +	if (unlikely(trb_idx < 0))
> +		return DMA_MAPPING_ERROR;
> +
> +	offset =3D trb_idx * sizeof(*trb);
> +	if (unlikely(offset >=3D udc_ep->tran_ring_info.len))
> +		return DMA_MAPPING_ERROR;
> +	dma_addr =3D udc_ep->tran_ring_info.dma_addr + offset;
> +	return dma_addr;
> +}
> +
> +void crg_udc_update_dequeue_pt(struct crg_event_trb *event,
> +			       struct crg_udc_ep *udc_ep)
> +{
> +	u32 deq_pt_lo =3D le32_to_cpu(event->dw0);
> +	u32 deq_pt_hi =3D le32_to_cpu(event->dw1);
> +	u64 dq_pt_addr =3D (u64)deq_pt_lo | ((u64)deq_pt_hi << 32);
> +	struct crg_transfer_trb *deq_pt;
> +
> +	deq_pt =3D crg_udc_tran_trb_dma_to_virt(udc_ep, dq_pt_addr);
> +	if (!deq_pt)
> +		return;
> +	deq_pt++;
> +	if (deq_pt =3D=3D udc_ep->last_trb)
> +		deq_pt =3D udc_ep->first_trb;
> +
> +	if (FIELD_GET(TRB_TYPE_MASK, le32_to_cpu(deq_pt->dw3)) =3D=3D TRB_TYPE_=
LINK)
> +		deq_pt =3D udc_ep->first_trb;
> +
> +	udc_ep->deq_pt =3D deq_pt;
> +}

[Severity: High]
What happens in crg_udc_update_dequeue_pt() if the event TRB's DMA address
points to the Link TRB at udc_ep->last_trb (for example, on a
CMPL_CODE_TRB_ERR event)?

Because udc_ep->last_trb sits at &udc_ep->first_trb[ring_size - 1],
crg_udc_tran_trb_dma_to_virt() accepts its DMA address and returns
deq_pt =3D=3D udc_ep->last_trb.

Advancing deq_pt++ before checking against udc_ep->last_trb moves deq_pt to
udc_ep->last_trb + 1, which is one element past the end of the
udc_ep->tran_ring_info coherent DMA buffer.

Doesn't that cause the subsequent read of deq_pt->dw3 to access memory out =
of
bounds and potentially store udc_ep->last_trb + 1 into udc_ep->deq_pt, which
in turn causes crg_udc_room_on_ring() to hit its loop guard and treat the
entire ring as free?

> +
> +u32 crg_udc_trb_chunk_len(dma_addr_t dma, u64 remaining)
> +{
> +	u32 boundary =3D CRG_UDC_TRB_MAX_BUFFER_SIZE -
> +		       (lower_32_bits(dma) & (CRG_UDC_TRB_MAX_BUFFER_SIZE - 1));
> +
> +	return min_t(u64, remaining, boundary);
> +}
> +
> +u32 crg_udc_actual_before(struct crg_udc_ep *udc_ep,
> +			  struct crg_udc_request *udc_req,
> +			  struct crg_transfer_trb *pause)
> +{
> +	struct crg_transfer_trb *trb =3D udc_req->first_trb;
> +	u32 actual =3D 0;
> +	u32 guard =3D 0;
> +	u32 max_iter =3D udc_ep->tran_ring_info.len / sizeof(*trb);
> +
> +	if (!trb || !pause)
> +		return 0;
> +
> +	while (trb !=3D pause && trb !=3D udc_ep->enq_pt && guard++ < max_iter)=
 {
> +		u32 len;
> +
> +		if (FIELD_GET(TRB_TYPE_MASK, le32_to_cpu(trb->dw3)) =3D=3D
> +		    TRB_TYPE_LINK) {
> +			trb =3D udc_ep->first_trb;
> +			continue;
> +		}
> +		len =3D FIELD_GET(TRB_TRANSFER_LEN_MASK, le32_to_cpu(trb->dw2));
> +		actual +=3D len;
> +		trb++;
> +		if (trb =3D=3D udc_ep->last_trb)
> +			trb =3D udc_ep->first_trb;
> +	}
> +
> +	return min(actual, udc_req->usb_req.length);
> +}

[Severity: High]
In crg_udc_actual_before(), if crg_udc_ep_dequeue() stops an active endpoint
while a multi-TRB request wraps around the transfer ring and the hardware
dequeue pointer (pause) is at the Link TRB (udc_ep->last_trb), will this lo=
op
skip right past pause?

At the end of the iteration for udc_ep->last_trb - 1, trb++ reaches
udc_ep->last_trb and is immediately wrapped to udc_ep->first_trb before the
while (trb !=3D pause && ...) condition is evaluated:

	trb++;
	if (trb =3D=3D udc_ep->last_trb)
		trb =3D udc_ep->first_trb;

Because trb jumps from udc_ep->last_trb - 1 directly to udc_ep->first_trb, =
it
never compares equal to pause =3D=3D udc_ep->last_trb (and the TRB_TYPE_LINK
check at the top of the loop is also bypassed), causing
crg_udc_actual_before() to sum all remaining queued TRBs up to
udc_ep->enq_pt into udc_req->usb_req.actual.

[1] https://lore.kernel.org/r/20261020-axiado-ax3000-usb-device-controller-=
v3-3-3012ecfc0a93@axiado.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-axiado-ax3=
000-usb-device-controller-v4-0-c5267b36a777@axiado.com?part=3D3
