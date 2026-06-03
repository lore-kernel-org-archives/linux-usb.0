Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B541EA7DB;
	Wed,  3 Jun 2026 00:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780446104; cv=none; b=PeWDfeP7xiItEzHShLPwbe8M0j9E3WmXG8AP56bxrst2fKuBG7hDnCcK5ROUyE4QIXY/yxTKLl9GvCpJ9f7DsSLVK1u3L2hKS70Dqgd4o0Zn+mpVTwAKEy0JyxETWXngcxnNfXh3dRrO8xtclLyAHzPGVgvVCsELUg3/1E8qKK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780446104; c=relaxed/simple;
	bh=HcyjVbPhfFMLdpMsjjdMziLgkxX83X3yjAIEYzwdJC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ngo+tvbGPD4IqdBmtt1bHA2SL+q9rfL18yyBGCm+VUmljRraz4UIYkUjtpXMHeab8WHwXL0otHAiOhCn4e8kkuWZ5YjEQ82i9ePtFrF3XNmbd7NQiKs6MNf2RpQNuKOFNbgiaFBakQqlNidNe+7IwQh8lW14HhktKR9hEGaAP2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kG2EuBJi; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kG2EuBJi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780446103; x=1811982103;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=HcyjVbPhfFMLdpMsjjdMziLgkxX83X3yjAIEYzwdJC4=;
  b=kG2EuBJi7xN8whlAs2MypN7JRfXdnyeTfokxXlFRFWHfuynYycmKeh2S
   pHpVLKvWyiaIWYYc2G1xJlo+R5fTvzBhBidZfa9x3WEjYtWkgVoMd24+8
   NzXILMf99Kdkm5bzwO05PeSjSq9Qss2TroIv5sQt8Wop981TeSMJJVtol
   O2K0z3Dqe0/Prq00vLh5f745qQklv80Fh6T8tYCKTXsJ/LzQ3bPkSzXjM
   vA9m/aJFo5gdmFFIOyMxjuste4HJKsWT//8OImDL104V5O8FTU5U+s0Ax
   m7Y0br1HRlxwfSweJ71JsL88FzZWCq3SbQuJzWRlYEuz2K0+lqyMlpM9f
   w==;
X-CSE-ConnectionGUID: TCmONqIrQdG5yEiAZp6kNw==
X-CSE-MsgGUID: 87hYG1PfQuqq7EmKknpYEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81426911"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="81426911"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 17:21:32 -0700
X-CSE-ConnectionGUID: NWYfjAlvThyxqpOImP1nvg==
X-CSE-MsgGUID: V3ZwBzYJSnKqlXzZxo3C8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="241077392"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.116])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 17:21:29 -0700
Date: Wed, 3 Jun 2026 03:21:27 +0300
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
Subject: Re: [PATCH 3/6] thunderbolt: property: Make format_dwdata() work on
 big-endian systems
Message-ID: <ah9zh_8EKVw-9oQj@ashevche-desk.local>
References: <20260524-thunderbolt-big-endian-v1-0-6044edca78e7@weissschuh.net>
 <20260524-thunderbolt-big-endian-v1-3-6044edca78e7@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260524-thunderbolt-big-endian-v1-3-6044edca78e7@weissschuh.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, May 24, 2026 at 03:06:45PM +0200, Thomas Weißschuh wrote:
> The data also needs to be swapped on big-endian systems.

Why?! The good commit message has to explain this kind of changes deeper.

> Use swab32() which works independently from the host byte order.

-- 
With Best Regards,
Andy Shevchenko


