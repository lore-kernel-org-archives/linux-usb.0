Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793350253;
	b=iB/YlltZyGiGUh4P1Slx1jFGA2EGa90Y52+YNNim1cilCdoxL5xhiBA5KrTe1Et3Bsso
	 AVx+lAwjdK4PDy1eKNZD1z3Ds5g4xrhjjYzMvPmrRHMbKVjapErllkdv4M6/BNgQeyNvg
	 2EguU3POQUWkOmez3zkuhq4ICm1IGgUkpWFAXAtfJKSzDwsZK9IxPvImtbqxBa6pjUL8r
	 dcCvH/eIHF3G+mzN355Z5wxL3D1f5OBMGIbZ9xeaMheMSBkI2CRgdbNv6E+XfEC5I2aTo
	 mvr+a9p1ff4NcuG5Qjw3hDGV5iZwZP2VRWiVyYdMmZ3oPYFeg/VTpO1XdsTFb0JpF5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793350253;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ceARP0/A73x2sqy2/yO4TeMbOAf795kM3YYLmn/b4Yg=;
	b=L7+txotYVR9TFvFNOyg+kGaa0rotTXNvONgfYAxGbOsh9ab5EEDDFj+TFeQCEAL1Xk2a
	 PtN9ntr0aKKKyEtlwJOd5M5efcLMDvg6mIRYgr6SSrGZscJCUMNDpzih6mSqfWnOpTcxN
	 oGDPHJBdbiWi6lsC3r9Ip41yDfdjT53WFyijw/9yvDTAPOwosetU67H9rFYcqj+VY+zi3
	 A9TMerkC5wLtqGn9V3RYNTZF1GvdKac09S6jBg7R81BJXREwOic1/X7EFXVwISSWcFzIY
	 DhI3hPUVNfn0iloKkG+1PdEbIQs1THh41bX0wpjhoPO5L/GM1H/eSvK91BqPDC800pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MJJO+99g;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD031606A327;
	Fri, 30 Oct 2026 08:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MJJO+99g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 125A71F00A02;
	Fri, 30 Oct 2026 08:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793350252;
	bh=ceARP0/A73x2sqy2/yO4TeMbOAf795kM3YYLmn/b4Yg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MJJO+99g0MgHFsKXTidW8XDll0C/oNAEfK1+SpjJr2tsLzQIKTZbeq9NfTZT8GZOM
	 CTKNCXD2nE+A/VTCxThL/oL8CROjyN4rnaeBDSvHDzPhtKjocGjl7hOM3hIvcrqwU0
	 iqNCHF7tjF6xSJsF9EM5MSLQCYreVYHm4umlRPVKumrqAAPvXGnPfPhQrc3DPqDRyP
	 fsQMKbnsM5OPuzadWuYpxgvpSHI7pmhchXLCt517uSr6AyIk9EL2vhfaGlnNCEUwvz
	 BhSKxf5yDZJKegJH3J7bmRphdf+l9EA7CAVUkmtDTOdsLjITSI/h4v3mHwHyKevkzk
	 D/yMUfwmGbNRg==
Message-ID: <sashiko-outbox-190716@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/6] usb: gadget: udc: crg: Add gadget and endpoint
 operations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261030-axiado-ax3000-usb-device-controller-v4-5-c5267b36a777@axiado.com>
References: <20261030-axiado-ax3000-usb-device-controller-v4-0-c5267b36a777@axiado.com>
 <20261030-axiado-ax3000-usb-device-controller-v4-5-c5267b36a777@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 08:50:51 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 22 potential issue=
(s) to consider:
- [High] usb: gadget: crg: premature dequeue pointer update in crg_udc_hand=
le_xfer_event()
- [High] usb: gadget: crg: sleeping DMA allocation and free in crg_udc_ep_e=
nable()
- [High] usb: gadget: crg: stale first_trb on multi-TD requests in crg_udc_=
queue_trbs()
- [High] usb: gadget: crg: broken zero-length EP0 data stage and dequeue ha=
ndling
- [High] usb: gadget: crg: crg_udc_ep_nuke() hides requests on stack list a=
cross unlock
- [High] usb: gadget: crg: corrupt deq_pt on stale events in crg_udc_handle=
_xfer_event()
- [High] usb: gadget: crg: premature giveback before halt in crg_udc_handle=
_xfer_event()
- [High] usb: gadget: crg: silent no-op when stalling EP0 in crg_udc_ep_hal=
t()
- [High] usb: gadget: crg: crg_udc_reinit() clears usb_ep.enabled before re=
set work
- [High] usb: gadget: crg: lock drop mid-loop in crg_udc_reinit() leaves EP=
s running
- [High] usb: gadget: crg: DMA unmap on ep_running poll timeout in crg_udc_=
ep_halt()
- [High] usb: gadget: udc: crg: lost port events in crg_udc_handle_port_sta=
tus()
- [High] usb: gadget: udc: crg: premature SETUP handling in crg_udc_handle_=
event()
- [High] usb: gadget: udc: crg: stuck EP0_STATE_ERROR in crg_udc_handle_eve=
nt()
- [High] usb: gadget: udc: crg: stuck EP_STATE_STOPPED in crg_udc_ep_dequeu=
e()
- [High] usb: gadget: udc: crg: rejected halted/stopped queue in crg_udc_ep=
_queue()
- [Medium] usb: gadget: crg: crg_udc_ep_queue() rejects 0-length requests w=
ith NULL buf
- [Medium] usb: gadget: crg: missing IN queue check in crg_udc_ep_set_wedge=
()
- [Medium] usb: gadget: crg: missing usb_ep.maxpacket update in crg_udc_ep_=
enable()
- [Medium] usb: gadget: udc: crg: unrolled ring state on error in crg_udc_q=
ueue_trbs()
- [Medium] usb: gadget: udc: crg: clobbered tran_ring_full in crg_udc_handl=
e_xfer_event()
- [Medium] usb: gadget: crg: missing EP0 state revalidation in crg_udc_ep_q=
ueue()
--

commit c0163bd83b42f6c6c4258f527a05306a12934416
Author: Petar Stepanovic <pstepanovic@axiado.com>

usb: gadget: udc: crg: Add gadget and endpoint operations

This patch implements the usb_gadget_ops and usb_ep_ops callbacks along with
transfer ring, endpoint state, event, and port status handling for the Axia=
do
AX3000/AX3005 UDC driver.

> diff --git a/drivers/usb/gadget/udc/crg/crg-udc-gadget.c b/drivers/usb/ga=
dget/udc/crg/crg-udc-gadget.c
> new file mode 100644
> index 0000000000000..8c52f8856490a
> --- /dev/null
> +++ b/drivers/usb/gadget/udc/crg/crg-udc-gadget.c

[ ... ]

> +static int crg_udc_ep_dequeue(struct usb_ep *_ep, struct usb_request *_r=
eq)
> +{
> +	struct crg_udc_ep *udc_ep_ptr;
> +	struct crg_gadget_dev *crg_udc;
> +	struct crg_uccr __iomem *uccr;
> +	struct crg_udc_request *udc_req =3D NULL;
> +	struct crg_udc_request *iter;
> +	struct crg_ep_cx *p_ep_cx;
> +	struct crg_transfer_trb *pause_pt;
> +	enum crg_ep_state old_ep_state;
> +	u32 tmp, deq_pt_lo, deq_pt_hi;
> +	dma_addr_t dq_pt_addr;
> +	u8 dci;
> +	bool found =3D false;
> +	u32 generation;
> +	unsigned long flags;
> +	const struct usb_endpoint_descriptor *old_desc;
> +	u32 event_generation;
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
> +	if (crg_udc->resetting) {
> +		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +		return -ESHUTDOWN;
> +	}
> +	old_ep_state =3D udc_ep_ptr->ep_state;
> +	old_desc =3D udc_ep_ptr->desc;
> +	event_generation =3D crg_udc->udc_event[0].generation;
> +	generation =3D udc_ep_ptr->generation;
> +
> +	list_for_each_entry(iter, &udc_ep_ptr->queue, queue) {
> +		if (&iter->usb_req =3D=3D _req) {
> +			udc_req =3D iter;
> +			found =3D true;
> +			break;
> +		}
> +	}
> +
> +	if (!found) {
> +		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +		return -EINVAL;
> +	}
> +
> +	if (!udc_req->first_trb) {
> +		crg_udc_req_done(udc_ep_ptr, udc_req, -ECONNRESET);
> +		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +		return 0;
> +	}
> +
> +	if (dci =3D=3D 0) {
> +		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +		return -EINVAL;
> +	}

[Severity: High]
What happens when a gadget driver dequeues its EP0 request in
crg_udc_ep_dequeue(), for instance during __composite_unbind()?

If the request was queued through crg_udc_build_ep0_status(), first_trb is
never assigned. For a newly allocated request where first_trb is NULL,
crg_udc_ep_dequeue() completes and unlinks the request while its status TRB
is still live on the EP0 hardware ring without stopping EP0 DMA.

Conversely, if the EP0 request is a data-stage request (or a reused request
with a stale non-NULL first_trb), crg_udc_ep_dequeue() hits the dci =3D=3D 0
check and returns -EINVAL without stopping EP0 or removing the request from
udc_ep[0].queue. Doesn't that lead to a use-after-free when the caller
immediately frees the usb_request on unbind?

> +	if (old_ep_state =3D=3D EP_STATE_RUNNING) {
> +		int ret =3D crg_udc_issue_command(crg_udc, CRG_CMD_STOP_EP,
> +						BIT(dci), 0);
> +
> +		if (ret) {
> +			spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +			return ret;
> +		}
> +		if (readl_poll_timeout_atomic(&uccr->ep_running, tmp,
> +					      !(tmp & BIT(dci)), 10, 10000)) {
> +			spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +			return -ETIMEDOUT;
> +		}
> +		udc_ep_ptr->ep_state =3D EP_STATE_STOPPED;
> +	}
> +
> +	p_ep_cx =3D &crg_udc->p_epcx[dci - 2];
> +	deq_pt_lo =3D le32_to_cpu(p_ep_cx->dw2) & EP_CX_TR_DQPT_LO_MASK;
> +	deq_pt_hi =3D le32_to_cpu(p_ep_cx->dw3);
> +	dq_pt_addr =3D (u64)deq_pt_lo | ((u64)deq_pt_hi << 32);
> +	pause_pt =3D crg_udc_tran_trb_dma_to_virt(udc_ep_ptr, dq_pt_addr);
> +	if (!pause_pt) {
> +		if (old_ep_state =3D=3D EP_STATE_RUNNING) {
> +			udc_ep_ptr->ep_state =3D EP_STATE_RUNNING;
> +			crg_udc_knock_doorbell(crg_udc, dci);
> +		}
> +		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +		return -EIO;
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
> +		udc_ep_ptr->tran_ring_full =3D false;
> +		crg_udc_req_done(udc_ep_ptr, udc_req, -ECONNRESET);
> +	}
> +
> +	if (old_ep_state =3D=3D EP_STATE_RUNNING && !crg_udc->resetting &&
> +	    udc_ep_ptr->desc =3D=3D old_desc &&
> +	    event_generation =3D=3D crg_udc->udc_event[0].generation &&
> +	    udc_ep_ptr->generation =3D=3D generation &&
> +	    udc_ep_ptr->ep_state =3D=3D EP_STATE_STOPPED) {
> +		udc_ep_ptr->ep_state =3D EP_STATE_RUNNING;
> +		udc_ep_ptr->tran_ring_full =3D false;
> +		if (crg_udc_queue_pending_trbs(udc_ep_ptr))
> +			udc_ep_ptr->tran_ring_full =3D true;
> +		crg_udc_knock_doorbell(crg_udc, dci);
> +	}

[Severity: High]
Doesn't this leave udc_ep_ptr->ep_state stuck in EP_STATE_STOPPED if
crg_udc_epcx_update_dqptr() fails, and also reject any requests queued from
the completion callback during crg_udc_req_done()?

First, if crg_udc_epcx_update_dqptr(udc_ep_ptr) fails, crg_udc_ep_dequeue()
unlocks and returns -EIO without restoring udc_ep_ptr->ep_state to
EP_STATE_RUNNING (unlike the !pause_pt error path above), leaving the
endpoint permanently wedged in EP_STATE_STOPPED.

Second, crg_udc_req_done() is called while udc_ep_ptr->ep_state is still
EP_STATE_STOPPED, before EP_STATE_RUNNING is restored. The comment notes th=
at
the completion callback may add requests while udc_lock is dropped, but
crg_udc_ep_queue() rejects any request when ep_state !=3D EP_STATE_RUNNING =
with
-ESHUTDOWN.

[ ... ]

> +static int crg_udc_ep_enable(struct usb_ep *ep,
> +			     const struct usb_endpoint_descriptor *desc)
> +{

[ ... ]

> +	/* Leave the old allocation valid until its replacement is ready.
> +	 * Other ep operations reject the configuring endpoint.
> +	 */
> +	if (!udc_ep->tran_ring_info.cpu_addr ||
> +	    udc_ep->tran_ring_info.len !=3D len) {
> +		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +		new_ring =3D dma_alloc_coherent(crg_udc->dev, len, &new_dma,
> +					      GFP_KERNEL);
> +		spin_lock_irqsave(&crg_udc->udc_lock, flags);
> +		if (!new_ring) {
> +			ret =3D -ENOMEM;
> +			goto err;
> +		}
> +		if (!crg_udc->gadget_driver || crg_udc->resetting ||
> +		    udc_ep->ep_state !=3D EP_STATE_DISABLED ||
> +		    udc_ep->desc !=3D desc) {
> +			ret =3D -ESHUTDOWN;
> +			goto err;
> +		}
> +		old_ring =3D udc_ep->tran_ring_info.cpu_addr;
> +		old_dma =3D udc_ep->tran_ring_info.dma_addr;
> +		old_len =3D udc_ep->tran_ring_info.len;
> +		udc_ep->tran_ring_info.cpu_addr =3D new_ring;
> +		udc_ep->tran_ring_info.dma_addr =3D new_dma;
> +		udc_ep->tran_ring_info.len =3D len;
> +		new_ring =3D NULL;
> +	}
> +
> +	udc_ep->first_trb =3D udc_ep->tran_ring_info.cpu_addr;
> +	udc_ep->last_trb =3D udc_ep->first_trb + ring_size - 1;
> +	memset(udc_ep->first_trb, 0, len);
> +	dma_wmb();
> +	crg_udc_setup_link_trb(udc_ep->last_trb, true,
> +				 udc_ep->tran_ring_info.dma_addr);
> +	udc_ep->enq_pt =3D udc_ep->first_trb;
> +	udc_ep->deq_pt =3D udc_ep->first_trb;
> +	udc_ep->pcs =3D 1;
> +	udc_ep->tran_ring_full =3D false;
> +	ret =3D crg_udc_epcx_setup(udc_ep);
> +	if (ret)
> +		goto err;
> +	param0 =3D BIT(udc_ep->dci);
> +	ret =3D crg_udc_issue_command(crg_udc, CRG_CMD_CONFIG_EP, param0, 0);
> +	if (ret)
> +		goto err;
> +
> +	udc_ep->generation++;
> +	udc_ep->wedge =3D false;
> +	udc_ep->usb_ep.enabled =3D 1;
> +	udc_ep->ep_state =3D EP_STATE_RUNNING;
> +	udc_ep->configuring =3D false;
> +	crg_udc->num_enabled_eps++;
> +	if (crg_udc->device_state =3D=3D USB_STATE_ADDRESS)
> +		crg_udc->device_state =3D USB_STATE_CONFIGURED;
> +	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +	if (old_ring)
> +		dma_free_coherent(crg_udc->dev, old_len, old_ring, old_dma);
> +	return 0;
> +
> +err:
> +	udc_ep->desc =3D NULL;
> +	udc_ep->comp_desc =3D NULL;
> +	udc_ep->configuring =3D false;
> +	/* Keep a valid ring allocation for a later retry. */
> +	udc_ep->ep_state =3D EP_STATE_DISABLED;
> +	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +	if (new_ring)
> +		dma_free_coherent(crg_udc->dev, len, new_ring, new_dma);
> +	if (old_ring)
> +		dma_free_coherent(crg_udc->dev, old_len, old_ring, old_dma);
> +	return ret;

[Severity: High]
Can crg_udc_ep_enable() sleep or call dma_free_coherent() here?

The USB gadget API allows usb_ep_enable() to be called in atomic context. F=
or
example:

  composite_setup() [holds spin_lock(&cdev->lock)]
    -> set_config() / f->set_alt()
      -> gserial_connect() / ffs_func_eps_enable() [holds spin_lock_irqsave=
()]
        -> usb_ep_enable()
          -> crg_udc_ep_enable()

Dropping crg_udc->udc_lock with spin_unlock_irqrestore() only restores the
interrupt state at entry to crg_udc_ep_enable() and does not release spinlo=
cks
held by the caller. Calling dma_alloc_coherent(..., GFP_KERNEL) sleeps while
caller spinlocks are held, and calling dma_free_coherent() when interrupts
were disabled by the caller triggers WARN_ON(irqs_disabled()) in
dma_free_attrs().

[Severity: Medium]
Should crg_udc_ep_enable() also update udc_ep->usb_ep.maxpacket to
usb_endpoint_maxp(desc)?

crg_ep_struct_setup() initializes ep->usb_ep.maxpacket to CRG_MAX_PACKET_SI=
ZE
(1024), and usb_ep_enable() in udc/core.c does not update ep->maxpacket. Wh=
en
a gadget driver enables an endpoint without calling config_ep_by_speed() (s=
uch
as gadgetfs, raw_gadget, or f_printer), udc_ep->usb_ep.maxpacket stays at 1=
024
even for 512-byte HS or 64-byte FS endpoints, causing crg_udc_queue_trbs() =
to
miscalculate need_zlp via !(usb_req->length % udc_ep_ptr->usb_ep.maxpacket).

> +out:
> +	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +	return ret;
> +}
> +
> +void crg_udc_ep_nuke(struct crg_udc_ep *udc_ep, int status)
> +{
> +	struct crg_udc_request *req;
> +	struct list_head nuke_list;
> +
> +	list_replace_init(&udc_ep->queue, &nuke_list);
> +
> +	while (!list_empty(&nuke_list)) {
> +		req =3D list_first_entry(&nuke_list, struct crg_udc_request,
> +				       queue);
> +
> +		crg_udc_req_done(udc_ep, req, status);
> +	}
> +}

[Severity: High]
Can moving all requests onto the stack-local nuke_list before dropping
udc_lock in crg_udc_req_done() cause a use-after-free?

While crg_udc->udc_lock is dropped during the first request's completion
callback, udc_ep->queue is already empty even though the remaining requests=
 on
nuke_list have not been given back yet. If that callback or another thread
calls usb_ep_dequeue() and usb_ep_free_request() on one of those remaining
requests, crg_udc_ep_dequeue() will not find it on udc_ep->queue and will
return -EINVAL immediately, allowing the caller to free the request while
crg_udc_ep_nuke() still holds it on nuke_list and dereferences it on the ne=
xt
iteration.

> +static int crg_udc_ep_queue(struct usb_ep *_ep, struct usb_request *_req,
> +			    gfp_t gfp_flags)
> +{
> +	struct crg_udc_request *udc_req_ptr;
> +	struct crg_udc_ep *udc_ep_ptr;
> +	struct crg_gadget_dev *crg_udc;
> +	enum dma_data_direction dma_data_dir;
> +	const struct usb_endpoint_descriptor *desc;
> +	unsigned long flags;
> +	int status;
> +	bool is_sg;
> +	u8 setup_tag =3D 0;
> +	u32 generation =3D 0;
> +
> +	if (!_ep || !_req)
> +		return -EINVAL;
> +
> +	udc_req_ptr =3D container_of(_req, struct crg_udc_request, usb_req);
> +	udc_ep_ptr =3D container_of(_ep, struct crg_udc_ep, usb_ep);
> +	crg_udc =3D udc_ep_ptr->crg_udc;
> +	is_sg =3D _req->num_sgs !=3D 0 && _req->length !=3D 0;
> +
> +	if (is_sg && !_req->sg)
> +		return -EINVAL;
> +	if (_req->stream_id)
> +		return -EOPNOTSUPP;
> +
> +	spin_lock_irqsave(&crg_udc->udc_lock, flags);
> +	/*
> +	 * A completion callback for an aborted EP0 transfer may requeue the
> +	 * same request. Reject EP0 requests while the previous control
> +	 * transfer is being aborted or EP0 is in an error state. EP0 becomes
> +	 * available again only after the new SETUP has been accepted and
> +	 * the EP0 transfer ring has been successfully reinitialized.
> +	 */
> +	if (udc_ep_ptr->dci =3D=3D 0 && crg_udc->ep0_state !=3D EP0_STATE_IDLE)=
 {
> +		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +		return -ECONNRESET;
> +	}
> +	if (!udc_ep_ptr->first_trb || !_req->complete ||
> +	    (!is_sg && !_req->buf) || !list_empty(&udc_req_ptr->queue)) {
> +		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +		return -EINVAL;
> +	}

[Severity: Medium]
Does checking (!is_sg && !_req->buf) reject valid zero-length requests when
_req->buf is NULL?

Because is_sg is false whenever _req->length =3D=3D 0, any 0-length request=
 with
_req->buf =3D=3D NULL (such as scatter-gather requests recycled for 0-length
submissions by uvcg_video_hw_submit()) will fail here with -EINVAL even tho=
ugh
_req->length =3D=3D 0 does not dereference or DMA-map _req->buf.

> +	if (crg_udc->resetting) {
> +		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +		return -ESHUTDOWN;
> +	}
> +	if (!udc_ep_ptr->desc) {
> +		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +		return -EINVAL;
> +	}
> +	desc =3D udc_ep_ptr->desc;
> +	if (udc_ep_ptr->ep_state !=3D EP_STATE_RUNNING ||
> +	    udc_ep_ptr->configuring) {
> +		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +		return -ESHUTDOWN;
> +	}

[Severity: High]
Should crg_udc_ep_queue() reject requests when udc_ep_ptr->ep_state is
EP_STATE_HALTED or EP_STATE_STOPPED?

Standard USB gadget function drivers (such as f_mass_storage) halt the bulk=
-in
endpoint and immediately call usb_ep_queue() to queue the CSW status packet
while the endpoint is still halted, waiting for the host to issue
CLEAR_FEATURE(ENDPOINT_HALT). In fact, crg_udc_ep_halt() checks
!list_empty(&udc_ep_ptr->queue) when clearing a halt to ring the doorbell f=
or
queued requests, and crg_udc_ep_dequeue() temporarily places the endpoint in
EP_STATE_STOPPED during giveback. Returning -ESHUTDOWN whenever ep_state !=
=3D
EP_STATE_RUNNING (here and in the post-mapping check below) prevents queuing
requests onto halted or paused endpoints.

> +	setup_tag =3D crg_udc->setup_tag;
> +	generation =3D udc_ep_ptr->generation;
> +
> +	if (usb_endpoint_xfer_control(udc_ep_ptr->desc) && is_sg) {
> +		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (usb_endpoint_xfer_control(udc_ep_ptr->desc) && !_req->length) {
> +		if (crg_udc->setup_status =3D=3D DATA_STAGE_XFER)
> +			crg_udc->setup_status =3D STATUS_STAGE_RECV;
> +		else
> +			crg_udc->setup_status =3D STATUS_STAGE_XFER;
> +		crg_udc_build_ep0_status(&crg_udc->udc_ep[0], false,
> +					 -EINPROGRESS, udc_req_ptr, 0, 0);
> +		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +		return 0;
> +	}

[Severity: High]
Doesn't this treat a 0-length EP0 Data Stage response (when the host's SETUP
had wLength > 0) as a Status Stage TRB?

When wLength > 0, crg_udc_handle_setup_pkt() sets crg_udc->setup_status to
DATA_STAGE_XFER or DATA_STAGE_RECV, and crg_udc_ep0_req_complete()
automatically queues the Status Stage after the Data Stage completes. If a
gadget driver queues a 0-byte response for the Data Stage, this branch
overwrites setup_status to STATUS_STAGE_RECV / STATUS_STAGE_XFER and calls
crg_udc_build_ep0_status(), queuing a TRB_TYPE_XFER_STATUS_STAGE TRB instead
of a 0-length TRB_TYPE_XFER_DATA_STAGE TRB.

Returning early here also skips crg_udc_clear_req_container(udc_req_ptr),
leaving stale first_trb/last_trb/all_trbs_queued fields if udc_req_ptr was
reused from a previous transfer.

> +	if (usb_endpoint_xfer_control(udc_ep_ptr->desc)) {
> +		if (crg_udc->setup_status =3D=3D DATA_STAGE_XFER ||
> +		    crg_udc->setup_status =3D=3D STATUS_STAGE_XFER) {
> +			dma_data_dir =3D DMA_TO_DEVICE;
> +		} else if (crg_udc->setup_status =3D=3D DATA_STAGE_RECV ||
> +			   crg_udc->setup_status =3D=3D STATUS_STAGE_RECV) {
> +			dma_data_dir =3D DMA_FROM_DEVICE;
> +		} else {
> +			spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +			return -EINVAL;
> +		}
> +	} else {
> +		dma_data_dir =3D usb_endpoint_dir_in(udc_ep_ptr->desc) ?
> +				       DMA_TO_DEVICE :
> +				       DMA_FROM_DEVICE;
> +	}
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
> +	    !list_empty(&udc_req_ptr->queue) || crg_udc->resetting ||
> +	    udc_ep_ptr->configuring ||
> +	    udc_ep_ptr->ep_state !=3D EP_STATE_RUNNING ||
> +	    udc_ep_ptr->generation !=3D generation ||
> +	    (udc_ep_ptr->dci =3D=3D 0 &&
> +	     (crg_udc->ep0_state !=3D EP0_STATE_IDLE ||
> +	      crg_udc->setup_tag !=3D setup_tag))) {

[Severity: Medium]
As reported by Sashiko on v3 [1], what happens if a USB bus reset occurs wh=
ile
udc_lock is dropped for DMA mapping of an EP0 request?

During a bus reset, crg_udc_reinit() and crg_udc_prepare_for_setup() reset
crg_udc->setup_status to WAIT_FOR_SETUP and reinitialize the EP0 ring, but
crg_udc_reinit() only increments udc_ep[i].generation for i >=3D 2 and leav=
es
udc_ep[0].generation and crg_udc->setup_tag unchanged. When crg_udc_ep_queu=
e()
reacquires udc_lock, these checks pass because setup_status is not
revalidated and udc_ep[0].generation was not bumped, allowing the stale EP0
request to be queued onto the EP0 ring while setup_status is WAIT_FOR_SETUP.

[ ... ]

> +static int crg_udc_ep_set_wedge(struct usb_ep *_ep)
> +{
> +	struct crg_udc_ep *udc_ep_ptr;
> +	int status;
> +	unsigned long flags =3D 0;
> +	struct crg_gadget_dev *crg_udc;
> +
> +	if (!_ep)
> +		return -EINVAL;
> +
> +	udc_ep_ptr =3D container_of(_ep, struct crg_udc_ep, usb_ep);
> +	crg_udc =3D udc_ep_ptr->crg_udc;
> +
> +	spin_lock_irqsave(&crg_udc->udc_lock, flags);
> +
> +	if (!udc_ep_ptr->desc) {
> +		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +		return -EINVAL;
> +	}
> +
> +	udc_ep_ptr->wedge =3D 1;
> +
> +	status =3D crg_udc_ep_halt(udc_ep_ptr, 1, 1, &flags);

[Severity: Medium]
Should crg_udc_ep_set_wedge() check for a non-empty queue on IN endpoints a=
nd
return -EAGAIN, just like crg_udc_ep_set_halt() does?

Without that check, calling usb_ep_set_wedge() on an IN endpoint with pendi=
ng
requests sets udc_ep_ptr->wedge =3D 1 and calls crg_udc_ep_halt(), which ha=
lts
the endpoint and (at SuperSpeed) aborts queued IN transfers via
crg_udc_ep_nuke(). Also, if crg_udc_ep_halt() returns an error,
udc_ep_ptr->wedge remains set to 1.

[ ... ]

> +static int crg_udc_queue_trbs(struct crg_udc_ep *udc_ep_ptr,
> +			      struct crg_udc_request *udc_req_ptr, bool b_isoc,
> +			      u32 xfer_ring_size, u32 num_trbs_needed,
> +			      u64 buffer_length)
> +{

[ ... ]

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
> +
> +	if (!count)
> +		return -ENOSPC;
> +
> +	td_size =3D count - 1;
> +
> +	if (is_sg && !udc_req_ptr->sg && crg_udc_sg_init(udc_req_ptr))
> +		return -EINVAL;
> +
> +	u8 original_pcs =3D udc_ep_ptr->pcs;
> +
> +	for (i =3D 0; i < count; i++) {

[ ... ]

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

[Severity: Medium]
If crg_udc_queue_trbs() returns an error after setting
udc_ep_ptr->tran_ring_full =3D true or partway through the TRB loop, doesn't
that leave the ring state inconsistent?

When 0 < num_trbs_ava < td_trbs, udc_ep_ptr->tran_ring_full is set to true
before crg_udc_sg_init() and before the loop; if an error occurs while the
ring was previously empty, tran_ring_full stays true with no TRBs queued, so
subsequent crg_udc_ep_queue() calls will never build TDs or ring the doorbe=
ll.
Similarly, if a later loop iteration fails after writing TRBs with active
cycle bits or toggling the Link TRB cycle bit and udc_ep_ptr->pcs,
udc_ep_ptr->enq_pt is not updated and those changes are not rolled back.

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
> +	udc_req_ptr->td_pending =3D true;
> +	if (buffer_length)
> +		udc_req_ptr->trbs_needed =3D num_trbs_needed - count;
> +	else
> +		udc_req_ptr->trbs_needed =3D 0;
> +
> +	/* Track the last TRB of the current TD, even for multi-TD requests. */
> +	if (udc_ep_ptr->enq_pt =3D=3D udc_ep_ptr->first_trb)
> +		udc_req_ptr->last_trb =3D udc_ep_ptr->last_trb - 1;
> +	else
> +		udc_req_ptr->last_trb =3D udc_ep_ptr->enq_pt - 1;

[Severity: High]
For a multi-TD request, why is udc_req_ptr->last_trb updated on every TD wh=
ile
udc_req_ptr->first_trb is only set when !udc_req_ptr->trbs_needed?

When the first TD of a multi-TD request completes in crg_udc_handle_xfer_ev=
ent()
and crg_udc_build_td() queues the next TD, udc_req_ptr->trbs_needed is
non-zero, so udc_req_ptr->first_trb remains pointing at the retired first TD
while udc_req_ptr->last_trb advances to the new TD.

Once udc_ep_ptr->enq_pt wraps around the transfer ring to or past that stale
first_trb, crg_udc_is_pointer_less_than(udc_req->first_trb, trb_pt, udc_ep)=
 in
is_request_dequeued() returns false for active TRBs, causing valid transfer
completion events to be treated as dequeued and dropped. It also causes
crg_udc_ep_dequeue() and crg_udc_actual_before() to misclassify the active =
TD
range.

> +	return 0;
> +}
> +
> +static int crg_udc_reinit(struct crg_gadget_dev *crg_udc)
> +{
> +	struct crg_uccr __iomem *uccr =3D crg_udc->uccr;
> +	u32 i, tmp;
> +	struct crg_udc_ep *udc_ep_ptr;
> +
> +	crg_udc->setup_status =3D WAIT_FOR_SETUP;
> +	/* Base on Figure 9-1, default USB_STATE is attached */
> +	crg_udc->device_state =3D USB_STATE_RECONNECTING;
> +
> +	/* halt all the endpoints */
> +
> +	/* disable all the endpoints */
> +	tmp =3D readl(&uccr->ep_enable);
> +	writel(tmp, &uccr->ep_enable);
> +	if (readl_poll_timeout_atomic(&uccr->ep_enable, tmp, !tmp, 1, 50)) {
> +		dev_dbg(crg_udc->dev,
> +			"timeout waiting for all endpoints to disable\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	for (i =3D 2; i < CRG_NUM_EP_CX; i++) {
> +		udc_ep_ptr =3D &crg_udc->udc_ep[i];
> +		udc_ep_ptr->usb_ep.enabled =3D 0;
> +		udc_ep_ptr->generation++;
> +		udc_ep_ptr->ep_state =3D EP_STATE_DISABLED;
> +		if (udc_ep_ptr->desc) {
> +			udc_ep_ptr->desc =3D NULL;
> +			udc_ep_ptr->comp_desc =3D NULL;
> +			crg_udc_ep_nuke(udc_ep_ptr, -ESHUTDOWN);
> +		}
> +		udc_ep_ptr->tran_ring_full =3D false;
> +		udc_ep_ptr->ep_state =3D EP_STATE_DISABLED;
> +	}
> +	crg_udc->num_enabled_eps =3D 0;

[Severity: High]
Doesn't clearing udc_ep_ptr->usb_ep.enabled =3D 0 and setting ep_state =3D
EP_STATE_DISABLED here in crg_udc_reinit() break gadget function teardown w=
hen
udc_reset_work runs on bus reset?

When a bus reset occurs while configured, crg_udc_handle_port_status() calls
crg_udc_reinit() first and then schedules udc_reset_work, which invokes
usb_gadget_udc_reset() -> composite_reset() -> reset_config() -> f->disable=
().
Standard USB function drivers (such as f_ecm, f_eem, f_rndis, f_ncm, f_acm,
and f_serial) check if (ep->enabled) in their ->disable() callbacks before
tearing down state and freeing requests, and crg_udc_ep_disable() also retu=
rns
-EINVAL if ep_state is already EP_STATE_DISABLED. Because usb_ep.enabled was
already cleared in crg_udc_reinit(), those function drivers will skip teard=
own
and leak requests across bus resets.

[Severity: High]
Also in this loop, crg_udc_ep_nuke() drops crg_udc->udc_lock around each
request's completion callback for endpoint i before endpoints i + 1 ..
CRG_NUM_EP_CX - 1 have been marked disabled in software.

While udc_lock is dropped during crg_udc_ep_nuke() on endpoint i, higher-
numbered endpoints still have ep_state =3D=3D EP_STATE_RUNNING and desc !=
=3D NULL
even though their hardware enable bits in uccr->ep_enable were just cleared,
allowing callbacks or concurrent threads to queue TRBs and ring doorbells on
disabled hardware endpoints. And if endpoint i is re-enabled while udc_lock=
 is
dropped, the assignments after crg_udc_ep_nuke() will overwrite its state b=
ack
to EP_STATE_DISABLED and reset crg_udc->num_enabled_eps to 0.

[ ... ]

> +int crg_udc_handle_port_status(struct crg_gadget_dev *crg_udc,
> +			       unsigned long *flags)
> +{
> +	struct crg_uccr __iomem *uccr =3D crg_udc->uccr;
> +	bool was_connected =3D crg_udc->connected;
> +	u32 portsc_val;
> +	u32 tmp;
> +	u32 speed;
> +	int ret;
> +
> +	/* handle Port Reset */
> +	portsc_val =3D readl(&uccr->portsc);
> +	trace_crg_udc_portsc(portsc_val);
> +	writel(portsc_val & CRG_U3DC_PORTSC_W1C_MASK, &uccr->portsc);
> +
> +	tmp =3D readl(&uccr->portsc);
> +
> +	if (portsc_val & CRG_U3DC_PORTSC_PRC) {
> +		tmp =3D readl(&uccr->portsc);
> +		if (tmp & CRG_U3DC_PORTSC_PRC) {
> +			dev_dbg(crg_udc->dev, "PRC is still set\n");
> +		} else if (tmp & CRG_U3DC_PORTSC_PR) {
> +			/* first port status change event for port reset */
> +			dev_dbg(crg_udc->dev,
> +				"PRC is not set, but PR is set\n");
> +		} else {
> +			if (FIELD_GET(CRG_U3DC_PORTSC_PLS_MASK, tmp) !=3D 0 ||
> +			    (!(tmp & CRG_U3DC_PORTSC_PED))) {
> +				dev_dbg(crg_udc->dev, "portsc=3D0x%x no PED\n",
> +					tmp);
> +				return 0;
> +			}

[ ... ]

> +	/* Connection changes must not mask independent link-state events. */
> +	if (portsc_val & CRG_U3DC_PORTSC_CSC) {
> +	tmp =3D readl(&uccr->portsc);
> +	if ((tmp & (CRG_U3DC_PORTSC_CCS | CRG_U3DC_PORTSC_PP)) =3D=3D
> +	    (CRG_U3DC_PORTSC_CCS | CRG_U3DC_PORTSC_PP)) {
> +		if (FIELD_GET(CRG_U3DC_PORTSC_PLS_MASK, tmp) !=3D 0 ||
> +		    (!(tmp & CRG_U3DC_PORTSC_PED)))
> +			return 0;
> +
> +		switch (FIELD_GET(CRG_U3DC_PORTSC_SPEED_MASK, tmp)) {
> +		case CRG_U3DC_PORTSC_SPEED_SSP:
> +			speed =3D USB_SPEED_SUPER_PLUS;
> +			break;
> +		case CRG_U3DC_PORTSC_SPEED_SS:
> +			speed =3D USB_SPEED_SUPER;
> +			break;
> +		case CRG_U3DC_PORTSC_SPEED_HS:
> +			speed =3D USB_SPEED_HIGH;
> +			break;
> +
> +		case CRG_U3DC_PORTSC_SPEED_FS:
> +			speed =3D USB_SPEED_FULL;
> +			break;
> +
> +		case CRG_U3DC_PORTSC_SPEED_LS:
> +			speed =3D USB_SPEED_LOW;
> +			break;
> +		default:
> +			speed =3D USB_SPEED_UNKNOWN;
> +			return 0;
> +		}
> +		crg_udc->gadget.speed =3D speed;
> +
> +		crg_udc_update_ep0_maxpacketsize(crg_udc);
> +
> +		crg_udc->connected =3D 1;
> +
> +		if (crg_udc->device_state < USB_STATE_RECONNECTING)
> +			crg_udc_enable_setup(crg_udc);
> +
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
> +			int ret;
> +
> +			if (was_connected)
> +				crg_udc_notify_disconnect(crg_udc, flags);
> +			ret =3D crg_udc_reinit(crg_udc);
> +			if (ret)
> +				return ret;
> +			crg_udc->connected =3D 0;
> +		} else if (!cable_connected) {
> +			dev_dbg(crg_udc->dev,
> +				"cable disconnected, rst controller\n");
> +			if (was_connected)
> +				crg_udc_notify_disconnect(crg_udc, flags);
> +			ret =3D crg_udc_reset(crg_udc, flags);
> +			if (!ret)
> +				ret =3D crg_udc_reset_data_struct(crg_udc);
> +			if (!ret)
> +				ret =3D crg_udc_init_ep0(crg_udc);
> +			if (ret)
> +				dev_err(crg_udc->dev,
> +					"controller reset failed on disconnect: %d\n",
> +					ret);
> +			else
> +				crg_udc->resetting =3D false;
> +			crg_udc->connected =3D 0;
> +
> +			crg_udc->device_state =3D USB_STATE_ATTACHED;
> +			return -ECONNRESET;
> +		}
> +	}
> +	}
> +	/* handle Port Connection Change end */
> +
> +	if (portsc_val & CRG_U3DC_PORTSC_PLC) {

[Severity: High]
As reported by Sashiko on v3 [1], can early returns in the PRC and CSC bloc=
ks
drop concurrent CSC or PLC events that were already cleared in uccr->portsc?

At the top of crg_udc_handle_port_status(), writel(portsc_val &
CRG_U3DC_PORTSC_W1C_MASK, &uccr->portsc) clears all W1C bits (including CSC
and PLC) in hardware. However, if FIELD_GET(CRG_U3DC_PORTSC_PLS_MASK, tmp) =
!=3D 0
or !(tmp & CRG_U3DC_PORTSC_PED) (or speed is unknown) in the PRC block or t=
he
CSC connect block, the function executes return 0 instead of falling through
to the remaining status-change checks. For example, if a disconnect or link
error aborts a port reset so both PRC and CSC/PLC are set and PED is 0, or =
if
both CSC and PLC (with PLS =3D=3D 0xf) are set, returning 0 skips the CSC a=
nd PLC
handlers after their hardware status bits have already been cleared.

Also, in the CSC disconnect branches, crg_udc_notify_disconnect() drops
udc_lock while crg_udc->connected is still 1 and before crg_udc_reinit() or
crg_udc_reset() runs, without revalidating controller state after reacquiri=
ng
udc_lock.

[ ... ]

> +int crg_udc_handle_xfer_event(struct crg_gadget_dev *crg_udc,
> +			      struct crg_event_trb *event, unsigned long *flags)
> +{

[ ... ]

> +	if (comp_code !=3D CMPL_CODE_STOPPED &&
> +	    comp_code !=3D CMPL_CODE_STOPPED_LENGTH_INVALID &&
> +	    comp_code !=3D CMPL_CODE_DISABLED &&
> +	    comp_code !=3D CMPL_CODE_DISABLED_LENGTH_INVALID &&
> +	    comp_code !=3D CMPL_CODE_HALTED &&
> +	    comp_code !=3D CMPL_CODE_HALTED_LENGTH_INVALID)
> +		crg_udc_update_dequeue_pt(event, udc_ep_ptr);
> +
> +	if (is_request_dequeued(crg_udc, udc_ep_ptr, event)) {
> +		trbs_dequeued =3D true;
> +		goto queue_more_trbs;\n> +	}

[Severity: High]
Doesn't calling crg_udc_update_dequeue_pt() before is_request_dequeued()
corrupt udc_ep_ptr->deq_pt when a stale event arrives for an already-dequeu=
ed
request or an aborted EP0 transfer?

1. When crg_udc_ep_dequeue() cancels an active request, it advances
udc_ep_ptr->deq_pt to next_req->first_trb or udc_ep_ptr->enq_pt. If the
hardware had already posted a transfer event for the cancelled request befo=
re
CRG_CMD_STOP_EP completed, calling crg_udc_update_dequeue_pt() before
is_request_dequeued() rewinds udc_ep_ptr->deq_pt back to the stale event's
TRB + 1.

2. In is_request_dequeued(), if udc_ep->queue is empty (because the cancell=
ed
request was the only request on the endpoint), is_request_dequeued() returns
false instead of true:

	if (udc_ep->dci =3D=3D 0 || list_empty(&udc_ep->queue))
		return false;

That leaves udc_ep_ptr->deq_pt pointing into the middle of an empty ring and
allows a stale error event to fall through and halt the endpoint via
set_ep_halt().

3. On EP0, CMPL_CODE_SETUP_TAG_MISMATCH is not excluded from
crg_udc_update_dequeue_pt(), so a stale mismatch event arriving after
crg_udc_abort_ep0_for_setup() resets the EP0 ring will overwrite
udc_ep[0].deq_pt and break the enq_pt =3D=3D dq_pt check in crg_udc_queue_c=
trl().

> +	switch (comp_code) {
> +	case CMPL_CODE_SUCCESS:

[ ... ]

> +		if (!FIELD_GET(TRB_CHAIN_BIT_MASK, le32_to_cpu(trb->dw3))) {
> +			udc_req_ptr =3D list_first_entry(&udc_ep_ptr->queue,
> +						       struct crg_udc_request,
> +						       queue);
> +			trbs_dequeued =3D true;
> +			udc_req_ptr->td_pending =3D false;
> +
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
> +			} else {
> +				int ret;
> +
> +				ret =3D crg_udc_build_td(udc_ep_ptr, udc_req_ptr);
> +				if (ret =3D=3D -ENOSPC || ret =3D=3D -EBUSY) {
> +					/* A previous TD completed, but this next TD
> +					 * could not yet be published. Retry later.
> +					 */
> +					udc_ep_ptr->tran_ring_full =3D true;
> +				} else if (ret) {
> +					udc_req_ptr->usb_req.actual =3D
> +						udc_req_ptr->usb_req.length -
> +						udc_req_ptr->buff_len_left;
> +					crg_udc_req_done(udc_ep_ptr, udc_req_ptr,
> +							 ret);
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
> +		trb =3D crg_udc_tran_trb_dma_to_virt(
> +			udc_ep_ptr,
> +			(u64)le32_to_cpu(event->dw0) |
> +			((u64)le32_to_cpu(event->dw1) << 32));
> +		if (!trb)
> +			break;
> +
> +		residual =3D FIELD_GET(EVE_TRB_TRAN_LEN_MASK,
> +				     le32_to_cpu(event->dw2));
> +		udc_req_ptr->usb_req.actual =3D
> +			crg_udc_actual_before(udc_ep_ptr, udc_req_ptr, trb) +
> +			FIELD_GET(TRB_TRANSFER_LEN_MASK,
> +					  le32_to_cpu(trb->dw2)) -
> +			min_t(u32, residual,
> +			      FIELD_GET(TRB_TRANSFER_LEN_MASK,
> +						le32_to_cpu(trb->dw2)));
> +		udc_req_ptr->usb_req.actual =3D min(udc_req_ptr->usb_req.actual,
> +						    udc_req_ptr->usb_req.length);
> +
> +		/* Update the ring before dropping udc_lock for giveback. */
> +		trbs_dequeued =3D true;
> +		crg_udc_advance_dequeue_pt(udc_ep_ptr);
> +		if (udc_req_ptr->usb_req.short_not_ok &&
> +		    usb_endpoint_dir_out(udc_ep_ptr->desc))
> +			crg_udc_req_done(udc_ep_ptr, udc_req_ptr, -EREMOTEIO);
> +		else
> +			crg_udc_req_done(udc_ep_ptr, udc_req_ptr, 0);

[Severity: High]
Isn't crg_udc_advance_dequeue_pt(udc_ep_ptr) called here while udc_req_ptr =
is
still at the head of udc_ep_ptr->queue?

In drivers/usb/gadget/udc/crg/crg-udc-ring.c, crg_udc_advance_dequeue_pt()
sets udc_ep->deq_pt from udc_ep->queue.next:

	if (!list_empty(&udc_ep->queue)) {
		udc_req =3D list_entry(udc_ep->queue.next, struct crg_udc_request,
				     queue);

		if (udc_req->first_trb)
			udc_ep->deq_pt =3D udc_req->first_trb;

Because udc_req_ptr is not unlinked from udc_ep_ptr->queue until
list_del_init(&udc_req->queue) inside crg_udc_req_done(), calling
crg_udc_advance_dequeue_pt() before udc_req_ptr is removed rewinds
udc_ep_ptr->deq_pt back to the completing request's own first_trb instead of
advancing it to the next request or udc_ep_ptr->enq_pt. That leaks TRB slots
in crg_udc_room_on_ring() on every short packet until the ring wedges with
-ENOSPC, and breaks subsequent EP0 transfers that require enq_pt =3D=3D dq_=
pt in
crg_udc_queue_ctrl().

> +		if (dci =3D=3D 0 && udc_ep_ptr->desc &&
> +		    crg_udc->ep0_state =3D=3D EP0_STATE_IDLE &&
> +		    usb_endpoint_xfer_control(udc_ep_ptr->desc))
> +			crg_udc_ep0_req_complete(udc_ep_ptr, flags);
> +		break;

[ ... ]

> +	case CMPL_CODE_BABBLE_DETECTED_ERR:
> +	case CMPL_CODE_DATA_BUFFER_ERR:
> +	case CMPL_CODE_INVALID_STREAM_TYPE_ERR:
> +	case CMPL_CODE_RING_UNDERRUN:
> +	case CMPL_CODE_RING_OVERRUN:
> +	case CMPL_CODE_EVENT_RING_FULL_ERR:
> +	case CMPL_CODE_ISOCH_BUFFER_OVERRUN:
> +	case CMPL_CODE_USB_TRANS_ERR:
> +	case CMPL_CODE_TRB_ERR:
> +		dev_err(crg_udc->dev, "transfer error, completion code 0x%x\n",
> +			comp_code);
> +		if (!list_empty(&udc_ep_ptr->queue)) {
> +			udc_req_ptr =3D list_first_entry(&udc_ep_ptr->queue,
> +						       struct crg_udc_request,
> +						       queue);
> +			crg_udc_req_done(udc_ep_ptr, udc_req_ptr, -EIO);
> +			trbs_dequeued =3D true;
> +		}
> +		if (dci)
> +			set_ep_halt(crg_udc, dci, flags);
> +		break;

[Severity: High]
Doesn't calling crg_udc_req_done() before set_ep_halt() unmap the request's
DMA buffer and drop udc_lock while the endpoint is still running?

If the completion callback (or another CPU while udc_lock is dropped in
crg_udc_req_done()) queues a new request on udc_ep_ptr, crg_udc_ep_queue()
sees ep_state =3D=3D EP_STATE_RUNNING and rings the doorbell; then when
crg_udc_req_done() returns, set_ep_halt() immediately halts the endpoint and
nukes the newly queued request with -ECONNRESET. Furthermore, set_ep_halt()
does not check whether crg_udc->resetting or udc_ep_ptr->generation changed
while udc_lock was dropped.

> +
> +	case CMPL_CODE_STOPPED:
> +	case CMPL_CODE_STOPPED_LENGTH_INVALID:
> +	case CMPL_CODE_HALTED:
> +	case CMPL_CODE_HALTED_LENGTH_INVALID:
> +	case CMPL_CODE_DISABLED:
> +	case CMPL_CODE_DISABLED_LENGTH_INVALID:
> +		break;
> +
> +	default:
> +		dev_err(crg_udc->dev,
> +			"unsupported transfer completion code 0x%x\n",
> +			comp_code);
> +		if (!list_empty(&udc_ep_ptr->queue)) {
> +			udc_req_ptr =3D list_first_entry(&udc_ep_ptr->queue,
> +						       struct crg_udc_request,
> +						       queue);
> +			crg_udc_req_done(udc_ep_ptr, udc_req_ptr, -EIO);
> +			trbs_dequeued =3D true;
> +		}
> +		break;
> +	}
> +
> +queue_more_trbs:
> +	/* Even if the ring was not full, a later request may be waiting
> +	 * behind a TD from an earlier request (32 TRBs per TD).
> +	 */
> +	if (trbs_dequeued && dci !=3D 0 &&
> +	    udc_ep_ptr->ep_state =3D=3D EP_STATE_RUNNING &&
> +	    !crg_udc->resetting) {
> +		udc_ep_ptr->tran_ring_full =3D false;
> +		if (crg_udc_queue_pending_trbs(udc_ep_ptr))
> +			udc_ep_ptr->tran_ring_full =3D true;
> +	}

[Severity: Medium]
As reported by Sashiko on v3 [1], doesn't queue_more_trbs clobber
udc_ep_ptr->tran_ring_full when the !udc_req_ptr->all_trbs_queued branch un=
der
CMPL_CODE_SUCCESS just filled the ring?

When an intermediate TD of a multi-TD request completes, that branch sets
trbs_dequeued =3D true and calls crg_udc_build_td(udc_ep_ptr, udc_req_ptr).=
 If
that TD consumes the remaining space on the ring (or returns -ENOSPC/-EBUSY
when td_pending is already set), udc_ep_ptr->tran_ring_full is set to true.
Execution then reaches queue_more_trbs, which sets udc_ep_ptr->tran_ring_fu=
ll
=3D false and calls crg_udc_queue_pending_trbs(udc_ep_ptr). Because udc_req=
_ptr
now has td_pending =3D=3D true or all_trbs_queued =3D=3D true,
crg_udc_queue_pending_trbs() returns 0 without re-detecting the full ring,
leaving tran_ring_full false so the next crg_udc_ep_queue() call attempts
crg_udc_build_td() and fails with -ENOSPC.

> +
> +	return 0;
> +}
> +
> +int crg_udc_handle_event(struct crg_gadget_dev *crg_udc,
> +			 struct crg_event_trb *event, unsigned long *flags)
> +{
> +	int ret;
> +
> +	trace_crg_udc_event_trb(event);
> +
> +	switch (FIELD_GET(EVE_TRB_TYPE_MASK, le32_to_cpu(event->dw3))) {
> +	case TRB_TYPE_EVT_PORT_STATUS_CHANGE:
> +		if (crg_udc->device_state =3D=3D USB_STATE_RECONNECTING) {
> +			crg_udc->portsc_on_reconnecting =3D 1;
> +			break;
> +		}
> +		/* 1.Port Reset  2.Port Connection Change 3.Port Link Change */
> +		ret =3D crg_udc_handle_port_status(crg_udc, flags);
> +		if (ret)
> +			return ret;
> +
> +		break;
> +	case TRB_TYPE_EVT_TRANSFER:
> +		if (crg_udc->device_state < USB_STATE_RECONNECTING) {
> +			dev_err(crg_udc->dev,
> +				"Xfer compl event rcved when dev state=3D%d !\n",
> +				crg_udc->device_state);
> +			break;
> +		}
> +
> +		ret =3D crg_udc_handle_xfer_event(crg_udc, event, flags);
> +		if (ret)
> +			return ret;
> +		break;
> +	case TRB_TYPE_EVT_SETUP_PKT: {
> +		struct usb_ctrlrequest setup;
> +		u32 dw0 =3D le32_to_cpu(event->dw0);
> +		u32 dw1 =3D le32_to_cpu(event->dw1);
> +		u8 setup_tag;
> +
> +		BUILD_BUG_ON(sizeof(struct usb_ctrlrequest) !=3D 8);
> +		setup.bRequestType =3D dw0 & 0xff;
> +		setup.bRequest =3D (dw0 >> 8) & 0xff;
> +		setup.wValue =3D cpu_to_le16((dw0 >> 16) & 0xffff);
> +		setup.wIndex =3D cpu_to_le16(dw1 & 0xffff);
> +		setup.wLength =3D cpu_to_le16((dw1 >> 16) & 0xffff);
> +
> +		setup_tag =3D FIELD_GET(EVE_TRB_SETUP_TAG_MASK,
> +				      le32_to_cpu(event->dw3));
> +		if (crg_udc->setup_status !=3D WAIT_FOR_SETUP) {
> +			/* A new SETUP aborts the previous control transfer. The old
> +			 * EP0 request must be completed and its TRBs discarded before
> +			 * the new setup is handed to the gadget driver.
> +			 */
> +			if (crg_udc_abort_ep0_for_setup(crg_udc)) {
> +				crg_udc_set_ep0_halt(crg_udc);
> +				break;
> +			}
> +		}
> +
> +		crg_udc_handle_setup_pkt(crg_udc, &setup, setup_tag, flags);
> +
> +		break;
> +	}

[Severity: High]
What happens if a TRB_TYPE_EVT_SETUP_PKT event is processed here while
crg_udc->device_state =3D=3D USB_STATE_RECONNECTING?

When a bus reset occurs after CRG_U3DC_CFG1_SETUP_EVENT_EN has been enabled,
crg_udc_reinit() sets crg_udc->device_state =3D USB_STATE_RECONNECTING and
defers EP0 reinitialization (crg_udc_prepare_for_setup()) until the event r=
ing
becomes empty. If a SETUP packet is already in the event ring during the sa=
me
drain loop, crg_udc_handle_setup_pkt() runs while device_state is still
USB_STATE_RECONNECTING: setaddressrequest() rejects USB_REQ_SET_ADDRESS and
stalls EP0 because device_state is neither USB_STATE_DEFAULT nor
USB_STATE_ADDRESS, and any control transfer queued for GET_DESCRIPTOR will =
be
immediately stopped and nuked with -ESHUTDOWN when crg_udc_prepare_for_setu=
p()
runs at the end of the interrupt.

[Severity: High]
In addition, shouldn't the abort condition here also check
crg_udc->ep0_state !=3D EP0_STATE_IDLE (not just
crg_udc->setup_status !=3D WAIT_FOR_SETUP)?

crg_udc_abort_ep0_for_setup() sets crg_udc->setup_status =3D WAIT_FOR_SETUP=
 at
the very beginning of the function. If crg_udc_abort_ep0_for_setup(),
crg_udc_prepare_for_setup(), or crg_udc_build_ep0_status() fails,
crg_udc->ep0_state is set to EP0_STATE_ERROR while setup_status is
WAIT_FOR_SETUP. On the next SETUP packet, checking only
setup_status !=3D WAIT_FOR_SETUP skips crg_udc_abort_ep0_for_setup(), leavi=
ng
ep0_state permanently stuck in EP0_STATE_ERROR and causing crg_udc_ep_queue=
()
to reject all future EP0 requests with -ECONNRESET.

[ ... ]

> +int crg_udc_ep_halt(struct crg_udc_ep *udc_ep_ptr, int halt, int ignore_=
wedge,
> +		    unsigned long *flags)
> +{
> +	struct crg_gadget_dev *crg_udc =3D udc_ep_ptr->crg_udc;
> +	struct crg_uccr __iomem *uccr =3D crg_udc->uccr;
> +	enum crg_ep_state ep_state;
> +	bool reset_seq_only =3D false;
> +	int do_halt;
> +	u32 param0;
> +	u32 tmp;
> +
> +	if (crg_udc->resetting)
> +		return -ESHUTDOWN;
> +	if (!udc_ep_ptr->desc) {
> +		dev_err(crg_udc->dev, "NULL desc\n");
> +		return -EINVAL;
> +	}
> +
> +	if (usb_endpoint_xfer_isoc(udc_ep_ptr->desc)) {
> +		dev_err(crg_udc->dev, "Isoc ep, halt not supported\n");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (udc_ep_ptr->dci =3D=3D 0)
> +		return 0;

[Severity: High]
When a gadget driver calls usb_ep_set_halt(gadget->ep0, 1) to stall EP0 (for
example from __ffs_ep0_stall(), uvc_send_response(), or a Control OUT
data-stage completion callback), doesn't returning 0 for dci =3D=3D 0 turn =
the
EP0 stall into a silent no-op instead of calling crg_udc_set_ep0_halt()?

Furthermore, in crg_udc_handle_xfer_event() under CMPL_CODE_SUCCESS, after
crg_udc_req_done() runs the EP0 data-stage completion callback, it calls
crg_udc_ep0_req_complete(udc_ep_ptr, flags) without checking that
crg_udc->ep0_state =3D=3D EP0_STATE_IDLE and udc_ep_ptr->ep_state =3D=3D
EP_STATE_RUNNING, which queues an ACK status stage even if the callback
stalled or aborted EP0.

> +	ep_state =3D crg_udc_get_ep_state(crg_udc, udc_ep_ptr->dci);
> +
> +	if (ep_state =3D=3D EP_STATE_DISABLED)
> +		return 0;
> +
> +	if (ep_state =3D=3D EP_STATE_HALTED) {
> +		if (halt !=3D 0)
> +			return 0;
> +
> +		/* want unhalt an halted ep */
> +		if (udc_ep_ptr->wedge && !ignore_wedge) {
> +			do_halt =3D -1;
> +			reset_seq_only =3D true;
> +		} else {
> +			do_halt =3D 0;
> +		}
> +
> +	} else {
> +		/* ep state =3D=3D running or stopped */
> +		if (halt !=3D 0) {
> +			/* want halt a running ep */
> +			do_halt =3D 1;
> +		} else {
> +			/* reset a running ep */
> +			do_halt =3D 0;
> +			reset_seq_only =3D true;
> +		}
> +	}
> +
> +	trace_crg_udc_ep_halt(udc_ep_ptr, do_halt =3D=3D 1, udc_ep_ptr->wedge);
> +
> +	param0 =3D BIT(udc_ep_ptr->dci);
> +	if (do_halt =3D=3D 1) {
> +		/* setting ep to halt */
> +		if (crg_udc_issue_command(crg_udc, CRG_CMD_SET_HALT, param0, 0))
> +			return -EIO;
> +		if (readl_poll_timeout_atomic(&uccr->ep_running, tmp,
> +					      !(tmp & param0), 10, 10000))
> +			dev_warn(crg_udc->dev, "ep %d halt wait timed out\n",
> +				 udc_ep_ptr->dci);
> +
> +		if (crg_udc->gadget.speed >=3D USB_SPEED_SUPER) {
> +			udc_ep_ptr->deq_pt =3D udc_ep_ptr->enq_pt;
> +			udc_ep_ptr->tran_ring_full =3D false;
> +		}
> +		udc_ep_ptr->ep_state =3D EP_STATE_HALTED;
> +		if (crg_udc->gadget.speed >=3D USB_SPEED_SUPER)
> +			crg_udc_ep_nuke(udc_ep_ptr, -ECONNRESET);

[Severity: High]
If readl_poll_timeout_atomic(&uccr->ep_running, ...) times out here, should=
n't
crg_udc_ep_halt() return -ETIMEDOUT (just like set_ep_halt() and
crg_udc_ep_dequeue() do) instead of proceeding to crg_udc_ep_nuke()?

Unmapping request DMA buffers and giving requests back to the gadget driver
via crg_udc_ep_nuke() while the endpoint bit in uccr->ep_running is still s=
et
risks DMA use-after-free while the controller still owns the buffers.

[1] https://lore.kernel.org/r/20261020-axiado-ax3000-usb-device-controller-=
v3-5-3012ecfc0a93@axiado.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-axiado-ax3=
000-usb-device-controller-v4-0-c5267b36a777@axiado.com?part=3D5
