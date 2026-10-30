Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349985;
	b=P6c83fpb4f+4TQsSRc9cDlczQ5VS9p9kwkA6vk1N8YqyBN9f7Hu/B5K6adflKEsxj7Ul
	 LuiUHqQNdnND3CiBlpaRArmCtsikpeYzC1cCjW/bdtl92/yhymQ45jfU7yYSgfdHBgQds
	 avzYnqlGBk5b01H5yVYKrwaSBG9rlyt/YExOgvGW0xX4QYDt59oLX7i8vd6Uc31WO/O8A
	 XqCDFUIFoppe/kgnyhal3AxBjtuiVrstVLqdiRuvmmXGpdoiSrc7iZxhEKkJAFjKOAEcV
	 3cDZxb7Jlwn1F5LzQwtdYc4JWzCC4Q/N4yvMMSh11qOdWs2iOZPuFGTnp+zV3KlGsCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349985;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CqBNKYKKousOeUU2t0yZSSGrlHOlMq8kBHDwamR7Wl8=;
	b=S6yUcjtKl5JdXPpe0kgW/l5NEbFZM+JN4cyfR/1qOK4K1LnZD/97tJp7498F82oUG4Ro
	 qhUBAFRcR1YN6yFfEHBmphT3xYXuNl6qUH2ATkrId4fygk2qtJ8xdFTmcEjtl8zMNeyTG
	 NF1a5VCkYo4Y9BNMAd6iqOY7+wBNyUyT/uu6mDlLgMXDQCFmhPdgW4nRNbQ/dscld6MYL
	 xK1tSkAFvEMtHshhmc6M4hXj53usLkoUQBp4o/xPY+DLDrohuUGT7qnIHxaEN516ntDOP
	 kWAlhR3ljAP6m9clEraG/Pc5CdZrQg9RbUkzIloBm5pC+ZBFoJVxEqg9A6LPLSeP+9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T65aU4SE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E38606A31E;
	Fri, 30 Oct 2026 08:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T65aU4SE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC4A1F000C1;
	Fri, 30 Oct 2026 08:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793349984;
	bh=CqBNKYKKousOeUU2t0yZSSGrlHOlMq8kBHDwamR7Wl8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T65aU4SE7RZMTIE7E8NSSnZAVIDpqhzFeuju+C4RTWwcKVTPGYkD4CqeXb/tNLuZS
	 F0Ai9MdBrfoHjSLB28lnuo4EOgU7YEG6iVJhEqS1775lQO326on7quZCd3l/qzCNC4
	 49EmjUA2wVJtULrzTUQMpMIXfls+ZWPXLbb9u+TVs0vgbNcOkG8iAl90OHGNAcgouZ
	 lYQD3FB1BA1rirXBQJvQk/hLfdLCccsLQ0n4I8uoK1qwJovUu0Ph4ZKfdFiaWelVRE
	 tqa7PmvrWyho973E/a86y+x9XgxsUD2olx4q1pnrVhhyGlo3TvuwSuyz+TyUTzG6k+
	 YwTywyQ3wu8qQ==
Message-ID: <sashiko-outbox-190713@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/6] usb: gadget: udc: crg: Add core driver and build
 integration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261030-axiado-ax3000-usb-device-controller-v4-6-c5267b36a777@axiado.com>
References: <20261030-axiado-ax3000-usb-device-controller-v4-0-c5267b36a777@axiado.com>
 <20261030-axiado-ax3000-usb-device-controller-v4-6-c5267b36a777@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 08:46:23 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [High] usb: udc: crg: dequeue fails in crg_udc_issue_command() when stopp=
ed
- [High] usb: gadget: crg: controller left stopped after disconnect reset
- [High] usb: gadget: crg: deferred crg_udc_prepare_for_setup() races with =
SETUP
- [High] usb: gadget: crg: GFP_KERNEL allocation in crg_udc_ep_enable()
- [High] usb: gadget: crg: race conditions when crg_udc_reset() drops udc_l=
ock
- [Medium] usb: udc: crg: stale reconnect and ep0 state across crg_udc_rese=
t()
- [Medium] usb: gadget: udc: crg: state inconsistency across crg_udc_suspen=
d() and resume
- [Medium] usb: gadget: udc: crg: race in crg_udc_suspend() re-enables pull=
up
- [Medium] usb: gadget: crg: race with IRQ thread in crg_udc_shutdown() and=
 teardown
- [Low] usb: gadget: crg: uncapped and unvalidated max_speed in crg_udc_pro=
be()
--

commit ff1f5c0791ff275876830e2f2710870a97b34e7c
Author: Petar Stepanovic <pstepanovic@axiado.com>

usb: gadget: udc: crg: Add core driver and build integration

This commit introduces the core probe, remove, power management, interrupt
handling, and controller reset functions for the Axiado AX3000/AX3005 USB
Device Controller driver, and integrates it into Kconfig and Makefile.

> diff --git a/drivers/usb/gadget/udc/crg/crg-udc-core.c b/drivers/usb/gadg=
et/udc/crg/crg-udc-core.c
> new file mode 100644
> index 0000000000000..33be5c920ebee
> --- /dev/null
> +++ b/drivers/usb/gadget/udc/crg/crg-udc-core.c
> @@ -0,0 +1,723 @@

[ ... ]

> +int crg_udc_issue_command(struct crg_gadget_dev *crg_udc,
> +			  enum crg_cmd_type type, u32 param0, u32 param1)
> +{
> +	struct crg_uccr __iomem *uccr =3D crg_udc->uccr;
> +	u32 status;
> +	u32 tmp;
> +	bool running;
> +
> +	running =3D !!(readl(&uccr->control) & CRG_U3DC_CTRL_RUN);
> +	/* Only INIT_EP0 may be staged while the controller is stopped. */
> +	if (!running && type !=3D CRG_CMD_INIT_EP0)
> +		return -ESHUTDOWN;

[Severity: High]
As reported by Sashiko on v3 [1], rejecting all commands other than
CRG_CMD_INIT_EP0 when CRG_U3DC_CTRL_RUN is clear causes crg_udc_ep_dequeue()
to fail with -ESHUTDOWN whenever the pullup has been disabled.

During gadget unbind (gadget_unbind_driver() -> usb_gadget_disconnect_locke=
d()
-> crg_gadget_pullup()), soft_connect disable, or crg_udc_suspend(),
crg_udc_set_pullup(crg_udc, false) clears CRG_U3DC_CTRL_RUN in uccr->control
while enabled endpoints remain in EP_STATE_RUNNING with active requests on
udc_ep->queue:

drivers/usb/gadget/udc/crg/crg-udc-gadget.c:crg_udc_ep_dequeue() {
	...
	if (old_ep_state =3D=3D EP_STATE_RUNNING) {
		int ret =3D crg_udc_issue_command(crg_udc, CRG_CMD_STOP_EP,
						BIT(dci), 0);

		if (ret) {
			spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
			return ret;
		}
	...
}

When a function driver's disconnect() or unbind() callback (or a FunctionFS
endpoint close) calls usb_ep_dequeue() -> crg_udc_ep_dequeue() before
crg_gadget_stop() runs, crg_udc_issue_command() returns -ESHUTDOWN for
CRG_CMD_STOP_EP (and would also reject CRG_CMD_SET_TR_DQPTR in
crg_udc_epcx_update_dqptr()). Because crg_udc_ep_dequeue() aborts without
unlinking or giving back the request, a subsequent usb_ep_free_request()
frees the request while it is still linked on udc_ep->queue, leading to a
use-after-free when crg_gadget_stop() -> crg_udc_reset() -> crg_udc_ep_nuke=
()
later traverses udc_ep->queue.

How should crg_udc_ep_dequeue() unlink and give back queued requests when
CRG_U3DC_CTRL_RUN is already clear?

[ ... ]

> +static int crg_udc_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	crg_udc->gadget.ops =3D &crg_gadget_ops;
> +	crg_udc->gadget.ep0 =3D &crg_udc->udc_ep[0].usb_ep;
> +	INIT_LIST_HEAD(&crg_udc->gadget.ep_list);
> +	/*
> +	 * The controller supports up to SuperSpeed. Honour the standard
> +	 * "maximum-speed" property to cap it; default to the hardware
> +	 * maximum when the property is absent.
> +	 */
> +	crg_udc->gadget.max_speed =3D usb_get_maximum_speed(&pdev->dev);
> +	if (crg_udc->gadget.max_speed =3D=3D USB_SPEED_UNKNOWN)
> +		crg_udc->gadget.max_speed =3D USB_SPEED_SUPER;
> +	crg_udc->max_speed =3D crg_udc->gadget.max_speed;

[Severity: Low]
The comment, Kconfig, and DT binding state that the controller supports
High-Speed and SuperSpeed and that the maximum-speed property caps the speed
up to SuperSpeed, but crg_udc_probe() only checks for USB_SPEED_UNKNOWN.

If the DT maximum-speed property is set to super-speed-plus
(USB_SPEED_SUPER_PLUS), crg_udc->gadget.max_speed is not capped to
USB_SPEED_SUPER and crg_udc_program_speed() writes CRG_U3DC_CFG0_MAXSPEED_S=
SP.
Conversely, if maximum-speed (or a gadget driver's max_speed passed to
crg_udc_set_speed()) is USB_SPEED_LOW, crg_udc_program_speed() returns
-EINVAL and aborts crg_udc_reset_data_struct().

Should crg_udc_probe() and crg_udc_set_speed() clamp speeds above
USB_SPEED_SUPER (or outside the supported range) to USB_SPEED_SUPER?

[ ... ]

> +static void crg_udc_shutdown(struct platform_device *pdev)
> +{
> +	struct crg_gadget_dev *crg_udc =3D platform_get_drvdata(pdev);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&crg_udc->udc_lock, flags);
> +	crg_udc->pullup_on =3D false;
> +	crg_udc->resetting =3D true;
> +	crg_udc->device_state =3D USB_STATE_ATTACHED;
> +	crg_udc_set_pullup(crg_udc, false);
> +	crg_udc_set_vbus_detect(crg_udc, false);
> +	if (crg_udc->uccr) {
> +		u32 val =3D readl(&crg_udc->uccr->control);
> +
> +		val &=3D ~(CRG_U3DC_CTRL_INT_EN | CRG_U3DC_CTRL_RUN);
> +		writel(val, &crg_udc->uccr->control);
> +	}
> +	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +	if (crg_udc->irq >=3D 0)
> +		synchronize_irq(crg_udc->irq);
> +	cancel_work_sync(&crg_udc->udc_reset_work);
> +}

[Severity: Medium]
As reported by Sashiko on v3 [2], what happens if crg_udc_irq_thread() is
already mid-recovery in crg_gadget_handle_interrupt() (or in the disconnect
reset path of crg_udc_handle_port_status()) and has dropped udc_lock inside
crg_udc_notify_disconnect() or crg_udc_reset() when crg_udc_shutdown() runs?

Once crg_udc_shutdown() releases udc_lock and waits in synchronize_irq(), t=
he
in-flight IRQ thread reacquires udc_lock, runs crg_udc_reset_data_struct() =
and
crg_udc_init_ep0(), and sets crg_udc->resetting =3D false, undoing the shut=
down
gate.

Similarly, in crg_udc_free_resources(), uccr->control is modified without
holding udc_lock before devm_free_irq() is called, while crg_udc_irq_thread=
()
can still be running after crg_gadget_stop() dropped udc_lock during
crg_udc_reset(). Couldn't that race on uccr->control or with resource
teardown?

> +
> +static int crg_udc_suspend(struct device *dev)
> +{
> +	struct crg_gadget_dev *crg_udc =3D dev_get_drvdata(dev);
> +	unsigned long flags;
> +
> +	/* Stop the pullup while the controller is suspended. */
> +	spin_lock_irqsave(&crg_udc->udc_lock, flags);
> +	if (!crg_udc->resetting)
> +		crg_udc_set_pullup(crg_udc, false);
> +	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +	return 0;
> +}

[Severity: Medium]
Can an in-flight CRG_U3DC_STATUS_SYS_ERR recovery in
crg_gadget_handle_interrupt() re-enable the pullup after crg_udc_suspend()
returns?

During system suspend, crg_udc_suspend() runs before device IRQs are disabl=
ed.
If crg_gadget_handle_interrupt() is handling CRG_U3DC_STATUS_SYS_ERR and has
dropped udc_lock in crg_udc_notify_disconnect() or crg_udc_reset(),
crg_udc_suspend() either sees crg_udc->resetting =3D=3D true and skips
crg_udc_set_pullup(crg_udc, false), or clears CRG_U3DC_CTRL_RUN and returns
while crg_udc->pullup_on remains true. When the IRQ thread finishes reset
recovery, it checks:

	if (!ret && crg_udc->pullup_on)
		crg_udc_set_pullup(crg_udc, true);

which re-asserts CRG_U3DC_CTRL_RUN while the controller is suspended. Should
crg_udc_suspend() synchronize with the IRQ/reset path and track a suspended
state so recovery does not re-assert CRG_U3DC_CTRL_RUN?

> +
> +static int crg_udc_resume(struct device *dev)
> +{
> +	struct crg_gadget_dev *crg_udc =3D dev_get_drvdata(dev);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&crg_udc->udc_lock, flags);
> +	if (!crg_udc->resetting && crg_udc->gadget_driver && crg_udc->pullup_on)
> +		crg_udc_set_pullup(crg_udc, true);
> +	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +
> +	return 0;
> +}

[Severity: Medium]
When crg_udc_suspend() clears CRG_U3DC_CTRL_RUN via
crg_udc_set_pullup(crg_udc, false) while the gadget is enumerated, the
controller halts and drops bus terminations so the host sees a disconnect,
but crg_udc_suspend() does not notify the gadget driver of disconnect or
reset crg_udc->connected, crg_udc->device_state, crg_udc->dev_addr, or
enabled endpoints.

When crg_udc_resume() re-asserts CRG_U3DC_CTRL_RUN:

1. If the cable was unplugged while suspended, CCS is already 0 when
   CRG_U3DC_CTRL_RUN is set, so no CSC event is generated and the gadget
   driver remains stuck in a connected/configured state with queued requests
   never completing.

2. If the cable remains connected to a SuperSpeed host, link training to U0
   raises CRG_U3DC_PORTSC_CSC without CRG_U3DC_PORTSC_PRC. In
   crg_udc_handle_port_status(), the CSC connect branch does not call
   crg_udc_reinit(), and because crg_udc->device_state is still
   USB_STATE_CONFIGURED or USB_STATE_ADDRESS (>=3D USB_STATE_RECONNECTING),
   neither crg_udc_enable_setup() nor crg_udc_prepare_for_setup() runs, the
   stale dev_addr and endpoints remain active, and setaddressrequest() stal=
ls
   SET_ADDRESS in USB_STATE_CONFIGURED.

Should crg_udc_suspend() disconnect the gadget session and reset controller
state before suspending?

[ ... ]

> +static void crg_gadget_handle_interrupt(struct crg_gadget_dev *crg_udc)
> +{
> +	struct crg_uccr __iomem *uccr =3D crg_udc->uccr;
> +	unsigned long flags =3D 0;
> +	u32 tmp_status;
> +	int ret;
> +
> +	spin_lock_irqsave(&crg_udc->udc_lock, flags);
> +
> +	tmp_status =3D readl(&uccr->status);
> +
> +	if (tmp_status & CRG_U3DC_STATUS_SYS_ERR) {
> +		bool was_connected =3D crg_udc->connected;
> +
> +		dev_err(crg_udc->dev, "controller system error\n");
> +		writel(CRG_U3DC_STATUS_SYS_ERR, &uccr->status);
> +		/* Function drivers must see enabled endpoints on disconnect. */
> +		if (was_connected)
> +			crg_udc_notify_disconnect(crg_udc, &flags);
> +		crg_udc->connected =3D 0;
> +		ret =3D crg_udc_reset(crg_udc, &flags);
> +		if (!ret)
> +			ret =3D crg_udc_reset_data_struct(crg_udc);
> +		if (!ret)
> +			ret =3D crg_udc_init_ep0(crg_udc);
> +		if (ret)
> +			dev_err(crg_udc->dev,
> +				"failed to recover from controller error: %d\n",
> +				ret);
> +		crg_udc->gadget.speed =3D USB_SPEED_UNKNOWN;
> +		if (!ret)
> +			crg_udc->resetting =3D false;
> +		if (!ret && crg_udc->pullup_on)
> +			crg_udc_set_pullup(crg_udc, true);

[Severity: High]
Here in the CRG_U3DC_STATUS_SYS_ERR recovery path, after crg_udc_reset(),
crg_udc_reset_data_struct(), and crg_udc_init_ep0() complete, the driver
restores the controller's running state via crg_udc_set_pullup(crg_udc, tru=
e)
when crg_udc->pullup_on is set.

However, in the cable disconnect (!cable_connected) branch of
crg_udc_handle_port_status(), the driver runs the same crg_udc_reset(),
crg_udc_reset_data_struct(), and crg_udc_init_ep0() sequence (which clears
uccr->config1 as well as CRG_U3DC_CTRL_INT_EN and CRG_U3DC_CTRL_RUN in
uccr->control, and stages CRG_CMD_INIT_EP0 while stopped) and then returns
-ECONNRESET without calling crg_udc_set_pullup(crg_udc, true):

drivers/usb/gadget/udc/crg/crg-udc-gadget.c:crg_udc_handle_port_status() {
	...
		} else if (!cable_connected) {
			dev_dbg(crg_udc->dev,
				"cable disconnected, rst controller\n");
			if (was_connected)
				crg_udc_notify_disconnect(crg_udc, flags);
			ret =3D crg_udc_reset(crg_udc, flags);
			if (!ret)
				ret =3D crg_udc_reset_data_struct(crg_udc);
			if (!ret)
				ret =3D crg_udc_init_ep0(crg_udc);
			if (ret)
				dev_err(crg_udc->dev,
					"controller reset failed on disconnect: %d\n",
					ret);
			else
				crg_udc->resetting =3D false;
			crg_udc->connected =3D 0;

			crg_udc->device_state =3D USB_STATE_ATTACHED;
			return -ECONNRESET;
		}
}

Because gadget disconnect callbacks do not re-invoke the pullup callback,
won't unplugging the USB cable leave CRG_U3DC_CTRL_RUN, CRG_U3DC_CTRL_INT_E=
N,
and uccr->config1 cleared so the controller never consumes CRG_CMD_INIT_EP0
or detects a subsequent cable reconnection?

[ ... ]

> +	if (tmp_status & CRG_U3DC_STATUS_EINT) {
> +		int i;
> +
> +		writel(CRG_U3DC_STATUS_EINT, &uccr->status);
> +
> +		for (i =3D 0; i < CRG_RING_NUM; i++) {
> +			ret =3D crg_udc_process_event_ring(crg_udc, i, &flags);

[Severity: High]
When crg_udc_process_event_ring() dispatches a SET_CONFIGURATION or
SET_INTERFACE control transfer via crg_udc_handle_event() ->
crg_udc_handle_setup_pkt(), it drops crg_udc->udc_lock and calls
driver->setup(&crg_udc->gadget, setup_pkt).

In composite_setup(), set_config() and f->set_alt() run under
spin_lock(&cdev->lock) and call usb_ep_enable() -> crg_udc_ep_enable().
However, crg_udc_ep_enable() drops udc_lock and allocates the transfer ring
with GFP_KERNEL:

drivers/usb/gadget/udc/crg/crg-udc-gadget.c:crg_udc_ep_enable() {
	...
		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
		new_ring =3D dma_alloc_coherent(crg_udc->dev, len, &new_dma,
					      GFP_KERNEL);
		spin_lock_irqsave(&crg_udc->udc_lock, flags);
	...
}

Since usb_ep_enable() is called while composite holds cdev->lock (and the
gadget API requires ep->ops->enable() to be callable in atomic context),
won't dma_alloc_coherent(..., GFP_KERNEL) sleep in atomic context?

> +			if (ret)
> +				dev_err(crg_udc->dev,
> +					"process event ring error: %d\n", ret);
> +		}
> +	}
> +
> +	if (crg_udc->device_state =3D=3D USB_STATE_RECONNECTING &&
> +	    crg_udc->portsc_on_reconnecting =3D=3D 1 &&
> +	    crg_udc_is_event_rings_empty(crg_udc)) {
> +		crg_udc->portsc_on_reconnecting =3D 0;
> +		crg_udc_handle_port_status(crg_udc, &flags);
> +	}
> +
> +	if (crg_udc->device_state =3D=3D USB_STATE_RECONNECTING &&
> +	    crg_udc->connected =3D=3D 1)
> +		crg_udc_prepare_for_setup(crg_udc);

[Severity: High]
When a bus reset (CRG_U3DC_PORTSC_PRC) completes while crg_udc->device_state
is at least USB_STATE_DEFAULT, crg_udc_handle_port_status() calls
crg_udc_reinit(), which sets crg_udc->device_state =3D USB_STATE_RECONNECTI=
NG,
and sets crg_udc->connected =3D 1 while CRG_U3DC_CFG1_SETUP_EVENT_EN remains
enabled in uccr->config1 from the prior connection.

Because crg_udc_prepare_for_setup() is only called here after
crg_udc_process_event_ring() finishes (and returns -EBUSY if the event ring
is not empty), what happens if the host's first post-reset SETUP packet is
already in the event ring behind the port status event, or arrives before
crg_udc_prepare_for_setup() checks crg_udc_is_event_rings_empty()?

In that case, crg_udc_process_event_ring() processes TRB_TYPE_EVT_SETUP_PKT
while crg_udc->device_state is still USB_STATE_RECONNECTING:
setaddressrequest() rejects USB_REQ_SET_ADDRESS and stalls EP0 because
device_state is neither USB_STATE_DEFAULT nor USB_STATE_ADDRESS, or another
control request queues a transfer on EP0 only for crg_udc_prepare_for_setup=
()
to immediately stop EP0 and nuke the newly queued request with -ESHUTDOWN.

[ ... ]

> +int crg_udc_reset(struct crg_gadget_dev *crg_udc, unsigned long *flags)
> +{
> +	struct crg_uccr __iomem *uccr =3D crg_udc->uccr;
> +	u32 i, tmp;
> +	struct crg_udc_ep *udc_ep_ptr;
> +	u32 val;
> +
> +	/*
> +	 * Keep all endpoint operations gated until the caller has recreated
> +	 * the event rings, device context and EP0 after this reset.
> +	 */
> +	crg_udc->resetting =3D true;
> +	val =3D readl(&uccr->control);
> +	val |=3D CRG_U3DC_CTRL_SWRST;
> +	writel(val, &uccr->control);
> +	spin_unlock_irqrestore(&crg_udc->udc_lock, *flags);
> +	/* Poll until SWRST clears; hardware reset takes up to 10 ms */
> +	if (readl_poll_timeout_atomic(&uccr->control, tmp,
> +			       !(tmp & CRG_U3DC_CTRL_SWRST), 10, 10000)) {
> +		spin_lock_irqsave(&crg_udc->udc_lock, *flags);
> +		dev_err(crg_udc->dev, "reset error\n");
> +		return -ETIMEDOUT;
> +	}
> +	spin_lock_irqsave(&crg_udc->udc_lock, *flags);
> +
> +	crg_udc_clear_portpm(crg_udc);
> +
> +	crg_udc->setup_status =3D WAIT_FOR_SETUP;
> +	/* Base on Figure 9-1, default USB_STATE is attached */
> +	crg_udc->device_state =3D USB_STATE_ATTACHED;
> +	crg_udc->dev_addr =3D 0;

[Severity: Medium]
When crg_udc_reset() resets crg_udc->device_state to USB_STATE_ATTACHED, it
does not clear crg_udc->portsc_on_reconnecting, crg_udc->setup_fn_call_back,
or crg_udc->set_tm (nor does crg_udc_reset_data_struct()).

If a port status event sets crg_udc->portsc_on_reconnecting =3D 1 while
crg_udc->device_state =3D=3D USB_STATE_RECONNECTING and crg_udc_reset() runs
before that flag is consumed (for example due to a cable disconnect,
CRG_U3DC_STATUS_SYS_ERR, or crg_gadget_stop()), won't the stale
portsc_on_reconnecting =3D=3D 1 persist until the next connection's bus res=
et
sets device_state =3D USB_STATE_RECONNECTING, causing crg_udc_prepare_for_s=
etup()
to fail with -EBUSY or crg_gadget_handle_interrupt() to call
crg_udc_handle_port_status() spuriously?

> +
> +	/*
> +	 * Mark all endpoints unavailable before request callbacks drop the
> +	 * lock. A callback must not enqueue on a later, not-yet-nuked EP.
> +	 */
> +	for (i =3D 2; i < CRG_NUM_EP_CX; i++) {
> +		udc_ep_ptr =3D &crg_udc->udc_ep[i];
> +		udc_ep_ptr->generation++;
> +		udc_ep_ptr->desc =3D NULL;
> +		udc_ep_ptr->comp_desc =3D NULL;
> +		udc_ep_ptr->tran_ring_full =3D false;
> +		udc_ep_ptr->ep_state =3D EP_STATE_DISABLED;
> +		/*
> +		 * This bypasses the generic usb_ep_disable() API, so the
> +		 * framework's own usb_ep.enabled bookkeeping needs to be
> +		 * cleared directly here too (crg_udc_reinit() already does
> +		 * this for the live bus-reset case). Otherwise a later
> +		 * usb_ep_enable() call for this endpoint short-circuits on
> +		 * the stale "already enabled" flag without ever calling our
> +		 * .enable callback, leaving desc/the ring never set up for
> +		 * the new session.
> +		 */
> +		udc_ep_ptr->usb_ep.enabled =3D 0;
> +	}
> +	crg_udc->num_enabled_eps =3D 0;
> +
> +	udc_ep_ptr =3D &crg_udc->udc_ep[0];
> +	udc_ep_ptr->generation++;
> +	udc_ep_ptr->desc =3D NULL;
> +	udc_ep_ptr->comp_desc =3D NULL;
> +	udc_ep_ptr->ep_state =3D EP_STATE_DISABLED;
> +
> +	for (i =3D 2; i < CRG_NUM_EP_CX; i++)
> +		crg_udc_ep_nuke(&crg_udc->udc_ep[i], -ESHUTDOWN);
> +	crg_udc_ep_nuke(udc_ep_ptr, -ESHUTDOWN);

[Severity: High]
As reported by Sashiko on v3 [3], dropping udc_lock inside crg_udc_reset()
(both during the 10 ms CRG_U3DC_CTRL_SWRST poll and inside crg_udc_ep_nuke()
-> crg_udc_req_done()) introduces several races:

1. Neither crg_gadget_handle_interrupt() nor crg_udc_process_event_ring()
   checks crg_udc->resetting after acquiring or reacquiring udc_lock, and
   udc_event->generation is not incremented until crg_udc_reset_data_struct=
()
   -> crg_udc_init_event_ring() runs after crg_udc_reset() returns. If
   crg_udc_irq_thread() acquires udc_lock while crg_udc_reset() is polling
   CRG_U3DC_CTRL_SWRST or giving back requests, it can access controller
   registers and process stale event ring entries mid-reset.

2. Callers of crg_udc_reset() (crg_gadget_handle_interrupt(),
   crg_udc_handle_port_status(), and crg_gadget_stop()) do not serialize
   against an already-running reset. If two reset paths overlap across the
   udc_lock drops, one can run crg_udc_reset_data_struct() and
   crg_udc_init_ep0() while the other's CRG_U3DC_CTRL_SWRST is active, or
   the second crg_udc_init_ep0() can see CRG_U3DC_CMD_CTRL_ACTIVE still set
   from the first staged CRG_CMD_INIT_EP0 while CRG_U3DC_CTRL_RUN is 0 and
   fail with -EBUSY.

3. During the 10 ms SWRST poll window, crg_udc->resetting is true while
   usb_ep.enabled is still 1 and requests remain on udc_ep[i].queue; then
   crg_udc_reset() clears udc_ep_ptr->usb_ep.enabled =3D 0 for all endpoints
   before calling crg_udc_ep_nuke() (which drops udc_lock per request). If a
   function driver concurrently calls usb_ep_disable() on a higher-numbered
   endpoint while an earlier endpoint is being nuked (or during the SWRST
   poll), usb_ep_disable() returns immediately without draining that
   endpoint's queue; when the function driver then calls
   usb_ep_free_request(), the freed request remains on udc_ep[i].queue and =
is
   dereferenced by crg_udc_ep_nuke().

Can reset execution and endpoint teardown be serialized so concurrent calle=
rs
wait for the reset and request givebacks to complete?

[1] https://lore.kernel.org/r/20261020-axiado-ax3000-usb-device-controller-=
v3-6-3012ecfc0a93@axiado.com
[2] https://lore.kernel.org/r/20261020-axiado-ax3000-usb-device-controller-=
v3-6-3012ecfc0a93@axiado.com
[3] https://lore.kernel.org/r/20261020-axiado-ax3000-usb-device-controller-=
v3-6-3012ecfc0a93@axiado.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-axiado-ax3=
000-usb-device-controller-v4-0-c5267b36a777@axiado.com?part=3D6
