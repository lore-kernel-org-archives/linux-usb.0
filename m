Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879E12EEE72
	for <linux-usb@vger.kernel.org>; Thu,  4 Jun 2026 22:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780612224; cv=none; b=LbGjrUnEPNrea/yp/I8D1ppcCLsniKMUeeppg+m85IcfLjATnBuD+y3Yo2OSfLOhty6k0LTjiui0jKkaWT+z0TF2do3vT0vpvDLIjwo25s1DX9TTAWLmpZNCJV4tVGyQacX4GFgMq9luLI7XdEeKc2TeI+fnM8DItt6BYvx5QAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780612224; c=relaxed/simple;
	bh=LoliRsi/Ajyug5jxuTCj9Do0TlmCwYFMDUZ+17QxP0U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YQPx7fHcZeASltSewhpoU+AA/3w6caAkQ5rNf6eSL1RNH+VPBWwrNR1sQ9jgvXwi1SkpTVkneRw308q6KppJ+m4rKSacejF+aA3u2UaozXYUvJGpokp78FJU+QIvlFhaiwrxsw8pKqS+ktoZmuaNEgkob7MbJmQMzicSA6l9PeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mUsxCwc2; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mUsxCwc2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780612222; x=1812148222;
  h=date:from:to:cc:subject:message-id;
  bh=LoliRsi/Ajyug5jxuTCj9Do0TlmCwYFMDUZ+17QxP0U=;
  b=mUsxCwc24n90TYLh02oCeG8Wt0a2Ivx8GrbWjtj2ngQFThTp+zz6XdPJ
   b+fRYwUgi4eqA8qLWG1fJkW/gVI2l9YH/HzoPqWtQoICZDvOcw4eI4WXx
   q5gPq2L+TRY20srmmv1rs+o8lfkhNKSdEmsJfWqAEXTdonqulHszS0/xF
   CbCNIkgsnypTImL8SfqXMcy+bfyXjMV+iXJMNG2YRAWKSofOju93ZwqUx
   vPpI8XXMWU7uXsacG8J+6G2yEDXuhaTQQ0tykY18nSaON2erjcGHT1s/k
   dl23P3a58hhDB4PyPCRo8M+eBHhQsHtWqTZcF0ZHy53pXEKRi4BvmtbcJ
   w==;
X-CSE-ConnectionGUID: ga63BjfKSduuhdYT3Ax//A==
X-CSE-MsgGUID: bXZA5iy4RRKQbnFC8vFd/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81572974"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="81572974"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 15:30:22 -0700
X-CSE-ConnectionGUID: YvqWm6i5Q+m7m9eLSFDmaQ==
X-CSE-MsgGUID: 8cRIMN8wS06dds1r4dD+Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="282762676"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Jun 2026 15:30:21 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVGZt-00000000FHU-3ZVt;
	Thu, 04 Jun 2026 22:30:17 +0000
Date: Fri, 05 Jun 2026 06:30:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 511e746700ee6e93104d061a87743906128ab709
Message-ID: <202606050604.sRBWsKcW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 511e746700ee6e93104d061a87743906128ab709  usb: host: xhci-rcar: Split R-Car Gen2 and Gen3 .plat_start() handling

elapsed time: 1543m

configs tested: 191
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260604    gcc-10.5.0
arc                   randconfig-002-20260604    gcc-16.1.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                   randconfig-001-20260604    gcc-8.5.0
arm                   randconfig-002-20260604    gcc-14.3.0
arm                   randconfig-003-20260604    clang-23
arm                   randconfig-004-20260604    clang-23
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260604    clang-23
arm64                 randconfig-002-20260604    clang-23
arm64                 randconfig-003-20260604    clang-20
arm64                 randconfig-004-20260604    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260604    gcc-16.1.0
csky                  randconfig-002-20260604    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon                             defconfig    clang-23
hexagon               randconfig-001-20260604    clang-23
hexagon               randconfig-002-20260604    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260604    clang-20
i386        buildonly-randconfig-002-20260604    gcc-14
i386        buildonly-randconfig-003-20260604    gcc-14
i386        buildonly-randconfig-004-20260604    clang-20
i386        buildonly-randconfig-005-20260604    gcc-14
i386        buildonly-randconfig-006-20260604    clang-20
i386                                defconfig    clang-22
i386                           randconfig-001    clang-20
i386                  randconfig-001-20260604    clang-20
i386                           randconfig-002    gcc-14
i386                  randconfig-002-20260604    clang-20
i386                           randconfig-003    gcc-14
i386                  randconfig-003-20260604    gcc-13
i386                           randconfig-004    clang-20
i386                  randconfig-004-20260604    clang-20
i386                           randconfig-005    gcc-14
i386                  randconfig-005-20260604    clang-20
i386                           randconfig-006    gcc-14
i386                  randconfig-006-20260604    clang-20
i386                           randconfig-007    gcc-14
i386                  randconfig-007-20260604    clang-20
i386                           randconfig-011    clang-22
i386                  randconfig-011-20260604    gcc-14
i386                           randconfig-012    clang-22
i386                  randconfig-012-20260604    gcc-14
i386                           randconfig-013    gcc-14
i386                  randconfig-013-20260604    gcc-14
i386                           randconfig-014    clang-22
i386                  randconfig-014-20260604    gcc-12
i386                           randconfig-015    gcc-14
i386                  randconfig-015-20260604    clang-22
i386                           randconfig-016    gcc-14
i386                  randconfig-016-20260604    clang-22
i386                           randconfig-017    gcc-14
i386                  randconfig-017-20260604    clang-22
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260604    clang-18
loongarch             randconfig-002-20260604    gcc-16.1.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    gcc-16.1.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260604    gcc-8.5.0
nios2                 randconfig-002-20260604    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-16.1.0
parisc                         randconfig-001    gcc-13.4.0
parisc                randconfig-001-20260604    gcc-8.5.0
parisc                         randconfig-002    gcc-8.5.0
parisc                randconfig-002-20260604    gcc-12.5.0
parisc64                            defconfig    gcc-16.1.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc                   bluestone_defconfig    clang-23
powerpc                        randconfig-001    gcc-13.4.0
powerpc               randconfig-001-20260604    clang-23
powerpc                        randconfig-002    gcc-10.5.0
powerpc               randconfig-002-20260604    clang-17
powerpc64                      randconfig-001    clang-17
powerpc64             randconfig-001-20260604    clang-23
powerpc64                      randconfig-002    clang-23
powerpc64             randconfig-002-20260604    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                 randconfig-001-20260604    clang-23
riscv                 randconfig-002-20260604    clang-23
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-18
s390                           randconfig-001    gcc-11.5.0
s390                  randconfig-001-20260604    clang-20
s390                  randconfig-002-20260604    clang-17
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-16.1.0
sh                    randconfig-001-20260604    gcc-12.5.0
sh                    randconfig-002-20260604    gcc-16.1.0
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260604    gcc-13.4.0
sparc                 randconfig-002-20260604    gcc-11.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-23
sparc64               randconfig-001-20260604    gcc-9.5.0
sparc64               randconfig-002-20260604    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260604    clang-23
um                    randconfig-002-20260604    clang-23
um                           x86_64_defconfig    clang-23
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-22
x86_64               buildonly-randconfig-001    gcc-12
x86_64      buildonly-randconfig-001-20260604    gcc-14
x86_64               buildonly-randconfig-002    clang-20
x86_64      buildonly-randconfig-002-20260604    clang-20
x86_64               buildonly-randconfig-003    gcc-14
x86_64      buildonly-randconfig-003-20260604    gcc-14
x86_64               buildonly-randconfig-004    gcc-14
x86_64      buildonly-randconfig-004-20260604    clang-20
x86_64               buildonly-randconfig-005    gcc-14
x86_64      buildonly-randconfig-005-20260604    gcc-13
x86_64               buildonly-randconfig-006    clang-20
x86_64      buildonly-randconfig-006-20260604    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260604    clang-20
x86_64                randconfig-002-20260604    gcc-14
x86_64                randconfig-003-20260604    clang-20
x86_64                randconfig-004-20260604    clang-20
x86_64                randconfig-005-20260604    clang-20
x86_64                randconfig-006-20260604    gcc-14
x86_64                randconfig-011-20260604    clang-22
x86_64                randconfig-012-20260604    clang-22
x86_64                randconfig-013-20260604    clang-22
x86_64                randconfig-014-20260604    gcc-13
x86_64                randconfig-015-20260604    clang-22
x86_64                randconfig-016-20260604    clang-22
x86_64                         randconfig-071    gcc-14
x86_64                randconfig-071-20260604    clang-20
x86_64                         randconfig-072    gcc-14
x86_64                         randconfig-073    clang-20
x86_64                randconfig-073-20260604    clang-20
x86_64                         randconfig-074    gcc-14
x86_64                randconfig-074-20260604    clang-20
x86_64                         randconfig-075    gcc-13
x86_64                         randconfig-076    clang-20
x86_64                randconfig-076-20260604    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                randconfig-001-20260604    gcc-13.4.0
xtensa                randconfig-002-20260604    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
