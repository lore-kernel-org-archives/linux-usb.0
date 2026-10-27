Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793134539;
	b=G270d6MqPx4CaK16HyiyOpWp5AkoJoyUkj7Qy0ws37mXENM+jDEx9ceNAr6+aBeZ5a8U
	 8Y0csByEVdB0NghW6MuMzyTjVHdFHotpw7CzOhBQEe9pVicCLKTh130BuOO0VOeieZp3H
	 344m6jCtl1Ck9W1sJsYzxyShZ875/AvICA2Hh4YsrrOQI0t6DT+wvSzC0ivA3mAhliEwT
	 C7bW95bUq3AK3Gkc07/rS4eDSzHdRbPO8951VTKAMpFK5llc08k6MocePjLJcNBk77bAr
	 ci+eJ1S5ZsmYWhxb9Vr4XWz6TfZD5XBuITaRIEtIwvBnnyVQ8jQ8R7XcVFBkqht8TqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793134539;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=39hohIhquobnH+XH1pqUD5C/RRwJLUbYSsjzFaCRkqI=;
	b=pVDgXIQPtKuPDAFMfzp+736j8mX7ClAQGLIPgj9AO1bzojKxerEjeUYeszHh8Wv1gmiz
	 5kdyu0Yj2qC3osO8eNhSpOAARRLNLdSrRkPUWhMG2cEEfbmEoVRc7VcoHH+QHKylCNJo1
	 oABFaic7ZZWfFHKsfIAaIdlnWtVNRYKSkK2DSekhSE4BkqnTnkl778/mvmK/DscqWnGVe
	 vxIiG0EmVPF4JJOQadbvz+mlA72jF07wXulUHv2vdF6kW5N3afhY9KX2h4uSLUSwNmefO
	 Sl5B1AmCxBic/dFHTZ4VyiQNq29IQZ7J73onjsP5Eo30Ji4yqQ7/gIKPRDE1JtCpLjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZmhjKGsE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF97606A31A
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 20:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZmhjKGsE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BBED1F01825;
	Tue, 27 Oct 2026 20:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793134538;
	bh=39hohIhquobnH+XH1pqUD5C/RRwJLUbYSsjzFaCRkqI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZmhjKGsEpJd1fkXECt1etZOAEUPEj0uIWeyKO3xdTwj7+VgR3LTuL3acIXa1Qnq01
	 eBmOPEdzVI2Gzsi3Wpf/iZzStTf5QENbAsIaiHCLOmgHnp2FQNuChRu7b/zBARFRn0
	 RhsHMNXH7yNyJX+7YLY0Ira3qhtNBAWxa8ieSFrD2CLxLAzwMclF/6paZjtBvSfPm3
	 zKe9kv20SeBVosaOLZXaNFHVlG502Eg/bQg9A+RhRfDRjuvQm3Cascrnw44eMljsS0
	 Btm6KeaeWLy/V92iCij2V98FYRaCW+ixs0xA/qQMZLyB61Y1gJtDhfnqE4SGX5PN3I
	 XB4W8kvOBEEqQ==
Message-ID: <sashiko-outbox-187104@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: musb: gadget: don't flush a waiting RX packet when
 queueing a request
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elvira Khabirova" <lineprinter0@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261027202744.79556-1-lineprinter0@gmail.com>
References: <20261027202744.79556-1-lineprinter0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 20:55:38 +0000
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
- [High] usb: musb: gadget: softirq busy-loop and livelock in musb_g_rx_kic=
k()
- [High] usb: musb: gadget: race and ordering bug in musb_gadget_disable() =
for rx_kick
- [High] usb: musb: gadget: RX endpoint lockup after giveback in musb_g_rx_=
kick()
- [High] usb: musb: gadget: unushed rx_kick work in musb_suspend() accesses=
 disabled MMIO
--

commit 15173995ac2630cef424095c4ec09d83b2d74409
Author: Elvira Khabirova <lineprinter0@gmail.com>

usb: musb: gadget: don't flush a waiting RX packet when queueing a request

This commit replaces the RX FIFO flush in musb_ep_restart() with a per-endp=
oint
work item queued on system_bh_wq to call musb_g_rx() when MUSB_RXCSR_RXPKTR=
DY
is set. This avoids dropping waiting RX packets when requests are queued on=
to
an empty endpoint queue.

> diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadge=
t.c
> index 016d3f3fc1e05..ace1a99999abd 100644
> --- a/drivers/usb/musb/musb_gadget.c
> +++ b/drivers/usb/musb/musb_gadget.c
> @@ -1111,6 +1111,8 @@ static int musb_gadget_disable(struct usb_ep *ep)
> =20
>  	/* abort all pending DMA and requests */
>  	nuke(musb_ep, -ESHUTDOWN);
> +	if (cancel_work(&musb_ep->rx_kick))
> +		pm_runtime_put_autosuspend(musb->controller);
> =20
>  	musb_ep->desc =3D NULL;
>  	musb_ep->end_point.desc =3D NULL;

[Severity: High]
Can calling nuke() before cancelling musb_ep->rx_kick and clearing
musb_ep->desc race with an pending or in-flight musb_g_rx_kick() execution?

Inside musb_gadget_disable() -> nuke(), ep->busy is set to 1 and
musb_g_giveback() drops musb->lock around usb_gadget_giveback_request():

drivers/usb/musb/musb_gadget.c:nuke() {
	ep->busy =3D 1;
	...
	while (!list_empty(&ep->req_list)) {
		req =3D list_first_entry(&ep->req_list, struct musb_request, list);
		musb_g_giveback(ep, &req->request, status);
	}
}

While musb->lock is dropped in musb_g_giveback(), musb_ep->desc is still
non-NULL and musb_ep->rx_kick has not yet been cancelled, so a pending
musb_g_rx_kick() can run, see musb_ep->desc !=3D NULL and musb_ep->busy =3D=
=3D 1,
and repeatedly re-queue itself onto system_bh_wq.

Additionally, cancel_work(&musb_ep->rx_kick) is non-synchronous and only
clears WORK_STRUCT_PENDING_BIT. If bh_worker() on another CPU has already
dequeued musb_ep->rx_kick before cancel_work() is called:

1. If musb_g_rx_kick() already entered musb_g_rx() -> musb_g_giveback() and
   dropped musb->lock, cancel_work() returns false and musb_gadget_disable()
   returns to the caller while musb_g_rx_kick() is still unmapping DMA and
   running req->complete().

2. If musb_g_rx_kick() is waiting on spin_lock_irqsave(&musb->lock, flags) =
at
   entry to musb_g_rx_kick() and the gadget driver immediately re-enables t=
he
   endpoint via usb_ep_enable() -> musb_gadget_enable() (such as during
   set_alt or reset), musb_gadget_enable() sets musb_ep->desc =3D desc and
   musb_ep->busy =3D 0. When the waiting musb_g_rx_kick() then acquires
   musb->lock, it sees the newly enabled musb_ep->desc and runs musb_g_rx()
   from the stale kick.

> @@ -1171,10 +1173,42 @@ void musb_ep_restart(struct musb *musb, struct mu=
sb_request *req)
>  		txstate(musb, req);
>  	} else {
>  		csr =3D musb_readw(epio, MUSB_RXCSR);
> -		csr |=3D MUSB_RXCSR_FLUSHFIFO | MUSB_RXCSR_P_WZC_BITS;
> -		musb_writew(epio, MUSB_RXCSR, csr);
> -		musb_writew(epio, MUSB_RXCSR, csr);
> +		if (csr & MUSB_RXCSR_RXPKTRDY) {
> +			pm_runtime_get_noresume(musb->controller);
> +			if (!queue_work(system_bh_wq, &req->ep->rx_kick))
> +				pm_runtime_put_noidle(musb->controller);
> +		}
> +	}
> +}
> +
> +static void musb_g_rx_kick(struct work_struct *work)
> +{
> +	struct musb_ep *musb_ep =3D container_of(work, struct musb_ep, rx_kick);
> +	struct musb *musb =3D musb_ep->musb;
> +	unsigned long flags;
> +	u8 epnum =3D musb_ep->current_epnum;
> +	bool requeued =3D false;
> +	u16 csr;
> +
> +	spin_lock_irqsave(&musb->lock, flags);
> +
> +	if (!musb_ep->desc)
> +		goto out;
> +
> +	if (musb_ep->busy) {
> +		requeued =3D queue_work(system_bh_wq, &musb_ep->rx_kick);
> +		goto out;
>  	}

[Severity: High]
Won't re-queueing musb_ep->rx_kick onto system_bh_wq when musb_ep->busy is =
set
cause a tight softirq busy-loop or single-CPU livelock?

In musb_g_giveback(), ep->busy is set to 1 while musb->lock is dropped acro=
ss
usb_gadget_giveback_request():

drivers/usb/musb/musb_gadget.c:musb_g_giveback() {
	ep->busy =3D 1;
	spin_unlock(&musb->lock);

	if (!dma_mapping_error(&musb->g.dev, request->dma))
		unmap_dma_buffer(req, musb);

	trace_musb_req_gb(req);
	usb_gadget_giveback_request(&req->ep->end_point, &req->request);
	spin_lock(&musb->lock);
	ep->busy =3D busy;
}

Because system_bh_wq is a WQ_BH | WQ_PERCPU workqueue serviced by bh_worker=
()
in softirq context, calling queue_work(system_bh_wq, &musb_ep->rx_kick) from
inside musb_g_rx_kick() puts rx_kick directly back onto the active per-CPU =
BH
pool worklist and raises TASKLET_SOFTIRQ.

On SMP, if musb_g_giveback() is executing on CPU A while musb_g_rx_kick() r=
uns
on CPU B, bh_worker() on CPU B will spin in softirq context repeatedly lock=
ing
musb->lock, seeing musb_ep->busy =3D=3D 1, and re-queueing rx_kick for the =
entire
duration of usb_gadget_giveback_request().

On a single-CPU system (such as AM335x / BeagleBone Black) or when pinned to
the same CPU, if musb_g_giveback() is entered from task context (for example
via musb_gadget_dequeue() or musb_gadget_disable() -> nuke()) and the
completion callback runs local_bh_enable() or spin_unlock_bh(), softirq runs
musb_g_rx_kick() on top of the stack where musb_g_giveback() is blocked. Si=
nce
musb_g_giveback() cannot resume to clear ep->busy until softirq finishes,
musb_g_rx_kick() spins until both bh_worker() and __do_softirq() exhaust th=
eir
restart budgets, or livelocks on CONFIG_PREEMPT_RT if the BH worker preempts
the task inside musb_g_giveback().

> +
> +	musb_ep_select(musb->mregs, epnum);
> +	csr =3D musb_readw(musb->endpoints[epnum].regs, MUSB_RXCSR);
> +	if (csr & MUSB_RXCSR_RXPKTRDY)
> +		musb_g_rx(musb, epnum);

[Severity: High]
Can calling musb_g_rx() only once in musb_g_rx_kick() leave the RX endpoint
stalled if another packet arrives or is queued while musb_g_giveback() drops
musb->lock?

When musb_g_rx_kick() calls musb_g_rx() -> rxstate() in PIO mode, rxstate()
reads the packet from the FIFO, clears MUSB_RXCSR_RXPKTRDY, and calls
musb_g_giveback():

drivers/usb/musb/musb_gadget.c:rxstate() {
			/* ack the read! */
			csr |=3D MUSB_RXCSR_P_WZC_BITS;
			csr &=3D ~MUSB_RXCSR_RXPKTRDY;
			musb_writew(epio, MUSB_RXCSR, csr);
		}
	}

	/* reach the end or short packet detected */
	if (request->actual =3D=3D request->length ||
	    fifo_count < musb_ep->packet_sz)
		musb_g_giveback(musb_ep, request, 0);
}

Inside musb_g_giveback(), the completed request is unlinked, musb_ep->busy =
is
set to 1, and musb->lock is dropped while running req->complete().

Because musb_g_rx_kick() runs in a BH workqueue rather than the hardware IRQ
handler, the controller IRQ is not masked on other CPUs. If the next OUT
packet arrives and its hardware interrupt fires while musb_ep->req_list is
temporarily empty during musb_g_giveback() (or if a second packet was alrea=
dy
waiting in a double-buffered FIFO with its IRQ already consumed),
musb_interrupt() -> musb_g_rx() sees next_request(musb_ep) =3D=3D NULL and =
returns
early with MUSB_RXCSR_RXPKTRDY set.

Meanwhile, when req->complete() (or another thread before rx_kick ran) queu=
es
the next request via musb_gadget_queue():

drivers/usb/musb/musb_gadget.c:musb_gadget_queue() {
	/* it this is the head of the queue, start i/o ... */
	if (!musb_ep->busy && &request->list =3D=3D musb_ep->req_list.next) {
		status =3D musb_queue_resume_work(musb,
						musb_ep_restart_resume_work,
						request);
}

musb_ep->busy is 1, so musb_ep_restart() is not called and rx_kick is not
re-queued. When musb_g_giveback() returns and restores musb_ep->busy =3D 0,
neither rxstate() nor musb_g_rx_kick() re-selects the endpoint and loops wh=
ile
next_request(musb_ep) !=3D NULL and MUSB_RXCSR_RXPKTRDY is set, leaving the=
 new
request in musb_ep->req_list and MUSB_RXCSR_RXPKTRDY set in hardware with no
further interrupt to advance it.

[Severity: High]
What prevents musb_g_rx_kick() from accessing MUSB MMIO registers after
musb_suspend() has disabled the controller during system sleep?

In musb_ep_restart(), pm_runtime_get_noresume(musb->controller) prevents
runtime suspend, but it does not block system suspend (musb_suspend()), and
system_bh_wq is not a freezable workqueue. In addition, musb_suspend() calls
pm_runtime_get_sync(dev), which runs musb_runtime_resume() ->
musb_run_resume_work() -> musb_ep_restart_resume_work() -> musb_ep_restart(=
),
and can queue musb_ep->rx_kick directly inside musb_suspend():

drivers/usb/musb/musb_core.c:musb_suspend() {
	musb_platform_disable(musb);
	musb_disable_interrupts(musb);

	musb->flush_irq_work =3D true;
	while (flush_delayed_work(&musb->irq_work))
		;
	musb->flush_irq_work =3D false;
}

musb_suspend() flushes musb->irq_work and saves context, but does not flush=
 or
cancel the per-endpoint rx_kick work items and does not clear musb_ep->desc.
If musb_g_rx_kick() runs after musb_platform_disable() or after the parent
glue driver gates the controller clocks, could musb_ep_select(), musb_readw=
(),
and musb_g_rx() access unclocked or powered-down MMIO registers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027202744.7955=
6-1-lineprinter0@gmail.com?part=3D1
