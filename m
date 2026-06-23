Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4252821A92F;
	Tue, 23 Jun 2026 12:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782216381; cv=none; b=JYgGZ7OoBu/DJLGr8CO7DviLxPU/LktIH1dqopZP1iM12LlGKFqf8S6YnhwT+JKPuvvwtS0GWaE1+zgaCvRq6PDxCsSccQh1uNfhHm7fy2O5fas1sKveCJNS/mO26/w3uSB/ZjTnmLgDjHwAYMuVZQOOkq4MvTaPPJKdWqDIjM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782216381; c=relaxed/simple;
	bh=qLwu/4uxuZ8ZTGqmEajHB0b3KrS8R5SVoSH+dRkns3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WktI7B1xAnQR/+1LO0F8+vWxPgPp8nbJk2zW9TwwPgQhNuUXzr6LjocQa1qwylXHNiaPJ8EWdDMfmBpliiUHMAeSwxBB/zUwFAfP7CPZtneVIMLOs4GT7+EFV90XRH+GUBGSzutYyVNIBXJROkEo+E6LTVvBuMkvJALaH78wVJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uh/ENTq7; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uh/ENTq7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782216381; x=1813752381;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qLwu/4uxuZ8ZTGqmEajHB0b3KrS8R5SVoSH+dRkns3A=;
  b=Uh/ENTq7jtoFs048/aRBEvQNpjl3RTncvCKkk39dmIH4hInA9xmBHW9C
   0bUEcgUmpgMXVGr5tH0eYCGZaoGsup3fQJClf3/FdF+epxRMBZjBoFSNw
   JnJpI7lU16R+Ic+kUmAkhpeVzwHVt31bojcAJaFq7gTt4S5C3SRAlLMqk
   YqMQ2U9FX7G4rtNZaWAhqEVx7Av2ohp7yPhXDllpZAUqCQhOWh4Lg7ZGa
   cMcCNnTrvaqgIh2cxHFoNY46AjWYDCcvyDSQ+fuat1OmHmIQLrD9M391e
   Rzal8FHSgJ6GHYXLo2uuBsW+ZTW4Hhj0mGzI7wXqeaK4zdXvwUjbfkOMB
   g==;
X-CSE-ConnectionGUID: 277jXfUrRxeG5Ao9PgK4ow==
X-CSE-MsgGUID: GhrtaVkATSyApUBtWRtfTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="94073689"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="94073689"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 05:06:20 -0700
X-CSE-ConnectionGUID: z8eoPMGxTH+2GxWUmKkXNA==
X-CSE-MsgGUID: zqJ20BrqQvutbQ0Wx2v8Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="279683286"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 23 Jun 2026 05:06:18 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 4FE1295; Tue, 23 Jun 2026 14:06:17 +0200 (CEST)
Date: Tue, 23 Jun 2026 14:06:17 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: raoxu <raoxu@uniontech.com>
Cc: andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH tb-next] thunderbolt: stream: unmap buffers with mapped
 size
Message-ID: <20260623120617.GB3066@black.igk.intel.com>
References: <BCAED571E6DC370E+20260611064530.3495292-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <BCAED571E6DC370E+20260611064530.3495292-1-raoxu@uniontech.com>

Hi,

On Thu, Jun 11, 2026 at 02:45:30PM +0800, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> The size passed to dma_unmap_page() must match the size used for the
> corresponding dma_map_page() call.
> 
> Stream RX and TX buffers are mapped with TB_MAX_FRAME_SIZE when the
> buffer pools are allocated. However, tbstream_ring_free() currently uses
> tb_ring_frame_size() as the unmap size.
> 
> That helper returns the current frame payload size, not the DMA mapping
> size. On the TX path, tbstream_dev_alloc_tx() stores a shorter payload
> length in frame.size when the payload is smaller than TB_MAX_FRAME_SIZE.
> This happens for a short final DATA frame, and also for the CLOSE frame,
> which is allocated with SZ_256.
> 
> In those cases the buffer was mapped with TB_MAX_FRAME_SIZE, but
> tb_ring_frame_size() returns the shorter frame payload length. This makes
> the dma_unmap_page() size differ from the original dma_map_page() size.
> 
> Use TB_MAX_FRAME_SIZE when unmapping stream buffers so the unmap size
> matches the DMA mapping size used by the buffer allocation paths.
> 
> Signed-off-by: Xu Rao <raoxu@uniontech.com>

Applied to thunderbolt.git/fixes, thanks!
