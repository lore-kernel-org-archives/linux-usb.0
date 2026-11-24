Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795533391;
	b=TddDduvUq+4SIr1PxsIho/9o/sr+9xpP5/1Oj2Lbfj3wT5AFfsGl3hkhCFPc/9GYwRQn
	 yFN6/jn7dpp1RIkcLqueWAylDUbauxSS0O5VGFKAGChqqfXvXctCitOusX2gtCbApbYbj
	 AqM7oRtxwGYVyTfWvTAJlAszhDFYVl3FkwKWBM0gKfz75fSEpoEbThSRafX+zCdffJ3Cg
	 I4M1F/jE++XMNZuwnukA82U4vz2etBEiNiz3Yx6tTU8zY+4apN7gcB0MHzaLEt3eE1v05
	 x4IJmDufZT4AmBMwQh1hFg9RasFUhAi9cMOdq9266V3H0a+M2WA9y//1iOlvIm47fmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795533391;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BMCZpH00SzHAWtm+4kewDGN1Km4oaj0cmgVi6ZAdMUY=;
	b=PL7R9D+sRn4O6sncC9NsbATZ3dQUIOoz0CVDjngpH6VefF6hBWnHcbFH6QgxLpZdfUo1
	 iQisihR8NxpSfAWf1/lfTly3XNGpYu8e0a/IGKR0QRg3WZNPQTarGhfRfvPn4XFAwOb6+
	 m3GpXnNN6sk+tj+UR1VS+qwFSaevysZ1Q/znyUzTdqvQPauFNv4EaPBSLXQ1pdkOFnrkS
	 h+ZzisDVabEVM+h9EkBoCYdaJL7wpTmGT3YJkIh+6kmpe1WDZ/Lzx9sVavkZ1aftiAlkk
	 sZaTH2jKBuqhjYmTAdTVUkE60/BRS1FfgsDYCyXrJy/SJ5FY+7ix6inqscMXbM7Jl8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j6+5aYdI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23B2606A321
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 15:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j6+5aYdI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33AFB1F000D0;
	Tue, 24 Nov 2026 15:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795533391;
	bh=BMCZpH00SzHAWtm+4kewDGN1Km4oaj0cmgVi6ZAdMUY=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=j6+5aYdISKidkthffSprzOwdvYzBTN9aCB4y+bDNr5/iPo4+HMdcx5njYsOVAmqwo
	 1eYb+PoKjgnnYX2UugCjqiuDxOPIoBdQ40AgNZMeH9Io67PrpIvhdiGcACXq1gADog
	 GVt6RUwxYXXF+BagBm1OiYO1hsWmAo90h85CwaFwyzzBAgsnlZkq6DTQhJn3/D5iyo
	 I2Wn1g1E11mCdYKdGVWc3CACz6uasUV1DkmcXuJV9CzzlrP2ZwM3+Brw213TdyR0Fh
	 MidCE15rD3qnC5UAqsgYthHhW19AG5gFs8vXCvPM1d/nP1mV2vuWMhT7tsdzUl0Izl
	 YA6KGsuAjdP6Q==
Message-ID: <sashiko-outbox-231395@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] Revert "usb: musb: Fix hardware lockup on first
 Rx endpoint request"
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandru Ardelean" <aardelean@taladin.ro>, linux-usb@vger.kernel.org
In-Reply-To: <20261124150344.69264-2-aardelean@taladin.ro>
References: <20261124150344.69264-1-aardelean@taladin.ro>
 <20261124150344.69264-2-aardelean@taladin.ro>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 15:16:30 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] usb: musb: lock inversion in musb_ep_restart() via
  musb_run_resume_work()
--

commit d72e1bdec5562f8d7f92be2dcf471e3639a440ee
Author: Alexandru Ardelean <aardelean@taladin.ro>

Revert "usb: musb: Fix hardware lockup on first Rx endpoint request"

This commit reverts commit 3fc137386c46 ("usb: musb: Fix hardware lockup on
first Rx endpoint request"), restoring the call to rxstate() in
musb_ep_restart() for RX requests instead of flushing the Rx FIFO.

> diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadge=
t.c
> index 016d3f3fc1e05..dd67ab97df9d8 100644
> --- a/drivers/usb/musb/musb_gadget.c
> +++ b/drivers/usb/musb/musb_gadget.c
> @@ -1162,19 +1162,12 @@ void musb_free_request(struct usb_ep *ep, struct =
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

[Severity: Medium]
Can calling rxstate() from musb_ep_restart() invert the musb->lock ->
musb->list_lock lock order and deadlock when invoked via
musb_run_resume_work()?

When an RX request is queued while runtime suspended,
musb_queue_resume_work() queues musb_ep_restart_resume_work() on
musb->pending_list.  On resume, musb_run_resume_work() runs with
musb->lock and musb->list_lock held.  If rxstate() completes the request
synchronously (for example, a zero-length RX request or a PIO read that
satisfies the transfer), it calls musb_g_giveback(), which drops and
re-acquires musb->lock while musb->list_lock remains held:

CPU0                                  CPU1
----                                  ----
musb_runtime_resume()
  lock(&musb->lock)
  musb_run_resume_work()
    lock(&musb->list_lock)
    musb_ep_restart_resume_work()
      musb_ep_restart()
        rxstate()
          musb_g_giveback()
            unlock(&musb->lock)
            usb_gadget_giveback_request()
                                      musb_gadget_queue()
                                        lock(&musb->lock)
                                        musb_queue_resume_work()
                                          lock(&musb->list_lock)
            lock(&musb->lock)

 *** DEADLOCK ***

If the gadget's completion callback instead re-queues a request via
usb_ep_queue() -> musb_gadget_queue() -> musb_queue_resume_work(), the
same CPU also deadlocks trying to acquire musb->list_lock recursively.
This remains present after the follow-up commit "usb: musb: gadget: mask
the MUSB IRQ while complete() runs".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124150344.6926=
4-1-aardelean@taladin.ro?part=3D1
