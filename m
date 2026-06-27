Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB556231A41
	for <linux-usb@vger.kernel.org>; Sat, 27 Jun 2026 06:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782541361; cv=none; b=UFFb3lbeujD6FzVO11SMfzZp8m/OevajVsjGNvfsYPpXP8v7SjGkVshw80b+MUJ/2dyVpQ9SUlkcd/V4jNbOMP6AIQzUmglhAO4wp7PLQErQYtd7Ee6VNNUM2HkHJIEz5gezvYKue9bCn6a7LQCuTvDLt9lgzVzoYUUvFPYFyLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782541361; c=relaxed/simple;
	bh=QL5IvEIJhEwl/rSb3ffoBlSbk7RL6CFvVirdf2T1W7E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c87iAWM9z/9q4ssRL9gvUt1MktFSsKqB4xiqXtCa3e/IGNqWybTLvNpR2dhE+KmZWj2JgnoPp6zhiY4wAuHaZIeoHOZao98ptm2AR3hyjjt6PQDtNnHdvr4i86cNdgMJDlREzWqw+Gwy8G/2WfR4jG7NDlCfGSninHCUiif0KNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DpHok5lA; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DpHok5lA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782541360; x=1814077360;
  h=date:from:to:cc:subject:message-id;
  bh=QL5IvEIJhEwl/rSb3ffoBlSbk7RL6CFvVirdf2T1W7E=;
  b=DpHok5lAGyigcyTDh87ukuGN+MAFXfMDM1OoYj53AxcWqVdZg624f/J/
   jKptD92yzDsqOoytGR3YjH3T8FjNoKcMuirhs6Olw8lStZKUCF9bCgP4r
   UE/eehtylWN/49lvr7DDpQ7Zyxtl6Xc47Wxkp9Z/jT0JpgePLcQjW0tO+
   SUiOKFE8mnljq3aEWL7mG6Fxbw2XWKodFkgfMqzSgimLzw+tOOAsAxtRh
   PEcA59dFy+QfyhVQ0dfa2bf4kpWq6QXTXlXqP1XEdNZ5+yWoFv5aegbtm
   ZGBg0y9f4HHNWH92WcU08BGHVtGXNoVAxYWDyW2pHTTJ8gsh6iGWpZErr
   w==;
X-CSE-ConnectionGUID: XRqe5WtST8ys1W25OO+ylw==
X-CSE-MsgGUID: UhhUa7E9SoS2WQajfzQQfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="93978538"
X-IronPort-AV: E=Sophos;i="6.24,228,1774335600"; 
   d="scan'208";a="93978538"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 23:22:37 -0700
X-CSE-ConnectionGUID: Ub9juTw7T9CEnbLuDIlxLQ==
X-CSE-MsgGUID: 0GslDQgpQf6iJJ2buLsFZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,228,1774335600"; 
   d="scan'208";a="247032731"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 26 Jun 2026 23:22:35 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdMQy-000000005fp-428f;
	Sat, 27 Jun 2026 06:22:32 +0000
Date: Sat, 27 Jun 2026 14:21:49 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:fixes] BUILD SUCCESS
 db79679595326fd3f6bd1e6fd0cefc3ba016039a
Message-ID: <202606271439.kmFRBIKz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git fixes
branch HEAD: db79679595326fd3f6bd1e6fd0cefc3ba016039a  thunderbolt: Bound the DROM dual link port number before indexing sw->ports

elapsed time: 740m

configs tested: 289
configs skipped: 5

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
arc                 nsimosci_hs_smp_defconfig    gcc-16.1.0
arc                   randconfig-001-20260627    gcc-16.1.0
arc                   randconfig-002-20260627    gcc-16.1.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                         lpc18xx_defconfig    clang-23
arm                   randconfig-001-20260627    gcc-16.1.0
arm                   randconfig-002-20260627    gcc-16.1.0
arm                   randconfig-003-20260627    gcc-16.1.0
arm                   randconfig-004-20260627    gcc-16.1.0
arm                           spitz_defconfig    gcc-16.1.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    clang-23
arm64                 randconfig-001-20260627    clang-23
arm64                 randconfig-001-20260627    gcc-10.5.0
arm64                          randconfig-002    clang-23
arm64                 randconfig-002-20260627    clang-23
arm64                 randconfig-002-20260627    gcc-10.5.0
arm64                          randconfig-003    clang-23
arm64                 randconfig-003-20260627    clang-23
arm64                 randconfig-003-20260627    gcc-10.5.0
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260627    clang-23
arm64                 randconfig-004-20260627    gcc-10.5.0
arm64                 randconfig-004-20260627    gcc-16.1.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    clang-23
csky                  randconfig-001-20260627    clang-23
csky                  randconfig-001-20260627    gcc-10.5.0
csky                  randconfig-001-20260627    gcc-16.1.0
csky                           randconfig-002    clang-23
csky                  randconfig-002-20260627    clang-23
csky                  randconfig-002-20260627    gcc-10.5.0
csky                  randconfig-002-20260627    gcc-14.3.0
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260627    clang-23
hexagon               randconfig-001-20260627    gcc-11.5.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260627    clang-18
hexagon               randconfig-002-20260627    gcc-11.5.0
i386                             allmodconfig    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                 buildonly-randconfig-001    clang-22
i386        buildonly-randconfig-001-20260627    clang-22
i386                 buildonly-randconfig-002    clang-22
i386        buildonly-randconfig-002-20260627    clang-22
i386                 buildonly-randconfig-003    clang-22
i386        buildonly-randconfig-003-20260627    clang-22
i386                 buildonly-randconfig-004    clang-22
i386        buildonly-randconfig-004-20260627    clang-22
i386                 buildonly-randconfig-005    clang-22
i386        buildonly-randconfig-005-20260627    clang-22
i386        buildonly-randconfig-005-20260627    gcc-13
i386                 buildonly-randconfig-006    clang-22
i386        buildonly-randconfig-006-20260627    clang-22
i386                                defconfig    gcc-16.1.0
i386                           randconfig-001    clang-22
i386                  randconfig-001-20260627    clang-22
i386                           randconfig-002    clang-22
i386                  randconfig-002-20260627    clang-22
i386                           randconfig-003    clang-22
i386                  randconfig-003-20260627    clang-22
i386                  randconfig-003-20260627    gcc-13
i386                           randconfig-004    clang-22
i386                  randconfig-004-20260627    clang-22
i386                           randconfig-005    clang-22
i386                  randconfig-005-20260627    clang-22
i386                           randconfig-006    clang-22
i386                  randconfig-006-20260627    clang-22
i386                  randconfig-006-20260627    gcc-14
i386                           randconfig-007    clang-22
i386                  randconfig-007-20260627    clang-22
i386                  randconfig-011-20260627    clang-22
i386                  randconfig-012-20260627    clang-22
i386                  randconfig-013-20260627    clang-22
i386                  randconfig-014-20260627    clang-22
i386                  randconfig-015-20260627    clang-22
i386                  randconfig-016-20260627    clang-22
i386                  randconfig-017-20260627    clang-22
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260627    clang-23
loongarch             randconfig-001-20260627    gcc-11.5.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260627    gcc-11.5.0
loongarch             randconfig-002-20260627    gcc-16.1.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    clang-23
m68k                                defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
microblaze                          defconfig    gcc-16.1.0
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                               defconfig    gcc-11.5.0
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260627    gcc-11.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260627    gcc-11.5.0
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                         randconfig-001    gcc-8.5.0
parisc                randconfig-001-20260627    gcc-8.5.0
parisc                         randconfig-002    gcc-8.5.0
parisc                randconfig-002-20260627    gcc-8.5.0
parisc64                            defconfig    clang-23
parisc64                            defconfig    gcc-16.1.0
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc                   motionpro_defconfig    clang-23
powerpc               mpc834x_itxgp_defconfig    clang-23
powerpc                        randconfig-001    gcc-8.5.0
powerpc               randconfig-001-20260627    gcc-8.5.0
powerpc                        randconfig-002    gcc-8.5.0
powerpc               randconfig-002-20260627    gcc-8.5.0
powerpc64                      randconfig-001    gcc-8.5.0
powerpc64             randconfig-001-20260627    gcc-8.5.0
powerpc64                      randconfig-002    gcc-8.5.0
powerpc64             randconfig-002-20260627    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                          randconfig-001    clang-23
riscv                 randconfig-001-20260627    clang-22
riscv                 randconfig-001-20260627    clang-23
riscv                          randconfig-002    clang-23
riscv                 randconfig-002-20260627    clang-23
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    clang-23
s390                  randconfig-001-20260627    clang-17
s390                  randconfig-001-20260627    clang-23
s390                           randconfig-002    clang-23
s390                  randconfig-002-20260627    clang-23
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-16.1.0
sh                             randconfig-001    clang-23
sh                    randconfig-001-20260627    clang-23
sh                    randconfig-001-20260627    gcc-16.1.0
sh                             randconfig-002    clang-23
sh                    randconfig-002-20260627    clang-23
sh                    randconfig-002-20260627    gcc-10.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                          randconfig-001    gcc-8.5.0
sparc                 randconfig-001-20260627    gcc-13.4.0
sparc                 randconfig-001-20260627    gcc-8.5.0
sparc                          randconfig-002    gcc-8.5.0
sparc                 randconfig-002-20260627    gcc-8.5.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-8.5.0
sparc64               randconfig-001-20260627    gcc-13.4.0
sparc64               randconfig-001-20260627    gcc-8.5.0
sparc64                        randconfig-002    gcc-8.5.0
sparc64               randconfig-002-20260627    gcc-15.2.0
sparc64               randconfig-002-20260627    gcc-8.5.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    clang-23
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-8.5.0
um                    randconfig-001-20260627    clang-22
um                    randconfig-001-20260627    gcc-8.5.0
um                             randconfig-002    gcc-8.5.0
um                    randconfig-002-20260627    clang-23
um                    randconfig-002-20260627    gcc-8.5.0
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260627    gcc-13
x86_64      buildonly-randconfig-001-20260627    gcc-14
x86_64      buildonly-randconfig-002-20260627    clang-22
x86_64      buildonly-randconfig-002-20260627    gcc-14
x86_64      buildonly-randconfig-003-20260627    clang-22
x86_64      buildonly-randconfig-003-20260627    gcc-14
x86_64      buildonly-randconfig-004-20260627    gcc-14
x86_64      buildonly-randconfig-005-20260627    clang-22
x86_64      buildonly-randconfig-005-20260627    gcc-14
x86_64      buildonly-randconfig-006-20260627    clang-22
x86_64      buildonly-randconfig-006-20260627    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260627    clang-22
x86_64                randconfig-002-20260627    clang-22
x86_64                randconfig-002-20260627    gcc-12
x86_64                randconfig-003-20260627    clang-22
x86_64                randconfig-004-20260627    clang-22
x86_64                randconfig-004-20260627    gcc-14
x86_64                randconfig-005-20260627    clang-22
x86_64                randconfig-005-20260627    gcc-14
x86_64                randconfig-006-20260627    clang-22
x86_64                randconfig-011-20260627    clang-22
x86_64                randconfig-011-20260627    gcc-14
x86_64                randconfig-012-20260627    clang-22
x86_64                randconfig-012-20260627    gcc-14
x86_64                randconfig-013-20260627    gcc-14
x86_64                randconfig-014-20260627    gcc-14
x86_64                randconfig-015-20260627    gcc-14
x86_64                randconfig-016-20260627    gcc-14
x86_64                randconfig-071-20260627    clang-22
x86_64                randconfig-072-20260627    clang-22
x86_64                randconfig-073-20260627    clang-22
x86_64                randconfig-074-20260627    clang-22
x86_64                randconfig-074-20260627    gcc-14
x86_64                randconfig-075-20260627    clang-22
x86_64                randconfig-075-20260627    gcc-14
x86_64                randconfig-076-20260627    clang-22
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
xtensa                         randconfig-001    gcc-8.5.0
xtensa                randconfig-001-20260627    gcc-8.5.0
xtensa                         randconfig-002    gcc-8.5.0
xtensa                randconfig-002-20260627    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
