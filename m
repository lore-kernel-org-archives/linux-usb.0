Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A5225F994
	for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2026 22:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783116303; cv=none; b=sqQrZhXQc8WHztbWkMfwnECpCCcNY6KDnKelArXTuBc+yP43No/20q1DZ/Dx9aeq3czXOHGhCRqRvKnhR1lxh9xcLvkW7ejp2CluyKg6nnIz5Xal42W8hGNm35lx1WtAxG3HfkzE6EX0yzPslfJhZ3ClNAlYxNN1NWyOWxcmUz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783116303; c=relaxed/simple;
	bh=TwCW04BpQxKdQhZw9und4+Hm9YrcsBha2lcq7a5o+8Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h8Ml0jBCBqnrEGNiJ/jqH2sXt4FrT84f/3kwuHV3eEsy5S06SG51fqi1Cme7yjQMeSXusuuTtVcupjgsLBrNsIZ+6Qv3EWj1ooqDsOxqewgFmGmp0TR5sTUNsg3GlsXjdycGumEH3zVzE4BYk4KbPGF8r5tChJ7QfrR7fDCTldY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NNirSBFr; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NNirSBFr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783116301; x=1814652301;
  h=date:from:to:cc:subject:message-id;
  bh=TwCW04BpQxKdQhZw9und4+Hm9YrcsBha2lcq7a5o+8Q=;
  b=NNirSBFr7UKmvYnHi8H7O987KtHLUz8ScOdNknDwU3otLHxwkQh85l+Y
   UqgFKXwjQ39X/tCt3xuD85lKyUZgushBlWV6j1GXHVBQByU3zvdZRDqO8
   gIuqqZV8Yti1lq8/5IhSAl3wnIuo7XrQ0PIbx9I1PLOyOFeh5jSn1T2sn
   lkP1AgeAC50Jky7ZhT7ZkoV701NHUCYt7qDkl3Vq0NlLa/N9G0nCozHD0
   bDcvQyRv/U7062SMG6jIqGmKq2/HDhFoRYTCqr1+GyoIj7uWCY9861tQP
   yjpNPE9BbVnkYfqPl+dP53IHhgBz1hTOHXZ3+YAlYS92fJSFXGK3iOiA1
   Q==;
X-CSE-ConnectionGUID: deCWk1+rRhCSjzI8SFUY0A==
X-CSE-MsgGUID: guVMkQKeQY6e3SD9bpMmog==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="95019852"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="95019852"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 15:05:01 -0700
X-CSE-ConnectionGUID: OB/4U1JITSqQtH0w/MuYMA==
X-CSE-MsgGUID: qZvpNNp+RkaqqMF5OqPJwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253334721"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 03 Jul 2026 15:04:59 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfm0G-00000000CYR-1X0l;
	Fri, 03 Jul 2026 22:04:56 +0000
Date: Sat, 04 Jul 2026 06:04:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 07acd41f72eec827963b239565925af2bcb3a54b
Message-ID: <202607040655.Z8a9lQ5F-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 07acd41f72eec827963b239565925af2bcb3a54b  Merge tag 'usb-serial-7.2-rc2' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

elapsed time: 735m

configs tested: 305
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                          axs103_defconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                            randconfig-001    gcc-16.1.0
arc                   randconfig-001-20260703    gcc-16.1.0
arc                   randconfig-001-20260703    gcc-8.5.0
arc                   randconfig-001-20260704    gcc-8.5.0
arc                            randconfig-002    gcc-16.1.0
arc                   randconfig-002-20260703    gcc-16.1.0
arc                   randconfig-002-20260703    gcc-8.5.0
arc                   randconfig-002-20260704    gcc-8.5.0
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                        keystone_defconfig    gcc-16.1.0
arm                        mvebu_v7_defconfig    clang-23
arm                            randconfig-001    gcc-16.1.0
arm                   randconfig-001-20260703    gcc-16.1.0
arm                   randconfig-001-20260703    gcc-8.5.0
arm                   randconfig-001-20260704    gcc-8.5.0
arm                            randconfig-002    gcc-16.1.0
arm                   randconfig-002-20260703    gcc-16.1.0
arm                   randconfig-002-20260703    gcc-8.5.0
arm                   randconfig-002-20260704    gcc-8.5.0
arm                            randconfig-003    gcc-16.1.0
arm                   randconfig-003-20260703    gcc-16.1.0
arm                   randconfig-003-20260703    gcc-8.5.0
arm                   randconfig-003-20260704    gcc-8.5.0
arm                            randconfig-004    gcc-16.1.0
arm                   randconfig-004-20260703    gcc-16.1.0
arm                   randconfig-004-20260703    gcc-8.5.0
arm                   randconfig-004-20260704    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    gcc-10.5.0
arm64                 randconfig-001-20260703    gcc-10.5.0
arm64                 randconfig-001-20260704    gcc-16.1.0
arm64                          randconfig-002    gcc-10.5.0
arm64                 randconfig-002-20260703    gcc-10.5.0
arm64                 randconfig-002-20260704    gcc-16.1.0
arm64                          randconfig-003    gcc-10.5.0
arm64                 randconfig-003-20260703    gcc-10.5.0
arm64                 randconfig-003-20260704    gcc-16.1.0
arm64                          randconfig-004    gcc-10.5.0
arm64                 randconfig-004-20260703    gcc-10.5.0
arm64                 randconfig-004-20260704    gcc-16.1.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    gcc-10.5.0
csky                  randconfig-001-20260703    gcc-10.5.0
csky                  randconfig-001-20260704    gcc-16.1.0
csky                           randconfig-002    gcc-10.5.0
csky                  randconfig-002-20260703    gcc-10.5.0
csky                  randconfig-002-20260704    gcc-16.1.0
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260703    gcc-11.5.0
hexagon               randconfig-001-20260703    gcc-16.1.0
hexagon               randconfig-001-20260704    gcc-16.1.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260703    gcc-11.5.0
hexagon               randconfig-002-20260703    gcc-16.1.0
hexagon               randconfig-002-20260704    gcc-16.1.0
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260703    clang-22
i386        buildonly-randconfig-001-20260704    gcc-14
i386        buildonly-randconfig-002-20260703    clang-22
i386        buildonly-randconfig-002-20260704    gcc-14
i386        buildonly-randconfig-003-20260703    clang-22
i386        buildonly-randconfig-003-20260704    gcc-14
i386        buildonly-randconfig-004-20260703    clang-22
i386        buildonly-randconfig-004-20260704    gcc-14
i386        buildonly-randconfig-005-20260703    clang-22
i386        buildonly-randconfig-005-20260704    gcc-14
i386        buildonly-randconfig-006-20260703    clang-22
i386        buildonly-randconfig-006-20260704    gcc-14
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260703    clang-22
i386                  randconfig-001-20260704    gcc-14
i386                  randconfig-002-20260703    clang-22
i386                  randconfig-002-20260704    gcc-14
i386                  randconfig-003-20260703    clang-22
i386                  randconfig-003-20260704    gcc-14
i386                  randconfig-004-20260703    clang-22
i386                  randconfig-004-20260704    gcc-14
i386                  randconfig-005-20260703    clang-22
i386                  randconfig-005-20260704    gcc-14
i386                  randconfig-006-20260703    clang-22
i386                  randconfig-006-20260704    gcc-14
i386                  randconfig-007-20260703    clang-22
i386                  randconfig-007-20260704    gcc-14
i386                           randconfig-011    clang-22
i386                  randconfig-011-20260703    clang-22
i386                  randconfig-011-20260704    gcc-13
i386                           randconfig-012    clang-22
i386                  randconfig-012-20260703    clang-22
i386                  randconfig-012-20260704    gcc-13
i386                           randconfig-013    clang-22
i386                  randconfig-013-20260703    clang-22
i386                  randconfig-013-20260704    gcc-13
i386                           randconfig-014    clang-22
i386                  randconfig-014-20260703    clang-22
i386                  randconfig-014-20260704    gcc-13
i386                           randconfig-015    clang-22
i386                  randconfig-015-20260703    clang-22
i386                  randconfig-015-20260704    gcc-13
i386                           randconfig-016    clang-22
i386                  randconfig-016-20260703    clang-22
i386                  randconfig-016-20260704    gcc-13
i386                           randconfig-017    clang-22
i386                  randconfig-017-20260703    clang-22
i386                  randconfig-017-20260704    gcc-13
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260703    gcc-11.5.0
loongarch             randconfig-001-20260703    gcc-16.1.0
loongarch             randconfig-001-20260704    gcc-16.1.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260703    gcc-11.5.0
loongarch             randconfig-002-20260703    gcc-16.1.0
loongarch             randconfig-002-20260704    gcc-16.1.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                                defconfig    clang-23
m68k                          hp300_defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                          eyeq5_defconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-23
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260703    gcc-11.5.0
nios2                 randconfig-001-20260703    gcc-16.1.0
nios2                 randconfig-001-20260704    gcc-16.1.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260703    gcc-11.5.0
nios2                 randconfig-002-20260703    gcc-16.1.0
nios2                 randconfig-002-20260704    gcc-16.1.0
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260703    clang-23
parisc                randconfig-001-20260704    clang-23
parisc                randconfig-002-20260703    clang-23
parisc                randconfig-002-20260704    clang-23
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                     ep8248e_defconfig    gcc-16.1.0
powerpc               randconfig-001-20260703    clang-23
powerpc               randconfig-001-20260704    clang-23
powerpc               randconfig-002-20260703    clang-23
powerpc               randconfig-002-20260704    clang-23
powerpc64             randconfig-001-20260703    clang-23
powerpc64             randconfig-001-20260704    clang-23
powerpc64             randconfig-002-20260703    clang-23
powerpc64             randconfig-002-20260704    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260703    gcc-9.5.0
riscv                 randconfig-001-20260704    gcc-10.5.0
riscv                 randconfig-002-20260703    gcc-9.5.0
riscv                 randconfig-002-20260704    gcc-10.5.0
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260703    gcc-9.5.0
s390                  randconfig-001-20260704    gcc-10.5.0
s390                  randconfig-002-20260703    gcc-9.5.0
s390                  randconfig-002-20260704    gcc-10.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-17
sh                                  defconfig    gcc-14
sh                            hp6xx_defconfig    gcc-16.1.0
sh                    randconfig-001-20260703    gcc-9.5.0
sh                    randconfig-001-20260704    gcc-10.5.0
sh                    randconfig-002-20260703    gcc-9.5.0
sh                    randconfig-002-20260704    gcc-10.5.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260703    gcc-11.5.0
sparc                 randconfig-001-20260704    gcc-16.1.0
sparc                 randconfig-002-20260703    gcc-11.5.0
sparc                 randconfig-002-20260704    gcc-16.1.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260703    gcc-11.5.0
sparc64               randconfig-001-20260704    gcc-16.1.0
sparc64               randconfig-002-20260703    gcc-11.5.0
sparc64               randconfig-002-20260704    gcc-16.1.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260703    gcc-11.5.0
um                    randconfig-001-20260704    gcc-16.1.0
um                    randconfig-002-20260703    gcc-11.5.0
um                    randconfig-002-20260704    gcc-16.1.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260703    gcc-14
x86_64      buildonly-randconfig-001-20260704    gcc-14
x86_64      buildonly-randconfig-002-20260703    gcc-14
x86_64      buildonly-randconfig-002-20260704    gcc-14
x86_64      buildonly-randconfig-003-20260703    gcc-14
x86_64      buildonly-randconfig-003-20260704    gcc-14
x86_64      buildonly-randconfig-004-20260703    gcc-14
x86_64      buildonly-randconfig-004-20260704    gcc-14
x86_64      buildonly-randconfig-005-20260703    gcc-14
x86_64      buildonly-randconfig-005-20260704    gcc-14
x86_64      buildonly-randconfig-006-20260703    gcc-14
x86_64      buildonly-randconfig-006-20260704    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                         randconfig-001    clang-22
x86_64                randconfig-001-20260703    clang-22
x86_64                randconfig-001-20260704    clang-22
x86_64                         randconfig-002    clang-22
x86_64                randconfig-002-20260703    clang-22
x86_64                randconfig-002-20260704    clang-22
x86_64                         randconfig-003    clang-22
x86_64                randconfig-003-20260703    clang-22
x86_64                randconfig-003-20260704    clang-22
x86_64                         randconfig-004    clang-22
x86_64                randconfig-004-20260703    clang-22
x86_64                randconfig-004-20260704    clang-22
x86_64                         randconfig-005    clang-22
x86_64                randconfig-005-20260703    clang-22
x86_64                randconfig-005-20260704    clang-22
x86_64                         randconfig-006    clang-22
x86_64                randconfig-006-20260703    clang-22
x86_64                randconfig-006-20260704    clang-22
x86_64                         randconfig-011    gcc-14
x86_64                randconfig-011-20260703    gcc-14
x86_64                         randconfig-012    gcc-14
x86_64                randconfig-012-20260703    gcc-14
x86_64                         randconfig-013    gcc-14
x86_64                randconfig-013-20260703    gcc-14
x86_64                         randconfig-014    gcc-14
x86_64                randconfig-014-20260703    gcc-14
x86_64                         randconfig-015    gcc-14
x86_64                randconfig-015-20260703    gcc-14
x86_64                         randconfig-016    gcc-14
x86_64                randconfig-016-20260703    gcc-14
x86_64                         randconfig-071    clang-22
x86_64                randconfig-071-20260703    clang-22
x86_64                randconfig-071-20260704    gcc-14
x86_64                         randconfig-072    clang-22
x86_64                randconfig-072-20260703    clang-22
x86_64                randconfig-072-20260704    gcc-14
x86_64                         randconfig-073    clang-22
x86_64                randconfig-073-20260703    clang-22
x86_64                randconfig-073-20260704    gcc-14
x86_64                         randconfig-074    clang-22
x86_64                randconfig-074-20260703    clang-22
x86_64                randconfig-074-20260704    gcc-14
x86_64                         randconfig-075    clang-22
x86_64                randconfig-075-20260703    clang-22
x86_64                randconfig-075-20260704    gcc-14
x86_64                         randconfig-076    clang-22
x86_64                randconfig-076-20260703    clang-22
x86_64                randconfig-076-20260704    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-20
xtensa                randconfig-001-20260703    gcc-11.5.0
xtensa                randconfig-001-20260704    gcc-16.1.0
xtensa                randconfig-002-20260703    gcc-11.5.0
xtensa                randconfig-002-20260704    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
