Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C770346E4A
	for <linux-usb@vger.kernel.org>; Wed,  3 Jun 2026 08:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780473917; cv=none; b=i81ZH+dCIYBB+lBQnMXjwA3sJ0hOQFKNjnThyyeXJOsRUiCYhfdfBbWk9ORYlkYt86zS/412UgGCQuKm1wic/3RpnPrSKN9DBXPipqlXT6Rnu+OzC2d35GnBcuAg5F8VXr3k9P6fX8Yvr8VVSGmn/JaYt9PAHpXOIjYe2T78OPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780473917; c=relaxed/simple;
	bh=dxgtkFjF24ktkANCRrAtqNy83izAoZsuvftj48HmYac=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QCw2rA1b4qnUR7AioIm9CeDARWWZUBwD9xLDO0grre825MbTS6zt3rEjG7EQmwSpahOSXXValydQbr9cnL9mqFQkwx8IVU5zwDEspjAKrkA6e0B1H566d8d0REtB7Uk1KMgIrlaIIl814ls/0aEWZQa9Pabd508sM2SqE78VwX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QZWVcIfb; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QZWVcIfb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780473915; x=1812009915;
  h=date:from:to:cc:subject:message-id;
  bh=dxgtkFjF24ktkANCRrAtqNy83izAoZsuvftj48HmYac=;
  b=QZWVcIfbPU1jrHo6IFX7pRQOau3u6F4/N2szMmSGN3K6CpYdosQopJvC
   PsUGJY1lgQvQtql7DdBNAuHpFXc7UB4yKcPajsLEsda5M+Xsw0aoaw3JY
   irCT5fUIIFzMWR08c439cW+dg+bBrxTHBwl4cfHHN9AClmeaAKdLP5+37
   5PD+41ZPhDGEtSYZgsogLtHo248EU246ioc4/KZYGuzAYRcGCCizMk8ir
   ImFjPyaYtLCUuJL+8IuAkcJKpNO6FgbleX4jPENH6m+UAPYM8H+HSBtyP
   R8A5LlbUY9HPA8Hx+TsGQjShoHUBEXgjzL0Zr8fun/N+wMQ+FKd72PPQD
   A==;
X-CSE-ConnectionGUID: aoJzDZr0Rz2z0dLlhGBykg==
X-CSE-MsgGUID: uQcrgFOMQpmF9Sr2b96oMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81303601"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="81303601"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 01:05:11 -0700
X-CSE-ConnectionGUID: O5Pn0lnpSg6LtWBnZoAzcw==
X-CSE-MsgGUID: RBeKvVFfTIKHxMImkANzdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="239986435"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Jun 2026 01:05:08 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUgb3-00000000D7q-2zav;
	Wed, 03 Jun 2026 08:05:05 +0000
Date: Wed, 03 Jun 2026 16:04:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 55311a92bc9564b058a036074f85200a5954ccd2
Message-ID: <202606031634.lv0xYSm6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 55311a92bc9564b058a036074f85200a5954ccd2  Merge tag 'v7.1-rc6' into usb-next

elapsed time: 2051m

configs tested: 182
configs skipped: 19

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260602    gcc-11.5.0
arc                   randconfig-002-20260602    gcc-14.3.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                          pxa168_defconfig    clang-19
arm                   randconfig-001-20260602    gcc-11.5.0
arm                   randconfig-002-20260602    gcc-8.5.0
arm                   randconfig-003-20260602    gcc-10.5.0
arm                   randconfig-004-20260602    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260602    gcc-14.3.0
arm64                 randconfig-002-20260602    gcc-15.2.0
arm64                 randconfig-003-20260602    clang-23
arm64                 randconfig-004-20260602    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260602    gcc-12.5.0
csky                  randconfig-002-20260602    gcc-14.3.0
hexagon                           allnoconfig    clang-23
hexagon                             defconfig    clang-23
hexagon               randconfig-001-20260602    clang-23
hexagon               randconfig-002-20260602    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260602    clang-20
i386        buildonly-randconfig-002-20260602    gcc-13
i386        buildonly-randconfig-003-20260602    clang-20
i386        buildonly-randconfig-004-20260602    gcc-14
i386        buildonly-randconfig-005-20260602    clang-20
i386        buildonly-randconfig-006-20260602    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20260602    clang-20
i386                  randconfig-002-20260602    clang-20
i386                  randconfig-003-20260602    gcc-14
i386                  randconfig-004-20260602    clang-20
i386                  randconfig-005-20260602    clang-20
i386                  randconfig-006-20260602    clang-20
i386                  randconfig-007-20260602    gcc-14
i386                  randconfig-011-20260602    gcc-14
i386                  randconfig-012-20260602    clang-20
i386                  randconfig-013-20260602    clang-20
i386                  randconfig-014-20260602    gcc-14
i386                  randconfig-015-20260602    gcc-14
i386                  randconfig-016-20260602    clang-20
i386                  randconfig-017-20260602    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260602    clang-23
loongarch             randconfig-002-20260602    gcc-16.1.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260602    gcc-8.5.0
nios2                 randconfig-002-20260602    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260602    gcc-12.5.0
parisc                randconfig-002-20260602    gcc-8.5.0
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260602    clang-23
powerpc               randconfig-002-20260602    gcc-8.5.0
powerpc64             randconfig-001-20260602    clang-23
powerpc64             randconfig-002-20260602    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                 randconfig-001-20260602    gcc-13.4.0
riscv                 randconfig-002-20260602    clang-23
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                  randconfig-001-20260602    gcc-10.5.0
s390                  randconfig-002-20260602    gcc-8.5.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260602    gcc-11.5.0
sh                    randconfig-002-20260602    gcc-16.1.0
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260602    gcc-12.5.0
sparc                 randconfig-001-20260603    gcc-8.5.0
sparc                 randconfig-002-20260602    gcc-12.5.0
sparc                 randconfig-002-20260603    gcc-16.1.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260602    gcc-8.5.0
sparc64               randconfig-001-20260603    clang-23
sparc64               randconfig-002-20260602    clang-20
sparc64               randconfig-002-20260603    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                                  defconfig    clang-23
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260602    gcc-14
um                    randconfig-001-20260603    gcc-14
um                    randconfig-002-20260602    clang-23
um                    randconfig-002-20260603    gcc-14
um                           x86_64_defconfig    clang-23
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64               buildonly-randconfig-001    gcc-12
x86_64      buildonly-randconfig-001-20260602    gcc-14
x86_64               buildonly-randconfig-002    clang-20
x86_64      buildonly-randconfig-002-20260602    clang-20
x86_64               buildonly-randconfig-003    gcc-14
x86_64      buildonly-randconfig-003-20260602    gcc-14
x86_64               buildonly-randconfig-004    gcc-14
x86_64      buildonly-randconfig-004-20260602    clang-20
x86_64               buildonly-randconfig-005    gcc-14
x86_64      buildonly-randconfig-005-20260602    gcc-14
x86_64               buildonly-randconfig-006    clang-20
x86_64      buildonly-randconfig-006-20260602    gcc-14
x86_64                              defconfig    gcc-14
x86_64                         randconfig-001    gcc-14
x86_64                randconfig-001-20260602    clang-20
x86_64                randconfig-001-20260603    clang-20
x86_64                         randconfig-002    gcc-14
x86_64                randconfig-002-20260602    clang-20
x86_64                randconfig-002-20260603    clang-20
x86_64                         randconfig-003    clang-20
x86_64                randconfig-003-20260602    gcc-12
x86_64                randconfig-003-20260603    clang-20
x86_64                         randconfig-004    clang-20
x86_64                randconfig-004-20260602    gcc-14
x86_64                randconfig-004-20260603    clang-20
x86_64                         randconfig-005    gcc-14
x86_64                randconfig-005-20260603    clang-20
x86_64                         randconfig-006    clang-20
x86_64                randconfig-006-20260602    clang-20
x86_64                randconfig-006-20260603    gcc-14
x86_64                randconfig-011-20260602    clang-20
x86_64                randconfig-011-20260603    gcc-14
x86_64                randconfig-012-20260602    clang-20
x86_64                randconfig-012-20260603    gcc-14
x86_64                randconfig-013-20260603    clang-20
x86_64                randconfig-014-20260602    gcc-13
x86_64                randconfig-014-20260603    gcc-14
x86_64                randconfig-015-20260602    clang-20
x86_64                randconfig-015-20260603    gcc-14
x86_64                randconfig-016-20260602    clang-20
x86_64                randconfig-016-20260603    clang-20
x86_64                randconfig-071-20260602    clang-20
x86_64                randconfig-072-20260602    clang-20
x86_64                randconfig-073-20260602    gcc-14
x86_64                randconfig-074-20260602    gcc-14
x86_64                randconfig-075-20260602    clang-20
x86_64                randconfig-076-20260602    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0
xtensa                randconfig-001-20260603    gcc-9.5.0
xtensa                randconfig-002-20260602    gcc-14.3.0
xtensa                randconfig-002-20260603    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
