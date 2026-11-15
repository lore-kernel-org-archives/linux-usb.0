Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794770429;
	b=Z8Id8QiwY2eSftrQmm5tsGFppgEYXRJ5ZxPyg4ACpMfvtj8ZXJjZa9fK9cCrICr5XN31
	 HqlB/J7h+hwE6KWnRzzuPeLXB3Lrusqjfcpf282ah6juRqDZWXiIuBBo0WZUxnrpRQE3M
	 nFfjmPKaG8hAg03cgglb+0sB8KuvMFDuLO2Za3m0zTevP58sTg0umJ2NGQv/m/HjISlha
	 VdScC84pHx2bzHV87kZ9ScUwz0tX3vQI/QRNMAXNmkuZL1bLF8xEuVMCq1b4nWEez09Hd
	 lB6ZIchh6YufFJ0CFfrhfQNVf6/yEx+fm7Oy8giRWer5o5gIVErGMM3dCQtKXWoLpMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794770429;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=a7nPcnTVsce0DsYNyUBTuOLZjYyAoUGswXdWCbk+NyQ=;
	b=G6ZddZMGmEhfsOcYQZZ05HIBuXiBU6yKTCQaYcxAZ5URCld2QB4XOoJiAt+5DcrhraIt
	 mij1PmKWV1TzH5QkK/HKtbaWZCA/yHCtys0Flqn/5zMLGO5ldm8Obwdi3JEhfy4kBLE1a
	 HnKP6YjYEbfX9+wV1ES1jk7wJR7NO0NN3RVBo4dZjYcqmG4TXZnYmRXj/PZnU/4Qp/zXB
	 KhlWYzR/2BbT8LOFYI97t8uUxDXUMRMxS2hL4uN9uakI6LtPJCeeHcn/C+1J5HabANm38
	 rbIl2q1JMf4AYdm88xM/e/kqOhYH7hFBqdw8eCMHPGrn2Bnzadh0N05kVERrgjdsnSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fR5YLIhe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F93606A33B
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 19:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fR5YLIhe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B321F000C5;
	Sun, 15 Nov 2026 19:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794770429;
	bh=a7nPcnTVsce0DsYNyUBTuOLZjYyAoUGswXdWCbk+NyQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fR5YLIhe7mb2MEWY1pi0+NzNAxEMcd8gBbu7xKTO+C5DSXdkx0FGNsA0BV5Qjl4ki
	 tjaWROFRfjENft7/Y/KqTIbKy0jDN4KFmgUrnDsj/sbm97Ozh+NLGd3gElIMFW6RjQ
	 FtmubmUZrjGJG25oMJ3VTSaHt+6/f72Nrl77KUX5Udtnun5VAJBGUNEH8u6r0mFtzx
	 2WGfTLX7c//3cqZP5a5d0glfvPJ7afcpy5vcXaxyD5huSiZjWIsFMAICvzFU8FwNbM
	 83gfDwpCx9SH8/E8HQ5+Uh3tGOLqa+1i9Y98yi2KpMStuz3+GVtS2HlqcNwh3TqXui
	 H72RBTi038g8Q==
Message-ID: <sashiko-outbox-215744@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] usb: dwc2: gadget: restart descriptor DMA
 isochronous OUT endpoints after BNA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vadim Yuzifovich" <vadim@yuzi.co>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261115185335.782678-2-vadim@yuzi.co>
References: <20261115185335.782678-1-vadim@yuzi.co>
 <20261115185335.782678-2-vadim@yuzi.co>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 19:20:28 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] usb: dwc2: gadget: ep_disabled restart before
  dwc2_gadget_handle_isoc_bna()
- [Medium] usb: dwc2: gadget: empty queue in
  dwc2_gadget_restart_isoc_out_ddma() stalls
- [Low] usb: dwc2: gadget: missing Fixes trailer on BNA recovery fix
--

commit b960395b5c5b08d46282314fb63ad59c3e17a74a
Author: Vadim Yuzifovich <vadim@yuzi.co>

> usb: dwc2: gadget: restart descriptor DMA isochronous OUT endpoints after=
 BNA
>=20
> In descriptor DMA mode the core disables an isochronous endpoint when it
> reaches a descriptor that is not ready (BNA), for example after an
> interrupt latency longer than the queued requests cover.
> dwc2_gadget_handle_isoc_bna() resets the endpoint and leaves the restart
> to the next OUTTKNEPDIS. Two things keep that from happening.
>=20
> First, the endpoint-disabled interrupt that comes with the BNA runs
> dwc2_gadget_handle_ep_disabled(), whose isochronous part is written for
> buffer DMA: it completes requests frame by frame and advances
> target_frame up to the current frame. Run after the BNA reset, it moves
> target_frame off TARGET_FRAME_INITIAL, and the OUT token handler then
> takes the chain for running and never restarts it.
>=20
> Second, after the BNA the core raises BNA again for the disabled
> endpoint as fast as the handler clears it, and no OUTTKNEPDIS comes.
>=20
> On a Sophgo SG2002 (DWC_otg 4.20a) with a UAC1 capture endpoint and
> eight requests queued, one 8 ms interrupt latency (a line printed on the
> 115200 baud serial console) caused one BNA. The endpoint stayed
> disabled and the BNA interrupt kept the CPU busy until the host gave up
> and reset the port, which took the other functions of the composite
> gadget down as well.
>=20
> In descriptor DMA mode, do not run the buffer DMA completion for a
> disabled isochronous endpoint; put it back in its initial state. For an
> OUT endpoint, build the chain again from the queue and enable it at
> once, both after the BNA and after an endpoint-disabled interrupt that
> finds it disabled with requests queued. IN endpoints keep restarting on
> the next NAK.
>=20
> Signed-off-by: Vadim Yuzifovich <vadim@yuzi.co>

[Severity: Low]
This fixes BNA recovery in descriptor DMA mode.  Should it include:

  Fixes: 729cac693eec ("usb: dwc2: Change ISOC DDMA flow")

> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index 6c8a9f05fff00..b0e129061abb6 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c
> @@ -2259,6 +2259,28 @@ static void dwc2_gadget_complete_isoc_request_ddma=
(struct dwc2_hsotg_ep *hs_ep)
>  	}
>  }
> =20
> +/*
> + * dwc2_gadget_restart_isoc_out_ddma - build the chain of a disabled ISO=
C OUT
> + * endpoint again from its queue and enable it.
> + * @hs_ep: The isochronous OUT endpoint, in its initial state.
> + *
> + * After a BNA the core keeps raising BNA for the endpoint, as fast as t=
he
> + * handler clears it, and no OUTTKNEPDIS comes to restart the chain. So =
the
> + * chain is restarted here at once.
> + */
> +static void dwc2_gadget_restart_isoc_out_ddma(struct dwc2_hsotg_ep *hs_e=
p)
> +{
> +	struct dwc2_hsotg *hsotg =3D hs_ep->parent;
> +
> +	if (hs_ep->dir_in || list_empty(&hs_ep->queue) ||
> +	    hs_ep->target_frame !=3D TARGET_FRAME_INITIAL ||
> +	    dwc2_readl(hsotg, DOEPCTL(hs_ep->index)) & DXEPCTL_EPENA)
> +		return;
> +
> +	hs_ep->target_frame =3D dwc2_hsotg_read_frameno(hsotg);
> +	dwc2_gadget_start_isoc_ddma(hs_ep);
> +}

[Severity: Medium]
What happens if hs_ep->queue is empty when dwc2_gadget_restart_isoc_out_ddm=
a()
runs (for example, if dwc2_gadget_handle_isoc_bna() just completed the
only remaining request and the gadget function queues requests
asynchronously)?

Returning early leaves the endpoint disabled, so the core continues
raising BNA interrupts.  Even when dwc2_hsotg_ep_queue() is later called,
it sees hs_ep->target_frame =3D=3D TARGET_FRAME_INITIAL and returns without
filling a descriptor or restarting the endpoint, because no OUTTKNEPDIS
will arrive after the BNA:

drivers/usb/dwc2/gadget.c:dwc2_hsotg_ep_queue() {
    ...
	if (using_desc_dma(hs) && hs_ep->isochronous) {
		if (hs_ep->target_frame !=3D TARGET_FRAME_INITIAL) {
    ...
			dwc2_gadget_fill_isoc_desc(hs_ep, dma_addr,
						   hs_req->req.length);
		}
		return 0;
	}
    ...
}

> @@ -2902,6 +2926,27 @@ static void dwc2_gadget_handle_ep_disabled(struct =
dwc2_hsotg_ep *hs_ep)
>  	if (!hs_ep->isochronous)
>  		return;
> =20
> +	/*
> +	 * In descriptor DMA the requests sit in the descriptor chain rather
> +	 * than one per frame, so the frame by frame completion below does not
> +	 * apply. The core disables an isochronous endpoint by itself when it
> +	 * meets a descriptor that was not filled in time (BNA). Put such an
> +	 * endpoint back in its initial state and build the chain again from
> +	 * the queue: at once for OUT, on the next NAK for IN. The loop below
> +	 * would move target_frame off TARGET_FRAME_INITIAL, which tells the
> +	 * token handlers that a chain runs: the endpoint then stays disabled
> +	 * for good, and every request queued again goes into a dead chain.
> +	 */
> +	if (using_desc_dma(hsotg)) {
> +		if (!(dwc2_readl(hsotg, epctl_reg) & DXEPCTL_EPENA)) {
> +			hs_ep->target_frame =3D TARGET_FRAME_INITIAL;
> +			hs_ep->next_desc =3D 0;
> +			hs_ep->compl_desc =3D 0;
> +			dwc2_gadget_restart_isoc_out_ddma(hs_ep);
> +		}
> +		return;
> +	}

[Severity: High]
Can dwc2_gadget_handle_isoc_bna() corrupt the newly started descriptor
chain when DXEPINT_EPDISBLD and DXEPINT_BNAINTR are handled in the same
dwc2_hsotg_epint() call?

In dwc2_hsotg_epint(), DXEPINT_EPDISBLD and DXEPINT_NAKINTRPT are
dispatched before DXEPINT_BNAINTR:

drivers/usb/dwc2/gadget.c:dwc2_hsotg_epint() {
    ...
	if (ints & DXEPINT_EPDISBLD)
		dwc2_gadget_handle_ep_disabled(hs_ep);

	if (ints & DXEPINT_OUTTKNEPDIS)
		dwc2_gadget_handle_out_token_ep_disabled(hs_ep);

	if (ints & DXEPINT_NAKINTRPT)
		dwc2_gadget_handle_nak(hs_ep);
    ...
	if (ints & DXEPINT_BNAINTR) {
		dev_dbg(hsotg->dev, "%s: BNA interrupt\n", __func__);
		if (hs_ep->isochronous)
			dwc2_gadget_handle_isoc_bna(hs_ep);
	}
    ...
}

When both bits are set after interrupt latency,
dwc2_gadget_handle_ep_disabled() (or dwc2_gadget_handle_nak() for IN)
rebuilds desc_list[] from hs_ep->queue and sets DXEPCTL_EPENA.
dwc2_gadget_handle_isoc_bna() then runs on the active endpoint: it
unmaps and completes get_ep_head(hs_ep) while hardware DMA is armed on
desc_list[0], shifts hs_ep->queue out of sync with desc_list[], and
resets hs_ep->target_frame to TARGET_FRAME_INITIAL while DXEPCTL_EPENA is
still set, so its call to dwc2_gadget_restart_isoc_out_ddma() returns
early and subsequent dwc2_hsotg_ep_queue() calls stop filling descriptors.

In addition, because dwc2_hsotg_epint() clears DOEPINT at the entry of the
handler before the endpoint is re-enabled and the core re-asserts
DXEPINT_BNAINTR while the endpoint is disabled, a newly latched BNA
interrupt can fire right after the restart and hit the running chain in
the same way.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115185335.7826=
78-1-vadim@yuzi.co?part=3D1
