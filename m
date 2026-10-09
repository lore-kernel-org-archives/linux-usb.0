Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69875443307
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 10:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540941; cv=none; b=Pv+tJXB2RDzzuWyPFmKy3viOGuFMIA7TPE5lgq956FZ0OJJ7YoOtfu6GJLDGwXAOQ2q2Ar691VEjKT5IlcQEcZZ/Ow8jjwSRiIEaZsij2VjwOJA8A6857KXOgHuCxifCmnCujpDFSeS45kMmgTmV9rIdvM+hXwmfJhSE+NpidP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540941; c=relaxed/simple;
	bh=XPyZpoOxKC1zGzAGvqU8f8IbaNz8zlDS7wGU6htGN9Y=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=tQODD8K+nRCVPoliVicHYgZobNgKTVebu2ESnTvRYfD2SxQmIRVKoNL+c32VHmvcIOqxkjLN93rtYSc/hR3Upn4XTpe3fQgfisAZw549pjOG5u1WHP8Iehl8BsEGcwTAvMaKljXtFkm3QmOgTiHg+OJvJuqSar9aHd/oxskGW8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NAcF3wru; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NAcF3wru"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDA941F000FF;
	Fri,  9 Oct 2026 10:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540938;
	bh=UrzQhbMQv9ftefWT261ODAiTl3bgmzqxztv+IW0A5h0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NAcF3wruAj3NzvhQAtyctFXrf8GjffTS7pYIoYu2DZYp1C5szU8ddmSA2crnvslF6
	 e4/hkUx+86qVOImT90jGGjfjnUcEeymFmqlQJ643C1M1gCywNJz1nRXntamArdf0yD
	 VDd1cnJaE8PTlPUn5RuEL3Rdt/dUQ47BB0v7UZ7xc8QcuVfWwUaqMkMu1YCkBlCwa5
	 7omjHIMbJ+OF6+QzG16XJHmKxtUCqczb1rEL/nmdo4NBIJmNX5g3wC8RbnCftPtci+
	 ryi2GOlMs/dIeTO5CNuQCHUGq9L5fq8e3ohsiP4MOyBMtwtu9vbDFTGgF+qUbZ1G1R
	 gqkvea/fcowsg==
Message-ID: <sashiko-outbox-165213@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 13/14] usb: xhci: Fix bounce buffer overflow
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261009095834.561578-14-mathias.nyman@linux.intel.com>
References: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
 <20261009095834.561578-14-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 10:15:37 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] usb: xhci: inconsistent TD Size calculation for out-of-spec bulk=
 devices
--

commit f7283e43a6da5355da08e764e6aa96a4a118927d
Author: Michal Pecio <michal.pecio@gmail.com>
Subject: usb: xhci: Fix bounce buffer overflow

High-speed devices with out of spec 1024 byte bulk endpoints exist and
are allowed by USB core, but xhci-hcd always sets packet size to 512.
This commit fixes a bounce buffer overflow for these devices by allocating
a 512 byte bounce buffer and using the correctly clamped packet size
in xhci_align_td().

Link: https://lore.kernel.org/linux-usb/D4tcSGerkYkIV1DmaUo1t8TaR5qQElDLkid=
n@bugs.sh/

> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 243b1fd2b2f68..c23434001e9cb 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
[ ... ]
> @@ -3699,9 +3697,8 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t=
 mem_flags,
>  		if (enqd_len + trb_buff_len < full_len) {
>  			field |=3D TRB_CHAIN;
>  			if (trb_is_link(ring->enqueue + 1)) {
> -				if (xhci_align_td(xhci, urb, enqd_len,
> -						  &trb_buff_len,
> -						  ring->enq_seg)) {
> +				if (xhci_align_td(xhci, urb, enqd_len, &trb_buff_len,
> +						ring->enq_seg, ring->bounce_buf_len)) {

[Severity: Medium]
While xhci_align_td() is correctly updated here to use the clamped
ring->bounce_buf_len, does the xhci_td_remainder() call further down in
xhci_queue_bulk_tx() also need to be updated?

xhci_td_remainder() still relies on the raw 1024-byte max packet size from =
the
descriptor:

drivers/usb/host/xhci-ring.c:xhci_td_remainder() {
	...
	maxp =3D xhci_usb_endpoint_maxp(urb->dev, urb->ep);
	total_packet_count =3D DIV_ROUND_UP(td_total_len, maxp);

	/* Queueing functions don't count the current TRB into transferred */
	return (total_packet_count - ((transferred + trb_buff_len) / maxp));
}

Since the endpoint context and bounce buffer use a clamped 512-byte size, c=
ould
this mismatch cause the driver to write an incorrectly small TD Size into t=
he
TRB? If the xHC hardware is using 512 bytes, might this mismatch lead to a
Transfer Ring Expansion Error, babble, or endpoint halt when queueing a bulk
transfer greater than 1024 bytes for a high-speed device with an out-of-spec
1024-byte max packet size?

>  					send_addr =3D ring->enq_seg->bounce_dma;
>  					/* TD bounced at least, and last on this seg */
>  					td->bounce_seg =3D ring->enq_seg;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009095834.5615=
78-1-mathias.nyman@linux.intel.com?part=3D13
