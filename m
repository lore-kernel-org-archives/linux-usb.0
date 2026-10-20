Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792490504;
	b=5ZQZu4Hz+HzZ0KhGU5+r6wMwNYF5KmyrqSusV2CfjvQaOotyvnkGq7pj1mwZA7UkhZKr
	 IjgRd3aQ8dshUlpz/7PxzricUXNf7kvQDKUZiyuQ6X/JK06bNEh/EXXj0LNucgdIbQdFS
	 vqewrI+vRQQGp5gWR5VxKA0pulVpeUUnmlPpU7VWfAHTlB/4P65af0YT26KWDkcJljkYD
	 VmiKmu7rUGFj45tgfB9S9gURFeT1KDRvkvZqRv7/9fVFJukaWshOYdaNrCZ2bPmgIgZ8w
	 8gN+ms4jsvANYEJ/4mGfNYMruCIbTwhnKoRh4akSR0C42ECXsnkkk/tF/Inff86B1+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792490504;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zbGqUNPm0brsR/d9SpBy+gmgfdJ4DXkMuOr9efw0nZk=;
	b=dKrzhB4EQfBlBazvFeryFtz7MyqlwHpHTBJMOhaqIlSSoTkwCw8Fd7yMxQL7BOpx81aO
	 7bKDwQ09an9bVnUmaDW0DGsCaokhMX6Hq4JhQ0bl9OfTAxxusmn9AqrqtEQG47DbrivuZ
	 mvKQLjZUsgcUsauSCAypiv2Z+MQv1a1Dco0tgIhxDYekV8pzunxIqtJpAZinuOXFnH4XE
	 fd2TZUk45kExNjVFNQqLMYK0asFWgzv34BM8sK+yBIxWYhGo4HY0pFGm0zDY38pJVDwsZ
	 YmQWlz0MR2BG75vzT9AXaSZrHaFvnFUN80DKYwEpBtnTbvlQeAWWYe4KMkS1uf3vtxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ru7T27h8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F40606A31A;
	Tue, 20 Oct 2026 10:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ru7T27h8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 513131F000C6;
	Tue, 20 Oct 2026 10:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792490503;
	bh=zbGqUNPm0brsR/d9SpBy+gmgfdJ4DXkMuOr9efw0nZk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ru7T27h8ngcAjw/I/TJF8wwrtWNRm95YSDd1RoHIsh6nztuORQ6tZ5VJvqL7CwrGL
	 aZAWDBBKxcmP4vpSO6PxCDk8BfosYGL09QY8Rq8S78h6IJJy4JtUrSLbxAD1/aY309
	 62OymBh3lXBUs10ufA+PlJOgmyYIHyKhIJjEGF9oIhjdeiDiQr/oqqe3wSr6tAA8fw
	 01t8yZvDHVyv/JN8kY81/DxrMtOZz+G0lvu5EvL/DL7bIZawvcC8BYoaZWxefhZIBI
	 QPzYDem3f6vPis7gcpWMRw3zRL238X9qGPBLHzuciavz0EJJQFjaFub0Bi0nPSeAZx
	 9CFKGw/bv1DkA==
Message-ID: <sashiko-outbox-178788@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/6] usb: gadget: udc: crg: Add endpoint 0 handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261020-axiado-ax3000-usb-device-controller-v3-4-3012ecfc0a93@axiado.com>
References: <20261020-axiado-ax3000-usb-device-controller-v3-0-3012ecfc0a93@axiado.com>
 <20261020-axiado-ax3000-usb-device-controller-v3-4-3012ecfc0a93@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 10:01:42 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] usb: gadget: crg: NULL dereference and list corruption in crg_udc_=
build_ep0_status()
- [High] usb: gadget: crg: duplicate status stage transition in get_status_=
cmpl()
- [High] usb: gadget: crg: race on unlocked status_req buffer and EP0 state=
 in completion
- [Medium] usb: gadget: crg: broken feature validation and recipient handli=
ng in setfeaturesrequest()
- [Medium] usb: gadget: crg: broken SET_ADDRESS(0) and error handling in se=
taddressrequest()
- [Medium] usb: gadget: crg: reversed SET_SEL payload layout in set_sel_cmp=
l()
- [Medium] usb: gadget: udc: crg: missing chain bit in crg_udc_queue_ctrl()
- [Medium] usb: gadget: crg: unsafe EP0 nuke ordering in crg_udc_prepare_fo=
r_setup()
- [Medium] usb: gadget: crg: race with udc_reset_work in crg_udc_handle_set=
up_pkt()
--

commit 594f5b35fd6f32d435f7e79db65654d684456116
Author: Petar Stepanovic <pstepanovic@axiado.com>

usb: gadget: udc: crg: Add endpoint 0 handling

This patch adds endpoint 0 setup packet, status stage, and control transfer
handling for the Axiado AX3000/AX3005 UDC driver.

> diff --git a/drivers/usb/gadget/udc/crg/crg-udc-ep0.c b/drivers/usb/gadge=
t/udc/crg/crg-udc-ep0.c
> new file mode 100644
> index 0000000000000..dce36d23d3ece
> --- /dev/null
> +++ b/drivers/usb/gadget/udc/crg/crg-udc-ep0.c
> @@ -0,0 +1,1106 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Axiado AX3000/AX3005 USB Device Controller driver.
> + *
> + * Copyright (c) 2019 Corigine Inc.
> + * Copyright (c) 2021-2026 Axiado Corporation.
> + */
> +#include <linux/iopoll.h>
> +
> +#include "crg-udc.h"
> +#include "crg-udc-trace.h"
> +
> +static void enable_setup_event(struct crg_gadget_dev *crg_udc);
> +
> +void crg_udc_build_ep0_status(struct crg_udc_ep *udc_ep_ptr, bool defaul=
t_value,
> +			      u32 status, struct crg_udc_request *udc_req_ptr,
> +			      u8 set_addr, u8 stall)
> +{
> +	struct crg_gadget_dev *crg_udc =3D udc_ep_ptr->crg_udc;
> +	struct crg_transfer_trb *enq_pt =3D udc_ep_ptr->enq_pt;
> +
> +	if (default_value) {
> +		udc_req_ptr =3D crg_udc->status_req;
> +		udc_req_ptr->usb_req.length =3D 0;
> +		udc_req_ptr->usb_req.status =3D status;
> +		udc_req_ptr->usb_req.actual =3D 0;
> +		udc_req_ptr->usb_req.complete =3D NULL;
> +	} else {
> +		udc_req_ptr->usb_req.status =3D status;
> +		udc_req_ptr->usb_req.actual =3D 0;
> +	}
> +
> +	crg_udc_setup_status_trb(crg_udc, enq_pt, &udc_req_ptr->usb_req,
> +				 udc_ep_ptr->pcs, set_addr, stall);
> +
> +	enq_pt++;
> +
> +	/* check if we are at end of trb segment.  If so, update
> +	 * pcs and enq for next segment
> +	 */
> +	if (FIELD_GET(TRB_TYPE_MASK, le32_to_cpu(enq_pt->dw3)) =3D=3D
> +	    TRB_TYPE_LINK) {
> +		if (FIELD_GET(TRB_LINK_TOGGLE_CYCLE_MASK,
> +			      le32_to_cpu(enq_pt->dw3))) {
> +			dma_wmb();
> +			le32p_replace_bits(&enq_pt->dw3, udc_ep_ptr->pcs,
> +					   TRB_CYCLE_BIT_MASK);
> +			udc_ep_ptr->pcs ^=3D 0x1;
> +		}
> +		enq_pt =3D udc_ep_ptr->first_trb;
> +	}
> +	udc_ep_ptr->enq_pt =3D enq_pt;
> +
> +	crg_udc_knock_doorbell(crg_udc, 0);
> +
> +	list_add_tail(&udc_req_ptr->queue, &udc_ep_ptr->queue);
> +}

[Severity: High]
Can crg_udc_build_ep0_status() dereference a NULL crg_udc->status_req or
corrupt udc_ep_ptr->queue when called via crg_udc_set_ep0_halt()?

In getstatusrequest() and setselrequest(), udc_req_ptr is initialized to
crg_udc->status_req and checked with:

	if (!udc_req_ptr || !list_empty(&udc_req_ptr->queue) || ...) {
		crg_udc_set_ep0_halt(crg_udc);
		return;
	}

However, crg_udc_set_ep0_halt() immediately calls:

	crg_udc_build_ep0_status(udc_ep_ptr, true, -EINVAL, NULL, 0, 1);

When default_value is true, crg_udc_build_ep0_status() sets udc_req_ptr =3D
crg_udc->status_req and dereferences it without checking for NULL. If
status_req is already queued on udc_ep_ptr->queue from a previous in-flight
request, this also overwrites udc_req_ptr->usb_req.complete with NULL
(leaking any allocated status_req->usb_req.buf and its DMA mapping) and
calls list_add_tail(&udc_req_ptr->queue, &udc_ep_ptr->queue) on a list node
that is already in the list.

[ ... ]

> +void crg_udc_ep0_req_complete(struct crg_udc_ep *udc_ep_ptr,
> +			      unsigned long *flags)
> +{
> +	struct crg_gadget_dev *crg_udc =3D udc_ep_ptr->crg_udc;
> +
> +	switch (crg_udc->setup_status) {
> +	case DATA_STAGE_XFER:
> +		crg_udc->setup_status =3D STATUS_STAGE_RECV;
> +		crg_udc_build_ep0_status(udc_ep_ptr, true, -EINPROGRESS, NULL,
> +					 0, 0);
> +		break;
> +	case DATA_STAGE_RECV:
> +		crg_udc->setup_status =3D STATUS_STAGE_XFER;
> +		crg_udc_build_ep0_status(udc_ep_ptr, true, -EINPROGRESS, NULL,
> +					 0, 0);
> +		break;
> +	default:
> +		if (crg_udc->setup_fn_call_back) {
> +			crg_udc->setup_fn_call_back(crg_udc);
> +			crg_udc->setup_fn_call_back =3D NULL;
> +		}
> +		crg_udc->setup_status =3D WAIT_FOR_SETUP;
> +		break;
> +	}
> +}
> +
> +static void get_status_cmpl(struct usb_ep *ep, struct usb_request *req)
> +{
> +	struct crg_udc_ep *udc_ep =3D container_of(ep, struct crg_udc_ep, usb_e=
p);
> +	struct crg_gadget_dev *crg_udc =3D udc_ep->crg_udc;
> +	unsigned long flags;
> +
> +	kfree(req->buf);
> +	req->buf =3D NULL;
> +
> +	/*
> +	 * A non-zero status means this request was completed early (e.g.
> +	 * crg_udc_ep_nuke(..., -ECONNRESET) from crg_udc_abort_ep0_for_setup()
> +	 * for a new SETUP). EP0 is being reinitialized for that new control
> +	 * transfer; queuing a status stage here would race with it.
> +	 */
> +	if (req->status)
> +		return;
> +
> +	spin_lock_irqsave(&crg_udc->udc_lock, flags);
> +	crg_udc->setup_status =3D STATUS_STAGE_RECV;
> +	crg_udc_build_ep0_status(udc_ep, true, -EINPROGRESS, NULL, 0, 0);
> +	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +}

[Severity: High]
Does get_status_cmpl() conflict with crg_udc_ep0_req_complete() when a
USB_REQ_GET_STATUS data stage finishes?

When the data-stage TRB for getstatusrequest() completes with
CMPL_CODE_SUCCESS, crg_udc_handle_xfer_event() calls crg_udc_req_done()
followed immediately by crg_udc_ep0_req_complete().

Inside crg_udc_req_done(), get_status_cmpl() sets crg_udc->setup_status =3D
STATUS_STAGE_RECV and calls crg_udc_build_ep0_status(), which queues the
status TRB and appends crg_udc->status_req to udc_ep[0].queue.

When crg_udc_ep0_req_complete() runs next, crg_udc->setup_status is already
STATUS_STAGE_RECV instead of DATA_STAGE_XFER, so it hits the default branch
and resets crg_udc->setup_status to WAIT_FOR_SETUP while the status stage is
still pending on the ring and in udc_ep[0].queue. If another SETUP packet
arrives before the status TRB completes, crg_udc_handle_event() will see
WAIT_FOR_SETUP, skip crg_udc_abort_ep0_for_setup(), and corrupt
udc_ep[0].queue when queuing the next request.

Additionally, crg_udc_req_done() removes status_req from udc_ep[0].queue via
list_del_init(&udc_req->queue) and drops crg_udc->udc_lock before invoking
get_status_cmpl() (or set_sel_cmpl()). Because list_empty(&status_req->queu=
e)
is now true while udc_lock is dropped, can a concurrent getstatusrequest()
or setselrequest() acquire udc_lock and run kfree(udc_req_ptr->usb_req.buf)
and kzalloc_obj() concurrently with the unlocked kfree(req->buf) and
req->buf =3D NULL in get_status_cmpl() or set_sel_cmpl()?

[ ... ]

> +int crg_udc_prepare_for_setup(struct crg_gadget_dev *crg_udc)
> +{
> +	struct crg_udc_ep *udc_ep0_ptr;
> +
> +	dma_addr_t dqptaddr;
> +	u32 cmd_param0;
> +	u32 cmd_param1;
> +
> +	if (!crg_udc_is_event_rings_empty(crg_udc) ||
> +	    crg_udc->portsc_on_reconnecting =3D=3D 1)
> +		return -EBUSY;
> +
> +	udc_ep0_ptr =3D &crg_udc->udc_ep[0];
> +	/* If we reinit ep0 on bus reset, we just make ep0 dequeue pointer
> +	 * align with enqueue pointer, all remaining xfer trbs became dumb once
> +	 * which will not produce xfer event anymore.
> +	 *
> +	 * If we considering the opposite solution, we should wait all ep0 xfer
> +	 * trbs be completed(with some err complete code)
> +	 */
> +	if (crg_udc->reinit_ep0_on_bus_reset) {
> +		/* Complete any reqs on EP0 queue */
> +		crg_udc_ep_nuke(udc_ep0_ptr, -ESHUTDOWN);
> +
> +		/* context related ops */
> +		dqptaddr =3D crg_udc_tran_trb_virt_to_dma(udc_ep0_ptr,
> +							udc_ep0_ptr->enq_pt);
> +		if (dma_mapping_error(crg_udc->dev, dqptaddr))
> +			return -EIO;
> +		cmd_param0 =3D
> +			(lower_32_bits(dqptaddr) & CRG_CMD0_0_DQPTRLO_MASK) |
> +			FIELD_PREP(CRG_CMD0_0_DCS_MASK, udc_ep0_ptr->pcs);
> +		cmd_param1 =3D upper_32_bits(dqptaddr);
> +		if (crg_udc_issue_command(crg_udc, CRG_CMD_INIT_EP0, cmd_param0,
> +					  cmd_param1))
> +			return -EIO;
> +
> +		udc_ep0_ptr->deq_pt =3D udc_ep0_ptr->enq_pt;
> +		udc_ep0_ptr->tran_ring_full =3D false;
> +	} else {

[Severity: Medium]
In crg_udc_prepare_for_setup(), is it safe to call crg_udc_ep_nuke() before
stopping EP0 or issuing CRG_CMD_INIT_EP0?

crg_udc_ep_nuke() unmaps the DMA buffers and drops crg_udc->udc_lock while
giving back requests to completion callbacks before CRG_CMD_INIT_EP0 updates
the hardware dequeue pointer.

Furthermore, because crg_udc->ep0_state is not set to EP0_STATE_ABORTING
while udc_lock is dropped during crg_udc_ep_nuke(), a concurrent
crg_udc_ep_queue() on EP0 could enqueue new TRBs and add a request to
udc_ep0_ptr->queue, which would then be skipped in hardware when
CRG_CMD_INIT_EP0 sets the dequeue pointer to udc_ep0_ptr->enq_pt and
udc_ep0_ptr->deq_pt =3D udc_ep0_ptr->enq_pt. Unlike crg_udc_init_ep0() and
crg_udc_abort_ep0_for_setup(), this path also does not restore
udc_ep0_ptr->ep_state to EP_STATE_RUNNING.

[ ... ]

> +static void set_sel_cmpl(struct usb_ep *ep, struct usb_request *req)
> +{
> +	struct crg_udc_ep *udc_ep;
> +	struct crg_gadget_dev *crg_udc;
> +	struct crg_sel_value *sel_value;
> +
> +	udc_ep =3D container_of(ep, struct crg_udc_ep, usb_ep);
> +	crg_udc =3D udc_ep->crg_udc;
> +
> +	if (req->buf) {
> +		if (!req->status && req->actual >=3D sizeof(*sel_value)) {
> +			sel_value =3D req->buf;
> +			crg_udc->sel_value.u2_pel_value =3D
> +				le16_to_cpu(sel_value->u2_pel_value);
> +			crg_udc->sel_value.u2_sel_value =3D
> +				le16_to_cpu(sel_value->u2_sel_value);
> +			crg_udc->sel_value.u1_pel_value =3D sel_value->u1_pel_value;
> +			crg_udc->sel_value.u1_sel_value =3D sel_value->u1_sel_value;
> +		}
> +
> +		kfree(req->buf);
> +		req->buf =3D NULL;
> +	}
> +}

[Severity: Medium]
Does set_sel_cmpl() parse the 6-byte USB_REQ_SET_SEL payload in the wrong
field order?

Per USB 3.2 Section 9.4.12 and struct usb_set_sel_req in
include/uapi/linux/usb/ch9.h, the wire layout is u1_sel (u8), u1_pel (u8),
u2_sel (__le16), and u2_pel (__le16).

However, set_sel_cmpl() casts req->buf to struct crg_sel_value, which is
defined in drivers/usb/gadget/udc/crg/crg-udc.h in the reverse order:

struct crg_sel_value {
	u16 u2_pel_value;
	u16 u2_sel_value;
	u8 u1_pel_value;
	u8 u1_sel_value;
};

This reads u1_sel and u1_pel into u2_pel_value, reads u2_pel into
u1_pel_value and u1_sel_value, and passes host-endian u16 members to
le16_to_cpu(). Also, crg_udc->sel_value is modified here without holding
crg_udc->udc_lock.

[ ... ]

> +static void setaddressrequest(struct crg_gadget_dev *crg_udc, u16 value,
> +			      u16 index, u16 length)
> +{
> +	int status =3D -EINPROGRESS;
> +	u8 status_set_addr =3D 0;
> +
> +	if (value > 127 || index !=3D 0 || length !=3D 0) {
> +		status =3D -EINVAL;
> +		goto set_address_error;
> +	}
> +
> +	if ((crg_udc->device_state =3D=3D USB_STATE_DEFAULT && value !=3D 0) ||
> +	    crg_udc->device_state =3D=3D USB_STATE_ADDRESS) {
> +		u32 param0;
> +
> +		param0 =3D FIELD_PREP(CRG_CMD2_0_DEV_ADDR_MASK, value);
> +		if (crg_udc_issue_command(crg_udc, CRG_CMD_SET_ADDR, param0,
> +					  0)) {
> +			status =3D -EIO;
> +		} else {
> +			crg_udc->dev_addr =3D value;
> +			status_set_addr =3D 1;
> +		}
> +	} else {
> +		status =3D -EINVAL;
> +	}
> +
> +set_address_error:
> +	dev_dbg(crg_udc->dev, "crg_udc_build_ep0_status for Address Device\n");
> +
> +	crg_udc->setup_status =3D STATUS_STAGE_XFER;
> +	crg_udc->setup_fn_call_back =3D &set_address_cmpl;
> +	crg_udc_build_ep0_status(&crg_udc->udc_ep[0], true, status, NULL,
> +				 status_set_addr, status !=3D -EINPROGRESS);
> +}

[Severity: Medium]
Should setaddressrequest() allow value =3D=3D 0 when crg_udc->device_state =
is
USB_STATE_DEFAULT, and avoid registering set_address_cmpl on error?

Per USB 2.0/3.2 Section 9.4.6, a device in the Default state must accept
SET_ADDRESS(0), whereas the check above rejects value =3D=3D 0 in
USB_STATE_DEFAULT with -EINVAL.

In addition, when setaddressrequest() fails validation or
crg_udc_issue_command() fails, jumping to set_address_error still sets
crg_udc->setup_fn_call_back =3D &set_address_cmpl and leaves
udc_ep[0].ep_state as EP_STATE_RUNNING instead of EP_STATE_HALTED.

> +
> +static bool setfeaturesrequest(struct crg_gadget_dev *crg_udc, u8 reques=
t_type,
> +			       u8 b_request, u16 value, u16 index, u16 length,
> +			       unsigned long *flags)
> +{
> +	int status =3D -EINPROGRESS;
> +	u8 dci;
> +	struct crg_udc_ep *udc_ep_ptr;
> +	u32 tmp;
> +	u32 set_feat =3D 0;
> +	struct crg_uccr __iomem *uccr =3D crg_udc->uccr;
> +
> +	if (length !=3D 0) {
> +		status =3D -EINVAL;
> +		goto set_feature_error;
> +	}
> +
> +	if (crg_udc->device_state =3D=3D USB_STATE_DEFAULT) {
> +		status =3D -EINVAL;
> +		goto set_feature_error;
> +	}

[Severity: Medium]
Does rejecting USB_STATE_DEFAULT here prevent USB_DEVICE_TEST_MODE from ever
working in the Default state?

Further down in the USB_DEVICE_TEST_MODE case, the code checks:

	if (b_request !=3D USB_REQ_SET_FEATURE ||
	    crg_udc->gadget.speed !=3D USB_SPEED_HIGH ||
	    crg_udc->device_state < USB_STATE_DEFAULT ||
	    ...)

Per USB 2.0 Section 9.4.9, SetFeature(Test_Mode) must be supported in the
Default, Address, and Configured states, but the early check for
crg_udc->device_state =3D=3D USB_STATE_DEFAULT stalls it before reaching the
USB_DEVICE_TEST_MODE handler.

[ ... ]

> +	} else if ((request_type & (USB_RECIP_MASK | USB_TYPE_MASK)) =3D=3D
> +		   (USB_RECIP_INTERFACE | USB_TYPE_STANDARD)) {
> +		if (crg_udc->device_state !=3D USB_STATE_CONFIGURED) {
> +			dev_err(crg_udc->dev,
> +				"interface u12 enable fail, usb state=3D%d\n",
> +				crg_udc->device_state);
> +			status =3D -EINVAL;
> +			goto set_feature_error;
> +		}
> +
> +		/* Suspend Option */
> +		if (value !=3D USB_INTRF_FUNC_SUSPEND) {
> +			status =3D -EINVAL;
> +			goto set_feature_error;
> +		}
> +
> +		if (!(index & USB_INTR_FUNC_SUSPEND_OPT_MASK &
> +		      USB_INTRF_FUNC_SUSPEND_LP)) {
> +			status =3D -EINVAL;
> +			goto set_feature_error;
> +		}
> +
> +		if (index & USB_INTRF_FUNC_SUSPEND_RW)
> +			dev_dbg(crg_udc->dev, "Interface En Remote Wakeup\n");
> +		else
> +			dev_dbg(crg_udc->dev, "Interface Dis RemoteWakeup\n");
> +
> +		/* Do not need to return status stage here
> +		 * Pass to composite gadget driver to process
> +		 * the request
> +		 */
> +		return false;
> +	}
> +
> +	crg_udc->setup_status =3D STATUS_STAGE_XFER;
> +	crg_udc_build_ep0_status(&crg_udc->udc_ep[0], true, status, NULL, 0, 0);
> +	return true;
> +
> +set_feature_error:
> +	crg_udc_set_ep0_halt(crg_udc);
> +	return true;
> +}

[Severity: Medium]
In setfeaturesrequest(), doesn't the check:

		if (!(index & USB_INTR_FUNC_SUSPEND_OPT_MASK &
		      USB_INTRF_FUNC_SUSPEND_LP)) {
			status =3D -EINVAL;
			goto set_feature_error;
		}

stall EP0 whenever the Low Power Suspend bit (USB_INTRF_FUNC_SUSPEND_LP) is
cleared? Per USB 3.2 Section 9.4.9 and composite_setup(), the host clears
function suspend or disables function remote wakeup by sending
SetFeature(FUNCTION_SUSPEND) with LP=3D0 or ClearFeature(FUNCTION_SUSPEND)
with wIndex=3D0, both of which have USB_INTRF_FUNC_SUSPEND_LP =3D=3D 0.

Also, because neither crg_udc_handle_setup_pkt() nor setfeaturesrequest()
verifies that (request_type & USB_DIR_IN) =3D=3D USB_DIR_OUT, and the recip=
ient
if/else-if chain has no final else branch, any SET_FEATURE or CLEAR_FEATURE
request targeting USB_RECIP_OTHER (or with USB_DIR_IN set) falls through to
crg_udc_build_ep0_status() and is ACKed instead of stalled.

[ ... ]

> +void crg_udc_handle_setup_pkt(struct crg_gadget_dev *crg_udc,
> +			      struct usb_ctrlrequest *setup_pkt, u8 setup_tag,
> +			      unsigned long *flags)
> +{
> +	u16 w_value =3D le16_to_cpu(setup_pkt->wValue);
> +	u16 w_index =3D le16_to_cpu(setup_pkt->wIndex);
> +	u16 w_length =3D le16_to_cpu(setup_pkt->wLength);
> +	struct usb_gadget_driver *driver;
> +	u32 tmp;
> +
> +	trace_crg_udc_ctrl_req(setup_pkt);
> +
> +	/* EP0 come backs to running when new setup packet comes */
> +	crg_udc->udc_ep[0].ep_state =3D EP_STATE_RUNNING;
> +
> +	crg_udc->setup_tag =3D setup_tag;
> +	crg_udc->setup_status =3D SETUP_PKT_PROCESS_IN_PROGRESS;
> +	crg_udc->setup_fn_call_back =3D NULL;
> +
> +	if ((setup_pkt->bRequestType & USB_TYPE_MASK) =3D=3D USB_TYPE_STANDARD)=
 {
> +		switch (setup_pkt->bRequest) {
> +		case USB_REQ_GET_STATUS:

[ ... ]

> +		case USB_REQ_SET_ADDRESS:
> +			if (setup_pkt->bRequestType !=3D
> +			    (USB_DIR_OUT | USB_RECIP_DEVICE |
> +			     USB_TYPE_STANDARD)) {
> +				crg_udc_set_ep0_halt(crg_udc);
> +				return;
> +			}
> +
> +			setaddressrequest(crg_udc, w_value, w_index, w_length);
> +			return;

[ ... ]

> +	driver =3D crg_udc->async_callbacks ? crg_udc->gadget_driver : NULL;
> +	spin_unlock_irqrestore(&crg_udc->udc_lock, *flags);
> +
> +	/*
> +	 * Make sure any reset notification queued by
> +	 * crg_udc_handle_port_status() has actually run before this SETUP
> +	 * (which may be SET_CONFIGURATION) reaches the function driver.
> +	 * Otherwise udc_reset_work's usb_gadget_udc_reset() could run after
> +	 * the new configuration is already active and tear it back down.
> +	 */
> +	flush_work(&crg_udc->udc_reset_work);
> +
> +	if (!driver || driver->setup(&crg_udc->gadget, setup_pkt) < 0) {

[Severity: Medium]
Can udc_reset_work race with USB_REQ_SET_ADDRESS or with disabling
async_callbacks in crg_udc_handle_setup_pkt()?

Because USB_REQ_SET_ADDRESS (and other UDC-handled standard requests)
returns early before flush_work(&crg_udc->udc_reset_work), a post-reset
SET_ADDRESS can complete and transition crg_udc->device_state and
gadget->state to USB_STATE_ADDRESS via set_address_cmpl() while
udc_reset_work is still pending. When udc_reset_work subsequently executes
usb_gadget_udc_reset(), it resets gadget->state back to USB_STATE_DEFAULT,
leaving gadget->state out of sync with crg_udc->device_state.

Also, driver is read from crg_udc->async_callbacks ? crg_udc->gadget_driver
: NULL before dropping udc_lock and calling
flush_work(&crg_udc->udc_reset_work). If crg_gadget_async_callbacks() sets
async_callbacks to false while flush_work() is sleeping, driver->setup()
will still be called using the stale local pointer.

[ ... ]

> +int crg_udc_queue_ctrl(struct crg_udc_ep *udc_ep_ptr,
> +		       struct crg_udc_request *udc_req_ptr,
> +		       u32 num_of_trbs_needed)
> +{

[ ... ]

> +			u8 original_pcs =3D udc_ep_ptr->pcs;
> +
> +			for (i =3D 0; i < num_of_trbs_needed; i++) {
> +				p_trb =3D enq_pt;
> +				transfer_length =3D crg_udc_trb_chunk_len(
> +					trb_dma, remaining);
> +				ioc =3D (i =3D=3D num_of_trbs_needed - 1);
> +				azp =3D ioc && need_zlp;
> +				crg_udc_setup_datastage_trb(
> +					p_trb, trb_dma,
> +					i =3D=3D 0 ? (original_pcs ^ 1) :
> +						 udc_ep_ptr->pcs,
> +					transfer_length,
> +					num_of_trbs_needed - i - 1, ioc, azp,
> +					dir, setup_tag);
> +				udc_req_ptr->all_trbs_queued =3D 1;
> +				trb_dma +=3D transfer_length;
> +				remaining -=3D transfer_length;
> +				enq_pt++;

[Severity: Medium]
When num_of_trbs_needed > 1 in crg_udc_queue_ctrl() (for example, when an
EP0 DMA buffer crosses a 64 KB CRG_UDC_TRB_MAX_BUFFER_SIZE boundary),
shouldn't TRB_CHAIN_BIT_MASK be set on the non-final TRBs (!ioc)?

crg_udc_setup_datastage_trb() never sets TRB_CHAIN_BIT_MASK in p_trb->dw3,
unlike crg_udc_queue_trbs() which sets chain_bit =3D (i < count - 1), so the
controller will treat each TRB chunk as an unchained standalone TD rather
than a single chained data-stage TD.

[ ... ]

> +				}
> +			}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-axiado-ax3=
000-usb-device-controller-v3-0-3012ecfc0a93@axiado.com?part=3D4
