Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7462BCF46
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 17:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791308499; cv=none; b=jNl+K4V5tDWAx1oCyZoQjX048kX1s5vCPbutr78jDS3GmFRRx6zYfuQAhMsiAZh/zqlQr8DKHtxKPTOUR6NGEHNDOOFJmVhPPP58/B0F8mwrwq8Ye4lQ2z/yi2MT5w5KVUtnlrvJHuln36QfJlBQ4uXYMPHb87bJx37QuhgeW7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791308499; c=relaxed/simple;
	bh=f8d4WLQwP3xW/apjzbJeyhQIJKAFxD5JnRP5KTPz//c=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=If/7+lmaSNv9VCaKK7jsEUxJZSGK4/bezbnqb/b6wZNm9cK0a73CNj6jAOdqmeaVuW7Uul035+uBea+gcY/MGZD5utlSF4EzRLC7HouSMC7+kdtGOYZqtmhORx8P5Qf5GD9EID17GGTXlj4PrNAIGUo/T/a/reKrQIQpDSYRi1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iJ9+GjuV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iJ9+GjuV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F521F0089B;
	Tue,  6 Oct 2026 17:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791308497;
	bh=SWs41ikoFdoN8+KRsGUfoilMThwJCzQ5kwRE0A1w0vc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iJ9+GjuVIkmskqCIE8dVjQlUa52a9Jt8CNHX5bj2HPLHyt3ETb+Zzjwld5yOsl2wG
	 MMlQSvlykjPdX3aZ8slMMqi1ld2vlF0hz9REcd2l5xDcAlNfapbypvcjkJ7InTCSPV
	 cX38LTGoMoHica2rdfQerZkMARXRLCEn2JBe4EhooC0vhX2/1QBoB/Kx5Tr/Isqazq
	 T3cYRBfG+MAeRnAr4ynNQF9CpDp1vQPgrGnN7NNET4yk2naQy2dbElG90Zp+RHlH+u
	 ZpMgbKCTj28QDDEiupXCMDbgBY5P4Yk4acYEAJ2CbLBAnwnhQzftxZ7vjL0+bTmX6r
	 r8q/mi3CC07fg==
Message-ID: <sashiko-outbox-162302@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: dwc3: gadget: linearize SG requests that exceed
 the TRB cache
Reply-To: sashiko-reviews@lists.linux.dev
To: "Faisal Hassan" <faisal.hassan@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261006172254.1058992-1-faisal.hassan@oss.qualcomm.com>
References: <20261004031445.1450196-1-faisal.hassan@oss.qualcomm.com>
 <20261006172254.1058992-1-faisal.hassan@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 17:41:36 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] usb: dwc3: UAF and memory leak on ISOC transfer start failure
- [High] usb: dwc3: gadget: DMA mapping leak for requests without TRBs
- [High] usb: dwc3: Double DMA mapping leak in dwc3_prepare_trbs() on TRB e=
xhaustion
--

commit 4e03749f5dcd711bf2541cb720afd9cd91d48fb2
Author: Faisal Hassan <faisal.hassan@oss.qualcomm.com>

usb: dwc3: gadget: linearize SG requests that exceed the TRB cache

The controller prefetches the TRBs of a transfer into an internal cache
that holds DWC_USB3_CACHE_TRBS_PER_TRANSFER entries. Databook 4.2.3.3
requires that the number of chained TRBs needed to construct a single
packet never exceeds (DWC_USB3_CACHE_TRBS_PER_TRANSFER - 1). This patch
walks the scatter-gather list and linearizes requests when a packet
would exceed the budget.

Link: https://lore.kernel.org/all/20261004031445.1450196-1-faisal.hassan@os=
s.qualcomm.com/

> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index f245e66cd13d0..7417d3c32dbf2 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
[ ... ]
> @@ -202,10 +218,16 @@ static void dwc3_gadget_del_and_unmap_request(struc=
t dwc3_ep *dep,
>  	if (req->request.status =3D=3D -EINPROGRESS)
>  		req->request.status =3D status;
> =20
> -	if (req->trb)
> +	/*
> +	 * A linearized request may have been mapped without getting a TRB, so
> +	 * unmap it before its buffer is freed.
> +	 */
> +	if (req->trb || req->sg_trb_cache_bounced)
>  		usb_gadget_unmap_request_by_dev(dwc->sysdev,
>  				&req->request, req->direction);
> =20

[Severity: High]
This condition incorrectly relies on req->trb to determine if a non-bounced
request was mapped. Will this bypass unmapping for requests that were
mapped but failed to acquire a TRB?

In dwc3_prepare_trbs(), requests in the pending_list are unconditionally
mapped prior to TRB allocation:

drivers/usb/dwc3/gadget.c:dwc3_prepare_trbs() {
	...
	list_for_each_entry_safe(req, n, &dep->pending_list, list) {
		ret =3D usb_gadget_map_request_by_dev(dwc->sysdev, &req->request,
						    dep->direction);
		if (ret)
			return ret;
		...
		if (!ret || !dwc3_calc_trbs_left(dep))
			return ret;
}

If dwc3_calc_trbs_left() indicates insufficient TRBs, the function returns
early. The mapped request remains on pending_list with req->trb =3D=3D NULL.

If the request is dequeued (canceled) in this state, it bypasses the unmapp=
ing
logic here, leaking the mapping.

Furthermore, every time a single TRB completes, dwc3_prepare_trbs() is
triggered again. It iterates over the same request on pending_list and
maps it again, overwriting the req->dma pointer and leaking the previous
mapping, because usb_gadget_map_request_by_dev() lacks checks for
preexisting mappings (like req->dma_mapped).

[ ... ]
> @@ -1985,6 +2111,7 @@ static int __dwc3_gadget_start_isoc(struct dwc3_ep =
*dep)
>  static int __dwc3_gadget_ep_queue(struct dwc3_ep *dep, struct dwc3_reque=
st *req)
>  {
>  	struct dwc3		*dwc =3D dep->dwc;
> +	int			ret;
> =20
>  	if (!dep->endpoint.desc || !dwc->pullups_connected || !dwc->connected) {
>  		dev_dbg(dwc->dev, "%s: can't queue to disabled endpoint\n",
> @@ -2001,6 +2128,10 @@ static int __dwc3_gadget_ep_queue(struct dwc3_ep *=
dep, struct dwc3_request *req)
>  				dep->name, &req->request))
>  		return -EINVAL;
> =20
> +	ret =3D dwc3_gadget_linearize_sg_request(dep, req);
> +	if (ret)
> +		return ret;
> +
>  	pm_runtime_get(dwc->dev);
> =20
>  	req->request.actual	=3D 0;
>  	req->request.status	=3D -EINPROGRESS;
> =20
>  	trace_dwc3_ep_queue(req);
> =20
>  	list_add_tail(&req->list, &dep->pending_list);
>  	req->status =3D DWC3_REQUEST_STATUS_QUEUED;
> =20
>  	if (dep->flags & DWC3_EP_WAIT_TRANSFER_COMPLETE)
>  		return 0;
> =20
>  	/*
>  	 * Start the transfer only after the END_TRANSFER is completed
>  	 * and endpoint STALL is cleared.
>  	 */
>  	if ((dep->flags & DWC3_EP_END_TRANSFER_PENDING) ||
>  	    (dep->flags & DWC3_EP_WEDGE) ||
>  	    (dep->flags & DWC3_EP_DELAY_STOP) ||
>  	    (dep->flags & DWC3_EP_STALL)) {
>  		dep->flags |=3D DWC3_EP_DELAY_START;
>  		return 0;
>  	}
> =20
>  	/*
>  	 * NOTICE: Isochronous endpoints should NEVER be prestarted. We must
>  	 * wait for a XferNotReady event so we will know what's the current
>  	 * (micro-)frame number.
>  	 *
>  	 * Without this trick, we are very, very likely gonna get Bus Expiry
>  	 * errors which will force us issue EndTransfer command.
>  	 */
>  	if (usb_endpoint_xfer_isoc(dep->endpoint.desc)) {
>  		if (!(dep->flags & DWC3_EP_TRANSFER_STARTED)) {
>  			if ((dep->flags & DWC3_EP_PENDING_REQUEST))
>  				return __dwc3_gadget_start_isoc(dep);

[Severity: High]
If __dwc3_gadget_start_isoc() fails here (for example, if
usb_gadget_map_request_by_dev() fails in dwc3_prepare_trbs()), the error co=
de
is returned directly from __dwc3_gadget_ep_queue().

Since the request was already appended to dep->pending_list, the error
propagates back to the gadget driver, which assumes the request was not que=
ued
and frees it. Will this lead to a Use-After-Free list corruption the next t=
ime
DWC3 processes pending_list?

Additionally, does this leak the newly allocated sg_trb_cache_buf bounce bu=
ffer
and the PM usage count because dwc3_gadget_restore_sg_trb_cache_buf() and
pm_runtime_put() are skipped when returning the error directly?

> =20
>  			return 0;
>  		}
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006172254.1058=
992-1-faisal.hassan@oss.qualcomm.com?part=3D1
