Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5B02DA74A
	for <linux-usb@vger.kernel.org>; Sat, 13 Jun 2026 18:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781375888; cv=none; b=c5bVYP/C0NZO3qrsdnWcmH7jDsS+VShEIPXFopCDRuREF4XYAgNqniUS2xgVehYKJeYiWle+FOMW/5g6TIeCbvM1tH/ITdK9XAIBWi1aFkWqBltnrqaXk2CN1Ssq5rhke07EhlU5g8X4RSRTUQQnrZAAd+cXHYc3hdrqZc1WXUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781375888; c=relaxed/simple;
	bh=g/utP+CIf9p8rwq7ydQdXpnCksl1a2k5ZqDrFzz0gOQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GzzX7oIxqNoARNxkqZwyiMB2x6NjmYhuWrIZLR4FAEZOiEBbHXmf88eUYnVWtisCqokGcNA7Bq1BkeJJv0SwwkhMNDwvcPbn4OuQBFlZbiBVNAxcRaRmZquHr7JdZEJkRAEgGiJ+g1exqZ+F9SHizaIr/eTP2xw6YkerJhOEriI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dn9iWeKT; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dn9iWeKT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781375886; x=1812911886;
  h=date:from:to:cc:subject:message-id;
  bh=g/utP+CIf9p8rwq7ydQdXpnCksl1a2k5ZqDrFzz0gOQ=;
  b=dn9iWeKTDNAB+pqOKYgFzQHOvZzWCmWPxv9pRRGbHfseiQlw41yRwVVn
   kdEUAoutups7+yaoBL02KqnQva7N4VQzl2CFeC0jsOvH1EasT4KRMRxEt
   b+oyG5BvULq8mGXW5yj5+gqasFA/pQvuxHhooHuq2w1beinM1PFYLca9f
   cDhG2/KcN0i30497bEgWfZ4bruIpNkY21mb617sN6R0Q3oz8AOYdtUidh
   UyZgjukF6qzF/Cmg1KfGmlFIzFJScyQKlGWekTiCCLGYeHGfOBNcRey9H
   PSyT8pblInPUNNhJRLdf36nqsJDmYoDGBPoYacAYsKxkZwP1gtZJgj870
   w==;
X-CSE-ConnectionGUID: fJC+8CmrSOiavhFDFp0u1w==
X-CSE-MsgGUID: qbNeCBFPQTy3ogzUTpBovQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="82160089"
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="82160089"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 11:38:06 -0700
X-CSE-ConnectionGUID: VeqjCxpGSO2VI/tBSuesHw==
X-CSE-MsgGUID: 44TxWUs1TO2IVojuiM6M7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="240746401"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Jun 2026 11:38:04 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYTF4-00000000QAY-0Qrz;
	Sat, 13 Jun 2026 18:38:02 +0000
Date: Sun, 14 Jun 2026 02:37:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 1c2b66a7d7257d2652aa41f9a860ecb96dde27dd
Message-ID: <202606140210.HIudpO5S-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 1c2b66a7d7257d2652aa41f9a860ecb96dde27dd  usb: ucsi: huawei_gaokun: support mode switching

elapsed time: 921m

configs tested: 238
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
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260613    gcc-12.5.0
arc                   randconfig-002-20260613    gcc-12.5.0
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260613    gcc-12.5.0
arm                   randconfig-002-20260613    gcc-12.5.0
arm                   randconfig-003-20260613    gcc-12.5.0
arm                   randconfig-004-20260613    gcc-12.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    gcc-16.1.0
arm64                 randconfig-001-20260613    gcc-16.1.0
arm64                          randconfig-002    gcc-16.1.0
arm64                 randconfig-002-20260613    gcc-16.1.0
arm64                          randconfig-003    gcc-16.1.0
arm64                 randconfig-003-20260613    gcc-16.1.0
arm64                          randconfig-004    gcc-16.1.0
arm64                 randconfig-004-20260613    gcc-16.1.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    gcc-16.1.0
csky                  randconfig-001-20260613    gcc-16.1.0
csky                           randconfig-002    gcc-16.1.0
csky                  randconfig-002-20260613    gcc-16.1.0
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260613    clang-23
hexagon               randconfig-001-20260614    clang-17
hexagon               randconfig-002-20260613    clang-23
hexagon               randconfig-002-20260614    clang-17
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                 buildonly-randconfig-001    gcc-14
i386        buildonly-randconfig-001-20260613    gcc-14
i386                 buildonly-randconfig-002    gcc-14
i386        buildonly-randconfig-002-20260613    gcc-14
i386                 buildonly-randconfig-003    gcc-14
i386        buildonly-randconfig-003-20260613    gcc-14
i386                 buildonly-randconfig-004    gcc-14
i386        buildonly-randconfig-004-20260613    gcc-14
i386                 buildonly-randconfig-005    gcc-14
i386        buildonly-randconfig-005-20260613    gcc-14
i386                 buildonly-randconfig-006    gcc-14
i386        buildonly-randconfig-006-20260613    gcc-14
i386                                defconfig    gcc-16.1.0
i386                           randconfig-001    clang-22
i386                  randconfig-001-20260613    clang-22
i386                           randconfig-002    clang-22
i386                  randconfig-002-20260613    clang-22
i386                           randconfig-003    clang-22
i386                  randconfig-003-20260613    clang-22
i386                           randconfig-004    clang-22
i386                  randconfig-004-20260613    clang-22
i386                           randconfig-005    clang-22
i386                  randconfig-005-20260613    clang-22
i386                           randconfig-006    clang-22
i386                  randconfig-006-20260613    clang-22
i386                           randconfig-007    clang-22
i386                  randconfig-007-20260613    clang-22
i386                           randconfig-011    gcc-14
i386                  randconfig-011-20260613    gcc-14
i386                           randconfig-012    gcc-14
i386                  randconfig-012-20260613    gcc-14
i386                           randconfig-013    gcc-14
i386                  randconfig-013-20260613    gcc-14
i386                           randconfig-014    gcc-14
i386                  randconfig-014-20260613    gcc-14
i386                           randconfig-015    gcc-14
i386                  randconfig-015-20260613    gcc-14
i386                           randconfig-016    gcc-14
i386                  randconfig-016-20260613    gcc-14
i386                           randconfig-017    gcc-14
i386                  randconfig-017-20260613    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260613    clang-23
loongarch             randconfig-001-20260614    clang-17
loongarch             randconfig-002-20260613    clang-23
loongarch             randconfig-002-20260614    clang-17
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
mips                        vocore2_defconfig    clang-20
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260613    clang-23
nios2                 randconfig-001-20260614    clang-17
nios2                 randconfig-002-20260613    clang-23
nios2                 randconfig-002-20260614    clang-17
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    clang-23
parisc                              defconfig    gcc-16.1.0
parisc                         randconfig-001    gcc-15.2.0
parisc                randconfig-001-20260613    gcc-15.2.0
parisc                         randconfig-002    gcc-15.2.0
parisc                randconfig-002-20260613    gcc-15.2.0
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                 canyonlands_defconfig    clang-22
powerpc                  mpc885_ads_defconfig    clang-23
powerpc                        randconfig-001    gcc-15.2.0
powerpc               randconfig-001-20260613    gcc-15.2.0
powerpc                        randconfig-002    gcc-15.2.0
powerpc               randconfig-002-20260613    gcc-15.2.0
powerpc64                      randconfig-001    gcc-15.2.0
powerpc64             randconfig-001-20260613    gcc-15.2.0
powerpc64                      randconfig-002    gcc-15.2.0
powerpc64             randconfig-002-20260613    gcc-15.2.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                          randconfig-001    gcc-10.5.0
riscv                 randconfig-001-20260613    gcc-10.5.0
riscv                 randconfig-001-20260614    gcc-9.5.0
riscv                          randconfig-002    gcc-10.5.0
riscv                 randconfig-002-20260613    gcc-10.5.0
riscv                 randconfig-002-20260614    gcc-9.5.0
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    gcc-10.5.0
s390                  randconfig-001-20260613    gcc-10.5.0
s390                  randconfig-001-20260614    gcc-9.5.0
s390                           randconfig-002    gcc-10.5.0
s390                  randconfig-002-20260613    gcc-10.5.0
s390                  randconfig-002-20260614    gcc-9.5.0
s390                       zfcpdump_defconfig    clang-22
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-17
sh                               allyesconfig    clang-23
sh                                  defconfig    gcc-14
sh                          r7780mp_defconfig    gcc-16.1.0
sh                             randconfig-001    gcc-10.5.0
sh                    randconfig-001-20260613    gcc-10.5.0
sh                    randconfig-001-20260614    gcc-9.5.0
sh                             randconfig-002    gcc-10.5.0
sh                    randconfig-002-20260613    gcc-10.5.0
sh                    randconfig-002-20260614    gcc-9.5.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260613    gcc-13.4.0
sparc                 randconfig-002-20260613    gcc-13.4.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260613    gcc-13.4.0
sparc64               randconfig-002-20260613    gcc-13.4.0
um                               allmodconfig    clang-17
um                               allmodconfig    clang-23
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260613    gcc-13.4.0
um                    randconfig-002-20260613    gcc-13.4.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260613    clang-22
x86_64      buildonly-randconfig-002-20260613    clang-22
x86_64      buildonly-randconfig-003-20260613    clang-22
x86_64      buildonly-randconfig-004-20260613    clang-22
x86_64      buildonly-randconfig-005-20260613    clang-22
x86_64      buildonly-randconfig-006-20260613    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260613    clang-22
x86_64                randconfig-002-20260613    clang-22
x86_64                randconfig-003-20260613    clang-22
x86_64                randconfig-004-20260613    clang-22
x86_64                randconfig-005-20260613    clang-22
x86_64                randconfig-006-20260613    clang-22
x86_64                randconfig-011-20260613    clang-22
x86_64                randconfig-012-20260613    clang-22
x86_64                randconfig-013-20260613    clang-22
x86_64                randconfig-014-20260613    clang-22
x86_64                randconfig-015-20260613    clang-22
x86_64                randconfig-016-20260613    clang-22
x86_64                         randconfig-071    gcc-13
x86_64                randconfig-071-20260613    clang-22
x86_64                randconfig-071-20260613    gcc-13
x86_64                         randconfig-072    gcc-13
x86_64                randconfig-072-20260613    clang-22
x86_64                randconfig-072-20260613    gcc-13
x86_64                         randconfig-073    gcc-13
x86_64                randconfig-073-20260613    clang-22
x86_64                randconfig-073-20260613    gcc-13
x86_64                         randconfig-074    gcc-13
x86_64                randconfig-074-20260613    clang-22
x86_64                randconfig-074-20260613    gcc-13
x86_64                         randconfig-075    gcc-13
x86_64                randconfig-075-20260613    clang-22
x86_64                randconfig-075-20260613    gcc-13
x86_64                         randconfig-076    gcc-13
x86_64                randconfig-076-20260613    clang-22
x86_64                randconfig-076-20260613    gcc-13
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-20
xtensa                randconfig-001-20260613    gcc-13.4.0
xtensa                randconfig-002-20260613    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
