Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795528053;
	b=PqZGoHhJRuk62h7SGs7MV96sCVLRF/X/fTFVprOGL3aP7Tyw+blMZnq9iuBG/h1TDi7n
	 ETP0R7FD2zlYWmNyVKURLvDLIm5437XoYmvBfxqwXuKDh2fIBjK0PxTFF8HVGcWboV2Gg
	 nV6iO9Zsu1pjD203AK6hwMH0G3YQat63PxzNSJRelOloBa0E28Emv3XXkaa6/ZiGCASt8
	 BQ+2L9MVc9075P3YkjZ335o6icuH1fzORgkIHH+JsrpeYPsYRMwx+qgMkTfaD3IT4l0iV
	 Ih5NjFMB5fN020QS4uaausBS52b/TIMr25TJArhj0kBPPyU5GJGGbOozDWXUNetM30A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528053;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EMnEt/YnAUNP7311KM1zmr7mXqBixHq+OrglQzpPaq4=;
	b=ndrCe6pBC/fp8zsMEgGbHgfmaevbFb5Y8Licwj/l64nvq/rZ2gfRCj7nBTryHYmdwUh1
	 T+fZ+Iy8EkOQ/iTNh/ZglgO5jV5WIuiKGWqPE9sYOV6FxLfrYuXEHW8fBaWbwIymD0w0r
	 +t+kMKUE170PTHMKn5ZYqXaiikL82VP05nVzjNVC7T2Pyc7CKq5SWDfsTF4zLiJJR9r2u
	 5MKoqi/TEPpNxxGTjX977zeJp4ovcSWQ8XBpkWbje5PkVyCxDdbt0CEjZsS7Y9Pzo+v9P
	 Zgm6c9/32HSsoFq+hB1TDaYtrhLWe3jURJZ+gxwXRy3Oysueg/8RvDZ43JXCdyOODHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ajwd7hTL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5AB606A321;
	Tue, 24 Nov 2026 13:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ajwd7hTL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 468511F000C6;
	Tue, 24 Nov 2026 13:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795528052;
	bh=EMnEt/YnAUNP7311KM1zmr7mXqBixHq+OrglQzpPaq4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ajwd7hTLwPTvQo/xoc8b1EELOQM+ESusAdJskEbSdO4bLIMLyP0ya+yaNuYp1KQ9y
	 GLKMMRRDqhvgh+643DW0ynx9NY/pfAOMC5I4XZ5FazvBaskyYct2lcJ/locGitTpCa
	 OP7o4zqhX5pdYvZl1pKu21XdbgBjcecE4/87BfMuJY49DR+ljj7yw22eKmGa3TtraP
	 yVwxNys6VYUsLlWZ79L0QlOKxf0d5OunkDeCf142L4ULS1o4Sc5h37IHNs68GqS/fo
	 pufAj2Qben4oLPnzIgMTBYu7Ej4lS1xfHT8zHZ25daOh7xRXTR5397r1u+aHjZmAWe
	 ZTAgdEN7OOPqA==
Message-ID: <sashiko-outbox-231251@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/6] usb: gadget: udc: crg: Add gadget and endpoint
 operations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-axiado-ax3000-usb-device-controller-v6-5-b991f9b27111@axiado.com>
References: <20261124-axiado-ax3000-usb-device-controller-v6-0-b991f9b27111@axiado.com>
 <20261124-axiado-ax3000-usb-device-controller-v6-5-b991f9b27111@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 13:47:31 +0000
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
- [High] usb: gadget: crg: crg_udc_ep_dequeue() returns -ESHUTDOWN for
  queued requests
- [Medium] usb: gadget: crg: stale tran_ring_full after dequeue in
  crg_udc_skip_td()
- [Medium] usb: gadget: crg: useless chained IOC events in
  crg_udc_queue_trbs()
--

commit 940c56f180e03034ba3d28364b31f4362309e9df
Author: Petar Stepanovic <pstepanovic@axiado.com>

usb: gadget: udc: crg: Add gadget and endpoint operations

This commit implements the USB gadget and endpoint operations for the
Axiado AX3000/AX3005 UDC driver.

> diff --git a/drivers/usb/gadget/udc/crg/crg-udc-gadget.c b/drivers/usb/ga=
dget/udc/crg/crg-udc-gadget.c
> new file mode 100644
> index 0000000000000..8a730b5167d9b
> --- /dev/null
> +++ b/drivers/usb/gadget/udc/crg/crg-udc-gadget.c

[ ... ]

> +static int crg_udc_skip_td(struct crg_udc_ep *ep, struct crg_udc_request=
 *req)
> +{
> +	struct crg_transfer_trb *next =3D req->last_trb + 1;
> +	u8 cycle;
> +	int ret;
> +
> +	if (next =3D=3D ep->last_trb)
> +		next =3D ep->first_trb;
> +	cycle =3D next > ep->enq_pt ? ep->pcs ^ 1 : ep->pcs;
> +	ret =3D crg_udc_epcx_set_dqptr(ep, next, cycle);
> +	if (ret)
> +		return ret;
> +
> +	crg_udc_defer_trb_reuse(ep);
> +
> +	/* Earlier TDs may still have completion events to process. */
> +	if (list_is_first(&req->queue, &ep->queue))
> +		crg_udc_advance_dequeue_pt(ep);
> +	return 0;
> +}

[Severity: Medium]
Can crg_udc_skip_td() leave ep->tran_ring_full set to true after freeing
ring space?

If a transfer ring fills up and the endpoint is halted at High-Speed or
Full-Speed (where crg_udc_ep_halt() retains queued requests on the ring),
dequeuing the request at pause_pt runs crg_udc_skip_td().  Unlike
crg_udc_squeeze_xfer_ring(), crg_udc_skip_td() does not clear
ep->tran_ring_full, and crg_udc_ep_dequeue() skips
crg_udc_resume_paused_ep() because old_ep_state is EP_STATE_HALTED.  When
the endpoint is later unhalted in crg_udc_ep_halt(), it transitions to
EP_STATE_RUNNING without recomputing tran_ring_full via
crg_udc_retry_pending_trbs().  If no unscheduled requests remain in
ep->queue, tran_ring_full stays true and subsequent crg_udc_ep_queue()
calls enqueue requests without building TRBs or ringing the doorbell.

> +
> +static int crg_udc_ep_dequeue(struct usb_ep *_ep, struct usb_request *_r=
eq)
> +{
> +	struct crg_udc_ep *udc_ep_ptr;
> +	struct crg_gadget_dev *crg_udc;
> +	struct crg_uccr __iomem *uccr;
> +	struct crg_udc_request *udc_req =3D NULL;
> +	struct crg_udc_request *iter;
> +	struct crg_transfer_trb *pause_pt;
> +	enum crg_ep_state old_ep_state;
> +	u32 tmp;
> +	u8 dci, cycle;
> +	u32 generation;
> +	unsigned long flags;
> +	u32 event_generation;
> +	int ret;
> +
> +	if (!_ep || !_req)
> +		return -EINVAL;
> +
> +	udc_ep_ptr =3D container_of(_ep, struct crg_udc_ep, usb_ep);
> +	crg_udc =3D udc_ep_ptr->crg_udc;
> +	uccr =3D crg_udc->uccr;
> +	dci =3D udc_ep_ptr->dci;
> +
> +	spin_lock_irqsave(&crg_udc->udc_lock, flags);
> +	list_for_each_entry(iter, &udc_ep_ptr->queue, queue) {
> +		if (&iter->usb_req =3D=3D _req) {
> +			udc_req =3D iter;
> +			break;
> +		}
> +	}
> +
> +	if (!udc_req) {
> +		ret =3D -EINVAL;
> +		goto out;
> +	}
> +	if (crg_udc->shutting_down || crg_udc->suspended) {
> +		ret =3D -ESHUTDOWN;
> +		goto out;
> +	}
> +	if (crg_udc->resetting || crg_udc->controller_recovering ||
> +	    crg_udc->gadget_stopping || crg_udc->endpoint_recovery_pending ||
> +	    crg_udc->deferred_system_error ||
> +	    udc_ep_ptr->nuking || udc_ep_ptr->ep_state =3D=3D EP_STATE_DISABLED=
) {
> +		/* The pending teardown will give back this queued request. */
> +		ret =3D 0;
> +		goto out;
> +	}

[Severity: High]
Should crg_udc_ep_dequeue() return 0 instead of -ESHUTDOWN when
udc_req is still on udc_ep_ptr->queue during shutting_down or suspended?

In crg_udc_remove() and crg_udc_suspend(), shutting_down or suspended is
set before the endpoint queues are drained by crg_udc_ep_nuke().
Returning -ESHUTDOWN while leaving udc_req queued tells callers such as
u_audio's free_ep() that the request is no longer active, so they free
req->buf and call usb_ep_free_request(); crg_udc_free_request() then leaks
the still-queued request and the pending crg_udc_ep_nuke() ->
crg_udc_req_done() triggers a use-after-free when copying bounce buffers
into req->buf and invoking req->complete().

[ ... ]

> +	td_bytes =3D buffer_length - remaining;
> +	remaining =3D buffer_length;
> +	for (i =3D 0; i < count; i++) {
> +		u32 trb_len =3D plan[i].len;
> +		bool chain_bit =3D i !=3D count - 1;
> +		bool ioc =3D !chain_bit;
> +		bool short_pkt =3D usb_endpoint_dir_out(udc_ep_ptr->desc);
> +
> +		remaining -=3D trb_len;
> +		td_done +=3D trb_len;
> +		td_size =3D crg_udc_td_size(td_bytes, td_done,
> +					  udc_ep_ptr->usb_ep.maxpacket, !chain_bit);
> +		if (!full_td && j =3D=3D intr_rate) {
> +			ioc =3D true;
> +			j =3D 0;
> +		}

[Severity: Medium]
Why set ioc =3D true on intermediate chained TRBs when !full_td?

The last TRB of the truncated TD (i =3D=3D count - 1) already has
chain_bit =3D false and ioc =3D true.  In crg_udc_handle_xfer_event(),
CMPL_CODE_SUCCESS ignores completion events for TRBs with
TRB_CHAIN_BIT_MASK set, so these intermediate IOC events cannot queue the
remaining TRBs, while crg_udc_update_dequeue_pt() prematurely advances
udc_ep_ptr->deq_pt past udc_req_ptr->first_trb into the middle of the
still-active TD.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-axiado-ax3=
000-usb-device-controller-v6-0-b991f9b27111@axiado.com?part=3D5
