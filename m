Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8DD39184C
	for <linux-usb@vger.kernel.org>; Fri, 10 Jul 2026 20:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783715766; cv=none; b=msxlAXJGSaI92ll7PrGEjj3C1fXLTe8Kof+O/esA5tDeLzKzUIiYeN8Cd1Bon/MWMyZ3iNExOpXeZ+T8gwcFrCQwivJF8GNgyotF4DQ/1Ek5pWemMxiWbO9EKoptbPAiWlGoHWZSEPpT3AWjjeR45iIFtBD+ntHEMquuKPch56g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783715766; c=relaxed/simple;
	bh=/0iYjBxaAV2lWrBkLmF3uJZHpmEzzW7q+xfXsRZMHmE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pRUOfLh/hMpGbNw0Nm2TUmVB95PsSYi0SUn2rn+uSpYsixzxYaNBXRvnOaBU2YofF5X5s8n0/rRYtEvURO2Z5TQtXep0vck6E0ZwUB7HdOtbCzwYtj0D6VCwDEuBIdJIQjmqXRkhhkl2Tfh75hnyLIqM4tZCk2krwdtB8go4aPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DkVUxQrZ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DkVUxQrZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783715765; x=1815251765;
  h=date:from:to:cc:subject:message-id;
  bh=/0iYjBxaAV2lWrBkLmF3uJZHpmEzzW7q+xfXsRZMHmE=;
  b=DkVUxQrZUpWzAdCjYo4TmsqVSv1SX6LisW3yxxlQwZo7VfbYeFDs4AXE
   eS6ky9JUVzaHrxyO1IqhkCTGsmy/DROxwlyxC4NsbAJ9t6p2ebxk9YWMD
   gvgwBilag13LPXPYgZvnEYFflzEbBxWRFwuuNzjz6GEiVRxi3iaAd1UgT
   F6VcKst4pIzKP/F7ecd3pXZRmRooz7Dqd0zyI5u8EeXS+Q9ubAi5L7yx7
   WgofzVMBnBZXyQ8Zg242nkXXiVS0SRj1xcpJ65eBKxGo/0ZqzlhL+CfK1
   5Ukm27icULlN4oE2TybJnlrMsjTE42RsB2xZtiT8HPlHURvEyauxwGMWa
   Q==;
X-CSE-ConnectionGUID: eOl672oxRHKes/AN8Y6Xew==
X-CSE-MsgGUID: JYxkWU71SZedpJadkU6znQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83539026"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83539026"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 13:36:04 -0700
X-CSE-ConnectionGUID: B7k/nUzFTYK8r6sQWOycBg==
X-CSE-MsgGUID: gZAlqWefRaaeciMNy3SbGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259304516"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 10 Jul 2026 13:36:03 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiHx2-00000000JL9-2gjT;
	Fri, 10 Jul 2026 20:36:00 +0000
Date: Sat, 11 Jul 2026 04:35:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 0f1dabb7af982dae9325a005297785a792b51223
Message-ID: <202607110452.n6BU5UZo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: 0f1dabb7af982dae9325a005297785a792b51223  usb: dwc3: am62: Propagate USB2 refclk enable failures

elapsed time: 728m

configs tested: 286
configs skipped: 2

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
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                            randconfig-001    clang-23
arc                   randconfig-001-20260710    clang-23
arc                   randconfig-001-20260711    gcc-13.4.0
arc                            randconfig-002    clang-23
arc                   randconfig-002-20260710    clang-23
arc                   randconfig-002-20260711    gcc-13.4.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                            randconfig-001    clang-23
arm                   randconfig-001-20260710    clang-23
arm                   randconfig-001-20260711    gcc-13.4.0
arm                            randconfig-002    clang-23
arm                   randconfig-002-20260710    clang-23
arm                   randconfig-002-20260711    gcc-13.4.0
arm                            randconfig-003    clang-23
arm                   randconfig-003-20260710    clang-23
arm                   randconfig-003-20260711    gcc-13.4.0
arm                            randconfig-004    clang-23
arm                   randconfig-004-20260710    clang-23
arm                   randconfig-004-20260711    gcc-13.4.0
arm                          sp7021_defconfig    gcc-16.1.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    clang-23
arm64                 randconfig-001-20260710    clang-23
arm64                 randconfig-001-20260710    gcc-10.5.0
arm64                 randconfig-001-20260711    gcc-16.1.0
arm64                          randconfig-002    clang-23
arm64                 randconfig-002-20260710    clang-23
arm64                 randconfig-002-20260710    gcc-10.5.0
arm64                 randconfig-002-20260711    gcc-16.1.0
arm64                          randconfig-003    clang-23
arm64                 randconfig-003-20260710    clang-23
arm64                 randconfig-003-20260710    gcc-10.5.0
arm64                 randconfig-003-20260711    gcc-16.1.0
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260710    clang-23
arm64                 randconfig-004-20260710    gcc-10.5.0
arm64                 randconfig-004-20260711    gcc-16.1.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    clang-23
csky                  randconfig-001-20260710    clang-23
csky                  randconfig-001-20260710    gcc-10.5.0
csky                  randconfig-001-20260711    gcc-16.1.0
csky                           randconfig-002    clang-23
csky                  randconfig-002-20260710    clang-23
csky                  randconfig-002-20260710    gcc-10.5.0
csky                  randconfig-002-20260711    gcc-16.1.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260710    gcc-12.5.0
hexagon               randconfig-001-20260711    gcc-16.1.0
hexagon               randconfig-002-20260710    gcc-12.5.0
hexagon               randconfig-002-20260711    gcc-16.1.0
i386                             allmodconfig    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260710    clang-22
i386        buildonly-randconfig-002-20260710    clang-22
i386        buildonly-randconfig-003-20260710    clang-22
i386        buildonly-randconfig-004-20260710    clang-22
i386        buildonly-randconfig-005-20260710    clang-22
i386        buildonly-randconfig-006-20260710    clang-22
i386                                defconfig    gcc-16.1.0
i386                           randconfig-001    clang-22
i386                  randconfig-001-20260710    clang-22
i386                           randconfig-002    clang-22
i386                  randconfig-002-20260710    clang-22
i386                           randconfig-003    clang-22
i386                  randconfig-003-20260710    clang-22
i386                           randconfig-004    clang-22
i386                  randconfig-004-20260710    clang-22
i386                           randconfig-005    clang-22
i386                  randconfig-005-20260710    clang-22
i386                           randconfig-006    clang-22
i386                  randconfig-006-20260710    clang-22
i386                           randconfig-007    clang-22
i386                  randconfig-007-20260710    clang-22
i386                           randconfig-011    gcc-14
i386                  randconfig-011-20260710    gcc-14
i386                  randconfig-011-20260711    gcc-13
i386                           randconfig-012    gcc-14
i386                  randconfig-012-20260710    gcc-14
i386                  randconfig-012-20260711    gcc-13
i386                           randconfig-013    gcc-14
i386                  randconfig-013-20260710    gcc-14
i386                  randconfig-013-20260711    gcc-13
i386                           randconfig-014    gcc-14
i386                  randconfig-014-20260710    gcc-14
i386                  randconfig-014-20260711    gcc-13
i386                           randconfig-015    gcc-14
i386                  randconfig-015-20260710    gcc-14
i386                  randconfig-015-20260711    gcc-13
i386                           randconfig-016    gcc-14
i386                  randconfig-016-20260710    gcc-14
i386                  randconfig-016-20260711    gcc-13
i386                           randconfig-017    gcc-14
i386                  randconfig-017-20260710    gcc-14
i386                  randconfig-017-20260711    gcc-13
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260710    gcc-12.5.0
loongarch             randconfig-001-20260711    gcc-16.1.0
loongarch             randconfig-002-20260710    gcc-12.5.0
loongarch             randconfig-002-20260711    gcc-16.1.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    clang-23
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                malta_qemu_32r6_defconfig    gcc-16.1.0
mips                   sb1250_swarm_defconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260710    gcc-12.5.0
nios2                 randconfig-001-20260711    gcc-16.1.0
nios2                 randconfig-002-20260710    gcc-12.5.0
nios2                 randconfig-002-20260711    gcc-16.1.0
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                         randconfig-001    clang-17
parisc                randconfig-001-20260710    clang-17
parisc                         randconfig-002    clang-17
parisc                randconfig-002-20260710    clang-17
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc                       eiger_defconfig    clang-23
powerpc                 mpc836x_rdk_defconfig    clang-23
powerpc                        randconfig-001    clang-17
powerpc               randconfig-001-20260710    clang-17
powerpc                        randconfig-002    clang-17
powerpc               randconfig-002-20260710    clang-17
powerpc64                      randconfig-001    clang-17
powerpc64             randconfig-001-20260710    clang-17
powerpc64                      randconfig-002    clang-17
powerpc64             randconfig-002-20260710    clang-17
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260710    clang-17
riscv                 randconfig-001-20260711    gcc-8.5.0
riscv                 randconfig-002-20260710    clang-17
riscv                 randconfig-002-20260711    gcc-8.5.0
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260710    clang-17
s390                  randconfig-001-20260711    gcc-8.5.0
s390                  randconfig-002-20260710    clang-17
s390                  randconfig-002-20260711    gcc-8.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260710    clang-17
sh                    randconfig-001-20260711    gcc-8.5.0
sh                    randconfig-002-20260710    clang-17
sh                    randconfig-002-20260711    gcc-8.5.0
sh                   sh7724_generic_defconfig    gcc-16.1.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260711    gcc-16.1.0
sparc                 randconfig-002-20260711    gcc-16.1.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260711    gcc-16.1.0
sparc64               randconfig-002-20260711    gcc-16.1.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260711    gcc-16.1.0
um                    randconfig-002-20260711    gcc-16.1.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64               buildonly-randconfig-001    clang-22
x86_64      buildonly-randconfig-001-20260710    clang-22
x86_64               buildonly-randconfig-002    clang-22
x86_64      buildonly-randconfig-002-20260710    clang-22
x86_64               buildonly-randconfig-003    clang-22
x86_64      buildonly-randconfig-003-20260710    clang-22
x86_64               buildonly-randconfig-004    clang-22
x86_64      buildonly-randconfig-004-20260710    clang-22
x86_64               buildonly-randconfig-005    clang-22
x86_64      buildonly-randconfig-005-20260710    clang-22
x86_64               buildonly-randconfig-006    clang-22
x86_64      buildonly-randconfig-006-20260710    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                         randconfig-001    clang-22
x86_64                randconfig-001-20260710    clang-22
x86_64                randconfig-001-20260710    gcc-14
x86_64                         randconfig-002    clang-22
x86_64                randconfig-002-20260710    clang-22
x86_64                randconfig-002-20260710    gcc-14
x86_64                         randconfig-003    clang-22
x86_64                randconfig-003-20260710    clang-22
x86_64                randconfig-003-20260710    gcc-14
x86_64                         randconfig-004    clang-22
x86_64                randconfig-004-20260710    clang-22
x86_64                randconfig-004-20260710    gcc-14
x86_64                         randconfig-005    clang-22
x86_64                randconfig-005-20260710    clang-22
x86_64                randconfig-005-20260710    gcc-14
x86_64                         randconfig-006    clang-22
x86_64                randconfig-006-20260710    clang-22
x86_64                randconfig-006-20260710    gcc-14
x86_64                randconfig-011-20260710    clang-22
x86_64                randconfig-012-20260710    clang-22
x86_64                randconfig-013-20260710    clang-22
x86_64                randconfig-014-20260710    clang-22
x86_64                randconfig-015-20260710    clang-22
x86_64                randconfig-016-20260710    clang-22
x86_64                randconfig-071-20260710    gcc-14
x86_64                randconfig-072-20260710    gcc-14
x86_64                randconfig-073-20260710    gcc-14
x86_64                randconfig-074-20260710    gcc-14
x86_64                randconfig-075-20260710    gcc-14
x86_64                randconfig-076-20260710    gcc-14
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
xtensa                randconfig-001-20260711    gcc-16.1.0
xtensa                randconfig-002-20260711    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
