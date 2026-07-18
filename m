Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD49282F21
	for <linux-usb@vger.kernel.org>; Sat, 18 Jul 2026 06:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784356909; cv=none; b=SWFn8h5B8pm4z5xBemj/LFIvxTMvF2I/c0XlP4tWA6qiVqZe1zZyEku0gv7NUdAn0aWQ+fsd7bGeG2SYf4q7nZoWM2HXaBhkhm6n5x2J4GsgSIfi7M6KdNupJbxB0SEQGmTDfzvoeGhbvdTOoifl3CRJ5CdGQwVsn7kd5kPWV8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784356909; c=relaxed/simple;
	bh=Vm0hemrVXtLwsA33JohRMPmHOC5vfwjrar2vwnBNzPE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e8Y9W8gj0Ca00pHMTf7TkaPGryQHW+MMYCQGR8w51QDaHEgDa5BhIn+go76UfFqKiga2+3Ur7g70yw/iMBFMXhdVmubqTK//7nvc7N6C438BzqqDCK1ateO3sQ4ZF10fsFcUpZSYOEXSJJRcgLt/audUhy63+jNY886fRuhQ4NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dBiiy1am; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dBiiy1am"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784356908; x=1815892908;
  h=date:from:to:cc:subject:message-id;
  bh=Vm0hemrVXtLwsA33JohRMPmHOC5vfwjrar2vwnBNzPE=;
  b=dBiiy1amJheRFP1qJLLtTgDbHvevP5z4tM6C9O1is1p/WeuloWcuYu5v
   bmPIhNgt6miKJ6vWiSgyiAAalAIs8akFUDuQg6FLet91k71/lq0g1ostG
   gwJUAe0RFX/5paNED1fD1Sr7DK5enPiCPpaWNxlshJMmtNYjHcoyqemDK
   oQN8nuIYAAqmpA/IErjheE3q5R2QuKE9FcIOg83X1qSVRf80QeRCdFAf0
   wfxdJR0vJn0hJm2BeJgMgi0iGpzDp480511o7wwC/gVvQzW/P1SByKbz3
   5BAzz5zybQc9DHVvlh1daIIRuCOs9MMi3xHdRNI70iRu2MIRqdQTFPvN8
   w==;
X-CSE-ConnectionGUID: jLoM67F3TK6/Yzukvfe0uA==
X-CSE-MsgGUID: 3OdMEc/VSa+qnPb5Ec1QFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="102440645"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="102440645"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 23:41:48 -0700
X-CSE-ConnectionGUID: CU29F7lPSzuKW1Z1q0FSrg==
X-CSE-MsgGUID: wS0kCIGATkO24Nul+1S2aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="250619483"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 17 Jul 2026 23:41:46 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkyk4-00000000TWt-0LDH;
	Sat, 18 Jul 2026 06:41:44 +0000
Date: Sat, 18 Jul 2026 14:41:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 71132cedd1ecbc4032d76e9928c18a10f7e39b80
Message-ID: <202607181450.5kHasEpV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 71132cedd1ecbc4032d76e9928c18a10f7e39b80  usb: atm: ueagle-atm: reject descriptors that confuse probe and disconnect

elapsed time: 747m

configs tested: 97
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                           randconfig-001    gcc-8.5.0
arc                  randconfig-001-20260718    gcc-8.5.0
arc                  randconfig-002-20260718    gcc-8.5.0
arm                  randconfig-001-20260718    gcc-8.5.0
arm                  randconfig-002-20260718    gcc-8.5.0
arm                  randconfig-003-20260718    gcc-8.5.0
arm                  randconfig-004-20260718    gcc-8.5.0
arm                          u8500_defconfig    gcc-16.1.0
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260718    gcc-14.3.0
arm64                randconfig-002-20260718    gcc-14.3.0
arm64                randconfig-003-20260718    gcc-14.3.0
arm64                randconfig-004-20260718    gcc-14.3.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260718    gcc-14.3.0
csky                 randconfig-002-20260718    gcc-14.3.0
hexagon              randconfig-001-20260718    clang-18
hexagon              randconfig-002-20260718    clang-18
i386                            allmodconfig    gcc-14
i386                 randconfig-001-20260718    gcc-14
i386                 randconfig-002-20260718    gcc-14
i386                 randconfig-003-20260718    gcc-14
i386                 randconfig-004-20260718    gcc-14
i386                 randconfig-005-20260718    gcc-14
i386                 randconfig-006-20260718    gcc-14
i386                 randconfig-007-20260718    gcc-14
i386                 randconfig-011-20260718    clang-22
i386                 randconfig-012-20260718    clang-22
i386                 randconfig-013-20260718    clang-22
i386                 randconfig-014-20260718    clang-22
i386                 randconfig-015-20260718    clang-22
i386                 randconfig-016-20260718    clang-22
i386                 randconfig-017-20260718    clang-22
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260718    clang-18
loongarch            randconfig-002-20260718    clang-18
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260718    clang-18
nios2                randconfig-002-20260718    clang-18
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc                        randconfig-001    gcc-16.1.0
parisc               randconfig-001-20260718    gcc-16.1.0
parisc               randconfig-002-20260718    gcc-16.1.0
powerpc              randconfig-001-20260718    gcc-16.1.0
powerpc              randconfig-002-20260718    gcc-16.1.0
powerpc64            randconfig-001-20260718    gcc-16.1.0
powerpc64            randconfig-002-20260718    gcc-16.1.0
riscv                randconfig-001-20260718    clang-24
riscv                randconfig-002-20260718    clang-24
s390                 randconfig-001-20260718    clang-24
s390                 randconfig-002-20260718    clang-24
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260718    clang-24
sh                   randconfig-002-20260718    clang-24
sparc                randconfig-001-20260718    gcc-11.5.0
sparc                randconfig-002-20260718    gcc-11.5.0
sparc64              randconfig-001-20260718    gcc-11.5.0
sparc64              randconfig-002-20260718    gcc-11.5.0
um                   randconfig-001-20260718    gcc-11.5.0
um                   randconfig-002-20260718    gcc-11.5.0
x86_64     buildonly-randconfig-001-20260718    clang-22
x86_64     buildonly-randconfig-002-20260718    clang-22
x86_64     buildonly-randconfig-003-20260718    clang-22
x86_64     buildonly-randconfig-004-20260718    clang-22
x86_64     buildonly-randconfig-005-20260718    clang-22
x86_64     buildonly-randconfig-006-20260718    clang-22
x86_64                                 kexec    clang-22
x86_64                        randconfig-001    gcc-14
x86_64               randconfig-001-20260718    gcc-14
x86_64               randconfig-002-20260718    gcc-14
x86_64               randconfig-003-20260718    gcc-14
x86_64               randconfig-004-20260718    gcc-14
x86_64               randconfig-005-20260718    gcc-14
x86_64               randconfig-006-20260718    gcc-14
x86_64               randconfig-011-20260718    gcc-14
x86_64               randconfig-012-20260718    gcc-14
x86_64               randconfig-013-20260718    gcc-14
x86_64               randconfig-014-20260718    gcc-14
x86_64               randconfig-015-20260718    gcc-14
x86_64               randconfig-016-20260718    gcc-14
x86_64               randconfig-071-20260718    clang-22
x86_64               randconfig-072-20260718    clang-22
x86_64               randconfig-073-20260718    clang-22
x86_64               randconfig-074-20260718    clang-22
x86_64               randconfig-075-20260718    clang-22
x86_64               randconfig-076-20260718    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260718    gcc-11.5.0
xtensa               randconfig-002-20260718    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
