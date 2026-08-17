Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C75175A6B;
	Mon, 17 Aug 2026 15:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786978860; cv=none; b=Dyf37DJ35zngbLC6d2qv4q0neCpDTE3s9Lrtrcvi7zMZtJJUe+b+wv5Vh4gk+kzxJL2cCsss6gM2A5KQz4if+tKAuBFoRY9WWM6bbn2IhCYmHDbBv4tvGl6GaIubbcWfno02dgthPZiO3nY5gGcVPq3ZeR/TTmBu/MLT1VmtCvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786978860; c=relaxed/simple;
	bh=lKd4pWyd/rZPlq/Ux63G+AJ8ooe3gMQslMM6zRt41VI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D6bRvzd8IM9WzzbhfiGH+SLsOK5Md7QLUrTTQ+MvvRBpvlzfX8NFUE13SnGsY1nSOHet6D0A0VaSGV//MlqY5GyJpHW1A6Ahx+dpp4GwQw0Dpm4tdGNL9rt4AHQPL+Evo8n9UYJXzVGj+JQDKl/AYaC5e1OXLC3NZ+HjkdGfTf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MQbbf1hI; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MQbbf1hI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786978858; x=1818514858;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=lKd4pWyd/rZPlq/Ux63G+AJ8ooe3gMQslMM6zRt41VI=;
  b=MQbbf1hI04JEOwnr/fM5wASxZBWIaAUaSFTTAkzFXTYUI/dtjgLdjiFX
   4mPriMtdmPre21rS4byZPOm5HGKxLZivXil0USKKs/Pr6uKYtRaqF+VZF
   0L27UdCNnAdkuiI8YBh48ywbQK+Mq9b32kMj6G1Bi/o6wzSJ5GvpKguyM
   Nfjq7HBnRkAcivvm4BZjRKqhXormAlPa8tSK1c/FJVCCwJgA5crCygo5+
   fTIV45YPKeaG3uEm4Ck9fudKGPL0xX6+TYPClYPuUo7nXagRdABs4sTwX
   MOQFPUiQICHw7/WD6iOdsL47IjHugCVjUQF/QaQVBUoT1hA9fhKmGU5wN
   Q==;
X-CSE-ConnectionGUID: AkCCwETrQnmvBG+OKE8rsg==
X-CSE-MsgGUID: U8UYtM3xTymncRPMi5Nm/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="104990548"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="104990548"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 08:00:57 -0700
X-CSE-ConnectionGUID: bCR45RmAQ3uvpUz94b0g5Q==
X-CSE-MsgGUID: 0Hkl2vszSy+RU+ViK+EdqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="263594322"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.67])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 08:00:56 -0700
Date: Mon, 17 Aug 2026 18:00:53 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 1/1] usb: f_mass_storage: Bump local buffer size in
 fsg_common_create_luns()
Message-ID: <aoMiJSUsXVBvCzQY@ashevche-desk.local>
References: <20260817104734.1031300-1-andriy.shevchenko@linux.intel.com>
 <fd2a7c76-c900-4ccd-92bc-d1205fe16d87@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd2a7c76-c900-4ccd-92bc-d1205fe16d87@rowland.harvard.edu>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 17, 2026 at 09:47:45AM -0400, Alan Stern wrote:
> On Mon, Aug 17, 2026 at 12:47:34PM +0200, Andy Shevchenko wrote:
> > GCC is not happy about the buffer size:
> > 
> > drivers/usb/gadget/function/f_mass_storage.c:2970:48: error: ‘%d’ directive output may be truncated writing between 1 and 9 bytes into a region of size 5 [-Werror=format-truncation=]
> > 
> > Bump the size to get it enough for all possible values.
> > 
> > Note, the existing comment is wrong as size 8 for the whole buffer doesn't
> > cover 100 mil numbers, hence drop it altogether.
> 
> It seems highly unlikely that anyone would ever want to create 100 million
> LUNs.

Completely agree (but see below).

> Why not limit the number of LUNs to some more reasonable value, like 1000?

I chose the robust way as different versions of the compiler may or may not
that limit (yes, we had such a case in the past [1] and it required to replace
also specifier and variable type altogether. Given that, I'm not feeling to
rework that way. Up to you to implement, though. If you think this patch is
not good enough, consider this then as a bug report (with `make W=1` it breaks
the build, exactly what my case is).

Thanks for the review.

[1]: 239afba8b9f3 ("leds: pca955x: Avoid potential overflow when filling default_label (take 2)")

-- 
With Best Regards,
Andy Shevchenko


