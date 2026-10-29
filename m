Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793258621;
	b=yBBdRwejbqxlh5LHkBstKuio1NI+qrzXSy475VcLavPn8MHDQYXfHa984v0+6K7clcge
	 1+oS7/F894VqImKyez2f8F0zFIF6BFzSd+5PUhODbDpPLWRvaOJuu3VWeVaV5Q7LT93L1
	 eDjpwdZ450RngHs8id4z0wljujP0LvGB3a9xX3a++Y4gY6QWM9KwHA4NtctvT9CY203+j
	 mDWJwFO+98StLBpzIzQF6u1b78lkW92tyPkyPpMyJSVNGxvjZ7Dpbv4YnkZyWiaAgE8VQ
	 uZpD4unOdHJywy5WVSPcL/oWmT8u++w/EyQ7pRyjEiZ7IniQAIfdQrfI2yc9EOrfprA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793258621;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6veVbuYOGe4Gdf8FYOE/iMcGJhQU/IWNRfV2/MpQ85E=;
	b=AfPTQbX4yh+nJPnC+Kg7rtZO6PUvnoTiyUTP2gYkQl/meL/O8CoWIhcUHNkHoD5hk52y
	 jrcM+bKLJWIHQNWrvfJkDVUOSXIe/DoejKO88N37f1IwSw8YYdsVm7EFezakUc42yLAWj
	 +uilqDJHlXB5gQg2QoaoXKmHnB1aR7BTluwfzHNDyfXSOgqOETs08cfDMPR2tjpR2DxXM
	 WQP7bscMoKzTM8XZ7HfUdetTQeIk9MUpk9HOe8oeARwu+OQ2oRIY0NPl4KCJQYwTd/ul+
	 6gLilSE8C+tjTiTmv6vcRHVnPujqxSR8BGFNnR4C0AC8QsG0zOyjuPc9vX8aPnnbNTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jvg57txk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0D5606A31A
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 07:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jvg57txk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 220E21F01825;
	Thu, 29 Oct 2026 07:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793258620;
	bh=6veVbuYOGe4Gdf8FYOE/iMcGJhQU/IWNRfV2/MpQ85E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jvg57txkYluCEsRCkCvxJQmjNOQU9AQ+24VN/dDutrTXfoGfRyGam35cf+IH4YPYP
	 D7Q+oShdf4Zv4to0P03Vq7KyVvBWlWAvqOsQINGuCnB7PSEdDKXLiwNaNC5NmxQC4f
	 omQL1nHsJg/rmbDdV5VFVB3uj1q8DfH7xdDJSuuNoL+W8UHAXupPlZ/uas3cgI3CVO
	 /xpI9DHPQ0SNNwUmEiiFEBVrT6Qcthum+10ddTIrJBSOuTs37WVBMvWb6wOK3nKPCu
	 okHiJyTyWiszccsbNN5tEzsieCBIc5GK7txFjGxsq5S0/UHEf3HDi7WcMP7hLGCdQU
	 VASVfR10UStzA==
Message-ID: <sashiko-outbox-188860@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] usb: xhci: Give back stranded URBs on disconnected
 endpoints
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Pecio" <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261029075543.3fe902b3.michal.pecio@gmail.com>
References: <20261027184117.2461065-1-yiyu@yiyuzhou.io>
 <20261027192128.386082-1-mathias.nyman@linux.intel.com>
 <20261028080734.173da0e4.michal.pecio@gmail.com>
 <20261029075409.4b203658.michal.pecio@gmail.com>
 <20261029075543.3fe902b3.michal.pecio@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 07:23:39 +0000
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
- [High] usb: xhci: uncleared deferred TDs in xhci_invalidate_cancelled_tds=
()
--

commit b1010543af7d4802d6d3abbb86ff8ccfdb2101da
Author: Michal Pecio <michal.pecio@gmail.com>

usb: xhci: Give back stranded URBs on disconnected endpoints

This commit gives back remaining URBs on endpoints marked with
EP_DROP_PENDING by cancelling remaining TDs before invalidation on EP0 and
calling xhci_kill_endpoint_urbs() after cancelled TD processing on other
endpoints.

> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 698f994e43a55..49483eb55dc83 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c

[ ... ]

> @@ -953,6 +954,11 @@ static void xhci_giveback_invalidated_tds(struct xhc=
i_hcd *xhci, struct xhci_vir
>  		if (xhci->xhc_state & XHCI_STATE_DYING)
>  			return;
>  	}
> +
> +	/* Nuke stranded URBs if there is no one to give them back */
> +	if ((ep->ep_state & EP_DROP_PENDING) &&
> +	    !(ep->ep_state & (EP_HALTED | SET_DEQ_PENDING | EP_STOP_CMD_PENDING=
)))
> +		xhci_kill_endpoint_urbs(xhci, ep->vdev->slot_id, ep->ep_index);

[Severity: High]
Can this skip xhci_td_cleanup() and leak DMA bounce buffer mappings on
disconnected stream-enabled endpoints when multiple streams have cancelled
TDs stopped at their hardware dequeue pointers?

In drivers/usb/host/xhci-ring.c, xhci_invalidate_cancelled_tds() first
unlinks every TD on ep->cancelled_td_list from its transfer ring via
list_del_init(&td->td_list). When cancelled TDs are stopped at hw_deq across
multiple streams, the first TD becomes cached_td with TD_CLEARING_CACHE,
while TDs in other streams are marked TD_CLEARING_CACHE_DEFERRED:

drivers/usb/host/xhci-ring.c:xhci_invalidate_cancelled_tds() {
	...
	if (cached_td->urb->stream_id !=3D td->urb->stream_id) {
		/* Multiple streams case, defer move dq */
		xhci_dbg(xhci,
			 "Move dq deferred: stream %u URB %p\n",
			 td->urb->stream_id, td->urb);
		td->cancel_status =3D TD_CLEARING_CACHE_DEFERRED;
		break;
	}
	...
}

Later in xhci_invalidate_cancelled_tds(), the early return for disconnected
non-control endpoints only clears cached_td:

	/* Don't bother fixing disconnected endpoints except EP0 */
	if (ep->ep_state & EP_DROP_PENDING && ep->ep_index !=3D 0) {
		cached_td->cancel_status =3D TD_CLEARED;
		return 0;
	}

Any TDs in other streams remain in TD_CLEARING_CACHE_DEFERRED without a
Set TR Dequeue command queued.

When xhci_giveback_invalidated_tds() runs, those deferred TDs are skipped by
the first loop because td->cancel_status !=3D TD_CLEARED, and are then hand=
ed
to xhci_kill_endpoint_urbs(). Because they were already removed from
ring->td_list, xhci_kill_ring_urbs() does not see them, and they fall
through to the ep->cancelled_td_list loop at the end of
xhci_kill_endpoint_urbs():

drivers/usb/host/xhci-ring.c:xhci_kill_endpoint_urbs() {
	...
	list_for_each_entry_safe(cur_td, tmp, &ep->cancelled_td_list,
			cancelled_td_list) {
		list_del_init(&cur_td->cancelled_td_list);
		inc_td_cnt(cur_td->urb);

		if (last_td_in_urb(cur_td))
			xhci_giveback_urb_in_irq(xhci, cur_td, -ESHUTDOWN);
	}
}

Unlike xhci_kill_ring_urbs() and xhci_td_cleanup(), this loop does not call
xhci_unmap_td_bounce_buffer() (leaving seg->bounce_dma mapped and
seg->bounce_len non-zero) and overwrites the cancelled URB's td->status with
-ESHUTDOWN. Additionally, if EP_HALTED is set on the endpoint, those
already-cancelled URBs will not be given back here either.

Should the EP_DROP_PENDING && ep->ep_index !=3D 0 path in
xhci_invalidate_cancelled_tds() also mark any TD_CLEARING_CACHE_DEFERRED TDs
as TD_CLEARED (similar to the xhci_move_deq_to_next_td() error path right
below it) so that xhci_giveback_invalidated_tds() cleans them up normally?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029075409.4b20=
3658.michal.pecio@gmail.com?part=3D2
