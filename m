Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792545185;
	b=MlwTr9LCZS2MidZaX09ser1dESBomdZCjR986j34E8L1bcIkHKGxHt1AjgQpzIHpxfyU
	 PS1W4o5pIAdP1bpF86N1EBnMnW/JYUoUpN1j1HoK8AEM3u+I+HwiYmkBALcbRsnv5tSRH
	 iCDrncOSEWiN3zz5OeoWWcTVdhYb5ww93iVDaSjL9BZ1Hy6cqHTida0gbqbF9wMmSUfGk
	 ScoLGJbMimFQUiqzLtb1Qij1Os6c4oY46KKA+KWV2SLWUc5B+ShfSZ/KdtL1dp7O5Yfrt
	 Tg7o7LPEU2chod5Z3g3TcpPgC1JKGBY86EwmD+i7Y0GHM5qbeFt48mLQnWSD/c1SYOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792545185;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=igQ0CA+we1N/sd5mw/ydZoQhIlnnTmEDNNgvACWkOTc=;
	b=VyS0Eq+rKrDZEs74SxKp5rtzhpqbKD6Ue1R87FbJCr+P0iX93VO5z0RlV20SxVwWvN8z
	 NdpZT5QzLxUiMK47MeUJYucemL6gVecMwD8nzm/+V/CqhQLs4twfHDr3o4fIshBeRNJaH
	 7ddSMJsDHo/iWau6WJqr5Gmt3CqbIIMIzpm4FCOVjLEMzL9EZCDUBz/+mO7URzUd7htwQ
	 nWeQ3fbHmVz9PR9qfufN4Mc3KL7Gn0NRKe1gTGTBU7FdETmTyvx4kpUzxY6R0D908S7Hz
	 hovY4gvoRH6cv6YdqJaXTL64dH3upkNmrAeu/WUc4IX6ce30PWjHzhUTmUr2YfkY1dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="YOfRd0/p";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC105606A319
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 01:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YOfRd0/p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 160591F000C9;
	Wed, 21 Oct 2026 01:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792545184;
	bh=igQ0CA+we1N/sd5mw/ydZoQhIlnnTmEDNNgvACWkOTc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YOfRd0/pxmTlaJ1t3e7vFt2TxqcAcaNst2qAitef2E4mGYOYumrZlzI+LboUFuKBP
	 GE+j/HTFhr+1cPabL25HnA1CezLzY0Cxm43TyuHPa5kwH5o4yrnJoOKNq6QlfDgwUm
	 XNM9Y1MQGOJCUI55OWa3vB9Y57HttY7HBVHbF0PH0zMcGpz9tQXYyApHozt+yiEysy
	 jIqXgBeCz6oRAf0vpuO8tO3sk5F9ty5GFtlD/wTdzYEPSDu/bvhN4taxC1NkKz0Eou
	 VwI0nTYkp8semZpLSqkC3DIzdCWrpHsCzNKDHRv74RpXCxJbQcziNuZKIHsEGYTGod
	 KQlL/jMxmd3tg==
Message-ID: <sashiko-outbox-179665@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/7] usb: dwc3: gadget: Wait for End Transfer completion
 on ep disable
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thinh Nguyen" <Thinh.Nguyen@synopsys.com>
Cc: =?utf-8?b?bGludXgtdXNiQHZnZXIua2VybmVsLm9yZw==?= <linux-usb@vger.kernel.org>
In-Reply-To: <24fa8adeb0222dab415c8c2799405188440bad4b.1792542945.git.Thinh.Nguyen@synopsys.com>
References: <cover.1792542945.git.Thinh.Nguyen@synopsys.com>
 <24fa8adeb0222dab415c8c2799405188440bad4b.1792542945.git.Thinh.Nguyen@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 01:13:03 +0000
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
- [High] usb: dwc3: gadget: missing DWC3_EP_FORCE_RESTART_STREAM on deferre=
d noop start
- [Medium] usb: dwc3: gadget: broken NoStream handling on deferred stream e=
p enable
--

commit bcb5a08575e576634a58cb654feac5c3da3a21ed
Author: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

usb: dwc3: gadget: Wait for End Transfer completion on ep disable

This commit issues the End Transfer command with an interrupt when disabling
an endpoint and keeps DWC3_EP_END_TRANSFER_PENDING and
DWC3_EP_TRANSFER_STARTED set until the command completes. It also defers the
no-op Start Transfer for a re-enabled stream endpoint until the End Transfer
command completion interrupt is processed.

> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index e68584f20fbde..e531adc02a401 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -1020,9 +1020,14 @@ static int __dwc3_gadget_ep_enable(struct dwc3_ep =
*dep, unsigned int action)
>  	 * Response Update Transfer command.
>  	 */
>  	if (dep->stream_capable) {
> -		ret =3D dwc3_gadget_ep_start_noop_transfer(dep);
> -		if (ret < 0)
> -			return ret;
> +		if (dep->flags & (DWC3_EP_END_TRANSFER_PENDING |
> +				  DWC3_EP_DELAY_STOP)) {
> +			dep->flags |=3D DWC3_EP_PENDING_NOOP_START;
> +		} else {
> +			ret =3D dwc3_gadget_ep_start_noop_transfer(dep);
> +			if (ret < 0)
> +				return ret;
> +		}
>  	}

[Severity: High]
Can deferring dwc3_gadget_ep_start_noop_transfer() here leave
DWC3_EP_FORCE_RESTART_STREAM unset when a request is queued before the End
Transfer command completes?

In drivers/usb/dwc3/gadget.c, __dwc3_gadget_ep_disable() clears
DWC3_EP_FORCE_RESTART_STREAM when masking dep->flags, while keeping
DWC3_EP_END_TRANSFER_PENDING (or DWC3_EP_DELAY_STOP) and
DWC3_EP_TRANSFER_STARTED set.

When the function driver re-enables a stream-capable endpoint in
__dwc3_gadget_ep_enable() before DWC3_DEPEVT_EPCMDCMPLT is processed,
DWC3_EP_PENDING_NOOP_START is set instead of calling
dwc3_gadget_ep_start_noop_transfer(). However,
dwc3_gadget_ep_start_noop_transfer() is the only place that sets
DWC3_EP_FORCE_RESTART_STREAM:

	if (!dep->direction ||
	    !(dwc->hwparams.hwparams9 & DWC3_GHWPARAMS9_DEV_TXF_FLUSH_BYPASS))
		dep->flags |=3D DWC3_EP_FORCE_RESTART_STREAM;

If the function driver then queues a request via __dwc3_gadget_ep_queue()
before the End Transfer command completes, __dwc3_gadget_ep_queue() sees
DWC3_EP_END_TRANSFER_PENDING or DWC3_EP_DELAY_STOP and sets
DWC3_EP_DELAY_START.

When dwc3_gadget_endpoint_command_complete() later runs, it skips
dwc3_gadget_ep_start_noop_transfer() because DWC3_EP_DELAY_START is set, and
calls __dwc3_gadget_kick_transfer() directly. That leaves
DWC3_EP_FORCE_RESTART_STREAM unset on the endpoint, so
dwc3_gadget_endpoint_stream_event() will not schedule dep->nostream_work on
subsequent DEPEVT_STREAM_NOSTREAM events:

	case DEPEVT_STREAM_NOSTREAM:
		dep->flags &=3D ~DWC3_EP_STREAM_PRIMED;
		if (dep->flags & DWC3_EP_FORCE_RESTART_STREAM)
			queue_delayed_work(system_percpu_wq, &dep->nostream_work,
					   msecs_to_jiffies(100));
		break;

In addition, if that queued request is dequeued from dep->pending_list via
dwc3_gadget_ep_dequeue() before the End Transfer completes,
DWC3_EP_DELAY_START remains set while dep->pending_list is empty, so both
dwc3_gadget_ep_start_noop_transfer() and DWC3_DEPCMD_STARTTRANSFER in
__dwc3_gadget_kick_transfer() will be skipped.

[ ... ]

> @@ -1089,7 +1099,7 @@ static int __dwc3_gadget_ep_disable(struct dwc3_ep =
*dep)
> =20
>  	dep->flags &=3D ~DWC3_EP_ENABLED;
> =20
> -	dwc3_remove_requests(dwc, dep, -ESHUTDOWN);
> +	dwc3_remove_requests(dwc, dep, -ESHUTDOWN, true);
> =20
>  	dep->stream_capable =3D false;
>  	dep->type =3D 0;
> @@ -1101,6 +1111,15 @@ static int __dwc3_gadget_ep_disable(struct dwc3_ep=
 *dep)
>  	 */
>  	if (dep->flags & DWC3_EP_DELAY_STOP)
>  		mask |=3D (DWC3_EP_DELAY_STOP | DWC3_EP_TRANSFER_STARTED);
> +
> +	/*
> +	 * The End Transfer command is still in progress.  Do not clear the
> +	 * flags, so that the ep is only rearmed once the command completes.
> +	 */
> +	if (dep->flags & DWC3_EP_END_TRANSFER_PENDING)
> +		mask |=3D (DWC3_EP_END_TRANSFER_PENDING |
> +			 DWC3_EP_TRANSFER_STARTED);
> +
>  	dep->flags &=3D mask;
> =20
>  	/* Clear out the ep descriptors for non-ep0 */

[ ... ]

> @@ -3901,7 +3920,16 @@ static void dwc3_gadget_endpoint_command_complete(=
struct dwc3_ep *dep,
>  			dwc3_ep0_send_delayed_status(dwc);
>  	}
> =20
> +	if (dep->flags & DWC3_EP_PENDING_NOOP_START) {
> +		dep->flags &=3D ~DWC3_EP_PENDING_NOOP_START;
> +
> +		if (!(dep->flags & DWC3_EP_DELAY_START) &&
> +		    (dep->flags & DWC3_EP_ENABLED))
> +			dwc3_gadget_ep_start_noop_transfer(dep);
> +	}
> +
>  	if ((dep->flags & DWC3_EP_DELAY_START) &&
> +	    (dep->flags & DWC3_EP_ENABLED) &&
>  	    !usb_endpoint_xfer_isoc(dep->endpoint.desc))
>  		__dwc3_gadget_kick_transfer(dep);
> =20

[Severity: Medium]
What happens to NoStream handling in dwc3_gadget_endpoint_command_complete()
when an endpoint is disabled, re-enabled as stream-capable, and has a reque=
st
queued before the End Transfer command from __dwc3_gadget_ep_disable()
completes?

In drivers/usb/dwc3/gadget.c, when __dwc3_gadget_ep_disable() calls
dwc3_remove_requests(dwc, dep, -ESHUTDOWN, true), the End Transfer command =
is
issued for the prior transfer while DWC3_EP_END_TRANSFER_PENDING remains se=
t.
If __dwc3_gadget_ep_enable() re-enables the endpoint for streams before
DWC3_DEPEVT_EPCMDCMPLT is processed, dwc3_gadget_set_ep_config() sets
dep->stream_capable =3D true and __dwc3_gadget_ep_enable() sets
DWC3_EP_PENDING_NOOP_START.

When the End Transfer from __dwc3_gadget_ep_disable() completes in
dwc3_gadget_endpoint_command_complete(), dep->stream_capable is already tru=
e,
so it sets DWC3_EP_IGNORE_NEXT_NOSTREAM at the start of the handler:

	if (dep->stream_capable)
		dep->flags |=3D DWC3_EP_IGNORE_NEXT_NOSTREAM;

If a request was queued in the meantime (setting DWC3_EP_DELAY_START),
dwc3_gadget_endpoint_command_complete() skips
dwc3_gadget_ep_start_noop_transfer() (leaving DWC3_EP_FORCE_RESTART_STREAM
unset) and immediately starts the new stream transfer via
__dwc3_gadget_kick_transfer() with DWC3_EP_IGNORE_NEXT_NOSTREAM set.

Even if DWC3_EP_FORCE_RESTART_STREAM were set during
__dwc3_gadget_ep_enable(), wouldn't setting DWC3_EP_IGNORE_NEXT_NOSTREAM ri=
ght
before __dwc3_gadget_kick_transfer() starts the new transfer (with no pendi=
ng
synthetic NoStream event from a no-op End Transfer) cause dwc3_nostream_wor=
k()
to ignore the first real host NoStream rejection?

	if ((dep->flags & DWC3_EP_IGNORE_NEXT_NOSTREAM) ||
	    (!DWC3_MST_CAPABLE(&dwc->hwparams) &&
	     !(dep->flags & DWC3_EP_WAIT_TRANSFER_COMPLETE)))
		goto out;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1792542945.gi=
t.Thinh.Nguyen@synopsys.com?part=3D5
