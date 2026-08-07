Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00674477E1
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 06:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786083662; cv=none; b=m3A+3nL1qW6AwbMcXFDUWcKD7JOLcl6fsp/0xLZA2TmLidDtkqME0w/MwYUSxwuzBxNx4HkhyXp6o+ZlifoMAU+ymexJLTxCnW6X8NqMMpu+saAxhJpOpuy4YxbdbVc7m2J27v0R4Nz5SSjK1fmdHVbod4x6Ppew9imB901zgaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786083662; c=relaxed/simple;
	bh=POzmRgE2KT2VgZ+BQI6wtH1rUfIWQgo5Rq1Q2qH5xaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qe6QaiNBgxyomwtJmbL9qrkADGPLxLxO/pd6zSbDzfHZ7D1Mq2cJO4Wa8XIEtFWQusfQBGcuwciF+6iyu53Hv7AcUXvDSwyraEiRTW+xcPad+GYYHhHLI4a1/RcGgxn1XxG3LTaHBtNOriuzVzop3FYMee718rRKIa5rNX/4Kzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QyxzJa+S; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QyxzJa+S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786083661; x=1817619661;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=POzmRgE2KT2VgZ+BQI6wtH1rUfIWQgo5Rq1Q2qH5xaw=;
  b=QyxzJa+SG57xrm0XwZQ0v9lix/SMOEhBGqlnhWrtB5MpuwqREsimCHzn
   CrnNTTpQR29Tkkr6gjIdedhFLzrTL60201K7aoaX7fgLA22QYdR9tnLwt
   R3RaNQJSJEWn31FLE5c8MzHGleXS71wQQjGj1W2fI2Co2j9N/rJhlFEc4
   u5tB8rbmC11jkStAT1ToVOGwLAaDVxOtutZNry54J01bT9i3LkRi+Yzwt
   LArmK/QQtnheQRJcLBozhhKpSrBjBrxRggY0lLbREQFNSrdxr6HpWEpRU
   4+ldm3MNXtm4nX/aZZMSK50xzgwQEchPQ9CYUCHruz/PT1nhw36PUnL22
   A==;
X-CSE-ConnectionGUID: tH2bACiSTUSAS/YJ0IGpFg==
X-CSE-MsgGUID: ne+uT5KkTy+kYJcMxmEbcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="90503872"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="90503872"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 23:21:00 -0700
X-CSE-ConnectionGUID: z5tG2JF4SKOhzIKeNWHXFg==
X-CSE-MsgGUID: /MzvzJpbTCmE4Ci0p2s6OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="258008352"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 06 Aug 2026 23:16:29 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 2FB7299; Fri, 07 Aug 2026 08:16:28 +0200 (CEST)
Date: Fri, 7 Aug 2026 08:16:28 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org, Mario.Limonciello@amd.com,
	Sanath S <Sanath.S@amd.com>
Subject: Re: [PATCH -next v3] thunderbolt: Add quirk to reset host interface
 on DMA path teardown for AMD USB4 routers
Message-ID: <20260807061628.GK235112@black.igk.intel.com>
References: <20260806125929.1238914-1-Basavaraj.Natikar@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260806125929.1238914-1-Basavaraj.Natikar@amd.com>

Hi,

On Thu, Aug 06, 2026 at 06:29:29PM +0530, Basavaraj Natikar wrote:
> Some AMD USB4 host routers have a bug in the Host Interface where
> DMA path setup and teardown cycles may cause the Tx ring to hang.
> 
> Fix this by issuing a Host Interface Reset on every DMA path teardown
> for affected routers. The Host Interface Reset brings the registers in
> the memory BAR to their default state and clears the End-to-End Flow
> Control state, preventing the hang condition.
> 
> Co-developed-by: Sanath S <Sanath.S@amd.com>
> Signed-off-by: Sanath S <Sanath.S@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

I did few minor cosmetic tweaks and applied to thunderbolt.git/next,
thanks!
