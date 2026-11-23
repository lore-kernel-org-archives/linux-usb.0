Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458693;
	b=pEI8f2BnJdYLOnsJqC6gEUNjPnnoo5GycVHuCVdlFo/DvXcrTxJUq/Bo8PQOiSL/B2hg
	 v5WBN3iewyzwkHb+CWp3KeJv+0mGFMvMqjBxrLPod1FJhwgwS0VeGJde4Yu4YkyE4WXiU
	 nmB6+1LfKIsfiVbcPZeu7i6wtNWE4i1cxtXgaKCtR2YSEDRZsTJcKZKMC3q0P6Aqfbbq8
	 YYmRI9MzONMGnxGGSCYjIL6UikVakWOmMWeVTIE3OpzzyU/e+y/6NgnSGA0pLQJDJQWD7
	 cL8zhrLKrs2xzcXtdGf++owQ9fhe/9WZc0WL4q5VkZs5JIL6hQTkEZIFwtXNadNvx/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458693;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JukesE8qLrxgfjcNL0DAzlJ3GGn1FrbqBaPQEGUkeYo=;
	b=muv3iNtliJVbe/+V/vetfzJsVamYhBQzZzmpPXs3H/8VgIlfHNzHTQOD5v5BuZ/AV8UI
	 ihUS4I6jBlZizqsqZWPoavajReqO66ZL9D4RPoTa3xlgzH5MzBV48ssaMXqSJPjgpHug0
	 QVsT/OwEYAtCTA3lcmeorBPVUZn9HPWdeeSgncSgVXHGJdQ7VCVimpNnu7qhzdEyx6b0A
	 wMG2+rcz2Hq2MuOkPwrcxEf1LdOCxfJzs6yEO55m407EzrHBx/ynX/rjlHE6sSHQGqt94
	 NUL/2WuxXt0neJcXBI1h93QNDPzBh7a5vNxkhtUIXaH2lZ+4CpRx7XeDn9xdLX+d/wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mkfZW1se;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0993606A31A
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 18:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mkfZW1se
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C3491F000C0;
	Mon, 23 Nov 2026 18:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795458692;
	bh=JukesE8qLrxgfjcNL0DAzlJ3GGn1FrbqBaPQEGUkeYo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mkfZW1sez1e9sOLyZLCImjdCMKzz9hjNctoAUgOvZ/paHhybn8zY0k4zlDdkUEDz+
	 lbsiPtBljLR8M9ZSN2nFbRM/9uH2oWZ4VAk5FaQD+i3a0TA3JegZWLXAoW9QrvtBiR
	 8ksuDb62ZnomFRJVeSy2/Qip7pZuj6mz6C3El6ZF/yBKuco+QAZ26pvdGq5Utb5iAt
	 8hHDkDqDy9tiUnAjg8UPR2ngNO6N8nccwXmgdsCX4ePoNTuwpVSNHnOWsHxkw7D8i0
	 W1A0b8yzliFMlPYTlvtvzmBaDrNx6vktQoYfINrQ/1neDLUfHbGI/Iem6gzmwGy0RE
	 d6DasTLwTspYw==
Message-ID: <sashiko-outbox-229825@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: xhci: Demote isoch buffer overrun message to debug
 level
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Kononov" <alex@albefly.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261123-xhci-overrun-dbg-v1-1-4e5a2f11740d@albefly.com>
References: <20261123-xhci-overrun-dbg-v1-1-4e5a2f11740d@albefly.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 18:31:31 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Critical] usb: xhci: use-after-free in handle_tx_event() [1]
--

commit a6e2659078b35c8ca15718bbecaa3c3d7eb80931
Author: Alex Kononov <alex@albefly.com>

usb: xhci: Demote isoch buffer overrun message to debug level

This commit changes the logging of COMP_ISOCH_BUFFER_OVERRUN events in
handle_tx_event() from xhci_warn() to xhci_dbg() to avoid flooding the
kernel log on device-triggered overruns.

> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index a1fa188680f58..39d214e8a0289 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -2815,7 +2815,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
>  			  slot_id, ep_index);
>  		break;
>  	case COMP_ISOCH_BUFFER_OVERRUN:
> -		xhci_warn(xhci,
> +		xhci_dbg(xhci,
>  			  "WARN: buffer overrun event for slot %u ep %u on endpoint",
>  			  slot_id, ep_index);
>  		break;

[Severity: Critical]
This problem wasn't introduced by this patch, but can handle_tx_event()
pass a freed td pointer to xhci_handle_halted_endpoint() [1]?

Later in handle_tx_event(), when td->error_mid_td is set and the event TRB
lies outside that TD, xhci_dequeue_td() -> xhci_td_cleanup() gives back
the URB and frees the urb_priv containing td:

drivers/usb/host/xhci-ring.c:handle_tx_event() {
	...
	td =3D list_first_entry_or_null(&ep_ring->td_list, struct xhci_td, td_list=
);

	if (td && td->error_mid_td && !trb_in_td(td, ep_trb_dma)) {
		xhci_dbg(xhci, "Missing TD completion event after mid TD error\n");
		xhci_dequeue_td(xhci, td, ep_ring, td->status);
	}

	if (list_empty(&ep_ring->td_list)) {
		...
		ep->skip =3D false;
		goto check_endpoint_halted;
	}
	...
check_endpoint_halted:
	if (xhci_halted_host_endpoint(xhci, ep_ctx, trb_comp_code))
		xhci_handle_halted_endpoint(xhci, ep, td, EP_HARD_RESET);
}

If that TD was the last one on ep_ring->td_list and the endpoint halted,
the jump to check_endpoint_halted passes the dangling td pointer to
xhci_handle_halted_endpoint(), which links td->cancelled_td_list into
ep->cancelled_td_list, causing a use-after-free and list corruption.
Setting td =3D NULL after xhci_dequeue_td() would avoid this.

[1] https://sashiko.dev/#/bug/linux-2b321b4d-f99f-4acd-9590-8dd98a82ebb5

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-xhci-overr=
un-dbg-v1-1-4e5a2f11740d@albefly.com?part=3D1
