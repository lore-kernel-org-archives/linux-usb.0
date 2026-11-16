Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794860192;
	b=Fk4f2ui084PU7wR5LCUvnWQo+FUcvSWVkQmxpdPeomgmcP4ceTYKZTe9PgggDT+O/wdw
	 JcPmPTMVzvY3ggjvvDoRAKfpGQI5/HRhrHwVFC+Sx4xQ+toyR+xj0rDzCdh7bxB4rMZVE
	 df3IMsBNhCdryTLbBHaoQPX1c4Qk/EptrLu3r6NJhYFlxEIHQoHm1AjcZrF7/QmNQ5204
	 10kpDAGf4j+f0JVdkAaSJ6sqBnwpOYItMVyx/WtPBn4J+xa6T4aJhbEkYvvUsPEjoGq8g
	 XCNLxnIQz518wF5oN9I9VLw9giBnLYbR4sprB60b3U/imEVADBUCOIosDs1eZD/aR/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794860192;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PjEvZx57sK/rmrsF6ijccPHjOf0wBDCLW/0MFUcDgdk=;
	b=0XtcdbJQM2EpTVK79Wdwfnyv6hvyydIQ5kBfcISzMisLSuc3tP+vtVF/ujKqMvvPYmgm
	 StfFbxnOBedMqG/2/qIza8QwnvdDx2hf7EdTP08y/6gQ8s2kL8aArCucXdqV1QpiiEpRU
	 c9iAXVksYjZ8F9a/VWWNGusDB6isE2PtP5Go9STqpyTyEoYKROOhSGnrSiJr3gJ0ACa0A
	 lsp72o4EVT7bR919h07hQ3TxLTou8m2bBpIllbzJ4LpceQ3xH3XhwtVkdWJEc0xx3MBne
	 DXsMscp8k694GoXIyrq2RXbyxgUMKWJ4TRQjAKO52MFqg8Zx5QmGqVE0+7/wyuSLBlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WS8OHt0g;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2AE606A337;
	Mon, 16 Nov 2026 20:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WS8OHt0g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CCA01F000C6;
	Mon, 16 Nov 2026 20:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794860191;
	bh=PjEvZx57sK/rmrsF6ijccPHjOf0wBDCLW/0MFUcDgdk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WS8OHt0gPJDLET1i/H5gurNgrCYrsHfFYVYYMskY9YKG3p7kERRAeaZ84DRScLSn0
	 DFpiPRAJ02VzYxFiHRCp7rGezLOQqoSKeX322u4I8G56lHVbLeoJ0vz0M9AOOr+Eq9
	 Znj84sW+CJTN0Nm0XLKe0S/ALkqMvaglsxh1sqZAXzuoKUsiw+EyDctI+pxJQiqbBx
	 fyr/Xj/jyKruVWjrWOa4lK/tqlyPNZluyDips2RQciAYKuP3VImUu5WA+ko/J1ic8o
	 m2FfliiPBi9Pxmd0TzM0QJK8MeH4GWdksVK+tVSiMktrfimiVv84JoD6tpSqTnOge/
	 6GBHP5r7IS3qg==
Message-ID: <sashiko-outbox-217645@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/6] usb: gadget: udc: crg: Add endpoint 0 handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-axiado-ax3000-usb-device-controller-v5-4-49271ed5c793@axiado.com>
References: <20261116-axiado-ax3000-usb-device-controller-v5-0-49271ed5c793@axiado.com>
 <20261116-axiado-ax3000-usb-device-controller-v5-4-49271ed5c793@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 20:16:31 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [High] usb: gadget: udc: crg: broken EP0 halt and lock-drop handling
  in setfeaturesrequest()
- [Medium] usb: gadget: udc: crg: clear U1 and U2 LPM state on
  SET_CONFIGURATION(0)
- [Medium] usb: gadget: udc: crg: mishandled interface GET_STATUS and
  FUNC_SUSPEND on EP0
- [Medium] usb: gadget: crg: missing setup_status error return and
  ep0_state checks on EP0
- [Medium] usb: gadget: crg: missing ep0_state checks in EP0 status and
  halt paths
--

commit 38b91eca05d2bb158aa1aa4be9dbbe69096a9ef9
Author: Petar Stepanovic <pstepanovic@axiado.com>

usb: gadget: udc: crg: Add endpoint 0 handling

This commit adds endpoint 0 setup packet, status stage, and control transfer
handling for the Axiado AX3000/AX3005 UDC driver.

> diff --git a/drivers/usb/gadget/udc/crg/crg-udc-ep0.c b/drivers/usb/gadge=
t/udc/crg/crg-udc-ep0.c
> new file mode 100644
> index 0000000000000..4bd0dd4da8c67
> --- /dev/null
> +++ b/drivers/usb/gadget/udc/crg/crg-udc-ep0.c
> @@ -0,0 +1,1264 @@
[ ... ]
> +int crg_udc_build_ep0_status(struct crg_udc_ep *udc_ep_ptr, bool default=
_value,
> +			      u32 status, struct crg_udc_request *udc_req_ptr,
> +			      u8 set_addr, u8 stall)
> +{
> +	struct crg_gadget_dev *crg_udc =3D udc_ep_ptr->crg_udc;
> +	struct crg_transfer_trb *enq_pt =3D udc_ep_ptr->enq_pt;
> +
> +	/* Internal status requests bypass usb_ep_queue(), so they must also
> +	 * respect a teardown that is giving back the old EP0 queue.
> +	 */
> +	if (udc_ep_ptr->nuking) {
> +		crg_udc->ep0_state =3D EP0_STATE_ERROR;
> +		return -EBUSY;
> +	}
> +
> +	/* Reserve a free transfer-ring slot before touching request state or
> +	 * publishing the STATUS TRB. crg_udc_room_on_ring() treats equal
> +	 * pointers as empty, so check tran_ring_full separately.
> +	 */
> +	if (!udc_ep_ptr->first_trb || !udc_ep_ptr->last_trb ||
> +	    !udc_ep_ptr->enq_pt || !udc_ep_ptr->deq_pt)
> +		return -ENODEV;
> +	if (udc_ep_ptr->ep_state !=3D EP_STATE_RUNNING)
> +		return -ESHUTDOWN;

[Severity: Medium]
Should crg_udc_build_ep0_status() and crg_udc_set_ep0_halt() check that
crg_udc->ep0_state is EP0_STATE_IDLE before queuing a status or stall TRB?

crg_udc_handle_setup_pkt() sets crg_udc->ep0_state =3D EP0_STATE_ABORTING
while udc_ep[0].ep_state is still EP_STATE_RUNNING, then drops udc_lock
across flush_work(&crg_udc->udc_reset_work):

CPU0                              CPU1
crg_udc_handle_setup_pkt()
  ep0_state =3D EP0_STATE_ABORTING
  spin_unlock(&udc_lock)
  flush_work(&udc_reset_work)
                                  crg_udc_ep_set_halt(ep0)
                                    ...
                                      crg_udc_set_ep0_halt()
                                        crg_udc_build_ep0_status()
                                        ep_state =3D EP_STATE_HALTED
  spin_lock(&udc_lock)
  if (ep_state !=3D EP_STATE_RUNNING)
    return;  <-- drops new SETUP with ep0_state stuck in EP0_STATE_ABORTING

Because neither crg_udc_set_ep0_halt() nor crg_udc_build_ep0_status() checks
crg_udc->ep0_state, a concurrent halt or status submission while ep0_state
is EP0_STATE_ABORTING or EP0_STATE_ERROR queues status_req with the previous
setup_tag, rings doorbell 0, and sets ep_state to EP_STATE_HALTED without
bumping generation, causing crg_udc_handle_setup_pkt() to abort the incoming
SETUP and leave EP0 blocked in EP0_STATE_ABORTING.

[ ... ]

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
[ ... ]
> +		udc_ep_ptr =3D &crg_udc->udc_ep[dci];
> +		status =3D crg_udc_ep_halt(
> +			udc_ep_ptr, (b_request =3D=3D USB_REQ_SET_FEATURE) ? 1 : 0,
> +			0, flags);
> +
> +		if (status < 0)
> +			goto set_feature_error;
[ ... ]
> +	} else if ((request_type & (USB_RECIP_MASK | USB_TYPE_MASK)) =3D=3D
> +		   (USB_RECIP_INTERFACE | USB_TYPE_STANDARD)) {
[ ... ]
> +		/* Do not need to return status stage here
> +		 * Pass to composite gadget driver to process
> +		 * the request
> +		 */
> +		return false;
> +	} else {
> +		/* Unknown recipient must not receive a successful status stage. */
> +		goto set_feature_error;
> +	}
> +
> +	crg_udc->setup_status =3D STATUS_STAGE_XFER;
> +	crg_udc_submit_ep0_status(crg_udc, status, 0);
> +	return true;
> +
> +set_feature_error:
> +	crg_udc_set_ep0_halt(crg_udc);
> +	return true;
> +}

[Severity: High]
Does the USB_RECIP_ENDPOINT path in setfeaturesrequest() mishandle EP0
targets, status-stage request state, and lock drops across
crg_udc_ep_halt()?

First, when SET_FEATURE(USB_ENDPOINT_HALT) targets EP0 (dci =3D=3D 0),
crg_udc_ep_halt() calls crg_udc_set_ep0_halt(), which already queues
status_req with stall =3D 1 and sets udc_ep[0].ep_state =3D EP_STATE_HALTED;
falling through to crg_udc_submit_ep0_status() then fails with -ESHUTDOWN
and forces crg_udc->ep0_state into EP0_STATE_ERROR.

Second, crg_udc_ep_halt() can drop udc_lock via flags during request
givebacks in crg_udc_ep_nuke() or crg_udc_queue_pending_trbs(), but
setfeaturesrequest() does not revalidate EP0/event generations or reset
state before calling crg_udc_submit_ep0_status() or crg_udc_set_ep0_halt(),
which can publish a status or stall TRB and ring doorbell 0 during a reset
or on a reinitialized EP0 ring.

Third, assigning status =3D crg_udc_ep_halt(...) overwrites status from
-EINPROGRESS to 0 on success, so crg_udc_submit_ep0_status() queues the
in-flight status_req with usb_req.status =3D 0 before hardware completion.

[ ... ]

> +	if ((setup_pkt->bRequestType & USB_TYPE_MASK) =3D=3D USB_TYPE_STANDARD)=
 {
> +		switch (setup_pkt->bRequest) {
> +		case USB_REQ_GET_STATUS:
> +			if (setup_pkt->bRequestType !=3D
> +				    (USB_DIR_IN | USB_RECIP_DEVICE |
> +				     USB_TYPE_STANDARD) &&
> +			    setup_pkt->bRequestType !=3D
> +				    (USB_DIR_IN | USB_RECIP_INTERFACE |
> +				     USB_TYPE_STANDARD) &&
> +			    setup_pkt->bRequestType !=3D
> +				    (USB_DIR_IN | USB_RECIP_ENDPOINT |
> +				     USB_TYPE_STANDARD)) {
> +				crg_udc_set_ep0_halt(crg_udc);
> +				return;
> +			}
> +
> +			getstatusrequest(crg_udc, setup_pkt->bRequestType,
> +					 w_value, w_index, w_length);
> +			return;

[Severity: Medium]
Should SuperSpeed USB_REQ_GET_STATUS for USB_RECIP_INTERFACE be delegated to
driver->setup(), and should setfeaturesrequest() reject
USB_INTRF_FUNC_SUSPEND below SuperSpeed?

setfeaturesrequest() delegates USB_INTRF_FUNC_SUSPEND to driver->setup() so
the composite driver can update function wakeup state, but
crg_udc_handle_setup_pkt() intercepts USB_REQ_GET_STATUS for
USB_RECIP_INTERFACE and getstatusrequest() always replies with 0 instead of
letting composite_setup() report USB_INTRF_STAT_FUNC_RW_CAP and
USB_INTRF_STAT_FUNC_RW.  In addition, the USB_RECIP_INTERFACE branch in
setfeaturesrequest() does not check crg_udc->gadget.speed >=3D USB_SPEED_SU=
PER,
and composite_setup() only checks gadget_is_superspeed() (which tests
max_speed), so USB_INTRF_FUNC_SUSPEND is accepted at High-Speed and
Full-Speed instead of stalling EP0.

[ ... ]

> +	if (setup_pkt->bRequest =3D=3D USB_REQ_SET_CONFIGURATION &&
> +	    (setup_pkt->bRequestType & (USB_TYPE_MASK | USB_RECIP_MASK)) =3D=3D
> +		    (USB_TYPE_STANDARD | USB_RECIP_DEVICE)) {
> +		if (w_value) {
> +			crg_udc->device_state =3D USB_STATE_CONFIGURED;
> +			usb_gadget_set_state(&crg_udc->gadget,
> +					     USB_STATE_CONFIGURED);
> +		} else {
> +			/* Endpoint disable may already have updated device_state. */
> +			crg_udc->device_state =3D USB_STATE_ADDRESS;
> +			usb_gadget_set_state(&crg_udc->gadget,
> +					     USB_STATE_ADDRESS);
> +		}
> +	}
> +}

[Severity: Medium]
When USB_REQ_SET_CONFIGURATION with w_value =3D=3D 0 transitions the device=
 back
to USB_STATE_ADDRESS, should it also clear U1/U2 link power management state
via crg_udc_clear_portpm()?

Without clearing uccr->u3portpmsc, feature_u1_enable, and feature_u2_enable
on deconfiguration, hardware U1/U2 initiation and timeouts stay active in
USB_STATE_ADDRESS, getstatusrequest() continues reporting
USB_DEV_STAT_U1_ENABLED and USB_DEV_STAT_U2_ENABLED, and the host cannot
clear them via CLEAR_FEATURE because setfeaturesrequest() rejects U1/U2
requests outside USB_STATE_CONFIGURED.

[ ... ]

> +int crg_udc_queue_ctrl(struct crg_udc_ep *udc_ep_ptr,
> +		       struct crg_udc_request *udc_req_ptr,
> +		       u32 num_of_trbs_needed)
> +{
[ ... ]
> +	if (crg_udc->ep0_state =3D=3D EP0_STATE_ABORTING)
> +		return -ECONNRESET;
> +
> +	ep_state =3D crg_udc_get_ep_state(crg_udc, 0);
> +	/* Need to queue the request even ep is paused or halted */
> +	if (ep_state !=3D EP_STATE_RUNNING) {
> +		dev_dbg(crg_udc->dev, "EP State =3D 0x%x\n", ep_state);
> +		return -EINVAL;
> +	}
> +	if (list_empty(&udc_ep_ptr->queue)) {
> +		/* For control endpoint, we can handle one setup request at a
> +		 * time. so if there are TD pending in the transfer ring.
> +		 * wait for the sequence number error event. Then put the new
> +		 * request to transfer ring
> +		 */
> +		if (enq_pt =3D=3D dq_pt && !udc_ep_ptr->tran_ring_full) {
> +			u32 i, td_done =3D 0;
> +			bool need_zlp =3D false;
> +			struct crg_udc_bounce *bounce =3D udc_req_ptr->bounce;
> +			dma_addr_t trb_dma =3D bounce ? bounce->dma : 0;
> +			u64 remaining =3D usb_req->length;
> +			/* Transfer ring is empty
> +			 * setup data stage TRBs
> +			 */
> +			udc_req_ptr->first_trb =3D udc_ep_ptr->enq_pt;
> +			if (crg_udc->setup_status =3D=3D DATA_STAGE_XFER)
> +				dir =3D 0;
> +			else if (crg_udc->setup_status =3D=3D DATA_STAGE_RECV)
> +				dir =3D 1;
> +			else
> +				dev_dbg(crg_udc->dev,
> +					"unexpected setup_status!%d\n",
> +					crg_udc->setup_status);

[Severity: Medium]
Should crg_udc_queue_ctrl() return -EINVAL when setup_status is neither
DATA_STAGE_XFER nor DATA_STAGE_RECV, and also reject requests when
crg_udc->ep0_state !=3D EP0_STATE_IDLE?

In crg_udc_ep_queue(), a non-zero-length EP0 request queued while
setup_status is STATUS_STAGE_XFER or STATUS_STAGE_RECV (for example, from a
completion callback during status-stage giveback before setup_status is
reset to WAIT_FOR_SETUP) passes the !_req->length check and reaches
crg_udc_queue_ctrl().  Because the else branch only logs dev_dbg(),
crg_udc_queue_ctrl() proceeds to queue TRB_TYPE_XFER_DATA_STAGE TRBs with
dir =3D 0 and ring the EP0 doorbell.  Similarly, checking only
ep0_state =3D=3D EP0_STATE_ABORTING at entry allows control requests to be
queued while ep0_state is EP0_STATE_ERROR.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-axiado-ax3=
000-usb-device-controller-v5-0-49271ed5c793@axiado.com?part=3D4
