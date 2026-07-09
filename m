Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64D4224AFA
	for <linux-usb@vger.kernel.org>; Thu,  9 Jul 2026 11:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783595232; cv=none; b=n+dAoKrWAVtDa2a7gMNm0i7bpZu+0zunU0Ryi68V0bxeqHcV9w+QJKNKQdJSg4jK4NZv7PgeJ/E4OPjDAjWYeDFtEYPS2KKyx2+TBY+4bYy9jdKCFdyrt3uaq6aZA+krC1NkqyrMsSrfTmx1OlSh9SNgtyDi/vwNxUHxhvptm5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783595232; c=relaxed/simple;
	bh=hJPseT/wMhqcmqJApdaP7QJcUOWSIoFYTKw9M/kyHAE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nMneYY8GT/kC1OLtMTv0Ie+W+ak29vU36QxwkLz6SW0rR0bPohxu828gFV0FOiLPEtZSfjmukv+sCC98j4SuK9cmO/XfrGAgt8A2hqlgiZ1lY5JJvEeoJXPY6IFdUeMTYBV5hyLy45CsNiCGVmWG+WG9DnGebVWjmKHEtQyE3c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EhKzZhkG; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EhKzZhkG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783595231; x=1815131231;
  h=date:from:to:cc:subject:message-id;
  bh=hJPseT/wMhqcmqJApdaP7QJcUOWSIoFYTKw9M/kyHAE=;
  b=EhKzZhkGLzp50kaQ8B1FjSW1nr+JE1ROaGEEc7QbfXKaQ/Go5Lr2a5cF
   gKNXlp0A+qhkcR4s1n9wC/pA8ivUholF/yjIYXnWRW6ewd0ol+pyznoTX
   o5H0sBYEvYoCEpGqSrfg+5EOZJikZG1ycAQftP7RIrMRUVzC1nDaIZPAK
   h2TTNEBcWxpsUUedCdhIBES/gv3VXSBTBnjTkxoL2ri1FT1py5Q9+4n5T
   9MeGxmqBxXUAOEkKOzHUxTu1BdGS17uAknsRhZSnV4Cfwlf8xt8zj1kz2
   lWYpWFf0SdrjKyXIxaPnMMDudPtPUPLpxFft4sT75k+CBmeg02nv10hZy
   A==;
X-CSE-ConnectionGUID: SL1RwRMlT8uCDCLoA3A0uw==
X-CSE-MsgGUID: vbhoKmddRWm/WMruG155rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101701698"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="101701698"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 04:07:11 -0700
X-CSE-ConnectionGUID: DsecCnHqRqSSjn4zrHm/Vg==
X-CSE-MsgGUID: nSPqwIvATKKyZEu7ee5n1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="277785953"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 09 Jul 2026 04:07:08 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whmav-00000000Haq-3Nkd;
	Thu, 09 Jul 2026 11:07:05 +0000
Date: Thu, 09 Jul 2026 19:06:15 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Sunil Dhamne <amitsd@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>
Subject: [usb:usb-testing 23/28] ERROR: modpost: "__udivdi3"
 [drivers/usb/typec/tcpm/tcpm.ko] undefined!
Message-ID: <202607091951.ntkyb1Km-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   472ce6621e371aafc03c0704d1d940f51d8159db
commit: b3c9b6925ca2e02ef2fd77d0aa5e0ca6b2a67f5a [23/28] usb: typec: tcpm: Add support for Battery Status response message
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260709/202607091951.ntkyb1Km-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607091951.ntkyb1Km-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607091951.ntkyb1Km-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [drivers/usb/typec/tcpm/tcpm.ko] undefined!
>> ERROR: modpost: "__divdi3" [drivers/usb/typec/tcpm/tcpm.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
