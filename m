Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A183B3B3BF8
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 11:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773748435; cv=none; b=GfhefiN9onDal+jZmezvVdPEQMjsHUSgh84RH15RvLi0Y9AgyH8GsaTuXGe52oTIlhI+ohB6fKDkcQMQ6H7RCh+0LZOqItAY3TgY6naJSuKdnWNno+UsrNK2HY5mv2I47wbJNIotxmDkHv9NxnD0W+DvCoCDPu65aZ6cNTZ1Pww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773748435; c=relaxed/simple;
	bh=6NswpIBXHznqN+2V17+tZZGLjtHcEUlfNbuInCe3y4U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bnIkVVZEwZu7Bv/2ajV5hzNv8JfuOTDC7IM9+TopvdD03kzrPgKPLgJM7JdFM7LLZT2mAENgLqsJi5sURqSks4NHnxBmXNHQhR9zOYE7vx3hUjjDbXejdh3jn2tLtQYEJAcczpLRn4yDgB68Ho0rBM4or3Mp/tXNJwbcWkb9ryM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WpJ7ihTo; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WpJ7ihTo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773748434; x=1805284434;
  h=date:from:to:cc:subject:message-id;
  bh=6NswpIBXHznqN+2V17+tZZGLjtHcEUlfNbuInCe3y4U=;
  b=WpJ7ihTokMnwIEEpJsjfzdsGAVfyYWy7N2JJToEyAcP4gAzYXGkP6GkN
   0pje37D+8OkolOlszOWKqtNq8TyxTffBBCud4349/OYgRWSfm6FIbl74X
   PpBZGF7WzNJLefhSS0PfDbNO7tsPp5hTa6tERNYpCIpxhF8Y10FmiRtyh
   VQiR7+b3sWvu3REOx/jsTubmcMo5mNtDywpIGs0/I0omryDE7eQxqie9V
   9w3Ac9x0WghxZLE1P2Pjs4NvSMrcjn86xaFK0nkbb6D1UoU2HYJOPbJ36
   L+U9PfeaGV2Bh4nhu6W+SxvrG127pPwuvO49jWvr91OOVvevW8cRyMoYi
   A==;
X-CSE-ConnectionGUID: /i+L3As0TMWBBPxwH6AWkA==
X-CSE-MsgGUID: 4qMP/S9RR2u0/IhZl5asag==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="77387072"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="77387072"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 04:53:53 -0700
X-CSE-ConnectionGUID: I8vU5f4AQBeejyJSKUz8vw==
X-CSE-MsgGUID: afSCWW5dRiK6Vo76e4bFgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="246938100"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Mar 2026 04:53:52 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2Szd-000000000LP-22EV;
	Tue, 17 Mar 2026 11:53:49 +0000
Date: Tue, 17 Mar 2026 19:53:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 de6c925db978004703944585e9dd57d58aba0fac
Message-ID: <202603171910.yP0b4UbU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: de6c925db978004703944585e9dd57d58aba0fac  Merge 7.0-rc4 into usb-next

elapsed time: 1483m

configs tested: 159
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                   randconfig-001-20260317    clang-23
arc                   randconfig-002-20260317    clang-23
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                          exynos_defconfig    clang-23
arm                   randconfig-001-20260317    clang-23
arm                   randconfig-002-20260317    clang-23
arm                   randconfig-003-20260317    clang-23
arm                   randconfig-004-20260317    clang-23
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                 randconfig-001-20260317    clang-23
arm64                 randconfig-002-20260317    clang-23
arm64                 randconfig-003-20260317    clang-23
arm64                 randconfig-004-20260317    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                  randconfig-001-20260317    clang-23
csky                  randconfig-002-20260317    clang-23
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon               randconfig-001-20260317    gcc-8.5.0
hexagon               randconfig-002-20260317    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260317    clang-20
i386        buildonly-randconfig-002-20260317    clang-20
i386        buildonly-randconfig-003-20260317    clang-20
i386        buildonly-randconfig-004-20260317    clang-20
i386        buildonly-randconfig-005-20260317    clang-20
i386        buildonly-randconfig-006-20260317    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260317    gcc-8.5.0
loongarch             randconfig-002-20260317    gcc-8.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260317    gcc-8.5.0
nios2                 randconfig-002-20260317    gcc-8.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260317    gcc-8.5.0
parisc                randconfig-002-20260317    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260317    gcc-8.5.0
powerpc               randconfig-002-20260317    gcc-8.5.0
powerpc64             randconfig-001-20260317    gcc-8.5.0
powerpc64             randconfig-002-20260317    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260317    gcc-10.5.0
riscv                 randconfig-002-20260317    gcc-10.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260317    gcc-10.5.0
s390                  randconfig-002-20260317    gcc-10.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260317    gcc-10.5.0
sh                    randconfig-002-20260317    gcc-10.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260317    gcc-14
x86_64      buildonly-randconfig-002-20260317    gcc-14
x86_64      buildonly-randconfig-003-20260317    gcc-14
x86_64      buildonly-randconfig-004-20260317    gcc-14
x86_64      buildonly-randconfig-005-20260317    gcc-14
x86_64      buildonly-randconfig-006-20260317    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-011-20260317    clang-20
x86_64                randconfig-012-20260317    clang-20
x86_64                randconfig-013-20260317    clang-20
x86_64                randconfig-014-20260317    clang-20
x86_64                randconfig-015-20260317    clang-20
x86_64                randconfig-016-20260317    clang-20
x86_64                randconfig-071-20260317    clang-20
x86_64                randconfig-072-20260317    clang-20
x86_64                randconfig-073-20260317    clang-20
x86_64                randconfig-074-20260317    clang-20
x86_64                randconfig-075-20260317    clang-20
x86_64                randconfig-076-20260317    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                           allyesconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
