Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D49B3D6691
	for <linux-usb@vger.kernel.org>; Fri, 12 Jun 2026 22:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781304947; cv=none; b=PgBPLOpVdSyUjbjPhbZfwGayGIB3WFfi5lh4XN13nq27Nc9oes999j5+fJyOiTMsbHPHxU2YAfqBzE5EPFjZgCldKzTTEFrLryY6Ta/OuSP8SWlAgnmxqHd7z4LqHxC6uQaI72jK/HqZ9AqTUCqGAvKz2Cvvr/QkeeS7uFhVKsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781304947; c=relaxed/simple;
	bh=xqdYgUPFdj44xvVvvRORRPnTkmDCo5qAWyrHKP1OJ4Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IeP0IBTlYYV36tlo+79rOVJKUNm4RkY2Q/rUaWT/vLYRQvCn+TMFFqT848xAKHbSVtgcRJcYaBIFOadOWDqfL3lwcZL58gwbr46tdAi2htwCpP1+gcRHK9kzROgBBfQyAzTUEjqbuWNJtUh7PKTCDnUXTX8BVbYWZBIn7hUcNyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AkBPMsvv; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AkBPMsvv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781304946; x=1812840946;
  h=date:from:to:cc:subject:message-id;
  bh=xqdYgUPFdj44xvVvvRORRPnTkmDCo5qAWyrHKP1OJ4Q=;
  b=AkBPMsvvADsHy6BfKxAVxu7aS6Dpw4xzOhcA373YBlUNamSVigKcaZSM
   hQE6pMgyJb/Rka2KI8/kuBXRE2HzR0EtzXcpaYYwjCA7/Co3TqSuVqfB5
   2Xl66tXP7XkwNTRcP5SAQN4ItUFNWEASaFTiMlUxwJZYNCe2D0t8g/ZqQ
   XjAFd3FIAcapGsvEH2pCTCcJb8jnOsi1mmfa/80iRZDQ5tPLflHafpLqc
   2jwzRKFTEnLnCujx7T6NUZ7Xzw5MAZQSEi2XSz2dSnjzEDTzOMx9hO2s3
   eQfd2dYkyDgnAlZ6ozkBWLWR80VOxaWwLYHWdCN12a/Rl8hxNWTk/fkcU
   A==;
X-CSE-ConnectionGUID: Ca3f/is+SQulivECDGLEGg==
X-CSE-MsgGUID: 4CVWZ/JhQnOhmEa4j81QDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="99723644"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="99723644"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 15:55:45 -0700
X-CSE-ConnectionGUID: qMW+xmrgRLS1OPinT3F6Ug==
X-CSE-MsgGUID: 73xH+W4YRxS57rXjfEKXdg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Jun 2026 15:55:44 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYAmr-00000000PPh-0lPp;
	Fri, 12 Jun 2026 22:55:41 +0000
Date: Sat, 13 Jun 2026 06:55:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 f176a7c3e44f80b4493d22aa12d02673243ec7d8
Message-ID: <202606130656.SnZ3d6La-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: f176a7c3e44f80b4493d22aa12d02673243ec7d8  Merge tag 'thunderbolt-for-v7.2-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-next

elapsed time: 828m

configs tested: 304
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260612    gcc-13.4.0
arc                   randconfig-001-20260613    gcc-12.5.0
arc                   randconfig-002-20260612    gcc-13.4.0
arc                   randconfig-002-20260613    gcc-12.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                         axm55xx_defconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260612    gcc-13.4.0
arm                   randconfig-001-20260613    gcc-12.5.0
arm                   randconfig-002-20260612    gcc-13.4.0
arm                   randconfig-002-20260613    gcc-12.5.0
arm                   randconfig-003-20260612    gcc-13.4.0
arm                   randconfig-003-20260613    gcc-12.5.0
arm                   randconfig-004-20260612    gcc-13.4.0
arm                   randconfig-004-20260613    gcc-12.5.0
arm                       spear13xx_defconfig    gcc-16.1.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    gcc-13.4.0
arm64                 randconfig-001-20260612    gcc-13.4.0
arm64                 randconfig-001-20260613    gcc-16.1.0
arm64                          randconfig-002    gcc-13.4.0
arm64                 randconfig-002-20260612    gcc-13.4.0
arm64                 randconfig-002-20260613    gcc-16.1.0
arm64                          randconfig-003    gcc-13.4.0
arm64                 randconfig-003-20260612    gcc-13.4.0
arm64                 randconfig-003-20260613    gcc-16.1.0
arm64                          randconfig-004    gcc-13.4.0
arm64                 randconfig-004-20260612    gcc-13.4.0
arm64                 randconfig-004-20260613    gcc-16.1.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    gcc-13.4.0
csky                  randconfig-001-20260612    gcc-13.4.0
csky                  randconfig-001-20260613    gcc-16.1.0
csky                           randconfig-002    gcc-13.4.0
csky                  randconfig-002-20260612    gcc-13.4.0
csky                  randconfig-002-20260613    gcc-16.1.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260612    clang-23
hexagon               randconfig-001-20260612    gcc-11.5.0
hexagon               randconfig-001-20260613    clang-23
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260612    clang-23
hexagon               randconfig-002-20260612    gcc-11.5.0
hexagon               randconfig-002-20260613    clang-23
i386                             allmodconfig    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                             allyesconfig    gcc-14
i386                 buildonly-randconfig-001    gcc-14
i386        buildonly-randconfig-001-20260612    gcc-14
i386                 buildonly-randconfig-002    gcc-14
i386        buildonly-randconfig-002-20260612    gcc-14
i386                 buildonly-randconfig-003    gcc-14
i386        buildonly-randconfig-003-20260612    gcc-14
i386                 buildonly-randconfig-004    gcc-14
i386        buildonly-randconfig-004-20260612    gcc-14
i386                 buildonly-randconfig-005    gcc-14
i386        buildonly-randconfig-005-20260612    gcc-14
i386                 buildonly-randconfig-006    gcc-14
i386        buildonly-randconfig-006-20260612    gcc-14
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260612    clang-22
i386                  randconfig-001-20260613    clang-22
i386                  randconfig-002-20260612    clang-22
i386                  randconfig-002-20260613    clang-22
i386                  randconfig-003-20260612    clang-22
i386                  randconfig-003-20260613    clang-22
i386                  randconfig-004-20260612    clang-22
i386                  randconfig-004-20260613    clang-22
i386                  randconfig-005-20260612    clang-22
i386                  randconfig-005-20260613    clang-22
i386                  randconfig-006-20260612    clang-22
i386                  randconfig-006-20260613    clang-22
i386                  randconfig-007-20260612    clang-22
i386                  randconfig-007-20260613    clang-22
i386                           randconfig-011    clang-22
i386                  randconfig-011-20260612    clang-22
i386                  randconfig-011-20260613    gcc-14
i386                           randconfig-012    clang-22
i386                  randconfig-012-20260612    clang-22
i386                  randconfig-012-20260613    gcc-14
i386                           randconfig-013    clang-22
i386                  randconfig-013-20260612    clang-22
i386                  randconfig-013-20260613    gcc-14
i386                           randconfig-014    clang-22
i386                  randconfig-014-20260612    clang-22
i386                  randconfig-014-20260613    gcc-14
i386                           randconfig-015    clang-22
i386                  randconfig-015-20260612    clang-22
i386                  randconfig-015-20260613    gcc-14
i386                           randconfig-016    clang-22
i386                  randconfig-016-20260612    clang-22
i386                  randconfig-016-20260613    gcc-14
i386                           randconfig-017    clang-22
i386                  randconfig-017-20260612    clang-22
i386                  randconfig-017-20260613    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260612    clang-23
loongarch             randconfig-001-20260612    gcc-11.5.0
loongarch             randconfig-001-20260613    clang-23
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260612    clang-23
loongarch             randconfig-002-20260612    gcc-11.5.0
loongarch             randconfig-002-20260613    clang-23
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                          atari_defconfig    gcc-16.1.0
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
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260612    clang-23
nios2                 randconfig-001-20260612    gcc-11.5.0
nios2                 randconfig-001-20260613    clang-23
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260612    clang-23
nios2                 randconfig-002-20260612    gcc-11.5.0
nios2                 randconfig-002-20260613    clang-23
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    clang-23
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260613    gcc-15.2.0
parisc                randconfig-002-20260613    gcc-15.2.0
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc                  mpc885_ads_defconfig    clang-23
powerpc               randconfig-001-20260613    gcc-15.2.0
powerpc               randconfig-002-20260613    gcc-15.2.0
powerpc64             randconfig-001-20260613    gcc-15.2.0
powerpc64             randconfig-002-20260613    gcc-15.2.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                          randconfig-001    gcc-11.5.0
riscv                 randconfig-001-20260612    gcc-11.5.0
riscv                 randconfig-001-20260613    gcc-10.5.0
riscv                          randconfig-002    gcc-11.5.0
riscv                 randconfig-002-20260612    gcc-11.5.0
riscv                 randconfig-002-20260613    gcc-10.5.0
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    gcc-11.5.0
s390                  randconfig-001-20260612    gcc-11.5.0
s390                  randconfig-001-20260613    gcc-10.5.0
s390                           randconfig-002    gcc-11.5.0
s390                  randconfig-002-20260612    gcc-11.5.0
s390                  randconfig-002-20260613    gcc-10.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-23
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                             randconfig-001    gcc-11.5.0
sh                    randconfig-001-20260612    gcc-11.5.0
sh                    randconfig-001-20260613    gcc-10.5.0
sh                             randconfig-002    gcc-11.5.0
sh                    randconfig-002-20260612    gcc-11.5.0
sh                    randconfig-002-20260613    gcc-10.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260612    gcc-8.5.0
sparc                 randconfig-001-20260613    gcc-13.4.0
sparc                 randconfig-002-20260612    gcc-8.5.0
sparc                 randconfig-002-20260613    gcc-13.4.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260612    gcc-8.5.0
sparc64               randconfig-001-20260613    gcc-13.4.0
sparc64               randconfig-002-20260612    gcc-8.5.0
sparc64               randconfig-002-20260613    gcc-13.4.0
um                               allmodconfig    clang-23
um                                allnoconfig    clang-16
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260612    gcc-8.5.0
um                    randconfig-001-20260613    gcc-13.4.0
um                    randconfig-002-20260612    gcc-8.5.0
um                    randconfig-002-20260613    gcc-13.4.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260612    gcc-14
x86_64      buildonly-randconfig-001-20260613    clang-22
x86_64      buildonly-randconfig-002-20260612    gcc-14
x86_64      buildonly-randconfig-002-20260613    clang-22
x86_64      buildonly-randconfig-003-20260612    gcc-14
x86_64      buildonly-randconfig-003-20260613    clang-22
x86_64      buildonly-randconfig-004-20260612    gcc-14
x86_64      buildonly-randconfig-004-20260613    clang-22
x86_64      buildonly-randconfig-005-20260612    gcc-14
x86_64      buildonly-randconfig-005-20260613    clang-22
x86_64      buildonly-randconfig-006-20260612    gcc-14
x86_64      buildonly-randconfig-006-20260613    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260612    clang-22
x86_64                randconfig-001-20260613    clang-22
x86_64                randconfig-002-20260612    clang-22
x86_64                randconfig-002-20260613    clang-22
x86_64                randconfig-003-20260612    clang-22
x86_64                randconfig-003-20260613    clang-22
x86_64                randconfig-004-20260612    clang-22
x86_64                randconfig-004-20260613    clang-22
x86_64                randconfig-005-20260612    clang-22
x86_64                randconfig-005-20260613    clang-22
x86_64                randconfig-006-20260612    clang-22
x86_64                randconfig-006-20260613    clang-22
x86_64                         randconfig-011    clang-22
x86_64                randconfig-011-20260612    clang-22
x86_64                         randconfig-012    clang-22
x86_64                randconfig-012-20260612    clang-22
x86_64                         randconfig-013    clang-22
x86_64                randconfig-013-20260612    clang-22
x86_64                         randconfig-014    clang-22
x86_64                randconfig-014-20260612    clang-22
x86_64                         randconfig-015    clang-22
x86_64                randconfig-015-20260612    clang-22
x86_64                         randconfig-016    clang-22
x86_64                randconfig-016-20260612    clang-22
x86_64                randconfig-071-20260612    gcc-14
x86_64                randconfig-071-20260613    clang-22
x86_64                randconfig-072-20260612    gcc-14
x86_64                randconfig-072-20260613    clang-22
x86_64                randconfig-073-20260612    gcc-14
x86_64                randconfig-073-20260613    clang-22
x86_64                randconfig-074-20260612    gcc-14
x86_64                randconfig-074-20260613    clang-22
x86_64                randconfig-075-20260612    gcc-14
x86_64                randconfig-075-20260613    clang-22
x86_64                randconfig-076-20260612    gcc-14
x86_64                randconfig-076-20260613    clang-22
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
xtensa                randconfig-001-20260612    gcc-8.5.0
xtensa                randconfig-001-20260613    gcc-13.4.0
xtensa                randconfig-002-20260612    gcc-8.5.0
xtensa                randconfig-002-20260613    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
