Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795004649;
	b=HeBWPWWday40kAdV3UVNZperTQDlWTc3E1BA5cJuy3IdS/rvTkhLuIa62tDlF9Ld11bK
	 MMd0nXTnX24D8pXfcMg+dX7y7LSmcQLNUBb1fyZt+kdR+c4WUbmtXks4heSK6O7D1M4pQ
	 AZDOLG2qeUvnmkBSiCf6rwRcbUNuzUQYlW5Tqj8NXIC4YeYIrrJfu8/eF2Qg1vju/ChFz
	 2Ikw7toSjNu9OWdyQEgLFIwjEJr3/kfdqLQ4IxXvHcXp+xvhGduJpRf+esDjxZTRF9zBA
	 RKETh2yBjsQt+JJEtzmWf60tQJ0TSXzzohmy3mqIMERBOClZLLNECz9L/e4HoIoWtOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795004649;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=II4UWFNx/cZpv0DUeJE+ZLVrSvY7u4A27br/rrS4l1g=;
	b=iKNbggnSN2QfEyujsN3GKPmCcab7Xxx7msQ0aKiYiEB71feOyY2Nhs6ateFCFSncbweW
	 VyMzQf/bWJTLNpxqRyRWT6rJFfLz7oBriyA11CnOTUbbCB4Ly4zQdzdHpC6Xihce/uA/X
	 jenTBsn3zt6pOeyvF4VUX069q8tLmZzKk56I18DCIlCuCIXFLAUZl3BULomjvLhVOfL13
	 44X9M6DD+vAQvCcqt1xMf0pzS4DXRWPhFu2rB1Vd6fFqFiF5FPg2Hzr5nnNUNLsGsuza+
	 cy/YCJLRBXsCVpyXUEjz/JurzZGlR5WdmhCgRceLJYBpMY/Uac6Ey6d2czNUMy+9PxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VTFHL3Cd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CE8606A31C
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 12:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VTFHL3Cd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B54571F000C4;
	Wed, 18 Nov 2026 12:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795004648;
	bh=II4UWFNx/cZpv0DUeJE+ZLVrSvY7u4A27br/rrS4l1g=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=VTFHL3Cdiv9JBMrsfTh4iLrVR80dYonG8g8XHatl9wCXySj0Kfu6wlWvw+SyYK/aR
	 +yLfCcLTnNA4+WLmnaur+VZHSqiX4a80iNTX3aWSU/j86y6oDeqtgxSJwcSR9gk+ST
	 Qc+FnNz8J4d9GW8Ol0x8l2EU28VUJKhoXkT4zD4SYEYqBeHzHFh965LfC+snf1mFcP
	 DpwYWptNnNHCRhmtD43iKXLNpWoZ6143VJS2UzawC44Bl6NSGLodBcKYHyqEJK+exL
	 1RaXlBr3GUCxajT6piq4M0uSVNnfpfLvC+J9eq8jXcsD6XU8fDM2UBhO+c45ZwYnaf
	 SQqeAi1Hg7LVQ==
Message-ID: <sashiko-outbox-220908@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: musb: gadget: mask the MUSB IRQ while complete()
 runs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandru Ardelean" <aardelean@taladin.ro>, linux-usb@vger.kernel.org
In-Reply-To: <20261118115435.49748-1-aardelean@taladin.ro>
References: <20261118115435.49748-1-aardelean@taladin.ro>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 12:24:08 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] usb: musb: gadget: premature IRQ unmask in musb_g_giveback()
  inside ISR
- [High] usb: musb: gadget: IRQ state corruption and self-deadlock in
  musb_g_giveback()
- [High] usb: musb: gadget: musb_ep_restart() runs complete() inside
  usb_ep_queue()
- [High] usb: musb: gadget: RX endpoint lockup from unstarted requests
  and IRQ race
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [High] usb: musb: skipped DMA abort in musb_gadget_dequeue() when
  ep->busy is set [1]
--

commit e287a2a9d7df9cb83cc08eb31d403c811c9fb5ba
Author: Alexandru Ardelean <aardelean@taladin.ro>

usb: musb: gadget: mask the MUSB IRQ while complete() runs

This commit reverts the RX FIFO flush in musb_ep_restart() from commit
3fc137386c46 ("usb: musb: Fix hardware lockup on first Rx endpoint
request") to call rxstate() again, and masks musb->nIrq across
usb_gadget_giveback_request() in musb_g_giveback().

> diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadge=
t.c
> index 016d3f3fc1e05..5cb7eb9c56de0 100644
> --- a/drivers/usb/musb/musb_gadget.c
> +++ b/drivers/usb/musb/musb_gadget.c
> @@ -145,7 +145,10 @@ __acquires(ep->musb->lock)
>  		unmap_dma_buffer(req, musb);
> =20
>  	trace_musb_req_gb(req);
> +	/* no MUSB interrupt during complete(), even if it enables IRQs */
> +	disable_irq_nosync(musb->nIrq);
>  	usb_gadget_giveback_request(&req->ep->end_point, &req->request);
> +	enable_irq(musb->nIrq);
>  	spin_lock(&musb->lock);
>  	ep->busy =3D busy;
>  }

[Severity: High]
Does calling disable_irq_nosync() and enable_irq() on musb->nIrq here
unmask the hardware interrupt line while musb->isr is still running?

Most calls to musb_g_giveback() happen inside musb->isr (via
musb_interrupt() -> musb_g_rx(), musb_g_tx(), and musb_g_ep0_irq()).
When enable_irq(musb->nIrq) drops the disable depth back to 0,
irq_enable() unconditionally unmasks the line at the irqchip and clears
IRQD_IRQ_MASKED.

Under forced IRQ threading (threadirqs or CONFIG_PREEMPT_RT), where
musb->nIrq runs as an IRQS_ONESHOT threaded handler, clearing
IRQD_IRQ_MASKED causes irq_finalize_oneshot() to skip
unmask_threaded_irq() when musb->isr finishes:

kernel/irq/manage.c:irq_finalize_oneshot() {
    ...
	if (!desc->threads_oneshot && !irqd_irq_disabled(&desc->irq_data) &&
	    irqd_irq_masked(&desc->irq_data))
		unmask_threaded_irq(desc);
    ...
}

On IRQCHIP_EOI_THREADED interrupt controllers, chip->irq_eoi() is never
called and musb->nIrq is permanently wedged.  On level-triggered
non-threaded interrupts, enable_irq() unmasks the line before glue ISRs
(such as tusb_musb_interrupt() or da8xx_musb_interrupt()) clear the
interrupt source after musb_interrupt() returns.

[Severity: High]
When musb_g_giveback() is called from process context via
musb_gadget_queue(), can musb->lock be re-acquired with local CPU
interrupts enabled, leading to a hardirq self-deadlock?

musb_gadget_queue() acquires musb->lock with spin_lock_irqsave().  When
musb_ep_restart() -> rxstate() completes a request immediately,
musb_g_giveback() drops musb->lock with plain spin_unlock(), leaving
local IRQs disabled when req->complete() is entered in process context.
In u_ether's rx_complete() -> netif_rx() -> __local_bh_enable_ip(), this
first triggers lockdep_assert_irqs_enabled(), and then leaves local IRQs
enabled upon return:

musb_gadget_queue()
  spin_lock_irqsave(&musb->lock, lockflags)
  ...
    musb_g_giveback()
      spin_unlock(&musb->lock)
      disable_irq_nosync(musb->nIrq)
      usb_gadget_giveback_request()
        rx_complete()
          netif_rx()
            __local_bh_enable_ip()      <-- enables local IRQs
      enable_irq(musb->nIrq)
      spin_lock(&musb->lock)            <-- local IRQs & nIrq enabled
      <hardirq: musb->nIrq or dma_controller_irq()>
        spin_lock_irqsave(&musb->lock)  <-- spins forever

If an interrupt fires after enable_irq() and before ep->busy =3D busy, a
nested musb_g_giveback() also snapshots ep->busy as 1 and restores it to
1, leaving ep->busy permanently stuck.

[Severity: High]
Can the RX endpoint still lock up when req->complete() queues the next
RX request while ep->busy is set?

While musb_g_giveback() is running from rxstate(), ep->busy is 1.  When
req->complete() (such as u_ether's rx_complete() -> rx_submit()) calls
usb_ep_queue(), musb_gadget_queue() adds the new request to
musb_ep->req_list but skips starting it because musb_ep->busy is 1:

drivers/usb/musb/musb_gadget.c:musb_gadget_queue() {
    ...
	/* it this is the head of the queue, start i/o ... */
	if (!musb_ep->busy && &request->list =3D=3D musb_ep->req_list.next) {
		status =3D musb_queue_resume_work(musb,
						musb_ep_restart_resume_work,
						request);
    ...
}

When musb_g_giveback() returns and restores ep->busy =3D 0, neither
rxstate() nor musb_ep_restart() checks next_request(musb_ep) to start
requests queued during the callback.  Any further requests queued in a
caller loop (such as rx_fill()) then see &request->list !=3D
musb_ep->req_list.next and also skip musb_ep_restart().

In addition, musb->lock is dropped before disable_irq_nosync(musb->nIrq),
so on SMP another CPU can handle musb->nIrq in that window while
musb_ep->req_list is empty, clear the hardware interrupt flag, and leave
MUSB_RXCSR_RXPKTRDY set with no started request.

[Severity: High]
This problem wasn't introduced by this patch, but can [1]
musb_gadget_dequeue() skip aborting an active DMA transfer when called
while ep->busy is set in musb_g_giveback()?

drivers/usb/musb/musb_gadget.c:musb_gadget_dequeue() {
    ...
	/* if the hardware doesn't have the request, easy ... */
	if (musb_ep->req_list.next !=3D &req->list || musb_ep->busy)
		musb_g_giveback(musb_ep, request, -ECONNRESET);

	/* ... else abort the dma transfer ... */
	else if (is_dma_capable() && musb_ep->dma) {
    ...
}

musb_g_giveback() sets ep->busy =3D 1 before dropping musb->lock even when
giving back a non-head request that was never handed to hardware:

usb_ep_dequeue(ep, req2)                 /* req1 active in DMA at head */
  musb_gadget_dequeue()
    musb_g_giveback(musb_ep, req2, ...)
      ep->busy =3D 1
      spin_unlock(&musb->lock)
      usb_gadget_giveback_request(..., req2)
        ...
          usb_ep_dequeue(ep, req1)
            musb_gadget_dequeue()
              if (... || musb_ep->busy)
                musb_g_giveback(musb_ep, req1, ...)
                  unmap_dma_buffer(req1, musb)  <-- DMA still active

The same happens if another CPU dequeues req1 while musb_g_giveback()
has dropped musb->lock.  Skipping channel_abort() unmaps req1's buffer
and completes the request while the DMA controller is still accessing it.

> @@ -1162,19 +1165,12 @@ void musb_free_request(struct usb_ep *ep, struct =
usb_request *req)
>   */
>  void musb_ep_restart(struct musb *musb, struct musb_request *req)
>  {
> -	u16 csr;
> -	void __iomem *epio =3D req->ep->hw_ep->regs;
> -
>  	trace_musb_req_start(req);
>  	musb_ep_select(musb->mregs, req->epnum);
> -	if (req->tx) {
> +	if (req->tx)
>  		txstate(musb, req);
> -	} else {
> -		csr =3D musb_readw(epio, MUSB_RXCSR);
> -		csr |=3D MUSB_RXCSR_FLUSHFIFO | MUSB_RXCSR_P_WZC_BITS;
> -		musb_writew(epio, MUSB_RXCSR, csr);
> -		musb_writew(epio, MUSB_RXCSR, csr);
> -	}
> +	else
> +		rxstate(musb, req);
>  }

[Severity: High]
Does calling rxstate() from musb_ep_restart() invoke req->complete()
synchronously inside usb_ep_queue() when an RX packet is already waiting
in the FIFO?

In PIO mode, rxstate() unloads the waiting packet and calls
musb_g_giveback() -> usb_gadget_giveback_request() -> req->complete()
before musb_gadget_queue() and usb_ep_queue() return.  This violates the
usb_ep_queue() contract (which forbids calling ->complete() from within
usb_ep_queue()) and breaks callers that update state or touch the
request after usb_ep_queue() returns, such as trace_usb_ep_queue() in
usb_ep_queue() or bot_enqueue_cmd_cbw():

drivers/usb/gadget/function/f_tcm.c:bot_enqueue_cmd_cbw() {
    ...
	ret =3D usb_ep_queue(fu->ep_out, fu->cmd[0].req, GFP_ATOMIC);
	if (!ret)
		fu->flags |=3D USBG_BOT_CMD_PEND;
    ...
}

If bot_cmd_complete() runs inside usb_ep_queue(), it clears
USBG_BOT_CMD_PEND, and bot_enqueue_cmd_cbw() then sets USBG_BOT_CMD_PEND
again on return, stalling subsequent CBW submissions.

[1] https://sashiko.dev/#/bug/linux-8787b453-429b-40d3-8db7-9c949b0a6861

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118115435.4974=
8-1-aardelean@taladin.ro?part=3D1
