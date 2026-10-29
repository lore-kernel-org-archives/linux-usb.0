Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257922;
	b=sZrNp7PUfB6656k4mwJ0sqJurqUnx1NQxSAr/IOCrLQ3LVgbV3Kaj2gJgUtU4rTWNYnS
	 SuWGsZn35hC7vPjJxgJMzAMGaJ6PincThMsX+wHY7q3et4cCbki7qB4stql2OSqM0sfu2
	 SKKi94oTOusgI0+z2SbhTVDmLzblUYosH+xlXeSH3nFUu/AeMkTXrrwTQBqeUIcRhb4P2
	 LEYORSFfmN8Rhh4Xfm5OxcE7FzxejPbbxgKuyG0vdTQttmfIicDcVs6GP4ZjraC7FtlID
	 dsZJXNwBHhzCJhy9gZLEewLhEXrSvkrbHTdiwDuyuZzUIGR1bcjnaTRP3JHzVwp9E6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257922;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3C0BtrWhIZo2r8jUdT+FEZqp2/KKTQcCzk+82vXzTRo=;
	b=w+Z7zPlUkmEPesooiYGSD7tPgxT3vhAPhdlQu6KAubx4DzMt5jBq9MxhWhsS+Y/XSfNz
	 K1ih7IaBuuppKO+21HIePHh6z0sYB27adHWvqNUyOYDT3/mUYGTg+t5JIBz5Trljg39Wk
	 MSRga0pP8stk3pXWqls87Q/Nl3DUtoGuPOWa647A5LoJqxEic3X7wKaL+VNRXWFShgQPP
	 wjU1Db5aNmjFgvBG7sUSILTAXMoWiTDGS1p2P/hdkPaD2l+7YqMCbZt1BQo4WPSRHOVrl
	 FIdDoL83kz1e1+rNvfP0+iDM364oZO7XRxOUbfqZ7/3V/N5CTefvH1fUYE4SwViWOCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BqWtjIvr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DB9606A31A
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 07:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BqWtjIvr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 568871F01828;
	Thu, 29 Oct 2026 07:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793257921;
	bh=3C0BtrWhIZo2r8jUdT+FEZqp2/KKTQcCzk+82vXzTRo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BqWtjIvrPsdy9pR9kiYjzvNuCGxX6dkZco9xwqN+FRalgCaKxEs9CkIWqq04UaTHD
	 OHLZGFupg9QjVxifl+6Os1FAqorLmiHLpGdg69v/oe1Kg2PJvfFI0lrD6IqmLkJ+5L
	 D8XSk/YqBYElJZD9/UOD2q6kaZHALLM01qTSDrePD2HFs5t9tqCMRZQtLRn/GCEebB
	 J/1gzpL3JurvIcYJ378Vg+c/F2ryDs+ANZ+OAfW2rW8vnM23caqLMoMt2QezYoCJpO
	 F/6rVB6qFI8VowXuP+lK1ZJazOC8UmvtwRTSWofubzm2DBU9Of0Ws8s7vA44n1Zb8u
	 7xwrtzvNB82YQ==
Message-ID: <sashiko-outbox-188842@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] usb: xhci: Fix TD invalidation on disconnected
 endpoints
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Pecio" <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261029075459.64108477.michal.pecio@gmail.com>
References: <20261027184117.2461065-1-yiyu@yiyuzhou.io>
 <20261027192128.386082-1-mathias.nyman@linux.intel.com>
 <20261028080734.173da0e4.michal.pecio@gmail.com>
 <20261029075409.4b203658.michal.pecio@gmail.com>
 <20261029075459.64108477.michal.pecio@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 07:12:00 +0000
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
- [High] usb: xhci: uncleared deferred stream TDs in xhci_invalidate_cancel=
led_tds()
--

commit 6bfb98376f7395944affad9a4c188ba84e981149
Author: Michal Pecio <michal.pecio@gmail.com>

usb: xhci: Fix TD invalidation on disconnected endpoints

This commit moves the EP_DROP_PENDING check in
xhci_invalidate_cancelled_tds() after the loop over ep->cancelled_td_list
and restricts the early return to non-EP0 endpoints so that EP0 TRBs are
turned into no-ops and the dequeue pointer is moved to enqueue when a
disconnected device is resuscitated by reset.

Link: https://lore.kernel.org/linux-usb/SrQQcLIwRWyg9PdEIpc0eg@dsine.de/

> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index ec278a9f95404..698f994e43a55 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -1063,12 +1063,6 @@ static int xhci_invalidate_cancelled_tds(struct xh=
ci_hcd *xhci, struct xhci_virt
>  			continue;
>  		}
> =20
> -		/* device disconnected or link error, ep will be dropped */
> -		if (ep->ep_state & EP_DROP_PENDING) {
> -			td->cancel_status =3D TD_CLEARED;
> -			continue;
> -		}
> -
>  		/*
>  		 * If a ring stopped on the TD we need to cancel then we have to
>  		 * move the xHC endpoint ring dequeue pointer past this TD.
> @@ -1120,6 +1114,12 @@ static int xhci_invalidate_cancelled_tds(struct xh=
ci_hcd *xhci, struct xhci_virt
>  	if (!cached_td)
>  		return 0;
> =20
> +	/* Don't bother fixing disconnected endpoints except EP0 */
> +	if (ep->ep_state & EP_DROP_PENDING && ep->ep_index !=3D 0) {
> +		cached_td->cancel_status =3D TD_CLEARED;
> +		return 0;
> +	}

[Severity: High]
Can this leave deferred TDs uncleared on multi-stream endpoints?

When a non-EP0 multi-stream endpoint has EP_DROP_PENDING set and multiple
streams have cancelled TDs at their hardware dequeue pointers
(trb_in_td(td, hw_deq)), the loop in
drivers/usb/host/xhci-ring.c:xhci_invalidate_cancelled_tds() unlinks every
cancelled TD from ring->td_list via list_del_init(&td->td_list), assigns
the first stopped stream's TD to cached_td with TD_CLEARING_CACHE, and
marks subsequent stopped TDs on other streams as TD_CLEARING_CACHE_DEFERRED:

	if (cached_td) {
		if (cached_td->urb->stream_id !=3D td->urb->stream_id) {
			/* Multiple streams case, defer move dq */
			xhci_dbg(xhci,
				 "Move dq deferred: stream %u URB %p\n",
				 td->urb->stream_id, td->urb);
			td->cancel_status =3D TD_CLEARING_CACHE_DEFERRED;
			break;
		}

When the new EP_DROP_PENDING check after the loop returns early without
calling xhci_move_deq_to_next_td(), only cached_td->cancel_status is set to
TD_CLEARED, leaving any TD_CLEARING_CACHE_DEFERRED TDs on
ep->cancelled_td_list uncleared.

In xhci_giveback_invalidated_tds(), only TDs with cancel_status =3D=3D TD_C=
LEARED
are cleaned up and given back:

	if (td->cancel_status =3D=3D TD_CLEARED) {
		xhci_dbg(xhci, "%s: Giveback cancelled URB %p TD\n",
			 __func__, td->urb);
		xhci_td_cleanup(xhci, td, ring, td->status);
	} else {
		xhci_dbg(xhci, "%s: Keep cancelled URB %p TD as cancel_status is %d\n",
			 __func__, td->urb, td->cancel_status);
	}

Since SET_DEQ_PENDING is never set, nothing re-triggers invalidation,
stranding those deferred TDs in usb_kill_urb() or usb_hcd_flush_endpoint().

Even with the later patches in this series ("usb: xhci: Give back stranded
URBs on disconnected endpoints" and "usb: xhci: Give back URBs on halted
disconnected endpoints") that add a fallback call to
xhci_kill_endpoint_urbs(), could this still cause problems in two ways?

First, if xhci_giveback_invalidated_tds() runs while EP_STOP_CMD_PENDING or
EP_HALTED is still set (for example via xhci_handle_cmd_stop_ep() ->
xhci_handle_halted_endpoint() -> xhci_process_cancelled_tds(), before
EP_STOP_CMD_PENDING is cleared at reset_done), xhci_kill_endpoint_urbs() is
skipped and the deferred TDs remain stranded.

Second, when xhci_kill_endpoint_urbs() does run, those deferred TDs were
already unlinked from ring->td_list by xhci_invalidate_cancelled_tds(), so
they bypass both xhci_td_cleanup() and xhci_kill_ring_urbs() and fall into
the ep->cancelled_td_list loop in xhci_kill_endpoint_urbs(), which does not
call xhci_unmap_td_bounce_buffer() and overwrites td->status with
-ESHUTDOWN.

Should this path also clear any TD_CLEARING_CACHE_DEFERRED TDs on
ep->cancelled_td_list, similar to the error handling path when
xhci_move_deq_to_next_td() fails?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029075409.4b20=
3658.michal.pecio@gmail.com?part=3D1
