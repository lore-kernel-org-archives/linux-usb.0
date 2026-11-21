Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795274428;
	b=5Xq4/aF8ONU9Klqq34gTD6vjPrHK8M2tq2/KiyTzxabrZph/7YsZVsc2K/Ctceqgucgt
	 tj01R2BOqGsY3PdpMpd1orz7IYPvz+CrCylSLpcD4/AodkkUuArPb8i4zesctWc+BajEJ
	 uP+L4q3T6OJz9t7TAzTTogHtJYtOsSLH8ihyRCLFdvEutQI9VctH3H1bkvekRCXrw7tss
	 ysmMH/RM9ivb0EZXYKMEMC9++T2FvlO8fPYxrWYMCzkBZia5oddllQD/pTeogBkLqMrrI
	 zSHUzk+uKPJ7oiB8DXc570C0nDW/0VDQ4nmf2Hb3poieSZbWh5wL/KNfEpL743F+r2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795274428;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=K5QDbVRkqIWQREKcNtX0WKq6F2flwjdGAJMVY/0v/eY=;
	b=vARA2vo+0icKlYfdnSVoBwhCj5jCthhKImPWToYqHtLzSdkx41uE9yk8D+nXtZdtBYdl
	 2ZestMBa1axw8yPXIJsXmyxZ9qhwNLjLcZBZ3lJ9oEMGQszj+oDArZDNdbUmVMErqfSKE
	 qQqig2KlDdsOmEtPIZYAcuEhfjTuY94UbVf6zR37cgiSwifk7L5V3oD6mJANC79GjbGEn
	 pdnWM5vJUqTzvN2XFsi5UoPf/g4/9Di0jLD3yzUhhIFCqQ2qKhRawNMg7ixQtJZbsiKPV
	 7ePIAr3Hmmt7cLee4n2th99oymCybClfO0kfJd9ZE7TZtylosKxuGwpxCFWm+8wfaXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h66bzHyH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF27C606A33E
	for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 15:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h66bzHyH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 874FE1F000C6;
	Sat, 21 Nov 2026 15:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795274428;
	bh=K5QDbVRkqIWQREKcNtX0WKq6F2flwjdGAJMVY/0v/eY=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=h66bzHyH4SmhePs39mFbG64L0fVw2LHsHObp5t18UvHzt5+F88OFKNUQ9iONU0PUl
	 /tSF1TkDXT7ddeVNiJkgLMtLpDCrgsuy4Td7aZHnvhcHUOsYxBx4STDzObrYCMv6ri
	 7a3SXKPP1A2p+YqqzIWGbgC1CsWGqJariNWEd7rYJ/Vdlet8YXXGaU/Miz0lol7YDO
	 CymF4hvkxxBYCQ+0CEvL/0Kx1uq3e+WhCFqkEUXnwzEI9mox3CstbyDIkU+MSOsnnp
	 QwIb+4VBuezai/Bh+0trkGypMLucIvCIOcl0mC/qqhrpEByG4m5vKEvzBvhf7rMYc3
	 GD+A/OBtcI9sA==
Message-ID: <sashiko-outbox-227118@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: gadget: lpc32xx_udc: handle interrupts with an
 empty queue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fang Xieyan" <fangxy@xiaopeng.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261121151233.82306-1-fangxy@xiaopeng.com>
References: <20261121151233.82306-1-fangxy@xiaopeng.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 15:20:28 +0000
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
- [High] usb: gadget: lpc32xx_udc: incomplete dequeue fix corrupts
  active requests
--

commit 48ddd0ae77fc12c24e8e346c29dd18e939ebec47
Author: Fang Xieyan <fangxy@xiaopeng.com>

usb: gadget: lpc32xx_udc: handle interrupts with an empty queue

This commit checks whether ep->queue is empty in udc_handle_eps() and
udc_handle_dma_ep() before accessing the head request, disabling the
endpoint interrupt or DMA channel and clearing pending DMA interrupts when
no request is queued.

> diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/ud=
c/lpc32xx_udc.c
> index 94355d3d930fd..8d6b9f356589c 100644
> --- a/drivers/usb/gadget/udc/lpc32xx_udc.c
> +++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
> @@ -1945,6 +1945,13 @@ static void udc_handle_eps(struct lpc32xx_udc *udc=
, struct lpc32xx_ep *ep)
>  	/* Get endpoint status */
>  	epstatus =3D udc_clearep_getsts(udc, ep->hwep_num);
> =20
> +	/* The request may have been dequeued; nothing is left to complete. */
> +	if (list_empty(&ep->queue)) {
> +		ep->req_pending =3D 0;
> +		uda_disable_hwepint(udc, ep->hwep_num);
> +		return;
> +	}
> +
>  	/*
>  	 * This should never happen, but protect against writing to the
>  	 * buffer when full.
> @@ -1958,7 +1965,6 @@ static void udc_handle_eps(struct lpc32xx_udc *udc,=
 struct lpc32xx_ep *ep)
>  	} else
>  		return;
> =20
> -	/* If there isn't a request waiting, something went wrong */
>  	req =3D list_entry(ep->queue.next, struct lpc32xx_request, queue);
> =20
>  	done(ep, req, 0);
> @@ -1985,6 +1991,23 @@ static void udc_handle_dma_ep(struct lpc32xx_udc *=
udc, struct lpc32xx_ep *ep)
>  	ep->totalints++;
>  #endif
> =20
> +	/* The request may have been dequeued; still clear the pending interrup=
ts. */
> +	if (list_empty(&ep->queue)) {
> +		u32 mask =3D 1U << ep->hwep_num;
> +
> +		ep->req_pending =3D 0;
> +
> +		/* Disable DMA and clear pending interrupts */
> +		udc_ep_dma_disable(udc, ep->hwep_num);
> +		writel(mask, USBD_EOTINTCLR(udc->udp_baseaddr));
> +		writel(mask, USBD_NDDRTINTCLR(udc->udp_baseaddr));
> +
> +		if (readl(USBD_SYSERRTINTST(udc->udp_baseaddr)) & mask)
> +			writel(mask, USBD_SYSERRTINTCLR(udc->udp_baseaddr));
> +
> +		return;
> +	}
> +
>  	req =3D list_entry(ep->queue.next, struct lpc32xx_request, queue);
>  	dd =3D req->dd_desc_ptr;

[Severity: High]
What happens if ep->queue is not empty when the pending interrupt from the
dequeued request fires=E2=80=94for example, because a second request was al=
ready
queued behind it, or the completion callback queued a new request while
done() dropped udc->lock for usb_gadget_giveback_request()?

Because lpc32xx_ep_dequeue() simply calls done(ep, req, -ECONNRESET)
without stopping DMA or clearing the endpoint and DMA interrupts before
unmapping the buffer and freeing req->dd_desc_ptr, list_empty(&ep->queue)
will be false and the stale interrupt from the dequeued request will be
attributed to the new head request: udc_handle_eps() will send the
dequeued request's deferred ZLP and prematurely complete the new request,
while udc_handle_dma_ep() will see an unretired dd_desc_ptr on the new
request and abort it with -ECONNABORTED.

Dequeueing an in-flight head request in lpc32xx_ep_dequeue() before DMA
completes also unmaps its buffer and frees req->dd_desc_ptr while DMA is
still active on udc->udca_v_base[ep->hwep_num], and leaves any remaining
requests in ep->queue stalled with ep->req_pending =3D 0.  Should
lpc32xx_ep_dequeue() disable DMA, clear the pending interrupts and start
the next request when removing the head of ep->queue?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121151233.8230=
6-1-fangxy@xiaopeng.com?part=3D1
