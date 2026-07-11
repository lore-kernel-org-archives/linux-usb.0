Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69A020468E
	for <linux-usb@vger.kernel.org>; Sat, 11 Jul 2026 02:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783736688; cv=none; b=A7tk4yeC90SfpKhYI1PSgoQKF9js6OYeMQn7/fgMqMYGc3VMnk6+8PCa1aTxbdwJORxmDUtIe8+Xf/Y+ljDHrOH4kgpnz9IYbJa7g4Krjzp9GxDRCez7Vua4BZWCmTbV0j7w7ZE9mVJAfHyOpsHkkOcoeIbjnizPMrh9Yiu7Fn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783736688; c=relaxed/simple;
	bh=22O8PI7a/foRqfsii8PeTljogWLbB6RoPsQWlnjlRO8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TosGiBHoBYZRBGfbnwrsnIi6ZUVB8tE73a1OjIYDk1TxxHeHCa1tjk9pU/proH3AcSJMMge96+gI3RU7imxFReuwzBHPzO5uDYzJW6VWr7RFYz/ASwtOV9/uGINaW7kn8aNmBcaJ4m7QbKlAOh2euEvTEGQh6oDyfNhIeeN3KHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b9SSPj36; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b9SSPj36"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783736687; x=1815272687;
  h=date:from:to:cc:subject:message-id;
  bh=22O8PI7a/foRqfsii8PeTljogWLbB6RoPsQWlnjlRO8=;
  b=b9SSPj36zYv5b9d82unDMJW/efHuBQ2FEI/xdp5Y60HpC20PSKZH9MT7
   qPIIA/MR8BsztuSFvHh2A+6Vj5mUy62peIY64O2K1u6KqeUekBLRluk+Z
   dv5Sw8pNL9cbQdm047D8ugZA4Jz/X+5oixcUUhuEvKDDTuXgPqWGBy2nY
   0M4JXMMVTjPQtUoSgDsPJc3FWoyJ6NYYTtM0d1/Ox1UABtwsLp89rBFqg
   TFEvX/SdGF3ThU8nluKqe7wZqMqVkT99BspaXJBJuLrVAr08mpCkcccP2
   fSpEgRbeeQUwCI6L9AxDsF8u0Y0VslOVb09p90o518Cfn52gtxY1hMkRD
   A==;
X-CSE-ConnectionGUID: BkNTVLjNTeOrkOFJgccjGQ==
X-CSE-MsgGUID: SsgjUzfxRr+WVkuOoGikGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88262381"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88262381"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 19:24:44 -0700
X-CSE-ConnectionGUID: EEM5unMkSMS9xZrVuu1O5A==
X-CSE-MsgGUID: 3oQJjTTTQoKGkk+YTemYQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="285130499"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 10 Jul 2026 19:24:43 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiNOS-00000000JeQ-0QFZ;
	Sat, 11 Jul 2026 02:24:40 +0000
Date: Sat, 11 Jul 2026 10:23:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS WITH WARNING
 1db5c6b0b9834aee2f14e39764becfcc29d09ccf
Message-ID: <202607111034.pmapQAhp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 1db5c6b0b9834aee2f14e39764becfcc29d09ccf  usb: chipidea: imx: fix missing ret assignment for dev_err_probe

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202607111052.PRRGX3Jq-lkp@intel.com

    drivers/usb/gadget/function/f_fs.c:2428:48: warning: '_rw' directive output may be truncated writing 3 bytes into a region of size between 1 and 8 [-Wformat-truncation=]

Warning ids grouped by kconfigs:

recent_errors
`-- s390-randconfig-002-20260711
    `-- drivers-usb-gadget-function-f_fs.c:warning:_rw-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and

elapsed time: 728m

configs tested: 192
configs skipped: 4

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260711    gcc-13.4.0
arc                   randconfig-002-20260711    gcc-13.4.0
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                           omap1_defconfig    gcc-16.1.0
arm                   randconfig-001-20260711    gcc-13.4.0
arm                   randconfig-002-20260711    gcc-13.4.0
arm                   randconfig-003-20260711    gcc-13.4.0
arm                   randconfig-004-20260711    gcc-13.4.0
arm                        vexpress_defconfig    gcc-16.1.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260711    gcc-16.1.0
arm64                 randconfig-002-20260711    gcc-16.1.0
arm64                 randconfig-003-20260711    gcc-16.1.0
arm64                 randconfig-004-20260711    gcc-16.1.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260711    gcc-16.1.0
csky                  randconfig-002-20260711    gcc-16.1.0
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260711    gcc-16.1.0
hexagon               randconfig-002-20260711    gcc-16.1.0
i386                             allmodconfig    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260711    gcc-14
i386        buildonly-randconfig-002-20260711    gcc-14
i386        buildonly-randconfig-003-20260711    gcc-14
i386        buildonly-randconfig-004-20260711    gcc-14
i386        buildonly-randconfig-005-20260711    gcc-14
i386        buildonly-randconfig-006-20260711    gcc-14
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260711    clang-22
i386                  randconfig-002-20260711    clang-22
i386                  randconfig-003-20260711    clang-22
i386                  randconfig-004-20260711    clang-22
i386                  randconfig-005-20260711    clang-22
i386                  randconfig-006-20260711    clang-22
i386                  randconfig-007-20260711    clang-22
i386                  randconfig-011-20260711    gcc-13
i386                  randconfig-012-20260711    gcc-13
i386                  randconfig-013-20260711    gcc-13
i386                  randconfig-014-20260711    gcc-13
i386                  randconfig-015-20260711    gcc-13
i386                  randconfig-016-20260711    gcc-13
i386                  randconfig-017-20260711    gcc-13
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260711    gcc-16.1.0
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
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260711    gcc-16.1.0
nios2                 randconfig-002-20260711    gcc-16.1.0
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                         randconfig-001    clang-17
parisc                         randconfig-001    gcc-10.5.0
parisc                randconfig-001-20260711    clang-17
parisc                randconfig-001-20260711    gcc-10.5.0
parisc                         randconfig-002    clang-17
parisc                         randconfig-002    gcc-10.5.0
parisc                randconfig-002-20260711    clang-17
parisc                randconfig-002-20260711    gcc-10.5.0
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                        randconfig-001    clang-17
powerpc                        randconfig-001    gcc-10.5.0
powerpc               randconfig-001-20260711    clang-17
powerpc               randconfig-001-20260711    gcc-10.5.0
powerpc                        randconfig-002    clang-17
powerpc                        randconfig-002    gcc-10.5.0
powerpc               randconfig-002-20260711    clang-17
powerpc64                      randconfig-001    clang-17
powerpc64             randconfig-001-20260711    clang-17
powerpc64             randconfig-001-20260711    gcc-10.5.0
powerpc64                      randconfig-002    clang-17
powerpc64                      randconfig-002    gcc-10.5.0
powerpc64             randconfig-002-20260711    clang-17
powerpc64             randconfig-002-20260711    gcc-10.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260711    gcc-8.5.0
riscv                 randconfig-002-20260711    gcc-8.5.0
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260711    gcc-8.5.0
s390                  randconfig-002-20260711    gcc-8.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-17
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260711    gcc-8.5.0
sh                    randconfig-002-20260711    gcc-8.5.0
sh                   sh7724_generic_defconfig    gcc-16.1.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260711    gcc-16.1.0
sparc                 randconfig-002-20260711    gcc-16.1.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260711    gcc-16.1.0
sparc64               randconfig-002-20260711    gcc-16.1.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260711    gcc-16.1.0
um                    randconfig-002-20260711    gcc-16.1.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260711    gcc-14
x86_64      buildonly-randconfig-002-20260711    gcc-14
x86_64      buildonly-randconfig-003-20260711    gcc-14
x86_64      buildonly-randconfig-004-20260711    gcc-14
x86_64      buildonly-randconfig-005-20260711    gcc-14
x86_64      buildonly-randconfig-006-20260711    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260711    gcc-14
x86_64                randconfig-002-20260711    gcc-14
x86_64                randconfig-003-20260711    gcc-14
x86_64                randconfig-004-20260711    gcc-14
x86_64                randconfig-005-20260711    gcc-14
x86_64                randconfig-006-20260711    gcc-14
x86_64                randconfig-011-20260711    gcc-14
x86_64                randconfig-012-20260711    gcc-14
x86_64                randconfig-013-20260711    gcc-14
x86_64                randconfig-014-20260711    gcc-14
x86_64                randconfig-015-20260711    gcc-14
x86_64                randconfig-016-20260711    gcc-14
x86_64                randconfig-071-20260711    gcc-14
x86_64                randconfig-072-20260711    gcc-14
x86_64                randconfig-073-20260711    gcc-14
x86_64                randconfig-074-20260711    gcc-14
x86_64                randconfig-075-20260711    gcc-14
x86_64                randconfig-076-20260711    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-20
xtensa                randconfig-001-20260711    gcc-16.1.0
xtensa                randconfig-002-20260711    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
