Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432206;
	b=BeaIHckWxLDcSfsLhSGKVUbHMcd3zoeNf83052vjP+sFXtiDRrl4mlROxyx9xIWposMi
	 FWpGORImZW/h1RVyqBeXwGz/QI9FJESSQWrrk6ynUAiuCjyHqT1yLbXxVy6ntGU/b/a9K
	 vLZmFjoDRqYbKlNYJzsHTA8MjbPNm8r7fKCOJ0jd+bTa1nIiHSAe4nKscxiCZbr9I8/fI
	 ZNhULtS18zONjLvqu9rZ1S77bqP4dUhwZCO2/yCVjMFov0LMefMp8khgB7U/D/x3d+jY+
	 sLuVReJbP66fnKU2or1QovoVh9/fnvNEiEWLhlVmNGaP6BoEdTFaGSxz3XfjicD3kzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432206;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=c0zUqEngVMb9udXMPn/SWDCsRmE2GsbJ/IrXiRi6Mo4=;
	b=XEXFf3hcx33z1Yc+z0CpcJBa6uPGxxHCEk++0Wd06U7K6cNery4WfGnKEUvakVHSIkNQ
	 nAn8cl9pWWelRyGQL21+tdywJrcyorGBEVv853/SgvGO78F7BpGtgzrkfMczlPshf3h2L
	 Zfeol77Dip5WpsA98YCcN6M77CVHy6ALLETnpflJAUojkRuxDSZOkwUQg8y/vz8YfRzor
	 sNpL99fHDmTGDvcbWlLZWq2oZ/wvOEdl8hrbw7BbBe0jlCHiMs7wOPu5igH7vllrcE3mz
	 Q1G9ZDmEOV5VwnHBjUs+rdzTIUl80wkZ0/NVYyC4Or/m+1aWyaQvdYlydyXcfghnICQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OteAg7Uy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE08606A31E
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 11:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OteAg7Uy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1A4D1F000C6;
	Mon, 23 Nov 2026 11:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795432206;
	bh=c0zUqEngVMb9udXMPn/SWDCsRmE2GsbJ/IrXiRi6Mo4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OteAg7UynMj5jhHDRSfO6nXtWhlYvBGUw5uvyymyJcJZENkfK5eN7qug+9Vebdj+q
	 Id2zeK8hb3ePia3on8CQOy6hmSiLvmkkmo3CAQAijhHU4pDMLdFV1FUhDs3EoXEZZG
	 MZIlhZz80ERsxts0CjOVvuIyfEvSvwts7Hqf6si9JotXlY08Tr1l6RA6Esvc7wuVTO
	 dlWUuOSZm+S25hiM/jKxEfRdL/zy1dmS1m+pjFBjeF94rOvfVhiPIvxfohxFphMOYG
	 gWMNrqxRP9WpLq3iQ3Dn++RtBfqtP5OiN8CuST9I7o3W4GeOs2ZgSEOFhdnHX38veo
	 lcVW3NNYsZnPg==
Message-ID: <sashiko-outbox-229100@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2] aqc111: Fix rx/tx_fixup issues
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261122-aqc111-v2-1-52d5ddb17a37@birger-koblitz.de>
References: <20261122-aqc111-v2-1-52d5ddb17a37@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 11:10:05 +0000
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
- [Medium] net: usb: aqc111: unnecessary skb_copy_expand() in
  aqc111_tx_fixup()
--

commit 72c72c17e1d18f31f018cbdd222d6325ba34956e
Author: Birger Koblitz <mail@birger-koblitz.de>

aqc111: Fix rx/tx_fixup issues

This commit uses unaligned little-endian helpers for RX and TX descriptors,
checks for cloned skbs in aqc111_tx_fixup(), and validates minimum packet
length in aqc111_rx_fixup().

> diff --git a/drivers/net/usb/aqc111.c b/drivers/net/usb/aqc111.c
> index 12a99df77f0d3..ee7c8bb858458 100644
> --- a/drivers/net/usb/aqc111.c
> +++ b/drivers/net/usb/aqc111.c
[ ... ]
> @@ -1224,7 +1225,8 @@ static struct sk_buff *aqc111_tx_fixup(struct usbne=
t *dev, struct sk_buff *skb,
>  	headroom =3D skb_headroom(skb);
>  	tailroom =3D skb_tailroom(skb);
> =20
> -	if (!(headroom >=3D sizeof(tx_desc) && tailroom >=3D padding_size)) {
> +	if (skb_cloned(skb) ||
> +	    !(headroom >=3D sizeof(tx_desc) && tailroom >=3D padding_size)) {
>  		new_skb =3D skb_copy_expand(skb, sizeof(tx_desc),
>  					  padding_size, flags);
>  		dev_kfree_skb_any(skb);
> @@ -1236,7 +1238,7 @@ static struct sk_buff *aqc111_tx_fixup(struct usbne=
t *dev, struct sk_buff *skb,
>  		skb_put_zero(skb, padding_size);
>  	/* Copy TX header */
>  	tx_desc_ptr =3D skb_push(skb, sizeof(tx_desc));
> -	*tx_desc_ptr =3D cpu_to_le64(tx_desc);
> +	put_unaligned_le64(tx_desc, tx_desc_ptr);

[Severity: Medium]
Does checking skb_cloned(skb) unconditionally force skb_copy_expand() on
every TCP packet even when padding_size =3D=3D 0?

Outgoing TCP skbs arrive cloned from __tcp_transmit_skb(), but
tcp_skb_entail() calls __skb_header_release(), so skb_header_cloned(skb)
is false and the headroom reserved via needed_headroom is unshared.  When
padding_size =3D=3D 0, aqc111_tx_fixup() only pushes tx_desc into headroom =
and
never touches the tail, yet this check now copies and linearizes all such
TCP packets (including nonlinear SG/TSO packets when dev->can_dma_sg is
set) under GFP_ATOMIC instead of transmitting their fragments via
build_dma_sg().

Should this check skb_header_cloned(skb) || (padding_size &&
skb_cloned(skb)), matching asix_tx_fixup()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122-aqc111-v2-=
1-52d5ddb17a37@birger-koblitz.de?part=3D1
