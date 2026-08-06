Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B85529AB05
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 19:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786044198; cv=none; b=AJarRW/LOgHJVASDu5TsvNUl+0iSODTkAT1Oj6ISvW9sj4Qnll4PofKHGJ2dg2xn+oEowZzbATdtIxI+CIwqFf+rATPH0TND8ul3RChzljdQsFLsADPXAfGcRPng5RofgdYdon9oYVXo7c9YoL/xSlwDARH+1m51WCpKOkRdhwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786044198; c=relaxed/simple;
	bh=lRrZd97klUpBfH8v2jTcopoDA3R59h9IsllEluz5ZcM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J/FBIg5QdgPRJTbVO3MhwBjwLngGhE68rmwU4mk9RxPLUbrlepDkud33/8HxevhUGcYCyjcFDV2N3gkw2/AiZmtD58NW9X6U2+fhylS3hBin9csFRlltLExGHp5gJZan55JZVxZeMM1qakmKBAbcmQXqR6+NK2fuwCa2XEr4St0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HEanwv6K; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HEanwv6K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786044191; x=1817580191;
  h=date:from:to:cc:subject:message-id;
  bh=lRrZd97klUpBfH8v2jTcopoDA3R59h9IsllEluz5ZcM=;
  b=HEanwv6KA0KHCbOeJwf+eLoBGS5/+66Lf60au2uyUmdF5etSjy6yTyzA
   xFIX4RVrOn3V1mqPc2GLqaMKH9bcvXY8y1TEXLjAafzLzfkRez+UUz/6k
   rayjy8dzy589ZD4nMhK9/lSvjWDLLBAR7j4+2oiUViSlbK64IEBKAvacy
   ml0Xumays2bVkFysNCyWwncwTB+4Xp+jLs6SqGICKd/LyrciukP5kHYtp
   nWAcr1lHH/eklco7n+KLlOYWA2FH8TkGTz6/H8AWmusVrLjHRQwnkZXcT
   8jZm/SK6RX+FGSWZnCJFWjNjDw1VrRxXi7+HW6Q2vbBg3mutLsMqGkwaN
   w==;
X-CSE-ConnectionGUID: +RddWlLiSKGWEOAzN/CjgA==
X-CSE-MsgGUID: HB5Fg5G9QUOL4a0c4LmcbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="97299973"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="97299973"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 12:23:08 -0700
X-CSE-ConnectionGUID: cRaKZzalSI+RCmjODJxzIw==
X-CSE-MsgGUID: tGSRbLeeSwaxANsj5qIUHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="264181084"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Aug 2026 12:23:07 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ws3gH-00000000G1p-02U7;
	Thu, 06 Aug 2026 19:23:05 +0000
Date: Fri, 07 Aug 2026 03:22:09 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 e120d14d03b3db5f4ac049f32328c4951a532a90
Message-ID: <202608070358.iIDLl2CK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: e120d14d03b3db5f4ac049f32328c4951a532a90  thunderbolt: stream: Add support for busy polling

elapsed time: 1870m

configs tested: 131
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260806    gcc-11.5.0
arc                  randconfig-002-20260806    gcc-11.5.0
arm                  randconfig-001-20260806    gcc-11.5.0
arm                  randconfig-002-20260806    gcc-11.5.0
arm                  randconfig-003-20260806    gcc-11.5.0
arm                  randconfig-004-20260806    gcc-11.5.0
arm64                randconfig-001-20260806    gcc-13.4.0
arm64                randconfig-001-20260807    gcc-16.1.0
arm64                randconfig-002-20260806    gcc-13.4.0
arm64                randconfig-002-20260807    gcc-16.1.0
arm64                randconfig-003-20260806    gcc-13.4.0
arm64                randconfig-003-20260807    gcc-16.1.0
arm64                randconfig-004-20260806    gcc-13.4.0
arm64                randconfig-004-20260807    gcc-16.1.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260806    gcc-13.4.0
csky                 randconfig-001-20260807    gcc-16.1.0
csky                 randconfig-002-20260806    gcc-13.4.0
csky                 randconfig-002-20260807    gcc-16.1.0
hexagon              randconfig-001-20260806    clang-24
hexagon              randconfig-001-20260807    clang-18
hexagon              randconfig-002-20260806    clang-24
hexagon              randconfig-002-20260807    clang-18
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260806    gcc-14
i386       buildonly-randconfig-002-20260806    gcc-14
i386       buildonly-randconfig-003-20260806    gcc-14
i386       buildonly-randconfig-004-20260806    gcc-14
i386       buildonly-randconfig-005-20260806    gcc-14
i386       buildonly-randconfig-006-20260806    gcc-14
i386                          randconfig-001    clang-22
i386                 randconfig-001-20260806    clang-22
i386                 randconfig-002-20260806    clang-22
i386                 randconfig-003-20260806    clang-22
i386                 randconfig-004-20260806    clang-22
i386                 randconfig-005-20260806    clang-22
i386                 randconfig-006-20260806    clang-22
i386                 randconfig-007-20260806    clang-22
i386                 randconfig-011-20260806    clang-22
i386                 randconfig-012-20260806    clang-22
i386                 randconfig-013-20260806    clang-22
i386                 randconfig-014-20260806    clang-22
i386                 randconfig-015-20260806    clang-22
i386                 randconfig-016-20260806    clang-22
i386                 randconfig-017-20260806    clang-22
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260806    clang-24
loongarch            randconfig-001-20260807    clang-18
loongarch            randconfig-002-20260806    clang-24
loongarch            randconfig-002-20260807    clang-18
m68k                      m5208evb_defconfig    gcc-16.1.0
m68k                         sun3x_defconfig    gcc-16.1.0
mips                          xway_defconfig    clang-19
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260806    clang-24
nios2                randconfig-001-20260807    clang-18
nios2                randconfig-002-20260806    clang-24
nios2                randconfig-002-20260807    clang-18
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260806    gcc-8.5.0
parisc               randconfig-001-20260807    gcc-8.5.0
parisc               randconfig-002-20260806    gcc-8.5.0
parisc               randconfig-002-20260807    gcc-8.5.0
powerpc                    asp8347_defconfig    clang-24
powerpc              randconfig-001-20260806    gcc-8.5.0
powerpc              randconfig-001-20260807    gcc-8.5.0
powerpc              randconfig-002-20260806    gcc-8.5.0
powerpc              randconfig-002-20260807    gcc-8.5.0
powerpc64            randconfig-001-20260806    gcc-8.5.0
powerpc64            randconfig-001-20260807    gcc-8.5.0
powerpc64            randconfig-002-20260806    gcc-8.5.0
powerpc64            randconfig-002-20260807    gcc-8.5.0
riscv                         randconfig-001    gcc-13.4.0
riscv                randconfig-001-20260806    gcc-13.4.0
riscv                randconfig-001-20260807    gcc-12.5.0
riscv                randconfig-002-20260806    gcc-13.4.0
riscv                randconfig-002-20260807    gcc-12.5.0
s390                 randconfig-001-20260806    gcc-13.4.0
s390                 randconfig-001-20260807    gcc-12.5.0
s390                 randconfig-002-20260806    gcc-13.4.0
s390                 randconfig-002-20260807    gcc-12.5.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260806    gcc-13.4.0
sh                   randconfig-001-20260807    gcc-12.5.0
sh                   randconfig-002-20260806    gcc-13.4.0
sh                   randconfig-002-20260807    gcc-12.5.0
sparc                         randconfig-001    gcc-8.5.0
sparc                randconfig-001-20260806    gcc-8.5.0
sparc                randconfig-002-20260806    gcc-8.5.0
sparc64              randconfig-001-20260806    gcc-8.5.0
sparc64              randconfig-002-20260806    gcc-8.5.0
um                   randconfig-001-20260806    gcc-8.5.0
um                   randconfig-002-20260806    gcc-8.5.0
x86_64              buildonly-randconfig-001    clang-22
x86_64     buildonly-randconfig-001-20260806    clang-22
x86_64     buildonly-randconfig-002-20260806    clang-22
x86_64     buildonly-randconfig-003-20260806    clang-22
x86_64     buildonly-randconfig-004-20260806    clang-22
x86_64     buildonly-randconfig-005-20260806    clang-22
x86_64     buildonly-randconfig-006-20260806    clang-22
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260806    clang-22
x86_64               randconfig-002-20260806    clang-22
x86_64               randconfig-003-20260806    clang-22
x86_64               randconfig-004-20260806    clang-22
x86_64               randconfig-005-20260806    clang-22
x86_64               randconfig-006-20260806    clang-22
x86_64                        randconfig-011    clang-22
x86_64               randconfig-011-20260806    clang-22
x86_64               randconfig-012-20260806    clang-22
x86_64               randconfig-013-20260806    clang-22
x86_64               randconfig-014-20260806    clang-22
x86_64               randconfig-015-20260806    clang-22
x86_64               randconfig-016-20260806    clang-22
x86_64               randconfig-071-20260806    gcc-14
x86_64               randconfig-072-20260806    gcc-14
x86_64               randconfig-073-20260806    gcc-14
x86_64               randconfig-074-20260806    gcc-14
x86_64               randconfig-075-20260806    gcc-14
x86_64               randconfig-076-20260806    gcc-14
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260806    gcc-8.5.0
xtensa               randconfig-002-20260806    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
