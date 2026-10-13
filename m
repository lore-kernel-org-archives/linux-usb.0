Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2C337E5EE
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 07:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791878174; cv=none; b=QTd41Xu44V6ZUV6WujW7y6cTJ59GrTUjxkUixs+rdinVnXgRKhAdoUDQ+XRWWbh+hVuv40GrtZdMTt+1z2vfIeLptedJAHLFuv5937v4+6d1tSfzaBcuSsqfMLCbp+EmMnKfUeXKjuztWMDjdewHTsaI171PODiyXAMIulBEr8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791878174; c=relaxed/simple;
	bh=vFu8/4VfxUYmbStKupe0Vafs2WVA5Ea4VJUjt/PYOnc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=dz/WEE4VBQlQV+kEYboJ5uvqr4ubQl8JZkE545Bvr0e+K37jn8lO8QomvL7P4rPU5CzGAQ/lEIwH4IDdda1vUUN8oQ4f47izgbeSNO8poVMk+XjG2Nt5N3CLDUrzBt75ZBixNkiRpFGqmsjoKtFecQjIqwBwsbtwRQpTtH2rS4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZMZVNPSy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZMZVNPSy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF43F1F000FF;
	Tue, 13 Oct 2026 07:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791878171;
	bh=nL7b2+qlBITaDBMwnpcdgoKk11s9CfIt2n0lO5ME3M0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZMZVNPSyPOmExeMo6minHm4lF3+3aJsbAz3DjA+iyF8POyzPQoRuXBCjo/Dlrz5+N
	 LqBofvOYpDhx8K6xsbJP5pkmK/jVXkueAyQhRQj7BnvlgN02Fb2Z/h9XHVqxLV4ou0
	 tT9ulC9P+BpjF7wWhEuvujT2Fdo6Etnbq2uLAyMODwqcvcenAnPoOIckS67vqSHM1L
	 DB5ON5ZOK3B+7fcg9EerGGPIWMO6nk6xAtMm8YMMn3GAdI39vptg/cs6vMV09jzlik
	 w1eEttniYRs++eWDPuklqS3jCFiDmBwMiDufmgD9YHXAxosxAxTpVi//lvkdKu23ft
	 7WAfCiKyhY/Yg==
Message-ID: <sashiko-outbox-169215@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] xhci: give back all TDs when skipping endpoint reset
 after disconnect
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yiyu Zhou" <yiyu@yiyuzhou.io>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261013073825.17962-1-yiyu@yiyuzhou.io>
References: <330c34fd-1d1c-44e8-b949-ad2f5fb51f00@linux.intel.com>
 <20261013073825.17962-1-yiyu@yiyuzhou.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 07:56:11 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] usb: xhci: memory leak of bounce buffer DMA mappings on cancelle=
d TDs
--

commit 5b2d9318e9ae6d6a16a3494c205c16c0cd1ca311
Author: Yiyu Zhou <yiyu@yiyuzhou.io>

xhci: give back all TDs when skipping endpoint reset after disconnect

This commit modifies xhci_handle_halted_endpoint() to immediately give back
all TDs on a halted endpoint if the port is disconnected or the link is
inactive. It calls xhci_kill_endpoint_urbs() to prevent pending URBs from
stalling until they time out.

Closes: https://lore.kernel.org/all/20261010071811.20483-1-yiyu@yiyuzhou.io/

> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index ec278a9f95404..2463d57ff705c 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
[ ... ]
> @@ -991,10 +992,17 @@ static int xhci_handle_halted_endpoint(struct xhci_=
hcd *xhci,
>  	/*
>  	 * Avoid resetting endpoint if link is inactive or device disonnected.
>  	 * Can cause host hang.
> -	 * Device will be reset to recover an inactive link, so don't do anythi=
ng
> +	 * The endpoint won't restart before the device is reset or the endpoint
> +	 * dropped, so give back all its TDs now instead of letting them time o=
ut.
>  	 */
>  	if (rhub_port->link_inactive || !rhub_port->connected) {
> +		xhci_dbg(xhci, "Not resetting ep %u slot %u after disconnect or link e=
rror\n",
> +			 ep->ep_index, slot_id);
>  		ep->ep_state |=3D EP_DROP_PENDING;
> +		if (td)
> +			xhci_td_cleanup(xhci, td, xhci_urb_to_transfer_ring(xhci, td->urb),
> +					td->status ?: -EPROTO);
> +		xhci_kill_endpoint_urbs(xhci, slot_id, ep->ep_index);

[Severity: Medium]
Can this newly added call to xhci_kill_endpoint_urbs() leak bounce buffer
DMA mappings?

When xhci_kill_endpoint_urbs() iterates over ep->cancelled_td_list, it calls
xhci_giveback_urb_in_irq() without unmapping bounce buffers:

drivers/usb/host/xhci-ring.c:xhci_kill_endpoint_urbs() {
    ...
	list_for_each_entry_safe(cur_td, tmp, &ep->cancelled_td_list,
			cancelled_td_list) {
		list_del_init(&cur_td->cancelled_td_list);
		inc_td_cnt(cur_td->urb);

		if (last_td_in_urb(cur_td))
			xhci_giveback_urb_in_irq(xhci, cur_td, -ESHUTDOWN);
	}
}

TDs that were unlinked by xhci_invalidate_cancelled_tds() are removed from
ring->td_list but remain on ep->cancelled_td_list. If the device disconnects
before they are processed by xhci_giveback_invalidated_tds(), this new call
to xhci_kill_endpoint_urbs() will process them.

Since xhci_kill_ring_urbs() only checks ring->td_list, and this second loop
in xhci_kill_endpoint_urbs() omits the call to xhci_unmap_td_bounce_buffer(=
),
it seems their bounce buffer DMA mappings will be leaked during normal runt=
ime
device disconnects.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013073825.1796=
2-1-yiyu@yiyuzhou.io?part=3D1
