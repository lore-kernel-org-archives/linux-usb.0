Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC5F3859CC;
	Mon,  9 Mar 2026 11:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773056396; cv=none; b=TB2vn79ieR1MiKIIwrX8lZHiGPjnQisc5IHjWNKPuZ33WUKejehcQEVwEASdBoNZJQXXFbALaDNpdhDlfH0wBiy77BjoOkrBTqryLfipZBEDOHpnxwp44ixuTFHTr2gvkQd1ubjzN82SGfLuuKuj1aUEwnRr/+RhK1wGp3UaweY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773056396; c=relaxed/simple;
	bh=5kH7rM4A3wBzRs+D27ZC0YR8nWZ8/2IpGYde30p/ekg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bec7d0fTRNThcvVf/OrDBSBZBzlQ3dCS76MqOyWQftGLT00ZUCCHcFCFlunS7ibmtG/BCPTPuGFKRI5N+wb2BmGPfbkw1YVCI8O1w5jF7fOgowKiR3CWUZBFkUbwUe8kxTzmLF/UIueRFsQxQXMGuRfYUMaFOWIKr3tNeHf8j7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HkIK26wH; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HkIK26wH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773056396; x=1804592396;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5kH7rM4A3wBzRs+D27ZC0YR8nWZ8/2IpGYde30p/ekg=;
  b=HkIK26wHHdiaS0uZ5E8LAw8WkT/BT3ZKRpvzohsEfJzoOmuaSHB/GvSX
   RNDuI/yzG/DM+Ml2/Vm/CAmFSoHe76QYQ+nkXdxV4sakYL6SyJFki2Unv
   vRKaQ0a6VSAJ6aob2PemjoGIPDA6jPDrFmuyJrS00B4cXcdKNXMTCxVkQ
   FPzEy5mQvMpUQEW0aNgJBACWct0dL5j4TDT8xRSfRq0mf+fRvqOcD8r8d
   tGk3dx0/LxwV9R9V3XKjR+R46MEXperhSIBtu7NNTr+BqG8V0GzulN+rH
   U7rCLhZQpq1nbDmmXnXPpjnbbaBPkx2t/IdrhQRyv4dkKYjrvo1C/y7M1
   A==;
X-CSE-ConnectionGUID: oWiLOZCoRxuiZL4Z31ShJA==
X-CSE-MsgGUID: 96BhQ5w8Q7+u37u1tEMdJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="73976744"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="73976744"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 04:39:56 -0700
X-CSE-ConnectionGUID: Xlp3+UJcTd2+lu0iFlFrnA==
X-CSE-MsgGUID: k23ClFsDSainDds3rqyz5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="216248399"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 09 Mar 2026 04:39:53 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 3097998; Mon, 09 Mar 2026 12:39:52 +0100 (CET)
Date: Mon, 9 Mar 2026 12:39:52 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Raanan Avargil <raanan.avargil@intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] thunderbolt: nhi: Don't act on random stack values
Message-ID: <20260309113952.GL2275908@black.igk.intel.com>
References: <20260309-topic-tbt_fixup-v1-1-c600d59f75a2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260309-topic-tbt_fixup-v1-1-c600d59f75a2@oss.qualcomm.com>

On Mon, Mar 09, 2026 at 10:39:49AM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> device_property_read_foo() returns 0 on success and only then modifies
> 'val'. Currently, val is left uninitialized if the aforementioned
> function returns non-zero, making nhi_wake_supported() return true
> almost always (random != 0) if the property is not present in device
> firmware.
> 
> Invert the check to make it make sense.

Good catch!

> Note device_property_read_bool() would not be fitting here, as both
> 0 and (presumably) 1 seem to be acceptable values if the property is
> present at all.

I think all the systems out there just have this 1 which is why it has been
"working" so far.

> Fixes: 3cdb9446a117 ("thunderbolt: Add support for Intel Ice Lake")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Marked for stable and applied to thunderbolt.git/fixes, thanks!
