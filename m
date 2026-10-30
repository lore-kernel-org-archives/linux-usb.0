Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349631;
	b=xb9ixrh2bLBBRkvTjsTun1rIrAmbBka7jTENJTK1rO4vRLEZK+OXgkX56pA/ervHSn5Y
	 ueqbdTuOV++Hp2CMdHIafWABealznjkcNGLAATCG7oJMwU4MU+B5yrfDEQ+Gbb6YysiNf
	 x6DSEPulX7GT54tmHYcbhQwK9sQY1oJKNq9i4HSOR6lXJP9PfUsySQxUJTCe65pRsqwsD
	 f1gH5W6aFZ7CKo5KPbdAYjEEJ1iS7ioTDQiwhzWWWGrXt+i/jjqCwy2MP16NTjCUiUqww
	 XLRWj27wR4z7q+anTZM7PA64/kOGpHy/C3ylbGtPm1vLyWIdraVivaxBroVTR9WEkXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349631;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2uqNAKlcdFKjSXeWHgHc22aU5tKia+18T2VjKaERmrg=;
	b=har4cANZDE8jMZor21zif3dYMaZB71xx23mFz2jQtWoJ29/iIGzrn4lKj4VR5C2eCNmc
	 aHJt4uYhMaBf7X5SuQoyW49WIZeLlFgC1/WivtogaamqZp0O4aw9ZHk8Er0oAvPlb6OeL
	 P8Yd3bp/F7PeaEhT3sVz5Td19HQUi0BJvlCndXh/KXiXdiZQp33i0wiDFNkSUYLMdpb+z
	 75CpBVuiZVsmOLMIEz4c5lhR7bC8LqJQJVscQVcbUZt4OSsokKuuDQ54wcDYNiVy7mz6O
	 kgfAjzf4OOSiSdr1xuKdA49tGtttfjPFAi1UF25mlpIlGFe6ISSBKLkWNgDnExSGsMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cu4AZnkH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93766606A323;
	Fri, 30 Oct 2026 08:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cu4AZnkH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBED11F0093A;
	Fri, 30 Oct 2026 08:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793349631;
	bh=2uqNAKlcdFKjSXeWHgHc22aU5tKia+18T2VjKaERmrg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cu4AZnkHz7YbtbLKzzosfekouuhRmTnCaniROrVLNRZ1GO8NxpkUSEi31fHZqdo6G
	 DzpKkA8ls+O7Qc377ZRD6d4iiBOxejjwhDs25aBYxl7QZri96FFp43s78aRqt2gJDP
	 ovJnkKw/B7veW1iWeuM1BPyNXN2RgvG1uoED6IDts4dNjFGdpNHQPVEjUE59Qbbbpz
	 92FNwYAe/Q6y9SZ6hOAIfTHKeOBkvZPLWXHo/g88U0MB2KbYzujSm3xmpUBRAt4qRg
	 4j2ED2YrRq09WhRvrgk4+8C7PlW2HlE3WPACg7/jsgfcfzFYiWdfnaNpKImJunpmAh
	 8QnJRkOFEQoHA==
Message-ID: <sashiko-outbox-190707@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/6] usb: gadget: udc: crg: Add endpoint 0 handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261030-axiado-ax3000-usb-device-controller-v4-4-c5267b36a777@axiado.com>
References: <20261030-axiado-ax3000-usb-device-controller-v4-0-c5267b36a777@axiado.com>
 <20261030-axiado-ax3000-usb-device-controller-v4-4-c5267b36a777@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 08:40:30 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] usb: gadget: udc: crg: stale setup_status on EP0 halt in crg_udc_s=
et_ep0_halt()
- [High] usb: gadget: udc: crg: missing state checks after relocking in crg=
_udc_handle_setup_pkt()
- [High] usb: gadget: crg: missing reset check after ep0 nuke in setup paths
- [Medium] usb: gadget: crg: crg_udc_prepare_for_setup() skips stopping hal=
ted EP0
--

commit 0dcda6f8ceb35327942fb48b7002136244fccc5c
Author: Petar Stepanovic <pstepanovic@axiado.com>

usb: gadget: udc: crg: Add endpoint 0 handling

This patch adds endpoint 0 setup packet, status stage, and control transfer
handling for the Axiado AX3000/AX3005 UDC driver.

> diff --git a/drivers/usb/gadget/udc/crg/crg-udc-ep0.c b/drivers/usb/gadge=
t/udc/crg/crg-udc-ep0.c
> new file mode 100644
> index 0000000000000..073d9090dd07c
> --- /dev/null
> +++ b/drivers/usb/gadget/udc/crg/crg-udc-ep0.c

[ ... ]

> +int crg_udc_abort_ep0_for_setup(struct crg_gadget_dev *crg_udc)
> +{
> +	struct crg_udc_ep *udc_ep0 =3D &crg_udc->udc_ep[0];
> +	struct crg_uccr __iomem *uccr =3D crg_udc->uccr;
> +	dma_addr_t dqptaddr;
> +	u32 cmd_param0;
> +	u32 cmd_param1;
> +	u32 tmp;
> +	int ret;

[ ... ]

> +	udc_ep0->ep_state =3D EP_STATE_STOPPED;
> +	/* Complete requests belonging to the aborted control transfer. */
> +	crg_udc_ep_nuke(udc_ep0, -ECONNRESET);
> +
> +	if (!udc_ep0->first_trb || !udc_ep0->tran_ring_info.cpu_addr) {
> +		crg_udc->ep0_state =3D EP0_STATE_ERROR;
> +		return -ENODEV;
> +	}

[Severity: High]
When crg_udc_ep_nuke() runs here in crg_udc_abort_ep0_for_setup(), and
similarly in crg_udc_prepare_for_setup(), crg_udc_req_done() drops
crg_udc->udc_lock to invoke the request completion callback.

While udc_lock is dropped, another CPU running crg_gadget_stop() or
crg_udc_shutdown() can acquire udc_lock and call crg_udc_reset(), setting
crg_udc->resetting =3D true, incrementing udc_ep[0].generation, and dropping
udc_lock while polling for CRG_U3DC_CTRL_SWRST to clear, followed by
crg_udc_reset_data_struct() and crg_udc_init_ep0().

After crg_udc_ep_nuke() returns, neither crg_udc_abort_ep0_for_setup() nor
crg_udc_prepare_for_setup() checks crg_udc->resetting, udc_ep[0].generation,
or udc_event[0].generation before touching controller registers and issuing
CRG_CMD_INIT_EP0. If crg_udc_reset() is still polling SWRST, this issues
MMIO commands mid-reset; if crg_gadget_stop() has already staged
CRG_CMD_INIT_EP0 with CRG_U3DC_CMD_CTRL_ACTIVE set while RUN is clear, the
subsequent CRG_CMD_INIT_EP0 fails with -EBUSY, leaving ep0_state in
EP0_STATE_ERROR and causing crg_udc_handle_event() to call
crg_udc_set_ep0_halt() and queue status_req after the gadget has stopped.

Should both functions snapshot the generation counter before
crg_udc_ep_nuke() and abort if crg_udc->resetting is set or the generation
changed while udc_lock was dropped?

[ ... ]

> +int crg_udc_prepare_for_setup(struct crg_gadget_dev *crg_udc)
> +{
> +	struct crg_udc_ep *udc_ep0_ptr;
> +	dma_addr_t dqptaddr;
> +	u32 cmd_param0;
> +	u32 cmd_param1;
> +	int ret;
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
> +		struct crg_uccr __iomem *uccr =3D crg_udc->uccr;
> +		u32 running;
> +
> +		/* Block requeue from giveback callbacks, then quiesce DMA. */
> +		crg_udc->ep0_state =3D EP0_STATE_ABORTING;
> +		if (crg_udc_get_ep_state(crg_udc, 0) =3D=3D EP_STATE_RUNNING) {
> +			ret =3D crg_udc_issue_command(crg_udc, CRG_CMD_STOP_EP,
> +						    BIT(0), 0);
> +			if (ret)
> +				goto reset_error;
> +
> +			ret =3D readl_poll_timeout_atomic(&uccr->ep_running, running,
> +							!(running & BIT(0)), 10, 10000);
> +			if (ret)
> +				goto reset_error;
> +		}
> +		udc_ep0_ptr->ep_state =3D EP_STATE_STOPPED;
> +		crg_udc_ep_nuke(udc_ep0_ptr, -ESHUTDOWN);

[Severity: Medium]
As reported by Sashiko on v3 [1], what happens if a USB bus reset occurs
after a control transfer has stalled?

When crg_udc_set_ep0_halt() stalls EP0, it calls crg_udc_build_ep0_status()
to queue a status-stage stall TRB, rings doorbell 0, places status_req on
udc_ep[0].queue, and immediately sets udc_ep[0].ep_state =3D EP_STATE_HALTED
in software while the hardware is still processing the TRB.

If a bus reset then triggers crg_udc_prepare_for_setup() while ep_state is
EP_STATE_HALTED, checking only for EP_STATE_RUNNING skips issuing
CRG_CMD_STOP_EP and polling uccr->ep_running before crg_udc_ep_nuke() and
CRG_CMD_INIT_EP0. Should crg_udc_prepare_for_setup() stop EP0 whenever it
is not disabled or stopped, matching crg_udc_abort_ep0_for_setup()?

[ ... ]

> +int crg_udc_set_ep0_halt(struct crg_gadget_dev *crg_udc)
> +{
> +	struct crg_udc_ep *udc_ep_ptr =3D &crg_udc->udc_ep[0];
> +	enum crg_ep_state ep_state;
> +
> +	ep_state =3D crg_udc_get_ep_state(crg_udc, udc_ep_ptr->dci);
> +	if (ep_state =3D=3D EP_STATE_HALTED || ep_state =3D=3D EP_STATE_DISABLE=
D)
> +		return 0;
> +
> +	crg_udc_build_ep0_status(udc_ep_ptr, true, -EINVAL, NULL, 0, 1);
> +
> +	udc_ep_ptr->ep_state =3D EP_STATE_HALTED;
> +
> +	return 0;
> +}

[Severity: High]
As reported by Sashiko on v3 [2], does crg_udc_set_ep0_halt() leave
crg_udc->setup_status in a stale data-stage state when stalling a control
transfer with wLength > 0?

In crg_udc_handle_setup_pkt() and getstatusrequest(), crg_udc->setup_status
is set to DATA_STAGE_XFER or DATA_STAGE_RECV before calling setselrequest(),
crg_udc_build_td(), or driver->setup():

crg_udc_handle_setup_pkt()
  crg_udc->setup_status =3D DATA_STAGE_XFER / DATA_STAGE_RECV;
  driver->setup() -> fails
  crg_udc_set_ep0_halt()
    crg_udc_build_ep0_status(..., stall =3D 1)

Because crg_udc_set_ep0_halt() does not update crg_udc->setup_status to
STATUS_STAGE_XFER (or clear crg_udc->setup_fn_call_back), two problems
follow:

1. crg_udc_setup_status_trb() computes dir as
   (crg_udc->setup_status =3D=3D STATUS_STAGE_XFER) ? 0 : 1, which evaluates
   to 1 (OUT) instead of 0 (IN).

2. When the stall status TRB completes and invokes
   crg_udc_ep0_req_complete(), switch (crg_udc->setup_status) matches
   DATA_STAGE_XFER or DATA_STAGE_RECV instead of the default branch:

crg_udc_ep0_req_complete() {
	switch (crg_udc->setup_status) {
	case DATA_STAGE_XFER:
		crg_udc->setup_status =3D STATUS_STAGE_RECV;
		crg_udc_build_ep0_status(udc_ep_ptr, true, -EINPROGRESS, NULL,
					 0, 0);
		break;
	case DATA_STAGE_RECV:
		crg_udc->setup_status =3D STATUS_STAGE_XFER;
		crg_udc_build_ep0_status(udc_ep_ptr, true, -EINPROGRESS, NULL,
					 0, 0);
		break;

This queues a second, unrequested, non-stalled status-stage TRB on EP0 and
rings doorbell 0 on the halted endpoint. Should crg_udc_set_ep0_halt() set
crg_udc->setup_status =3D STATUS_STAGE_XFER and clear
crg_udc->setup_fn_call_back before calling crg_udc_build_ep0_status()?

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
> +	/* No SETUP (including SET_ADDRESS) may overtake a pending reset. */
> +	spin_unlock_irqrestore(&crg_udc->udc_lock, *flags);
> +	flush_work(&crg_udc->udc_reset_work);
> +	spin_lock_irqsave(&crg_udc->udc_lock, *flags);
> +	if (crg_udc->resetting || !crg_udc->gadget_driver ||
> +	    crg_udc->ep0_state =3D=3D EP0_STATE_ABORTING)
> +		return;

[ ... ]

> +	if (w_length) {
> +		/* data phase from gadget like GET_CONFIGURATION
> +		 * call the setup routine of gadget driver.
> +		 * remember the request direction.
> +		 */
> +		crg_udc->setup_status =3D (setup_pkt->bRequestType & USB_DIR_IN) ?
> +						DATA_STAGE_XFER :
> +						DATA_STAGE_RECV;
> +	}
> +	driver =3D crg_udc->async_callbacks ? crg_udc->gadget_driver : NULL;
> +	spin_unlock_irqrestore(&crg_udc->udc_lock, *flags);
> +
> +	/* Recheck callback enablement after the locked snapshot. */
> +	if (!driver || !READ_ONCE(crg_udc->async_callbacks) ||
> +	    READ_ONCE(crg_udc->gadget_driver) !=3D driver ||
> +	    driver->setup(&crg_udc->gadget, setup_pkt) < 0) {
> +		spin_lock_irqsave(&crg_udc->udc_lock, *flags);
> +		crg_udc_set_ep0_halt(crg_udc);
> +		return;
> +	}
> +	spin_lock_irqsave(&crg_udc->udc_lock, *flags);
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

[Severity: High]
Can dropping crg_udc->udc_lock in crg_udc_handle_setup_pkt() race with a
concurrent reset, unbind, or new setup packet?

First, around flush_work(&crg_udc->udc_reset_work), if a new setup packet
aborted an in-flight control transfer, crg_udc_abort_ep0_for_setup() has
already set ep0_state =3D EP0_STATE_IDLE before udc_lock is dropped for
flush_work(), allowing a concurrent usb_ep_queue() on EP0 to bypass the
EP0_STATE_ABORTING check in crg_udc_queue_ctrl(). In addition, if a
controller reset (crg_udc_reset() and crg_udc_reset_data_struct())
completes while udc_lock is dropped, crg_udc->resetting is false again and
udc_event[0].generation has been incremented, but crg_udc_handle_setup_pkt()
does not verify udc_event[0].generation and continues processing the stale
pre-reset setup packet.

Second, after udc_lock is dropped for driver->setup() and reacquired,
neither the error branch nor the USB_REQ_SET_CONFIGURATION branch rechecks
crg_udc->resetting, crg_udc->gadget_driver, crg_udc->async_callbacks,
crg_udc->ep0_state, crg_udc->setup_tag, or udc_event[0].generation:

1. If async_callbacks was cleared during gadget stop/unbind, or if
   crg_udc_reset() is currently polling SWRST with udc_lock dropped (where
   crg_udc->resetting is true while udc_ep[0].ep_state is still
   EP_STATE_RUNNING), the error path unconditionally calls
   crg_udc_set_ep0_halt(crg_udc), queueing a status TRB and ringing
   doorbell 0 during reset or teardown.

2. If driver->setup() succeeded for USB_REQ_SET_CONFIGURATION while a
   concurrent reset or disconnect occurred, the post-lock block overwrites
   crg_udc->device_state and the gadget state with USB_STATE_CONFIGURED or
   USB_STATE_ADDRESS.

Should crg_udc_handle_setup_pkt() keep ep0_state in EP0_STATE_ABORTING
until flush_work() finishes, and validate the event generation,
crg_udc->resetting, crg_udc->async_callbacks, and crg_udc->setup_tag after
reacquiring udc_lock?

[1] https://lore.kernel.org/r/20261020-axiado-ax3000-usb-device-controller-=
v3-4-3012ecfc0a93@axiado.com
[2] https://lore.kernel.org/r/20261020-axiado-ax3000-usb-device-controller-=
v3-4-3012ecfc0a93@axiado.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-axiado-ax3=
000-usb-device-controller-v4-0-c5267b36a777@axiado.com?part=3D4
