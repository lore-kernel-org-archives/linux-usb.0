Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B882504587
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 14:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420404; cv=none; b=fbxMRV9crbgj9396XItB3nznm3bN9cVuBv6C/MBb8W4PlmyNJwRC/RrSXqxNDSz5O/U3kxMRQaygWK6521dRKc9a3X1zhLEWEBuqjpoEyAq7uT3YSxRb8O4ENmfVrKDBhmMOuFG0xl1am3qIOAlMrEO/NDTPmbg7aajVUzoa1A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420404; c=relaxed/simple;
	bh=TBF12SaaAOLaIXWyM3QkwpNHGA51u103sZmEc9/K4zA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=iLmGU0pXOT/4okEAYcKRHNBt4RF+XI7eFml8wFPXUhyfwz43Q6p0w2cTDAs3wLJJbjweVT2a0rVfZ4H8jvoUctyubUPox40C2VofTXsmMJC5o1w2yyLedAQRbvoOPlOsJFuZpfEgmRIKRAoLONt2wL0zNIshZetGeklzEt3vfQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YD3JletD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YD3JletD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1700C1F000C4;
	Mon, 19 Oct 2026 14:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792420403;
	bh=s3AtWrFheeqJxiBNSrXAtUDSSDqv6xR5mRiPZ7NK1k8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YD3JletDcJSfUY+B14oAVPNJGEaJ+BvsFVc5j2bkzaPf3jq14DnDdj83BsfdOcH7i
	 0Y6NcbrpavcGJ/Uo9ybW4HKRyd8eiFOsvYJEmKkiaeADcRntvrxjvNZm7/iF9zbUqW
	 AhobTOueQwlkFz+s3hUfSnb/tZuVbGJSFbi3jfd0FfXSiih+D1t3mUQLe3/wo55j+N
	 pi0IfLvXf7s42Sxh9a1hgCLDQFYNju9SyDFuFwLWTy7xfUHzcrNNTEvXKBIotHRCmW
	 d/XL6Rz+HSmZ///yF9Wb3Su5PfjPg8IjBzoZZ7iR05dX2GYiA6qXt4yx0vovO1P32h
	 QxIxnt2Cjv4hA==
Message-ID: <sashiko-outbox-177427@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND] usb: gadget: f_midi: fix UAF race during IN
 request handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sonali Pradhan" <sonalipradhan@google.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261019135701.2767078-1-sonalipradhan@google.com>
References: <20261019135701.2767078-1-sonalipradhan@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 14:33:22 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] usb: gadget: f_midi: UAF on req in f_midi_complete() before tr=
ansmit_lock
- [Critical] usb: gadget: f_midi: race between usb_ep_disable() and f_midi_=
transmit()
- [High] usb: gadget: f_midi: recursive transmit_lock deadlock in f_midi_co=
mplete()
- [High] usb: gadget: f_midi: race on in_req_fifo between f_midi_set_alt() =
and f_midi_transmit()
--

commit f0f632d32e9280f253a7d4422bf053e57b768343
Author: Sonali Pradhan <sonalipradhan@google.com>

usb: gadget: f_midi: fix UAF race during IN request handling

This patch acquires midi->transmit_lock in f_midi_disable() when freeing
pre-allocated IN requests and adds checks for ep->enabled under
midi->transmit_lock in f_midi_transmit() and f_midi_complete().

> diff --git a/drivers/usb/gadget/function/f_midi.c b/drivers/usb/gadget/fu=
nction/f_midi.c
> index 63fb6ee70a3d6..c26d04eb92090 100644
> --- a/drivers/usb/gadget/function/f_midi.c
> +++ b/drivers/usb/gadget/function/f_midi.c
> @@ -280,9 +280,18 @@ f_midi_complete(struct usb_ep *ep, struct usb_reques=
t *req)
>  			/* We received stuff. req is queued again, below */
>  			f_midi_handle_out_data(ep, req);
>  		} else if (ep =3D=3D midi->in_ep) {
> +			unsigned long flags;
> +
>  			/* Our transmit completed. See if there's more to go.
>  			 * f_midi_transmit eats req, don't queue it again. */
> +			spin_lock_irqsave(&midi->transmit_lock, flags);
> +			if (!ep->enabled) {
> +				spin_unlock_irqrestore(&midi->transmit_lock, flags);
> +				return;
> +			}
>  			req->length =3D 0;
> +			spin_unlock_irqrestore(&midi->transmit_lock, flags);

[Severity: High]
Can acquiring midi->transmit_lock here in f_midi_complete() cause a recursi=
ve
spinlock deadlock?

In f_midi_transmit(), midi->transmit_lock is held while calling
f_midi_do_transmit(), which calls usb_ep_queue(ep, req, GFP_ATOMIC):

    f_midi_transmit()
      spin_lock_irqsave(&midi->transmit_lock, flags);
      f_midi_do_transmit()
        usb_ep_queue(ep, req, GFP_ATOMIC)

Several UDC drivers (such as dummy_hcd in dummy_queue(), goku_udc, omap_udc,
pxa25x_udc, at91_udc, and net2280) can complete an IN request synchronously
inside ep->ops->queue() via usb_gadget_giveback_request() ->
f_midi_complete() with req->status =3D=3D 0 before usb_ep_queue() returns.

Commit 4ab37fcb4283 ("USB: gadget: f_midi: f_midi_complete to call
queue_work") previously replaced the direct f_midi_transmit() call in
f_midi_complete() with queue_work() because re-entering f_midi_transmit()
attempted to acquire midi->transmit_lock a second time on the same CPU. Does
taking midi->transmit_lock directly in f_midi_complete() re-introduce that
same deadlock?

[Severity: Critical]
Also, if f_midi_disable() runs concurrently with an in-flight
f_midi_complete(ep, req) callback and frees req via free_ep_req(), isn't req
already dereferenced before midi->transmit_lock is acquired here?

At the start of f_midi_complete():

    static void
    f_midi_complete(struct usb_ep *ep, struct usb_request *req)
    {
        struct f_midi *midi =3D ep->driver_data;
        struct usb_composite_dev *cdev =3D midi->func.config->cdev;
        int status =3D req->status;

usb_ep_disable() does not wait for completion callbacks that have already b=
een
dequeued by the UDC and are currently executing to return. If f_midi_disabl=
e()
frees the struct usb_request *req via free_ep_req() while f_midi_complete()=
 is
entering, reading req->status before taking midi->transmit_lock will access
freed memory.

Similarly, if status is non-zero on midi->in_ep, f_midi_complete() never ta=
kes
midi->transmit_lock or checks ep->enabled, reading req->actual and req->len=
gth
in VDBG()/DBG() and falling through to usb_ep_queue(ep, req, GFP_ATOMIC) on
non-shutdown errors. And if f_midi_disable() is immediately followed by
f_midi_set_alt() (such as during set_config()), ep->enabled is set back to
true while req has already been freed.

> +
>  			queue_work(system_highpri_wq, &midi->work);
>  			return;
>  		}
> @@ -420,6 +429,7 @@ static void f_midi_disable(struct usb_function *f)
>  	struct f_midi *midi =3D func_to_midi(f);
>  	struct usb_composite_dev *cdev =3D f->config->cdev;
>  	struct usb_request *req =3D NULL;
> +	unsigned long flags;
> =20
>  	DBG(cdev, "disable\n");
> =20
> @@ -431,8 +441,10 @@ static void f_midi_disable(struct usb_function *f)
>  	usb_ep_disable(midi->out_ep);
> =20
>  	/* release IN requests */
> +	spin_lock_irqsave(&midi->transmit_lock, flags);
>  	while (kfifo_get(&midi->in_req_fifo, &req))
>  		free_ep_req(midi->in_ep, req);
> +	spin_unlock_irqrestore(&midi->transmit_lock, flags);
> =20
>  	f_midi_drop_out_substreams(midi);
>  }
> @@ -678,10 +690,11 @@ static void f_midi_transmit(struct f_midi *midi)
>  	unsigned long flags;
> =20
>  	/* We only care about USB requests if IN endpoint is enabled */
> -	if (!ep || !ep->enabled)
> -		goto drop_out;
> -
>  	spin_lock_irqsave(&midi->transmit_lock, flags);
> +	if (!ep || !ep->enabled) {
> +		spin_unlock_irqrestore(&midi->transmit_lock, flags);
> +		goto drop_out;
> +	}
> =20
>  	do {
>  		ret =3D f_midi_do_transmit(midi, ep);

[Severity: Critical]
Does checking ep->enabled under midi->transmit_lock prevent f_midi_transmit=
()
from racing with usb_ep_disable(midi->in_ep) in f_midi_disable()?

In f_midi_disable(), usb_ep_disable(midi->in_ep) is called outside
midi->transmit_lock, and in drivers/usb/gadget/udc/core.c:usb_ep_disable():

    ret =3D ep->ops->disable(ep);
    if (ret)
        goto out;

    ep->enabled =3D false;

ep->enabled remains true while ep->ops->disable(ep) flushes pending requests
and is only set to false afterwards without holding midi->transmit_lock.

If f_midi_transmit() acquires midi->transmit_lock on another CPU while
usb_ep_disable(midi->in_ep) is in progress, it can still see ep->enabled =
=3D=3D
true and queue a request via f_midi_do_transmit() -> usb_ep_queue() after
ep->ops->disable() has finished flushing the endpoint, placing req back into
midi->in_req_fifo. Once f_midi_transmit() drops midi->transmit_lock,
f_midi_disable() will pop req from midi->in_req_fifo and call free_ep_req()
while req is still queued in the UDC.

Additionally, if ep->enabled becomes false while f_midi_transmit() is alrea=
dy
iterating inside the do-while loop, usb_ep_queue() in f_midi_do_transmit()
returns -ESHUTDOWN, but f_midi_do_transmit() resets req->length =3D 0 and
returns active (1) instead of a negative error, causing the loop to spin
draining the substream and logging an error on every iteration.

[Severity: High]
How is midi->in_req_fifo synchronized between f_midi_set_alt() and
f_midi_transmit()?

In f_midi_set_alt(), f_midi_start_ep(midi, f, midi->in_ep) enables midi->in=
_ep
(setting ep->enabled =3D true) before midi->in_req_fifo is populated, and t=
he
subsequent allocation loop calls kfifo_avail() and kfifo_put() without hold=
ing
midi->transmit_lock:

    err =3D f_midi_start_ep(midi, f, midi->in_ep);
    if (err)
        return err;
    ...
    while (kfifo_avail(&midi->in_req_fifo)) {
        struct usb_request *req =3D
            midi_alloc_ep_req(midi->in_ep, midi->buflen);
        ...
        kfifo_put(&midi->in_req_fifo, req);
    }

Because the ALSA rawmidi card is registered in f_midi_bind(), userspace can
trigger f_midi_in_trigger() -> f_midi_transmit() concurrently with
f_midi_set_alt(). Once f_midi_start_ep() sets midi->in_ep->enabled =3D true,
f_midi_transmit() will pass the !ep->enabled check under midi->transmit_lock
and call f_midi_do_transmit(), which calls kfifo_peek(), kfifo_skip(), and
kfifo_put(&midi->in_req_fifo, req) concurrently with the unlocked kfifo_put=
()
in f_midi_set_alt().

Can those concurrent kfifo_put() calls corrupt midi->in_req_fifo (or cause
kfifo_peek() to fail on an empty FIFO before the first request is added,
dropping active substreams)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019135701.2767=
078-1-sonalipradhan@google.com?part=3D1
