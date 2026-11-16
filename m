Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863706;
	b=NrwjaoEYWiMpPOwSW4XR26UKbilYu5ZX0DieoUXP1O2+a/5W9N6J5GcXIGExe1PNqXVO
	 P0pRil2qw4O9QNrF+0WH0tSvUCx9D8vAqkjJYWJKjhDsqcIbXEMXuBVqaa3ZhJXDuigO6
	 xCdXigJcSJ88j+j6TZ6HS2ZpQZ5kWwRPQMOPZe7rUzIMfqbLMfoWYTqINMMcCrCPkS1Lr
	 B4SWrPIW/UkQiLTFhUp3/LPyhG6aLj3aIXJgJcYNp3oIsukydrlGIjwBQJl9l3XQbV1JZ
	 2hhMRyb8l0Nxg6eezCOT3yAjMXTVAe5ggJHWGY+uuEE+B64J6UXj510NShD02J/lNnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863706;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=uDqZ7wzsp15o8TvM1seElC4dLO4eVjLTe7FriFkbbuA=;
	b=SkAeIDsHk9Ogh6n4dusRc6zjSHPiROPZzrvSiOxjd/omJQFfOnzu6O+QNT+jk8IKg7RR
	 7UjozqIfDygfoAORZU0SwkS9DIoYv9RbA4ojawg7fE3l0DaoMAQrP2eccJE/FGBFQMmJK
	 BfbEsd1ttx1a2vWQM7j2KrkCwCVeZfHA9of8LogExAmnHJt8LiWiR0y7Rlma0ypGjJiGb
	 VdgJVNq1oM+iexE1Oo2KMoKDEhp9BYnc675XIYEEylQp25gF18xGNo1oIZ+9yHoP9Gygw
	 fAKEvmN/BiEnqU5VPyG6ZTOiMmT7nUkCQLmn5f55vNj32QCXY9bK6NQWLdU68TpSzVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="DLS/5HS3";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454A6606A333;
	Mon, 16 Nov 2026 21:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DLS/5HS3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40EEE1F000C4;
	Mon, 16 Nov 2026 21:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794863705;
	bh=uDqZ7wzsp15o8TvM1seElC4dLO4eVjLTe7FriFkbbuA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DLS/5HS3D18v1wDT/ZwGvayXOWIDdkoUB02E/UHB0nTIzQXvD+KmWC/DRKRhQYvz0
	 556lahEyT2+dAckBmaJBXR/H5rd1AOqyeMcqYCt3I+fhE4L/Okunu5jsW2HMGhFtj2
	 5syG9ZTq0tqeSwrUn+EYlXZmCabfnnTCUA1yZZvJJhE5cXLWn5tF2RmP6WmUK52zr9
	 vGTEitNRq0JHdWQT7VNoaJpP7cjtDBFvPXBqoAWlYABxUtsd+FPC4ouyEK3QCot0Vg
	 Ts6Jc68zxUB1mOE+W9STuDTCLAK0m7cNVUJJ2SWNvw+K3d+s5YupP+Ns7bG4VRLurd
	 oQVTr5vLauuLg==
Message-ID: <sashiko-outbox-217695@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/6] usb: gadget: udc: crg: Add core driver and build
 integration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-axiado-ax3000-usb-device-controller-v5-6-49271ed5c793@axiado.com>
References: <20261116-axiado-ax3000-usb-device-controller-v5-0-49271ed5c793@axiado.com>
 <20261116-axiado-ax3000-usb-device-controller-v5-6-49271ed5c793@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 21:15:04 +0000
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
- [High] usb: gadget: crg: unhandled level IRQ storm in
  crg_udc_common_irq()
- [High] usb: gadget: crg: broken endpoint teardown and UAF in
  crg_udc_suspend()
- [Medium] usb: gadget: crg: missing crg_udc_prepare_for_setup() in port
  reset workers
- [Medium] usb: gadget: crg: unscheduled external reset on
  crg_udc_recover() timeout
- [Medium] usb: gadget: crg: lost link restart in crg_udc_restart_link()
  during reset
- [Medium] usb: gadget: crg: lost disconnect on SYS_ERR when
  bus_reset_pending is set
- [Medium] usb: gadget: crg: uncancelled work items on probe error and
  remove
- [Medium] usb: gadget: crg: uncleared connected flag before disconnect
  on SYS_ERR
- [Medium] usb: gadget: crg: missing DMA quiescence wait in
  crg_udc_shutdown()
- [Medium] usb: gadget: udc: crg: lost reset notification in
  crg_udc_handle_port_status()
--

commit 808e1b308d74053a13eba452fa900f8bf2bf60a5
Author: Petar Stepanovic <pstepanovic@axiado.com>

usb: gadget: udc: crg: Add core driver and build integration

This patch adds the core platform driver, interrupt handling, reset and
recovery logic, and Kconfig/Makefile integration for the Corigine/Axiado
AX3000/AX3005 USB Device Controller.

> diff --git a/drivers/usb/gadget/udc/crg/crg-udc-core.c b/drivers/usb/gadg=
et/udc/crg/crg-udc-core.c
> new file mode 100644
> index 0000000000000..e508dbd45339f
> --- /dev/null
> +++ b/drivers/usb/gadget/udc/crg/crg-udc-core.c
[ ... ]
> +	crg_udc->resetting =3D false;
> +
> +	ret =3D crg_gadget_irq_init(pdev, crg_udc);
> +	if (ret)
> +		goto err_free_resources;
> +
> +	ret =3D usb_add_gadget(&crg_udc->gadget);
> +	if (ret)
> +		goto err_free_resources;
> +
> +	return 0;
> +
> +err_free_resources:
> +	crg_udc_free_resources(crg_udc);
> +err_put_gadget:
> +	usb_put_gadget(&crg_udc->gadget);
> +	return ret;
> +}
> +
> +static void crg_udc_remove(struct platform_device *pdev)
> +{
> +	struct crg_gadget_dev *crg_udc =3D platform_get_drvdata(pdev);
> +	unsigned long flags;
> +	u32 tmp;
> +
> +	spin_lock_irqsave(&crg_udc->udc_lock, flags);
> +	crg_udc->shutting_down =3D true;
> +	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +
> +	/* The gadget core calls pullup(0) before the disconnect callback. */
> +	usb_del_gadget(&crg_udc->gadget);
> +	cancel_delayed_work_sync(&crg_udc->port_retry_work);
> +	cancel_work_sync(&crg_udc->recovery_work);
> +	cancel_work_sync(&crg_udc->udc_reset_work);
> +	crg_udc_free_resources(crg_udc);

[Severity: Medium]
Can an interrupt scheduled between crg_gadget_irq_init() and a failing
usb_add_gadget() leave port_retry_work, recovery_work, or udc_reset_work
queued after crg_udc is freed?

crg_udc_free_resources() synchronizes and frees the IRQ, then frees the DMA
rings, without cancelling those three work items before usb_put_gadget()
frees crg_udc.  In crg_udc_remove(), the work items are also cancelled
before crg_udc_free_resources() synchronizes and frees the IRQ rather than
after.

> +
> +	/* Do not access registers while the external reset is asserted. */
> +	if (!crg_udc->hw_reset_asserted && !crg_udc->dma_quiesce_failed) {
> +		tmp =3D readl(crg_udc->mmio_virt_base + CRG_UDC_MODE_REG) & ~0x1;
> +		writel(tmp, crg_udc->mmio_virt_base + CRG_UDC_MODE_REG);
> +	}
> +
> +	platform_set_drvdata(pdev, NULL);
> +	usb_put_gadget(&crg_udc->gadget);
> +}
> +
> +static void crg_udc_shutdown(struct platform_device *pdev)
> +{
> +	struct crg_gadget_dev *crg_udc =3D platform_get_drvdata(pdev);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&crg_udc->udc_lock, flags);
> +	crg_udc->pullup_on =3D false;
> +	crg_udc->shutting_down =3D true;
> +	crg_udc->resetting =3D true;
> +	crg_udc->device_state =3D USB_STATE_ATTACHED;
> +	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +	if (crg_udc->irq >=3D 0)
> +		synchronize_irq(crg_udc->irq);
> +	cancel_delayed_work_sync(&crg_udc->port_retry_work);
> +	cancel_work_sync(&crg_udc->recovery_work);
> +	cancel_work_sync(&crg_udc->udc_reset_work);
> +
> +	/* Reset and gadget stop may own the registers across a lock drop. */
> +	spin_lock_irq(&crg_udc->udc_lock);
> +	wait_event_lock_irq(crg_udc->teardown_wait,
> +			    !crg_udc->controller_recovering, crg_udc->udc_lock);
> +	if (crg_udc->uccr && !crg_udc->hw_reset_asserted) {
> +		u32 val =3D readl(&crg_udc->uccr->control);
> +
> +		crg_udc_set_vbus_detect(crg_udc, false);
> +		val &=3D ~(CRG_U3DC_CTRL_INT_EN | CRG_U3DC_CTRL_RUN |
> +			 CRG_U3DC_CTRL_SYSERR_EN);
> +		writel(val, &crg_udc->uccr->control);
> +	}
> +	spin_unlock_irq(&crg_udc->udc_lock);
> +}

[Severity: Medium]
Does crg_udc_shutdown() return before bus-master DMA has actually stopped?

As noted in crg_udc_soft_reset(), clearing CRG_U3DC_CTRL_RUN does not halt
DMA or pending event-ring writes until CRG_U3DC_STATUS_DEV_CTRL_HALT
asserts.  Returning without waiting for halt or calling crg_udc_quiesce_hw()
leaves DMA active across shutdown or kexec.

> +
> +static int crg_udc_suspend(struct device *dev)
> +{
> +	struct crg_gadget_dev *crg_udc =3D dev_get_drvdata(dev);
> +	unsigned long flags;
> +	u32 val;
> +	int ret;
> +
> +	spin_lock_irqsave(&crg_udc->udc_lock, flags);
> +	if (crg_udc->controller_recovering || crg_udc->shutting_down ||
> +	    crg_udc->external_reset_pending ||
> +	    crg_udc->endpoint_recovery_pending ||
> +	    (crg_udc->hw_reset_asserted && !crg_udc->gadget_stopping)) {
> +		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +		return -EBUSY;
> +	}
> +	crg_udc->suspended =3D true;
> +	if (crg_udc->gadget_stopping) {
> +		if (crg_udc->hw_dma_armed) {
> +			crg_udc->suspended =3D false;
> +			ret =3D -EBUSY;
> +		} else {
> +			ret =3D 0;
> +		}
> +		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +		return ret;
> +	}
> +	crg_udc_set_pullup(crg_udc, false);
> +	val =3D readl(&crg_udc->uccr->control);
> +	val &=3D ~CRG_U3DC_CTRL_INT_EN;
> +	writel(val, &crg_udc->uccr->control);
> +	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +
> +	if (crg_udc->irq >=3D 0)
> +		synchronize_irq(crg_udc->irq);
> +	cancel_delayed_work_sync(&crg_udc->port_retry_work);
> +	cancel_work_sync(&crg_udc->recovery_work);
> +	cancel_work_sync(&crg_udc->udc_reset_work);
> +
> +	spin_lock_irqsave(&crg_udc->udc_lock, flags);
> +	if (crg_udc->gadget_stopping || crg_udc->shutting_down ||
> +	    crg_udc->controller_recovering || crg_udc->external_reset_pending ||
> +	    crg_udc->endpoint_recovery_pending) {
> +		ret =3D -EBUSY;
> +		goto out;
> +	}
> +	/*
> +	 * A reset may already have marked the link disconnected while its
> +	 * gadget notification was still pending. Deliver disconnect before
> +	 * resetting the software state, including that cancelled work.
> +	 */
> +	if (crg_udc->connected || crg_udc->bus_reset_pending)
> +		crg_udc_notify_disconnect(crg_udc, &flags);
> +	crg_udc->connected =3D false;
> +	crg_udc->gadget.speed =3D USB_SPEED_UNKNOWN;
> +	if (crg_udc->external_reset_pending || crg_udc->endpoint_recovery_pendi=
ng) {
> +		ret =3D -EBUSY;
> +		goto out;
> +	}
> +	ret =3D crg_udc_recover(crg_udc, &flags);
> +	if (ret)
> +		dev_err(crg_udc->dev, "suspend controller reset failed: %d\n", ret);
> +out:
> +	if (ret) {
> +		crg_udc->suspended =3D false;
> +		crg_udc_kick_reset_work(crg_udc);
> +	}
> +	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +	return ret;
> +}

[Severity: High]
Can crg_udc_suspend() cause a use-after-free on queued usb_requests when
crg_udc_notify_disconnect() disables endpoints?

crg_udc_suspend() sets crg_udc->suspended =3D true and clears CRG_U3DC_CTRL=
_RUN
via crg_udc_set_pullup(crg_udc, false) before calling
crg_udc_notify_disconnect() and crg_udc_recover().  When the gadget driver's
->disconnect() callback invokes usb_ep_disable() -> crg_udc_ep_disable() on
an active endpoint, polling uccr->ep_enable or uccr->ep_running can time out
with RUN cleared and call crg_udc_recover_endpoints() ->
crg_udc_recover_link().  Because crg_udc_recover_link() rejects
crg_udc->suspended with -EBUSY, usb_ep_disable() returns without stopping D=
MA
or draining udc_ep->queue, and the function driver frees its usb_requests
before crg_udc_recover() -> crg_udc_reset_queues() -> crg_udc_ep_nuke() giv=
es
them back.

In addition, if usb_ep_dequeue() runs during that window,
crg_udc_abort_ep0_for_setup() or CRG_CMD_STOP_EP fails because suspended is
set and RUN is clear, setting endpoint_recovery_pending =3D true and causing
crg_udc_suspend() to abort with -EBUSY instead of running crg_udc_recover().
And if crg_udc_suspend() takes the early goto out before crg_udc_recover(),
CRG_U3DC_CTRL_RUN and CRG_U3DC_CTRL_INT_EN remain cleared while
crg_udc->suspended is reset to false.

[ ... ]
> +	if (tmp_status & CRG_U3DC_STATUS_SYS_ERR) {
> +		bool was_connected =3D crg_udc->connected;
> +		u32 generation =3D crg_udc->udc_event[0].generation;
> +
> +		/* A controller reset must not overlap composite's ->reset(). */
> +		if (crg_udc->reset_callback_active) {
> +			writel(CRG_U3DC_STATUS_SYS_ERR, &uccr->status);
> +			crg_udc->deferred_system_error =3D true;
> +			spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +			return;
> +		}
> +
> +		dev_err(crg_udc->dev, "controller system error\n");
> +		writel(CRG_U3DC_STATUS_SYS_ERR, &uccr->status);
> +		/* Function drivers must see enabled endpoints on disconnect. */
> +		if (was_connected)
> +			crg_udc_notify_disconnect(crg_udc, &flags);

[Severity: Medium]
If CRG_U3DC_STATUS_SYS_ERR fires after a bus reset has already cleared
crg_udc->connected while crg_udc->bus_reset_pending is still true, does this
drop the gadget reset/disconnect notification?

Unlike crg_udc_suspend(), which checks crg_udc->connected ||
crg_udc->bus_reset_pending, this path only checks crg_udc->connected and
then calls crg_udc_recover_link(crg_udc, &flags, false), which clears
bus_reset_pending and marks all endpoints disabled without notifying the
gadget driver.

> +		/*
> +		 * The disconnect callback drops udc_lock: another CPU may be
> +		 * resetting now, or may have reset and rebuilt the rings
> +		 * already, in which case this error has been recovered.
> +		 */
> +		if (crg_udc->resetting || crg_udc->suspended ||
> +		    crg_udc->shutting_down ||
> +		    generation !=3D crg_udc->udc_event[0].generation) {
> +			spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +			return;
> +		}
> +		crg_udc_recover_link(crg_udc, &flags, false);

[Severity: Medium]
Should crg_udc->connected (and device_state) be cleared before calling
crg_udc_notify_disconnect() here?

Because crg_udc_notify_disconnect() drops udc_lock while crg_udc->connected
is still true and crg_udc->device_state is still USB_STATE_CONFIGURED, a
concurrent crg_udc_suspend() or port status handler can deliver a second
disconnect notification.  Also, if usb_ep_disable() inside ->disconnect()
times out on the faulted controller and calls crg_udc_recover_endpoints(),
notify_reset evaluates to true (via device_state =3D=3D USB_STATE_CONFIGURE=
D and
gadget_callbacks_active) and queues a bus reset on top of the disconnect.

[ ... ]
> +	if (crg_udc->device_state =3D=3D USB_STATE_RECONNECTING &&
> +	    crg_udc->portsc_on_reconnecting =3D=3D 1 &&
> +	    crg_udc_is_event_rings_empty(crg_udc)) {
> +		crg_udc->portsc_on_reconnecting =3D 0;
> +		crg_udc_handle_port_status(crg_udc, &flags);
> +		/* The port handler drops udc_lock. */
> +		if (crg_udc->resetting) {
> +			spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +			return;
> +		}
> +	}

[Severity: Medium]
Can a second port event while crg_udc->bus_reset_pending is true clear
bus_reset_pending without notifying the gadget driver?

When an initial bus reset on a configured gadget runs crg_udc_reinit(crg_ud=
c,
true), crg_udc->device_state becomes USB_STATE_RECONNECTING and
crg_udc->bus_reset_pending is set to true until udc_reset_work runs.  If a
second port reset, a port-reset timeout in crg_udc_port_retry_work(), or a
CCS drop with VBUS present arrives before udc_reset_work runs, those paths
only check crg_udc->device_state =3D=3D USB_STATE_CONFIGURED (or pass false=
 to
crg_udc_reinit()):

drivers/usb/gadget/udc/crg/crg-udc-gadget.c:crg_udc_handle_port_status() {
    ...
				bool was_configured =3D crg_udc->device_state =3D=3D
						       USB_STATE_CONFIGURED;
				bool notify_reset =3D was_configured &&
					crg_udc->async_callbacks &&
					crg_udc->gadget_driver;
				int reinit_ret;

				reinit_ret =3D crg_udc_reinit(crg_udc, notify_reset);
    ...
}

crg_udc_reinit(crg_udc, false) then overwrites crg_udc->bus_reset_pending
with false and clears usb_ep.enabled on all endpoints without running
usb_gadget_udc_reset().

> +
> +	if (crg_udc->device_state =3D=3D USB_STATE_RECONNECTING &&
> +	    crg_udc->connected =3D=3D 1) {
> +		ret =3D crg_udc_prepare_for_setup(crg_udc);
> +		if (!ret && crg_udc->pending_setup_valid &&
> +		    !crg_udc->resetting && crg_udc->connected &&
> +		    crg_udc->device_state =3D=3D USB_STATE_DEFAULT) {
> +			struct usb_ctrlrequest setup =3D crg_udc->pending_setup;
> +			u8 tag =3D crg_udc->pending_setup_tag;
> +
> +			crg_udc->pending_setup_valid =3D false;
> +			crg_udc_dispatch_setup(crg_udc, &setup, tag, &flags);
> +		} else if (ret && ret !=3D -EBUSY) {
> +			dev_err(crg_udc->dev,
> +				"failed to prepare EP0 after reset: %d\n", ret);
> +		}
> +	}

[Severity: Medium]
What prepares EP0 and transitions device_state out of USB_STATE_RECONNECTING
when crg_udc_handle_port_status() is called from crg_udc_port_retry_work() =
or
crg_udc_reset_work()?

When a port reset on a session with device_state >=3D USB_STATE_DEFAULT
completes inside crg_udc_handle_port_status(), crg_udc_reinit() sets
device_state =3D USB_STATE_RECONNECTING and crg_udc_handle_port_status() se=
ts
connected =3D 1 without calling crg_udc_enable_setup().  Only
crg_gadget_handle_interrupt() runs the USB_STATE_RECONNECTING block above to
call crg_udc_prepare_for_setup() and dispatch pending_setup; the two worker
callers of crg_udc_handle_port_status() return with the controller stuck in
USB_STATE_RECONNECTING.

> +
> +	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +}
> +
> +/*
> + * Primary handler only checks whether the shared interrupt belongs to t=
he
> + * controller. All controller work, including reset polling, runs in the
> + * threaded handler and therefore never busy-waits in hard IRQ context.
> + */
> +static irqreturn_t crg_udc_common_irq(int irq, void *dev)
> +{
> +	struct crg_gadget_dev *crg_udc =3D dev;
> +	struct crg_uccr __iomem *uccr =3D crg_udc->uccr;
> +	u32 status;
> +
> +	if (READ_ONCE(crg_udc->gadget_stopping) ||
> +	    READ_ONCE(crg_udc->shutting_down) ||
> +	    READ_ONCE(crg_udc->resetting))
> +		return IRQ_NONE;
> +
> +	status =3D readl(&uccr->status);
> +	if (!(status & (CRG_U3DC_STATUS_EINT | CRG_U3DC_STATUS_SYS_ERR)))
> +		return IRQ_NONE;
> +
> +	return IRQ_WAKE_THREAD;
> +}

[Severity: High]
Can returning IRQ_NONE here while the level-triggered interrupt is still
asserted cause a hard-IRQ storm that disables the shared IRQ line?

The IRQ is registered with IRQF_SHARED | IRQF_ONESHOT, so the line is only
masked when crg_udc_common_irq() returns IRQ_WAKE_THREAD.  Several paths set
resetting, shutting_down, or gadget_stopping and re-enable local interrupts
before CRG_U3DC_CTRL_INT_EN and CRG_U3DC_CTRL_SYSERR_EN are cleared in
uccr->control:

crg_udc_reset()
  crg_udc_reset_session()
    crg_udc->resetting =3D true;
  spin_unlock_irqrestore(&crg_udc->udc_lock, *flags)
  <hardirq>
    crg_udc_common_irq()
      if (READ_ONCE(crg_udc->resetting))
        return IRQ_NONE;  <-- level IRQ still asserted; storms

The same window exists in crg_udc_remove() during usb_del_gadget(), in
crg_udc_shutdown() before synchronize_irq(), and in crg_udc_stop_gadget()
when controller_recovering is true.  Similarly, when suspended or
controller_recovering is true while resetting is false (such as during
crg_udc_reinit()), crg_udc_common_irq() wakes crg_udc_irq_thread(), which
returns early in crg_gadget_handle_interrupt() without clearing
uccr->status and unmasks the still-asserted level interrupt in a tight loop.

[ ... ]
> +static void crg_udc_restart_link(struct crg_gadget_dev *crg_udc,
> +				 bool notify_reset)
> +{
> +	if (!crg_udc->async_callbacks || !crg_udc->gadget_driver ||
> +	    crg_udc->reset_callback_active)
> +		return;
> +
> +	if (notify_reset) {
> +		crg_udc->bus_reset_pending =3D true;
> +		crg_udc->restart_after_reset =3D true;
> +		crg_udc_kick_reset_work(crg_udc);
> +	} else if (!crg_udc->suspended && crg_udc->pullup_on) {
> +		crg_udc_set_pullup(crg_udc, true);
> +	}
> +}

[Severity: Medium]
If crg_udc_recover_endpoints() runs while crg_udc->reset_callback_active is
true, does this lose the post-reset pullup restart?

When usb_ep_disable() times out inside usb_gadget_udc_reset() and calls
crg_udc_recover_endpoints() -> crg_udc_recover_link(), crg_udc_reset() clea=
rs
crg_udc->restart_after_reset =3D false and resets the controller (clearing
CRG_U3DC_CTRL_RUN).  crg_udc_restart_link() then returns early because
reset_callback_active is true, leaving restart_after_reset false when
crg_udc_reset_work() finishes.

[ ... ]
> +int crg_udc_recover(struct crg_gadget_dev *crg_udc, unsigned long *flags)
> +{
> +	int ret;
> +
> +	if (crg_udc->controller_recovering || crg_udc->shutting_down ||
> +	    crg_udc->gadget_stopping || crg_udc->hw_reset_asserted)
> +		return -EBUSY;
> +
> +	crg_udc_recovery_begin(crg_udc);
> +	ret =3D crg_udc_reset(crg_udc, flags);
> +	if (ret) {
> +		crg_udc->controller_faulted =3D true;
> +		crg_udc->dma_quiesce_failed =3D crg_udc->hw_dma_armed;
> +		crg_udc_reset_queues(crg_udc, crg_udc->preserve_ep_enabled_on_reset);
> +	}
> +	if (!ret && !crg_udc->shutting_down && !crg_udc->gadget_stopping)
> +		ret =3D crg_udc_reset_data_struct(crg_udc);
> +	if (!ret && !crg_udc->shutting_down && !crg_udc->gadget_stopping)
> +		ret =3D crg_udc_init_ep0(crg_udc);
> +	if (!ret && (crg_udc->shutting_down || crg_udc->gadget_stopping))
> +		ret =3D -ESHUTDOWN;
> +
> +	crg_udc->controller_faulted =3D !!ret;
> +	crg_udc->resetting =3D !!ret;
> +	if (!ret)
> +		crg_udc->stopped_needs_reset =3D false;
> +	crg_udc_recovery_end(crg_udc);
> +	return ret;
> +}

[Severity: Medium]
When crg_udc_reset() times out in crg_udc_recover(), should this set
crg_udc->external_reset_pending when crg_udc->dma_quiesce_failed &&
crg_udc->rst, like crg_udc_recover_link() does?

crg_udc_reset_session() clears external_reset_pending, and on timeout
crg_udc_reset_queues() quarantines any active DMA bounce buffers into
crg_udc->dma_quarantine.  When crg_udc_recover() is called directly from
crg_udc_suspend() or crg_gadget_pullup(), external_reset_pending is never
set, so crg_udc_kick_reset_work() does not schedule recovery_work to assert
the external reset and release the quarantined buffers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-axiado-ax3=
000-usb-device-controller-v5-0-49271ed5c793@axiado.com?part=3D6
