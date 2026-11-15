Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794769672;
	b=tTPsFN/s3XB5yskYETTZGw2ENRC2TCqnZT/MlgPdi8yA0eSENKg0SGHh7W8yWiw+4KSb
	 JVVFOZKrYWQ8adhLZ45QF0BDibQE3y0IBdkmuOhRgm4ddGSRdmbHWqn1hYfeTAoUpIOhC
	 EE8tF6hPkC+rK1ESEfxpoySJIUrL68Y5l2N0+26h4ZRpuIciTgPBjWNaA61SZ8exw/Oif
	 sIcdn6pNXxcGpCfEpFUJOpNuPHXxXAbVO1CZv3KhSQFO/GmFMmC+Fe66ChxVpjcm+16DI
	 7RN80MqJ4co872SLVVqk0NLsIQwO/QuEpCwY2aw8l0COOD/W7uPxgomCOsx09l1uXhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794769672;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zL5ieg6aaOkL+NBqveWK6L3RbexrHTL3RdMkqHY7yPs=;
	b=dUVLSG/U89kTwUmf5CZeqzooZ2awjirdLr47GTQtyCG//ckVmwZ5YGtPz1yIQaeQR+2U
	 HKB6zQkrxIqnNOa6u2KE6EAqcJ0RKCHSRwuIpjJsEeLet2TD8kG+6laOd9E5HzAB8NUUG
	 DE1uHp9HqJgYcR8kagMdVP9Os6k+K2eThIZJkEPy2Tf7BEOtpgr4FHgnkLGynxUqn/RN8
	 tSErNO1ipkRddUxct7FkYN06fY06QExYvCHqpYZUmxOE0FPnMoLtByXDR8T9BOYVTApp6
	 hzbSWoUm61vS/RhwAIzHoFm/ijE94SoK8OBZNifcXqI2ibR5mlKa+i3jLpoYofsinIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RwmXQcmo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EC8606A31A
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 19:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RwmXQcmo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D5641F000C4;
	Sun, 15 Nov 2026 19:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794769672;
	bh=zL5ieg6aaOkL+NBqveWK6L3RbexrHTL3RdMkqHY7yPs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RwmXQcmosLYtlvSbuPXgPpe81dZhaSteR7DwuNpLh7tfvoTvIKNeaccMrvuT6zZSM
	 64InVDcQZ1wV650Mgr7GRWeC1qfIN6xtU4mct6/xFNj0MjprSXwPo1HCC+pbsFaqZC
	 WAalpmyYPkfAUkkrx4XV2SP7waItbpNnrvy0m2NJ5WW/HgKIyUdDfw/bpvmScUujtm
	 yifQyrJRkO86VynhDtO5xc8zc4UAHV8kvl+0YrDNULv7SrxOur5D7i/Eac/VZjPV8/
	 5kjrgHJEEsTEtSCV6FhvIDT4EjVKZl/YHLwq7j1GvuBZIi8nUOvctKhoplQp5hgp+6
	 DuOnJ4qHtB8PQ==
Message-ID: <sashiko-outbox-215737@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] usb: dwc2: gadget: make descriptors visible before
 the endpoint is enabled
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vadim Yuzifovich" <vadim@yuzi.co>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261115185335.782678-4-vadim@yuzi.co>
References: <20261115185335.782678-1-vadim@yuzi.co>
 <20261115185335.782678-4-vadim@yuzi.co>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 19:07:49 +0000
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
- [Medium] usb: dwc2: gadget: dwc2_gadget_desc_visible() skipped when
  isoc ring is full
--

commit ff96d0bc699669e80418e1239ed82d2f723a61f0
Author: Vadim Yuzifovich <vadim@yuzi.co>

usb: dwc2: gadget: make descriptors visible before the endpoint is enabled

This commit adds dwc2_gadget_desc_visible() to read back the last written
DMA descriptor between two full memory barriers before enabling an endpoint
in descriptor DMA mode.

> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index 046b5b04503bd..fe37250fec6c7 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c

[ ... ]

> @@ -1021,6 +1044,9 @@ static void dwc2_gadget_start_isoc_ddma(struct dwc2=
_hsotg_ep *hs_ep)
>  	depctl =3D hs_ep->dir_in ? DIEPCTL(index) : DOEPCTL(index);
>  	dma_reg =3D hs_ep->dir_in ? DIEPDMA(index) : DOEPDMA(index);
> =20
> +	if (hs_ep->next_desc)
> +		dwc2_gadget_desc_visible(&hs_ep->desc_list[hs_ep->next_desc - 1]);

[Severity: Medium]
Does this skip dwc2_gadget_desc_visible() when the isochronous descriptor
ring is full?

dwc2_gadget_start_isoc_ddma() returns early when hs_ep->queue is empty, so
at least one descriptor is always filled.  When MAX_DMA_DESC_NUM_HS_ISOC or
more requests are queued, dwc2_gadget_fill_isoc_desc() fills all 256
descriptors and wraps hs_ep->next_desc back to 0:

drivers/usb/dwc2/gadget.c:dwc2_gadget_fill_isoc_desc() {
    ...
	/* Update index of last configured entry in the chain */
	hs_ep->next_desc++;
	if (hs_ep->next_desc >=3D MAX_DMA_DESC_NUM_HS_ISOC)
		hs_ep->next_desc =3D 0;

	return 0;
}

When hs_ep->next_desc wraps to 0, the if (hs_ep->next_desc) check skips
dwc2_gadget_desc_visible() instead of reading back
hs_ep->desc_list[MAX_DMA_DESC_NUM_HS_ISOC - 1], leaving the descriptor
writes in flight when the endpoint is enabled and allowing the BNA error to
occur.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115185335.7826=
78-1-vadim@yuzi.co?part=3D3
