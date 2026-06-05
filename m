Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D68747A0C0
	for <linux-usb@vger.kernel.org>; Fri,  5 Jun 2026 07:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780644625; cv=none; b=DDpBhGMzhOg5SCv/Jr4/Ar/6teotZG7UgqmvcBYSuBSx6I4ulqGdL6q10A9wM8uUhOvcmPYAP2L0SRFigeMK1qA5cnkkyhQ/3QL68nXfuZbqO9WrkE8Vy99gr7546qGXEs5OApPVI44h0iSJ8UdUvM8cWbD+UXa1lrBeGkwyICQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780644625; c=relaxed/simple;
	bh=F6ct19kPtX4YESbe5BBtKz22u4qAA5eNDUIKEYdbrBQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mkYwOorIHN/R8LfxFSXKd0xf2sXrlzzLna4ec7VlJTluL+Dx+SVn9VCbUeTCu/uy98k8P1jFoEp5RqKWS/+le/FEuqBEVCvHFur1awanq+o76yJbPamtKUM/SzH49LaJO6z9Y7W9Mkjx+UxnCySkYim8KU2ZbSrRVWNH1ohSQ4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YLEDqOCW; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YLEDqOCW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780644624; x=1812180624;
  h=date:from:to:cc:subject:message-id;
  bh=F6ct19kPtX4YESbe5BBtKz22u4qAA5eNDUIKEYdbrBQ=;
  b=YLEDqOCW98ANfKJD58oczbY5pc1W9FQoP/MsyJCweBVNWiYc3cQbFKQD
   Wm2oPMidZlUPz1MJ2hu52VOz15PcGjV6vp7caQG7ckLg5t5kNjZL6tHT5
   kt/J6lRrCST3Nz3ffqA9vAAr5equaHKiHghbUWePYwwWgqe8DqUwmpNtW
   xkTHtKJIA9Y1XfyJ8j8z1HHjLXjYEZ2qYLADGBAaaLcVkHkIAeOmKybFV
   hcidKtBJ/hgu0e2FApwbGTsC8vdYy0oMriXUwE5IVP5s5xoxjxjopDisq
   BtgP1HS7j7DgxLhVhTA/mcr+EDr4tE0GTmkNbzVXzUeWUJd1+9mGvN13X
   g==;
X-CSE-ConnectionGUID: 5LMwPnP4TsqPeILKxJWUiA==
X-CSE-MsgGUID: KQVl3quaSmGyigFtrKqCCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="84058355"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="84058355"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 00:30:22 -0700
X-CSE-ConnectionGUID: QRjXNdo5R2Sb0yT5FAWfKA==
X-CSE-MsgGUID: Ww3Xu3toT9u2gE5wCOr9kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="248705443"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Jun 2026 00:30:21 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVP0T-00000000FgU-3oIS;
	Fri, 05 Jun 2026 07:30:17 +0000
Date: Fri, 05 Jun 2026 15:29:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 108c8b6c06b7c77787fd85f92d15a1e992fa1de4
Message-ID: <202606051517.oaCilJ2i-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 108c8b6c06b7c77787fd85f92d15a1e992fa1de4  Merge tag 'thunderbolt-for-v7.1-rc7' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-linus

elapsed time: 4896m

configs tested: 299
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-17
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260603    gcc-8.5.0
arc                   randconfig-001-20260604    clang-17
arc                   randconfig-002-20260603    gcc-8.5.0
arc                   randconfig-002-20260604    clang-17
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-17
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260603    gcc-8.5.0
arm                   randconfig-001-20260604    clang-17
arm                   randconfig-002-20260603    gcc-8.5.0
arm                   randconfig-002-20260604    clang-17
arm                   randconfig-003-20260603    gcc-8.5.0
arm                   randconfig-003-20260604    clang-17
arm                   randconfig-004-20260603    gcc-8.5.0
arm                   randconfig-004-20260604    clang-17
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260603    gcc-15.2.0
arm64                 randconfig-001-20260604    clang-17
arm64                 randconfig-002-20260603    gcc-15.2.0
arm64                 randconfig-002-20260604    clang-17
arm64                 randconfig-003-20260603    gcc-15.2.0
arm64                 randconfig-003-20260604    clang-17
arm64                 randconfig-004-20260603    gcc-15.2.0
arm64                 randconfig-004-20260604    clang-17
csky                             allmodconfig    gcc-15.2.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260603    gcc-15.2.0
csky                  randconfig-001-20260604    clang-17
csky                  randconfig-002-20260603    gcc-15.2.0
csky                  randconfig-002-20260604    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-16.1.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260603    gcc-11.5.0
hexagon               randconfig-001-20260604    gcc-11.5.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260603    gcc-11.5.0
hexagon               randconfig-002-20260604    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260603    clang-20
i386        buildonly-randconfig-001-20260604    clang-20
i386        buildonly-randconfig-002-20260603    clang-20
i386        buildonly-randconfig-002-20260604    clang-20
i386        buildonly-randconfig-003-20260603    clang-20
i386        buildonly-randconfig-003-20260604    clang-20
i386        buildonly-randconfig-004-20260603    clang-20
i386        buildonly-randconfig-004-20260604    clang-20
i386        buildonly-randconfig-005-20260603    clang-20
i386        buildonly-randconfig-005-20260604    clang-20
i386        buildonly-randconfig-006-20260603    clang-20
i386        buildonly-randconfig-006-20260604    clang-20
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260603    clang-22
i386                  randconfig-001-20260604    clang-20
i386                  randconfig-002-20260603    clang-22
i386                  randconfig-002-20260604    clang-20
i386                  randconfig-003-20260603    clang-22
i386                  randconfig-003-20260604    clang-20
i386                  randconfig-004-20260603    clang-22
i386                  randconfig-004-20260604    clang-20
i386                  randconfig-005-20260603    clang-22
i386                  randconfig-005-20260604    clang-20
i386                  randconfig-006-20260603    clang-22
i386                  randconfig-006-20260604    clang-20
i386                  randconfig-007-20260603    clang-22
i386                  randconfig-007-20260604    clang-20
i386                  randconfig-011-20260603    clang-22
i386                  randconfig-011-20260604    gcc-14
i386                  randconfig-012-20260603    clang-22
i386                  randconfig-012-20260604    gcc-14
i386                  randconfig-013-20260603    clang-22
i386                  randconfig-013-20260604    gcc-14
i386                  randconfig-014-20260603    clang-22
i386                  randconfig-014-20260604    gcc-14
i386                  randconfig-015-20260603    clang-22
i386                  randconfig-015-20260604    gcc-14
i386                  randconfig-016-20260603    clang-22
i386                  randconfig-016-20260604    gcc-14
i386                  randconfig-017-20260603    clang-22
i386                  randconfig-017-20260604    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260603    gcc-11.5.0
loongarch             randconfig-001-20260604    gcc-11.5.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260603    gcc-11.5.0
loongarch             randconfig-002-20260604    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-17
m68k                                defconfig    clang-23
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-17
nios2                               defconfig    clang-23
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260603    gcc-11.5.0
nios2                 randconfig-001-20260604    gcc-11.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260603    gcc-11.5.0
nios2                 randconfig-002-20260604    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-17
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-17
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-16.1.0
parisc                         randconfig-001    gcc-8.5.0
parisc                randconfig-001-20260603    gcc-8.5.0
parisc                randconfig-001-20260604    gcc-8.5.0
parisc                         randconfig-002    gcc-8.5.0
parisc                randconfig-002-20260603    gcc-8.5.0
parisc                randconfig-002-20260604    gcc-8.5.0
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-17
powerpc                        randconfig-001    gcc-8.5.0
powerpc               randconfig-001-20260603    gcc-8.5.0
powerpc               randconfig-001-20260604    gcc-8.5.0
powerpc                        randconfig-002    gcc-8.5.0
powerpc               randconfig-002-20260603    gcc-8.5.0
powerpc               randconfig-002-20260604    gcc-8.5.0
powerpc64                      randconfig-001    gcc-8.5.0
powerpc64             randconfig-001-20260603    gcc-8.5.0
powerpc64             randconfig-001-20260604    gcc-8.5.0
powerpc64                      randconfig-002    gcc-8.5.0
powerpc64             randconfig-002-20260603    gcc-8.5.0
powerpc64             randconfig-002-20260604    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-17
riscv                            allyesconfig    clang-17
riscv                               defconfig    gcc-16.1.0
riscv                    nommu_virt_defconfig    clang-23
riscv                          randconfig-001    clang-17
riscv                 randconfig-001-20260603    gcc-14.3.0
riscv                 randconfig-001-20260604    clang-17
riscv                          randconfig-002    clang-17
riscv                 randconfig-002-20260603    gcc-14.3.0
riscv                 randconfig-002-20260604    clang-17
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-17
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    clang-17
s390                  randconfig-001-20260603    gcc-14.3.0
s390                  randconfig-001-20260604    clang-17
s390                           randconfig-002    clang-17
s390                  randconfig-002-20260603    gcc-14.3.0
s390                  randconfig-002-20260604    clang-17
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-17
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                             randconfig-001    clang-17
sh                    randconfig-001-20260603    gcc-14.3.0
sh                    randconfig-001-20260604    clang-17
sh                             randconfig-002    clang-17
sh                    randconfig-002-20260603    gcc-14.3.0
sh                    randconfig-002-20260604    clang-17
sh                          urquell_defconfig    gcc-16.1.0
sparc                             allnoconfig    clang-17
sparc                               defconfig    gcc-16.1.0
sparc                          randconfig-001    gcc-11.5.0
sparc                 randconfig-001-20260603    gcc-15.2.0
sparc                 randconfig-001-20260604    gcc-11.5.0
sparc                          randconfig-002    gcc-11.5.0
sparc                 randconfig-002-20260603    gcc-15.2.0
sparc                 randconfig-002-20260604    gcc-11.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-11.5.0
sparc64               randconfig-001-20260603    gcc-15.2.0
sparc64               randconfig-001-20260604    gcc-11.5.0
sparc64                        randconfig-002    gcc-11.5.0
sparc64               randconfig-002-20260603    gcc-15.2.0
sparc64               randconfig-002-20260604    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-11.5.0
um                    randconfig-001-20260603    gcc-15.2.0
um                    randconfig-001-20260604    gcc-11.5.0
um                             randconfig-002    gcc-11.5.0
um                    randconfig-002-20260603    gcc-15.2.0
um                    randconfig-002-20260604    gcc-11.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-17
x86_64                           allyesconfig    clang-20
x86_64               buildonly-randconfig-001    clang-20
x86_64      buildonly-randconfig-001-20260603    clang-20
x86_64      buildonly-randconfig-001-20260604    gcc-14
x86_64               buildonly-randconfig-002    clang-20
x86_64      buildonly-randconfig-002-20260603    clang-20
x86_64      buildonly-randconfig-002-20260604    gcc-14
x86_64               buildonly-randconfig-003    clang-20
x86_64      buildonly-randconfig-003-20260603    clang-20
x86_64      buildonly-randconfig-003-20260604    gcc-14
x86_64               buildonly-randconfig-004    clang-20
x86_64      buildonly-randconfig-004-20260603    clang-20
x86_64      buildonly-randconfig-004-20260604    gcc-14
x86_64               buildonly-randconfig-005    clang-20
x86_64      buildonly-randconfig-005-20260603    clang-20
x86_64      buildonly-randconfig-005-20260604    gcc-14
x86_64               buildonly-randconfig-006    clang-20
x86_64      buildonly-randconfig-006-20260603    clang-20
x86_64      buildonly-randconfig-006-20260604    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                         randconfig-001    clang-20
x86_64                randconfig-001-20260603    clang-20
x86_64                randconfig-001-20260604    clang-20
x86_64                         randconfig-002    clang-20
x86_64                randconfig-002-20260603    clang-20
x86_64                randconfig-002-20260604    clang-20
x86_64                         randconfig-003    clang-20
x86_64                randconfig-003-20260603    clang-20
x86_64                randconfig-003-20260604    clang-20
x86_64                         randconfig-004    clang-20
x86_64                randconfig-004-20260603    clang-20
x86_64                randconfig-004-20260604    clang-20
x86_64                         randconfig-005    clang-20
x86_64                randconfig-005-20260603    clang-20
x86_64                randconfig-005-20260604    clang-20
x86_64                         randconfig-006    clang-20
x86_64                randconfig-006-20260603    clang-20
x86_64                randconfig-006-20260604    clang-20
x86_64                         randconfig-011    clang-22
x86_64                randconfig-011-20260603    clang-22
x86_64                randconfig-011-20260604    clang-22
x86_64                         randconfig-012    clang-22
x86_64                randconfig-012-20260603    clang-22
x86_64                randconfig-012-20260604    clang-22
x86_64                         randconfig-013    clang-22
x86_64                randconfig-013-20260603    clang-22
x86_64                randconfig-013-20260604    clang-22
x86_64                         randconfig-014    clang-22
x86_64                randconfig-014-20260603    clang-22
x86_64                randconfig-014-20260604    clang-22
x86_64                         randconfig-015    clang-22
x86_64                randconfig-015-20260603    clang-22
x86_64                randconfig-015-20260604    clang-22
x86_64                         randconfig-016    clang-22
x86_64                randconfig-016-20260603    clang-22
x86_64                randconfig-016-20260604    clang-22
x86_64                randconfig-071-20260603    clang-22
x86_64                randconfig-071-20260604    clang-22
x86_64                randconfig-072-20260603    clang-22
x86_64                randconfig-072-20260604    clang-22
x86_64                randconfig-073-20260603    clang-22
x86_64                randconfig-073-20260604    clang-22
x86_64                randconfig-074-20260603    clang-22
x86_64                randconfig-074-20260604    clang-22
x86_64                randconfig-075-20260603    clang-22
x86_64                randconfig-075-20260604    clang-22
x86_64                randconfig-076-20260603    clang-22
x86_64                randconfig-076-20260604    clang-22
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-17
xtensa                           allyesconfig    clang-23
xtensa                         randconfig-001    gcc-11.5.0
xtensa                randconfig-001-20260603    gcc-15.2.0
xtensa                randconfig-001-20260604    gcc-11.5.0
xtensa                         randconfig-002    gcc-11.5.0
xtensa                randconfig-002-20260603    gcc-15.2.0
xtensa                randconfig-002-20260604    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
