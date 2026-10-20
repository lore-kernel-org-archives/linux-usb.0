Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486737;
	b=AbZLmvo1gHtjT9JIGwKCntYMxhiKK8FxZ8tdN8EY2EIR+/MO6vldgz+6mkH10RdV6Qd9
	 +vT3aWe02y2gsmmZP5dpKhwvdPFP7OatWG0oC1lVjcxsGb7/+wzM2T9lL2FPGdFpfrR40
	 geXqOAmyrQqdqj43ZuJ1fOf95oI0RSm3MqM4U4frk/kBUGrw9N+RFGvjrVUo89tPgC7SG
	 rg4yW01PJzTvl82kC20Nm52/ShAVFd6fI17M7PekGsaFsV1yHvxHYrYCqyGK/ZlnpnF+m
	 mvWdkCGf1oMtB+k4QXYC3bQUPHRszjrFksUDqw2EU1f4Yc0NHbIfMXh7MxIK1U9Z4QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486737;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qIKVzhUuE/ITaFJcZhrFYW61C6fHKirRj1tOBFophxY=;
	b=hwl3e5CMQWgs4fzZJQvYiG0VY4TEfDyik3S/vc8ULHIVDLWY35GLcazlt5sETS6pmIzb
	 7z5YPakF8Dtbxke4vt8AnRz4KSQVeQgBOCiSWHDCMRt2W/PkHfg56WZlzh4h9Bzr/WMoV
	 yZTMuE2PGBhyqAVD2sWephNoiMrYHDyXJsRsy0xEXq/cI8nlibPjnvsf/0qa3++R5O14h
	 AgpNayN3z7owIsWN/sLQVXV1sUlk6nB1RSbAw7N/k23H7xMDNKdQhTrFIjOSsQwA1BI3x
	 IC30vgHfjk69lH+tZnzOiOHmSQSx1zFoHN4W0o3BV8LDZryrQnVxoeeD+W6KH/DNAQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iSx9N6FK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C49F606A335;
	Tue, 20 Oct 2026 08:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iSx9N6FK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E2261F000C5;
	Tue, 20 Oct 2026 08:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792486736;
	bh=qIKVzhUuE/ITaFJcZhrFYW61C6fHKirRj1tOBFophxY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iSx9N6FKYOc0TqbExyeIpnaLT4do7cBlrXje/4uKlpEFwo8NUBfKRwtB0MACyHMpQ
	 7Nd35P/RN5SGOL459otD3JWoiVXpjsTJcyNH1F06irmERwG9QvsLHqfUb0ihf844Fz
	 dxNVlmkKTRdVDZeOJXZVtCaxfufkXGZeCuZLFJ6xFbKok1Ic5+w0QxUxBfoNGpdTra
	 RgT3uq1WK9vGpiuEhcOld0v7MGCunGhHhNuGBw9NPApWi3QSaeZSjUJBzDjMztXMQP
	 hB3S2VrhcWCw99cHCoquV5GVYflFyI1GxC8zns+E6vcHwRiZKV46NF4DfO1Fa4/Nwc
	 wGyxrgaZmndtA==
Message-ID: <sashiko-outbox-178667@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/6] usb: gadget: udc: crg: Add ring and transfer
 management
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261020-axiado-ax3000-usb-device-controller-v3-3-3012ecfc0a93@axiado.com>
References: <20261020-axiado-ax3000-usb-device-controller-v3-0-3012ecfc0a93@axiado.com>
 <20261020-axiado-ax3000-usb-device-controller-v3-3-3012ecfc0a93@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 08:58:55 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] usb: gadget: crg: cycle bit corruption in crg_udc_squeeze_xfer_rin=
g()
- [High] usb: gadget: crg: premature loop break in crg_udc_queue_pending_tr=
bs()
- [High] usb: gadget: crg: unsafe queue iteration across crg_udc_req_done()=
 lock drop
- [High] usb: gadget: udc: crg: stale request state in crg_udc_squeeze_xfer=
_ring()
- [High] usb: gadget: crg: race updating evt_dq_pt after lock drop in crg_u=
dc_process_event_ring()
--

commit ac2a648308943ddb5f71e791a2ef85c73d0020b9
Author: Petar Stepanovic <pstepanovic@axiado.com>

usb: gadget: udc: crg: Add ring and transfer management

This patch adds the memory management and ring buffer logic for TRBs and
event rings used by the Axiado AX3000/AX3005 USB device controller.

> diff --git a/drivers/usb/gadget/udc/crg/crg-udc-ring.c b/drivers/usb/gadg=
et/udc/crg/crg-udc-ring.c
> new file mode 100644
> index 0000000000000..1c57dc1787d42
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

[Severity: High]
Can crg_udc_process_event_ring() corrupt udc_event->evt_dq_pt and
udc_event->ccs if the event ring is reinitialized while crg_udc->udc_lock
is dropped inside crg_udc_handle_event()?

Several paths inside crg_udc_handle_event() drop and re-acquire udc_lock
and then return 0 (for example, crg_udc_req_done() during transfer
completion, or crg_udc_handle_setup_pkt() during flush_work() and
driver->setup()).

If crg_gadget_stop() runs concurrently on another CPU during that lock
drop, it acquires udc_lock and calls:

crg_gadget_stop()
  crg_udc_reset_data_struct()
    crg_udc_init_event_ring()

which zeroes the event ring, resets udc_event->evt_dq_pt to
event_ring.cpu_addr, sets udc_event->ccs to 1, and programs uicr->erdplo
and uicr->erdphi to the start of the ring.

When crg_udc_handle_event() re-acquires udc_lock and returns 0,
crg_udc_process_event_ring() uses the stale pre-call event pointer to
advance udc_event->evt_dq_pt to index 1 (or, if event was
evt_seg0_last_trb, toggles udc_event->ccs from 1 to 0, causing the
subsequent loop iterations to treat all zeroed TRBs in the freshly cleared
ring as valid events).

[ ... ]

> +int crg_udc_queue_pending_trbs(struct crg_udc_ep *udc_ep_ptr)
> +{
> +	struct crg_udc_request *udc_req_ptr, *tmp;
> +	int ret;
> +
> +	list_for_each_entry_safe(udc_req_ptr, tmp, &udc_ep_ptr->queue, queue) {
> +		if (udc_req_ptr->all_trbs_queued)
> +			continue;
> +
> +		ret =3D crg_udc_build_td(udc_ep_ptr, udc_req_ptr);
> +		if (ret =3D=3D -ENOSPC || ret =3D=3D -EBUSY) {
> +			/*
> +			 * Ring is full; leave this request queued and retry
> +			 * it (and anything behind it) on the next TRB
> +			 * completion via crg_udc_queue_pending_trbs().
> +			 */
> +			return ret;
> +		} else if (ret) {
> +			/*
> +			 * A non-capacity failure is not transient: fail this
> +			 * request instead of leaving it stuck forever, and
> +			 * keep rebuilding the rest of the queue.
> +			 */
> +			dev_err(udc_ep_ptr->crg_udc->dev,
> +				"failed to build pending transfer: %d\n", ret);
> +			list_del_init(&udc_req_ptr->queue);
> +			crg_udc_req_done(udc_ep_ptr, udc_req_ptr, ret);
> +			continue;
> +		}

[Severity: High]
Is it safe to continue list_for_each_entry_safe() after calling
crg_udc_req_done() here (and in crg_udc_squeeze_xfer_ring() below)?

As documented on crg_udc_req_done() in crg-udc.h, crg_udc_req_done() drops
crg_udc->udc_lock around usb_gadget_giveback_request() and re-acquires it
before returning.

While udc_lock is dropped, the completion callback or another CPU (via
crg_udc_ep_dequeue(), crg_udc_ep_disable(), or crg_udc_ep_nuke()) can
unlink via list_del_init() and free the pre-fetched tmp request. Resuming
iteration with the cached tmp pointer can then trigger a use-after-free or
spin forever if tmp->queue was reinitialized with list_del_init().

> +		break;
> +	}

[Severity: High]
Should this unconditional break instead check udc_ep_ptr->tran_ring_full
like crg_udc_squeeze_xfer_ring() does?

With an unconditional break after the first crg_udc_build_td() succeeds,
crg_udc_queue_pending_trbs() schedules at most one pending request per
call even when space remains on the transfer ring. If multiple requests
were queued while the ring was full and the first rebuilt request has
usb_req.no_interrupt set, no completion interrupt will fire and the
remaining pending requests in udc_ep_ptr->queue will stall.

[ ... ]

> +void crg_udc_setup_link_trb(struct crg_transfer_trb *link_trb, bool togg=
le,
> +			    dma_addr_t next_trb)
> +{
> +	u32 dw =3D 0;
> +
> +	link_trb->dw0 =3D cpu_to_le32(lower_32_bits(next_trb));
> +	link_trb->dw1 =3D cpu_to_le32(upper_32_bits(next_trb));
> +	link_trb->dw2 =3D cpu_to_le32(0);
> +
> +	FIELD_MODIFY(TRB_TYPE_MASK, &dw, TRB_TYPE_LINK);
> +	if (toggle)
> +		FIELD_MODIFY(TRB_LINK_TOGGLE_CYCLE_MASK, &dw, 1);
> +	else
> +		FIELD_MODIFY(TRB_LINK_TOGGLE_CYCLE_MASK, &dw, 0);
> +
> +	/* Publish ownership only after the link address is visible. */
> +	dma_wmb();
> +	link_trb->dw3 =3D cpu_to_le32(dw);
> +}

[ ... ]

> +void crg_udc_squeeze_xfer_ring(struct crg_udc_ep *udc_ep_ptr,
> +			       struct crg_udc_request *udc_req_ptr)
> +{
> +	struct crg_transfer_trb *trb =3D udc_req_ptr->first_trb;
> +	struct crg_udc_request *next_req, *tmp;
> +	u8 new_pcs;
> +
> +	if (!trb)
> +		return;
> +
> +	/* The canceled request becomes the new enqueue point. Its original
> +	 * cycle bit is the cycle expected at that point after the tail is
> +	 * removed.
> +	 */
> +	new_pcs =3D FIELD_GET(TRB_CYCLE_BIT_MASK, le32_to_cpu(trb->dw3));
> +
> +	while (trb !=3D udc_ep_ptr->enq_pt) {
> +		memset(trb, 0, sizeof(*trb));
> +		trb++;
> +		if (trb =3D=3D udc_ep_ptr->last_trb)
> +			trb =3D udc_ep_ptr->first_trb;
> +	}
> +
> +	udc_ep_ptr->enq_pt =3D udc_req_ptr->first_trb;
> +	udc_ep_ptr->pcs =3D new_pcs;
> +	udc_ep_ptr->tran_ring_full =3D false;
> +	crg_udc_setup_link_trb(udc_ep_ptr->last_trb, true,
> +			udc_ep_ptr->tran_ring_info.dma_addr);
> +	dma_wmb();

[Severity: High]
Does zeroing the TRBs and unconditionally resetting udc_ep_ptr->last_trb
corrupt the transfer ring cycle state when new_pcs is 0 or when an active
request wraps the ring?

Because the link TRB toggles the cycle state on each ring wrap, the
expected producer/consumer cycle state alternates between 1 and 0.

First, memset(trb, 0, sizeof(*trb)) clears TRB_CYCLE_BIT_MASK to 0 and
TRB_TYPE_MASK to 0 (TRB_TYPE_RSVD). On a ring pass where new_pcs =3D=3D 0 (=
or
if the cleared range wraps past last_trb into a pcs =3D=3D 0 pass), a cycle
bit of 0 marks the cleared slots as hardware-owned rather than unowned.
If udc_req_ptr was the last queued request (or rebuilt requests consume
fewer TRBs than were wiped), the TRB at the rewound udc_ep_ptr->enq_pt will
have cycle bit 0 =3D=3D udc_ep_ptr->pcs and type TRB_TYPE_RSVD, allowing the
controller to fetch a zeroed TRB instead of stopping at enq_pt.

Second, crg_udc_setup_link_trb() always writes dw3 with cycle bit 0 and
chain bit 0. Calling it unconditionally on udc_ep_ptr->last_trb will
overwrite last_trb's cycle bit and chain bit even if an earlier,
still-active request ahead of udc_req_ptr in udc_ep_ptr->queue wrapped
across last_trb during a pcs =3D=3D 1 pass, invalidating the link TRB before
hardware consumes it.

> +	if (list_is_last(&udc_req_ptr->queue, &udc_ep_ptr->queue))
> +		return;
> +
> +	next_req =3D udc_req_ptr;
> +	list_for_each_entry_safe_continue(next_req, tmp, &udc_ep_ptr->queue,
> +					  queue) {
> +		int ret;
> +
> +		next_req->usb_req.status =3D -EINPROGRESS;
> +		next_req->usb_req.actual =3D 0;
> +		crg_udc_clear_req_container(next_req);
> +		ret =3D crg_udc_build_td(udc_ep_ptr, next_req);
> +		if (ret =3D=3D -ENOSPC) {
> +			/* Ring is full; a later TRB completion will retry
> +			 * this and any remaining requests via
> +			 * crg_udc_queue_pending_trbs().
> +			 */
> +			udc_ep_ptr->tran_ring_full =3D true;
> +			break;
> +		} else if (ret) {
> +			/*
> +			 * A non-capacity failure is not transient: fail this
> +			 * request instead of leaving it stuck forever, and
> +			 * keep rebuilding the rest of the queue.
> +			 */
> +			dev_err(udc_ep_ptr->crg_udc->dev,
> +				"failed to rebuild queued request: %d\n", ret);
> +			crg_udc_req_done(udc_ep_ptr, next_req, ret);
> +			continue;
> +		}
> +		if (udc_ep_ptr->tran_ring_full)
> +			break;
> +	}
> +}

[Severity: High]
What happens to the remaining requests in udc_ep_ptr->queue if this loop
breaks out early when the ring fills up?

The while (trb !=3D udc_ep_ptr->enq_pt) loop above already wiped the hardwa=
re
TRBs for all requests after udc_req_ptr, but crg_udc_clear_req_container()
is only called inside list_for_each_entry_safe_continue() right before each
crg_udc_build_td() call.

If an earlier request fills the ring and hits either break, any subsequent
requests in udc_ep_ptr->queue that previously had TRBs queued are left with
all_trbs_queued =3D=3D true, buff_len_left =3D=3D 0, and stale first_trb/la=
st_trb
pointers. When a later TRB completion runs crg_udc_queue_pending_trbs(), it
checks:

	if (udc_req_ptr->all_trbs_queued)
		continue;

and skips those requests permanently.

Also, for isochronous endpoints, crg_udc_build_td() -> crg_udc_queue_trbs()
returns -EBUSY when the ring lacks space. Unlike crg_udc_queue_pending_trbs=
()
which checks for both -ENOSPC and -EBUSY, this check only tests for
ret =3D=3D -ENOSPC, so -EBUSY falls into the error branch and fails the req=
uest
via crg_udc_req_done().

[ ... ]

=E5=AE=8C=E7=BE=8E

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-axiado-ax3=
000-usb-device-controller-v3-0-3012ecfc0a93@axiado.com?part=3D3
