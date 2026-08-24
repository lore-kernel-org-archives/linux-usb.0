Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7740943B6E7;
	Mon, 24 Aug 2026 15:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787585353; cv=none; b=ZKObuIbqXMdYAVaWWXbZ9FXuHGifi7saCu4C3Bk0UGoUAmcjPdH7mx+5Gjqq6U/uhToaLEr2dX32hnjo/eGpUFTrw/Kw9Tacg45dBD8liugRMxVsMtr9K/nUCLvmeXx+8kE9BtgimxNJkoZRCq0E1xVQo4UkLFSuCcGunc2GMvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787585353; c=relaxed/simple;
	bh=Txr08HLZ8oun75IA5SfQ12Vzj5t5EVQPaKTTOlvYu4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PIkaFjWLnvfGNeKWJ5h0wMuUvI01brIG4X9pbPDYR28trgD6Qu5U5eabrib68yfwNmMhZd6lilCtfpXuBv86z35FlC6AQZZVl0tx3+41JZybxm1dIUw3XksY1TWatJIWEfS3m+MvoihZWkcIgG6ymFLczVBVNya+XKRqUcmF9IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h/5vBEeu; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h/5vBEeu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787585351; x=1819121351;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Txr08HLZ8oun75IA5SfQ12Vzj5t5EVQPaKTTOlvYu4M=;
  b=h/5vBEeuAV+BVHF/pVGQiIkXiY3d6BDfrmUe9ExuV8PP9gu1WMI+Ln+M
   hQT58SdVJ//T2PrihKgNmNwLeb3NNcPcDbbpaicwozsO9mXAc514qg+yA
   KHJ8GYMKcqysrfsMy1/kuqxskehcjDQJpp1hjy+WZkzMojg/iaLSTDOde
   0pp4NsYr8ugY+xklY2TLpxM3MjeGZQzLlZu78hJIXWbXJdc4SIOQako78
   t3ZqIsoIwKWlxFQJI6HUCVcvHk2y78fFxn/N/1SyolqDNPfk5w5KC2XPX
   jdUb/mqfSYjqn7RtA3VSFiUIUUdCDr7Bn+G2yOuPb+7vbWj1kThLKe8rB
   g==;
X-CSE-ConnectionGUID: jn38C9RzSlGhweQjmd/JWA==
X-CSE-MsgGUID: BYfly7e+Rom6EMiV8PQ+qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="91717420"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="91717420"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 08:29:08 -0700
X-CSE-ConnectionGUID: GfbTmkcnSTKlvw6xJfoecw==
X-CSE-MsgGUID: JOM3yoLCRhyzX4utB0PyFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="290549262"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.130])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 08:29:02 -0700
Date: Mon, 24 Aug 2026 18:29:00 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Haofeng Li <lihaofeng@kylinos.cn>
Cc: dan.scally@ideasonboard.com, gregkh@linuxfoundation.org,
	xu.yang_2@nxp.com, hhhuuu@google.com, kees@kernel.org,
	kai.aizen.dev@gmail.com, rdunlap@infradead.org,
	christophe.jaillet@wanadoo.fr, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, 13266079573@163.com
Subject: Re: [PATCH v3] usb: gadget: f_uvc: fix Extension Unit descriptor
 heap overflow
Message-ID: <aoxjPAo6pKWOL82N@ashevche-desk.local>
References: <49d881a6-6ada-4801-bbaf-097b08623137@ideasonboard.com>
 <20260824094456.1562456-1-lihaofeng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824094456.1562456-1-lihaofeng@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 24, 2026 at 05:44:56PM +0800, Haofeng Li wrote:
> An Extension Unit descriptor is 24 + bNrInPins + bControlSize bytes long
> (UVC_DT_EXTENSION_UNIT_SIZE(p, n)), where bNrInPins and bControlSize are
> configfs attributes each accepted over the full 0..255 range by
> kstrtou8().  uvc_configfs stores the computed size in the u8 bLength
> field of the descriptor, so once 24 + p + n exceeds 255 it silently
> wraps: p = n = 255 describes a 534-byte descriptor with bLength = 22.
> 
> uvc_copy_descriptors() reserves xu->desc.bLength bytes per Extension Unit
> in the descriptor buffer it allocates at bind time, but
> UVC_COPY_XU_DESCRIPTOR() copies the real descriptor contents, i.e.
> 22 + bNrInPins + 1 + bControlSize + 1 bytes.  With the wrapped length the
> copy overruns the allocation by up to 512 bytes.
> 
> Attack chain (write access to a UVC gadget's configfs attributes; no
> race, no USB traffic, a single bind triggers it):
> 
>     echo 255 > .../functions/uvc.0/extensions/ext.0/b_nr_in_pins
>     echo 255 > .../functions/uvc.0/extensions/ext.0/b_control_size
>       -> uvcg_extension_b_nr_in_pins_store() /
>          uvcg_extension_b_control_size_store()
>       -> bLength = UVC_DT_EXTENSION_UNIT_SIZE(255, 255) wraps to 22
>     bind the gadget to a UDC
>       -> uvc_function_bind() -> uvc_copy_descriptors()
>       -> kmalloc() sized using the wrapped bLength: 22 bytes for the XU
>       -> UVC_COPY_XU_DESCRIPTOR() writes the real 534 bytes into that
>          slot (22-byte head, 255 baSourceID, bControlSize, 255
>          bmControls, iExtension)
>       -> heap out-of-bounds write during bind
> 
> Reproduced on 7.2.0+: a stock build (FORTIFY on) can derive the remaining
> allocation size at the bmControls memcpy and BUGs in __fortify_panic()
> during bind - a deterministic kernel crash; with FORTIFY disabled for the
> file, KASAN reports "slab-out-of-bounds Write of size 255" in
> uvc_copy_descriptors() against the kmalloc-192 descriptor buffer.
> 
> Reject combinations whose descriptor does not fit into bLength at all four
> configfs entry points that can grow an Extension Unit (b_nr_in_pins,
> b_control_size, ba_source_id, bm_controls), and make uvc_copy_descriptors()
> refuse an Extension Unit whose bLength does not match its contents instead
> of overflowing the buffer.
> 
> Fixes: 0525210c9840 ("usb: gadget: uvc: Allow definition of XUs in configfs")
> Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
> Assisted-by: opencode:deepseek-v4-flash-free
> 
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

Should be no blank lines in the tag block. You may use `b4` tool (check your
Linux distro for the respective package) to automate that.

-- 
With Best Regards,
Andy Shevchenko


