Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18072332610
	for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 05:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784007068; cv=none; b=IGRfkWpUhUpyI/rLjQm1IMcwtrRkQAGkv5WoIqAAy4noNN7gAkjKqeD1548cmU1+PhbvPKvDHNc7oH9L8/D9nQaPEB35GU3o9EeykFnNUTchpCtXuGTQ/LvQkT9CeOUsw7sCyBpkXUJ3mGXuuP6iEPdljlUVDDwZH+FI3yyVwaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784007068; c=relaxed/simple;
	bh=Grws9kDGrgol+bbPlJ4xXU9XeTV7RqgP/UvBQQPrvQI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EvhTWfxYDSO+Fn64Ao18zqz0wBCFF3hTlc1QjXQGPxir5MgivI3hT5JHul4MANjxN8olnzTPv0W8Uyo5hLQq/5r9cTyFxxzmUAtJoofH1j7DRX5pj46OA0kl7duaW/1fhEjMDtNGJuQV0V3VgVfKu/du0DA/IdiG27tWp+y9dtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=igWeQ+MN; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="igWeQ+MN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784007066; x=1815543066;
  h=date:from:to:cc:subject:message-id;
  bh=Grws9kDGrgol+bbPlJ4xXU9XeTV7RqgP/UvBQQPrvQI=;
  b=igWeQ+MNbe1Wu9HoSxZLvF6PzvdIBj9kSC+gbjFqSpBZmXGwTpmPIE7p
   ck34nQs+dEafiRZ5mFGbus4m/4LdLoWA1M0B6PdX6yOQ8aW8bbkzjhcHt
   ansg+8SVFkPhAOUj6tQ0ZfGmNXkv6EeDQ5yB5z8dbICLa6UQY9cq4L5BX
   lA10ZBZvqaUF0NXrL4cxA1DJCRK+wLk/mh9DmDAX4+SFo+4fQmgJf8wV7
   BfPPRvbElXLRCi8x6raXrVY2NcQCzf/asMPU4txaJChseOeRwoYcq5MDB
   vXcPiL6EbarWxE2zFEmEKEjgawWEZGTMWUUxTccl6MXZomLmPU+eYh1v4
   g==;
X-CSE-ConnectionGUID: 6n08YigXSQmv7p4EKUJFoA==
X-CSE-MsgGUID: 6UFl/BldTn6np5Ut89+oTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84399491"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="84399491"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 22:31:03 -0700
X-CSE-ConnectionGUID: r/BULIbPSS6eTztqtXzaug==
X-CSE-MsgGUID: hmx9GrKLRZyVdXj0W0mi2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="293938812"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 13 Jul 2026 22:31:02 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjVjP-00000000MQf-2VhL;
	Tue, 14 Jul 2026 05:30:59 +0000
Date: Tue, 14 Jul 2026 13:30:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 c2e819be6a5c7f34344926b4bd7e3dfca58cf48a
Message-ID: <202607141338.REbforjG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: c2e819be6a5c7f34344926b4bd7e3dfca58cf48a  usb: gadget: printer: fix infinite loop in printer_read()

elapsed time: 945m

configs tested: 226
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              alldefconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                          axs103_defconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                            randconfig-001    clang-23
arc                   randconfig-001-20260713    gcc-8.5.0
arc                   randconfig-001-20260714    clang-23
arc                            randconfig-002    clang-23
arc                   randconfig-002-20260713    gcc-8.5.0
arc                   randconfig-002-20260714    clang-23
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                          ixp4xx_defconfig    gcc-16.1.0
arm                            randconfig-001    clang-23
arm                   randconfig-001-20260713    gcc-8.5.0
arm                   randconfig-001-20260714    clang-23
arm                            randconfig-002    clang-23
arm                   randconfig-002-20260713    gcc-8.5.0
arm                   randconfig-002-20260714    clang-23
arm                            randconfig-003    clang-23
arm                   randconfig-003-20260713    gcc-8.5.0
arm                   randconfig-003-20260714    clang-23
arm                            randconfig-004    clang-23
arm                   randconfig-004-20260713    gcc-8.5.0
arm                   randconfig-004-20260714    clang-23
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260713    gcc-13.4.0
arm64                 randconfig-001-20260714    gcc-16.1.0
arm64                 randconfig-002-20260713    gcc-13.4.0
arm64                 randconfig-002-20260714    gcc-16.1.0
arm64                 randconfig-003-20260713    gcc-13.4.0
arm64                 randconfig-003-20260714    gcc-16.1.0
arm64                 randconfig-004-20260713    gcc-13.4.0
arm64                 randconfig-004-20260714    gcc-16.1.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260713    gcc-13.4.0
csky                  randconfig-001-20260714    gcc-16.1.0
csky                  randconfig-002-20260713    gcc-13.4.0
csky                  randconfig-002-20260714    gcc-16.1.0
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260714    gcc-16.1.0
hexagon               randconfig-002-20260714    gcc-16.1.0
i386                             allmodconfig    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260713    gcc-14
i386        buildonly-randconfig-001-20260714    clang-22
i386        buildonly-randconfig-002-20260713    gcc-14
i386        buildonly-randconfig-002-20260714    clang-22
i386        buildonly-randconfig-003-20260713    gcc-14
i386        buildonly-randconfig-003-20260714    clang-22
i386        buildonly-randconfig-004-20260713    gcc-14
i386        buildonly-randconfig-004-20260714    clang-22
i386        buildonly-randconfig-005-20260713    gcc-14
i386        buildonly-randconfig-005-20260714    clang-22
i386        buildonly-randconfig-006-20260713    gcc-14
i386        buildonly-randconfig-006-20260714    clang-22
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260713    gcc-14
i386                  randconfig-001-20260714    gcc-13
i386                  randconfig-002-20260714    gcc-13
i386                  randconfig-003-20260713    gcc-14
i386                  randconfig-003-20260714    gcc-13
i386                  randconfig-004-20260713    gcc-14
i386                  randconfig-004-20260714    gcc-13
i386                  randconfig-005-20260713    gcc-14
i386                  randconfig-005-20260714    gcc-13
i386                  randconfig-006-20260713    gcc-14
i386                  randconfig-006-20260714    gcc-13
i386                  randconfig-007-20260713    gcc-14
i386                  randconfig-007-20260714    gcc-13
i386                  randconfig-011-20260714    clang-22
i386                  randconfig-012-20260714    clang-22
i386                  randconfig-013-20260714    clang-22
i386                  randconfig-014-20260714    clang-22
i386                  randconfig-015-20260714    clang-22
i386                  randconfig-016-20260714    clang-22
i386                  randconfig-017-20260714    clang-22
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260714    gcc-16.1.0
loongarch             randconfig-002-20260714    gcc-16.1.0
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
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260714    gcc-16.1.0
nios2                 randconfig-002-20260714    gcc-16.1.0
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260713    clang-23
parisc                randconfig-001-20260714    clang-17
parisc                randconfig-002-20260713    clang-23
parisc                randconfig-002-20260714    clang-17
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                       holly_defconfig    clang-23
powerpc               randconfig-001-20260713    clang-23
powerpc               randconfig-001-20260714    clang-17
powerpc               randconfig-002-20260713    clang-23
powerpc               randconfig-002-20260714    clang-17
powerpc64             randconfig-001-20260713    clang-23
powerpc64             randconfig-001-20260714    clang-17
powerpc64             randconfig-002-20260713    clang-23
powerpc64             randconfig-002-20260714    clang-17
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv             nommu_k210_sdcard_defconfig    gcc-16.1.0
riscv                 randconfig-001-20260713    gcc-16.1.0
riscv                 randconfig-001-20260714    gcc-10.5.0
riscv                 randconfig-002-20260714    gcc-10.5.0
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260713    gcc-16.1.0
s390                  randconfig-001-20260714    gcc-10.5.0
s390                  randconfig-002-20260713    gcc-16.1.0
s390                  randconfig-002-20260714    gcc-10.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-17
sh                                  defconfig    gcc-14
sh                             espt_defconfig    gcc-16.1.0
sh                    randconfig-001-20260713    gcc-16.1.0
sh                    randconfig-001-20260714    gcc-10.5.0
sh                    randconfig-002-20260713    gcc-16.1.0
sh                    randconfig-002-20260714    gcc-10.5.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260714    gcc-8.5.0
sparc                 randconfig-002-20260714    gcc-8.5.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260714    gcc-8.5.0
sparc64               randconfig-002-20260714    gcc-8.5.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260714    gcc-8.5.0
um                    randconfig-002-20260714    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260714    gcc-14
x86_64      buildonly-randconfig-002-20260714    gcc-14
x86_64      buildonly-randconfig-003-20260714    gcc-14
x86_64      buildonly-randconfig-004-20260714    gcc-14
x86_64      buildonly-randconfig-005-20260714    gcc-14
x86_64      buildonly-randconfig-006-20260714    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260714    clang-22
x86_64                randconfig-002-20260714    clang-22
x86_64                randconfig-003-20260714    clang-22
x86_64                randconfig-004-20260714    clang-22
x86_64                randconfig-005-20260714    clang-22
x86_64                randconfig-006-20260714    clang-22
x86_64                randconfig-011-20260713    gcc-14
x86_64                randconfig-011-20260714    clang-22
x86_64                randconfig-012-20260713    gcc-14
x86_64                randconfig-012-20260714    clang-22
x86_64                randconfig-013-20260713    gcc-14
x86_64                randconfig-013-20260714    clang-22
x86_64                randconfig-014-20260713    gcc-14
x86_64                randconfig-014-20260714    clang-22
x86_64                randconfig-015-20260713    gcc-14
x86_64                randconfig-015-20260714    clang-22
x86_64                randconfig-016-20260713    gcc-14
x86_64                randconfig-016-20260714    clang-22
x86_64                randconfig-071-20260714    gcc-14
x86_64                randconfig-072-20260714    gcc-14
x86_64                randconfig-073-20260713    gcc-14
x86_64                randconfig-073-20260714    gcc-14
x86_64                randconfig-074-20260713    gcc-14
x86_64                randconfig-074-20260714    gcc-14
x86_64                randconfig-075-20260713    gcc-14
x86_64                randconfig-075-20260714    gcc-14
x86_64                randconfig-076-20260713    gcc-14
x86_64                randconfig-076-20260714    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-20
xtensa                randconfig-001-20260714    gcc-8.5.0
xtensa                randconfig-002-20260714    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
