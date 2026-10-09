Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D178C4DEC3D
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 13:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552933; cv=none; b=WAI2raVyvPr5ACLUIpVWkFiG2iZ6hw9Ik5ij1U5Kr7cStAtq7yOdc3h5QqSYOej7QBGOIEa/vYWxbYcB9PS5rluml8HVHEBr90WasG/XyvWoTYZprtiWIcpWKvKIGD0mVEolXSVe0q6185yjnd5pN1yjY63Gkp53fLtVZSL/8K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552933; c=relaxed/simple;
	bh=kr6DgZOdgzNep0uOtljxc9khBOFzlvrQvbtL0uRT198=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TpehFIyrjXqcCwlIeWjJyw9GNUybZThDKrtThZPiTfMKBNZInotAHY0Ij37ZCpDdZXVdjUSsss/K/20UfSk3B+EclMMthhQMvSUZqyt10I8z05Ad0QX03WM1cx3qMskFbCp83MeqgMyYU3s3NEaa5kYUETBOffXL55rCYKYiJ9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QSurRwyt; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QSurRwyt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791552931; x=1823088931;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=kr6DgZOdgzNep0uOtljxc9khBOFzlvrQvbtL0uRT198=;
  b=QSurRwytDW+726HHWPGtqe2PLfLzprf90xYEBKDD1jdbWmgevLB93lWJ
   8i8NkV+HWK2OY7EX7KEov3oMq4GYZxhGf5zQD/T9NqjFa9bLeX0cHw3Sq
   JROftxPPHG90BCCtQ1OkO2z0O8nBbH5l074Luw+8x28alZEb96WTajNC+
   9Va2K3UMubJwKY6XTgN1L2fdzLUWtG8NoDDVOYzsI66JZnOGGRNCCW3U4
   normwCBDeoC/yGis7v0LoMdLl33Wd0X0zRfE1QrDa23PTPwo0US6FkhJr
   NrwmerH599ZBSPWaqbJxX4gK62I+u7X8ptTkshSnwREvd3Q168IqIfSSy
   Q==;
X-CSE-ConnectionGUID: TTL2vHKyQYiDqHIAYvkXVA==
X-CSE-MsgGUID: 8me71kG5SWa9dwCogF17BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="347004"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="347004"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 06:35:31 -0700
X-CSE-ConnectionGUID: gstIXpnlRh6Uul9T5Ch6Kg==
X-CSE-MsgGUID: iIhIzZPzTD+9KRpeGFUFwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="645013"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO [10.245.244.17]) ([10.245.244.17])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 06:35:30 -0700
Message-ID: <7b9c9a09-9954-48ff-9377-ed1d4b2bda44@linux.intel.com>
Date: Fri, 9 Oct 2026 16:35:27 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/14] usb: xhci: sideband: fix ring sg table for sub-page
 TRB segments
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org, Wesley Cheng <wesley.cheng@oss.qualcomm.com>
References: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
 <20261009095834.561578-8-mathias.nyman@linux.intel.com>
 <sashiko-outbox-165212@kernel.org>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <sashiko-outbox-165212@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/26 13:15, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] usb: xhci: OOB array access and scatterlist corruption via sgt->sgl[i] direct indexing
> - [High] usb: xhci: DMA API violation and potential panic via virt_to_page() on coherent DMA memory
> - [High] usb: xhci: sideband: incomplete fix as qc_audio_offload ignores sg->offset
> --
> 
> commit 94c9b1944dfef1bf09409dc3dc3f51bb0547b9a2
> Author: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> 
> usb: xhci: sideband: fix ring sg table for sub-page TRB segments
> 
> This patch modifies xhci_ring_to_sgtable() to directly build an sg_table
> instead of relying on dma_get_sgtable() and sg_alloc_table_from_pages(),
> which only operate on whole PAGE_SIZE chunks. The aim is to support kernels
> with larger page sizes (16K/64K) where multiple TRB segments share a page.
> 
>> diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
>> index a5deeee4d5dce..beb637407e47e 100644
>> --- a/drivers/usb/host/xhci-sideband.c
>> +++ b/drivers/usb/host/xhci-sideband.c
> [ ... ]
>> @@ -9,57 +9,42 @@
>>    */
>>   
>>   #include <linux/usb/xhci-sideband.h>
>> -#include <linux/dma-direct.h>
>>   
>>   #include "xhci.h"
>>   
>>   /* sideband internal helpers */
>>   static struct sg_table *
>> -xhci_ring_to_sgtable(struct xhci_sideband *sb, struct xhci_ring *ring)
>> +xhci_ring_to_sgtable(struct xhci_ring *ring)
>>   {
> [ ... ]
>> +	if (sg_alloc_table(sgt, ring->num_segs, GFP_KERNEL)) {
>> +		kfree(sgt);
>>   		return NULL;
>>   	}
>>   
>>   	for (i = 0; i < ring->num_segs; i++) {
>> -		dma_get_sgtable(dev, sgt, seg->trbs, seg->dma,
>> -				TRB_SEGMENT_SIZE);
>> -		pages[i] = sg_page(sgt->sgl);
>> -		sg_free_table(sgt);
>> +		if (is_vmalloc_addr(seg->trbs))
>> +			page = vmalloc_to_page(seg->trbs);
>> +		else
>> +			page = virt_to_page(seg->trbs);
> 
> [Severity: High]
> Is it safe to use virt_to_page() on coherent DMA memory here?
> 
> The xHCI ring segments (seg->trbs) are allocated via dma_pool_zalloc(), which
> uses dma_alloc_coherent(). The DMA API explicitly warns that memory returned
> by dma_alloc_coherent() is not guaranteed to be backed by a struct page.
> 
> On architectures where DMA memory resides outside the linear direct-map
> (e.g., ARM/MIPS platforms using IOMEM or CMA reserved pools), virt_to_page()
> computes an invalid pointer. The previous code safely handled this by
> delegating to dma_get_sgtable(), which uses architecture-specific logic.
> 
>> +
>> +		sg_set_page(&sgt->sgl[i], page, TRB_SEGMENT_SIZE,
>                              ^^^^^^^^^^^^
> 

Not sure, not familiar with this. Needs to be investigated


> [Severity: High]
> Can this array indexing corrupt the scatterlist and cause an out-of-bounds
> write?
> 
> The function sg_alloc_table() returns a chained scatterlist when the
> requested number of entries (ring->num_segs) exceeds SG_MAX_SINGLE_ALLOC
> (typically 128).
> 
> When i reaches 127 (the chain pointer index), sg_set_page() overwrites the
> chain link, severing the rest of the list. On subsequent iterations
> (e.g., i = 128), &sgt->sgl[i] writes into unallocated out-of-bounds heap
> memory.
> 
> Should this iterate over the allocated sg_table using the for_each_sg() macro
> or sg_next() instead of flat array indexing?

sg_next() could be better, but this isn't a high priority issue as we are very
far from any chained scatter-gather list limit.

xhci transfer rings usually have 2 segments. Can possibly be 4 or 8 in future if
we add ring expansion support to offloaded endpoints.

> 
> [Severity: High]
> Does this fix leave the issue unresolved for existing callers?
> 
> While this patch adds the correct offset to the sg_table for sub-page TRB
> segments, downstream consumers currently ignore it.
> 
> For example, in sound/usb/qcom/qc_audio_offload.c:uaudio_endpoint_setup():
> 
> 	pg = sg_page(sgt->sgl);
> 	tr_pa = page_to_phys(pg);
> 
> And similarly in uaudio_event_ring_setup():
> 
> 	pg = sg_page(sgt->sgl);
> 	er_pa = page_to_phys(pg);
> 
> These calls extract the page via sg_page() and use page_to_phys(), which
> completely strips the sg->offset. On systems with PAGE_SIZE > 4096, this maps
> the start of the kernel page instead of the actual segment offset, which
> could cause the audio offload hardware to read from the wrong physical
> location.
> 

There are other issues with PAGE_SIZE > 4096 than this.

Wesley has a series that addresses these issues together with this client side change

I'll drop this for now.

We can take this patch later together with the rest of the > 4096 page size + custom
dma pool series.

Wesley, any idea about the virt_to_page(seg->trbs) issue?

Thanks
Mathias
