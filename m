Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293159;
	b=gx+xi6/YYVpq2niVF+3Tc3tFpAikbcRD6YGrAOQQYwuRkgd6AeEjDdAX6jHpqA090oHy
	 0RebJWGeXr33BhU0dRS2Xc7qbNdRLxruzzL1yFwcI+UEINAs+WfDspif2bIz0Z+IjlYMQ
	 lj4b9LTWssv5nnwe0Pw0Jhix8ZtWa0I9Br11xAav4Kv80cKlurYF+O2Yo4LvyRI1L9U/o
	 8iy2G59dZkgL4Z4gI8QHyX6n3anCCVcC6+x9/AsCIcoS5n0nLEn6ENuT2spmj/PTRejNR
	 TfQxWMA2+qqDRsU2u8obBSBCM3zjZTJbiz4wle1DX5otUsCeJU1HFu1oBIBBEyy9cLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293159;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=o1DnABkpZ2vhFl4AD4iXyUs5es8ET0rkyg/tcCx2zno=;
	b=c8DRhjeNzMIq2dMqII6d0mSTenZ1mGCHlPkJ0ZuGIcg/2hKjx8p9ojnGvhpG28JQE7Uz
	 rB+79Uo5L9XOznMF2gFwXhOt1Jn8LATTeww1CfXUYGns+IXB2gag3xHXLut9dXrvZ95gM
	 uy+VXSv8ot0T8nJ8/4QyZAYV4XVrJ6LdAtF29BHoVf77hRCd102m48KoeYXFjh8+HXJ9a
	 c3cEMULxcL3W6yKoviWK2UFYjRKzzFvpXURAQv0PB05eRlVhOP/deA/56xe5jbcDKKaCK
	 89avAX/xmL1KbO7MfxThBpNh7BpHYPvaPlPxBVjKNJyWcLxkapXO50oQtEDvByimZDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bYhW4FpT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2688606A65E
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 06:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bYhW4FpT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67CFA1F008A5;
	Tue, 10 Nov 2026 06:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794293158;
	bh=o1DnABkpZ2vhFl4AD4iXyUs5es8ET0rkyg/tcCx2zno=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bYhW4FpTxLD4noALm7R/ogPhTlFXIbOD4aZaycyQjdiSGb4CnYD2O2PR2Hi1tTd2J
	 NbT5kCTsvvjfBqJAA9xXMzx2r7GTLdkjA/xHKjjTO9ZhcTtG5Nw+PP5VK/AJ/icmq6
	 B2vTPIZXhqR+b74EgvT89LEni9cnWvNXzYb37gbupVF6iux9DLdbfihPDnNyUvzd7Y
	 6fKm3Mw8to39kJow+BdF0Wgj9V6vdFcpx9lLzVotzKODeEDS3kI7h+bzU3E5VxTteU
	 q4B9ODxBDlIeA0wFs6R4aRV67JJsrhGDw3mXWoVFanNjgCNt3+ot51fBar0B5nJSQm
	 0IBOy3UVR62EQ==
Message-ID: <sashiko-outbox-206443@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/22] usb: host: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110064105.20335-12-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110064105.20335-12-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 06:45:58 +0000
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
- [Medium] usb: xhci: shift-out-of-bounds in xhci_endpoint_init() [1]
--

commit a988b8e7693dc7d03153a0ed5cd6c269e329c0d7
Author: Shunbo Shi <shishunbo@cmss.chinamobile.com>

usb: host: fix a few spelling mistakes in comments

This commit fixes spelling mistakes in comments across several USB host
controller drivers.

[ ... ]

> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index 75577f441cddc..d92d6a95264b0 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -1442,7 +1442,7 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
> =20
>  	/*
>  	 * Get values to fill the endpoint context, mostly from ep descriptor.
> -	 * The average TRB buffer lengt for bulk endpoints is unclear as we
> +	 * The average TRB buffer length for bulk endpoints is unclear as we
>  	 * have no clue on scatter gather list entry size. For Isoc and Int,
>  	 * set it to max available. See xHCI 1.1 spec 4.14.1.1 for details.
>  	 */

[Severity: Medium]
This problem wasn't introduced by this patch, but can a full-speed bulk
endpoint with wMaxPacketSize of 0 trigger a shift-out-of-bounds in
rounddown_pow_of_two() further down in xhci_endpoint_init() [1]?

drivers/usb/host/xhci-mem.c:xhci_endpoint_init() {
	...
	max_packet =3D xhci_usb_endpoint_maxp(udev, ep);
	...
	if (usb_endpoint_xfer_bulk(&ep->desc)) {
		if (udev->speed =3D=3D USB_SPEED_HIGH)
			max_packet =3D 512;
		if (udev->speed =3D=3D USB_SPEED_FULL) {
			max_packet =3D rounddown_pow_of_two(max_packet);
			max_packet =3D clamp_val(max_packet, 8, 64);
		}
	}
	...
}

usb_parse_endpoint() logs a notice when wMaxPacketSize is 0 without rejecti=
ng
the descriptor. When xhci_endpoint_init() runs on such an endpoint,
max_packet is 0 and rounddown_pow_of_two(0) evaluates 1UL << -1 before
clamp_val() runs, triggering a UBSAN shift-out-of-bounds warning and
producing an architecture-dependent max_packet value. Clamping max_packet
before calling rounddown_pow_of_two() would avoid this.

[1] https://sashiko.dev/#/bug/linux-8c242134-4dc4-4170-867f-fb3afd236e9c

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110064105.2033=
5-1-shishunbo@cmss.chinamobile.com?part=3D11
