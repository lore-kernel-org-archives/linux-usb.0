Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793069399;
	b=XKX23y6jHACsf+tr6nGgB9sgesvOoZBQ6x80JlPhjYZYRjTai9PPqWIrFnrfxB9yrvIS
	 awkqqkvHTJgm66I1XH4u07mcuCB+TvFbr5B8xxVF5YU0Tzde3Lwq0ws4Z2yihQJ8I1cp5
	 JgCCrIU+YJrlK9A4BQpE97iqn895DRIH5OOsRmTaHagNdAoImFAEXV4ECypAaXDTu1dNX
	 CbRuWdjdVmAL2h2wxTg6kTZfimFdR02sIF6gbhQHXq3qkksv/GxFJvTHlbwrkYuNT3LUf
	 3n3N2biclTvc+N2VlPP4tAi4D0+q4+3qt3z+HkXKwpFyaNtur/mqTRnTtUtwpQ/dteg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793069399;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rlWgSOis7FZ6niXAP2lIwedo05oBOCimGAsDCatKDJw=;
	b=mUMLseHW1YXrQPw1je/nmxTNNsTV4JtVLIGJaE/fSU25y3a9JRqCQt6wNtcepviM0IdK
	 Gq4DyscbOft6eG+t79e81unmPCsHBTKu4elaHOR8MMDeaOp+a2SxbKnKzAfohbuxHOu5y
	 N70UhII+GJZxLaerJ5K912Wu0EGdWyPioVWo7enWMOCEiZax4959JnZBbt/PGK7GS8qL+
	 XXn5reSUVBKmWWCeyaSmKn2qUimmfT0PsY3V6uQ24oTWgS4InKs+ALfpX9ExkJ0+0lFZQ
	 pUMXVeRW1nFpR3blXcO4Len1IP8WexlfgfycdBtuxwpl5+t1U5BrRXjJUINOpSgDKpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eIidmHw8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AA6606A31A
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 02:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eIidmHw8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4F491F01825;
	Tue, 27 Oct 2026 02:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793069398;
	bh=rlWgSOis7FZ6niXAP2lIwedo05oBOCimGAsDCatKDJw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eIidmHw8oKblNgJK5buThymcv1UqzdSLMia5mZUHgsew/KATWyeCPuv/HeIMjnCt/
	 Rfc47q0W9C4NOjSkh72hg1Vm0WsrEvWmIHob2gZ9A+MUDLrYT1fJ8wEh2qaob2NzpR
	 oYd2G0CWRiVRJAuWpXmo7rAKU9ML7KcrKLa0nSYdTyvxAXIDx94fFQppx+aE7Vk+U9
	 RaQyTFiKYvBUu1JIKFsRwryUa4DaJruJxqP5uaDJaXmhVMnyHaNhthjOaxIEfit+kL
	 csdslqaj7arytjS2UaC3F5KEvKXWaCQDMfp2LFoIrQTidNEkf/a5fVk5LAyX85E4N7
	 h7x3dg7dUTY9Q==
Message-ID: <sashiko-outbox-186031@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: aspeed_udc: fix u16 truncation of
 descriptor lengths
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liu Chao" <liuc63@xiaopeng.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261027024029.1310175-1-liuc63@xiaopeng.com>
References: <20261027024029.1310175-1-liuc63@xiaopeng.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 02:49:58 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usb: gadget: aspeed_udc: DMA ring wrap-around in ast_dma_descripto=
r_setup()
--

commit 779c6cb173f5ebef2c19640cedeba9f7a9ebcb90
Author: Liu Chao <liuc63@xiaopeng.com>

usb: gadget: aspeed_udc: fix u16 truncation of descriptor lengths

This commit widens the tx_len parameter of ast_dma_descriptor_setup() and
the total_len accumulator in ast_udc_epn_handle_desc() from u16 to u32 so
that descriptor-mode transfers larger than 64 KB are not truncated.

> diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc=
/aspeed_udc.c
> index 81fa495bbacd1..b8bb81cbb6a6f 100644
> --- a/drivers/usb/gadget/udc/aspeed_udc.c
> +++ b/drivers/usb/gadget/udc/aspeed_udc.c
> @@ -472,7 +472,7 @@ static void ast_udc_ep_free_request(struct usb_ep *_e=
p,
>  }
> =20
>  static int ast_dma_descriptor_setup(struct ast_udc_ep *ep, u32 dma_buf,
> -				    u16 tx_len, struct ast_udc_request *req)
> +				    u32 tx_len, struct ast_udc_request *req)

[Severity: High]
With tx_len widened to u32, can a transfer larger than
AST_EP_DMA_DESC_MAX_LEN * (AST_UDC_DESCS_COUNT - 1) (7680 * 255 bytes) wrap
ep->descs_wptr all the way back to the hardware read pointer and stall the
endpoint queue?

In ast_udc_epn_kick_desc(), tx_len is clamped to descs_max_size, which allo=
ws
up to all 256 descriptors in a single stage:

drivers/usb/gadget/udc/aspeed_udc.c:ast_udc_epn_kick_desc() {
	descs_max_size =3D AST_EP_DMA_DESC_MAX_LEN * AST_UDC_DESCS_COUNT;

	last =3D req->req.length - req->req.actual;
	tx_len =3D last > descs_max_size ? descs_max_size : last;
	...
	if (!ast_dma_descriptor_setup(ep, dma_buf, tx_len, req))
		req->actual_dma_length +=3D tx_len;

	/* make sure CPU done everything before triggering DMA */
	mb();

	ast_ep_write(ep, ep->descs_wptr, AST_UDC_EP_DMA_STS);
}

When tx_len > 7680 * 255 (including the full 7680 * 256 byte stage described
in the commit message), the loop in ast_dma_descriptor_setup() runs all
AST_UDC_DESCS_COUNT (256) iterations:

drivers/usb/gadget/udc/aspeed_udc.c:ast_dma_descriptor_setup() {
	while (chunk >=3D 0 && !last && count < AST_UDC_DESCS_COUNT) {
		...
		if (count =3D=3D 0)
			req->saved_dma_wptr =3D ep->descs_wptr;

		ep->descs_wptr++;
		count++;

		if (ep->descs_wptr >=3D AST_UDC_DESCS_COUNT)
			ep->descs_wptr =3D 0;

		offset =3D ep->chunk_max * count;
	}
}

Because the descriptor ring is idle when ast_udc_epn_kick_desc() is called,
ep->descs_wptr starts equal to the hardware RPTR. Advancing ep->descs_wptr
256 times and wrapping at AST_UDC_DESCS_COUNT returns ep->descs_wptr to that
same initial value (req->saved_dma_wptr =3D=3D RPTR), which is then written=
 to
AST_UDC_EP_DMA_STS.

In the Aspeed endpoint DMA hardware, WPTR =3D=3D RPTR in AST_UDC_EP_DMA_STS
indicates an empty descriptor list, as checked in ast_udc_epn_handle_desc():

	ctrl =3D ast_ep_read(ep, AST_UDC_EP_DMA_STS);
	rd_ptr =3D EP_DMA_GET_RPTR(ctrl);
	wr_ptr =3D EP_DMA_GET_WPTR(ctrl);

	if (rd_ptr !=3D wr_ptr) {
		dev_warn(dev, "desc list is not empty ! %s:%d, %s:%d\n",
		"rptr", rd_ptr, "wptr", wr_ptr);
		return;
	}

and documented in the sibling Aspeed vHub driver:

drivers/usb/gadget/udc/aspeed-vhub/epn.c:ast_vhub_count_free_descs() {
	/*
	 * d_next =3D=3D d_last means descriptor list empty to HW,
	 * thus we can only have AST_VHUB_DESCS_COUNT-1 descriptors
	 * in the list
	 */
	return (ep->epn.d_last + AST_VHUB_DESCS_COUNT - ep->epn.d_next - 1) &
		(AST_VHUB_DESCS_COUNT - 1);
}

Should ast_udc_epn_kick_desc() and ast_dma_descriptor_setup() cap each stage
to AST_UDC_DESCS_COUNT - 1 descriptors so that ep->descs_wptr never wraps
onto the hardware RPTR?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027024029.1310=
175-1-liuc63@xiaopeng.com?part=3D1
