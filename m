Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BB73806C6
	for <linux-usb@vger.kernel.org>; Tue,  2 Jun 2026 23:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780441532; cv=none; b=iVYZkUGB//aAUlkQyHwBZsxT3GSfsRJSlqKdNWU9oGw0QK7chXnC90JyXRNOCAGzgKtOwN9yzF+NaGdtOxHhSpjLRuxUlo2RufkZ7IWfiI5zHX4g5+MHjaPRxAZ+VYQO3uhr5yPg5uI8HpfeAyVN5ASqgaHNWQQLoUcpk+kmwFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780441532; c=relaxed/simple;
	bh=8q1bqR2MxoDfwljfqVv+1yO7F5BjSHwIkGpLGXLKgUI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LpXk+XlKGowxwgYK4rnXuKN9TZny/XW1tA1GqtZpqgPGeSZXGsJOQeZsr3hURmgt+lWDrLkCqN/1ymcoFSDyCMgTsBwASoISjNUuSamFego+rREZbjKeULWS60ZWVylbJStwku1bman8XHW/qbeElJeoyHug8HIWOZT3Agfk9BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c6r0EGnn; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c6r0EGnn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780441530; x=1811977530;
  h=date:from:to:cc:subject:message-id;
  bh=8q1bqR2MxoDfwljfqVv+1yO7F5BjSHwIkGpLGXLKgUI=;
  b=c6r0EGnnPRnK/KsZyGaxKfjElnLQmgkyXTcHcjMGSToDgclkT80RuiY1
   vqbvzUBy2ikZPXfb0iKMwd7ytfabD4vHfAmDDguLuHVFQwiavch9SWhlQ
   LLa/ZfeC9zrGXtykppV23yJVrBDo+5NhCn8Cqy5sZHJ6C8x5XGg5G9+Xr
   q1UW7xooBHMOZaXWJh/87igequiy+BqA8by+2f+l2RWeBVjcXXgYy1KBL
   1T8l6z1MGHtaStoB/STzh/MSRo5jS8WVBTQb7q42W290OlfQHZgDEfcwT
   4hGqoNGGuGUWDkGLdfxBJ8L95lXXJDM5T05AiQ+JAzrQ+iK42AQ76a8sL
   Q==;
X-CSE-ConnectionGUID: IAMa5cumRaq6iOMjn3e2pw==
X-CSE-MsgGUID: ZhETgPx9Smyo1N5DsorN6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="91925350"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="91925350"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 16:05:29 -0700
X-CSE-ConnectionGUID: hm1ujXnwR96OrFZOrpjAsw==
X-CSE-MsgGUID: 85r/ktkJScaOwVuyOyjHIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="267675578"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Jun 2026 16:05:28 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUYAn-00000000CeO-3MUz;
	Tue, 02 Jun 2026 23:05:25 +0000
Date: Wed, 03 Jun 2026 07:05:23 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 168479c9bf07ee28c372c48eebbf66f2d01911dd
Message-ID: <202606030714.jLHAiD3c-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: 168479c9bf07ee28c372c48eebbf66f2d01911dd  thunderbolt: test: Release third DP tunnel

elapsed time: 1512m

configs tested: 192
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                            randconfig-001    gcc-8.5.0
arc                   randconfig-001-20260602    gcc-8.5.0
arc                            randconfig-002    gcc-8.5.0
arc                   randconfig-002-20260602    gcc-8.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                            randconfig-001    gcc-8.5.0
arm                   randconfig-001-20260602    gcc-8.5.0
arm                            randconfig-002    gcc-8.5.0
arm                   randconfig-002-20260602    gcc-8.5.0
arm                            randconfig-003    gcc-8.5.0
arm                   randconfig-003-20260602    gcc-8.5.0
arm                            randconfig-004    gcc-8.5.0
arm                   randconfig-004-20260602    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260602    gcc-15.2.0
arm64                 randconfig-002-20260602    gcc-15.2.0
arm64                 randconfig-003-20260602    gcc-15.2.0
arm64                 randconfig-004-20260602    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260602    gcc-15.2.0
csky                  randconfig-002-20260602    gcc-15.2.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260602    gcc-11.5.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260602    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260602    clang-20
i386        buildonly-randconfig-002-20260602    clang-20
i386        buildonly-randconfig-003-20260602    clang-20
i386        buildonly-randconfig-004-20260602    clang-20
i386        buildonly-randconfig-005-20260602    clang-20
i386        buildonly-randconfig-006-20260602    clang-20
i386                                defconfig    gcc-15.2.0
i386                           randconfig-001    gcc-14
i386                  randconfig-001-20260602    gcc-14
i386                           randconfig-002    gcc-14
i386                  randconfig-002-20260602    gcc-14
i386                           randconfig-003    gcc-14
i386                  randconfig-003-20260602    gcc-14
i386                           randconfig-004    gcc-14
i386                  randconfig-004-20260602    gcc-14
i386                           randconfig-005    gcc-14
i386                  randconfig-005-20260602    gcc-14
i386                           randconfig-006    gcc-14
i386                  randconfig-006-20260602    gcc-14
i386                           randconfig-007    gcc-14
i386                  randconfig-007-20260602    gcc-14
i386                  randconfig-011-20260602    clang-20
i386                  randconfig-012-20260602    clang-20
i386                  randconfig-013-20260602    clang-20
i386                  randconfig-014-20260602    clang-20
i386                  randconfig-015-20260602    clang-20
i386                  randconfig-016-20260602    clang-20
i386                  randconfig-017-20260602    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260602    gcc-11.5.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260602    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260602    gcc-11.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260602    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc         de0_nano_multicore_defconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                         randconfig-001    gcc-12.5.0
parisc                randconfig-001-20260602    gcc-12.5.0
parisc                         randconfig-002    gcc-12.5.0
parisc                randconfig-002-20260602    gcc-12.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                        randconfig-001    gcc-12.5.0
powerpc               randconfig-001-20260602    gcc-12.5.0
powerpc                        randconfig-002    gcc-12.5.0
powerpc               randconfig-002-20260602    gcc-12.5.0
powerpc64                      randconfig-001    gcc-12.5.0
powerpc64             randconfig-001-20260602    gcc-12.5.0
powerpc64                      randconfig-002    gcc-12.5.0
powerpc64             randconfig-002-20260602    gcc-12.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260602    gcc-8.5.0
riscv                 randconfig-002-20260602    gcc-8.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260602    gcc-8.5.0
s390                  randconfig-002-20260602    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260602    gcc-8.5.0
sh                    randconfig-002-20260602    gcc-8.5.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260603    gcc-15.2.0
sparc                 randconfig-002-20260603    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260603    gcc-15.2.0
sparc64               randconfig-002-20260603    gcc-15.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260603    gcc-15.2.0
um                    randconfig-002-20260603    gcc-15.2.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260602    gcc-14
x86_64      buildonly-randconfig-002-20260602    gcc-14
x86_64      buildonly-randconfig-003-20260602    gcc-14
x86_64      buildonly-randconfig-004-20260602    gcc-14
x86_64      buildonly-randconfig-005-20260602    gcc-14
x86_64      buildonly-randconfig-006-20260602    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260602    gcc-12
x86_64                randconfig-002-20260602    gcc-12
x86_64                randconfig-003-20260602    gcc-12
x86_64                randconfig-004-20260602    gcc-12
x86_64                randconfig-005-20260602    gcc-12
x86_64                randconfig-006-20260602    gcc-12
x86_64                randconfig-011-20260603    clang-20
x86_64                randconfig-012-20260603    clang-20
x86_64                randconfig-013-20260603    clang-20
x86_64                randconfig-014-20260603    clang-20
x86_64                randconfig-015-20260603    clang-20
x86_64                randconfig-016-20260603    clang-20
x86_64                randconfig-071-20260602    clang-20
x86_64                randconfig-072-20260602    clang-20
x86_64                randconfig-073-20260602    clang-20
x86_64                randconfig-074-20260602    clang-20
x86_64                randconfig-075-20260602    clang-20
x86_64                randconfig-076-20260602    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260603    gcc-15.2.0
xtensa                randconfig-002-20260603    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
