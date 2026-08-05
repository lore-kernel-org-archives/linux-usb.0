Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF78033F5B3;
	Wed,  5 Aug 2026 17:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785950481; cv=none; b=mp+QcO0pHzNujMPpGxhIqPw2uA/9iWGW2bXMDBXHjEP00zzoAWPrHZga2mMTDy6Uv2L2tKXrq7+vr++q+GUEbMZmSYmojRQC73f+EP3v1iBnXaa+zChopJYUMTQpu1Kt+IZmr1KN7TJX9k8PQy5AAhkSDhBEh7tiT0cTrB4f8v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785950481; c=relaxed/simple;
	bh=NGU962D1cH0DPByVbevoCBTYVIJv3sTp2O5G5KppSxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pyB/VTXcnGIbrLHQi5UH5dZhgbcXcYqsta7CRQLWkSil9TKBeDm75kXW3O6mri2HNlxNeW+ajq5UzyycovnyNevnO1CaPP9tm3tR/Y+6ZaNpT7MteB4BO8jddyxgt1DW8h2d9MZhKc6Uwx3aEVaicmrCDMOwxTivOUd81GNsTcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OLHgBvQW; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OLHgBvQW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785950480; x=1817486480;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=NGU962D1cH0DPByVbevoCBTYVIJv3sTp2O5G5KppSxw=;
  b=OLHgBvQWNy4MR1hHlJYllhN/XR2nbC60ncR5OmMMGFS2bwzF2vTif1m/
   oFs56Th+WZTYjAUEFWNDF5kUdmymOnhQ02wwfl10lCl9jbwIeui1HLKfK
   3NKDATcnHsz+zk9nMcqdMuEQgxeMq+d0zwlxH/iQzruEQptJzKt1zrRAa
   Adrkw9a1k5tuPM1tqBWb021IrSDUCWI95ccutwzejAkPXRTyMRxTIrKvT
   jDbLsqjxOPdAemPlY36pKq88PiDviyckhNN+4Jg4frcpaLhKZk1pZL+Hq
   dXxQvwd3V9Zz34Wtpgisp8vvLshIDLiUBBtwwxk1lQXlzfj45DIKnDdto
   Q==;
X-CSE-ConnectionGUID: RzqdCpIcShGb6xF4rPogcA==
X-CSE-MsgGUID: P3IH+w52S4KXTK9Uq1nVLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86737673"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="86737673"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 10:21:19 -0700
X-CSE-ConnectionGUID: WsQhxwmcTkS9D5/EX90miQ==
X-CSE-MsgGUID: uy0PFAs9R9WDS53cxR4V6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="266997160"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO [10.245.244.51]) ([10.245.244.51])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 10:13:16 -0700
Message-ID: <b63de7e6-c118-43e3-9d4e-5bb517b03e14@linux.intel.com>
Date: Wed, 5 Aug 2026 20:13:13 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] usb: xhci: Handle bogus TRB pointers in Missed
 Service Error events
To: Michal Pecio <michal.pecio@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bart Nagel <bart@tremby.net>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260804120110.01bda0e2.michal.pecio@gmail.com>
 <20260804120226.1e72ff24.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260804120226.1e72ff24.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/4/26 13:02, Michal Pecio wrote:
> xHCI 1.0 allowed these pointers to be zero. Some Intel chipsets from the
> era usually set it to zero, but sometimes (apparently) to the next TRB
> after the one referenced by the previous transfer event on the endpoint.
> 
> Usually that's indeed the missed TD, but it may also be the last TRB of
> a two-TRB TD already completed with Short Packet on its first TRB. Then
> the driver skips all pending TDs, failing to find a match.
> 
> When handling Missed Service Error, scan TD list twice and only really
> skip TDs in the second pass if the first pass found a match. This won't
> catch bogus pointers to wrong TDs, but such a bug would be practically
> impossible to detect automatically and isn't known to exist.
> 
> Reported-by: Bart Nagel <bart@tremby.net>
> Closes: https://lore.kernel.org/linux-usb/al_hchyOdPoPWKEo@spiral/
> Suggested-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Fixes: d0b619599e52 ("usb: xhci: Expedite skipping missed isoch TDs on modern HCs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> ---

Thanks, I'll send this [PATCH 1/5] forward to 7.3 with rest of patches in for-usb-next

-Mathias


