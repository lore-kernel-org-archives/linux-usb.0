Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279354;
	b=26/uAdn3PlnRJnDMZc0JvrnNwRSGfQ6dA0wecS1gS0LFQHPofpSZ6mfRhknIBRX3kU0f
	 WSacL4j9FVkYq2Vntc+bP3TsW8B5XdIKBcqpJIoMLkzW8R3UDykb8rPsPbNFnyN5+/hE8
	 59GIQ+qonOIKw6cTqRponsbnWIAm0KaSvzITZ4txq5Io/NS2pTRygtRiYXsFI7jeudN7/
	 l4mJ0DjpdI3neAnYaovAHa+BXkZBslrLnQ6MA9aQGQ691d1FgPBrO501+rptwAN7xnSGK
	 E9wd2uqO2boEhK1CDtwNLZi1ZHkmGba+3TSAy+0aPoNTkiXEMklbHzZ/3Io5wddDPVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279354;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FBdSGJFtSwVH7PhbNeNMPzXO3sAKIJsbmi/KsW8UgOg=;
	b=ukLMPyehaueVBjF/qA6Islt9Vq7sI9NGWbwztbZDddR/zT207AcYas6ltx6FuYSpG7T/
	 t/jjPPlcavRS90l6HCckgU9NLadB3qoluxveoQNYMxzsg5FWCmnenMlz3b4wejfU/lQtY
	 KZ5h+pI2Exx94YAxc0rjEw/FkO4UOTVtvWW+NXXXf9j24Mh/gtnFuriIg+LMXl9N+7WQy
	 tCFpm13HIuMW97zDUoUg7CNhyYKGqMlifRpQ25Jzgw9zWGxiA3VJkzb7uT6AAQcxU8bn5
	 gvBCquLQeNVSjCXvBPxenlQgrI/5U0jD4hSlwxiUanTn6SZcseE+CCzZr9nfAdYI1LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y+fBeXWq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFAA60A260C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 02:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y+fBeXWq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D3E1F0089F;
	Tue, 10 Nov 2026 02:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794279353;
	bh=FBdSGJFtSwVH7PhbNeNMPzXO3sAKIJsbmi/KsW8UgOg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y+fBeXWqHDPQzo8GstSMLlkkmy6nRU49WOfL8RlrLwsdBSqPKscQo+OOkBXl9siqU
	 LXkD6JlIfer1GrPWh4saeMQExjNEI9eS/W7GDI2GDeXn4wE84irDOMe12tPLjy35pT
	 7rzECjiZC7DzjVmpDgmFgowNt/300zVyNKvoqF/fWWYQXO+Nb/6yM0V4wU4Gxmf+Iv
	 0pE+9zNO1KtWbyfLySMgOmfpqs11xmVniagFg1tGLuLyanRxi+lVEcrqBKuBJIFD+8
	 gwkFB87jQWxgHpgZDFWSZU3K3txriC0RVDK+OfED7WmwhD7Au875b67eESr6mQ/iaN
	 Mv7DUQmd8hNtQ==
Message-ID: <sashiko-outbox-206072@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/4] usb: xhci: Allocate sideband ring segments with
 dma_alloc_coherent()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wesley Cheng" <wesley.cheng@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261109-16k_offload_v1_b4-v6-2-858c6e0e007d@oss.qualcomm.com>
References: <20261109-16k_offload_v1_b4-v6-0-858c6e0e007d@oss.qualcomm.com>
 <20261109-16k_offload_v1_b4-v6-2-858c6e0e007d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 02:55:53 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Ring segments are normally allocated from a shared DMA pool sized and
> aligned to TRB_SEGMENT_SIZE (4096 bytes). On kernels built with a
> larger PAGE_SIZE (e.g. 16K or 64K page arches), multiple segments can
> share the same physical page.
>=20
> A sideband client that maps a ring buffer directly via the IOMMU
> (which operates at page granularity) would then also expose any other
> ring segment sharing that page, as well as the dma_pool bookkeeping
> kept in free blocks, to the entity handling the offloaded endpoints.
>=20
> Add a no_pool_alloc flag for endpoints and rings, which has the ring
> segments allocated with dma_alloc_coherent() instead of from
> xhci->segment_pool. Coherent allocations are page aligned, so each of
> these segments gets a page of its own. When PAGE_SIZE is larger than
> TRB_SEGMENT_SIZE, xhci_sideband_add_endpoint() sets the flag for the
> [ ... ]
> expansion for these rings.
>=20
> Suggested-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-16k_offloa=
d_v1_b4-v6-0-858c6e0e007d@oss.qualcomm.com?part=3D2

