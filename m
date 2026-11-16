Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814039;
	b=xPZvdEh35rm/GGO1vCTXN32RY/bBzpgUKqloS/AcCFTaQIpKcpI5l4wl9p6NLYlhvk8s
	 il/PcBTBkoHIsmP5lW7hTWznH8Tc3e8iifHQuYeA/CVBN1X7BlGtfyy+Zwa2G355PehLO
	 UEzehQQA+UMOorFAj2TmF1GyQbLuJ8cWJ/WLmC/xHJ+rBFyq1++SRuvr+eSrGp4qJo4um
	 df8RP/PWdX9FA9XrIoqIGJAwCXicyAUmUm3Sq31fl8TGF783GdTG+i09I3DdL1NT49C07
	 E7yCOgSDzYxO0FRGk04zpi0MXzD0VZR382SH7g/00tvmbUeFw63Uerd2Z8PPEHQ0WOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814039;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qdpVyagIsPR6hJAZTuObxLNS8m+PoQDDQFOJpO+sdj0=;
	b=hoqB6z2fdZM2pe4eSRmtxQ4hZUmIb/1bvzsxnoDpbzHwfQnMKXMgQrV0irEIUPrkT7Ij
	 UCyASNWNHgeNOLUfLAvnbaWYJ/DdsjrkSIm4yxDvZf0kXWDJox6hwv9wI+dVY8CckpApQ
	 WSpbehuj+83brm9MMUG9bxQ32NQmfykff5CEYtoyZ9pILkqNgF5rl9QyU4p1bA16wzeYQ
	 YPUKimPKwCSLzIhDeD4L4PXo/Imer3cwVxD6gIG8DF01DDYcXUJ1nhBFKfMSzJTJOpDA9
	 kjbSjYZDgC5Iu+xSJQvyqeslpmVia06lJck39GTNA+1zYLZhZMpoQto/ANqe4L1FNFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OlB3Ue6Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FA6606A31C
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 07:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OlB3Ue6Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EDE71F000C4;
	Mon, 16 Nov 2026 07:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794814038;
	bh=qdpVyagIsPR6hJAZTuObxLNS8m+PoQDDQFOJpO+sdj0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OlB3Ue6Ywxt0df/8qGTvlFCWwycwYoPsqvYTrseQ6HCsu7p4ZzlHYgpIe6CmsMB4X
	 IpjojgGGI3gnwgcghvXD5kVRUK51NG72MIXG94SuENoIKkKP94nqKteECFz8YfSLdu
	 qZhzUwnkW7i6m+vwKi5wizZ169P6x4tgyjR/re8xJ1LOabJ2XsK6AzsME8Cft51wYm
	 PD6N3AsWxn/yRxt9K3snam24lUWXJYcs14y3sRSmE9Q5J/nrF2siK89sFNwod0Q9rN
	 ri1NKBd5K0/bE86exkIjSUaKJRUYXpFEHbt4susOSVcv/R7zMsR3BEMYvW/QtqH5RI
	 qcrI+/QmBJ0wQ==
Message-ID: <sashiko-outbox-216426@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] usb: dwc2: gadget: make descriptors visible
 before the endpoint is enabled
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vadim Yuzifovich" <vadim@yuzi.co>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261116070433.2813951-4-vadim@yuzi.co>
References: <20261116070433.2813951-1-vadim@yuzi.co>
 <20261116070433.2813951-4-vadim@yuzi.co>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 07:27:18 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] usb: dwc2: descriptor 0 overwrite on full isoc chain in
  dwc2_gadget_start_isoc_ddma()
--

commit 4a1867b305051b6b240040e6915ed6b0bbeb8d25
Author: Vadim Yuzifovich <vadim@yuzi.co>

usb: dwc2: gadget: make descriptors visible before the endpoint is enabled

This commit adds a helper that reads back the last written DMA descriptor
between two full memory barriers before enabling an endpoint in descriptor
DMA mode, ensuring that descriptor stores have landed in DRAM before the
controller fetches the chain.

> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index a7eaf75ff7982..cd177383669f1 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c

[ ... ]

> @@ -1079,12 +1102,23 @@ static void dwc2_gadget_start_isoc_ddma(struct dw=
c2_hsotg_ep *hs_ep)
>  	depctl =3D hs_ep->dir_in ? DIEPCTL(index) : DOEPCTL(index);
>  	dma_reg =3D hs_ep->dir_in ? DIEPDMA(index) : DOEPDMA(index);
> =20
> +	/*
> +	 * The rest of the chain has to be visible before descriptor 0 is
> +	 * host ready. The queue is not empty, so at least one descriptor was
> +	 * filled: next_desc 0 means that the chain is full and the index
> +	 * wrapped.
> +	 */
> +	i =3D hs_ep->next_desc ? hs_ep->next_desc - 1 :
> +			       MAX_DMA_DESC_NUM_HS_ISOC - 1;
> +	dwc2_gadget_desc_visible(&hs_ep->desc_list[i]);

[Severity: High]
Does hs_ep->next_desc stop at 0 when more than MAX_DMA_DESC_NUM_HS_ISOC
requests are queued in hs_ep->queue?

When filling descriptor 0, dwc2_gadget_start_isoc_ddma() passes
hold =3D !hs_ep->next_desc so desc_list[0] remains in DEV_DMA_BUFF_STS_HBUSY
status while descriptors 1..255 are marked DEV_DMA_BUFF_STS_HREADY.  After
the 256th request fills desc_list[255], hs_ep->next_desc wraps to 0.  If a
257th request is in hs_ep->queue, dwc2_gadget_fill_isoc_desc() checks
whether desc_list[0] is DEV_DMA_BUFF_STS_HREADY:

drivers/usb/dwc2/gadget.c:dwc2_gadget_fill_isoc_desc() {
	...
	/* Check if descriptor chain full */
	if ((desc->status >> DEV_DMA_BUFF_STS_SHIFT) =3D=3D
	    DEV_DMA_BUFF_STS_HREADY) {
		dev_dbg(hsotg->dev, "%s: desc chain full\n", __func__);
		return 1;
	}
	...
}

Because desc_list[0] was held in DEV_DMA_BUFF_STS_HBUSY, that check passes:
the 257th request overwrites desc_list[0], sets DEV_DMA_L on it, and
advances hs_ep->next_desc to 1 before the 258th iteration sees
DEV_DMA_BUFF_STS_HREADY on desc_list[1] and stops.  This corrupts
descriptor 0 with the 257th request's buffer while leaving the 1st request
at the head of hs_ep->queue, and causes i above to evaluate to 0 instead
of MAX_DMA_DESC_NUM_HS_ISOC - 1, skipping the readback of the last
descriptor.

Breaking out of the loop when hs_ep->next_desc wraps back to 0 avoids
calling dwc2_gadget_fill_isoc_desc() a 257th time.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116070433.2813=
951-1-vadim@yuzi.co?part=3D3
