Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793734078;
	b=0Co8HKFKb8teJESJbYbQgI0FvpevL4KpIDksGydG7QfDM36SkFa5GxnZ9/cCFQZ3cYD4
	 5C1ofQ3RN454C0Q9sfQjxzyxFhFdBqobO8P1B2Hp7WirOlOKR+JcWXvye5x8HHWDJkh6z
	 ghHuzMQvmpzdXnkCVDW/t2h5m7oIJzZiXC+m/rxNseSxqf/rZgssXO5GqP4XdDeUSjKZF
	 Q1t9g+PGtEuNLMTf8uWKytSyqsiAIFqJds2VvS14CQFUoHbIz4ksAYcrvyfSa7Li/x9eA
	 eIe+c4IS4SaCN3x9NEHt68Nh1Is3u7XNQt8pEJRyDrOgNB10o0TKQkKtS/FoyydQXhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793734078;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=veOrRNFhyRbFfBOL92qT2eprL06nX1oGIjtdW8YYtlw=;
	b=BQKlF3zYGZZzVtLJyqlUH/la6333hJXZsvGJdfiyYfDb8QrrDtlsCR8Ozay14JvIm1xp
	 s/IJXhNlmDFB/GovqB+AEeE93PtdytI2hqt7jplB2/f53z4XY87xds1974yFJ8whspyvu
	 IgHGB3dRAQkTmw4V1QF0ffY9Xmc5LCKYOkkZB/UPCLjshmpMjv5t60Jw/AZyM6aiCdl3r
	 9r9+GUclDUYTceO64hB871RzMarvLbXSoIbTf7Pax3vzaZwtV/g/l/5opOaeW2d4dLVTr
	 83X2j+SXQYldZPxTX9YQL38s1P6vAw4AK9gTyzbKS6Wb50sSl6XWVyigORkvIE79uCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AoqNJr4A;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BAD606A31B
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 19:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AoqNJr4A
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F151A1F000C1;
	Tue,  3 Nov 2026 19:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793734078;
	bh=veOrRNFhyRbFfBOL92qT2eprL06nX1oGIjtdW8YYtlw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AoqNJr4A6trRC0Z5fLQuMEBgc9Zi/hwgbnEf7GBQ9qexBXxEDP+eHST7PS4Jw6yCx
	 GZWSFw3A2cfna7TPzDZwCE2Is4JbpzgAwzGEHjS/CH/QQbbUvw7Xx+QqLdysI2qz6H
	 VjVpgGDwJehBoPGpEsnmo8gIc20Vaf8SDve5zTZ8Lg9yCyh1n1DQRbwuNjSbnIHA5B
	 ZEJIfIlII7YTOnMgFi6uKVzEAgSytYy1HQkqKphUWnOmJ+FmPzuxtxXVwdmLUNBiYU
	 OXTHmpoonyi0RpVRC5QJGbZR2//lkVeHUYxtRSygY1bq6lDy/ByG+4q9/jEN+N7ERL
	 emzSmBRBMDOPQ==
Message-ID: <sashiko-outbox-195915@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: musb: host: clear stale TT buffers after aborted
 transfers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jhon Wilker Rodrigues Aquino" <jhonwilker0112@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261103190333.87207-1-jhonwilker0112@gmail.com>
References: <20261103190333.87207-1-jhonwilker0112@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 19:27:57 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [Critical] usb: musb: qh UAF and is_ready corruption in musb_urb_dequeue()
- [High] usb: musb: unparked qh race across musb_giveback() in musb_advance=
_schedule()
- [High] usb: musb: stranded URBs on parked qh after inactive host in musb_=
tt_resume()
- [Medium] usb: musb: spurious TT clear on -EREMOTEIO in musb_clear_tt_buff=
er()
- [Medium] usb: musb: unreset qh->hb_mult before rescheduling in musb_tt_re=
sume()
- [Low] usb: musb: undocumented tt_clear module parameter in musb_host.c
- [Low] usb: musb: open-coded spinlock polling loop in musb_h_disable()
--

commit 64201419e6f04cb16c53e5b8f07d1c18f4fb355b
Author: Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>

usb: musb: host: clear stale TT buffers after aborted transfers

This commit queues Clear-TT-Buffer requests for failed or unlinked control
and bulk URBs behind an external hub transaction translator, and parks the
affected endpoint queue until the asynchronous clear finishes.

> diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
> index 31b0612489911..6e8cf462676ec 100644
> --- a/drivers/usb/musb/musb_host.c
> +++ b/drivers/usb/musb/musb_host.c
> @@ -22,6 +22,11 @@
>  #include "musb_host.h"
>  #include "musb_trace.h"
> =20
> +static bool tt_clear =3D true;
> +module_param(tt_clear, bool, 0644);
> +MODULE_PARM_DESC(tt_clear,
> +		 "Clear hub TT buffers after failed or unlinked control/bulk transfers=
 (default Y; set N only for A/B comparison or if a hub mishandles CLEAR_TT_=
BUFFER; affects new requests only)");

[Severity: Low]
Should the new tt_clear module parameter (settable at boot as
musb_hdrc.tt_clear) also be documented in
Documentation/admin-guide/kernel-parameters.txt and mentioned in the commit
message?

> @@ -287,6 +292,33 @@ __acquires(musb->lock)
>  	spin_lock(&musb->lock);
>  }
> =20
> +/*
> + * A failed or unlinked control/bulk split can leave the hub's transacti=
on
> + * translator buffer busy; the TT then NAKs later splits using that buff=
er
> + * (USB 2.0 11.17.5).  A STALL completes the split, so it needs no clear.
> + *
> + * Context: caller owns controller lock and an URB which was on hardware
> + */
> +static void musb_clear_tt_buffer(struct musb *musb, struct musb_qh *qh,
> +				 struct urb *urb, int status)
> +{
> +	struct usb_tt		*tt =3D urb->dev->tt;
> +
> +	if (!READ_ONCE(tt_clear) || qh->clearing_tt)
> +		return;
> +	if (!tt || !tt->hub || tt->hub =3D=3D musb->hcd->self.root_hub)
> +		return;
> +	if (!usb_pipecontrol(urb->pipe) && !usb_pipebulk(urb->pipe))
> +		return;
> +	if (!urb->unlinked && (!status || status =3D=3D -EPIPE))
> +		return;
> +
> +	if (usb_hub_clear_tt_buffer(urb))
> +		return;
> +
> +	qh->clearing_tt =3D true;
> +}

[Severity: Medium]
Can this trigger a spurious Clear-TT-Buffer when a bulk or control IN URB
with URB_SHORT_NOT_OK completes normally with a short packet?

In musb_host_packet_rx(), receiving a short packet when URB_SHORT_NOT_OK is
set marks the URB as done with -EREMOTEIO without requesting another IN
token:

drivers/usb/musb/musb_host.c:musb_host_packet_rx() {
	...
		if (done
				&& (urb->status =3D=3D -EINPROGRESS)
				&& (urb->transfer_flags & URB_SHORT_NOT_OK)
				&& (urb->actual_length
					< urb->transfer_buffer_length))
			urb->status =3D -EREMOTEIO;
	...
}

Then musb_host_rx() passes urb->status (-EREMOTEIO) into
musb_clear_tt_buffer(). Since a short packet completes the split transaction
on the bus and leaves the TT buffer free, should musb_clear_tt_buffer() also
exclude status =3D=3D -EREMOTEIO (or should musb_host_rx() pass the hardware
status)?

> @@ -329,11 +361,18 @@ static void musb_advance_schedule(struct musb *musb=
, struct urb *urb,
>  	qh =3D musb_ep_get_qh(hw_ep, is_in);
> =20
>  	/* reclaim resources (and bandwidth) ASAP; deschedule it, and
> -	 * invalidate qh as soon as list_empty(&hep->urb_list)
> +	 * invalidate qh as soon as list_empty(&hep->urb_list).
> +	 *
> +	 * While Clear-TT-Buffer is pending the endpoint must not use the TT,
> +	 * so a qh with clearing_tt also releases hw_ep, letting other qhs
> +	 * (including the hub's own control requests) run.  It stays in
> +	 * hep->hcpriv, so new URBs queue on it, until
> +	 * musb_clear_tt_buffer_complete() resumes or releases it.
>  	 */
> -	if (qh && list_empty(&qh->hep->urb_list)) {
> +	if (qh && (qh->clearing_tt || list_empty(&qh->hep->urb_list))) {
>  		struct list_head	*head;
>  		struct dma_controller	*dma =3D musb->dma_controller;
> +		bool			park =3D qh->clearing_tt;
> =20
>  		if (is_in) {
>  			ep->rx_reinit =3D 1;
> @@ -351,7 +390,10 @@ static void musb_advance_schedule(struct musb *musb,=
 struct urb *urb,
> =20
>  		/* Clobber old pointers to this qh */
>  		musb_ep_set_qh(ep, is_in, NULL);
> -		qh->hep->hcpriv =3D NULL;
> +		if (park)
> +			qh->tt_parked =3D true;
> +		else
> +			qh->hep->hcpriv =3D NULL;

[Severity: High]
Because musb_clear_tt_buffer() sets qh->clearing_tt =3D true and schedules
tt->clear_work before musb_advance_schedule() calls musb_giveback(),
musb->lock is dropped inside musb_giveback() while qh is still attached to
hw_ep and qh->tt_parked is still false:

drivers/usb/musb/musb_host.c:musb_advance_schedule() {
	...
	qh->is_ready =3D 0;
	musb_giveback(musb, urb, status);
	qh->is_ready =3D ready;

	qh =3D musb_ep_get_qh(hw_ep, is_in);

	if (qh && (qh->clearing_tt || list_empty(&qh->hep->urb_list))) {
	...
}

What happens if another CPU runs during that window while musb->lock is
dropped in musb_giveback()?

1. After usb_hcd_unlink_urb_from_ep() empties hep->urb_list (or after
__usb_hcd_giveback_urb() wakes usb_kill_urb()), a concurrent
musb_h_disable() can acquire musb->lock before musb_giveback() re-acquires
it. In musb_h_disable(), musb_ep_get_qh(qh->hw_ep, is_in) =3D=3D qh is still
true, so it calls urb =3D next_urb(qh) on the empty list and dereferences a
NULL urb at if (!urb->unlinked).

2. If a concurrent musb_urb_dequeue() for another URB on the same qh started
before musb_advance_schedule() and finishes its own musb_giveback() while
hep->urb_list is now empty, it sees !qh->tt_parked && ready &&
list_empty(&qh->hep->urb_list) and frees qh while qh->clearing_tt is active.

3. If hub_tt_work() runs musb_clear_tt_buffer_complete() while musb->lock is
dropped in musb_giveback(), it clears qh->clearing_tt =3D false while
qh->tt_parked is still false. When musb_advance_schedule() resumes with
another URB queued on hep->urb_list, it sees !qh->clearing_tt and starts the
next URB without setting ep->rx_reinit or ep->tx_reinit.

[ ... ]

> @@ -2122,6 +2170,56 @@ static int musb_schedule(
>  	return 0;
>  }
> =20
> +/*
> + * Continue a qh parked by musb_advance_schedule() once its Clear-TT-Buf=
fer
> + * finished: release it when no URB is queued, else schedule it again.  =
While
> + * the endpoint is being disabled (!is_ready) or the host is inactive it=
 stays
> + * parked; the dequeue and endpoint_disable paths finish it.
> + *
> + * Context: caller owns controller lock, irqs blocked
> + */
> +static void musb_tt_resume(struct musb *musb, struct musb_qh *qh)
> +{
> +	struct usb_host_endpoint	*hep =3D qh->hep;
> +	int				is_in =3D usb_endpoint_dir_in(&hep->desc);
> +
> +	if (!qh->tt_parked || qh->clearing_tt || !qh->is_ready)
> +		return;
> +
> +	if (list_empty(&hep->urb_list)) {
> +		hep->hcpriv =3D NULL;
> +		kfree(qh);
> +		return;
> +	}
> +
> +	if (!is_host_active(musb) || !musb->is_active)
> +		return;

[Severity: High]
If musb_clear_tt_buffer_complete() runs while !is_host_active(musb) ||
!musb->is_active (for example, during root port suspend/resume before
musb_host_finish_resume() sets musb->is_active =3D 1) and hep->urb_list is
non-empty, musb_clear_tt_buffer_complete() clears qh->clearing_tt =3D false=
 and
musb_tt_resume() returns early here with qh->tt_parked still true and qh
detached from the hardware rings.

When the host becomes active again, nothing calls musb_tt_resume() unless a
new URB is submitted via musb_urb_enqueue(). If the driver is waiting for
the URBs already queued in hep->urb_list to complete before submitting more,
won't those URBs remain stranded on the parked qh?

> +
> +	qh->tt_parked =3D false;
> +	/* as for a new control/bulk qh; the shared bulk_ep sets a NAK limit */
> +	qh->intv_reg =3D 0;
> +	if (musb_schedule(musb, qh, is_in))
> +		qh->tt_parked =3D true;
> +}

[Severity: Medium]
Does musb_tt_resume() also need to reset qh->hb_mult before calling
musb_schedule()?

When a bulk OUT transfer is programmed on a controller where
can_bulk_split(musb, qh->type) is true, musb_ep_program() overwrites
qh->hb_mult with hw_ep->max_packet_sz_tx / packet_sz:

drivers/usb/musb/musb_host.c:musb_ep_program() {
	...
			if (can_bulk_split(musb, qh->type)) {
				qh->hb_mult =3D hw_ep->max_packet_sz_tx
						/ packet_sz;
				musb_writew(epio, MUSB_TXMAXP, packet_sz
					| ((qh->hb_mult) - 1) << 11);
	...
}

When musb_tt_resume() later calls musb_schedule(), musb_schedule() checks
candidate endpoints against diff -=3D (qh->maxpacket * qh->hb_mult). If
qh->hb_mult still holds the multiplier from the previous endpoint's TX FIFO
size instead of 1, won't musb_schedule() reject smaller free hardware
endpoints and fall back to the shared musb->bulk_ep?

[ ... ]

> @@ -2412,10 +2517,13 @@ static int musb_urb_dequeue(struct usb_hcd *hcd, =
struct urb *urb, int status)
>  		musb_giveback(musb, urb, 0);
>  		qh->is_ready =3D ready;
> =20
> -		/* If nothing else (usually musb_giveback) is using it
> -		 * and its URB list has emptied, recycle this qh.
> -		 */
> -		if (ready && list_empty(&qh->hep->urb_list)) {
> +		/* A parked qh is not on hw_ep; never clobber hw_ep for it */
> +		if (qh->tt_parked) {
> +			musb_tt_resume(musb, qh);
> +		} else if (ready && list_empty(&qh->hep->urb_list)) {
> +			/* If nothing else (usually musb_giveback) is using it
> +			 * and its URB list has emptied, recycle this qh.
> +			 */
>  			musb_ep_set_qh(qh->hw_ep, is_in, NULL);
>  			qh->hep->hcpriv =3D NULL;
>  			list_del(&qh->ring);

[Severity: Critical]
Can this cause a use-after-free on qh or leave qh->is_ready stuck at 0 when
musb_urb_dequeue() drops musb->lock inside musb_giveback()?

In musb_urb_dequeue():

	if (!qh->is_ready
			|| urb->urb_list.prev !=3D &qh->hep->urb_list
			|| musb_ep_get_qh(qh->hw_ep, is_in) !=3D qh) {
		int	ready =3D qh->is_ready;

		qh->is_ready =3D 0;
		musb_giveback(musb, urb, 0);
		qh->is_ready =3D ready;

		/* A parked qh is not on hw_ep; never clobber hw_ep for it */
		if (qh->tt_parked) {
			musb_tt_resume(musb, qh);
		} else if (ready && list_empty(&qh->hep->urb_list)) {

There are two races across musb_giveback() here:

1. If urb1 is already inside musb_giveback() (either in
musb_advance_schedule() while parking qh, or in musb_urb_dequeue() on an
already-parked qh), it has saved ready =3D 1 and set qh->is_ready =3D 0. If=
 a
second CPU calls musb_urb_dequeue() for urb2 on the same qh while musb->lock
is dropped, CPU 2 observes qh->is_ready =3D=3D 0, saves ready =3D 0, unlink=
s urb2,
and drops musb->lock in musb_giveback().

If CPU 1 finishes musb_giveback() first, it restores qh->is_ready =3D 1, and
once qh->clearing_tt is false, musb_tt_resume() sees qh->is_ready =3D=3D 1 =
and
list_empty(&hep->urb_list) and frees qh via kfree(qh). When CPU 2 returns
from musb_giveback(), it writes qh->is_ready =3D 0 and reads qh->tt_parked =
on
the freed qh.

Conversely, if qh->clearing_tt is still true when CPU 2 returns from
musb_giveback() after CPU 1 restored qh->is_ready =3D 1, CPU 2 overwrites
qh->is_ready =3D 0. When musb_clear_tt_buffer_complete() later calls
musb_tt_resume(), it bails out on !qh->is_ready, leaking qh if hep->urb_list
is empty or permanently wedging the endpoint queue if new URBs were queued.

2. Because musb_giveback() unlinks urb from hep->urb_list before dropping
musb->lock and __usb_hcd_giveback_urb() wakes usb_kill_urb() before
musb_giveback() re-acquires musb->lock, usb_disable_endpoint() ->
musb_h_disable() can run on another CPU while musb_urb_dequeue() is still in
musb_giveback(). In musb_h_disable(), if !qh->clearing_tt, it frees qh right
away; when musb_urb_dequeue() re-acquires musb->lock, it writes
qh->is_ready =3D 1 and calls musb_tt_resume() on the freed qh, leading to a
use-after-free and double-free.

> @@ -2460,13 +2568,18 @@ musb_h_disable(struct usb_hcd *hcd, struct usb_ho=
st_endpoint *hep)
> =20
>  		/* Then nuke all the others ... and advance the
>  		 * queue on hw_ep (e.g. bulk ring) when we're done.
> +		 * A qh parked by the cleanup no longer owns hw_ep.
>  		 */
>  		while (!list_empty(&hep->urb_list)) {
>  			urb =3D next_urb(qh);
>  			urb->status =3D -ESHUTDOWN;
> -			musb_advance_schedule(musb, urb, qh->hw_ep, is_in);
> +			if (qh->tt_parked)
> +				musb_giveback(musb, urb, -ESHUTDOWN);
> +			else
> +				musb_advance_schedule(musb, urb, qh->hw_ep,
> +						      is_in);
>  		}
> -	} else {
> +	} else if (!qh->tt_parked) {
>  		/* Just empty the queue; the hardware is busy with
>  		 * other transfers, and since !qh->is_ready nothing
>  		 * will activate any of these as it advances.
> @@ -2478,6 +2591,26 @@ musb_h_disable(struct usb_hcd *hcd, struct usb_hos=
t_endpoint *hep)
>  		list_del(&qh->ring);
>  		kfree(qh);
>  	}
> +
> +	/*
> +	 * hub_tt_work() passes hep to musb_clear_tt_buffer_complete(), which
> +	 * dereferences hep->hcpriv: free a parked qh only after its clear
> +	 * finished (bounded by the hub control request timeout).
> +	 */
> +	while ((qh =3D hep->hcpriv) && qh->tt_parked) {
> +		while (!list_empty(&hep->urb_list))
> +			musb_giveback(musb, next_urb(qh), -ESHUTDOWN);
> +
> +		if (!qh->clearing_tt) {
> +			hep->hcpriv =3D NULL;
> +			kfree(qh);
> +			break;
> +		}
> +
> +		spin_unlock_irqrestore(&musb->lock, flags);
> +		schedule_timeout_uninterruptible(1);
> +		spin_lock_irqsave(&musb->lock, flags);
> +	}

[Severity: Low]
Instead of polling !qh->clearing_tt in a loop with
schedule_timeout_uninterruptible(1) under musb->lock in musb_h_disable(),
could this use a completion variable signaled by
musb_clear_tt_buffer_complete()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103190333.8720=
7-1-jhonwilker0112@gmail.com?part=3D1
