Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47453093B5;
	Tue, 16 Jun 2026 06:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781589827; cv=none; b=bI+Fi+5V/mpxddx9ytBVUUrApS5OXnO23hxnp2AVwVa0CzGk/z/kI/XFO0TrQBOCM7JW3dAnmKkSRM94Wmsj2vMA9qS3awyKFEQe/xB2P5Pnygnx8+QiSrWXb9+GYj0M7a6tbpc4/O3MSQ9Trh04JIXBthAWfy5Gnp2M4364LIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781589827; c=relaxed/simple;
	bh=R/AHKju/NJWmooHGAFSRZLAPNC+346Fg7D+e2npzwjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YxSU8g7zkydQ+Ins8bEfJAKG8egTE0jl95TB+U1cz124PkNWh1isiye1pkxxMMVDNxwW5rD1lxDwA/W+PK/tO8fCew7l7a1HpH727KJg8CzrSVKyAKw2t/YfkOofPcPVIG9o5Fo09y7lTrc8eK3kJkzvgMMwJ2XLo9SbelqrKYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G+8V7fOT; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G+8V7fOT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781589825; x=1813125825;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R/AHKju/NJWmooHGAFSRZLAPNC+346Fg7D+e2npzwjk=;
  b=G+8V7fOTKrcNKXD31q84u88IREZVU4GUN4cxqQArHAS/5xneeKxB/qjA
   FvVE5Hboe9Z7tXPYvcYM1joPzz9I/aZdd00eTTlJ/GXVEZI8msF0duPaH
   oUcRU6x60w1W9kO7QZGdpiDundQUowBZRzJjH7dOaMxdv2aOGFjc3Mr8M
   uBYSDSOowJPuKxEeI3erTv0zmeVfVwc7ReDHLV5rynluWxoRbICf8by+t
   emIKpDpsbO/c70KO4zcXL85gJRHSit3zd0v8QqjL4XxDGNOgQ5me6XGi0
   tGZ3HTWsC0d9UhF6npw4Qjs7OYo/W4UHym7+8qUei0VteKrxYxA1V9/9H
   Q==;
X-CSE-ConnectionGUID: sSqCQoAERKazKIA6zDj+NA==
X-CSE-MsgGUID: +Xmum1URTjyd9U6VnJoo0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82449410"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="82449410"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 23:03:44 -0700
X-CSE-ConnectionGUID: F1KmPwTxREepThZEns0hFA==
X-CSE-MsgGUID: aBHSjVxVQX64gv0JEuoxlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="247731455"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Jun 2026 23:03:42 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZMtf-00000000SmE-1ZCN;
	Tue, 16 Jun 2026 06:03:39 +0000
Date: Tue, 16 Jun 2026 14:03:08 +0800
From: kernel test robot <lkp@intel.com>
To: RD Babiera <rdbabiera@google.com>
Cc: oe-kbuild-all@lists.linux.dev, badhri@google.com,
	heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	RD Babiera <rdbabiera@google.com>
Subject: Re: [PATCH v1] usb: typec: tcpm: implement retry mechanism for
 Discover Identity VDMs
Message-ID: <202606161310.GCXb2ogf-lkp@intel.com>
References: <20260615194923.4192117-2-rdbabiera@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615194923.4192117-2-rdbabiera@google.com>

Hi RD,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 511e746700ee6e93104d061a87743906128ab709]

url:    https://github.com/intel-lab-lkp/linux/commits/RD-Babiera/usb-typec-tcpm-implement-retry-mechanism-for-Discover-Identity-VDMs/20260616-035226
base:   511e746700ee6e93104d061a87743906128ab709
patch link:    https://lore.kernel.org/r/20260615194923.4192117-2-rdbabiera%40google.com
patch subject: [PATCH v1] usb: typec: tcpm: implement retry mechanism for Discover Identity VDMs
config: loongarch-randconfig-r133-20260616 (https://download.01.org/0day-ci/archive/20260616/202606161310.GCXb2ogf-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e19d1f51a2c80b63cd8ca95bcc757b7077112808)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606161310.GCXb2ogf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606161310.GCXb2ogf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/typec/tcpm/tcpm.c:286:12: sparse: sparse: symbol 'vdm_discovery_state_strings' was not declared. Should it be static?

vim +/vdm_discovery_state_strings +286 drivers/usb/typec/tcpm/tcpm.c

   285	
 > 286	const char *vdm_discovery_state_strings[] = {
   287		[VDM_DISCOVERY_UNKNOWN] = "VDM_DISCOVERY_UNKNOWN",
   288		[VDM_DISCOVERY_PARTNER_IDENT] = "VDM_DISCOVERY_PARTNER_IDENT",
   289		[VDM_DISCOVERY_CABLE_IDENT] = "VDM_DISCOVERY_CABLE_IDENT",
   290		[VDM_DISCOVERY_PARTNER_SVIDS] = "VDM_DISCOVERY_PARTNER_SVIDS",
   291		[VDM_DISCOVERY_PARTNER_MODES] = "VDM_DISCOVERY_PARTNER_MODES",
   292		[VDM_DISCOVERY_CABLE_SVIDS] = "VDM_DISCOVERY_CABLE_SVIDS",
   293		[VDM_DISCOVERY_CABLE_MODES] = "VDM_DISCOVERY_CABLE_MODES",
   294		[VDM_DISCOVERY_COMPLETE] = "VDM_DISCOVERY_COMPLETE",
   295	};
   296	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
