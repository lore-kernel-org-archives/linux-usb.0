Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778806;
	b=5E6dDZfhfVGJZ8q7ttw6ha9HusKvlo7vJEj2hPGUYQU0xB+5QI3sZGSiZ7O7I3v0Cail
	 8C7/7WyVZJkS2R/qu3SICEDmGSQhXJLd3H3kRB1+Knk2gCwnK0JXoqkt4wM2rly48JdjJ
	 pzSOr7ZeSi6hmknnEt5q+ko6tlCS4tJwjb8VzQYVQPdSjpwW0BS6LORar89Pd71bys+9c
	 JtHDPup61fOoXgIhENwBVY1P0aMzPWcK7PDfFcnt8hbQUkGYTM19fqNeIUWd2uH0zip3z
	 VSnPcoPl4YI8A6msOXnX9LNWPR6w9aYam53fbPm6cRMNzkquJo97hXre6v2hDUrvTtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778806;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=maLShubBBFPWBUOuPBnWcUvKOSeRbUOCtsTzdHZhqh4=;
	b=UobCDGHPBZ0sYOIqAcORs8h8BZYrPzjI3S/NG6zMmisqcwdR2HXbsVvesMcOGBRDlbRM
	 g9sITGZQWP4xd+NVcdxFIH512QoqvX6vyTAwjrBVrkFlSA0Vv+I9XHZ6Oo4HsNPGFobJX
	 uqklItxdysvzpPjatsRvsZTMjamZAwdcnSdBso3y6GA9Qdc+jdj4QmRNJfNR/lty2pbQD
	 3k+6XK9qnY45H7bXKN4rNRsZGVl+7IiQzJ1mWfFsMR58UkPodKuObtObhlcFToFfHuADc
	 jgJOMJnmo+zXLCftycD9MbPslFz07WoA3oSALbzFSVEu4+Y5vb3L5iqgXAbi+TayTzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=htg02Itl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F8D606A321
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 18:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=htg02Itl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5021C1F01828;
	Fri, 23 Oct 2026 18:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792778805;
	bh=maLShubBBFPWBUOuPBnWcUvKOSeRbUOCtsTzdHZhqh4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=htg02Itlr//GMxeXHAzXqgRWeGuIL0d2wyS2K+WmRYO1XeHzKAeQoTrvnggd1TJdd
	 OZ5l/EW8Fo58AOICAom88HEWAJwsAJ0isdWpQUzagMNvP+lP4mxvHZZhKQU8XQ+hdO
	 zKbDkimDKagMRGcHFpll/USITsDxlEsrVZGA+ruiG4U0N3PafPuQGu7QxjANXUpsVC
	 eqprSamEL+tC6d8TSJm2JXToS9MipnMA6SOiiUjKzkYoYPfjieQvb3ZO5g27+BPSG1
	 65vnTxYbrt6+EvRge7CDHf7Wfi5+DwmPiSXhE2OpJZMhmPeQu4KMoei6JHsRtXZAzK
	 nXxdIMUYY7nRg==
Message-ID: <sashiko-outbox-183042@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: core: hcd: cancel giveback work synchronously on
 stop
Reply-To: sashiko-reviews@lists.linux.dev
To: "Igor Putko" <igorpetindev@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261023174015.54793-1-igorpetindev@gmail.com>
References: <20261023174015.54793-1-igorpetindev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 18:06:44 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usb: core: hcd: cancel_work_sync() in usb_stop_hcd() strands pendi=
ng BH URBs
--

commit 6e7c5c14d78d88d1d1fec5ad2d48ff9cf59b253d
Author: Igor Putko <igorpetindev@gmail.com>

usb: core: hcd: cancel giveback work synchronously on stop

This commit adds cancel_work_sync() calls for both high and low priority
giveback BH work items in usb_stop_hcd() to prevent use-after-free accesses
to struct usb_hcd when usb_giveback_urb_bh() is still running during HCD
teardown.

> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index a865a15ea3863..e0f00d68598a1 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -2788,6 +2788,9 @@ static void usb_stop_hcd(struct usb_hcd *hcd)
>  	/* In case the HCD restarted the timer, stop it again. */
>  	clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
>  	timer_delete_sync(&hcd->rh_timer);
> +
> +	cancel_work_sync(&hcd->high_prio_bh.bh);
> +	cancel_work_sync(&hcd->low_prio_bh.bh);

[Severity: High]
Could calling cancel_work_sync() instead of draining the BH work items leave
URBs stranded on hcd->high_prio_bh.head and hcd->low_prio_bh.head, leaking
struct urb references and DMA mappings or hanging callers in usb_kill_urb()?

Unlike flush_work(), cancel_work_sync() steals the pending bit if &bh->bh h=
as
not started executing yet, so usb_giveback_urb_bh() never runs for URBs
already queued on bh->head. In addition, if usb_giveback_urb_bh() is already
running a snapshot when new URBs are added to bh->head, it relies on
re-queueing &bh->bh before returning:

drivers/usb/core/hcd.c:usb_giveback_urb_bh() {
	...
	spin_lock_irq(&bh->lock);
	if (!list_empty(&bh->head)) {
		if (bh->high_prio)
			queue_work(system_bh_highpri_wq, &bh->bh);
		else
			queue_work(system_bh_wq, &bh->bh);
	}
	bh->running =3D false;
	spin_unlock_irq(&bh->lock);
}

Because cancel_work_sync() sets WORK_CANCEL_DISABLE while waiting for the
current execution to finish, that queue_work() call is silently dropped.

This can be reached in two ways during HCD teardown:

1. In usb_stop_hcd(), hcd->driver->stop(hcd) runs right before
cancel_work_sync(). For HCD drivers with HCD_BH set that complete remaining
URBs in their stop callback, such as in drivers/usb/dwc2/hcd.c:

_dwc2_hcd_stop()
  -> dwc2_hcd_disconnect()
    -> dwc2_kill_all_urbs()
      -> dwc2_host_complete()
        -> usb_hcd_giveback_urb()

URBs are added to bh->head and &bh->bh is queued immediately before
cancel_work_sync() cancels the pending work item.

2. During usb_remove_hcd() -> usb_disconnect() -> usb_disable_device() ->
usb_hcd_flush_endpoint(), usb_hcd_unlink_urb_from_ep() removes the URB from
ep->urb_list before usb_hcd_giveback_urb() appends it to bh->head. In
drivers/usb/core/hcd.c:usb_hcd_flush_endpoint():

	/* Wait until the endpoint queue is completely empty */
	while (!list_empty (&ep->urb_list)) {

this loop can observe an empty ep->urb_list and return without calling
usb_kill_urb() while the URB is still sitting on bh->head, allowing
usb_stop_hcd() to cancel &bh->bh before usb_giveback_urb_bh() processes it.

Any URB stranded on bh->head never reaches __usb_hcd_giveback_urb(), so it
is never unmapped via unmap_urb_for_dma(), its struct urb reference from
usb_get_urb() is leaked, urb->complete() is skipped, and urb->use_count
remains non-zero (which hangs any caller waiting in usb_kill_urb() or
usb_poison_urb()).

Also, should the comment in drivers/usb/core/hcd.c:usb_remove_hcd() right
above usb_stop_hcd(hcd):

	/*
	 * flush_work() isn't needed here because:
	 * - driver's disconnect() called from usb_disconnect() should
	 *   make sure its URBs are completed during the disconnect()
	 *   callback
	 *
	 * - it is too late to run complete() here since driver may have
	 *   been removed already now
	 */

be updated now that usb_stop_hcd() synchronously waits on the BH work items?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023174015.5479=
3-1-igorpetindev@gmail.com?part=3D1
