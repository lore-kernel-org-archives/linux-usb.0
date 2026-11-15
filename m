Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794769795;
	b=VXJwiiokXpFhoDQL8ZuadDB5xlQ/fIhn/nuKMldXak4vI0JioAQXS398DmgUH3JnJqex
	 0wPx9GcQNPshaHATsbNNE1raRb5AVK3qlD/+IC+z8fnDjHER7OesBuJTzMbiCcthZfXlE
	 J6tQ7nwOJisW26f3IxLCHjduU1DMUbkLU5H5tq1z6W4lkB/OyX28SFRnAQNb1Abq1JNI1
	 JJrBh5jl9hBMs2a/szHzxEQpU1RCfvrJGM5rgjrGXv/yOuvKxHYIozNxN0y2LOtDKYvlg
	 xKYblKyUpazABbNXeWwIsIUFSXBSHV1eRDcEm9v8M6wtJN8hgF8PabUMKx59UNDPG8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794769795;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nrYrkdgmdrFnElhIcMbDjudrxpre2MP/7oU6XsmcKTk=;
	b=RPpaBIZhfXS7Sx0b2BAPIwkIi7nMiecBg1FGOnT8V/FDx+Rm1ylCf/NbEoqL+Cmu63QC
	 REpEmENtso/RMV/6P7INwVkNAIHXNAoYIcAxKIaTbj7ZSdb9AhHISXrbzjaC/WOJM+6nZ
	 EpAxXIOA1gjhLNbukuSOWpUoOmwbvQDf4yP4nSpSPy8XTTZTXBHe1nlMdQJyzZkjd+ALG
	 4VXefh55LP9ld+FFBEHteSZUIRKE22I9iPDrRAv6OyTMOu0YPZ4Xt/nLyXp2rGCaXah6L
	 xOfcUgWkbFPK9zZlHYq92l9yLzhc+fAvGtaVQDAD81lyoR8PKUK/sdTQwIbveGhDjng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=luE2rb2B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFCD606A31E
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 19:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=luE2rb2B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 088841F000C4;
	Sun, 15 Nov 2026 19:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794769795;
	bh=nrYrkdgmdrFnElhIcMbDjudrxpre2MP/7oU6XsmcKTk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=luE2rb2ByCAEJpHtFqUJLsR/4NMsLMuDwGBCFjid3AGaXakMgD7NIFc2+qPjaOIgk
	 xqfuO9UON9+NP/BbquliXTxRxd4aOS5OTDSdvVPoiM3W77RzDy74IsQ7re9ED/nIKx
	 V36GZ0d0SaFKr9ja1atD48kf6VOd6P/Cl1vnIsQ5cukQxl3YIi5yuHbC6OyGNK5GdH
	 JxkZaQtPZayEpY9w6SPWyKquhtlvKx0t1u4ShGx6pekmKy6wsFZ/2ak5MhlElk3PIY
	 Ah4N9IXRC+b9Jb6yWX1IshtGfysiI6sK1ag4r/4GT0+vTsn70u1m/WrpIgNoHlZwYd
	 MS40/Okjs3drw==
Message-ID: <sashiko-outbox-215741@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] usb: dwc2: gadget: restart descriptor DMA bulk and
 interrupt endpoints after BNA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vadim Yuzifovich" <vadim@yuzi.co>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261115185335.782678-3-vadim@yuzi.co>
References: <20261115185335.782678-1-vadim@yuzi.co>
 <20261115185335.782678-3-vadim@yuzi.co>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 19:09:54 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] usb: dwc2: gadget: wrong DMA offset in
  dwc2_gadget_handle_nonisoc_bna()
- [Medium] usb: dwc2: delayed EPDISBLD after BNA skips restart or
  flushes active TxFIFO
--

commit 11858f40d5a168bb783c631975d168ab78609905
Author: Vadim Yuzifovich <vadim@yuzi.co>

usb: dwc2: gadget: restart descriptor DMA bulk and interrupt endpoints afte=
r BNA

This commit adds a BNA interrupt handler for non-isochronous endpoints in
descriptor DMA mode to restart the current request when the endpoint is
disabled and not halted.

> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index b0e129061abb6..046b5b04503bd 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c
> @@ -2305,6 +2305,45 @@ static void dwc2_gadget_handle_isoc_bna(struct dwc=
2_hsotg_ep *hs_ep)
>  	dwc2_gadget_restart_isoc_out_ddma(hs_ep);
>  }
> =20
> +/*
> + * dwc2_gadget_handle_nonisoc_bna - handle BNA interrupt for bulk and
> + * interrupt endpoints in descriptor DMA mode.
> + * @hs_ep: The endpoint, not EP0 and not isochronous.
> + * @ints: The endpoint interrupts that came with the BNA, for the log.
> + *
> + * The core raises BNA and disables the endpoint when the descriptor it
> + * fetches is not marked host ready. The chain of a bulk or interrupt
> + * endpoint is complete before the endpoint is enabled, and afterwards t=
he
> + * descriptor reads host ready, so the core read it before the CPU's wri=
tes
> + * to it reached memory. Nothing was transferred and no XferCompl
> + * follows: the request stays current, the ones queued behind it never
> + * start, and the function waits until the host gives up and resets the
> + * port. Start the request again; that fills the descriptor anew.
> + */
> +static void dwc2_gadget_handle_nonisoc_bna(struct dwc2_hsotg_ep *hs_ep,
> +					   u32 ints)
> +{
> +	struct dwc2_hsotg *hsotg =3D hs_ep->parent;
> +	struct dwc2_hsotg_req *hs_req =3D hs_ep->req;
> +	u32 epctl_reg =3D hs_ep->dir_in ? DIEPCTL(hs_ep->index) :
> +					DOEPCTL(hs_ep->index);
> +	u32 epctl =3D dwc2_readl(hsotg, epctl_reg);
> +	u32 status =3D hs_ep->desc_list ? READ_ONCE(hs_ep->desc_list[0].status)=
 : 0;
> +	bool restart =3D hs_req && !hs_ep->halted &&
> +		       !(epctl & (DXEPCTL_EPENA | DXEPCTL_STALL));

[Severity: Medium]
What happens if DXEPINT_BNAINTR is serviced before the core finishes
clearing DXEPCTL_EPENA and latching DXEPINT_EPDISBLD?

As noted in 540ccba08599 ("usb: dwc2: gadget: Start and complete DDMA isoc
transfers") and commit "usb: dwc2: gadget: restart descriptor DMA
isochronous OUT endpoints after BNA", the endpoint disable can complete
slightly after DXEPINT_BNAINTR is first read:

1. If DXEPCTL_EPENA is still set when dwc2_gadget_handle_nonisoc_bna()
   reads epctl_reg, restart is false and the request is not restarted.
   When DXEPINT_EPDISBLD arrives later, dwc2_gadget_handle_ep_disabled()
   returns early for non-isochronous endpoints, leaving the endpoint stuck.

2. If DXEPCTL_EPENA clears after dwc2_hsotg_epint() reads and clears
   DIEPINT, but before dwc2_gadget_handle_nonisoc_bna() reads DIEPCTL,
   dwc2_gadget_handle_nonisoc_bna() restarts the IN endpoint while
   DXEPINT_EPDISBLD remains pending in DIEPINT.  On the next interrupt,
   dwc2_gadget_handle_ep_disabled() unconditionally calls
   dwc2_hsotg_txfifo_flush(), flushing the TxFIFO of the newly restarted
   IN transfer.

> +
> +	dev_warn_ratelimited(hsotg->dev,
> +			     "%s: BNA, DxEPINT %08x DxEPCTL %08x descriptor %08x, %s\n",
> +			     hs_ep->name, ints, epctl, status,
> +			     restart ? "request restarted" : "not restarted");
> +
> +	if (!restart)
> +		return;
> +
> +	hs_ep->req =3D NULL;
> +	dwc2_hsotg_start_req(hsotg, hs_ep, hs_req, false);
> +}

[Severity: Medium]
Does passing continuing =3D false to dwc2_hsotg_start_req() corrupt the DMA
offset when a BNA occurs on a continuation chunk of a multi-part request
(where hs_req->req.actual > 0)?

When a request exceeds dwc2_gadget_get_chain_limit(),
dwc2_hsotg_complete_in() or dwc2_hsotg_handle_outdone() starts the next
chunk with dwc2_hsotg_start_req(hsotg, hs_ep, hs_req, true).  In
dwc2_hsotg_start_req(), length and hs_ep->last_load always account for
ureq->actual, but the DDMA buffer offset only advances when continuing is
true:

drivers/usb/dwc2/gadget.c:dwc2_hsotg_start_req() {
    ...
	length =3D ureq->length - ureq->actual;
    ...
	if (using_desc_dma(hsotg)) {
		u32 offset =3D 0;
    ...
		if (continuing)
			offset =3D ureq->actual;

		/* Fill DDMA chain entries */
		dwc2_gadget_config_nonisoc_xfer_ddma(hs_ep, ureq->dma + offset,
						     length);
    ...
}

Restarting with continuing =3D false programs the descriptors at ureq->dma
instead of ureq->dma + ureq->actual for the remaining length, re-sending or
overwriting the start of the buffer.  Passing hs_req->req.actual > 0 as
continuing (and keeping hs_ep->req set when continuing is true) would
preserve the offset.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115185335.7826=
78-1-vadim@yuzi.co?part=3D2
