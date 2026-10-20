Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792520961;
	b=MHbh4KTkNGGz+6qac/igsdAxyKUncR88KkqzrrZoU85NiAzEHtg7x9fNrhV7bYRFQoZq
	 291nuXrTjbfyuFDnwZzVv50VAlrs1efxQJDIzYPJ4JYTw2itZiYoYR3a0lCC7b3wJHACt
	 C4VilUZB8tJwg58eol/lQDFMb8ZUvpz/6oKWrviK7EGluO+JAaCnWVTNMeD3tfktNqNLp
	 xT5+TwNwNx+kNQ89tEKTUlumVJhCQuv5Tc+0c14YVFV1/NVqruuJAbQpZ7YjFy8A4NzcP
	 JoNj6OwqEQaelcPByHGwdyMA61tqpfojcVr7Kzq42QYgjuS5DXVoXCHE8fYUgAZ3k4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792520961;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=T04LIWjxwy7wbYguODqECww07Dw3OrWHwR/MQ87cV9A=;
	b=D245Q0ncC25lLE4C+cJN9GbJvRDWbkq3wDStB5K+78zz3fJQEJGLsXTpjLSOrH2RZNI2
	 eUQKKj4yHXxeNElTKymyADYc7ZE4pfrYEuuAlDyEOSTAAnyBnw/bqdkfuf02hJUP2UoZ5
	 72rLTrvFLyycO+fsWkA8P5xkFejEzqkRe8lhsWBpWQRnV5EFzpmPLlpuU3iOnt3YkqRTL
	 ASqY/S2th6Al20Um+XIDehOTLgrwiMBKlh/S2cjlLFQWAogSkb9RlczpKTxcAa/xrxHFA
	 ng0Z7sKB7b5/F0ZDKSraqAA9BGdf34AOyMRkXjncfW1C2XOWU9Jm19VdXtS8IPKJPVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ExFob1h3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46AB606A31C
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 18:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ExFob1h3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 465591F000C9;
	Tue, 20 Oct 2026 18:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792520960;
	bh=T04LIWjxwy7wbYguODqECww07Dw3OrWHwR/MQ87cV9A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ExFob1h3YoXxWhdHPjv1ksnUP1Z7WLOuP/jhL98XtmyNTZSR7iXCWK0uJ7U+bH/oS
	 Hu4+lxglr3FKKKHBlEC+HyHJ4S04VyGSLOwiIjM4WVQoB2Xi9tiVHDv6KlKkzl6ZKn
	 z21kP8pAFT4MFCEHXoeaaEw61bfP7ofjs7tXjoG2uNtA5SS95UvAahY2oVOoD6ez9B
	 mwImdPfWuzWSQb4BlA2NuqyRWCxn9kcXp/nL8F3zu8Fugap3rUIUN9irw8nOPCvDlb
	 HT2Np9NBgL+2Y6k+LzNuRP+6XgsCdINOoBnNp8aeKBXmNdVT+F4PtXngBythzaOC2t
	 j4sqaW6SbIg/A==
Message-ID: <sashiko-outbox-179473@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usbip: vudc: reject submits after endpoint state
 changes
Reply-To: sashiko-reviews@lists.linux.dev
To: tjdqudcks0424@naver.com
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261020181832.461892-1-tjdqudcks0424@naver.com>
References: <20261020181832.461892-1-tjdqudcks0424@naver.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 18:29:19 +0000
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
- [High] usbip: vudc: v_recv_cmd_submit() -ESHUTDOWN return wedges connecti=
on
- [Medium] usbip: vudc: v_timer() and vep_disable() ignore queued URB gener=
ation
--

commit 7bd17351ae8c46943597685b7fdc609430437627
Author: Sung Byeongchan <tjdqudcks0424@naver.com>

usbip: vudc: reject submits after endpoint state changes

This commit adds a per-endpoint generation counter to vudc endpoints and
snapshots endpoint state under udc->lock in v_recv_cmd_submit(). Before
queuing an incoming urb_p onto udc->urb_queue, it revalidates that the
endpoint descriptor is still present and the generation has not changed.

> diff --git a/drivers/usb/usbip/vudc_dev.c b/drivers/usb/usbip/vudc_dev.c
> index 5ef88117965d1..e3800d5e83a30 100644
> --- a/drivers/usb/usbip/vudc_dev.c
> +++ b/drivers/usb/usbip/vudc_dev.c

[ ... ]

> @@ -270,6 +271,7 @@ static int vep_disable(struct usb_ep *_ep)
> =20
>  	spin_lock_irqsave(&udc->lock, flags);
>  	ep->desc =3D NULL;
> +	ep->generation++;
>  	nuke(udc, ep);
>  	spin_unlock_irqrestore(&udc->lock, flags);

[Severity: Medium]
What happens to urbs that were already validated and added to
udc->urb_queue before vep_disable() runs?

In drivers/usb/usbip/vudc_dev.c, vep_disable() clears ep->desc, increments
ep->generation, and calls nuke(udc, ep), which only drains gadget requests
from ep->req_queue while leaving udc->urb_queue untouched.

When v_timer() in drivers/usb/usbip/vudc_transfer.c iterates
udc->urb_queue, it neither checks ep->desc nor compares ep->generation
against urb_p->ep_generation:

drivers/usb/usbip/vudc_transfer.c:v_timer() {
	...
	list_for_each_entry_safe(urb_p, tmp, &udc->urb_queue, urb_entry) {
		struct urb *urb =3D urb_p->urb;

		ep =3D urb_p->ep;
		if (urb->unlinked)
			goto return_urb;
		if (timer->state !=3D VUDC_TR_RUNNING)
			continue;

		if (!ep) {
			urb->status =3D -EPROTO;
			goto return_urb;
		}
		...
		switch (ep->type) {
		...
		default:
treat_control_like_bulk:
			total -=3D transfer(udc, urb, ep, limit);
		}
		if (urb->status =3D=3D -EINPROGRESS)
			continue;
}

If the endpoint remains disabled, transfer() sees an empty ep->req_queue
and leaves urb->status unchanged, keeping urb_p queued on udc->urb_queue
and re-arming tr_timer every millisecond. If the endpoint is later
re-enabled via vep_enable(), v_timer() processes the stale urb_p from the
old generation against the new endpoint state and dispatches on the new
ep->type while v_send_ret_submit() uses the snapshotted urb_p->type.

Should vep_disable() or v_timer() also fail queued entries on
udc->urb_queue whose endpoint descriptor was cleared or whose
ep->generation no longer matches urb_p->ep_generation?

> diff --git a/drivers/usb/usbip/vudc_rx.c b/drivers/usb/usbip/vudc_rx.c
> index 51bb70837b902..3c459c7b57b5f 100644
> --- a/drivers/usb/usbip/vudc_rx.c
> +++ b/drivers/usb/usbip/vudc_rx.c

[ ... ]

> @@ -175,6 +179,13 @@ static int v_recv_cmd_submit(struct vudc *udc,
>  		goto free_urbp;
> =20
>  	spin_lock_irqsave(&udc->lock, flags);
> +	if (urb_p->ep !=3D &udc->ep[0] &&
> +	    (!urb_p->ep->desc ||
> +	     urb_p->ep->generation !=3D urb_p->ep_generation)) {
> +		spin_unlock_irqrestore(&udc->lock, flags);
> +		ret =3D -ESHUTDOWN;
> +		goto free_urbp;
> +	}
>  	v_kick_timer(udc, jiffies);
>  	list_add_tail(&urb_p->urb_entry, &udc->urb_queue);
>  	spin_unlock_irqrestore(&udc->lock, flags);

[Severity: High]
Can returning this error from v_recv_cmd_submit() wedge the usbip
connection and vudc device state?

By the time v_recv_cmd_submit() reaches this check in
drivers/usb/usbip/vudc_rx.c, usbip_recv_xbuff() and usbip_recv_iso() have
already consumed the full submit payload from ud->tcp_socket. Jumping to
free_urbp drops urb_p without queuing a completion via
v_enqueue_ret_submit() and returns the negative error through v_rx_pdu() to
v_rx_loop():

drivers/usb/usbip/vudc_rx.c:v_rx_pdu() {
	...
	case USBIP_CMD_SUBMIT:
		ret =3D v_recv_cmd_submit(udc, &pdu);
		break;
	...
	return ret;
}

drivers/usb/usbip/vudc_rx.c:v_rx_loop() {
	...
	while (!kthread_should_stop()) {
		if (usbip_event_happened(ud))
			break;
		ret =3D v_rx_pdu(ud);
		if (ret < 0) {
			pr_warn("v_rx exit with error %d", ret);
			break;
		}
	}
	return ret;
}

Unlike other fatal error paths in v_recv_cmd_submit() and v_rx_pdu(), this
path does not call usbip_event_add(), so vudc_shutdown() and
vudc_device_reset() in drivers/usb/usbip/vudc_dev.c are never scheduled:

drivers/usb/usbip/vudc_dev.c:vudc_shutdown() {
	...
	if (ud->tcp_socket)
		kernel_sock_shutdown(ud->tcp_socket, SHUT_RDWR);

	if (ud->tcp_rx) {
		kthread_stop_put(ud->tcp_rx);
		ud->tcp_rx =3D NULL;
	}
	if (ud->tcp_tx) {
		kthread_stop_put(ud->tcp_tx);
		ud->tcp_tx =3D NULL;
	}
	...
}

When ud->tcp_rx exits on its own without an event queued, ud->tcp_tx
remains asleep on udc->tx_waitq, ud->tcp_socket stays open with no reader,
the client hangs waiting for a submit reply, and udc->connected and
ud->status remain stuck in the active state.

Since the stream framing on ud->tcp_socket is still intact after reading
the payload, should v_recv_cmd_submit() complete the rejected urb_p back to
the client via v_enqueue_ret_submit() and return 0, or trigger connection
teardown via usbip_event_add()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020181832.4618=
92-1-tjdqudcks0424@naver.com?part=3D1
