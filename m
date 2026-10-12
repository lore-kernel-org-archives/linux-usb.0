Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31D73451AB
	for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 10:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799224; cv=none; b=Nb5UfgVno7Dxoe00lWunwcOJEBAQGr3W7pGuKdvSQBz5jksGaXt/3MUNO9+iIK13Smb+g4QiZvV9x2chrFd80ksOdm6kn9qiyXVjEpj8jxrX5pQXr4+Q2MF+BMsXnZEM+T3knKv5Q2iQqov+ooMIi/sJcHisp/Hyhn5xIBJZRLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799224; c=relaxed/simple;
	bh=tM1e0zB7/mlKAlww1w1TXw6GST+dc+tW70sonNcyaxA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=LAMC3Lx1Q1ZKKEpochZvwjP0tX7DyVSlZwyz+YFLma2x8gxOuKcq9VH06+24IqcJFr82Ug2fW94I71Lo0JWYjJSnOLFmxVP4o8PdfhYUi284sw7t3TCp3Wd18X5SUfBufX0H2NWmh+8pdz58NBpbxiGXq/GRJ174O0dn/bQl8Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m11aeynw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m11aeynw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA1161F0089B;
	Mon, 12 Oct 2026 10:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791799222;
	bh=5ocA2Z1JX3+J5xKQ8ZNvX3TAI/i4FpCU/hBekIsE/zc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m11aeynwngzyHBmREYJHTlA3pxEpGecydRS5MrLHYB8HZhslOJkXdP0bmkmj4W3+Y
	 PrRQvnqmAgMf7r3Eme0dmI1PU3iIjsrEEmOl4VUSOWhtvn9VhWoVizOFfpPwOOvvTw
	 UXIZj7918AVtQ3X7jXtBzzUd1BsGDYBXsiERok2qnuMkBR4HkFHZ5Zst0Po7ohgDBo
	 GOdYUF8Brs1Jno7zruyHLU4g8HiubvmDPGsx+/zOn8M1DmBk8eGdkPV1HLsie6JSMH
	 bE8I9frVucbfuBjFo1FF+FrcZCcom3AKPMwb2BJrYCpxpwx0Hy8cNJpR3lApqPowx4
	 jTFEKNU88ugzA==
Message-ID: <sashiko-outbox-167925@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH REPOST] usb: udc: Make tracing aware that
 usb_ep_alloc_request() can return NULL
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261012094911.wHPc_9lJ@linutronix.de>
References: <20261012094911.wHPc_9lJ@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 10:00:22 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usb: use-after-free in usb_ep_queue() and usb_ep_dequeue() tracepo=
ints
--

commit 1373e903abc2252ba5340f5231a6fb6306db9019
Author: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

usb: udc: Make tracing aware that usb_ep_alloc_request() can return NULL

This commit updates the udc_log_req trace event class to handle NULL
request pointers by checking the pointer before accessing its fields. This
prevents a NULL pointer dereference when usb_ep_alloc_request() fails and
returns NULL.

Link: https://lore.kernel.org/all/6aab0160.e91c2013.3bdb06.0005.GAE@google.=
com/

> diff --git a/drivers/usb/gadget/udc/trace.h b/drivers/usb/gadget/udc/trac=
e.h
> index fa3e6ddf0a128..05533eb1bae0c 100644
> --- a/drivers/usb/gadget/udc/trace.h
> +++ b/drivers/usb/gadget/udc/trace.h
> @@ -239,15 +239,15 @@ DECLARE_EVENT_CLASS(udc_log_req,
>  	),
>  	TP_fast_assign(
>  		__assign_str(name);
> -		__entry->length =3D req->length;
> -		__entry->actual =3D req->actual;
> -		__entry->num_sgs =3D req->num_sgs;
> -		__entry->num_mapped_sgs =3D req->num_mapped_sgs;
> -		__entry->stream_id =3D req->stream_id;
> -		__entry->no_interrupt =3D req->no_interrupt;
> -		__entry->zero =3D req->zero;
> -		__entry->short_not_ok =3D req->short_not_ok;
> -		__entry->status =3D req->status;
> +		__entry->length =3D req ? req->length : 0;
> +		__entry->actual =3D req ? req->actual : 0;

[Severity: High]
While this successfully avoids a dereference when req is NULL, does this
still leave a use-after-free when tracing usb_ep_queue() or
usb_ep_dequeue()?

If a gadget driver submits a request via usb_ep_queue(), the UDC driver can
complete it synchronously and return ownership to the gadget driver. For
instance, in dummy_queue():

    usb_gadget_giveback_request(_ep, _req);

If the gadget driver's completion handler then frees the request, control
eventually returns to usb_ep_queue() which invokes the tracepoint:

    ret =3D ep->ops->queue(ep, req, gfp_flags);
out:
    trace_usb_ep_queue(ep, req, ret);

Since trace_usb_ep_queue() shares this udc_log_req event class, won't req
point to freed memory, causing a use-after-free when evaluating
req->length? A similar scenario can occur in usb_ep_dequeue().

> +		__entry->num_sgs =3D req ? req->num_sgs : 0;
> +		__entry->num_mapped_sgs =3D req ? req->num_mapped_sgs : 0;
> +		__entry->stream_id =3D req ? req->stream_id : 0;
> +		__entry->no_interrupt =3D req ? req->no_interrupt : 0;
> +		__entry->zero =3D req ? req->zero : 0;
> +		__entry->short_not_ok =3D req ? req->short_not_ok : 0;
> +		__entry->status =3D req ? req->status : 0;
>  		__entry->ret =3D ret;
>  		__entry->req =3D req;
>  	),

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012094911.wHPc=
_9lJ@linutronix.de?part=3D1
