Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794090953;
	b=FQQcsJCJoFlGY5Ax0LJx8ZYF+xIaz2y47Abd6p4EgHtV8dXcTdKwVxfdBQijFzTlAV4k
	 L8RMNL+QdGP4uXbgvMdvHpsouH0yno/791uVbnRLR+wuH+1S0rxlQ304Kl1cDCSG+ijdN
	 A7LclI4ZiOyk7rOfq8/Qh4rSJHlV84N4Yn//oG4BAFvtSLhgsYrE6vaET3dkLua3PeC8T
	 WIsGrxXHj1JrqkC4jdswmeeUQ7VD4EHVWBXoMX+k5KSuUUXjkcRyRAy0l4fAws7RN88ju
	 Obcj1/UeLvJ2nrcd4/vxXKM2iWu3K5/8mYMIK/iBlIXdy/MdUIRS0KIlO/P5NEMC1nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794090953;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LwCyi/FlGVMsI/p9YTXE94TPOkvlhxjHrO3Rq6zHSUA=;
	b=e/zHIlaM7trn1K5VYfuJVPDzixnuckAiequlmSUc5w+U9S8qGebVuYoUD666PLvpxs5I
	 56hMAq9j6zEYTboqRFP+74oOMfBpeHz7eOyZ9AvDXgcJf2gdglgP5AREwXOHuscYxAeGW
	 AFphJuDspwglakRRLJpo/Ls0oE6XBM8t/YsrykF3YmJv67UFfSA5QdYHIQUxILz5vmsis
	 kMnPiOiUx+GvADuVb8xWaiqJ+/eA9zJtdB+GV9+okqPwEWx0Jf7kFn/ZXoZC410mLjYFz
	 d1wkPGuhTSrTI3gei2JQMLNXmVb3C6wQ6G6ZwxrPIfttPVEZFBpp27r7ZVd19Em6R3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="gBfPY/OT";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DD5606A326
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 22:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gBfPY/OT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB101F0089F;
	Sat,  7 Nov 2026 22:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794090952;
	bh=LwCyi/FlGVMsI/p9YTXE94TPOkvlhxjHrO3Rq6zHSUA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gBfPY/OTru14FmdBKQTT5drALXAiGawSktsTBus1SOqiNZOjrlqp1/NHLUMk5Bzsm
	 XWDHYDlciAN7lkGSLIZKE+ybOx+I1MLgGa3G1Otsvp+Hk78svVK/q194diTK1ISJrA
	 ngE5O0FaLD8ynd21CQF76Tw9rykHbqkoG2tfJpS6z/iRU73urh2VrN1bSlMG0RLKdY
	 /jvI0OcRN/mOalxIdOTyxJtccndDGd1KAHgh1KY7p6n+vzl+QdP24SZrSZ9UaP28Yv
	 o6jqSMXwP+G8f24moumouc3qV4Qd/G0JdJ2fvNZwxRqNcNVj1YFLvExA6dcwMacLYc
	 ONEq13PkPYRSw==
Message-ID: <sashiko-outbox-203368@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] usb: musb: gadget: count givebacks in busy
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elvira Khabirova" <lineprinter0@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261107221904.82487-2-lineprinter0@gmail.com>
References: <20261107221904.82487-1-lineprinter0@gmail.com>
 <20261107221904.82487-2-lineprinter0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 22:35:50 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] usb: musb: gadget: no TX restart when busy drops to 0 in
  musb_g_giveback()
- [Low] usb: musb: gadget: missing Fixes trailer for ep->busy race fix
--

commit 38e2611af12585f304377ba06a8095186ff11968
Author: Elvira Khabirova <lineprinter0@gmail.com>

> usb: musb: gadget: count givebacks in busy
>
> The ep->busy flag is used by musb_g_giveback() to signal that
> req->complete() is running on an endpoint, the ep is busy and
> starting a new request is not appropriate right now.
>
> It is only a flag and not a counter currently;
> musb_g_giveback() saves the old ep->busy value, sets busy to 1,
> releases musb->lock, runs req->complete(), restores the old ep->busy.
> This works when there is no possibility of two musb_g_giveback()s
> running in parallel.
>
> This does not work when musb_gadget_dequeue()->...->musb_g_giveback()
> happens at the same time as musb_interrupt()->...->musb_g_giveback().
> The above save-then-restore can get the busy flag stuck at 1.
>
>   CPU0 (interrupt)                CPU1 (usb_ep_dequeue())
>   giveback: saved 0, busy =3D 1
>   unlock, ->complete()
>                                   giveback: saved 1, busy =3D 1
>                                   unlock, ->complete()
>   lock, busy =3D 0
>                                   lock, busy =3D 1
>
> ...and this gets the entire endpoint stuck.
>
> This was reproduced and the patch was tested on a Pine A64+
> (Allwinner A64, four cores, no DMA) with PREEMPT_DYNAMIC and lockdep,
> using a specially constructed f_fs function that keeps two AIO requests
> queued on a bulk endpoint and cancels the newer one with io_cancel(),
> in a loop. Tested with both a bulk IN and a bulk OUT endpoint.
>
> If musb_g_giveback() were to be started from some other context,
> the same issue would come up.
>
> "Promote" ep->busy from a flag to a counter.
>
> musb_gadget_enable() should not reset `busy` to 0 anymore because
> musb_g_giveback() decrements busy, and if these two run in parallel,
> it would be problematic (cause an underflow).
>
> Signed-off-by: Elvira Khabirova <lineprinter0@gmail.com>

[Severity: Low]
Should this concurrency fix include a Fixes tag?

  Fixes: 550a7375fe72 ("USB: Add MUSB and TUSB support")

> diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadge=
t.c
> index 016d3f3fc1e05..b500e0d8b0bd3 100644
> --- a/drivers/usb/musb/musb_gadget.c
> +++ b/drivers/usb/musb/musb_gadget.c
> @@ -129,7 +129,6 @@ __acquires(ep->musb->lock)
>  {
>  	struct musb_request	*req;
>  	struct musb		*musb;
> -	int			busy =3D ep->busy;
> =20
>  	req =3D to_musb_request(request);
> =20
> @@ -138,7 +137,7 @@ __acquires(ep->musb->lock)
>  		req->request.status =3D status;
>  	musb =3D req->musb;
> =20
> -	ep->busy =3D 1;
> +	ep->busy++;
>  	spin_unlock(&musb->lock);
> =20
>  	if (!dma_mapping_error(&musb->g.dev, request->dma))
> @@ -147,7 +146,7 @@ __acquires(ep->musb->lock)
>  	trace_musb_req_gb(req);
>  	usb_gadget_giveback_request(&req->ep->end_point, &req->request);
>  	spin_lock(&musb->lock);
> -	ep->busy =3D busy;
> +	ep->busy--;
>  }

[Severity: Medium]
Can an IN endpoint still stall when a new TX request is queued while a
concurrent dequeue giveback holds ep->busy non-zero after musb_g_tx() has
returned?

With two TX requests req1 and req2 queued on an IN endpoint:

CPU0                              CPU1
musb_g_tx()
  musb_g_giveback(..., req1, 0)
    list_del(&req1->list)
    ep->busy++ (0 -> 1)
    spin_unlock(&musb->lock)
    req1->complete()
                                  musb_gadget_dequeue(..., req2)
                                    musb_g_giveback(..., req2, -ECONNRESET)
                                      list_del(&req2->list)
                                      ep->busy++ (1 -> 2)
                                      spin_unlock(&musb->lock)
                                      req2->complete()
    spin_lock(&musb->lock)
    ep->busy-- (2 -> 1)
  next_request(musb_ep) =3D=3D NULL
  return
                                      musb_gadget_queue(..., req3)
                                        list_add_tail(&req3->list, ...)
                                        !musb_ep->busy is false (busy =3D=
=3D 1)
                                      spin_lock(&musb->lock)
                                      ep->busy-- (1 -> 0)
                                    return  <-- req3 is never started

When musb_g_tx() finishes its giveback first, req_list is empty because
musb_gadget_dequeue() already unlinked req2, so musb_g_tx() exits while
ep->busy is still 1.  If req3 is queued before CPU1 finishes
req2->complete(), musb_gadget_queue() skips starting I/O because
musb_ep->busy is non-zero:

drivers/usb/musb/musb_gadget.c:musb_gadget_queue() {
	...
	/* it this is the head of the queue, start i/o ... */
	if (!musb_ep->busy && &request->list =3D=3D musb_ep->req_list.next) {
		status =3D musb_queue_resume_work(musb,
						musb_ep_restart_resume_work,
						request);
	...
}

When CPU1 then decrements ep->busy to 0 and returns from
musb_gadget_dequeue(), nothing calls txstate() for req3, so no further TX
interrupt fires and the IN endpoint stays wedged with req3 at the head of
req_list.  Commit "usb: musb: gadget: don't flush a waiting RX packet when
queueing a request" later in this series defers and kicks RX when ep->busy
drops to 0, but TX requests (!request->tx is false) are not restarted
there either.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107221904.8248=
7-1-lineprinter0@gmail.com?part=3D1
