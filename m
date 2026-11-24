Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795533822;
	b=S/wkZqVAHDTmD0VHzZuvQW4IKZwKL+yKUPTjgsF2nhFJyZIZJvAGC1fWbjS/qU08iogg
	 2TMf9fqBcUGFfqdgmQJdjzyEGPutbB9YJuLbruoI0wN174r/eyhCSDY+nJTq2m71oVCAG
	 m/wZ5Fo1y97PhteE5LmLWwf5rjQYywU8us1qkK42fKt1pyo6aEQJHldqqZU5qF0StX1R0
	 jtVCRDDSrArLeosmdW9DW1OXkZCKS6/K3yzowuiEKIcjtpA2PStQENwYKz13NnERAUMzi
	 R+XwVRLLx/y5ohidmclQEFnx+Xv7rijU9Q2SU+iqiDGG+Losu9BaE2ibWXfv4CqP06g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795533822;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CLvcDLqrYvITD2oYyU17hvGTPV2PumnAjTij2Ygmen0=;
	b=iQLJ8/RubhdzIAiniA2KYfByhMbQjY1C+ibgBT373gvAFpAhc2tNzdCrPw4a6ut/++Sr
	 W3cJmXigLaSonsZ2MNhIs0urm817tHDNEbdmVI8Mjb4eV1zzS5UinTnoiuUDp3LhcPagu
	 qULquqBzXuVxgevsNwXI34WM/IFNLIrZ0VjtvovrEoR3B2nJdX/da/RlVxAq+7IHXoGof
	 z1V12tlsQ3Tgb+2QqUDrXtBHfCibzEMKDh4h5kpoPf422fjL8737mHF7sYILrtp29Pxyq
	 rN9vYcPr4IpgKE4B+iv5W/vNHsWDFLxMxNAO5SLg3QxXFaVLl9YabolNZt6Av5NY4Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZqLFu+hL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB8D606A31E
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 15:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZqLFu+hL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F7CF1F000E0;
	Tue, 24 Nov 2026 15:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795533822;
	bh=CLvcDLqrYvITD2oYyU17hvGTPV2PumnAjTij2Ygmen0=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=ZqLFu+hLqPsq+CeYKLu69qTJaBrS5GBSn0Xu7dvP43x0hG268AonOSPSHzOtJCz6Y
	 exrx5Z2yZPHManE+FPps+i21JfXaD/hB6L+rDXxyXnnDpZsX5ZZifPRVm4w2A1NRSd
	 d+Ip0QyAnNqDvAYX9k6oo83i8goCmv9ayc5T43Lgee6UKGqW06c5H6qdbmhhcTBUGL
	 dkk7zM2ZM6R9BeabuRjfkPS8GRuLvGdTfVaJZppOYjfYgiQ6ci4oaglM9BNuFQZWse
	 jvthg3cbQR7JOOKX4y91Z32mojvd6pg2n6oBNqhwdCZPeT/pOZukZkyPy+PbFuiO0D
	 dmo+EvkCC8vBA==
Message-ID: <sashiko-outbox-231400@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] usb: musb: gadget: mask the MUSB IRQ while
 complete() runs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandru Ardelean" <aardelean@taladin.ro>, linux-usb@vger.kernel.org
In-Reply-To: <20261124150344.69264-3-aardelean@taladin.ro>
References: <20261124150344.69264-1-aardelean@taladin.ro>
 <20261124150344.69264-3-aardelean@taladin.ro>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 15:23:41 +0000
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
- [High] usb: musb: gadget: spin_lock() with IRQs enabled in
  musb_g_giveback()
- [High] usb: musb: gadget: enable_irq() in musb_g_giveback() unmasks
  active ISR
- [Medium] usb: musb: gadget: SMP race window around IRQ masking in
  musb_g_giveback()
- [Medium] usb: musb: gadget: per-request IRQ disable/enable overhead on
  hot path
--

commit 4f83c5c2c1d92794ca51395229cf5b4d310d1f0c
Author: Alexandru Ardelean <aardelean@taladin.ro>

usb: musb: gadget: mask the MUSB IRQ while complete() runs

This commit masks the MUSB controller IRQ around
usb_gadget_giveback_request() in musb_g_giveback() so that a request
completion callback that enables local interrupts does not allow an MUSB
interrupt to be serviced while the endpoint request queue is empty.

> diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadge=
t.c
> index dd67ab97df9d8..5cb7eb9c56de0 100644
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
Can calling plain spin_lock(&musb->lock) after enable_irq(musb->nIrq)
deadlock on musb->lock when req->complete() returns with local CPU
interrupts enabled?

Callers such as musb_gadget_queue() enter with local interrupts disabled
via spin_lock_irqsave(&musb->lock, lockflags), and musb_g_giveback() drops
the lock with plain spin_unlock(&musb->lock).  When musb_gadget_queue()
runs in process context and restarts an Rx endpoint via
musb_queue_resume_work() -> ... -> rxstate() -> musb_g_giveback(),
u_ether's rx_complete() calls netif_rx() -> local_bh_enable() ->
__local_bh_enable_ip():

kernel/softirq.c:__local_bh_enable_ip() {
	WARN_ON_ONCE(in_hardirq());
	lockdep_assert_irqs_enabled();
#ifdef CONFIG_TRACE_IRQFLAGS
	local_irq_disable();
#endif
	...
	preempt_count_dec();
#ifdef CONFIG_TRACE_IRQFLAGS
	local_irq_enable();
#endif
}

Besides triggering lockdep_assert_irqs_enabled() on entry because local
interrupts are still disabled after spin_unlock(&musb->lock),
__local_bh_enable_ip() returns with local interrupts enabled when
CONFIG_TRACE_IRQFLAGS is set (or whenever a completion callback leaves
IRQs enabled):

musb_gadget_queue()
  spin_lock_irqsave(&musb->lock, lockflags)
  ...
    musb_g_giveback()
      spin_unlock(&musb->lock)
      disable_irq_nosync(musb->nIrq)
      usb_gadget_giveback_request()
        ...
          __local_bh_enable_ip()
            local_irq_enable()
      enable_irq(musb->nIrq)
      spin_lock(&musb->lock)
      <hardirq>
        musb->isr()
          spin_lock_irqsave(&musb->lock, ...)  <-- spins forever

Because enable_irq(musb->nIrq) runs before spin_lock(&musb->lock) and
before ep->busy is restored, an MUSB interrupt firing between enable_irq()
and spin_lock() can also re-enter musb_g_giveback() while ep->busy is 1
and leave ep->busy stuck at 1.

[Severity: High]
Does calling enable_irq(musb->nIrq) from inside musb->isr unmask the
interrupt line while the handler is still running?

In enable_irq() -> __enable_irq() -> irq_startup() -> irq_enable(),
irq_enable() unconditionally unmasks the line at the irqchip and clears
IRQD_IRQ_MASKED:

kernel/irq/chip.c:irq_enable() {
	if (!irqd_irq_disabled(&desc->irq_data)) {
		unmask_irq(desc);
	} else {
		irq_state_clr_disabled(desc);
		if (desc->irq_data.chip->irq_enable) {
			desc->irq_data.chip->irq_enable(&desc->irq_data);
			irq_state_clr_masked(desc);
		} else {
			unmask_irq(desc);
		}
	}
}

When musb->nIrq runs as a forced-threaded oneshot interrupt (such as under
CONFIG_PREEMPT_RT or threadirqs), the flow handler masks the line and sets
IRQD_IRQ_MASKED until musb->isr finishes and irq_finalize_oneshot() runs:

kernel/irq/manage.c:irq_finalize_oneshot() {
	...
	if (!desc->threads_oneshot && !irqd_irq_disabled(&desc->irq_data) &&
	    irqd_irq_masked(&desc->irq_data))
		unmask_threaded_irq(desc);
	...
}

Because enable_irq() already cleared IRQD_IRQ_MASKED mid-handler,
irq_finalize_oneshot() skips unmask_threaded_irq(), which on
IRQCHIP_EOI_THREADED controllers skips chip->irq_eoi() and permanently
wedges the MUSB IRQ line.  On level-triggered glue drivers that clear or
EOI the interrupt only after musb_interrupt() returns (such as
da8xx_musb_interrupt() and tusb_musb_interrupt()), enable_irq() also
unmasks the hardware line before remaining endpoints are serviced and
before the glue interrupt source is cleared.

[Severity: Medium]
Can the Rx endpoint still lock up on SMP when musb->nIrq fires on another
CPU outside the disable_irq_nosync() / enable_irq() window?

musb_g_giveback() deletes the request from ep->req_list and drops
musb->lock before calling unmap_dma_buffer() and
disable_irq_nosync(musb->nIrq), and calls enable_irq(musb->nIrq) before
re-acquiring musb->lock and restoring ep->busy:

CPU0                                  CPU1
rxstate()
  musb_g_giveback()
    list_del(&req->list)
    ep->busy =3D 1
    spin_unlock(&musb->lock)
                                      <hardirq>
                                      musb->isr()
                                        spin_lock_irqsave(&musb->lock, ...)
                                        musb_g_rx()
                                          /* req_list empty: clears IRQ,
                                           * leaves RXPKTRDY set */
                                        spin_unlock_irqrestore(&musb->lock,=
 ...)
    unmap_dma_buffer()
    disable_irq_nosync(musb->nIrq)
    usb_gadget_giveback_request()
      ...
        musb_gadget_queue()
          /* sees ep->busy =3D=3D 1,
           * skips musb_ep_restart() */
    enable_irq(musb->nIrq)
    spin_lock(&musb->lock)
    ep->busy =3D 0                      <-- RXPKTRDY stays set, Rx wedged

When CPU1 takes the MUSB interrupt while musb->lock is dropped (or after
enable_irq() and before spin_lock()), musb_g_rx() sees an empty
ep->req_list and leaves MUSB_RXCSR_RXPKTRDY set, while musb_gadget_queue()
inside complete() sees ep->busy =3D=3D 1 and does not restart the endpoint.

[Severity: Medium]
Does wrapping every usb_gadget_giveback_request() call in
disable_irq_nosync() and enable_irq() add unnecessary irqchip overhead on
the per-request hot path?

musb_g_giveback() runs for every completed TX, RX, and EP0 request, almost
always from hardirq context where netif_rx() does not touch bottom halves
or re-enable local interrupts.  Unconditionally disabling and enabling
musb->nIrq on every completion acquires desc->lock twice and programs the
irqchip to mask and unmask the hardware IRQ line on each packet.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124150344.6926=
4-1-aardelean@taladin.ro?part=3D2
