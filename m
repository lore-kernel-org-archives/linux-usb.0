Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35A81E1A3D
	for <linux-usb@vger.kernel.org>; Thu,  9 Jul 2026 14:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783606687; cv=none; b=jySbaiLpPn+bKjt2te7Tn3bQF+UXM7jl/BKrv7gtfdfCH9wlEPyswzdpxE+R3QZ5H+eCycqjPcPdR4OUZG6AosvcZKdsB5cEd3QL5cnN7uzAB+bjJR2F6AynY1ItI7q+9PkIz5QepyJf2veTY43ynYH12ymjBFzUXC+JzFdQiUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783606687; c=relaxed/simple;
	bh=+k4tqqPK2Mt2Ukpo2bDKp6dzsqQ4g2tr5LKoT0wlF/g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kD4/mmV5OG4OcVYU7sGBRxHrKIMyjABkt8lYzAw2MPpxnppo12jQn/3kZJXJwLl05fWwVrpDpxQbApH/kLmIx90pCV7ghOx4bgjPU19oZEvrNFNZwKpTZmYOgMA/AJSHbGIwEP8P7kf0bQMhbLKbGLWEZ7iJLLBWgqS9pFyEXYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HEkDAOKq; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HEkDAOKq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783606685; x=1815142685;
  h=date:from:to:cc:subject:message-id;
  bh=+k4tqqPK2Mt2Ukpo2bDKp6dzsqQ4g2tr5LKoT0wlF/g=;
  b=HEkDAOKqz6+65HisvLDGZW+/snf5NLHZLmOy2xHQS7y1tApgTWcY0VvK
   Wy2svO2bWkXDK8OBguRaI9NCxkqdpWqwXmfJ9oXBF6x0OWzHO0pSTqONS
   PzsEe3+9/LCz1huipHyl74IuIv/mcVg6GD0LG/SwAzuaUsa5HLtWpR66E
   UD4eQBHHOheXnYUjd77KMZ31VXvHhYCVJV6XhpJRTyYJUgNNDh5lvEYFc
   nfz4+Ga2jYCr/MHzq2SndQ9IDq5cpIL+Hivu7UA8Zw6l7e0sN79A5n8kv
   f45tCtFIMdSa03BQ9fSC3UEuwiE6QDKrpPJJCpqBAEam0s4wyIwGWnWP3
   g==;
X-CSE-ConnectionGUID: UNPEne1jQUC8/m10N32ceg==
X-CSE-MsgGUID: lYqpD4N7TteArYnSa4/LVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95802518"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95802518"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 07:18:05 -0700
X-CSE-ConnectionGUID: 0OKB/MgZS+imGOzIKdKvYA==
X-CSE-MsgGUID: 4mjox98sTd2O1Q6krgYShg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250611506"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jul 2026 07:18:03 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whpZY-00000000HkO-0AMq;
	Thu, 09 Jul 2026 14:17:54 +0000
Date: Thu, 09 Jul 2026 22:17:02 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Sunil Dhamne <amitsd@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>
Subject: [usb:usb-testing 23/28] tcpm.c:undefined reference to
 `__udivdi3'
Message-ID: <202607092212.lINETdSF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   472ce6621e371aafc03c0704d1d940f51d8159db
commit: b3c9b6925ca2e02ef2fd77d0aa5e0ca6b2a67f5a [23/28] usb: typec: tcpm: Add support for Battery Status response message
config: i386-buildonly-randconfig-005 (https://download.01.org/0day-ci/archive/20260709/202607092212.lINETdSF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607092212.lINETdSF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607092212.lINETdSF-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/usb/typec/tcpm/tcpm.o: in function `tcpm_pd_send_batt_status.constprop.0':
>> tcpm.c:(.text+0x6743): undefined reference to `__udivdi3'
>> ld: tcpm.c:(.text+0x6764): undefined reference to `__udivdi3'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
