Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BF15008D6
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 14:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419628; cv=none; b=mCnmib8GcyoiS4IVZ2wKT/JKGYVD6A+qQc8+tn1skQlQubq5iXU5/qO89BGf+QT48ufpfXa7wYUul5qKh0lgj1zLfPlh9llX9Q/ldltGChXFnT/avV4wwoPX4GHz+Ia6/HnajX+J1LmwCYRILM/umq2VIbFmB3BC/Gcq5rhcxSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419628; c=relaxed/simple;
	bh=D7Hjo+4rizoShfcnA+09HSepPC9pZW4IREH0Ti6nCqo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Yc1pT2SBfMc+Dm+pDuDoAcJd2hzDkCBmjQz53t9kxqyMb5PrV2OyX+RZ1TcT28BKNp0Pc+NkwCmi/Nd9EP8sms/xD+GQwDCBc9NIsQN0TQ9/QVq62WypBaPUhIxQ/T15M5M50trX6cJ4oBZMmFnuV/hJYxGBo4DNovhkYrfuYCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ha9S3tjz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ha9S3tjz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C20B1F000C4;
	Mon, 19 Oct 2026 14:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792419626;
	bh=cLIuw83jqgUpeHC2PVt0ymabxUpE///szIMjrCqMLrg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ha9S3tjz8Mum0/DDzL3hLfRSTv4TetjSxEl847JDe2srZKncAD7/x2GW1SyFqT5qh
	 XqeiEC8SnfT35j6F3GTVKhGsiYIhXlQvlYzxa6W5lSwsotyNVgXmaF2A1501KXl1tI
	 Fr4UpZsqQ7is3GazJDXVVvibnKrf6wmxzAxD+eKLQSc5zqHeYzHyvltIb+Evb0myDK
	 AP/lB1Lzoj7X4HVjdet3Ja1x2+a2vQRTWFAf/vxpOxkYD31SJoP4yMTnPY0xzJg8BF
	 ZP2cVxmJdNAyTcucraLIhvBSt2TPgYtCoNUNxzYttpeJFIeXynNxlnK/4IsSxT3fIa
	 2ltFlc7fskJLw==
Message-ID: <sashiko-outbox-177351@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18-5.10] usb: fsl_qe_udc: check
 qe_alloc_request() failure in ch9getstatus()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261019135441.1420968-95-sashal@kernel.org>
References: <20261019135441.1420968-1-sashal@kernel.org>
 <20261019135441.1420968-95-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 14:20:26 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] usb: fsl_qe_udc: sleeping allocation in atomic context in ch9getst=
atus()
- [Medium] usb: fsl_qe_udc: memory leak in ch9getstatus() when __qe_ep_queu=
e() fails
--

commit 130ef9b6cbb58e7a139f83239ccf232ff79a3793
Author: Haoxiang Li <haoxiang_li2024@163.com>

usb: fsl_qe_udc: check qe_alloc_request() failure in ch9getstatus()

This commit adds a NULL check for the return value of qe_alloc_request()
in ch9getstatus() before passing it to container_of() and dereferencing
it, stalling the endpoint on allocation failure.

Link: https://patch.msgid.link/20260620120631.2894977-1-haoxiang_li2024@163=
.com

> diff --git a/drivers/usb/gadget/udc/fsl_qe_udc.c b/drivers/usb/gadget/udc=
/fsl_qe_udc.c
> index aacfde06387c0..7911dca2135cf 100644
> --- a/drivers/usb/gadget/udc/fsl_qe_udc.c
> +++ b/drivers/usb/gadget/udc/fsl_qe_udc.c
> @@ -1945,6 +1945,7 @@ static void ch9getstatus(struct qe_udc *udc, u8 req=
uest_type, u16 value,
>  			u16 index, u16 length)
>  {
>  	u16 usb_status =3D 0;
> +	struct usb_request *usb_req;
>  	struct qe_req *req;
>  	struct qe_ep *ep;
>  	int status =3D 0;
> @@ -1983,8 +1984,11 @@ static void ch9getstatus(struct qe_udc *udc, u8 re=
quest_type, u16 value,
>  		}
>  	}
> =20
> -	req =3D container_of(qe_alloc_request(&ep->ep, GFP_KERNEL),
> -					struct qe_req, req);
> +	usb_req =3D qe_alloc_request(&ep->ep, GFP_KERNEL);

[Severity: High]
Should this allocation in ch9getstatus() use GFP_ATOMIC instead of
GFP_KERNEL?

When a USB_REQ_GET_STATUS control request is received, ch9getstatus() is
called from the hardware interrupt handler while holding udc->lock with
interrupts disabled:

  qe_udc_irq()
    spin_lock_irqsave(&udc->lock, flags)
    rx_irq()
      qe_ep0_rx()
        ep0_setup_handle()
          setup_received_handle()
            ch9getstatus()
              qe_alloc_request(&ep->ep, GFP_KERNEL)
                kzalloc(sizeof(*req), gfp_flags)

Passing GFP_KERNEL here allows kzalloc() to sleep in atomic context.

> +	if (!usb_req)
> +		goto stall;
> +
> +	req =3D container_of(usb_req, struct qe_req, req);
>  	req->req.length =3D 2;
>  	req->req.buf =3D udc->statusbuf;
>  	*(u16 *)req->req.buf =3D cpu_to_le16(usb_status);

[Severity: Medium]
Can this path in ch9getstatus() also leak req if __qe_ep_queue() fails?

Just below this hunk, ch9getstatus() queues the allocated request:

drivers/usb/gadget/udc/fsl_qe_udc.c:ch9getstatus() {
	...
	status =3D __qe_ep_queue(&ep->ep, &req->req);

	if (status =3D=3D 0)
		return;
stall:
	dev_err(udc->dev, "Can't respond to getstatus request \n");
	qe_ep0_stall(udc);
}

In __qe_ep_queue(), if !udc->driver or udc->gadget.speed =3D=3D USB_SPEED_U=
NKNOWN,
it returns -ESHUTDOWN before adding req->queue to ep->queue, so
ownercomplete() will never be called to free req:

drivers/usb/gadget/udc/fsl_qe_udc.c:__qe_ep_queue() {
	...
	if (!udc->driver || udc->gadget.speed =3D=3D USB_SPEED_UNKNOWN)
		return -ESHUTDOWN;
	...
}

When __qe_ep_queue() returns a non-zero status, ch9getstatus() falls
through to stall: without calling qe_free_request(&ep->ep, usb_req) or
kfree(req).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019135441.1420=
968-95-sashal@kernel.org?part=3D1
