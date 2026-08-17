Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C7F2F7F05;
	Mon, 17 Aug 2026 16:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786982556; cv=none; b=GwOszixt/5aq6vfoXGesKEEFpc+OLe/pNBa5T+21ntbHm0HoimpCORWUE1ewFE5uotSODKMwwl/HlxKUrDUe9U8ULh69T1lfKsxhI62ug5dYlY8WNvgupPtVnn6FX3hIL3BElJ2YYlz74UUWy+Wl4+ZxulN9FEoQ5zj0/V2BE24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786982556; c=relaxed/simple;
	bh=RQjMumToq+ogHnDURYB7PJgB56FGbTim1Q6u6fiTj88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EOZFzw9kJUSaxjRyYDbyY+LOdEYTTtdMmmr6YPVt5B0Lvdm0AEh5F9Td2yRWqK/XQKZwJZsaez0rkQh1EC5sr5ifQ5+LYayGYxZOxQiTYhW2NCuF8yG4xlmZMd/rm2YKOu24PPOvMFb1SfPil0w1Pa30vRcNB0bYc5YUeDQbxXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GN4nTWE+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GN4nTWE+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786982554; x=1818518554;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=RQjMumToq+ogHnDURYB7PJgB56FGbTim1Q6u6fiTj88=;
  b=GN4nTWE+o7jCoaIptImmoEE5WZ34F+A++R3diAfBZj9nJsm8V4dpsu9j
   Os7w9B/KPVaLKBhI+/DumORN8S2qMKcnHxR7f3umLFvBP8xUsnmvV0JeX
   7ewg/fCmeQRAr9O+1Y+7UYf3Qown9/sKqjH3gAmEhM6pElHkF1896SdQI
   PRK0AQrQkh6BAECBGr4l7qDBUcJpEVHW5c/lpmWRuDotC0XBcFrw/EHJG
   Jv0GHGdY5hiO38MyCuuornwdf2AhUWZ2NR/+R5Ad6qzuTcWx+WstCdfRd
   nyEf+JeLZQ42lO/7Yp77vDzB+3mb8YrG4btmzGTeXtNUJlmkgLxTtH96r
   w==;
X-CSE-ConnectionGUID: VSKvZtCsRjeI/256e8N8Dw==
X-CSE-MsgGUID: s5iNlWFXQAqdRg4oor5RUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="113005699"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="113005699"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 09:02:33 -0700
X-CSE-ConnectionGUID: fBbK1dd3Qiy52kDuO6fJOg==
X-CSE-MsgGUID: KstlhxbvREKYbDQykg+RLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="264990317"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.67])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 09:02:32 -0700
Date: Mon, 17 Aug 2026 19:02:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 1/1] usb: f_mass_storage: Bump local buffer size in
 fsg_common_create_luns()
Message-ID: <aoMwlehUK1U3lBIx@ashevche-desk.local>
References: <20260817104734.1031300-1-andriy.shevchenko@linux.intel.com>
 <fd2a7c76-c900-4ccd-92bc-d1205fe16d87@rowland.harvard.edu>
 <aoMiJSUsXVBvCzQY@ashevche-desk.local>
 <64cf03c6-0337-4cf9-9d26-0fdf1406902f@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <64cf03c6-0337-4cf9-9d26-0fdf1406902f@rowland.harvard.edu>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 17, 2026 at 11:31:51AM -0400, Alan Stern wrote:
> On Mon, Aug 17, 2026 at 06:00:53PM +0300, Andy Shevchenko wrote:
> > On Mon, Aug 17, 2026 at 09:47:45AM -0400, Alan Stern wrote:
> > > On Mon, Aug 17, 2026 at 12:47:34PM +0200, Andy Shevchenko wrote:
> > > > GCC is not happy about the buffer size:
> > > > 
> > > > drivers/usb/gadget/function/f_mass_storage.c:2970:48: error: ‘%d’ directive output may be truncated writing between 1 and 9 bytes into a region of size 5 [-Werror=format-truncation=]
> > > > 
> > > > Bump the size to get it enough for all possible values.
> > > > 
> > > > Note, the existing comment is wrong as size 8 for the whole buffer doesn't
> > > > cover 100 mil numbers, hence drop it altogether.
> > > 
> > > It seems highly unlikely that anyone would ever want to create 100 million
> > > LUNs.
> > 
> > Completely agree (but see below).
> > 
> > > Why not limit the number of LUNs to some more reasonable value, like 1000?
> > 
> > I chose the robust way as different versions of the compiler may or may not
> > that limit (yes, we had such a case in the past [1] and it required to replace
> > also specifier and variable type altogether. Given that, I'm not feeling to
> > rework that way. Up to you to implement, though. If you think this patch is
> > not good enough, consider this then as a bug report (with `make W=1` it breaks
> > the build, exactly what my case is).
> 
> Okay, now I get it.  The compilers' limitations are a big part of the 
> reason for this change.
> 
> And looking through the code, I see the only way that the existing 
> drivers ever construct a struct fsg_config is by calling 
> fsg_config_from_params(), which does indeed limit the number of LUNs to 
> FSG_MAX_LUNS.
> 
> So yes, please update the patch description to mention that although 
> cfg->nluns is limited to FSG_MAX_LUNS (16), the compiler doesn't realize 
> this and complains about the buffer size.  Then you can add:
> 
> Acked-by: Alan Stern <stern@rowland.harvard.edu>

Sure, will do!

> Do you think it's worth adding an explicit check in 
> fsg_common_create_luns(), such as:
> 
> 	if (cfg->nluns > FSG_MAX_LUNS)
> 		return -EINVAL;
> 
> to catch the case where someone tries to bypass 
> fsg_config_from_params()?  That alone might well be enough to prevent 
> the compiler from warning about the field length.

It does not fix the compiler from warning.
gcc (Debian 14.2.0-19) 14.2.0

-- 
With Best Regards,
Andy Shevchenko


