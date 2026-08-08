Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F462D2488;
	Sat,  8 Aug 2026 11:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786189346; cv=none; b=XKXASVURx/pe2y+FwA9tc3/d5ySD4DjwQ1DbChzXsp5fro1wQyUSJqnrvzjTMXp8sbybWCRqkngjeCo5juhcB+PQ75zm4ksDwyB1lJyAU4d8PVqoY6+MxJjbXKBGg8gQD9xa1FEnM9pwpJ/KH/9nZuEQWQNIlI480VxdnNm8Pww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786189346; c=relaxed/simple;
	bh=cg1iseAYdsNQJ5yspPtcBbmOA5KYB1nR3tuetfOe5Ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eIJbLu+I/pqU3viyd+FSAyXO1YuYysJaPf71v0OQLzMgZDTCx+lOGGi3/FgwwI6GXF8RV5EizFB+hNk75SlyVt9+hiBHT7iW9KGX335dYexf0sPJF7E/w957wcReY3emf0glWjZKAMp96JGWi5Y1ekVlk6qCnoeC9vQMKu47lL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GR1OELUQ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GR1OELUQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786189344; x=1817725344;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cg1iseAYdsNQJ5yspPtcBbmOA5KYB1nR3tuetfOe5Ug=;
  b=GR1OELUQw476ASmkSsymjiIx9600zK3uwJWUNO3FU4nFyx/bbJH/j3nU
   d86H0TWYvesPW377wBuOiTdHnCA3SNlH8EAWS63aNfibQs3mXAyIjDHCH
   UJyjUA8SIDdqKBWMZL0dq6hX6WwtgOTb69wx/euTtZfiDqKCYDnwBKqmh
   EQuzu8MLEpefNIgkzZWfr/6qxM36HYkmmvL0RFDo/IKDjQkJiFO34k4yv
   Tj3u2iZaFTG9r8U6imB+u4tl2zXCFZc/KsurBRuSWzkwbMeKiqdmrjwGX
   y8y4LoknvvFiQ8lzIy3w3YARelikdgFDFQHPS/4oiOAqQsmXu58aOwizg
   A==;
X-CSE-ConnectionGUID: 34ARJS7GT/639tLjFZ1n5A==
X-CSE-MsgGUID: FITUnOxBT3Clud4s04MVvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="98293268"
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="98293268"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2026 04:42:24 -0700
X-CSE-ConnectionGUID: IROKxj+kR5OJBtdWXGkh5A==
X-CSE-MsgGUID: lbp1iV2yTWGMVgtpKkbVDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="262664778"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Aug 2026 04:42:22 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsfRT-00000000K7b-3Wew;
	Sat, 08 Aug 2026 11:42:19 +0000
Date: Sat, 8 Aug 2026 19:41:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jie Deng <dengjie03@kylinos.cn>, mathias.nyman@intel.com
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	Jie Deng <dengjie03@kylinos.cn>
Subject: Re: [PATCH] usb: xhci: Restore MSI/MSI-X reinitialization on resume
 for RESET_ON_RESUME hosts
Message-ID: <202608081948.oLrVm0im-lkp@intel.com>
References: <20260714090210.1201964-1-dengjie03@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714090210.1201964-1-dengjie03@kylinos.cn>

Hi Jie,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus westeri-thunderbolt/next linus/master v7.2-rc6 next-20260807]
[cannot apply to peter-chen-usb/for-usb-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jie-Deng/usb-xhci-Restore-MSI-MSI-X-reinitialization-on-resume-for-RESET_ON_RESUME-hosts/20260807-153157
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20260714090210.1201964-1-dengjie03%40kylinos.cn
patch subject: [PATCH] usb: xhci: Restore MSI/MSI-X reinitialization on resume for RESET_ON_RESUME hosts
config: x86_64-buildonly-randconfig-001-20260808 (https://download.01.org/0day-ci/archive/20260808/202608081948.oLrVm0im-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260808/202608081948.oLrVm0im-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608081948.oLrVm0im-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/usb/host/xhci.o: in function `xhci_resume':
>> xhci.c:(.text+0x3d66): undefined reference to `xhci_cleanup_msix'
>> ld: xhci.c:(.text+0x3d95): undefined reference to `xhci_try_enable_msi'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
