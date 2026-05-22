Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36971362153
	for <linux-usb@vger.kernel.org>; Fri, 22 May 2026 09:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779441887; cv=none; b=edT/78d0u0qSMshCb/b4GAvFKZmQJslMHjpxumhMIlYMh7j4yyC4eOo/zIrshP3+A/1BtWrq9FRuVc8LxAPxOVDWQl3j4Nh/gRCXueaWqB2ojRGf3OWo065smwA95xC4FHwD0Q5PFvJX1pXfiAZwcAK4Ozo6LAWMVhHNwJ5N4ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779441887; c=relaxed/simple;
	bh=CxXgCrgIjOfEFF1fkO1GzgWFmJcBOunVK2B7mfOk7f4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R+MGx6XGB/0fSl1hx9mJlYgWLdi0hp1i4Whq0cTdsXgoPV75rqOQoUDC1INuvgYtJ82IH4wRS9LeA0008gapVozwnHxOY6L/+XSQ2a69uXj+oC4Th7OVVgxLDNA0W73l93cWGVycU90kdGoELBEz7b0iyxzL6KOntOH2ybcfVtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LZfGxSCU; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LZfGxSCU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779441885; x=1810977885;
  h=date:from:to:cc:subject:message-id;
  bh=CxXgCrgIjOfEFF1fkO1GzgWFmJcBOunVK2B7mfOk7f4=;
  b=LZfGxSCUz3XyEQbApBFYnMDUW5LqLoSSI/SfOSWWUlttH9nBQmgvfXxq
   zO6Hhgrc3YlyRzpfLMBQk9Ol+4tU3I67RinzSJi1k5TWDOr7HL5Y34I+u
   QaNRpLw/8l7eWvccyPy2uqWP0uoCQgVYidIOfOpXQxB+bgs9RC/crc60X
   14Ir4ASvDR8n7V7hXtr0bE3cOVC+rQe3/RzvqLNL/EkuIyY1oagMPTK/X
   ZdU2pUMqkT12PVQyQUYzpnzsG3aBpmIKtslPeHSsSywVdIvKAcSW5cDM/
   MxMe/hoxjNs8Xu877R+doeq3E/qrdTbFcU2uBija3MPASvJvV+k5TMVTU
   A==;
X-CSE-ConnectionGUID: We2PcHn5QCyHpETA8gqruw==
X-CSE-MsgGUID: dyvYIPUySl2fPv5vJijfEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="90668129"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="90668129"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 02:24:45 -0700
X-CSE-ConnectionGUID: 2Lgyo0pLS+OXLzxMPUWdnA==
X-CSE-MsgGUID: DYQ9CuWFSvyvrU0Izg8OhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="238263108"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 May 2026 02:24:43 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQM7V-0000000027X-0MUX;
	Fri, 22 May 2026 09:24:41 +0000
Date: Fri, 22 May 2026 17:24:11 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 15bcac35ba045a9a459144901443210d8b1df7a3
Message-ID: <202605221704.dG5aUkzc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: 15bcac35ba045a9a459144901443210d8b1df7a3  thunderbolt: Add some more descriptive probe error messages

elapsed time: 1242m

configs tested: 299
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260521    gcc-8.5.0
arc                   randconfig-001-20260522    clang-23
arc                   randconfig-002-20260521    gcc-8.5.0
arc                   randconfig-002-20260522    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260521    gcc-8.5.0
arm                   randconfig-001-20260522    clang-23
arm                   randconfig-002-20260521    gcc-8.5.0
arm                   randconfig-002-20260522    clang-23
arm                   randconfig-003-20260521    gcc-8.5.0
arm                   randconfig-003-20260522    clang-23
arm                   randconfig-004-20260521    gcc-8.5.0
arm                   randconfig-004-20260522    clang-23
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                          randconfig-001    gcc-14.3.0
arm64                 randconfig-001-20260521    gcc-8.5.0
arm64                 randconfig-001-20260522    gcc-14.3.0
arm64                          randconfig-002    gcc-14.3.0
arm64                 randconfig-002-20260521    gcc-8.5.0
arm64                 randconfig-002-20260522    gcc-14.3.0
arm64                          randconfig-003    gcc-14.3.0
arm64                 randconfig-003-20260521    gcc-8.5.0
arm64                 randconfig-003-20260522    gcc-14.3.0
arm64                          randconfig-004    gcc-14.3.0
arm64                 randconfig-004-20260521    gcc-8.5.0
arm64                 randconfig-004-20260522    gcc-14.3.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                           randconfig-001    gcc-14.3.0
csky                  randconfig-001-20260521    gcc-8.5.0
csky                  randconfig-001-20260522    gcc-14.3.0
csky                           randconfig-002    gcc-14.3.0
csky                  randconfig-002-20260521    gcc-8.5.0
csky                  randconfig-002-20260522    gcc-14.3.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260521    gcc-11.5.0
hexagon               randconfig-001-20260522    gcc-8.5.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260521    gcc-11.5.0
hexagon               randconfig-002-20260522    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386                 buildonly-randconfig-001    clang-20
i386        buildonly-randconfig-001-20260521    clang-20
i386        buildonly-randconfig-001-20260522    clang-20
i386                 buildonly-randconfig-002    clang-20
i386        buildonly-randconfig-002-20260521    clang-20
i386        buildonly-randconfig-002-20260522    clang-20
i386                 buildonly-randconfig-003    clang-20
i386        buildonly-randconfig-003-20260521    clang-20
i386        buildonly-randconfig-003-20260522    clang-20
i386                 buildonly-randconfig-004    clang-20
i386        buildonly-randconfig-004-20260521    clang-20
i386        buildonly-randconfig-004-20260522    clang-20
i386                 buildonly-randconfig-005    clang-20
i386        buildonly-randconfig-005-20260521    clang-20
i386        buildonly-randconfig-005-20260522    clang-20
i386                 buildonly-randconfig-006    clang-20
i386        buildonly-randconfig-006-20260521    clang-20
i386        buildonly-randconfig-006-20260522    clang-20
i386                                defconfig    gcc-15.2.0
i386                           randconfig-001    clang-20
i386                  randconfig-001-20260521    clang-20
i386                  randconfig-001-20260522    gcc-13
i386                           randconfig-002    clang-20
i386                  randconfig-002-20260521    clang-20
i386                  randconfig-002-20260522    gcc-13
i386                           randconfig-003    clang-20
i386                  randconfig-003-20260521    clang-20
i386                  randconfig-003-20260522    gcc-13
i386                           randconfig-004    clang-20
i386                  randconfig-004-20260521    clang-20
i386                  randconfig-004-20260522    gcc-13
i386                           randconfig-005    clang-20
i386                  randconfig-005-20260521    clang-20
i386                  randconfig-005-20260522    gcc-13
i386                           randconfig-006    clang-20
i386                  randconfig-006-20260521    clang-20
i386                  randconfig-006-20260522    gcc-13
i386                           randconfig-007    clang-20
i386                  randconfig-007-20260521    clang-20
i386                  randconfig-007-20260522    gcc-13
i386                  randconfig-011-20260522    clang-20
i386                  randconfig-012-20260522    clang-20
i386                  randconfig-013-20260522    clang-20
i386                  randconfig-014-20260522    clang-20
i386                  randconfig-015-20260522    clang-20
i386                  randconfig-016-20260522    clang-20
i386                  randconfig-017-20260522    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260521    gcc-11.5.0
loongarch             randconfig-001-20260522    gcc-8.5.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260521    gcc-11.5.0
loongarch             randconfig-002-20260522    gcc-8.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                        m5272c3_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                      fuloong2e_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260521    gcc-11.5.0
nios2                 randconfig-001-20260522    gcc-8.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260521    gcc-11.5.0
nios2                 randconfig-002-20260522    gcc-8.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260522    gcc-12.5.0
parisc                randconfig-002-20260522    gcc-12.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260522    gcc-12.5.0
powerpc               randconfig-002-20260522    gcc-12.5.0
powerpc                    sam440ep_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260522    gcc-12.5.0
powerpc64             randconfig-002-20260522    gcc-12.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                          randconfig-001    gcc-15.2.0
riscv                 randconfig-001-20260521    gcc-15.2.0
riscv                 randconfig-001-20260522    gcc-10.5.0
riscv                          randconfig-002    gcc-15.2.0
riscv                 randconfig-002-20260521    gcc-15.2.0
riscv                 randconfig-002-20260522    gcc-10.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                           randconfig-001    gcc-15.2.0
s390                  randconfig-001-20260521    gcc-15.2.0
s390                  randconfig-001-20260522    gcc-10.5.0
s390                           randconfig-002    gcc-15.2.0
s390                  randconfig-002-20260521    gcc-15.2.0
s390                  randconfig-002-20260522    gcc-10.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                             randconfig-001    gcc-15.2.0
sh                    randconfig-001-20260521    gcc-15.2.0
sh                    randconfig-001-20260522    gcc-10.5.0
sh                             randconfig-002    gcc-15.2.0
sh                    randconfig-002-20260521    gcc-15.2.0
sh                    randconfig-002-20260522    gcc-10.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                          randconfig-001    gcc-8.5.0
sparc                 randconfig-001-20260521    gcc-8.5.0
sparc                 randconfig-001-20260522    gcc-9.5.0
sparc                          randconfig-002    gcc-8.5.0
sparc                 randconfig-002-20260521    gcc-8.5.0
sparc                 randconfig-002-20260522    gcc-9.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-8.5.0
sparc64               randconfig-001-20260521    gcc-8.5.0
sparc64               randconfig-001-20260522    gcc-9.5.0
sparc64                        randconfig-002    gcc-8.5.0
sparc64               randconfig-002-20260521    gcc-8.5.0
sparc64               randconfig-002-20260522    gcc-9.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-8.5.0
um                    randconfig-001-20260521    gcc-8.5.0
um                    randconfig-001-20260522    gcc-9.5.0
um                             randconfig-002    gcc-8.5.0
um                    randconfig-002-20260521    gcc-8.5.0
um                    randconfig-002-20260522    gcc-9.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260521    clang-20
x86_64      buildonly-randconfig-001-20260522    gcc-14
x86_64      buildonly-randconfig-002-20260521    clang-20
x86_64      buildonly-randconfig-002-20260522    gcc-14
x86_64      buildonly-randconfig-003-20260521    clang-20
x86_64      buildonly-randconfig-003-20260522    gcc-14
x86_64      buildonly-randconfig-004-20260521    clang-20
x86_64      buildonly-randconfig-004-20260522    gcc-14
x86_64      buildonly-randconfig-005-20260521    clang-20
x86_64      buildonly-randconfig-005-20260522    gcc-14
x86_64      buildonly-randconfig-006-20260521    clang-20
x86_64      buildonly-randconfig-006-20260522    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260521    clang-20
x86_64                randconfig-001-20260522    gcc-14
x86_64                randconfig-002-20260521    clang-20
x86_64                randconfig-002-20260522    gcc-14
x86_64                randconfig-003-20260521    clang-20
x86_64                randconfig-003-20260522    gcc-14
x86_64                randconfig-004-20260521    clang-20
x86_64                randconfig-004-20260522    gcc-14
x86_64                randconfig-005-20260521    clang-20
x86_64                randconfig-005-20260522    gcc-14
x86_64                randconfig-006-20260521    clang-20
x86_64                randconfig-006-20260522    gcc-14
x86_64                randconfig-011-20260521    gcc-14
x86_64                randconfig-011-20260522    gcc-14
x86_64                randconfig-012-20260521    gcc-14
x86_64                randconfig-012-20260522    gcc-14
x86_64                randconfig-013-20260521    gcc-14
x86_64                randconfig-013-20260522    gcc-14
x86_64                randconfig-014-20260521    gcc-14
x86_64                randconfig-014-20260522    gcc-14
x86_64                randconfig-015-20260521    gcc-14
x86_64                randconfig-015-20260522    gcc-14
x86_64                randconfig-016-20260521    gcc-14
x86_64                randconfig-016-20260522    gcc-14
x86_64                         randconfig-071    clang-20
x86_64                randconfig-071-20260521    clang-20
x86_64                randconfig-071-20260522    clang-20
x86_64                         randconfig-072    clang-20
x86_64                randconfig-072-20260521    clang-20
x86_64                randconfig-072-20260522    clang-20
x86_64                         randconfig-073    clang-20
x86_64                randconfig-073-20260521    clang-20
x86_64                randconfig-073-20260522    clang-20
x86_64                         randconfig-074    clang-20
x86_64                randconfig-074-20260521    clang-20
x86_64                randconfig-074-20260522    clang-20
x86_64                         randconfig-075    clang-20
x86_64                randconfig-075-20260521    clang-20
x86_64                randconfig-075-20260522    clang-20
x86_64                         randconfig-076    clang-20
x86_64                randconfig-076-20260521    clang-20
x86_64                randconfig-076-20260522    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                         randconfig-001    gcc-8.5.0
xtensa                randconfig-001-20260521    gcc-8.5.0
xtensa                randconfig-001-20260522    gcc-9.5.0
xtensa                         randconfig-002    gcc-8.5.0
xtensa                randconfig-002-20260521    gcc-8.5.0
xtensa                randconfig-002-20260522    gcc-9.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
