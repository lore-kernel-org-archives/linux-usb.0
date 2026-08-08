Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E7C1E515;
	Sat,  8 Aug 2026 12:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786191382; cv=none; b=BD9VSlGWC4Q6hoJshO2rVPseAabJeQ+qsqCTGNPMRQvAih3Tnu/QDwd5n4eS40TtsypJueQMQQlCnd/Poow+jX2m6Eh5HdEvuEmtVr1irF7Q+jBYUK4lLnnaAp/tTonUqk90321hYhIq48qtUQM4GQdaM9cQV3Cx9ZY3QXPB1ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786191382; c=relaxed/simple;
	bh=jBKpxU8IYqhiMCoM13EEwgS5j8zT5lHo6dA1NHnu0Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bxyWzh7OEoxhOhtPFML2i8mhwvQOLDPS5fE2dW/XqYvQCYhL9Yuw17JaETB3aCEUmAjBhXy17oW4HlAGgQC8o9imrMTHNN3O3zeCGGEOF3cwAqa/y74Qq9TYbDUJCn0gKz1eMTegyAn9FHh4grOvZVJt5B1mfmynLGi69NIG7gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gPq7bqMT; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gPq7bqMT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786191380; x=1817727380;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jBKpxU8IYqhiMCoM13EEwgS5j8zT5lHo6dA1NHnu0Uo=;
  b=gPq7bqMTqS5Lo1lfqu+Jv1egmq/Akho5g+0+PRmzww9D5T/2K0Y5PjqQ
   NXsne9rUzt19+8qMGjIMvQ4ptAtRI3SEWZwiAW18Dfhj9Xl+HW/pltjwE
   RzsGXdPqM6dzp2z8fOEDvRVpZCEObr8IlRABcsEC8qGd4REsZjVmQXHC2
   IQx1fNZMW5STQOWMc8r3AypbNo6+R/ND5gYLob+LoaIQYKvDWfZUBDNsG
   BqnzGA5gbPAp/WyaQe94UM0iolj/sfkoBgBGzNvatYfGg8FaFYhjCnLFM
   ikrjvL140YabQXdP4wDsqSXenPAhpmmkY6P0cBbo9TCgT/+KHiu182FnE
   g==;
X-CSE-ConnectionGUID: qkO3M0VpRkOhbWkRjtecoQ==
X-CSE-MsgGUID: aNLYWlMjQhGslwBaui3CWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="97431383"
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="97431383"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2026 05:16:20 -0700
X-CSE-ConnectionGUID: vyqZb6etRZq/3bOmUa7uhQ==
X-CSE-MsgGUID: cWMXf/NEQKqqK1L0EVSDyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="262668104"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Aug 2026 05:16:19 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsfyK-00000000KAr-0jwN;
	Sat, 08 Aug 2026 12:16:16 +0000
Date: Sat, 8 Aug 2026 20:16:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jie Deng <dengjie03@kylinos.cn>, mathias.nyman@intel.com
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	Jie Deng <dengjie03@kylinos.cn>
Subject: Re: [PATCH] usb: xhci: Restore MSI/MSI-X reinitialization on resume
 for RESET_ON_RESUME hosts
Message-ID: <202608081908.EsUNhI36-lkp@intel.com>
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
config: x86_64-randconfig-076-20260808 (https://download.01.org/0day-ci/archive/20260808/202608081908.EsUNhI36-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260808/202608081908.EsUNhI36-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608081908.EsUNhI36-lkp@intel.com/

All errors (new ones prefixed by >>):

>> depmod: ERROR: Cycle detected: xhci_hcd -> xhci_pci -> xhci_hcd
   depmod: ERROR: Found 2 modules in dependency cycles!
   make[3]: *** [scripts/Makefile.modinst:132: depmod] Error 1 shuffle=20476890
   make[3]: Target '__modinst' not remade because of errors.
   make[2]: *** [Makefile:2095: modules_install] Error 2 shuffle=20476890
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=20476890
   make[1]: Target 'modules_install' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=20476890
   make: Target 'modules_install' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
