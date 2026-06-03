Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818B464A9D;
	Wed,  3 Jun 2026 00:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780446195; cv=none; b=GZm40GNsZeIzm8QX/Z1XkNEuySfOH0Gp7uw/ea0mPW52fLz3gTNUaw2pbPB0J4ossMQ0Os/rzhV3F/bBdZKdG7TiBi6tsbApTkrx6p1dZNgJuqoasM6UlHiF62u0MpmTDAAcewM2L7yxdBukj1d/qTjYK20T0aBnkWAptH5N8lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780446195; c=relaxed/simple;
	bh=06NFdr2dbRbATjiP9zn4LIe4PNW9LObYZsgiVsg28aA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HiMOc4xbl32VPuRua2JxngCHZnBmwwCmgsKBpLhZR5AwN3F0q9DLOVESmthLQl3C4efiv8VdLkyv+If+PmnMpqjr2VId59CpSCPHGyO0rk+eGfBeEpPrDz4a4gn9L/GtBt42K0pPkHfYBhJ7OdM0a0P/FgJ6a1zDtMmhZE8zM7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LxoCjIEc; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LxoCjIEc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780446194; x=1811982194;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=06NFdr2dbRbATjiP9zn4LIe4PNW9LObYZsgiVsg28aA=;
  b=LxoCjIEcuYxyskTcaSAn2htBdX0g7pyI7PnDFxcfoC32CVvB0E1lQEmo
   91i8p+mQuh5mzAmB9vu7X58aNp1OZ78Ou20SBjS3B7O1Pl+E96gC25MSy
   XqwmiPHCRTRFNdZwb18F/T40cI71ZM2EEel1oiIJsAlBzB2KS6QdSRq5r
   aBiceH+kCb0f43YFovPQvJbwFygiYTtDratoKohBw357rPcuvzfDGKCoC
   QBP+zlQEXWizndGwP7d32nm1eHZ1xfjdqsLIMp4QXQYijePsszkACpSUA
   O3d+xqOIn5yAwJ9XvoNFf67J1TLPD6spuIVVKOKHLz9aPfEyOAZ8bMMmj
   w==;
X-CSE-ConnectionGUID: ct4GqTZKR16xvUWk6KCI/g==
X-CSE-MsgGUID: nquDZEwMTF+UBTicbBF3Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92353931"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="92353931"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 17:23:13 -0700
X-CSE-ConnectionGUID: xpWyMNV4SQyYd4Sa//Rstg==
X-CSE-MsgGUID: tUTjfjdGQZCj4g4MO3RqUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="239902885"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.116])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 17:23:11 -0700
Date: Wed, 3 Jun 2026 03:23:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Michael Jamet <michael.jamet@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yehezkel Bernat <yehezkel.bernat@intel.com>
Subject: Re: [PATCH 5/6] thunderbolt: property: Unify
 parse_dwdata()/format_dwdata()
Message-ID: <ah9z7PlIlb-KVt3j@ashevche-desk.local>
References: <20260524-thunderbolt-big-endian-v1-0-6044edca78e7@weissschuh.net>
 <20260524-thunderbolt-big-endian-v1-5-6044edca78e7@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260524-thunderbolt-big-endian-v1-5-6044edca78e7@weissschuh.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, May 24, 2026 at 03:06:47PM +0200, Thomas Weißschuh wrote:
> Both functions do the same. Unify them.

This what the first patch should do, without any additional dances.

-- 
With Best Regards,
Andy Shevchenko


