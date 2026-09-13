Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5CA367F3A
	for <linux-usb@vger.kernel.org>; Sun, 13 Sep 2026 17:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789318908; cv=none; b=Jsxm3hXSB2qATwGXyF2NUIiW02caPhqQrFymVRuBobeSJgojNRm/Fz9tf1WDRG9wiVYQToZPMBDSKR772dYuhKex2McE5spGefWZahNGsACbDnfYeMzBkjw0TqyVrtQLi3SSsb9b/LADzycO8RL92omjW6h7N0ghLH4g7SN05XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789318908; c=relaxed/simple;
	bh=FSU1H4ncdBp1qkUaNs5hMoujxGDpW7ER2JtXRHhLFno=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q2eKdDtMXxU5Dmzfpf4qmxIDufjQ6Ve/gMEGKlPB6HZHXDxD4NzsHAsuUjR9M/ftv2GWOGJFtfJuzgNzThbsABFf1w4cm4aOjDtD3l0kRd0yEPtaRpzLZVbqp9SQz7Fkx12SY+F6SmM9w66whRWEqc9ZFq4fLeM1C1hWGV3ns4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QM87TWjQ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QM87TWjQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789318907; x=1820854907;
  h=date:from:to:cc:subject:message-id;
  bh=FSU1H4ncdBp1qkUaNs5hMoujxGDpW7ER2JtXRHhLFno=;
  b=QM87TWjQTY5X5/TnEZrEi/mpADeTpl75++U+Fg7PgEWZUd+kOyg5MHrK
   nIz7dxlFy6/XGvnf+Cv+wiw7/di0HQl0ucrCrEmFjwWLdn/H4kXsvUVpy
   i5NflohZt03VCxFzb7eKsnuEFhiBwPveUWvLiP35fxceYn/L70tg1Jzpl
   DdDPLu+cNRPs+IV+NugWKeKfuQRl/60XGaeQCm5/AhI6iNQwlqY67bIHm
   8rLlM+cPsq4LBzXTp7ld63YNptElwVhtnz04Ke54YFr4qNFOUiwbI5cuF
   +90G1bBQV096ip213TklF82HLoZvR6SkdKd8pd0qe+h3u+9qLkoQP1rDQ
   w==;
X-CSE-ConnectionGUID: MuN3yhUCSd+OZlsOte0xlw==
X-CSE-MsgGUID: 0bK2x8FkR2SRwYAmg0efew==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="107205485"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="107205485"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 10:01:46 -0700
X-CSE-ConnectionGUID: s5aeug0NSyuOS1DJYRSEvg==
X-CSE-MsgGUID: PncKaIGaQxSgDO3LeD0bJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="271018122"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Sep 2026 10:01:45 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5naI-0000000014J-3Gi6;
	Sun, 13 Sep 2026 17:01:42 +0000
Date: Mon, 14 Sep 2026 01:00:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 ed2050bc671b44b2c948dbd4347cc534d44ccc9f
Message-ID: <202609140101.mP11XiUB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: ed2050bc671b44b2c948dbd4347cc534d44ccc9f  USB: Improve "New device found" printout message

elapsed time: m

configs tested: 366
configs skipped: 15

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-24
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-24
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260911    clang-24
arc                   randconfig-001-20260912    clang-17
arc                   randconfig-001-20260913    gcc-10.5.0
arc                   randconfig-002-20260911    clang-24
arc                   randconfig-002-20260912    clang-17
arc                   randconfig-002-20260913    gcc-10.5.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-24
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260911    clang-24
arm                   randconfig-001-20260912    clang-17
arm                   randconfig-001-20260913    gcc-10.5.0
arm                   randconfig-002-20260911    clang-24
arm                   randconfig-002-20260912    clang-17
arm                   randconfig-002-20260913    gcc-10.5.0
arm                   randconfig-003-20260911    clang-24
arm                   randconfig-003-20260912    clang-17
arm                   randconfig-003-20260913    gcc-10.5.0
arm                   randconfig-004-20260911    clang-24
arm                   randconfig-004-20260912    clang-17
arm                   randconfig-004-20260913    gcc-10.5.0
arm                           sama5_defconfig    gcc-16.1.0
arm                         socfpga_defconfig    gcc-16.1.0
arm64                            allmodconfig    clang-24
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260911    gcc-16.1.0
arm64                 randconfig-001-20260912    gcc-15.2.0
arm64                 randconfig-001-20260913    gcc-16.1.0
arm64                 randconfig-002-20260911    gcc-16.1.0
arm64                 randconfig-002-20260912    gcc-15.2.0
arm64                 randconfig-002-20260913    gcc-16.1.0
arm64                 randconfig-003-20260911    gcc-16.1.0
arm64                 randconfig-003-20260912    gcc-15.2.0
arm64                 randconfig-003-20260913    gcc-16.1.0
arm64                 randconfig-004-20260911    gcc-16.1.0
arm64                 randconfig-004-20260912    gcc-15.2.0
arm64                 randconfig-004-20260913    gcc-16.1.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260911    gcc-16.1.0
csky                  randconfig-001-20260912    gcc-15.2.0
csky                  randconfig-001-20260913    gcc-16.1.0
csky                  randconfig-002-20260911    gcc-16.1.0
csky                  randconfig-002-20260912    gcc-15.2.0
csky                  randconfig-002-20260913    gcc-16.1.0
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-24
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260911    gcc-12.5.0
hexagon               randconfig-001-20260912    clang-24
hexagon               randconfig-001-20260913    clang-24
hexagon               randconfig-002-20260911    gcc-12.5.0
hexagon               randconfig-002-20260912    clang-24
hexagon               randconfig-002-20260913    clang-24
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260911    clang-22
i386        buildonly-randconfig-001-20260912    gcc-14
i386        buildonly-randconfig-002-20260911    clang-22
i386        buildonly-randconfig-002-20260912    gcc-14
i386        buildonly-randconfig-003-20260911    clang-22
i386        buildonly-randconfig-003-20260912    gcc-14
i386        buildonly-randconfig-004-20260911    clang-22
i386        buildonly-randconfig-004-20260912    gcc-14
i386        buildonly-randconfig-005-20260911    clang-22
i386        buildonly-randconfig-005-20260912    gcc-14
i386        buildonly-randconfig-006-20260911    clang-22
i386        buildonly-randconfig-006-20260912    gcc-14
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260911    clang-22
i386                  randconfig-001-20260912    gcc-14
i386                  randconfig-002-20260911    clang-22
i386                  randconfig-002-20260912    gcc-14
i386                  randconfig-003-20260911    clang-22
i386                  randconfig-003-20260912    gcc-14
i386                  randconfig-004-20260911    clang-22
i386                  randconfig-004-20260912    gcc-14
i386                  randconfig-005-20260911    clang-22
i386                  randconfig-005-20260912    gcc-14
i386                  randconfig-006-20260911    clang-22
i386                  randconfig-006-20260912    gcc-14
i386                  randconfig-007-20260911    clang-22
i386                  randconfig-007-20260912    gcc-14
i386                  randconfig-011-20260911    clang-22
i386                  randconfig-011-20260912    gcc-14
i386                  randconfig-011-20260913    gcc-14
i386                  randconfig-012-20260911    clang-22
i386                  randconfig-012-20260912    gcc-14
i386                  randconfig-012-20260913    gcc-14
i386                  randconfig-013-20260911    clang-22
i386                  randconfig-013-20260912    gcc-14
i386                  randconfig-013-20260913    gcc-14
i386                  randconfig-014-20260911    clang-22
i386                  randconfig-014-20260912    gcc-14
i386                  randconfig-014-20260913    gcc-14
i386                  randconfig-015-20260911    clang-22
i386                  randconfig-015-20260912    gcc-14
i386                  randconfig-015-20260913    gcc-14
i386                  randconfig-016-20260911    clang-22
i386                  randconfig-016-20260912    gcc-14
i386                  randconfig-016-20260913    gcc-14
i386                  randconfig-017-20260911    clang-22
i386                  randconfig-017-20260912    gcc-14
i386                  randconfig-017-20260913    gcc-14
loongarch                        allmodconfig    clang-24
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-24
loongarch             randconfig-001-20260911    gcc-12.5.0
loongarch             randconfig-001-20260912    clang-24
loongarch             randconfig-001-20260913    clang-24
loongarch             randconfig-002-20260911    gcc-12.5.0
loongarch             randconfig-002-20260912    clang-24
loongarch             randconfig-002-20260913    clang-24
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-24
m68k                                defconfig    clang-24
m68k                       m5235evb_defconfig    gcc-16.1.0
m68k                       m5249evb_defconfig    gcc-16.1.0
m68k                       m5275evb_defconfig    gcc-16.1.0
m68k                       m5282evb_defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-24
microblaze                      mmu_defconfig    clang-24
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                         cobalt_defconfig    gcc-16.1.0
mips                     decstation_defconfig    clang-24
mips                     decstation_defconfig    gcc-16.1.0
mips                      fuloong2e_defconfig    gcc-16.1.0
mips                           gcw0_defconfig    clang-24
mips                           ip22_defconfig    gcc-16.1.0
mips                           jazz_defconfig    clang-24
mips                        omega2p_defconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-24
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-24
nios2                 randconfig-001-20260911    gcc-12.5.0
nios2                 randconfig-001-20260912    clang-24
nios2                 randconfig-001-20260913    clang-24
nios2                 randconfig-002-20260911    gcc-12.5.0
nios2                 randconfig-002-20260912    clang-24
nios2                 randconfig-002-20260913    clang-24
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-24
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-24
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260911    gcc-8.5.0
parisc                randconfig-001-20260912    clang-24
parisc                randconfig-001-20260913    gcc-8.5.0
parisc                randconfig-002-20260911    gcc-8.5.0
parisc                randconfig-002-20260912    clang-24
parisc                randconfig-002-20260913    gcc-8.5.0
parisc64                         alldefconfig    gcc-16.1.0
parisc64                            defconfig    clang-24
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-24
powerpc                           allnoconfig    gcc-16.1.0
powerpc                    amigaone_defconfig    gcc-16.1.0
powerpc                        fsp2_defconfig    gcc-16.1.0
powerpc                        icon_defconfig    clang-24
powerpc                   lite5200b_defconfig    gcc-16.1.0
powerpc                     mpc5200_defconfig    clang-24
powerpc                     powernv_defconfig    gcc-16.1.0
powerpc                     rainier_defconfig    clang-24
powerpc               randconfig-001-20260911    gcc-8.5.0
powerpc               randconfig-001-20260912    clang-24
powerpc               randconfig-001-20260913    gcc-8.5.0
powerpc               randconfig-002-20260911    gcc-8.5.0
powerpc               randconfig-002-20260912    clang-24
powerpc               randconfig-002-20260913    gcc-8.5.0
powerpc                  storcenter_defconfig    gcc-16.1.0
powerpc64             randconfig-001-20260911    gcc-8.5.0
powerpc64             randconfig-001-20260912    clang-24
powerpc64             randconfig-001-20260913    gcc-8.5.0
powerpc64             randconfig-002-20260911    gcc-8.5.0
powerpc64             randconfig-002-20260912    clang-24
powerpc64             randconfig-002-20260913    gcc-8.5.0
riscv                            allmodconfig    clang-24
riscv                             allnoconfig    clang-24
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-24
riscv                               defconfig    gcc-16.1.0
riscv                    nommu_k210_defconfig    gcc-16.1.0
riscv                    nommu_virt_defconfig    gcc-16.1.0
riscv                 randconfig-001-20260911    gcc-16.1.0
riscv                 randconfig-001-20260912    gcc-11.5.0
riscv                 randconfig-001-20260913    gcc-14.3.0
riscv                 randconfig-002-20260911    gcc-16.1.0
riscv                 randconfig-002-20260912    gcc-11.5.0
riscv                 randconfig-002-20260913    gcc-14.3.0
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-24
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260911    gcc-16.1.0
s390                  randconfig-001-20260912    gcc-11.5.0
s390                  randconfig-001-20260913    gcc-14.3.0
s390                  randconfig-002-20260911    gcc-16.1.0
s390                  randconfig-002-20260912    gcc-11.5.0
s390                  randconfig-002-20260913    gcc-14.3.0
s390                       zfcpdump_defconfig    gcc-16.1.0
sh                               alldefconfig    gcc-16.1.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-24
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                         ap325rxa_defconfig    gcc-16.1.0
sh                        apsh4ad0a_defconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                        dreamcast_defconfig    gcc-16.1.0
sh                               j2_defconfig    gcc-16.1.0
sh                    randconfig-001-20260911    gcc-16.1.0
sh                    randconfig-001-20260912    gcc-11.5.0
sh                    randconfig-001-20260913    gcc-14.3.0
sh                    randconfig-002-20260911    gcc-16.1.0
sh                    randconfig-002-20260912    gcc-11.5.0
sh                    randconfig-002-20260913    gcc-14.3.0
sh                          rsk7264_defconfig    gcc-16.1.0
sh                           se7206_defconfig    gcc-16.1.0
sh                           se7619_defconfig    gcc-16.1.0
sh                   sh7770_generic_defconfig    gcc-16.1.0
sparc                             allnoconfig    clang-24
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260911    gcc-13.4.0
sparc                 randconfig-001-20260912    gcc-14.3.0
sparc                 randconfig-001-20260913    gcc-15.2.0
sparc                 randconfig-002-20260911    gcc-13.4.0
sparc                 randconfig-002-20260912    gcc-14.3.0
sparc                 randconfig-002-20260913    gcc-15.2.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260911    gcc-13.4.0
sparc64               randconfig-001-20260912    gcc-14.3.0
sparc64               randconfig-001-20260913    gcc-15.2.0
sparc64               randconfig-002-20260911    gcc-13.4.0
sparc64               randconfig-002-20260912    gcc-14.3.0
sparc64               randconfig-002-20260913    gcc-15.2.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-17
um                                allnoconfig    clang-24
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260911    gcc-13.4.0
um                    randconfig-001-20260912    gcc-14.3.0
um                    randconfig-001-20260913    gcc-15.2.0
um                    randconfig-002-20260911    gcc-13.4.0
um                    randconfig-002-20260912    gcc-14.3.0
um                    randconfig-002-20260913    gcc-15.2.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-24
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260911    gcc-14
x86_64      buildonly-randconfig-001-20260912    gcc-14
x86_64      buildonly-randconfig-001-20260913    clang-22
x86_64      buildonly-randconfig-002-20260911    gcc-14
x86_64      buildonly-randconfig-002-20260912    gcc-14
x86_64      buildonly-randconfig-002-20260913    clang-22
x86_64      buildonly-randconfig-003-20260911    gcc-14
x86_64      buildonly-randconfig-003-20260912    gcc-14
x86_64      buildonly-randconfig-003-20260913    clang-22
x86_64      buildonly-randconfig-004-20260911    gcc-14
x86_64      buildonly-randconfig-004-20260912    gcc-14
x86_64      buildonly-randconfig-004-20260913    clang-22
x86_64      buildonly-randconfig-005-20260911    gcc-14
x86_64      buildonly-randconfig-005-20260912    gcc-14
x86_64      buildonly-randconfig-005-20260913    clang-22
x86_64      buildonly-randconfig-006-20260911    gcc-14
x86_64      buildonly-randconfig-006-20260912    gcc-14
x86_64      buildonly-randconfig-006-20260913    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260911    clang-22
x86_64                randconfig-001-20260912    clang-22
x86_64                randconfig-001-20260913    clang-22
x86_64                randconfig-002-20260911    clang-22
x86_64                randconfig-002-20260912    clang-22
x86_64                randconfig-002-20260913    clang-22
x86_64                randconfig-003-20260911    clang-22
x86_64                randconfig-003-20260912    clang-22
x86_64                randconfig-003-20260913    clang-22
x86_64                randconfig-004-20260911    clang-22
x86_64                randconfig-004-20260912    clang-22
x86_64                randconfig-004-20260913    clang-22
x86_64                randconfig-005-20260911    clang-22
x86_64                randconfig-005-20260912    clang-22
x86_64                randconfig-005-20260913    clang-22
x86_64                randconfig-006-20260911    clang-22
x86_64                randconfig-006-20260912    clang-22
x86_64                randconfig-006-20260913    clang-22
x86_64                randconfig-011-20260911    gcc-14
x86_64                randconfig-011-20260912    gcc-14
x86_64                randconfig-011-20260913    gcc-14
x86_64                randconfig-012-20260911    gcc-14
x86_64                randconfig-012-20260912    gcc-14
x86_64                randconfig-012-20260913    gcc-14
x86_64                randconfig-013-20260911    gcc-14
x86_64                randconfig-013-20260912    gcc-14
x86_64                randconfig-013-20260913    gcc-14
x86_64                randconfig-014-20260911    gcc-14
x86_64                randconfig-014-20260912    gcc-14
x86_64                randconfig-014-20260913    gcc-14
x86_64                randconfig-015-20260911    gcc-14
x86_64                randconfig-015-20260912    gcc-14
x86_64                randconfig-015-20260913    gcc-14
x86_64                randconfig-016-20260911    gcc-14
x86_64                randconfig-016-20260912    gcc-14
x86_64                randconfig-016-20260913    gcc-14
x86_64                randconfig-071-20260911    gcc-14
x86_64                randconfig-071-20260912    gcc-14
x86_64                randconfig-072-20260911    gcc-14
x86_64                randconfig-072-20260912    gcc-14
x86_64                randconfig-073-20260911    gcc-14
x86_64                randconfig-073-20260912    gcc-14
x86_64                randconfig-074-20260911    gcc-14
x86_64                randconfig-074-20260912    gcc-14
x86_64                randconfig-075-20260911    gcc-14
x86_64                randconfig-075-20260912    gcc-14
x86_64                randconfig-076-20260911    gcc-14
x86_64                randconfig-076-20260912    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-24
xtensa                            allnoconfig    gcc-16.1.0
xtensa                           allyesconfig    clang-20
xtensa                generic_kc705_defconfig    gcc-16.1.0
xtensa                          iss_defconfig    gcc-16.1.0
xtensa                randconfig-001-20260911    gcc-13.4.0
xtensa                randconfig-001-20260912    gcc-14.3.0
xtensa                randconfig-001-20260913    gcc-15.2.0
xtensa                randconfig-002-20260911    gcc-13.4.0
xtensa                randconfig-002-20260912    gcc-14.3.0
xtensa                randconfig-002-20260913    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
