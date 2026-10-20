Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792490488;
	b=w5SzlwG9dkHq7YkWGeNpRKtIVG6MGAz2pFWlxtBWHICExoSB+4hg5xhCYmL1B1HKZgVC
	 wmkpUWlW35DKNHFCH5cg31oJqL/u2KX3dIuvF7/++9wJGBT/STR32Oj6xt64YTaVu0eEr
	 bbl08/MWA7oV7xZ92IIMnM/SFjUTm1j2ykj+fZmqrDXE8UceDARXQwQt7UOD0zcwRBNhW
	 +eDeRFegOXq504IgxsvOOhjsceDsBGhJqK300f8wLiovsBufL7UlgD7neiAZYSAWc5M3g
	 NFtiDD6LrVYPmIfS7CqZQsNflpwJ0lYOld0NiU0Uc5u3B9pQ7EURe7ggTZGwGJIrqcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792490488;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=U1VUBEHq3kKB6EQBxERlk7poWAnnFSDQaTvsxEevSVw=;
	b=KVUk//2/9ZBRkc/Q7bU9lDrLu5DUOI7VCU0pJA+HYx2AgW/U6wwN4eeKvgc0IEibVJsp
	 19P0hdg3iYknSrSvmPMo48xgGeV881W9UCzs7E/yQKcQFSoK0tIOJMdcuEpbTm0ifM6Jg
	 VgM1yntxpsWern0EZv35GG6BmeLN9ma6aIEkBMDCx7/ARZsVK/6XGM2mcOB3kVdVGYYsR
	 e0w6CVTALj4fBnw9pVex6OkXLzNpXfvtfyqY+DQ4T3AvWjz6g4oZM0vSJZnLiEMba9lzM
	 xUXbsM6SN8lDTatXuh56LFL4W1O/2WpYrMwcNXKOgUbfcKxSI6vKNFWMmXO84/LY9/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PyRwMEQj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24315606A31A;
	Tue, 20 Oct 2026 10:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PyRwMEQj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C06A1F000C5;
	Tue, 20 Oct 2026 10:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792490487;
	bh=U1VUBEHq3kKB6EQBxERlk7poWAnnFSDQaTvsxEevSVw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PyRwMEQjAWO7dirbrqYk5DEqQAnZ6ohMeE46kKRtQ1QPRgkudN80nSszJFg5HtwLG
	 zVzKwSJ6H6GR82vsKSMRjzrrf4KqKHyCVJZvZ/dxLMJ5jPzNFRotMmxnEPnv0CjCNd
	 UK7gm/NJx09z3LVMMqb05n2DUVidMpI7+WoDulDWWYemI5h+0RoOv5N9vVrO9YSKQS
	 FsDb3vHwbcLngvoZZkiP8fd9enVbUs5+tZc93iwmABXq6CT11yIAOO/v8wP8me8F1L
	 IhHctgbqV8UQc9Zq4MaASbFXOqs/tXd6dx3k2A/AOqjwmy7F0tcBwfpujU7CXLkFhA
	 4a6cNWyeKsxUA==
Message-ID: <sashiko-outbox-178786@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/6] usb: gadget: udc: crg: Add gadget and endpoint
 operations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261020-axiado-ax3000-usb-device-controller-v3-5-3012ecfc0a93@axiado.com>
References: <20261020-axiado-ax3000-usb-device-controller-v3-0-3012ecfc0a93@axiado.com>
 <20261020-axiado-ax3000-usb-device-controller-v3-5-3012ecfc0a93@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 10:01:27 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 12 potential issue=
(s) to consider:
- [Critical] usb: gadget: crg: TRB interleaving, premature ZLP, and stall o=
n multi-TD rings
- [Critical] usb: gadget: crg: dangling ring pointers and unlocked free in =
crg_udc_ep_enable()
- [Critical] usb: gadget: crg: race and missing async_callbacks check in cr=
g_udc_reset_work()
- [High] usb: gadget: crg: broken last_trb calculation in crg_udc_queue_trb=
s()
- [High] usb: gadget: crg: broken CMPL_CODE_SHORT_PKT handling in crg_udc_h=
andle_xfer_event()
- [High] usb: gadget: crg: wrong dequeue cycle state and stalled ring on de=
queue/unhalt
- [High] usb: gadget: crg: missing hardware disable wait and lock-drop race=
 in crg_udc_ep_disable()
- [High] usb: gadget: crg: stale state updates after lock drop in crg_udc_r=
eq_done()
- [High] usb: gadget: crg: High-Speed maxburst always 0 in crg_udc_epcx_set=
up()
- [High] usb: gadget: crg: broken PLC resume, state, and disconnect in crg_=
udc_handle_port_status()
- [High] usb: gadget: crg: missing state revalidation after lock drop in cr=
g_udc_ep_queue()
- [Medium] usb: gadget: crg: lockless state updates in crg_gadget_stop() an=
d start()
--

commit 61353c2b5c4b6d93cbb68f036c35a32b502efad8
Author: Petar Stepanovic <pstepanovic@axiado.com>

usb: gadget: udc: crg: Add gadget and endpoint operations

This commit implements the USB gadget and endpoint operations, TRB ring
queueing, and event handling for the Axiado AX3000/AX3005 UDC driver.

> diff --git a/drivers/usb/gadget/udc/crg/crg-udc-gadget.c b/drivers/usb/ga=
dget/udc/crg/crg-udc-gadget.c
> new file mode 100644
> index 0000000000000..a330e857a9509
> --- /dev/null
> +++ b/drivers/usb/gadget/udc/crg/crg-udc-gadget.c
> @@ -0,0 +1,2299 @@

[ ... ]

> +static int crg_gadget_start(struct usb_gadget *g,
> +			    struct usb_gadget_driver *driver)
> +{
> +	struct crg_gadget_dev *crg_udc =3D gadget_to_udc(g);
> +	int ret;
> +
> +	/* The UDC core calls udc_set_speed() before udc_start(). */
> +	ret =3D crg_udc_program_speed(crg_udc);
> +	if (ret)
> +		return ret;
> +
> +	crg_udc->gadget_driver =3D driver;
> +	crg_udc_set_vbus_detect(crg_udc, true);
> +	return 0;
> +}
> +
> +static int crg_gadget_stop(struct usb_gadget *g)
> +{
> +	struct crg_gadget_dev *crg_udc;
> +	unsigned long flags =3D 0;
> +
> +	crg_udc =3D gadget_to_udc(g);
> +
> +	/*
> +	 * Clear gadget_driver first so crg_udc_handle_port_status() can no
> +	 * longer schedule udc_reset_work (it only does so while
> +	 * gadget_driver is set), then cancel_work_sync() is guaranteed to
> +	 * be the last word: no new reset notification can be queued after
> +	 * it returns.
> +	 */
> +	spin_lock_irqsave(&crg_udc->udc_lock, flags);
> +	crg_udc->gadget_driver =3D NULL;
> +	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +
> +	cancel_work_sync(&crg_udc->udc_reset_work);
> +
> +	crg_udc->device_state =3D USB_STATE_ATTACHED;
> +	crg_udc_set_vbus_detect(crg_udc, false);
> +
> +	spin_lock_irqsave(&crg_udc->udc_lock, flags);

[Severity: Medium]
Can updating crg_udc->device_state and calling crg_udc_set_vbus_detect()
without holding crg_udc->udc_lock race with the threaded interrupt handler?

Before crg_gadget_stop() runs crg_udc_reset() and
crg_udc_reset_data_struct(), hardware interrupts remain enabled in
uccr->control (crg_gadget_pullup() only clears CRG_U3DC_CTRL_RUN, and sysfs
soft_connect_store() can invoke udc_stop() without synchronize_irq()).

If crg_gadget_handle_interrupt() is concurrently running under udc_lock in
crg_udc_handle_port_status() or crg_udc_handle_event(), setting
crg_udc->device_state =3D USB_STATE_ATTACHED outside udc_lock can race with=
 the
state checks (such as crg_udc->device_state < USB_STATE_RECONNECTING),
causing crg_udc_handle_port_status() to prematurely call
crg_udc_enable_setup() or crg_udc_handle_event() to drop events. Similarly,
crg_gadget_start() updates config0, crg_udc->gadget_driver, and
CRG_UDC_VENDOR_REG without acquiring crg_udc->udc_lock.

Should these state and register updates in crg_gadget_stop() and
crg_gadget_start() be performed under crg_udc->udc_lock?

[ ... ]

> +static void crg_gadget_async_callbacks(struct usb_gadget *g, bool enable)
> +{
> +	struct crg_gadget_dev *crg_udc =3D gadget_to_udc(g);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&crg_udc->udc_lock, flags);
> +	crg_udc->async_callbacks =3D enable;
> +	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +}

[ ... ]

> +static int crg_udc_ep_dequeue(struct usb_ep *_ep, struct usb_request *_r=
eq)
> +{

[ ... ]

> +	if (crg_udc_is_pointer_less_than(pause_pt, udc_req->first_trb,
> +					 udc_ep_ptr)) {
> +		crg_udc_squeeze_xfer_ring(udc_ep_ptr, udc_req);
> +		crg_udc_req_done(udc_ep_ptr, udc_req, -ECONNRESET);
> +	} else if (udc_req->last_trb &&
> +		   crg_udc_is_pointer_less_than(udc_req->last_trb, pause_pt,
> +						udc_ep_ptr)) {
> +		crg_udc_req_done(udc_ep_ptr, udc_req, -ECONNRESET);
> +	} else {
> +		struct crg_udc_request *next_req =3D NULL;
> +
> +		udc_req->usb_req.actual =3D
> +			crg_udc_actual_before(udc_ep_ptr, udc_req, pause_pt);
> +
> +		if (!list_is_last(&udc_req->queue, &udc_ep_ptr->queue))
> +			next_req =3D list_entry(udc_req->queue.next,
> +					      struct crg_udc_request, queue);
> +
> +		if (next_req && next_req->first_trb)
> +			udc_ep_ptr->deq_pt =3D next_req->first_trb;
> +		else
> +			udc_ep_ptr->deq_pt =3D udc_ep_ptr->enq_pt;
> +
> +		if (crg_udc_epcx_update_dqptr(udc_ep_ptr)) {
> +			spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +			return -EIO;
> +		}
> +		crg_udc_req_done(udc_ep_ptr, udc_req, -ECONNRESET);
> +	}
> +
> +	if (old_ep_state =3D=3D EP_STATE_RUNNING) {
> +		udc_ep_ptr->ep_state =3D EP_STATE_RUNNING;
> +		crg_udc_knock_doorbell(crg_udc, dci);
> +	}
> +
> +	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +	return 0;
> +}

[Severity: High]
When the active request is dequeued in the else branch above, advancing
udc_ep_ptr->deq_pt frees space on the transfer ring, but tran_ring_full is
never cleared and crg_udc_queue_pending_trbs() is not called. If
tran_ring_full was true and next_req has first_trb =3D=3D NULL, won't setti=
ng
deq_pt =3D enq_pt while leaving tran_ring_full true permanently stall the
endpoint queue?

In addition, crg_udc_req_done() drops crg_udc->udc_lock while
udc_ep_ptr->ep_state is EP_STATE_STOPPED. When it returns, checking the sav=
ed
old_ep_state =3D=3D EP_STATE_RUNNING unconditionally sets udc_ep_ptr->ep_st=
ate =3D
EP_STATE_RUNNING and rings the doorbell. If the endpoint was disabled or
halted while udc_lock was dropped during the completion callback, won't this
clobber the new endpoint state?

> +
> +/* endpoint operations */
> +
> +static int crg_udc_ep_disable(struct usb_ep *ep)
> +{

[ ... ]

> +	/*
> +	 * ep_enable is a write-1-to-disable register: endpoints are enabled
> +	 * via the CONFIG_EP command, but writing a set bit here disables the
> +	 * corresponding endpoint.
> +	 */
> +	writel(BIT(udc_ep->dci), &uccr->ep_enable);
> +
> +	udc_ep->desc =3D NULL;
> +	udc_ep->comp_desc =3D NULL;
> +
> +	/* clean up the request queue */
> +	crg_udc_ep_nuke(udc_ep, -ESHUTDOWN);
> +
> +	/* decrement ep counters */
> +	crg_udc->num_enabled_eps--;
> +	/* clean up the endpoint context */
> +	memset(p_ep_cx, 0, sizeof(struct crg_ep_cx));
> +
> +	/* If device state was changed to default by port
> +	 * reset, should not overwrite it again
> +	 */
> +	if (crg_udc->num_enabled_eps =3D=3D 0 &&
> +	    crg_udc->device_state =3D=3D USB_STATE_CONFIGURED) {
> +		crg_udc->device_state =3D USB_STATE_ADDRESS;
> +	}
> +
> +	udc_ep->ep_state =3D EP_STATE_DISABLED;
> +
> +	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +
> +	return 0;
> +}

[Severity: High]
Does crg_udc_ep_disable() need to wait for the hardware to clear
BIT(udc_ep->dci) in uccr->ep_enable (similar to the readl_poll_timeout_atom=
ic
in crg_udc_reinit()) before unmapping DMA buffers in crg_udc_ep_nuke() and
zeroing p_ep_cx?

Also, crg_udc_ep_nuke() calls crg_udc_req_done(), which drops and re-acquir=
es
crg_udc->udc_lock around each request's completion callback. Because
udc_ep->ep_state, crg_udc->num_enabled_eps--, and memset(p_ep_cx, 0, ...) a=
re
only updated after crg_udc_ep_nuke() returns:
- If a bus reset runs crg_udc_reinit() while udc_lock is dropped,
  crg_udc->num_enabled_eps is reset to 0, and crg_udc_ep_disable() will then
  underflow num_enabled_eps to 0xffffffff.
- Because udc_ep->ep_state is still EP_STATE_RUNNING during the callback, a
  concurrent re-enable or disable can race with the post-nuke memset(p_ep_c=
x)
  and udc_ep->ep_state =3D EP_STATE_DISABLED assignment.

Should the hardware disable poll, endpoint context cleanup, num_enabled_eps
decrement, and EP_STATE_DISABLED transition happen before calling
crg_udc_ep_nuke()?

> +
> +static int crg_udc_ep_enable(struct usb_ep *ep,
> +			     const struct usb_endpoint_descriptor *desc)
> +{

[ ... ]

> +	if (udc_ep->dci) {
> +		u32 ring_size =3D 0;
> +		size_t len;
> +
> +		if (usb_endpoint_xfer_bulk(desc))
> +			ring_size =3D CRG_UDC_BULK_EP_TD_RING_SIZE;
> +		else if (usb_endpoint_xfer_isoc(desc))
> +			ring_size =3D CRG_UDC_ISOC_EP_TD_RING_SIZE;
> +		else if (usb_endpoint_xfer_int(desc))
> +			ring_size =3D CRG_UDC_INT_EP_TD_RING_SIZE;
> +
> +		if (!ring_size) {
> +			spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +			return -EINVAL;
> +		}
> +		len =3D ring_size * sizeof(struct crg_transfer_trb);
> +
> +		if (udc_ep->tran_ring_info.cpu_addr &&
> +		    udc_ep->tran_ring_info.len !=3D len) {
> +			void *old_vaddr =3D udc_ep->tran_ring_info.cpu_addr;
> +			dma_addr_t old_dma =3D udc_ep->tran_ring_info.dma_addr;
> +			size_t old_len =3D udc_ep->tran_ring_info.len;
> +
> +			udc_ep->tran_ring_info.cpu_addr =3D NULL;
> +			udc_ep->enq_pt =3D NULL;
> +			udc_ep->deq_pt =3D NULL;
> +
> +			spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +			dma_free_coherent(crg_udc->dev, old_len, old_vaddr,
> +					  old_dma);
> +			spin_lock_irqsave(&crg_udc->udc_lock, flags);
> +
> +			if (udc_ep->desc !=3D desc ||
> +			    udc_ep->ep_state !=3D EP_STATE_DISABLED) {
> +				spin_unlock_irqrestore(&crg_udc->udc_lock,
> +						       flags);
> +				return -EAGAIN;
> +			}
> +		}
> +
> +		/* setup transfer ring */
> +		if (!udc_ep->tran_ring_info.cpu_addr) {
> +			dma_addr_t dma;
> +			void *vaddr;
> +
> +			spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +			vaddr =3D dma_alloc_coherent(crg_udc->dev, len, &dma,
> +						   GFP_KERNEL);
> +			if (!vaddr)
> +				return -ENOMEM;
> +			spin_lock_irqsave(&crg_udc->udc_lock, flags);
> +			if (udc_ep->desc !=3D desc ||
> +			    udc_ep->ep_state !=3D EP_STATE_DISABLED) {
> +				spin_unlock_irqrestore(&crg_udc->udc_lock,
> +						       flags);
> +				dma_free_coherent(crg_udc->dev, len, vaddr,
> +						  dma);
> +				return -EAGAIN;
> +			}
> +			udc_ep->tran_ring_info.cpu_addr =3D vaddr;
> +			udc_ep->tran_ring_info.dma_addr =3D dma;
> +			udc_ep->tran_ring_info.len =3D len;
> +			udc_ep->first_trb =3D vaddr;
> +			udc_ep->last_trb =3D udc_ep->first_trb + ring_size - 1;
> +		}
> +		memset(udc_ep->first_trb, 0, udc_ep->tran_ring_info.len);
> +		/* Ensure that transfer ring is updated */
> +		dma_wmb();
> +		crg_udc_setup_link_trb(udc_ep->last_trb, true,
> +				       udc_ep->tran_ring_info.dma_addr);
> +		udc_ep->enq_pt =3D udc_ep->first_trb;
> +		udc_ep->deq_pt =3D udc_ep->first_trb;
> +		udc_ep->pcs =3D 1;
> +		udc_ep->tran_ring_full =3D false;
> +		crg_udc->num_enabled_eps++;
> +		status =3D crg_udc_epcx_setup(udc_ep);
> +		if (status)
> +			goto err_ep_enable;
> +	}
> +	param0 =3D BIT(udc_ep->dci);
> +	status =3D crg_udc_issue_command(crg_udc, CRG_CMD_CONFIG_EP, param0, 0);
> +	if (status)
> +		goto err_ep_enable;
> +	if (crg_udc->device_state =3D=3D USB_STATE_ADDRESS)
> +		crg_udc->device_state =3D USB_STATE_CONFIGURED;
> +	udc_ep->wedge =3D false;
> +	udc_ep->usb_ep.enabled =3D 1;
> +	udc_ep->ep_state =3D EP_STATE_RUNNING;
> +	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +	return 0;
> +
> +err_ep_enable:
> +	if (udc_ep->dci && crg_udc->num_enabled_eps)
> +		crg_udc->num_enabled_eps--;
> +	udc_ep->desc =3D NULL;
> +	udc_ep->comp_desc =3D NULL;
> +	udc_ep->ep_state =3D EP_STATE_DISABLED;
> +	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +
> +	if (udc_ep->tran_ring_info.cpu_addr) {
> +		dma_free_coherent(crg_udc->dev, udc_ep->tran_ring_info.len,
> +				  udc_ep->tran_ring_info.cpu_addr,
> +				  udc_ep->tran_ring_info.dma_addr);
> +		udc_ep->tran_ring_info.cpu_addr =3D NULL;
> +		udc_ep->tran_ring_info.dma_addr =3D DMA_MAPPING_ERROR;
> +		udc_ep->tran_ring_info.len =3D 0;
> +		udc_ep->first_trb =3D NULL;
> +		udc_ep->last_trb =3D NULL;
> +	}
> +	return status;
> +}

[Severity: Critical]
Can the transfer ring resize and error paths in crg_udc_ep_enable() leave
dangling ring pointers or race on udc_ep->tran_ring_info?

1. When resizing an existing ring (udc_ep->tran_ring_info.len !=3D len),
   udc_ep->tran_ring_info.cpu_addr, udc_ep->enq_pt, and udc_ep->deq_pt are
   set to NULL and old_vaddr is freed, but udc_ep->first_trb and
   udc_ep->last_trb still point to old_vaddr. If the subsequent
   dma_alloc_coherent() returns -ENOMEM (or the state re-check returns
   -EAGAIN, or !ring_size returns -EINVAL), crg_udc_ep_enable() returns
   without clearing udc_ep->desc, udc_ep->comp_desc, udc_ep->first_trb, or
   udc_ep->last_trb. A subsequent crg_udc_ep_queue() will see non-NULL
   udc_ep_ptr->first_trb and udc_ep_ptr->desc and dereference NULL
   udc_ep_ptr->enq_pt (or freed first_trb).

2. Under err_ep_enable, spin_unlock_irqrestore(&crg_udc->udc_lock, flags) is
   called before checking, freeing, and clearing udc_ep->tran_ring_info and
   first_trb/last_trb (and enq_pt/deq_pt are left non-NULL). Once udc_lock =
is
   dropped with udc_ep->ep_state =3D=3D EP_STATE_DISABLED, can a concurrent
   crg_udc_ep_enable() or teardown path race on udc_ep->tran_ring_info.cpu_=
addr
   and double-free or use-after-free the coherent ring buffer?

[ ... ]

> +static int crg_udc_ep_queue(struct usb_ep *_ep, struct usb_request *_req,
> +			    gfp_t gfp_flags)
> +{

[ ... ]

> +	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +
> +	crg_udc_clear_req_container(udc_req_ptr);
> +	udc_req_ptr->mapped =3D false;
> +
> +	if (_req->length) {
> +		udc_req_ptr->map_dir =3D dma_data_dir;
> +		status =3D usb_gadget_map_request_by_dev(
> +			crg_udc->dev, _req, dma_data_dir =3D=3D DMA_TO_DEVICE);
> +		if (status)
> +			goto err_unmap;
> +
> +		if (is_sg) {
> +			if (!_req->num_mapped_sgs ||
> +			    crg_udc_sg_init(udc_req_ptr)) {
> +				status =3D -EIO;
> +				goto err_unmap;
> +			}
> +		} else if (_req->dma_mapped) {
> +			udc_req_ptr->mapped =3D true;
> +		}
> +	}
> +
> +	spin_lock_irqsave(&crg_udc->udc_lock, flags);
> +	if (udc_ep_ptr->desc !=3D desc || !udc_req_ptr->usb_req.complete ||
> +	    !list_empty(&udc_req_ptr->queue) || crg_udc->resetting) {
> +		status =3D -ESHUTDOWN;
> +		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +		crg_udc_unmap_request(udc_ep_ptr, udc_req_ptr);
> +		return status;
> +	}
> +
> +	_req->status =3D -EINPROGRESS;
> +	_req->actual =3D 0;
> +
> +	if (udc_ep_ptr->tran_ring_full)
> +		status =3D 0;
> +	else
> +		status =3D crg_udc_build_td(udc_ep_ptr, udc_req_ptr);
> +
> +	if (!status)
> +		list_add_tail(&udc_req_ptr->queue, &udc_ep_ptr->queue);
> +	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);

[Severity: High]
When crg_udc_ep_queue() drops crg_udc->udc_lock to map the DMA buffer and t=
hen
re-acquires it, is checking udc_ep_ptr->desc !=3D desc sufficient?

For EP0 (dci =3D=3D 0), udc_ep_ptr->desc always points to &crg_udc->ep0_des=
c. If
a new SETUP packet arrives while udc_lock is dropped during DMA mapping,
crg_udc_abort_ep0_for_setup() and crg_udc_handle_setup_pkt() can complete a=
nd
start a new control transfer, yet udc_ep_ptr->desc !=3D desc will still be
false. Without revalidating ep0_state, setup_status, and setup_tag after
re-acquiring udc_lock, can a stale EP0 request (potentially mapped with the
wrong DMA direction) be queued onto the new control transfer?

Similarly, for non-EP0 endpoints, crg_udc_ep_queue() never checks that
udc_ep_ptr->ep_state =3D=3D EP_STATE_RUNNING (either before or after droppi=
ng
udc_lock), which allows requests to be queued while an endpoint is still
mid-enable in crg_udc_ep_enable() or after it was disabled and re-enabled w=
ith
the same descriptor pointer.

[ ... ]

> +static int crg_udc_epcx_setup(struct crg_udc_ep *udc_ep)
> +{

[ ... ]

> +	} else if ((crg_udc->gadget.speed =3D=3D USB_SPEED_HIGH ||
> +		    crg_udc->gadget.speed =3D=3D USB_SPEED_FULL) &&
> +		   (usb_endpoint_xfer_int(udc_ep->desc) ||
> +		    usb_endpoint_xfer_isoc(udc_ep->desc))) {
> +		if (crg_udc->gadget.speed =3D=3D USB_SPEED_HIGH)
> +			maxburst =3D (usb_endpoint_maxp(desc) >> 11) & 0x3;
> +		if (maxburst =3D=3D 0x3) {
> +			dev_err(crg_udc->dev, "invalid maxburst\n");
> +			maxburst =3D 0x2;
> +		}
> +	}

[Severity: High]
In crg_udc_epcx_setup(), usb_endpoint_maxp(desc) masks wMaxPacketSize with
USB_ENDPOINT_MAXP_MASK (0x07ff), stripping bits [15:11]. Doesn't shifting t=
he
result right by 11 bits always evaluate to 0, leaving High-Speed
high-bandwidth isochronous and interrupt endpoints configured with
maxburst =3D 0 instead of usb_endpoint_maxp_mult(desc) - 1?

[ ... ]

> +static int crg_udc_epcx_update_dqptr(struct crg_udc_ep *udc_ep)
> +{
> +	struct crg_gadget_dev *crg_udc =3D udc_ep->crg_udc;
> +	u8 dci =3D udc_ep->dci;
> +	struct crg_ep_cx *epcx;
> +	u32 dw;
> +	dma_addr_t dqptaddr;
> +	u32 cmd_param0;
> +
> +	if (dci < 2 || dci >=3D CRG_NUM_EP_CX) {
> +		dev_err(crg_udc->dev, "invalid DCI %u for dequeue pointer\n", dci);
> +		return -EINVAL;
> +	}
> +
> +	epcx =3D &crg_udc->p_epcx[dci - 2];
> +	dqptaddr =3D crg_udc_tran_trb_virt_to_dma(udc_ep, udc_ep->deq_pt);
> +
> +	if (dqptaddr =3D=3D DMA_MAPPING_ERROR)
> +		return -EINVAL;
> +
> +	/* fill ep_dw2 */
> +	dw =3D lower_32_bits(dqptaddr) & EP_CX_TR_DQPT_LO_MASK;
> +	FIELD_MODIFY(EP_CX_DEQ_CYC_STATE_MASK, &dw, udc_ep->pcs);
> +	epcx->dw2 =3D cpu_to_le32(dw);

[Severity: High]
Does crg_udc_epcx_update_dqptr() program the wrong Dequeue Cycle State (DCS)
when udc_ep->enq_pt has wrapped past the Link TRB?

udc_ep->pcs tracks the producer cycle state at udc_ep->enq_pt and is toggled
whenever enq_pt wraps to udc_ep->first_trb in crg_udc_queue_trbs(). When
udc_ep->deq_pt !=3D udc_ep->enq_pt and enq_pt has wrapped while deq_pt has =
not
yet wrapped (deq_pt > enq_pt), the TRBs at udc_ep->deq_pt have cycle bit
udc_ep->pcs ^ 1, not udc_ep->pcs. Programming EP_CX_DEQ_CYC_STATE_MASK with
udc_ep->pcs in crg_udc_ep_dequeue() or crg_udc_ep_halt() will cause the
controller to see a cycle bit mismatch at deq_pt and stall the endpoint rin=
g.

[ ... ]

> +static int crg_udc_queue_trbs(struct crg_udc_ep *udc_ep_ptr,
> +			      struct crg_udc_request *udc_req_ptr, bool b_isoc,
> +			      u32 xfer_ring_size, u32 num_trbs_needed,
> +			      u64 buffer_length)
> +{
> +	struct crg_gadget_dev *crg_udc =3D udc_ep_ptr->crg_udc;
> +	struct crg_transfer_trb *p_xfer_ring =3D udc_ep_ptr->first_trb;
> +	struct crg_transfer_trb *enq_pt =3D udc_ep_ptr->enq_pt;
> +	struct usb_request *usb_req =3D &udc_req_ptr->usb_req;
> +	u32 num_trbs_ava, count, i;
> +	u32 td_trbs;
> +	u32 td_size;
> +	u32 j =3D 1;
> +	u32 intr_rate =3D b_isoc ? CRG_UDC_ISOC_EP_INTERRUPT_RATE :
> +				 CRG_UDC_BULK_EP_INTERRUPT_RATE;
> +	bool full_td =3D true;
> +	bool need_zlp =3D false;
> +	bool is_sg =3D usb_req->num_mapped_sgs;
> +
> +	if (!b_isoc && usb_req->zero && usb_req->length &&
> +	    !(usb_req->length % udc_ep_ptr->usb_ep.maxpacket))
> +		need_zlp =3D true;
> +
> +	if (!num_trbs_needed)
> +		return -EINVAL;
> +
> +	/* TD_SIZE is five bits and encodes the number of TRBs remaining
> +	 * in this TD minus one. A request may contain multiple TDs.
> +	 */
> +	td_trbs =3D min_t(u32, num_trbs_needed, 32);
> +
> +	num_trbs_ava =3D crg_udc_room_on_ring(crg_udc, xfer_ring_size,
> +					    p_xfer_ring, udc_ep_ptr->enq_pt,
> +					    udc_ep_ptr->deq_pt);
> +
> +	if (num_trbs_ava < td_trbs) {
> +		if (b_isoc)
> +			return -EBUSY;
> +		trace_crg_udc_no_room_on_ring(
> +			"deferring TRBs to next doorbell");
> +		count =3D num_trbs_ava;
> +		full_td =3D false;
> +		udc_ep_ptr->tran_ring_full =3D true;
> +		need_zlp =3D false;
> +	} else {
> +		count =3D td_trbs;
> +	}

[ ... ]

> +		if (b_isoc) {
> +			crg_udc_setup_trb(
> +				enq_pt, trb_len, trb_buf_addr, td_size,
> +				i =3D=3D 0 ? (original_pcs ^ 1) : udc_ep_ptr->pcs,
> +				TRB_TYPE_XFER_DATA_ISOCH, short_pkt, chain_bit,
> +				ioc, false, 0, true, 0, 1, 0);
> +		} else {
> +			bool azp =3D ioc && !chain_bit && need_zlp;
> +
> +			crg_udc_setup_trb(
> +				enq_pt, trb_len, trb_buf_addr, td_size,
> +				i =3D=3D 0 ? (original_pcs ^ 1) : udc_ep_ptr->pcs,
> +				TRB_TYPE_XFER_NORMAL, short_pkt, chain_bit, ioc,
> +				false, 0, false, 0, 0, azp);
> +		}

[Severity: Critical]
How are requests requiring more than 32 TRBs (or queued behind a full ring)
handled across crg_udc_queue_trbs(), crg_udc_ep_queue(), and
crg_udc_handle_xfer_event()?

1. When num_trbs_needed > 32 and num_trbs_ava >=3D 32, td_trbs is capped at=
 32,
   so buffer_length is still non-zero at the 32nd TRB (i =3D=3D count - 1),=
 but
   need_zlp is only cleared when num_trbs_ava < td_trbs. Won't
   azp =3D ioc && !chain_bit && need_zlp set TRB_APPEND_ZLP_MASK on the 32n=
d TRB
   in the middle of the transfer, sending a premature zero-length packet
   before the remaining TRBs of the request are queued?

2. In that same case (num_trbs_needed > 32 and num_trbs_ava > 32),
   crg_udc_queue_trbs() queues the first 32 TRBs and leaves
   udc_req_ptr->all_trbs_queued =3D false and udc_ep_ptr->tran_ring_full =3D
   false. If a second request is then submitted via crg_udc_ep_queue(), it
   checks only if (udc_ep_ptr->tran_ring_full) and immediately calls
   crg_udc_build_td() for the second request, interleaving the second
   request's TRBs onto the hardware ring ahead of the remaining TRBs of the
   first request.

3. In crg_udc_handle_xfer_event() at queue_more_trbs, udc_ep_ptr->tran_ring=
_full
   is cleared to false before calling crg_udc_queue_pending_trbs(). Because
   crg_udc_queue_pending_trbs() breaks out of its loop and returns 0 after
   building a single TD for the first pending request, if that TD does not
   fill the ring, tran_ring_full stays false even when later requests in
   udc_ep_ptr->queue still have !all_trbs_queued (first_trb =3D=3D NULL), l=
eaving
   them unscheduled on subsequent completions and allowing newly queued
   requests in crg_udc_ep_queue() to bypass them.

> +
> +		trace_crg_udc_queue_trb(udc_ep_ptr, enq_pt);
> +
> +		if (is_sg && !crg_udc_sg_advance(udc_req_ptr, trb_len))
> +			return -EINVAL;
> +
> +		td_size--;
> +		enq_pt++;
> +		j++;
> +
> +		if (enq_pt =3D=3D udc_ep_ptr->last_trb) {
> +			dma_wmb();
> +			le32p_replace_bits(&enq_pt->dw3, udc_ep_ptr->pcs,
> +					   TRB_CYCLE_BIT_MASK);
> +			udc_ep_ptr->pcs ^=3D 1;
> +			enq_pt =3D udc_ep_ptr->first_trb;
> +		}
> +	}
> +
> +	dma_wmb();
> +	le32p_replace_bits(&udc_ep_ptr->enq_pt->dw3, original_pcs,
> +			   TRB_CYCLE_BIT_MASK);
> +
> +	if (!udc_req_ptr->trbs_needed)
> +		udc_req_ptr->first_trb =3D udc_ep_ptr->enq_pt;
> +
> +	udc_ep_ptr->enq_pt =3D enq_pt;
> +	if (count =3D=3D num_trbs_ava)
> +		udc_ep_ptr->tran_ring_full =3D true;
> +	udc_req_ptr->buff_len_left =3D buffer_length;
> +	if (buffer_length)
> +		udc_req_ptr->trbs_needed =3D num_trbs_needed - count;
> +	else
> +		udc_req_ptr->trbs_needed =3D 0;
> +
> +	if (!udc_req_ptr->buff_len_left) {
> +		if (udc_ep_ptr->enq_pt =3D=3D udc_req_ptr->first_trb)
> +			udc_req_ptr->last_trb =3D udc_ep_ptr->last_trb - 1;
> +		else
> +			udc_req_ptr->last_trb =3D udc_ep_ptr->enq_pt - 1;
> +	}
> +
> +	return 0;
> +}

[Severity: High]
There appear to be two issues with how udc_req_ptr->last_trb is computed he=
re:

1. When the final TRB of a request is placed at udc_ep_ptr->last_trb - 1, t=
he
   loop increments enq_pt to udc_ep_ptr->last_trb and wraps it to
   udc_ep_ptr->first_trb. However, the check at the end compares:

	if (udc_ep_ptr->enq_pt =3D=3D udc_req_ptr->first_trb)

   instead of udc_ep_ptr->first_trb (unlike crg_udc_queue_ctrl() in
   crg-udc-ep0.c). For any request that did not start at udc_ep_ptr->first_=
trb,
   this condition is false on wrap and udc_req_ptr->last_trb is set to
   udc_ep_ptr->first_trb - 1 (pointing out-of-bounds before the start of the
   ring buffer).

2. udc_req_ptr->last_trb is only assigned when !udc_req_ptr->buff_len_left.
   When a request is split across multiple TDs (because num_trbs_needed > 32
   or num_trbs_ava < td_trbs), buff_len_left is non-zero and
   udc_req_ptr->last_trb remains NULL while the first TD is in flight. When
   the completion event for the last TRB of that TD (at count - 1 > 0, so
   trb_pt !=3D udc_req->first_trb) arrives in crg_udc_handle_xfer_event(),
   is_request_dequeued() sees udc_req->last_trb =3D=3D NULL,
   crg_udc_is_pointer_less_than(trb_pt, NULL, udc_ep) returns false, and
   is_request_dequeued() returns true. crg_udc_handle_xfer_event() then jum=
ps
   to queue_more_trbs and skips the !udc_req_ptr->all_trbs_queued continuat=
ion
   path, leaving the transfer hung.

[ ... ]

> +void crg_udc_reset_work(struct work_struct *work)
> +{
> +	struct crg_gadget_dev *crg_udc =3D
> +		container_of(work, struct crg_gadget_dev, udc_reset_work);
> +
> +	if (crg_udc->gadget_driver)
> +		usb_gadget_udc_reset(&crg_udc->gadget, crg_udc->gadget_driver);
> +}

[Severity: Critical]
Can crg_udc_reset_work() dereference a NULL crg_udc->gadget_driver or call
driver->reset() after usb_gadget_disable_async_callbacks()?

1. crg_udc_reset_work() reads crg_udc->gadget_driver twice without holding
   crg_udc->udc_lock. If crg_gadget_stop() sets crg_udc->gadget_driver =3D =
NULL
   on another CPU right after the if (crg_udc->gadget_driver) check,
   usb_gadget_udc_reset() can be passed NULL and dereference driver->reset(=
).

2. During unbind, the UDC core calls usb_gadget_disable_async_callbacks()
   (which calls crg_gadget_async_callbacks(g, false)), synchronize_irq(), a=
nd
   driver->unbind() before calling usb_gadget_udc_stop_locked()
   (crg_gadget_stop()). Because crg_udc_handle_port_status() and
   crg_udc_reset_work() do not check crg_udc->async_callbacks and
   crg_gadget_async_callbacks() does not cancel udc_reset_work, can
   udc_reset_work run concurrently with or after driver->unbind()?

> +
> +int crg_udc_handle_port_status(struct crg_gadget_dev *crg_udc,
> +			       unsigned long *flags)
> +{

[ ... ]

> +	/* handle Port Connection Change */
> +	tmp =3D readl(&uccr->portsc);
> +	if ((tmp & (CRG_U3DC_PORTSC_CCS | CRG_U3DC_PORTSC_PP)) =3D=3D
> +	    (CRG_U3DC_PORTSC_CCS | CRG_U3DC_PORTSC_PP)) {
> +		if (FIELD_GET(CRG_U3DC_PORTSC_PLS_MASK, tmp) !=3D 0 ||
> +		    (!(tmp & CRG_U3DC_PORTSC_PED)))
> +			return 0;

[ ... ]

> +	} else if (!(tmp & CRG_U3DC_PORTSC_CCS)) {
> +		bool cable_connected;
> +		int ccs_drop_ignore =3D 0;
> +
> +		if ((FIELD_GET(CRG_U3DC_PORTSC_PLS_MASK, tmp) =3D=3D 0x0) &&
> +		    (FIELD_GET(CRG_U3DC_PORTSC_SPEED_MASK, tmp) <
> +		     CRG_U3DC_PORTSC_SPEED_SS)) {
> +			ccs_drop_ignore =3D 1;
> +			dev_err(crg_udc->dev, "ccs glitch detect on HS/FS!\n");
> +		}
> +
> +		if (!ccs_drop_ignore)
> +			crg_udc->gadget.speed =3D USB_SPEED_UNKNOWN;
> +
> +		cable_connected =3D crg_udc_vbus_connected(crg_udc);
> +		if (cable_connected && !ccs_drop_ignore) {
> +			crg_udc->device_state =3D USB_STATE_POWERED;
> +			crg_udc_reinit(crg_udc);
> +			crg_udc->connected =3D 0;
> +		} else if (!cable_connected) {
> +			dev_dbg(crg_udc->dev,
> +				"cable disconnected, rst controller\n");
> +			if (was_connected)
> +				crg_udc_notify_disconnect(crg_udc, flags);
> +			if (crg_udc_reset(crg_udc, flags))
> +				dev_err(crg_udc->dev,
> +					"controller reset failed on disconnect\n");
> +			crg_udc_reset_data_struct(crg_udc);
> +			crg_udc->connected =3D 0;
> +			crg_udc_init_ep0(crg_udc);
> +
> +			crg_udc->device_state =3D USB_STATE_ATTACHED;
> +			return -ECONNRESET;
> +		}
> +	}
> +	/* handle Port Connection Change end*/
> +
> +	if (portsc_val & CRG_U3DC_PORTSC_PLC) {
> +		tmp =3D readl(&uccr->portsc);
> +		if (FIELD_GET(CRG_U3DC_PORTSC_PLS_MASK, tmp) =3D=3D 0xf) {
> +			FIELD_MODIFY(CRG_U3DC_PORTSC_PLS_MASK, &tmp, 0x0);
> +			writel(tmp, &uccr->portsc);
> +		}
> +	}
> +
> +	return 0;
> +}

[Severity: High]
There seem to be several issues in crg_udc_handle_port_status():

1. The Port Connection Change block runs unconditionally even when
   CRG_U3DC_PORTSC_CSC is not set in portsc_val, and returns 0 whenever
   (tmp & (CRG_U3DC_PORTSC_CCS | CRG_U3DC_PORTSC_PP)) =3D=3D
   (CRG_U3DC_PORTSC_CCS | CRG_U3DC_PORTSC_PP) and PLS !=3D 0. When a Port L=
ink
   State Change (CRG_U3DC_PORTSC_PLC) event arrives with PLS =3D=3D 0xf (Re=
sume)
   on a connected port, PLS !=3D 0 is true, so the function returns 0 early=
 and
   never reaches the if (portsc_val & CRG_U3DC_PORTSC_PLC) block below.

2. In the CRG_U3DC_PORTSC_PLC block, writing PLS =3D 0x0 to &uccr->portsc d=
oes
   not set CRG_U3DC_PORTSC_LWS (Link Write Strobe) and does not mask out
   CRG_U3DC_PORTSC_W1C_MASK (unlike crg_gadget_wakeup()). Without LWS, will
   the hardware ignore the PLS write while clearing any newly asserted W1C
   bits in portsc?

3. In the !(tmp & CRG_U3DC_PORTSC_CCS) branch when cable_connected &&
   !ccs_drop_ignore is true:
   - crg_udc->device_state is set to USB_STATE_POWERED, but the immediate c=
all
     to crg_udc_reinit(crg_udc) overwrites crg_udc->device_state with
     USB_STATE_RECONNECTING.
   - crg_udc->connected is set to 0 without calling
     crg_udc_notify_disconnect(). If a cable unplug drops CCS before VBUS
     (CRG_U3DC_PORTSC_PP) decays, crg_udc->connected becomes 0 on the first
     event, so when VBUS subsequently drops and enters else if
     (!cable_connected), was_connected is false and
     crg_udc_notify_disconnect() is never called.

> +
> +int crg_udc_handle_xfer_event(struct crg_gadget_dev *crg_udc,
> +			      struct crg_event_trb *event, unsigned long *flags)
> +{

[ ... ]

> +			if (udc_req_ptr->all_trbs_queued) {
> +				udc_req_ptr->usb_req.actual =3D
> +					udc_req_ptr->usb_req.length -
> +					udc_req_ptr->buff_len_left;
> +				residual =3D FIELD_GET(EVE_TRB_TRAN_LEN_MASK,
> +						     le32_to_cpu(event->dw2));
> +				if (residual > udc_req_ptr->usb_req.actual)
> +					residual =3D 0;
> +				udc_req_ptr->usb_req.actual -=3D residual;
> +				crg_udc_req_done(udc_ep_ptr, udc_req_ptr, 0);
> +
> +				if (dci =3D=3D 0 && udc_ep_ptr->desc &&
> +				    usb_endpoint_xfer_control(udc_ep_ptr->desc))
> +					crg_udc_ep0_req_complete(udc_ep_ptr,
> +								 flags);

[Severity: High]
For a standard USB_REQ_GET_STATUS request on EP0, getstatusrequest() in
crg-udc-ep0.c sets udc_req_ptr->usb_req.complete =3D get_status_cmpl and
crg_udc->setup_status =3D DATA_STAGE_XFER.

When the data stage completes here, crg_udc_req_done() runs get_status_cmpl=
(),
which sets crg_udc->setup_status =3D STATUS_STAGE_RECV and calls
crg_udc_build_ep0_status() to queue the status stage TRB. Immediately after
crg_udc_req_done() returns, crg_udc_ep0_req_complete() is called; because
setup_status is already STATUS_STAGE_RECV instead of DATA_STAGE_XFER,
crg_udc_ep0_req_complete() hits its default case and resets
crg_udc->setup_status =3D WAIT_FOR_SETUP while the status stage TRB is stil=
l in
flight.

> +			} else {
> +				int ret;
> +
> +				ret =3D crg_udc_build_td(udc_ep_ptr, udc_req_ptr);
> +				if (ret) {
> +					udc_req_ptr->usb_req.actual =3D
> +						udc_req_ptr->usb_req.length -
> +						udc_req_ptr->buff_len_left;
> +					crg_udc_req_done(udc_ep_ptr, udc_req_ptr,
> +							 -EIO);
> +				} else {
> +					crg_udc_knock_doorbell(crg_udc, dci);
> +				}
> +			}
> +		}
> +		break;
> +
> +	case CMPL_CODE_SHORT_PKT:
> +		if (list_empty(&udc_ep_ptr->queue))
> +			break;
> +
> +		udc_req_ptr =3D list_first_entry(&udc_ep_ptr->queue,
> +					       struct crg_udc_request, queue);
> +		udc_req_ptr->usb_req.actual =3D udc_req_ptr->usb_req.length -
> +					      udc_req_ptr->buff_len_left;
> +		residual =3D FIELD_GET(EVE_TRB_TRAN_LEN_MASK,
> +				     le32_to_cpu(event->dw2));
> +		if (residual > udc_req_ptr->usb_req.actual)
> +			residual =3D 0;
> +		udc_req_ptr->usb_req.actual -=3D residual;
> +
> +		if (udc_req_ptr->usb_req.short_not_ok &&
> +		    usb_endpoint_dir_out(udc_ep_ptr->desc))
> +			crg_udc_req_done(udc_ep_ptr, udc_req_ptr, -EREMOTEIO);
> +		else
> +			crg_udc_req_done(udc_ep_ptr, udc_req_ptr, 0);
> +
> +		trbs_dequeued =3D true;
> +		crg_udc_advance_dequeue_pt(udc_ep_ptr);
> +		break;

[Severity: High]
Can CMPL_CODE_SHORT_PKT cause EP0 control OUT transfers to hang and miscalc=
ulate
usb_req.actual on multi-TRB transfers?

1. crg_udc_setup_datastage_trb() sets TRB_INTR_ON_SHORT_PKT_MASK on EP0 data
   stage TRBs. If a host sends a short packet during a control OUT data sta=
ge
   (DATA_STAGE_RECV), completion arrives with CMPL_CODE_SHORT_PKT, which
   completes the request via crg_udc_req_done() but never calls
   crg_udc_ep0_req_complete(udc_ep_ptr, flags) when dci =3D=3D 0, so the st=
atus
   stage TRB is never queued.

2. EVE_TRB_TRAN_LEN_MASK in event->dw2 is the residual byte count of the
   single TRB that short-terminated, whereas
   udc_req_ptr->usb_req.length - udc_req_ptr->buff_len_left is the total by=
te
   count of all TRBs queued in the TD. If an OUT request spans multiple TRBs
   (for example, a scatter-gather list or a buffer crossing a 64 KB boundar=
y)
   and short-terminates on an earlier TRB, subtracting only that TRB's
   residual counts all subsequent unexecuted TRBs in the TD as received.

3. Calling crg_udc_req_done() before crg_udc_advance_dequeue_pt(udc_ep_ptr)
   means udc_lock is dropped for the completion callback while udc_ep_ptr->=
deq_pt
   is still stale; if the callback queues a new request, advancing deq_pt
   afterwards can corrupt the dequeue pointer. (A similar ordering issue
   exists in crg_udc_ep_halt() and set_ep_halt(), where crg_udc_ep_nuke()
   drops udc_lock before udc_ep_ptr->deq_pt =3D udc_ep_ptr->enq_pt and
   udc_ep_ptr->ep_state =3D EP_STATE_HALTED are set.)

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-axiado-ax3=
000-usb-device-controller-v3-0-3012ecfc0a93@axiado.com?part=3D5
