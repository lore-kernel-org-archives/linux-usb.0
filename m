Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A113CDBB5
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 08:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791273996; cv=none; b=f/pfutIykBQOPPyhM8CdRgImV4nTIRLxPJ6A3kcSUphG8nvQBRJq6GTvoAp+fsLxwDlPhWbqiyckUi4mDcmKA+XZI/qbXI3fC1jAyvIyQRPvgOZoLb7I7Gm35bFtF1Lt0iaxy5uBiemLSH4HW9QhKjzjPUSNNEC3rAq/+mpj1pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791273996; c=relaxed/simple;
	bh=c9rpUvoE7S9cbQeaUuIQT+Lvd/97+ul0Aq0qftOxzvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DOiZJNcGLeVsN71eSId3HdEe55URN9s7tryoCw6vl3kxbVman8pGgOowjPfTIYu/1azVOq2V+qxWACBb9H9x7JSn0K4GFOHyvcoDWhYThWNPaQ09mNGW0X88n0qMv3a2UldxHD11OiHNHTBug/vQdCXvAZDdlyTm57wgzue+5iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=egsmSGwP; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="egsmSGwP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791273995; x=1822809995;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c9rpUvoE7S9cbQeaUuIQT+Lvd/97+ul0Aq0qftOxzvA=;
  b=egsmSGwP59v/32xQhswy0iQ0r88oyuhsup8G2gDkhaGVJauM595cfGkN
   11GOESM2nZvLpWc1bnlxzUqJFmrcleP10tSm2f1Wx8WfVbBLM1gBhT93R
   qcJgNbS/9vDZyHyRLDH8bYdsqx4vxTYmSFSvp4Yun2v/QnCWXCqdegKgS
   8pQP/KTqc+dA9J2YPa48HbEuTQsEJAezcta6Yu1Q01v2Lcu/LpqGCCqic
   pac7w0obfg728ypc6nXmtKDtjRBeIQwbrXAqxzZvFvWz2/AefJSoIHXXx
   bNO4oRqL+UO61AofmIMPSWogJxXlLUlRfmE1ylmQVUZqKEpHu6nKvc6lv
   w==;
X-CSE-ConnectionGUID: PbroaAFcS7uq9mh/ocyZJA==
X-CSE-MsgGUID: 2APQGT20QXuQO0UdNtnbRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102117921"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="102117921"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 01:06:34 -0700
X-CSE-ConnectionGUID: dKOqQqsAQYiKfnvgEOv4CA==
X-CSE-MsgGUID: E7n1IZjWTWWqin8Z6f1YWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="1110904"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.66])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 01:06:32 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2E33F121BCD;
	Tue, 06 Oct 2026 11:06:34 +0300 (EEST)
Date: Tue, 6 Oct 2026 11:06:34 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] MAINTAINERS: Update usbio driver maintainers and
 reviewers
Message-ID: <asSsCj4bV-DFnzI4@kekkonen.localdomain>
References: <20260803164533.58833-1-sakari.ailus@linux.intel.com>
 <aromZGGDP-rTsNCz@kekkonen.localdomain>
 <8efda53d-3f18-40e9-9c16-92ac2f5c3133@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8efda53d-3f18-40e9-9c16-92ac2f5c3133@kernel.org>

Ping.

On Mon, Sep 28, 2026 at 10:41:00AM +0200, Hans de Goede wrote:
> Hi,
> 
> On 28-Sep-26 10:33, Sakari Ailus wrote:
> > Ping.
> > 
> > On Mon, Aug 03, 2026 at 07:45:33PM +0300, Sakari Ailus wrote:
> >> Israel's e-mail address is no longer functional so remove him as a
> >> maintainer of the usbio driver. At the same time, add myself as a
> >> maintainer and Antti as a reviewer for the driver.
> >>
> >> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Thanks, this looks good to me:
> 
> Acked-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> 
> Regards,
> 
> Hans
> 
> 
> >> ---
> >>  MAINTAINERS | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index 88de4216d7d4..d1c26db44ca0 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -13430,9 +13430,9 @@ F:	Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst
> >>  F:	drivers/platform/x86/intel/uncore-frequency/
> >>  
> >>  INTEL USBIO USB I/O EXPANDER DRIVERS
> >> -M:	Israel Cepeda <israel.a.cepeda.lopez@intel.com>
> >>  M:	Hans de Goede <hansg@kernel.org>
> >> -R:	Sakari Ailus <sakari.ailus@linux.intel.com>
> >> +M:	Sakari Ailus <sakari.ailus@linux.intel.com>
> >> +R:	Antti Laakso <antti.laakso@linux.intel.com>
> >>  S:	Maintained
> >>  F:	drivers/gpio/gpio-usbio.c
> >>  F:	drivers/i2c/busses/i2c-usbio.c
> >> -- 
> >> 2.47.3
> >>
> >>
> > 
> 

-- 
Sakari Ailus
