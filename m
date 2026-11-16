Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862069;
	b=Kzx+vSsC0JX1PkkHLsq9HouDFM/QPEF3iuh3MrlY7mHDWyZ0wqvpJwdOXAAUybkyOt3+
	 RHCx13WKDK3U7D/ZxUVTaqVCNv9UKxQ4L65WI/ldWy1Qswb5Ajy9fGapo8Qt6En0suyHJ
	 u+EicbngFyWMF+WCGXi217yvz6JIak4loeVUVo405sDxjos6eVI0bB8t0YcT91Hw23iQ0
	 4GPKSRwjkvHceroB36ehHmSV9R0+p16nT3WVuQjZZG2aqvIfy/iTzT6e4fgOxDp7yJWBQ
	 KmpYxTvjdeEL9835w9ZRa201rGK3QiaySC+T7SF8IKun1gxp2DJAQOcS3YO6cXJxz6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862069;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KzAiNNNZWkPvhsY/VDDzZumTdRJxDnYqHWzC0/PtNTc=;
	b=yiAZgXwWhK8WE6YrKxVOTQ0xFLdBZu9h8hfQ+yEvW/KVYkvQYz1GrrtceZVzPuk7vxpI
	 8swxG+HRy3KUfi6ye8YtS1QoygImkfD4PhBcmo6MaYQi1jbAgdlX9tx/kvP8kV47qK4ET
	 1kT+E64M7PwVWWaUokNGPvrjzWw/9hFmojALK6uxF8sTV8lb0BnDkrMF4xVW9tj89z6VW
	 puIioI6uC8TpqjWs5C7jQwrz2n7qYRhVcd1+9GLCNYFFiYHX8/PqUKiI/53MAYtXF9IJD
	 eDKJKkyySafllZ/NI7Tk/R32ZPlSiGOQvIe0bWCxszCcoo4n4lvZ+ZOZB3kPJ1C1FiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PjzdfrYg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AAB606A322;
	Mon, 16 Nov 2026 20:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PjzdfrYg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 024681F000C4;
	Mon, 16 Nov 2026 20:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794862069;
	bh=KzAiNNNZWkPvhsY/VDDzZumTdRJxDnYqHWzC0/PtNTc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PjzdfrYgfIe+H4Lu5wLDY65/pdRpjtPvUnyrbDrfjuzJW0I/NYDMhKqER9M7M65aI
	 m+xATfcUPtuAfVLF5Z9hF5DS/HUI8tYoNOJ+FJ1VrK/4C+OdTcbivhNc1XPPDM0iYp
	 Si2Ro/2XYdNZpahB9nL8O+yi3lwkooeniheGOY40A6Q0NugFfVxUqMg1VfHXlYWVg1
	 5L9lqYyyy1jeM6XP8KFNr0g4hFGA5gh3ZnN8SnHiH/XKLKEGlPuJAEJPaisZLcFJz9
	 rFhpAjC3yYy1c9FnHVIUEQj9Vbq9LhuWPK3WLWkwHtYY9chUr+09FrPOmL/OO/h2sH
	 s9WYHPvxYH7WA==
Message-ID: <sashiko-outbox-217676@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/6] usb: gadget: udc: crg: Add gadget and endpoint
 operations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-axiado-ax3000-usb-device-controller-v5-5-49271ed5c793@axiado.com>
References: <20261116-axiado-ax3000-usb-device-controller-v5-0-49271ed5c793@axiado.com>
 <20261116-axiado-ax3000-usb-device-controller-v5-5-49271ed5c793@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 20:47:48 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 10 potential
issues to consider:
- [High] usb: gadget: crg: stale deq_pt in crg_udc_ep_dequeue() when
  pause_pt passed TD
- [High] usb: gadget: crg: stuck USB_STATE_RECONNECTING in worker
  port-status paths
- [High] usb: gadget: crg: isoc endpoints wedged in EP_STATE_STOPPED on
  xfer error
- [Medium] usb: gadget: crg: broken EP0 USB_ENDPOINT_HALT handling in
  crg_udc_ep_halt()
- [Medium] usb: gadget: crg: request rejected on ring-full in
  crg_udc_ep_queue()
- [Medium] usb: gadget: crg: premature USB_STATE_ADDRESS in
  crg_udc_ep_disable()
- [Medium] usb: gadget: udc: crg: lost port reset poll in
  crg_udc_port_retry_work()
- [Medium] usb: gadget: udc: crg: controller reset on nested
  crg_udc_ep_dequeue()
- [Medium] usb: gadget: udc: crg: dequeue pointer rewind in
  crg_udc_ep_halt()
- [Low] usb: gadget: crg: incomplete cleanup in crg_udc_ep_disable()
  when disabled
--

commit 4ce545406bad41a031bcbc10a89cb66370b3d324
Author: Petar Stepanovic <pstepanovic@axiado.com>

usb: gadget: udc: crg: Add gadget and endpoint operations

This commit adds the USB gadget and endpoint operations, transfer ring
management, port status handling, and error recovery for the Axiado
AX3000/AX3005 UDC driver.

> diff --git a/drivers/usb/gadget/udc/crg/crg-udc-gadget.c b/drivers/usb/ga=
dget/udc/crg-udc-gadget.c
> new file mode 100644
> index 0000000000000..dddfc5cf3d3ec
> --- /dev/null
> +++ b/drivers/usb/gadget/udc/crg/crg-udc-gadget.c

[ ... ]

> +static int crg_udc_ep_dequeue(struct usb_ep *_ep, struct usb_request *_r=
eq)
> +{

[ ... ]

> +	/* A stopped ring may still contain published requests. */
> +	if (old_ep_state =3D=3D EP_STATE_STOPPED) {
> +		ret =3D -EBUSY;
> +		goto recover;
> +	}
> +
> +	if (old_ep_state =3D=3D EP_STATE_RUNNING) {
> +		ret =3D crg_udc_issue_command(crg_udc, CRG_CMD_STOP_EP,
> +						BIT(dci), 0);
> +
> +		if (ret)
> +			goto recover;
> +		ret =3D readl_poll_timeout_atomic(&uccr->ep_running, tmp,
> +					       !(tmp & BIT(dci)), 10, 10000);
> +		if (ret)
> +			goto recover;
> +		udc_ep_ptr->ep_state =3D EP_STATE_STOPPED;
> +		udc_ep_ptr->dequeue_paused =3D true;
> +	}

[Severity: Medium]
Does a nested or concurrent crg_udc_ep_dequeue() trigger a full controller
recovery reset when a second request with live TRBs is dequeued during
giveback?

crg_udc_ep_dequeue(ep, req1)
  ep->ep_state =3D EP_STATE_STOPPED
  ep->dequeue_paused =3D true
  crg_udc_req_done(ep, req1, -ECONNRESET)
    spin_unlock(&crg_udc->udc_lock)
    usb_gadget_giveback_request()
      req1->complete()
        usb_ep_dequeue(ep, req2)
          crg_udc_ep_dequeue(ep, req2)
            old_ep_state =3D=3D EP_STATE_STOPPED
            goto recover  <-- schedules controller reset

When req2 already has first_trb set on the stopped ring, the inner
crg_udc_ep_dequeue() sees old_ep_state =3D=3D EP_STATE_STOPPED without chec=
king
udc_ep_ptr->dequeue_paused, marks halt_failed =3D true, and schedules a full
controller reset that drops the USB connection.

> +	p_ep_cx =3D &crg_udc->p_epcx[dci - 2];
> +	deq_pt_lo =3D le32_to_cpu(p_ep_cx->dw2) & EP_CX_TR_DQPT_LO_MASK;
> +	deq_pt_hi =3D le32_to_cpu(p_ep_cx->dw3);
> +	dq_pt_addr =3D (u64)deq_pt_lo | ((u64)deq_pt_hi << 32);
> +	pause_pt =3D crg_udc_tran_trb_dma_to_virt(udc_ep_ptr, dq_pt_addr);
> +	if (!pause_pt) {
> +		ret =3D -EIO;
> +		goto recover;
> +	}
> +
> +	if (crg_udc_is_pointer_less_than(pause_pt, udc_req->first_trb,
> +					 udc_ep_ptr)) {
> +		crg_udc_squeeze_xfer_ring(udc_ep_ptr, udc_req);
> +		/* Give back the cancelled request BEFORE scheduling the tail:
> +		 * its callback may add/remove requests, and dropping udc_lock
> +		 * while traversing the old list is unsafe.
> +		 */
> +		crg_udc_req_done(udc_ep_ptr, udc_req, -ECONNRESET);
> +	} else if (udc_req->last_trb &&
> +		   crg_udc_is_pointer_less_than(udc_req->last_trb, pause_pt,
> +						udc_ep_ptr)) {
> +		crg_udc_req_done(udc_ep_ptr, udc_req, -ECONNRESET);
> +	} else {

[Severity: High]
Does the else-if branch leave udc_ep_ptr->deq_pt stuck at udc_req->first_trb
when pause_pt has already advanced past udc_req->last_trb?

When hardware has consumed the TD's TRBs and its Transfer Event is still
pending on the event ring, crg_udc_req_done() unlinks udc_req from
udc_ep_ptr->queue and unmaps udc_req->bounce with usb_req.actual still 0
(discarding received OUT data).  When crg_udc_handle_xfer_event() later
processes the pending event, is_request_dequeued() sees that udc_req is no
longer on the queue and returns before calling crg_udc_update_dequeue_pt().
That leaks the request's TRB slots in crg_udc_room_on_ring(), and if the
endpoint is later halted and unhalted at High or Full Speed,
crg_udc_ep_halt() calls crg_udc_epcx_update_dqptr() and reprograms the
hardware dequeue pointer back to the unmapped TRBs.

[ ... ]

> +static int crg_udc_ep_disable(struct usb_ep *ep)
> +{

[ ... ]

> +	if (udc_ep->ep_state =3D=3D EP_STATE_DISABLED) {
> +		/*
> +		 * A reset can mark this endpoint disabled before reaching its
> +		 * queue. A callback from another endpoint may disable it now.
> +		 * Give back its requests before returning success.
> +		 */
> +		crg_udc_ep_nuke(udc_ep, -ESHUTDOWN);
> +		udc_ep->desc =3D NULL;
> +		udc_ep->comp_desc =3D NULL;
> +		udc_ep->usb_ep.enabled =3D false;
> +		ret =3D 0;
> +		goto out;
> +	}

[Severity: Low]
Should this path clear udc_ep->desc, udc_ep->comp_desc, and
crg_udc->p_epcx[udc_ep->dci - 2] before calling crg_udc_ep_nuke()?

When crg_udc_reinit() disables endpoints for a bus reset with notify_reset
set, it preserves desc, comp_desc, usb_ep.enabled, and p_epcx for the
gadget's usb_ep_disable() call.  Taking this early branch leaves p_epcx
unzeroed (since crg_udc_reset_work() skips endpoints once usb_ep.enabled is
false) and exposes non-NULL descriptors while crg_udc_ep_nuke() drops
udc_lock for request givebacks.

[ ... ]

> +	if (!crg_udc->num_enabled_eps &&
> +	    crg_udc->device_state =3D=3D USB_STATE_CONFIGURED)
> +		crg_udc->device_state =3D USB_STATE_ADDRESS;

[Severity: Medium]
Should disabling the last non-EP0 endpoint downgrade crg_udc->device_state
to USB_STATE_ADDRESS when the USB configuration is still active?

If a configured gadget disables all data endpoints (for example, when
switching an interface to alternate setting 0), the device is still in the
Configured state until SET_CONFIGURATION(0) or a bus reset occurs.
Setting USB_STATE_ADDRESS here causes getstatusrequest() and
setfeaturesrequest() to stall valid Configured-state control requests, and
causes crg_udc_handle_port_status() to see was_configured =3D=3D false on a
subsequent bus reset and skip usb_gadget_udc_reset().

[ ... ]

> +static int crg_udc_ep_queue(struct usb_ep *_ep, struct usb_request *_req,
> +			    gfp_t gfp_flags)
> +{

[ ... ]

> +	if (udc_ep_ptr->ep_state !=3D EP_STATE_RUNNING) {
> +		status =3D 0;
> +	} else if (!list_empty(&udc_ep_ptr->queue)) {
> +		struct crg_udc_request *tail;
> +
> +		tail =3D list_last_entry(&udc_ep_ptr->queue,
> +				       struct crg_udc_request, queue);
> +		status =3D (!tail->all_trbs_queued ||
> +			  udc_ep_ptr->tran_ring_full) ? 0 :
> +			 crg_udc_build_td(udc_ep_ptr, udc_req_ptr);
> +	} else if (udc_ep_ptr->tran_ring_full) {
> +		status =3D 0;
> +	} else {
> +		status =3D crg_udc_build_td(udc_ep_ptr, udc_req_ptr);
> +	}
> +
> +	if (!status) {
> +		list_add_tail(&udc_req_ptr->queue, &udc_ep_ptr->queue);
> +		goto out_locked;
> +	}
> +	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +
> +unmap:
> +	crg_udc_unmap_request(udc_ep_ptr, udc_req_ptr, 0);

[Severity: Medium]
When crg_udc_build_td() returns -EBUSY or -ENOSPC, should crg_udc_ep_queue()
set tran_ring_full =3D true and keep the request on udc_ep_ptr->queue inste=
ad
of unmapping and failing it?

On an isochronous endpoint with fewer free ring slots than td_trbs,
crg_udc_queue_trbs() returns -EBUSY without setting tran_ring_full.
Similarly, crg_udc_ep_dequeue() clears tran_ring_full =3D false before call=
ing
crg_udc_queue_pending_trbs(), which returns 0 without calling
crg_udc_build_td() if all queued requests already have all_trbs_queued or
td_pending set; the next crg_udc_ep_queue() call on that full ring then
invokes crg_udc_build_td() and fails with -ENOSPC.  All other callers of
crg_udc_build_td() treat -ENOSPC and -EBUSY as ring-full conditions that
defer the request.

[ ... ]

> +void crg_udc_port_retry_work(struct work_struct *work)
> +{
> +	struct crg_gadget_dev *crg_udc =3D
> +		container_of(to_delayed_work(work), struct crg_gadget_dev,
> +			     port_retry_work);
> +	unsigned long flags;
> +	int ret;
> +
> +	spin_lock_irqsave(&crg_udc->udc_lock, flags);
> +	if (!crg_udc->port_reset_pending && !crg_udc->deferred_port_events)
> +		goto out;
> +	if (crg_udc->resetting || crg_udc->suspended ||
> +	    crg_udc->shutting_down || !crg_udc->pullup_on ||
> +	    !crg_udc->gadget_driver || !crg_udc->async_callbacks)
> +		goto out;
> +	/* Reset work replays deferred events after the callback. A controller
> +	 * reconstruction is different: retry once its register state is stable.
> +	 */
> +	if (crg_udc->controller_recovering) {
> +		mod_delayed_work(system_wq, &crg_udc->port_retry_work,
> +				 msecs_to_jiffies(CRG_PORT_RESET_RETRY_MS));
> +		goto out;
> +	}
> +	if (crg_udc->port_reset_pending &&
> +	    crg_udc->port_reset_retry_count++ >=3D CRG_PORT_RESET_MAX_RETRIES) {
> +		bool notify_reset =3D crg_udc->device_state =3D=3D USB_STATE_CONFIGURE=
D;
> +
> +		dev_err(crg_udc->dev,
> +			"port reset did not become ready; resetting controller\n");
> +		ret =3D crg_udc_recover_port_failure(crg_udc, &flags,
> +						   notify_reset);
> +		if (ret !=3D -ECONNRESET)
> +			dev_err(crg_udc->dev,
> +				"port-reset recovery returned %d\n", ret);
> +		goto out;
> +	}
> +	ret =3D crg_udc_handle_port_status(crg_udc, &flags);
> +	if (ret && ret !=3D -ECONNRESET)
> +		dev_dbg(crg_udc->dev, "port reset poll: %d\n", ret);
> +out:
> +	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +}

[Severity: Medium]
Can a port reset poll be permanently lost if crg_udc_port_retry_work() runs
while crg_udc->reset_callback_active is true?

kworker (udc_reset_work)          kworker (port_retry_work)
crg_udc_reset_work()
  reset_callback_active =3D true
  spin_unlock(&udc_lock)
  usb_gadget_udc_reset()
                                  crg_udc_port_retry_work()
                                    crg_udc_handle_port_status()
                                      portsc_val & W1C_MASK =3D=3D 0
                                      if (reset_callback_active)
                                        deferred_port_events |=3D 0
                                        return 0
  spin_lock(&udc_lock)
  reset_callback_active =3D false
  if (deferred_port_events)  <-- false; port_reset_pending stays true

Because CRG_U3DC_PORTSC_PRC was already W1C-cleared when port_reset_pending
was first set, crg_udc_handle_port_status() sees no new W1C bits during
reset_callback_active and returns early without rescheduling
port_retry_work.  crg_udc_reset_work() then only checks
deferred_port_events, leaving port_reset_pending stuck true and blocking EP0
setup handling, endpoint enablement, and request queueing.  In addition, if
port_reset_retry_count reaches CRG_PORT_RESET_MAX_RETRIES while
reset_callback_active is true, crg_udc_port_retry_work() runs
crg_udc_recover_port_failure() concurrently with usb_gadget_udc_reset().

[ ... ]

> +int crg_udc_handle_port_status(struct crg_gadget_dev *crg_udc,
> +			       unsigned long *flags)
> +{

[ ... ]

> +			if (crg_udc->device_state >=3D USB_STATE_DEFAULT) {

[ ... ]

> +				reinit_ret =3D crg_udc_reinit(crg_udc, notify_reset);

[ ... ]

> +			}
> +
> +			crg_udc->gadget.speed =3D speed;
> +
> +			ret =3D crg_udc_update_ep0_maxpacketsize(crg_udc);
> +			if (ret) {
> +				dev_err(crg_udc->dev,
> +					"failed to configure EP0 maxpacket: %d\n", ret);
> +				return crg_udc_recover_port_failure(
> +					crg_udc, flags,
> +					crg_udc->bus_reset_pending ||
> +					crg_udc->device_state =3D=3D USB_STATE_CONFIGURED);
> +			}
> +
> +			crg_udc->connected =3D 1;
> +
> +			if (crg_udc->device_state < USB_STATE_RECONNECTING)
> +				crg_udc_enable_setup(crg_udc);
> +		}
> +	}

[Severity: High]
Does crg_udc->device_state remain stuck in USB_STATE_RECONNECTING when a
port reset completes via crg_udc_port_retry_work() or crg_udc_reset_work(),
or after a link drop with VBUS present?

When device_state >=3D USB_STATE_DEFAULT, crg_udc_reinit() sets device_state
to USB_STATE_RECONNECTING, so crg_udc_handle_port_status() skips
crg_udc_enable_setup() expecting the caller to drain the event ring and call
crg_udc_prepare_for_setup().  Neither crg_udc_port_retry_work() nor
crg_udc_reset_work() calls crg_udc_prepare_for_setup() after
crg_udc_handle_port_status(), and the link-drop path (cable_connected &&
!ccs_drop_ignore) also calls crg_udc_reinit() with connected =3D 0 so a lat=
er
CSC/PEC/PPC reconnect skips crg_udc_enable_setup() as well.

Also, while port_reset_pending is true before crg_udc_reinit() runs,
device_state is not yet USB_STATE_RECONNECTING; if a new SETUP event arrives
before port_retry_work polls PED, crg_udc_handle_event() dispatches it to
crg_udc_handle_setup_pkt(), which sets ep0_state =3D EP0_STATE_ABORTING and
returns early on port_reset_pending, dropping the SETUP packet and wedging
EP0.

[ ... ]

> +int crg_udc_ep_halt(struct crg_udc_ep *udc_ep_ptr, int halt, int ignore_=
wedge,
> +		    unsigned long *flags)
> +{

[ ... ]

> +	if (udc_ep_ptr->dci =3D=3D 0) {
> +		/* EP0 stalls with a STATUS-stage TRB, not SET_HALT. */
> +		if (!halt)
> +			return -EOPNOTSUPP;
> +
> +		return crg_udc_set_ep0_halt(crg_udc);
> +	}

[Severity: Medium]
Does this break USB_REQ_SET_FEATURE and USB_REQ_CLEAR_FEATURE(ENDPOINT_HALT)
targeting EP0 in setfeaturesrequest()?

drivers/usb/gadget/udc/crg/crg-udc-ep0.c:setfeaturesrequest() {
    ...
		udc_ep_ptr =3D &crg_udc->udc_ep[dci];
		status =3D crg_udc_ep_halt(
			udc_ep_ptr, (b_request =3D=3D USB_REQ_SET_FEATURE) ? 1 : 0,
			0, flags);

		if (status < 0)
			goto set_feature_error;
    ...
	crg_udc->setup_status =3D STATUS_STAGE_XFER;
	crg_udc_submit_ep0_status(crg_udc, status, 0);
}

On CLEAR_FEATURE(USB_ENDPOINT_HALT) for EP0, returning -EOPNOTSUPP causes
setfeaturesrequest() to stall EP0 instead of completing the status stage.
On SET_FEATURE(USB_ENDPOINT_HALT) for EP0, crg_udc_set_ep0_halt() queues a
STALL status TRB using crg_udc->status_req, sets ep_state =3D EP_STATE_HALT=
ED,
and returns 0; setfeaturesrequest() then calls crg_udc_submit_ep0_status() a
second time, which fails on the halted endpoint and sets ep0_state =3D
EP0_STATE_ERROR so crg_udc_handle_xfer_event() ignores the STALL completion.

[ ... ]

> +		if (recovering || crg_udc->gadget.speed >=3D USB_SPEED_SUPER) {
> +			udc_ep_ptr->deq_pt =3D udc_ep_ptr->enq_pt;
> +			udc_ep_ptr->tran_ring_full =3D false;
> +		}
> +		udc_ep_ptr->ep_state =3D EP_STATE_HALTED;
> +		/*
> +		 * A failed stop retained old DMA mappings even at HS/FS.
> +		 * After a confirmed retry, all those requests can be given back.
> +		 */
> +		if (recovering || crg_udc->gadget.speed >=3D USB_SPEED_SUPER)
> +			crg_udc_ep_nuke(udc_ep_ptr, -ECONNRESET);
> +	} else if (do_halt =3D=3D 0) {
> +		/* clearing ep halt state */
> +		/* reset sequence number */
> +		if (crg_udc_issue_command(crg_udc, CRG_CMD_RESET_SEQNUM, param0,
> +					  0))
> +			return -EIO;
> +
> +		if (!reset_seq_only) {
> +			/* Clear halt for a halted EP. */
> +			/* NOTE: we must CLEAR_HALT first,
> +			 * then SET_TR_DQPTR
> +			 */
> +			ret =3D crg_udc_issue_command(crg_udc,
> +						    CRG_CMD_CLEAR_HALT, param0, 0);
> +			if (ret)
> +				goto clear_halt_failed;
> +			ret =3D crg_udc_epcx_update_dqptr(udc_ep_ptr);
> +			if (ret)
> +				goto clear_halt_failed;
> +		}

[Severity: Medium]
Can clearing a halt at High or Full Speed rewind the hardware dequeue
pointer to the start of a partially completed multi-TRB request?

Chained TRBs before the final TRB of a TD have ioc =3D false, so hardware
advances TR_DQPT in p_epcx as each TRB completes while udc_ep_ptr->deq_pt
remains at first_trb.  At High or Full Speed, halting the endpoint retains
the in-flight request without updating udc_ep_ptr->deq_pt, and clearing the
halt then calls crg_udc_epcx_update_dqptr(), overwriting the hardware
dequeue pointer with udc_ep_ptr->deq_pt and re-transferring the already
completed TRBs.

[ ... ]

> +static int crg_udc_stop_error_ep(struct crg_gadget_dev *crg_udc, u8 dci)
> +{

[ ... ]

> +	/* The controller is no longer reading request buffers. */
> +	udc_ep_ptr->halt_failed =3D false;
> +	udc_ep_ptr->deq_pt =3D udc_ep_ptr->enq_pt;
> +	udc_ep_ptr->tran_ring_full =3D false;
> +	udc_ep_ptr->ep_state =3D isoc ? EP_STATE_STOPPED : EP_STATE_HALTED;
> +
> +	crg_udc_ep_nuke(udc_ep_ptr, -ECONNRESET);
> +
> +	return 0;

[Severity: High]
Does setting ep_state =3D EP_STATE_STOPPED here permanently wedge isochrono=
us
endpoints after any transfer error event?

With ep_state =3D=3D EP_STATE_STOPPED and dequeue_paused =3D=3D false,
crg_udc_ep_can_queue() returns false and crg_udc_ep_queue() rejects all
subsequent requests with -ESHUTDOWN.  Unlike bulk and interrupt endpoints,
crg_udc_ep_halt() rejects isochronous endpoints with -EOPNOTSUPP, and
udc_ep_ptr->deq_pt is advanced to enq_pt in software without calling
crg_udc_epcx_update_dqptr(), leaving no way for the gadget to resume the
isochronous stream without disabling and re-enabling the endpoint.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-axiado-ax3=
000-usb-device-controller-v5-0-49271ed5c793@axiado.com?part=3D5
