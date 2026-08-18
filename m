Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7EA1DF248
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 07:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787038188; cv=none; b=PDRPrq6rGVTJclV5pU+T3hs5A3LsGcCWeqrJHQUPxMSLHNyE45MeiG1GVCrwyHfTK61W6hwarw3ytaY+luMS9y51D6RHO7TCCgGmd9g/AFxTJtVbh+Gyx65DwgFByZc6WF6lFAslhdb9/9EHk60XxBiXGPK4upgoICWr5/CWe8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787038188; c=relaxed/simple;
	bh=jYnzGtNDO9wqiqgUTpF7vu+llWrxoF9lMe3BleW4Okw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RnMYxZLNa+1YNDCxHlN+iMXZkKiP6cfyGXj0S3vfrReOgMroghFXA9x4QUXjw6RpzTTDZRiM8pS9cPqBYCYu8uMQVIUxPhj4h2QWtFLVw3y3+VaCFkXWJU+XzammXBkqqGB/s9+ZWURxJ4powCuJtQx7pvN0js1YaW6PxydXxKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m2J+ts1M; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m2J+ts1M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787038186; x=1818574186;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jYnzGtNDO9wqiqgUTpF7vu+llWrxoF9lMe3BleW4Okw=;
  b=m2J+ts1MZKT5KaNNaw34X0wE+PTR3KsaHGuZltu1J3hz/20kp5riePfu
   ilTt4ChdZi2gJoSFHn6ky+wuznmTuMc7VpY9D66suZfxl2fCiTx5J59Qj
   DlICn91ySe6oUlQsMLuakjx8dXq61TNEXD+kgMZjwLbrWa392bSoGRe8R
   8xLs+VYvDmPiqhjHvxVogqIIUnpZWLEnmEirA0P/bQN8X5T/J0158ufbK
   QzLSx8eY4R1uPgktJPlTUzfpKgnY4uRHZJENWoDo8d6y1QV6UKlvI92Y+
   qVL4OHzxyZaLwtDd93FVCT/c8VB/hyo2NG2k4aSqPM16kqubXjGXcXZ9s
   Q==;
X-CSE-ConnectionGUID: DSsg721iQkiDzHx7G967Gg==
X-CSE-MsgGUID: rW6ls8CKTYyjH36OzYF3vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98113513"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="98113513"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 00:29:46 -0700
X-CSE-ConnectionGUID: Qyi1DfO7RnO3kK239RuaoA==
X-CSE-MsgGUID: rbwp9ccgRkyK5LeOQJsxVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="258938206"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO [10.245.245.232]) ([10.245.245.232])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 00:29:44 -0700
Message-ID: <f1671140-f1e3-4afe-a806-c3f82587eab6@linux.intel.com>
Date: Tue, 18 Aug 2026 10:29:41 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xhci: fix lost bounce buffers on TDs spanning several
 ring segments
To: Michal Pecio <michal.pecio@gmail.com>,
 Arthur Gautier <baloo@superbaloo.net>
Cc: linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
References: <20260812002554.1166712-1-baloo@superbaloo.net>
 <20260818004828.1d6e1c76.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260818004828.1d6e1c76.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/18/26 01:48, Michal Pecio wrote:
> On Wed, 12 Aug 2026 00:25:54 +0000, Arthur Gautier wrote:
>> When a TD reaches a link TRB with data that is not aligned to the
>> endpoint's wMaxPacketSize, xhci_align_td() stages the unalignable tail
>> through the bounce buffer of the ring segment holding that link TRB.
>> xhci_unmap_td_bounce_buffer() later unmaps it and, for IN transfers,
>> copies the data back into the URB's buffer.
>>
>> The enqueue path records the segment that was bounced in td->bounce_seg,
>> under the assumption that a TD never spans more than two ring segments.
>> That assumption does not hold: a TD large enough to span three or more
>> segments crosses several link TRBs and can be bounced at each of them.
>> Only the last one survives in td->bounce_seg, so every earlier bounce
>> buffer is neither copied back nor DMA unmapped.
>>
>> The URB still completes with actual_length equal to the requested length
>> and no error, so the transfer looks successful while a wMaxPacketSize
>> sized hole in the destination buffer silently keeps its previous
>> contents. It also leaks a DMA mapping per dropped bounce.
>>
>> Any sufficiently large and fragmented bulk transfer can hit this. It was
>> found with a USB mass storage device behind xHCI backing a dm-verity
>> target with 512 byte hash blocks, where the stale data is detected rather
>> than silently consumed. The device enumerates as SuperSpeed, so
>> wMaxPacketSize is 1024, while dm-bufio issues one 512 byte bio per hash
>> block. verity_prefetch_io() makes the block layer merge hundreds of them
>> into a single request of up to 512 scatterlist entries of 512 bytes each.
>> At 256 TRBs per ring segment such a TD spans three segments, and every
>> segment boundary falls on an odd multiple of 512, i.e. unaligned to
>> wMaxPacketSize. dm-bufio then caches a hash block holding stale data and
>> dm-verity declares the metadata block corrupted:
>>
>>    device-mapper: verity: 8:2: metadata block 10850 is corrupted
>>
>> A reproducer running this under qemu is available at
>> https://github.com/baloo/xhci-verity
>>
>> The bounce state (bounce_buf, bounce_dma, bounce_len, bounce_offs)
>> already lives on the ring segment, so there is nothing extra to track.
>> Keep recording the last bounced segment in td->bounce_seg and, on
>> completion, walk the segments from td->start_seg up to it, unmapping
>> every segment that still has a pending bounce.
>>
>> Stopping at td->bounce_seg rather than td->end_seg matters: a bounce
>> implies the TD continues past that segment's link TRB, so bounce_seg is
>> always strictly before end_seg, and a later TD may already have started
>> in end_seg and been bounced there. Walking that far would copy a foreign
>> bounce buffer into this URB and unmap it twice. It also keeps the walk
>> correct if a TD ever wraps the whole ring so that end_seg == start_seg.
>>
>> Changes since v1:
>> - Walk td->start_seg -> td->bounce_seg instead of td->bounce_seg ->
>>    td->end_seg. end_seg can hold the start of a later TD which may
>>    already have been bounced there, so the v1 walk could copy a
>>    foreign bounce buffer into this URB and unmap it twice.
>>    (caught by Mathias and Michal)
>> - Keep recording the last bounced segment. Also handles a TD
>>    wrapping the whole ring.  (suggested by Michal)
>> - Test !td->bounce_seg first, it is the common case. (Michal)
>>
>> v1: https://patchwork.kernel.org/project/linux-usb/patch/20260811033508.1050148-1-baloo@superbaloo.net/
> 
> This should go below the --- line.
> Patch revision log is *not* meant to go into the kernel changelog
> 
>> Fixes: f9c589e142d0 ("xhci: TD-fragment, align the unsplittable case with a bounce buffer")
>> Suggested-by: Michal Pecio <michal.pecio@gmail.com>
>> Signed-off-by: Arthur Gautier <baloo@superbaloo.net>
> 
> This should still have the Cc: stable line, just no need to actually
> send email there. OTOH, this email should be addressed to Mathias Nyman
> and Greg KH, not only linux-usb (but don't list them here).
> 
> I admit that I send patches manually like a caveman, so I don't know
> how to configure git send-email to get it right...
> 
> That being said, I downloaded and applied this patch and it does seem
> to work. The bug is easy to repro by setting TRB_MAX_BUFF_SIZE to 512.
> Before the patch, reading a 1GB partition gives different md5sum each
> time. With the patch, multiple readings are correct.
> 
> And I think we can agree that the risk of unmapping a later TD's bounce
> buffer no longer exists with the revised loop. I know I said the same
> about v1, but I think this time it should be good for real.
> 
>> +	for (seg = td->start_seg; ; seg = seg->next) {
>> +		if (seg->bounce_len)
>> +			xhci_unmap_one_bounce_buffer(xhci, ring, td, seg);
>> +		if (seg == td->bounce_seg)
>> +			break;
>> +	}
> 
> You have removed protection from infinite looping. I think nowadays the
> driver has more loops without such protection and everytihng is fine,
> but I'm not sure how it was in the past, and this patch goes to stable.
> 
> Maybe let's see what Mathias thinks about it.

Thanks for adding me back to the loop (cc)

The infinite loop risk could be prevented by using xhci_for_each_ring_seg():

xhci_for_each_ring_seg(td->start_seg, seg) {
	if (seg->bounce_len)
		xhci_unmap_one_bounce_buffer(xhci, ring, td, seg);
	if (seg == td->bounce_seg)
		break;
}

Maybe one more patch revision fixing both this, and the details Michal pointed out
earlier would make sense

Thanks
Mathias

