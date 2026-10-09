Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB9F48EC71
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 15:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791560062; cv=none; b=qCQNg0pqaSEZUFfvGaIKmS2TX570oAFjbUlpIcVEfVEyyE5Mr0rqtMVXhlWXpt0hiQlTQNTponC2G9wH+1owbug+3DSAbo3A3hc+8pBkE8AIz2x7Hm51AYwe9fY6t5xMkvIoWdEP7s3nP8m5rr1jR8o1idPiku0Kj6CD1uppZTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791560062; c=relaxed/simple;
	bh=6I9zw+cMsax1xTBqKHhi9V7NQmxk2uK2YcEhyBqGih0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=aEGuR7+D78OfVqiQk3n2Hx5rjT/HXc6bGZ8OBmkCmS+4a72TDihoXU8ktucUo/iC6QzvM9JAvA3g8JhM/YjS4FNanUzrHFTusB6uKBAmpYntgFL3nz11wL7xYIGU3p4MFqHy3c5xwnP3UylwhygDloJkOYRpEC9j82NdYKW1tQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MDIRDpmr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MDIRDpmr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B3F41F000FF;
	Fri,  9 Oct 2026 15:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791560060;
	bh=b3ajIY/VlXaRnnq+tcvfOw40RFRVI54w2KK5zBNs5JY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MDIRDpmrVwK5xlgDQcQzEOUqfgRiR+BNPF1PG7b1QCe9uSMDqJIABw1o8M6gAfUHE
	 +TTzRzgiHI0/GdGs68tJcr/YemQBUQrupuV7Yd18e9iDKkZfwEnham8guO35TH8Ci0
	 peXyB1LAtT9hSfYmEzyKjk4dcshq8Udt/DJ8zuRIJFnyuNEO47w/oWiIoRvMv8cYB+
	 5ACws2tW9AvX9VHHyAYgTepnyagvM4xeF7uUP5H1QVNv9oqL53xMf4YjD5Cgqb2sqy
	 Z9DZ5RTSNj95O0ii1w1eWZQjsMqQQDFIKdMfsmFsEp/Gld5fu/0einey1y3GaWqaTo
	 U29VFgqOjjQdw==
Message-ID: <sashiko-outbox-165778@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/11] usb: xhci: Rework and improve the TD matching
 and skipping logic
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261009151624.618967-10-mathias.nyman@linux.intel.com>
References: <20261009151624.618967-1-mathias.nyman@linux.intel.com>
 <20261009151624.618967-10-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 15:34:20 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usb: xhci: handle_tx_event() halts >1.0 hosts on bogus MSE pointers
--

commit cc3554d902e447131e844c7826abc9b1b4f75f82
Author: Michal Pecio <michal.pecio@gmail.com>

    usb: xhci: Rework and improve the TD matching and skipping logic
   =20
    Matching events with TDs and giving back missed TDs is carried out
    by a complicated loop. Replace it with a simpler linear logic:
   =20
    0. Having verified that 'td_list' isn't empty,
    1. Scan it to find the matching TD and count missed TDs,
    2. Perform necessary adjustments for corner cases,
    3. Give back missed TDs, if applicable, using a short and tidy loop,
    4. Check if the event refers to the expected TD and proceed as usual.

> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 7597ef8105c65..243b1fd2b2f68 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
[ ... ]
> @@ -2858,66 +2861,50 @@ static int handle_tx_event(struct xhci_hcd *xhci,
[ ... ]
> +	td =3D find_td_by_dma(ep_ring, &missed_tds, ep_trb_dma);
> =20
> -			xhci_dbg(xhci,
> -				 "Found td. Clear skip flag for slot %u ep %u.\n",
> -				 slot_id, ep_index);
> +	if (ep->skip) {
> +		if (!td) {
> +			/*
> +			 * xHCI 1.0 allowed MSE events to have zero TRB pointers. Some old ch=
ips
> +			 * also generate bogus non-zero pointers. We know, don't bother warni=
ng.
> +			 * Missed TDs will be given back by the next event with a valid point=
er.
> +			 */
> +			if (trb_comp_code =3D=3D COMP_MISSED_SERVICE_ERROR &&
> +			    xhci->hci_version <=3D 0x100)
> +				return 0;

[Severity: High]
Does this code inadvertently halt hosts > 1.0 on bogus MSE pointers?

By restricting the leniency for bogus Missed Service Error (MSE) pointers
strictly to xHCI 1.0, controllers > 1.0 that generate a bogus pointer for M=
SE
will fall through and hit the "HC is busted" block below.

[ ... ]
>  	/* Handle events not referencing the current TD */
> -	if (!trb_in_td(td, ep_trb_dma)) {
> +	if (!td || missed_tds) {
>  		/* TD was queued after xrun, maybe xrun was on a link, don't panic yet=
 */
>  		if (ring_xrun_event)
>  			return 0;
[ ... ]
>  		/* HC is busted, give up! */
> -		goto debug_finding_td;
> +		td =3D list_first_entry(&ep_ring->td_list, struct xhci_td, td_list);
> +		xhci_err(xhci, "Event dma %pad for ep %d comp_code %u not part of TD a=
t %016llx - %016llx, missed %d\n",
> +				&ep_trb_dma, ep_index, trb_comp_code,
> +				(u64)xhci_trb_virt_to_dma(td->start_seg, td->start_trb),
> +				(u64)xhci_trb_virt_to_dma(td->end_seg, td->end_trb),
> +				missed_tds);
> +		return -ESHUTDOWN;
>  	}

[Severity: High]
Will falling through to this block cause the host controller to fatally shut
down (-ESHUTDOWN) when a bogus MSE pointer is received on >=3D 1.1 hardware?

Isochronous transfers frequently experience MSEs under load, and some USB
firmware is known to issue bogus TRB pointers. Before this patch, the driver
unconditionally and gracefully ignored MSE events with unrecognized pointer=
s,
letting the next event sort it out.

The commit message mentions a goal to log a scary error message for future
TDs when the skip flag is clear, but does not justify intentionally panicki=
ng
>=3D 1.1 controllers for this quirk.

Could the commit message clarify if punishing >=3D 1.1 chips with a fatal h=
ost
shutdown for a non-fatal, recoverable event was intended?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009151624.6189=
67-1-mathias.nyman@linux.intel.com?part=3D9
