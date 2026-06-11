Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584B014BF92
	for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 01:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781143117; cv=none; b=Z+LgnQtj/OhhSqTi9sJXwSetKS9rjEGj5d3ASN8cfJdi6wR7PkTfrErIdpJMHlOOSrV3jhFcPT84JgSC9845etPITjV8Y/Uj8VJ6s1pzRZBs1d/R4DxyNbyRzCCYVeZWKnHMW3rFvajDWkAW3q0jFcmXW5J32JR1aNhrOm3rFuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781143117; c=relaxed/simple;
	bh=s4HejIkgWIr13B5+Kj7Q4anVTre+tYvSGOzzUQbs2U8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u5n/W1UMfGRyMmF4LS4GpzSUVpqgeMokTWXsLHuExfIIp/8o88UrcOQn17lwQ37DAdHIVEvtW2wkT3A2EP4QxON8JTk0DGM3XSAbK3+Bz5A0mucpJiczC9qocrlJCKD6+68N52NWnU3GCrPf4gYZJO66e14vb2hhEvhYHUfWutg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N9vqpR7U; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N9vqpR7U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781143116; x=1812679116;
  h=date:from:to:cc:subject:message-id;
  bh=s4HejIkgWIr13B5+Kj7Q4anVTre+tYvSGOzzUQbs2U8=;
  b=N9vqpR7U4DwQdYU96QODcz+EkOZAHFY46pubx3YBuTjTR4Kb6XGsLfwX
   y8y33R5mgngeOyK/KA2cVKIA+QVB+X9GrTuffoXGoNUGC9n+TCC9UvPVF
   M4Yjdkk/naJxdJ63enC2qFN/wWVAUZKbWQDrKiQARPvz7saRHd/NZ/DPj
   88KkbKs/2GcZ8vFbPMgeTNFH8M1HGuc12HwE+Ypo63Hf1beNYGCRGVrSJ
   SU7Hl4SWwFUZ8ghD6RFunnePcmCPlhFiWXYHtuyo9r26/1nD4nvEQvo7w
   r3I+IO/H4aEBs8oc/aPiCVmsWmxcG5mWFDG3yDkF7GVnO2nS5lGLFK4L4
   w==;
X-CSE-ConnectionGUID: Ki+jvwuDTH2TohjyOXPwzQ==
X-CSE-MsgGUID: 3v5RSJRDRAyW0ndqHaCvQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81085122"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="81085122"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 18:58:36 -0700
X-CSE-ConnectionGUID: +1j69R3FQByIwy/h+vTLEQ==
X-CSE-MsgGUID: 7cXUTkAPSQSV0RKlBRVnLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="248206913"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Jun 2026 18:58:34 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXUgh-00000000M9a-3KA3;
	Thu, 11 Jun 2026 01:58:31 +0000
Date: Thu, 11 Jun 2026 09:57:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 e47832c73b83ec21e67026726a1c8124697792af
Message-ID: <202606110950.nFocOptN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: e47832c73b83ec21e67026726a1c8124697792af  Merge tag 'usb-serial-7.1-rc8' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

elapsed time: 903m

configs tested: 240
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                            randconfig-001    gcc-14.3.0
arc                   randconfig-001-20260611    gcc-14.3.0
arc                            randconfig-002    gcc-14.3.0
arc                   randconfig-002-20260611    gcc-14.3.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                        mvebu_v7_defconfig    clang-23
arm                            randconfig-001    gcc-14.3.0
arm                   randconfig-001-20260611    gcc-14.3.0
arm                            randconfig-002    gcc-14.3.0
arm                   randconfig-002-20260611    gcc-14.3.0
arm                            randconfig-003    gcc-14.3.0
arm                   randconfig-003-20260611    gcc-14.3.0
arm                            randconfig-004    gcc-14.3.0
arm                   randconfig-004-20260611    gcc-14.3.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260611    gcc-14.3.0
arm64                 randconfig-002-20260611    gcc-14.3.0
arm64                 randconfig-003-20260611    gcc-14.3.0
arm64                 randconfig-004-20260611    gcc-14.3.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260611    gcc-14.3.0
csky                  randconfig-002-20260611    gcc-14.3.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260611    clang-17
hexagon               randconfig-002-20260611    clang-17
i386                             allmodconfig    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                             allyesconfig    gcc-14
i386                 buildonly-randconfig-001    clang-22
i386        buildonly-randconfig-001-20260611    clang-22
i386                 buildonly-randconfig-002    clang-22
i386        buildonly-randconfig-002-20260611    clang-22
i386                 buildonly-randconfig-003    clang-22
i386        buildonly-randconfig-003-20260611    clang-22
i386                 buildonly-randconfig-004    clang-22
i386        buildonly-randconfig-004-20260611    clang-22
i386                 buildonly-randconfig-005    clang-22
i386        buildonly-randconfig-005-20260611    clang-22
i386                 buildonly-randconfig-006    clang-22
i386        buildonly-randconfig-006-20260611    clang-22
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260610    gcc-14
i386                  randconfig-001-20260611    gcc-14
i386                  randconfig-002-20260610    gcc-14
i386                  randconfig-002-20260611    gcc-14
i386                  randconfig-003-20260610    gcc-14
i386                  randconfig-003-20260611    gcc-14
i386                  randconfig-004-20260610    gcc-14
i386                  randconfig-004-20260611    gcc-14
i386                  randconfig-005-20260610    gcc-14
i386                  randconfig-005-20260611    gcc-14
i386                  randconfig-006-20260610    gcc-14
i386                  randconfig-006-20260611    gcc-14
i386                  randconfig-007-20260610    gcc-14
i386                  randconfig-007-20260611    gcc-14
i386                  randconfig-011-20260610    gcc-14
i386                  randconfig-011-20260611    gcc-14
i386                  randconfig-012-20260610    gcc-14
i386                  randconfig-012-20260611    gcc-14
i386                  randconfig-013-20260610    gcc-14
i386                  randconfig-013-20260611    gcc-14
i386                  randconfig-014-20260610    gcc-14
i386                  randconfig-014-20260611    gcc-14
i386                  randconfig-015-20260610    gcc-14
i386                  randconfig-015-20260611    gcc-14
i386                  randconfig-016-20260610    gcc-14
i386                  randconfig-016-20260611    gcc-14
i386                  randconfig-017-20260610    gcc-14
i386                  randconfig-017-20260611    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260611    clang-17
loongarch             randconfig-002-20260611    clang-17
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                                defconfig    clang-23
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260611    clang-17
nios2                 randconfig-002-20260611    clang-17
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
openrisc                 simple_smp_defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260611    gcc-13.4.0
parisc                randconfig-002-20260611    gcc-13.4.0
parisc64                            defconfig    clang-23
powerpc                     akebono_defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc               randconfig-001-20260611    gcc-13.4.0
powerpc               randconfig-002-20260611    gcc-13.4.0
powerpc64             randconfig-001-20260611    gcc-13.4.0
powerpc64             randconfig-002-20260611    gcc-13.4.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260610    gcc-15.2.0
riscv                 randconfig-001-20260610    gcc-16.1.0
riscv                 randconfig-001-20260611    gcc-12.5.0
riscv                 randconfig-002-20260610    gcc-16.1.0
riscv                 randconfig-002-20260610    gcc-8.5.0
riscv                 randconfig-002-20260611    gcc-12.5.0
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260610    clang-23
s390                  randconfig-001-20260610    gcc-16.1.0
s390                  randconfig-001-20260611    gcc-12.5.0
s390                  randconfig-002-20260610    clang-23
s390                  randconfig-002-20260610    gcc-16.1.0
s390                  randconfig-002-20260611    gcc-12.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260610    gcc-16.1.0
sh                    randconfig-001-20260611    gcc-12.5.0
sh                    randconfig-002-20260610    gcc-16.1.0
sh                    randconfig-002-20260611    gcc-12.5.0
sh                   sh7770_generic_defconfig    gcc-16.1.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260611    gcc-15.2.0
sparc                 randconfig-002-20260611    gcc-15.2.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260611    gcc-15.2.0
sparc64               randconfig-002-20260611    gcc-15.2.0
um                               allmodconfig    clang-17
um                               allmodconfig    clang-23
um                                allnoconfig    clang-16
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260611    gcc-15.2.0
um                    randconfig-002-20260611    gcc-15.2.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260611    gcc-14
x86_64      buildonly-randconfig-002-20260611    gcc-14
x86_64      buildonly-randconfig-003-20260611    gcc-14
x86_64      buildonly-randconfig-004-20260611    gcc-14
x86_64      buildonly-randconfig-005-20260611    gcc-14
x86_64      buildonly-randconfig-006-20260611    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260610    gcc-13
x86_64                randconfig-001-20260611    gcc-14
x86_64                randconfig-002-20260610    gcc-13
x86_64                randconfig-002-20260611    gcc-14
x86_64                randconfig-003-20260610    gcc-13
x86_64                randconfig-003-20260611    gcc-14
x86_64                randconfig-004-20260610    gcc-13
x86_64                randconfig-004-20260611    gcc-14
x86_64                randconfig-005-20260610    gcc-13
x86_64                randconfig-005-20260611    gcc-14
x86_64                randconfig-006-20260610    gcc-13
x86_64                randconfig-006-20260611    gcc-14
x86_64                randconfig-011-20260611    gcc-14
x86_64                randconfig-012-20260611    gcc-14
x86_64                randconfig-013-20260611    gcc-14
x86_64                randconfig-014-20260611    gcc-14
x86_64                randconfig-015-20260611    gcc-14
x86_64                randconfig-016-20260611    gcc-14
x86_64                randconfig-071-20260611    clang-22
x86_64                randconfig-072-20260611    clang-22
x86_64                randconfig-073-20260611    clang-22
x86_64                randconfig-074-20260611    clang-22
x86_64                randconfig-075-20260611    clang-22
x86_64                randconfig-076-20260611    clang-22
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-16.1.0
xtensa                           allyesconfig    clang-20
xtensa                           allyesconfig    gcc-16.1.0
xtensa                randconfig-001-20260611    gcc-15.2.0
xtensa                randconfig-002-20260611    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
