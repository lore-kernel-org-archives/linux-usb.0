Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793258383;
	b=FwqYJZTt6/h2EkegPTde6lbrsVVy2Kr25Zk4V+LEblSwrxl/+T56IFDT1WANi1COJuzl
	 MMQBsmb6Gsn/+N6bFngwjcWViep4HwXGqYHsWYH+PECA6XhRcNmvG/uX2q2Cw3Ox/1HCD
	 VpOmKt7zE8EjPqsVhCunphPDxTV98LTJ5knVtEbOQ0ZrPD06bE6UfNfwWzM8HXx6VVvUg
	 r/lgs5hUFC9ATXBtmyF1a20K3Omy1teOL1971eAWHjQh31ROLBr/EHL8QyxgviLcdhESe
	 guA7LGLHyx+SYJwjGovQcM6aJGQd9+i6VtwmAqB/SRAzrteyNTldKgD9xRXhSDTIRqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793258383;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=s6ZTEULfWRNFjvi/I7ghlPIHVwYhHzCs39g2esy/8s8=;
	b=Xwa4FDsOCCxDTOcZA3unuAYwDqtdBnfrtx/+ZR3QAZGEwXOzn1MNlw8p3FREb5qmrxft
	 L0OZqzMOD1zScZh4b4aHuw1cD5dsDZ4ZADJ8Gj3LAqXUl9C9lfDqK+njDTK1eCkb76u4g
	 wN4fG86o8ORGSqkqzt00bztaHJaFUv7yeQGg21nrPaLRAeO4RRh18olGBA/w/jXtMHDxP
	 2aaC3v2US4ojLKVbH0pIMk4SNAEe5qUxXAXxvcycXQXG5x+nhDvDoASPOuahJ8qU7izob
	 Mlv0heF195f2mWuNjnALTfEJbMDuntH4DzWIKi/EwKTKPfSR3GWuVaIUYyKN1eoL4Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PJkQIAld;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEA9606A31C
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 07:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PJkQIAld
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96C7C1F01825;
	Thu, 29 Oct 2026 07:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793258382;
	bh=s6ZTEULfWRNFjvi/I7ghlPIHVwYhHzCs39g2esy/8s8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PJkQIAldZhK85ZaHmyeezzjtwESPGxWnonSL8iJokujbPz0fZH+xSH/yfZpRMZ0w+
	 chNFX+TeGWMvNPcRAw4PyzUCMdHXR7eFSD8mD35D4IBvHkkAXAywUZur2Lal0dXUwX
	 B3w2WabzGs+6Z+AiK1p6CWaj9Kzy9YCTV0D2boayQhV/s35AVg7Cx2bKfTk/lWevIU
	 28WqvOqMr3Mq2CDJsyNimIuX3d63/ro6ypeWki7tqg4ihWshna341Os7Gao+vDtCNq
	 4ycsSLLN1msbBaKIb3QXOfJVt+/JVYCaKay+KfVUSfijkiqu71oegAC4RngoVNKcXX
	 uLU6+IJDkOaxg==
Message-ID: <sashiko-outbox-188853@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] usb: xhci: Give back URBs on halted disconnected
 endpoints
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Pecio" <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261029075622.2eacf9be.michal.pecio@gmail.com>
References: <20261027184117.2461065-1-yiyu@yiyuzhou.io>
 <20261027192128.386082-1-mathias.nyman@linux.intel.com>
 <20261028080734.173da0e4.michal.pecio@gmail.com>
 <20261029075409.4b203658.michal.pecio@gmail.com>
 <20261029075622.2eacf9be.michal.pecio@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 07:19:42 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] usb: xhci: xhci_handle_halted_endpoint() completes failed URBs wit=
h status 0
- [High] usb: xhci: xhci_handle_halted_endpoint() skips killing URBs during=
 Stop EP
--

commit 87abeac00a1623e4912a3090721b206e6d47ac3a
Author: Michal Pecio <michal.pecio@gmail.com>

usb: xhci: Give back URBs on halted disconnected endpoints

This commit updates xhci_handle_halted_endpoint() to override soft retries
with EP_HARD_RESET and call xhci_process_cancelled_tds() for non-zero
endpoints on disconnected or link-inactive roothub ports, ensuring URBs are
given back without queuing a Reset Endpoint command.

Link: https://lore.kernel.org/linux-usb/20261010064407.11030-1-yiyu@yiyuzho=
u.io/
Link: https://lore.kernel.org/linux-usb/SrQQcLIwRWyg9PdEIpc0eg@dsine.de/

> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 49483eb55dc83..b731e59852f58 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -995,13 +995,14 @@ static int xhci_handle_halted_endpoint(struct xhci_=
hcd *xhci,
>  	int err;
> =20
>  	/*
> -	 * Avoid resetting endpoint if link is inactive or device disonnected.
> -	 * Can cause host hang.
> -	 * Device will be reset to recover an inactive link, so don't do anythi=
ng
> +	 * Flag endpoints behind disconnected RH ports and override soft retrie=
s.
> +	 * Restarting them is futile and known to trigger HC bugs on USB3 buses.
>  	 */
>  	if (rhub_port->link_inactive || !rhub_port->connected) {
> +		xhci_dbg(xhci, "Halted slot %d ep %d is lost\n",
> +				slot_id, ep->ep_index);
>  		ep->ep_state |=3D EP_DROP_PENDING;
> -		return -ENODEV;
> +		reset_type =3D EP_HARD_RESET;
>  	}

[Severity: High]
Can overriding reset_type from EP_SOFT_RESET to EP_HARD_RESET here cause
failed bulk and interrupt URBs to be completed with status 0 (success)?

When a bulk or interrupt transfer fails with COMP_USB_TRANSACTION_ERROR on a
non-TT endpoint without XHCI_NO_SOFT_RETRY, handle_tx_event() calls
process_bulk_intr_td(), which clears td->status to 0 before requesting a so=
ft
reset and returns before updating td->urb->actual_length:

drivers/usb/host/xhci-ring.c:process_bulk_intr_td()
	case COMP_USB_TRANSACTION_ERROR:
		if (xhci->quirks & XHCI_NO_SOFT_RETRY ||
		    (ep->err_count++ > MAX_SOFT_RETRY) ||
		    le32_to_cpu(slot_ctx->tt_info) & TT_SLOT)
			break;

		td->status =3D 0;

		xhci_handle_halted_endpoint(xhci, ep, td, EP_SOFT_RESET);
		return;

When xhci_handle_halted_endpoint() upgrades reset_type to EP_HARD_RESET, it
places td onto ep->cancelled_td_list with td->status still set to 0:

	if (reset_type =3D=3D EP_HARD_RESET) {
		ep->ep_state |=3D EP_HARD_CLEAR_TOGGLE;
		if (td && list_empty(&td->cancelled_td_list)) {
			list_add_tail(&td->cancelled_td_list, &ep->cancelled_td_list);
			td->cancel_status =3D TD_HALTED;
		}
	}

Then xhci_process_cancelled_tds() -> xhci_invalidate_cancelled_tds() marks
the TD as TD_CLEARED, and xhci_giveback_invalidated_tds() gives it back usi=
ng
td->status before xhci_kill_endpoint_urbs() runs:

drivers/usb/host/xhci-ring.c:xhci_giveback_invalidated_tds()
		if (td->cancel_status =3D=3D TD_CLEARED) {
			xhci_dbg(xhci, "%s: Giveback cancelled URB %p TD\n",
				 __func__, td->urb);
			xhci_td_cleanup(xhci, td, ring, td->status);
		}

Wouldn't this complete the failed URB to the USB driver with urb->status =
=3D=3D 0
and urb->actual_length =3D=3D 0 instead of an error code?

> =20
>  	/* add td to cancelled list and let reset ep handler take care of it */
> @@ -1019,6 +1020,12 @@ static int xhci_handle_halted_endpoint(struct xhci=
_hcd *xhci,
>  		return 0;
>  	}
> =20
> +	/* Don't reset lost endpoints, only EP0 can survive device reset */
> +	if (ep->ep_state & EP_DROP_PENDING && ep->ep_index !=3D 0) {
> +		xhci_process_cancelled_tds(xhci, ep);
> +		return 0;
> +	}

[Severity: High]
What happens here if an endpoint halts on a disconnected or link-inactive
port while a Stop Endpoint command is pending (EP_STOP_CMD_PENDING is set)?

In xhci_giveback_invalidated_tds(), xhci_kill_endpoint_urbs() is skipped
whenever EP_STOP_CMD_PENDING is set:

drivers/usb/host/xhci-ring.c:xhci_giveback_invalidated_tds()
	/* Nuke stranded URBs if there is no one to give them back */
	if ((ep->ep_state & EP_DROP_PENDING) &&
	    !(ep->ep_state & (EP_HALTED | SET_DEQ_PENDING | EP_STOP_CMD_PENDING)))
		xhci_kill_endpoint_urbs(xhci, ep->vdev->slot_id, ep->ep_index);

When the Stop Endpoint command completes with COMP_CONTEXT_STATE_ERROR in
EP_STATE_HALTED, xhci_handle_cmd_stop_ep() calls
xhci_handle_halted_endpoint() before clearing EP_STOP_CMD_PENDING:

drivers/usb/host/xhci-ring.c:xhci_handle_cmd_stop_ep()
			/* reset ep, reset handler cleans up cancelled tds */
			err =3D xhci_handle_halted_endpoint(xhci, ep, td, reset_type);
			xhci_dbg(xhci, "Stop ep completion resetting ep, status %d\n", err);
			if (err)
				break;
reset_done:
			/* Reset EP handler will clean up cancelled TDs */
			ep->ep_state &=3D ~EP_STOP_CMD_PENDING;
			return;

Because EP_STOP_CMD_PENDING is still set during the call to
xhci_handle_halted_endpoint(), xhci_process_cancelled_tds() ->
xhci_giveback_invalidated_tds() skips xhci_kill_endpoint_urbs(). Then,
because xhci_handle_halted_endpoint() returns 0 instead of an error,
xhci_handle_cmd_stop_ep() jumps to reset_done, clears EP_STOP_CMD_PENDING,
and returns early without reaching the xhci_giveback_invalidated_tds() call
at the end of xhci_handle_cmd_stop_ep().

Doesn't this leave all remaining non-cancelled URBs on the endpoint ring
stranded?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029075409.4b20=
3658.michal.pecio@gmail.com?part=3D3
