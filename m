Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489961;
	b=wxyjb+nRv2IRKcJxprcmQ3tMa0EhE7H24GQ22gwHPUQXGbeLQ3grl2a6R0MXz9Av2odF
	 emWEo3fSVDmElqHUe4ZClKiXFLkkI1YmuS0rPfWHtxNK5bU8+vgxe9t4z8uySiSd4IJoq
	 p36HNsskT0i4LMX7mBsDdziqF1a4h76eVTj+nYTTitxABcHcREX1GCK/pJCT5CRSiQPjz
	 mz6JR0HEisWf+4fDpBN8YXVESgQztvUAVqHhNMhf5hi59QyhOlIB5REiKOAIjXfg65USI
	 uVtiuFU37n7Xajj6Z/ybWZ6M25CLSJMwz34DQutbgtYHqCvICZp6Tx7ubO/xFB4qpUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489961;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1LIfscoaC7piMrg2VxJ7b33py9DGLcBFORrN/fLy0zI=;
	b=3PF4YhArAHXTNFEjhcatOLGNjAGQvIiSb8WeAb6tcY2ieoogWfHcApCaRo8RxLNXsF3N
	 YKnFgQ2rhRINJY6XDOQXL0FXfXjjJ9RUvV/fjZ8Vo2P5HLdkXRRaGCbMObrWLhaDTQCFD
	 jRf4zzDg6gfiahRi011405IxMhq19K8NwEZ9Ph/pCSvSb2SBfmKVC6Ce/Mkk0JtbzqG0V
	 urbcOpzUkP92RzU6Wfo8D0uJltElN7QHRK6jVZpd3Q7uLIOR+qYAoFN7tMWBXMAXI+Log
	 wWMzfLNRagcPRS8F6TgVdoZdS4c87+4HCOCiS94STMPRTXGsXcRLByp3K0VCDAGDkcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PQVXUWQ5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0901606A326;
	Tue, 20 Oct 2026 09:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PQVXUWQ5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C9421F000C6;
	Tue, 20 Oct 2026 09:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792489960;
	bh=1LIfscoaC7piMrg2VxJ7b33py9DGLcBFORrN/fLy0zI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PQVXUWQ5s6HH2m5E5AIqJYbFbbdUCNh6VwE5FjWNgmH5KtlIEYZGGpJtTqkvtIScf
	 qHgeniDn3i9Cd4X1hD1RNhVAbhEMqDhd+ir3gdZUfX9RXAsN6OPpAfeUP8WMe1X86P
	 X0dqj8vI8bRKZTQMnr12QprMRGHZQC3OcBPGIkNZrXE0/rqxR8Q/aFdET8WxzU4GK8
	 SNigseEyYw7XqnAo+/e4n5aubpSC+O58P9BtaAF4v42hImEDMPx1kvFkLWkBviiCjm
	 oCaUCFNaca6KteHPhHEWZTKQGJz4c5XsrnzNrJwIfL5HTqYP4jEtCFgX4+9diKHP60
	 GmbHbZ0yBiFsg==
Message-ID: <sashiko-outbox-178767@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/6] usb: gadget: udc: crg: Add core driver and build
 integration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261020-axiado-ax3000-usb-device-controller-v3-6-3012ecfc0a93@axiado.com>
References: <20261020-axiado-ax3000-usb-device-controller-v3-0-3012ecfc0a93@axiado.com>
 <20261020-axiado-ax3000-usb-device-controller-v3-6-3012ecfc0a93@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 09:52:39 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] usb: gadget: crg: crg_udc_reset() clears ep->enabled before discon=
nect()
- [High] usb: gadget: crg: premature resetting clear and missing checks in =
crg_udc_reset()
- [Medium] usb: gadget: crg: premature IRQ and data init before ep setup in=
 crg_udc_probe()
- [Medium] usb: gadget: crg: premature unlocked state reset in crg_udc_remo=
ve()
- [Medium] usb: gadget: crg: race in crg_udc_shutdown() on uccr->control an=
d pullup_on
- [Medium] usb: gadget: udc: crg: 32-bit dma_addr_t shift overflow under CO=
MPILE_TEST
- [Medium] usb: gadget: crg: crg_udc_issue_command() overwrites pending com=
mand when RUN is 0
- [Low] usb: gadget: udc: crg: deprecated SIMPLE_DEV_PM_OPS and missing pm_=
sleep_ptr()
--

commit 0ef71bda637190f9d2012396d35661e2929b2b80
Author: Petar Stepanovic <pstepanovic@axiado.com>

usb: gadget: udc: crg: Add core driver and build integration

This patch adds the core probe, remove, reset, and interrupt handling
functions for the Axiado AX3000/AX3005 UDC driver and wires the driver
into Kconfig and Makefile.

> diff --git a/drivers/usb/gadget/udc/crg/Kconfig b/drivers/usb/gadget/udc/=
crg/Kconfig
> new file mode 100644
> index 0000000000000..7167c4943389b
> --- /dev/null
> +++ b/drivers/usb/gadget/udc/crg/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0
> +config USB_CRG_UDC
> +	tristate "Corigine / Axiado USB Device Controller"
> +	depends on USB_GADGET
> +	depends on HAS_DMA
> +	depends on ARCH_AXIADO || COMPILE_TEST

[Severity: Medium]
Can enabling COMPILE_TEST here break 32-bit builds where dma_addr_t is
32 bits wide (CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dn)?

In drivers/usb/gadget/udc/crg/crg-udc-gadget.c, crg_udc_ep_dequeue() and
crg_udc_handle_xfer_event() shift values cast to dma_addr_t left by 32 bits:

drivers/usb/gadget/udc/crg/crg-udc-gadget.c:crg_udc_ep_dequeue() {
	...
	dq_pt_addr =3D (dma_addr_t)deq_pt_lo | ((dma_addr_t)deq_pt_hi << 32);
	...
}

drivers/usb/gadget/udc/crg/crg-udc-gadget.c:crg_udc_handle_xfer_event() {
	...
		trb =3D crg_udc_tran_trb_dma_to_virt(
			udc_ep_ptr,
			(dma_addr_t)le32_to_cpu(event->dw0) |
				((dma_addr_t)le32_to_cpu(event->dw1) << 32));
	...
}

On 32-bit architectures without 64-bit dma_addr_t, shifting a 32-bit type
by 32 bits triggers -Wshift-count-overflow. Should those shifts cast to u64
first (like is_request_dequeued() and crg_udc_update_dequeue_pt() already
do)?

[ ... ]

> diff --git a/drivers/usb/gadget/udc/crg/crg-udc-core.c b/drivers/usb/gadg=
et/udc/crg/crg-udc-core.c
> new file mode 100644
> index 0000000000000..80a4fc6a61e88
> --- /dev/null
> +++ b/drivers/usb/gadget/udc/crg/crg-udc-core.c
> @@ -0,0 +1,706 @@

[ ... ]

> +/*
> + * command related ops
> + */
> +int crg_udc_issue_command(struct crg_gadget_dev *crg_udc,
> +			  enum crg_cmd_type type, u32 param0, u32 param1)
> +{
> +	struct crg_uccr __iomem *uccr =3D crg_udc->uccr;
> +	u32 status;
> +	bool check_complete =3D false;
> +	u32 tmp;
> +
> +	/*
> +	 * The command state machine only runs while the controller itself is
> +	 * running. Once RUN is cleared (e.g. during udc_stop()/reset()), the
> +	 * hardware never processes queued commands, so ACTIVE never clears.
> +	 * Skip the busy/completion checks in that case instead of getting
> +	 * stuck on a command the hardware will never service.
> +	 */
> +	tmp =3D readl(&uccr->control);
> +	if (tmp & CRG_U3DC_CTRL_RUN)
> +		check_complete =3D true;
> +
> +	if (check_complete) {
> +		tmp =3D readl(&uccr->cmd_control);
> +		if (tmp & CRG_U3DC_CMD_CTRL_ACTIVE) {
> +			dev_err(crg_udc->dev,
> +				"previous command is not complete\n");
> +			return -EBUSY;
> +		}
> +	}
> +	/* Ensure that everything is written before issuing new command */
> +	dma_wmb();
> +
> +	writel(param0, &uccr->cmd_param0);
> +	writel(param1, &uccr->cmd_param1);
> +
> +	tmp =3D CRG_U3DC_CMD_CTRL_ACTIVE |
> +	      FIELD_PREP(CRG_U3DC_CMD_CTRL_TYPE_MASK, type);
> +	writel(tmp, &uccr->cmd_control);
> +
> +	if (!check_complete)
> +		return 0;

[Severity: Medium]
What happens when multiple commands are issued while CRG_U3DC_CTRL_RUN is 0,
or when a command is issued immediately after CRG_U3DC_CTRL_RUN is asserted?

Because the controller has a single set of command registers
(uccr->cmd_param0, uccr->cmd_param1, uccr->cmd_control) and the hardware
does not clear CRG_U3DC_CMD_CTRL_ACTIVE while CRG_U3DC_CTRL_RUN is 0:

1. crg_udc_init_ep0() issues CRG_CMD_INIT_EP0 while CRG_U3DC_CTRL_RUN is 0
   in crg_udc_probe(), crg_gadget_stop(), crg_udc_handle_port_status() on
   disconnect, and crg_gadget_handle_interrupt() on CRG_U3DC_STATUS_SYS_ERR,
   leaving CRG_CMD_INIT_EP0 pending in uccr->cmd_control. Similarly,
   crg_udc_set_pullup(crg_udc, false) in crg_gadget_pullup() and
   crg_udc_suspend() clears CRG_U3DC_CTRL_RUN while endpoints remain
   enabled.

2. If another command is issued before CRG_U3DC_CTRL_RUN is set (for
   example via crg_udc_ep_enable(), crg_udc_ep_dequeue() issuing
   CRG_CMD_STOP_EP followed by CRG_CMD_SET_TR_DQPTR, or crg_udc_ep_halt()
   issuing CRG_CMD_RESET_SEQNUM, CRG_CMD_CLEAR_HALT, and
   CRG_CMD_SET_TR_DQPTR back-to-back), check_complete is false and
   crg_udc_issue_command() overwrites the unserviced command in
   uccr->cmd_control.

3. When crg_udc_set_pullup(crg_udc, true) later sets CRG_U3DC_CTRL_RUN, it
   does not wait for a pending CRG_U3DC_CMD_CTRL_ACTIVE command to finish,
   so a command issued right after RUN is set can see
   CRG_U3DC_CMD_CTRL_ACTIVE still set and fail with -EBUSY.

Can this cause CRG_CMD_INIT_EP0 or endpoint commands to be lost or fail
with -EBUSY?

[ ... ]

> +static int crg_udc_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	spin_lock_irqsave(&crg_udc->udc_lock, flags);
> +	ret =3D crg_udc_reset(crg_udc, &flags);
> +	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +	if (ret)
> +		goto err_free_resources;
> +
> +	crg_udc_clear_portpm(crg_udc);
> +
> +	ret =3D crg_gadget_irq_init(pdev, crg_udc);
> +	if (ret)
> +		goto err_free_resources;
> +
> +	ret =3D crg_udc_reset_data_struct(crg_udc);
> +	if (ret) {
> +		dev_err(crg_udc->dev, "crg_udc_reset_data_struct error\n");
> +		goto err_free_resources;
> +	}
> +
> +	crg_udc_init_ep_info(crg_udc);
> +	ret =3D crg_udc_init_ep0(crg_udc);
> +	if (ret)
> +		goto err_free_resources;

[Severity: Medium]
Should crg_udc_init_ep_info(), crg_udc_reset_data_struct(), and
crg_udc_init_ep0() run before crg_gadget_irq_init(), with
crg_udc_init_ep_info() called before crg_udc_reset_data_struct()?

With the current ordering in crg_udc_probe():

1. crg_udc_reset_data_struct() runs before crg_udc_init_ep_info() has
   initialized crg_udc->udc_ep[0], and calls:

   crg_udc_reset_data_struct()
     -> crg_udc_alloc_request(&crg_udc->udc_ep[0].usb_ep, GFP_ATOMIC)
       -> trace_crg_udc_alloc_request(udc_ep, udc_req_ptr)

   where udc_ep[0].usb_ep.name, ops, and crg_udc are still NULL.

2. crg_gadget_irq_init() registers the shared IRQ (IRQF_SHARED |
   IRQF_ONESHOT) before crg_udc_reset_data_struct(), crg_udc_init_ep_info(),
   and crg_udc_init_ep0() have initialized the event rings, endpoint list
   heads, and EP0 transfer ring. Because crg_udc_common_irq() only checks
   uccr->status for CRG_U3DC_STATUS_EINT | CRG_U3DC_STATUS_SYS_ERR without
   checking CRG_U3DC_CTRL_INT_EN, an interrupt arriving in this window runs
   crg_gadget_handle_interrupt() under spin_lock_irqsave(&crg_udc->udc_lock,
   flags) while udc_ep[0].tran_ring_info.cpu_addr is still NULL, causing
   crg_udc_init_ep0() to call dma_alloc_coherent(..., GFP_KERNEL) while
   holding the spinlock:

drivers/usb/gadget/udc/crg/crg-udc-ep0.c:crg_udc_init_ep0() {
	...
	if (!udc_ep_ptr->tran_ring_info.cpu_addr) {
		...
		vaddr =3D dma_alloc_coherent(crg_udc->dev, len, &dma, GFP_KERNEL);
	...
}

> +
> +	crg_udc->udc_ep[0].desc =3D &crg_udc->ep0_desc;
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
> +	u32 tmp;
> +
> +	crg_udc->device_state =3D USB_STATE_ATTACHED;
> +	crg_udc_set_vbus_detect(crg_udc, false);
> +
> +	usb_del_gadget(&crg_udc->gadget);
> +	cancel_work_sync(&crg_udc->udc_reset_work);
> +	crg_udc_free_resources(crg_udc);

[Severity: Medium]
In crg_udc_remove(), why are crg_udc->device_state and VBUS detection
updated before usb_del_gadget(&crg_udc->gadget) and without holding
crg_udc->udc_lock?

While a gadget driver is bound and active, the controller and its interrupt
handler remain active until usb_del_gadget() unbinds the gadget driver and
invokes crg_gadget_stop() (which already sets crg_udc->device_state =3D
USB_STATE_ATTACHED and calls crg_udc_set_vbus_detect(crg_udc, false)).

Setting crg_udc->device_state =3D USB_STATE_ATTACHED before usb_del_gadget()
causes any concurrent crg_udc_handle_event() execution for
TRB_TYPE_EVT_TRANSFER to see crg_udc->device_state < USB_STATE_RECONNECTING
and drop in-flight transfer completion events:

drivers/usb/gadget/udc/crg/crg-udc-gadget.c:crg_udc_handle_event() {
	...
	case TRB_TYPE_EVT_TRANSFER:
		if (crg_udc->device_state < USB_STATE_RECONNECTING) {
			dev_err(crg_udc->dev,
				"Xfer compl event rcved when dev state=3D%d !\n",
				crg_udc->device_state);
			break;
		}

		ret =3D crg_udc_handle_xfer_event(crg_udc, event, flags);
	...
}

> +
> +	/* set controller host role */
> +	tmp =3D readl(crg_udc->mmio_virt_base + CRG_UDC_MODE_REG) & ~0x1;
> +	writel(tmp, crg_udc->mmio_virt_base + CRG_UDC_MODE_REG);
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
> +	crg_udc->device_state =3D USB_STATE_ATTACHED;
> +	crg_udc_set_pullup(crg_udc, false);
> +	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
> +	crg_udc_set_vbus_detect(crg_udc, false);
> +	if (crg_udc->uccr) {
> +		u32 val =3D readl(&crg_udc->uccr->control);
> +
> +		val &=3D ~CRG_U3DC_CTRL_INT_EN;
> +		writel(val, &crg_udc->uccr->control);
> +	}
> +	if (crg_udc->irq >=3D 0)
> +		synchronize_irq(crg_udc->irq);
> +}

[Severity: Medium]
Can crg_udc_shutdown() race with crg_gadget_handle_interrupt() and leave
the controller running with interrupts enabled?

In crg_udc_shutdown():
1. crg_udc_set_pullup(crg_udc, false) clears CRG_U3DC_CTRL_RUN, but
   crg_udc->pullup_on is not cleared.
2. &crg_udc->uccr->control is read-modify-written to clear
   CRG_U3DC_CTRL_INT_EN after dropping crg_udc->udc_lock and before
   synchronize_irq(crg_udc->irq).
3. If crg_udc_irq_thread() -> crg_gadget_handle_interrupt() is running
   concurrently (for instance, recovering from CRG_U3DC_STATUS_SYS_ERR where
   crg_udc_reset() drops and reacquires udc_lock), it observes
   crg_udc->pullup_on =3D=3D true and calls crg_udc_set_pullup(crg_udc, tru=
e),
   which sets CRG_U3DC_CTRL_SYSERR_EN | CRG_U3DC_CTRL_INT_EN |
   CRG_U3DC_CTRL_RUN in uccr->control again.
4. crg_udc->udc_reset_work is not cancelled with cancel_work_sync().

Should crg_udc->pullup_on =3D false and the CRG_U3DC_CTRL_INT_EN clear be
done under crg_udc->udc_lock, followed by synchronize_irq() and
cancel_work_sync(&crg_udc->udc_reset_work)?

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
> +		crg_udc->connected =3D 0;
> +		if (was_connected)
> +			crg_udc_notify_disconnect(crg_udc, &flags);

[Severity: High]
Does calling crg_udc_reset() before crg_udc_notify_disconnect() here
prevent gadget function drivers from cleaning up on disconnect?

In crg_udc_reset(), udc_ep_ptr->usb_ep.enabled is cleared to 0 for all
non-EP0 endpoints:

	for (i =3D 2; i < CRG_NUM_EP_CX; i++) {
		...
		udc_ep_ptr->ep_state =3D EP_STATE_DISABLED;
		udc_ep_ptr->usb_ep.enabled =3D 0;
	}

When crg_udc_notify_disconnect() then invokes
crg_udc->gadget_driver->disconnect() -> composite_disconnect() ->
reset_config(), function drivers whose ->disable() callbacks guard teardown
on ep->enabled (such as rndis_disable() checking rndis->notify->enabled, or
ecm_disable() and eem_disable() checking port.in_ep->enabled) see
enabled =3D=3D 0 and return without calling rndis_uninit() or
gether_disconnect(). On subsequent re-enumeration, their ->set_alt()
callbacks also check in_ep->enabled before calling gether_disconnect(),
leaking the previous session's usb_request objects.

Should crg_udc_notify_disconnect() be called before crg_udc_reset(), matchi=
ng
the disconnect path in crg_udc_handle_port_status()?

[ ... ]

> +int crg_udc_reset(struct crg_gadget_dev *crg_udc, unsigned long *flags)
> +{
> +	struct crg_uccr __iomem *uccr =3D crg_udc->uccr;
> +	u32 i, tmp;
> +	struct crg_udc_ep *udc_ep_ptr;
> +	u32 val;
> +
> +	val =3D readl(&uccr->control);
> +	val |=3D CRG_U3DC_CTRL_SWRST;
> +	writel(val, &uccr->control);
> +	crg_udc->resetting =3D true;
> +	spin_unlock_irqrestore(&crg_udc->udc_lock, *flags);
> +	/* Poll until SWRST clears; hardware reset takes up to 10 ms */
> +	if (readl_poll_timeout_atomic(&uccr->control, tmp,
> +			       !(tmp & CRG_U3DC_CTRL_SWRST), 10, 10000)) {
> +		spin_lock_irqsave(&crg_udc->udc_lock, *flags);
> +		crg_udc->resetting =3D false;
> +		dev_err(crg_udc->dev, "reset error\n");
> +		return -ETIMEDOUT;
> +	}
> +	spin_lock_irqsave(&crg_udc->udc_lock, *flags);
> +	crg_udc->resetting =3D false;
> +
> +	crg_udc_clear_portpm(crg_udc);
> +
> +	crg_udc->setup_status =3D WAIT_FOR_SETUP;
> +	/* Base on Figure 9-1, default USB_STATE is attached */
> +	crg_udc->device_state =3D USB_STATE_ATTACHED;
> +	crg_udc->dev_addr =3D 0;
> +
> +	/* Complete any reqs on EP1-EP15 queue */
> +	for (i =3D 2; i < CRG_NUM_EP_CX; i++) {
> +		udc_ep_ptr =3D &crg_udc->udc_ep[i];
> +
> +		if (udc_ep_ptr->desc) {
> +			udc_ep_ptr->desc =3D NULL;
> +			udc_ep_ptr->comp_desc =3D NULL;
> +			crg_udc_ep_nuke(udc_ep_ptr, -ESHUTDOWN);
> +		}
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
> +	/* Complete any reqs on EP0 queue */
> +	udc_ep_ptr =3D &crg_udc->udc_ep[0];
> +	if (udc_ep_ptr->desc) {
> +		udc_ep_ptr->desc =3D NULL;
> +		udc_ep_ptr->comp_desc =3D NULL;
> +		crg_udc_ep_nuke(udc_ep_ptr, -ESHUTDOWN);
> +	}
> +
> +	return 0;
> +}

[Severity: High]
Can dropping crg_udc->udc_lock during crg_udc_reset() allow other threads or
completion callbacks to touch registers and ring doorbells while the
controller is mid-reset or before its rings and contexts are reinitialized?

There appear to be two windows here when crg_udc_reset() is called at
runtime (from crg_gadget_handle_interrupt(), crg_udc_handle_port_status(),
or crg_gadget_stop()):

1. While udc_lock is dropped polling for CRG_U3DC_CTRL_SWRST to clear, all
   endpoints still have desc !=3D NULL and ep_state =3D=3D EP_STATE_RUNNING=
, and
   only crg_udc_ep_queue() checks crg_udc->resetting. Concurrent calls to
   crg_udc_ep_dequeue(), crg_udc_ep_disable(), crg_udc_ep_enable(),
   crg_udc_ep_set_halt(), crg_udc_ep_set_wedge(), crg_gadget_pullup(),
   crg_gadget_wakeup(), crg_udc_suspend(), or crg_udc_resume() can acquire
   udc_lock and issue commands or write registers while SWRST is active.

2. crg_udc->resetting is set back to false immediately after SWRST clears,
   before the loop over udc_ep[2..CRG_NUM_EP_CX - 1] and udc_ep[0], and
   before the caller runs crg_udc_reset_data_struct() and
   crg_udc_init_ep0(). Inside the loop, crg_udc_ep_nuke() ->
   crg_udc_req_done() drops udc_lock around usb_gadget_giveback_request()
   while crg_udc->resetting is already false and remaining endpoints j > i
   (as well as udc_ep[0]) still have desc !=3D NULL:

drivers/usb/gadget/udc/crg/crg-udc-gadget.c:crg_udc_ep_queue() {
	...
	if (udc_ep_ptr->desc !=3D desc || !udc_req_ptr->usb_req.complete ||
	    !list_empty(&udc_req_ptr->queue) || crg_udc->resetting) {
	...
}

   A completion callback or another CPU waiting in crg_udc_ep_queue() for a
   later endpoint j > i (or EP0) will see both udc_ep_ptr->desc =3D=3D desc=
 and
   crg_udc->resetting =3D=3D false, and will queue TRBs and ring the doorbe=
ll on
   a wiped controller before crg_udc_reset_data_struct() and
   crg_udc_init_ep0() have reprogrammed DCBAP, the event rings, and EP0.

> +
> +static const struct crg_udc_priv crg_udc_data =3D {
> +	.quirks =3D CRG_UDC_QUIRKS_DEFAULT,
> +};
> +
> +static const struct of_device_id of_crg_udc_match[] =3D {
> +	{ .compatible =3D "axiado,ax3000-udc", .data =3D &crg_udc_data },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, of_crg_udc_match);
> +
> +static SIMPLE_DEV_PM_OPS(crg_udc_pm_ops, crg_udc_suspend, crg_udc_resume=
);
> +
> +static struct platform_driver crg_udc_driver =3D {
> +	.probe =3D crg_udc_probe,
> +	.remove =3D crg_udc_remove,
> +	.shutdown =3D crg_udc_shutdown,
> +	.driver =3D {
> +		.name =3D KBUILD_MODNAME,
> +		.of_match_table =3D of_crg_udc_match,
> +		.pm =3D &crg_udc_pm_ops,
> +	},
> +};

[Severity: Low]
SIMPLE_DEV_PM_OPS() is deprecated in include/linux/pm.h. Could this use
DEFINE_SIMPLE_DEV_PM_OPS(crg_udc_pm_ops, crg_udc_suspend, crg_udc_resume)
with pm_sleep_ptr(&crg_udc_pm_ops) (and drop __maybe_unused from
crg_udc_suspend() and crg_udc_resume()) so the PM callbacks and ops struct
are omitted when CONFIG_PM_SLEEP is disabled?

[ ... ]

>
endasi

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-axiado-ax3=
000-usb-device-controller-v3-0-3012ecfc0a93@axiado.com?part=3D6
