Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9B549B475
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 10:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540936; cv=none; b=NNOoOKeZXE/GCVI9E/PwlBHNRwFfaZAjQd/deS5wXb3yFi+h73Bm19E1idLNeQoZjZxuQV87daAzJX9GxlrHeupoavr4ZEVBoTcW9aS4zpaUnTuTOXXgMRIpDTy/Nuo67vtw0/rr44+Ru+9xEh8PYBOQzfEF6p43XCaduNAEa7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540936; c=relaxed/simple;
	bh=P5Nm+Djm+fz6rBe6Pbdr8BtAqeAeZL4z92pL5fdgK9w=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=qGW9ksQeeaaenoCAQByeYCtNCeQfoyaFXbvBAqTfxRI3v7TnnH5acZGXBIOiRUdtYiswHqAT6LyQ662gVAQmd/wXQdtB4VgbwV/jhXDkGDBcAbxdtooKCBz8B2gDWJLHRLcBAs1V2wJJ3nviFyBZ8LAkdA9MH1eBiD9def/6L4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cLQqlai2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cLQqlai2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62A5B1F000FF;
	Fri,  9 Oct 2026 10:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540932;
	bh=15yvQPL7G4RttAs/NVot+TQJ8IH48ePrILyyspqBsI8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cLQqlai2at7b+VKOgnlHyKG3Bh4jfm8OQZKW5Xe6raj8kqsOnCaXGhw9ilmhuPDfg
	 PHc+Xg5l1TyjPSdhbLkHQhZjZDUhn4RhOC/XcoHejKLssMo8C8dIaV1QLf7lGuH/ki
	 Jgq1057WKXTepXobje+9je2V0ICaluK8Ozlvrys4mUC0MJIz/u1Qop+GVKwWeRbVJp
	 eo+1bt36qVqTbcjY1XHEj8Mmf2uo0r6W0gTGX+urOmhaLFcZ/hSBE9MuhDXut7FzeA
	 ryT+kFbB2VRppZ2Bf4wj8hKkAFuYaO6QjwRiN+ZLe8tzHBQuNgdVJN01CzLj5s54kI
	 sWpcXVt78tAlA==
Message-ID: <sashiko-outbox-165212@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/14] usb: xhci: sideband: fix ring sg table for
 sub-page TRB segments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261009095834.561578-8-mathias.nyman@linux.intel.com>
References: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
 <20261009095834.561578-8-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 10:15:32 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] usb: xhci: OOB array access and scatterlist corruption via sgt->sg=
l[i] direct indexing
- [High] usb: xhci: DMA API violation and potential panic via virt_to_page(=
) on coherent DMA memory
- [High] usb: xhci: sideband: incomplete fix as qc_audio_offload ignores sg=
->offset
--

commit 94c9b1944dfef1bf09409dc3dc3f51bb0547b9a2
Author: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

usb: xhci: sideband: fix ring sg table for sub-page TRB segments

This patch modifies xhci_ring_to_sgtable() to directly build an sg_table
instead of relying on dma_get_sgtable() and sg_alloc_table_from_pages(),
which only operate on whole PAGE_SIZE chunks. The aim is to support kernels
with larger page sizes (16K/64K) where multiple TRB segments share a page.

> diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sid=
eband.c
> index a5deeee4d5dce..beb637407e47e 100644
> --- a/drivers/usb/host/xhci-sideband.c
> +++ b/drivers/usb/host/xhci-sideband.c
[ ... ]
> @@ -9,57 +9,42 @@
>   */
> =20
>  #include <linux/usb/xhci-sideband.h>
> -#include <linux/dma-direct.h>
> =20
>  #include "xhci.h"
> =20
>  /* sideband internal helpers */
>  static struct sg_table *
> -xhci_ring_to_sgtable(struct xhci_sideband *sb, struct xhci_ring *ring)
> +xhci_ring_to_sgtable(struct xhci_ring *ring)
>  {
[ ... ]
> +	if (sg_alloc_table(sgt, ring->num_segs, GFP_KERNEL)) {
> +		kfree(sgt);
>  		return NULL;
>  	}
> =20
>  	for (i =3D 0; i < ring->num_segs; i++) {
> -		dma_get_sgtable(dev, sgt, seg->trbs, seg->dma,
> -				TRB_SEGMENT_SIZE);
> -		pages[i] =3D sg_page(sgt->sgl);
> -		sg_free_table(sgt);
> +		if (is_vmalloc_addr(seg->trbs))
> +			page =3D vmalloc_to_page(seg->trbs);
> +		else
> +			page =3D virt_to_page(seg->trbs);

[Severity: High]
Is it safe to use virt_to_page() on coherent DMA memory here?

The xHCI ring segments (seg->trbs) are allocated via dma_pool_zalloc(), whi=
ch
uses dma_alloc_coherent(). The DMA API explicitly warns that memory returned
by dma_alloc_coherent() is not guaranteed to be backed by a struct page.

On architectures where DMA memory resides outside the linear direct-map
(e.g., ARM/MIPS platforms using IOMEM or CMA reserved pools), virt_to_page()
computes an invalid pointer. The previous code safely handled this by
delegating to dma_get_sgtable(), which uses architecture-specific logic.

> +
> +		sg_set_page(&sgt->sgl[i], page, TRB_SEGMENT_SIZE,
                            ^^^^^^^^^^^^

[Severity: High]
Can this array indexing corrupt the scatterlist and cause an out-of-bounds
write?

The function sg_alloc_table() returns a chained scatterlist when the
requested number of entries (ring->num_segs) exceeds SG_MAX_SINGLE_ALLOC
(typically 128).

When i reaches 127 (the chain pointer index), sg_set_page() overwrites the
chain link, severing the rest of the list. On subsequent iterations
(e.g., i =3D 128), &sgt->sgl[i] writes into unallocated out-of-bounds heap
memory.

Should this iterate over the allocated sg_table using the for_each_sg() mac=
ro
or sg_next() instead of flat array indexing?

[Severity: High]
Does this fix leave the issue unresolved for existing callers?

While this patch adds the correct offset to the sg_table for sub-page TRB
segments, downstream consumers currently ignore it.

For example, in sound/usb/qcom/qc_audio_offload.c:uaudio_endpoint_setup():

	pg =3D sg_page(sgt->sgl);
	tr_pa =3D page_to_phys(pg);

And similarly in uaudio_event_ring_setup():

	pg =3D sg_page(sgt->sgl);
	er_pa =3D page_to_phys(pg);

These calls extract the page via sg_page() and use page_to_phys(), which
completely strips the sg->offset. On systems with PAGE_SIZE > 4096, this ma=
ps
the start of the kernel page instead of the actual segment offset, which
could cause the audio offload hardware to read from the wrong physical
location.

Will the consumers need updates to use sg_phys() instead?

> +			    offset_in_page(seg->trbs));
>  		seg =3D seg->next;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009095834.5615=
78-1-mathias.nyman@linux.intel.com?part=3D7
