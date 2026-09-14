Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB69315D49
	for <linux-usb@vger.kernel.org>; Mon, 14 Sep 2026 03:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789355158; cv=none; b=lJj+dAIKc0UjnN/JZoyNWmS2tHk+/hNMR7vnnzgmeqBO+eeJcI1V6dLZ5pxOlkRT86BvthnnhWOBnyur65ybPyezD3IwD3aiMnEeuKvdf0iRQeryBtEEWwUZH6BlgjRZ1eVh0/Lqnz+Sbe8i1ZZWl5h+VH2AcOiHjGsGd0wS1AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789355158; c=relaxed/simple;
	bh=2KO0TEs1p8g3EM5FVoXjgn2VNQedcbcyABKubVLWlFg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bP2IC6L2i33qONgaZRJ0mryX7Id3hHMKDxX62r0UjQH7c3fVIHnQgXicPn1PLpWn/EbtOSxjaEVO5Ukjk0IoXNbpD9bLv71Z/0dA0ODZHcITGoNyvIwO1PoDgVr2qA8Lic9/O3WYaOj40dYpomUnfGlBkIs+3VmRDVNNPAJ9NmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KqU4G1UQ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KqU4G1UQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789355157; x=1820891157;
  h=date:from:to:cc:subject:message-id;
  bh=2KO0TEs1p8g3EM5FVoXjgn2VNQedcbcyABKubVLWlFg=;
  b=KqU4G1UQdwd+SzBkp/8RCmYR6xSPFPCPCZOgOGv3Ha3tom3j6fwbTA4G
   eN83zaY88kDmcVhbSe5SNcpMOMZ2V/NzhGJNB1ZO2oIZMRP2JEm0D1GKM
   9dlU0/cgNReX+zJcVq2X+0u97pMWJmm5feYNyc1Enq3syMalsaDBVjv1l
   cNteprXqP1//hBtt98Z1p4JjB3pymUP/pNl7k53yhs7zAzoor6FpnwGsC
   L6XE+3CiF3/r66gg4mVEJ0o7kEsiMesV+LBlGBD4Vu67kVmdsxblc4VR1
   Vd+yHIWRXkG+KkAN728r8o9hN99c6G2gTBj0fBk6NPe6RBzDH9fca/AAI
   Q==;
X-CSE-ConnectionGUID: 4p3ldLrLQLiP4uO/b/b2VA==
X-CSE-MsgGUID: lJakIBOoSZ2bfN7xElkjvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89917334"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89917334"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 20:05:57 -0700
X-CSE-ConnectionGUID: 8DzffHTXQ/OiRGPKFFWQpA==
X-CSE-MsgGUID: So+b5qRfS1WPjgT4Zuf/LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="302408695"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Sep 2026 20:05:55 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5x0y-000000002QU-1hET;
	Mon, 14 Sep 2026 03:05:52 +0000
Date: Mon, 14 Sep 2026 11:05:46 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: [usb:usb-testing 32/48] fotg210-core.c:undefined reference
 to `usb_hcd_platform_shutdown'
Message-ID: <202609141128.DQicnuRW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   dbe68462fa656078eac3a5a09039038dc47e08da
commit: 7dbc2e1ba8fd7793af299d8a813eae727759ecf3 [32/48] usb: fotg210: use the common EHCI core
config: powerpc64-randconfig-002-20260914 (https://download.01.org/0day-ci/archive/20260914/202609141128.DQicnuRW-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260914/202609141128.DQicnuRW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609141128.DQicnuRW-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `usb_hcd_platform_shutdown'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: drivers/usb/fotg210/fotg210-core.o: in function `fotg210_shutdown':
>> fotg210-core.c:(.text+0x104): undefined reference to `usb_hcd_platform_shutdown'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=n] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
