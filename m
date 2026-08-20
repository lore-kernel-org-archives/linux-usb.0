Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE2A379C24
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 23:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787267153; cv=none; b=fWBbKGGIMPms/aywbBedOGeoKYoEEIslo6xHp7wjfYzicktpgjNN/+WAxXJpkSHeGu0yHs3bozwTjgA2bOE8FsH9coKfHwwwzi+u7o+EwC8XOB5Enf1hnZNRh3sIPXuveO2HoO8TrwCxkF67h+GUelDkMY74uBtwyw0b0HRZ8kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787267153; c=relaxed/simple;
	bh=eQZMTjy6FUKbmk9xFfRfGioWP6pKsJE/F91/LSCrXHk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rR4+J8TCVvpE6AhSsVJHUT4wMhS+vSNGprSeJB9umKACHJQmjBhIpkmDojtWnSZoKzUwnHpT96uOeai8xKC4wZZwLIaMlPa0SjNixwEmOCZOVn6u+dEFkZIo4ROG6gJ0M2QdcoruqubJri5DzAR6LwjYz4yKUj30+VhYYnl3sZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DboK+5Qs; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DboK+5Qs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787267152; x=1818803152;
  h=date:from:to:cc:subject:message-id;
  bh=eQZMTjy6FUKbmk9xFfRfGioWP6pKsJE/F91/LSCrXHk=;
  b=DboK+5Qs0RrpO200IEpPp1AOzq8IviFBPVvw+a+w13q76YrjWynDIJFT
   RyjssAABcKvolVx9g3oHLW29gYUhydXbJDbDbHrqbMAI/i4xPz80jnq9C
   THY6DNlGX20HCSKqWKbmRRctVBAC1v3NQUega4J+7alCQYzM8c57YWlKx
   O3ZF/cRJUGZ6gn8DQaeV8KACkeC9WO8uXkk1YmDKiag/cSjcJ027U5GWj
   k8OFc4zxusCFNijEqjauMy9Yn8JxyEhQQi2bWb16qJiro7nsK1fEjVOXf
   SSdPURQ+ErKAvWNEQ7i0NDnikZDGNYrH446UVeVPQElpMHnPY2QBWzJGQ
   A==;
X-CSE-ConnectionGUID: rsJNoA+FSV+kPV1LUguWig==
X-CSE-MsgGUID: 1kbahvFkSzCE/DLu1PHTKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87832276"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="87832276"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 16:05:50 -0700
X-CSE-ConnectionGUID: aPeskrM6TdKJnXQf6eYkiw==
X-CSE-MsgGUID: SkSf91vcQCq4iMQoClJOaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="264866340"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 Aug 2026 16:05:48 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxBpR-00000000nzF-1wHq;
	Thu, 20 Aug 2026 23:05:45 +0000
Date: Fri, 21 Aug 2026 07:05:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 e1e6e541c5c9cf548e9fdc35fc26808c82074440
Message-ID: <202608210718.IkW1TpUt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: e1e6e541c5c9cf548e9fdc35fc26808c82074440  Merge tag 'thunderbolt-for-v7.3-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-next

elapsed time: 1552m

configs tested: 200
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                           randconfig-001    clang-24
arc                  randconfig-001-20260820    clang-24
arc                  randconfig-001-20260820    gcc-16.1.0
arc                  randconfig-001-20260821    gcc-10.5.0
arc                  randconfig-002-20260820    clang-24
arc                  randconfig-002-20260820    gcc-10.5.0
arc                  randconfig-002-20260821    gcc-10.5.0
arm                  randconfig-001-20260820    clang-24
arm                  randconfig-001-20260821    gcc-10.5.0
arm                  randconfig-002-20260820    clang-24
arm                  randconfig-002-20260821    gcc-10.5.0
arm                  randconfig-003-20260820    clang-24
arm                  randconfig-003-20260820    gcc-8.5.0
arm                  randconfig-003-20260821    gcc-10.5.0
arm                  randconfig-004-20260820    clang-24
arm                  randconfig-004-20260821    gcc-10.5.0
arm                          sunxi_defconfig    gcc-16.1.0
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260820    clang-24
arm64                randconfig-001-20260820    gcc-14.3.0
arm64                randconfig-001-20260821    gcc-8.5.0
arm64                randconfig-002-20260820    clang-24
arm64                randconfig-002-20260820    gcc-14.3.0
arm64                randconfig-002-20260821    gcc-8.5.0
arm64                randconfig-003-20260820    clang-24
arm64                randconfig-003-20260820    gcc-14.3.0
arm64                randconfig-003-20260821    gcc-8.5.0
arm64                randconfig-004-20260820    clang-24
arm64                randconfig-004-20260820    gcc-14.3.0
arm64                randconfig-004-20260821    gcc-8.5.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260820    clang-24
csky                 randconfig-001-20260820    gcc-14.3.0
csky                 randconfig-001-20260821    gcc-8.5.0
csky                 randconfig-002-20260820    clang-24
csky                 randconfig-002-20260820    gcc-14.3.0
csky                 randconfig-002-20260821    gcc-8.5.0
hexagon                       randconfig-001    clang-17
hexagon                       randconfig-001    gcc-14.3.0
hexagon              randconfig-001-20260820    clang-18
hexagon              randconfig-001-20260820    gcc-14.3.0
hexagon              randconfig-002-20260820    clang-19
hexagon              randconfig-002-20260820    gcc-14.3.0
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260820    gcc-14
i386       buildonly-randconfig-001-20260821    gcc-14
i386       buildonly-randconfig-002-20260820    clang-22
i386       buildonly-randconfig-002-20260820    gcc-14
i386       buildonly-randconfig-002-20260821    gcc-14
i386       buildonly-randconfig-003-20260820    gcc-14
i386       buildonly-randconfig-003-20260821    gcc-14
i386       buildonly-randconfig-004-20260820    clang-22
i386       buildonly-randconfig-004-20260820    gcc-14
i386       buildonly-randconfig-004-20260821    gcc-14
i386       buildonly-randconfig-005-20260820    gcc-14
i386       buildonly-randconfig-005-20260821    gcc-14
i386       buildonly-randconfig-006-20260820    gcc-13
i386       buildonly-randconfig-006-20260820    gcc-14
i386       buildonly-randconfig-006-20260821    gcc-14
i386                 randconfig-001-20260820    clang-22
i386                 randconfig-001-20260821    clang-22
i386                 randconfig-002-20260820    clang-22
i386                 randconfig-002-20260821    clang-22
i386                 randconfig-003-20260820    clang-22
i386                 randconfig-003-20260821    clang-22
i386                 randconfig-004-20260820    clang-22
i386                 randconfig-004-20260821    clang-22
i386                 randconfig-005-20260820    clang-22
i386                 randconfig-005-20260821    clang-22
i386                 randconfig-006-20260820    clang-22
i386                 randconfig-006-20260821    clang-22
i386                 randconfig-007-20260820    clang-22
i386                 randconfig-007-20260821    clang-22
i386                          randconfig-011    clang-22
i386                 randconfig-011-20260820    gcc-14
i386                 randconfig-012-20260820    gcc-14
i386                 randconfig-013-20260820    gcc-14
i386                 randconfig-014-20260820    gcc-14
i386                 randconfig-015-20260820    gcc-14
i386                 randconfig-016-20260820    gcc-14
i386                 randconfig-017-20260820    gcc-14
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260820    clang-18
loongarch            randconfig-001-20260820    gcc-14.3.0
loongarch            randconfig-002-20260820    gcc-14.3.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260820    gcc-11.5.0
nios2                randconfig-001-20260820    gcc-14.3.0
nios2                randconfig-002-20260820    gcc-11.5.0
nios2                randconfig-002-20260820    gcc-14.3.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260820    gcc-8.5.0
parisc               randconfig-001-20260821    gcc-12.5.0
parisc               randconfig-002-20260820    gcc-11.5.0
parisc               randconfig-002-20260820    gcc-8.5.0
parisc               randconfig-002-20260821    gcc-12.5.0
powerpc              randconfig-001-20260820    clang-24
powerpc              randconfig-001-20260820    gcc-8.5.0
powerpc              randconfig-001-20260821    gcc-12.5.0
powerpc              randconfig-002-20260820    gcc-8.5.0
powerpc              randconfig-002-20260821    gcc-12.5.0
powerpc                    sequoia_defconfig    clang-24
powerpc64            randconfig-001-20260820    clang-24
powerpc64            randconfig-001-20260820    gcc-8.5.0
powerpc64            randconfig-001-20260821    gcc-12.5.0
powerpc64            randconfig-002-20260820    gcc-10.5.0
powerpc64            randconfig-002-20260820    gcc-8.5.0
powerpc64            randconfig-002-20260821    gcc-12.5.0
riscv                randconfig-001-20260820    clang-24
riscv                randconfig-001-20260821    clang-24
riscv                randconfig-002-20260820    clang-24
riscv                randconfig-002-20260821    clang-24
s390                 randconfig-001-20260820    clang-24
s390                 randconfig-001-20260821    clang-24
s390                 randconfig-002-20260820    clang-24
s390                 randconfig-002-20260821    clang-24
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260820    clang-24
sh                   randconfig-001-20260821    clang-24
sh                   randconfig-002-20260820    clang-24
sh                   randconfig-002-20260821    clang-24
sparc                         randconfig-001    gcc-13.4.0
sparc                         randconfig-001    gcc-8.5.0
sparc                randconfig-001-20260820    gcc-13.4.0
sparc                randconfig-001-20260820    gcc-8.5.0
sparc                randconfig-001-20260821    gcc-8.5.0
sparc                randconfig-002-20260820    gcc-13.4.0
sparc                randconfig-002-20260820    gcc-16.1.0
sparc                randconfig-002-20260821    gcc-8.5.0
sparc                      sparc32_defconfig    gcc-16.1.0
sparc64              randconfig-001-20260820    gcc-11.5.0
sparc64              randconfig-001-20260820    gcc-13.4.0
sparc64              randconfig-001-20260821    gcc-8.5.0
sparc64              randconfig-002-20260820    gcc-13.4.0
sparc64              randconfig-002-20260820    gcc-9.5.0
sparc64              randconfig-002-20260821    gcc-8.5.0
um                   randconfig-001-20260820    gcc-13.4.0
um                   randconfig-001-20260820    gcc-14
um                   randconfig-001-20260821    gcc-8.5.0
um                   randconfig-002-20260820    gcc-13.4.0
um                   randconfig-002-20260820    gcc-14
um                   randconfig-002-20260821    gcc-8.5.0
x86_64     buildonly-randconfig-001-20260820    gcc-14
x86_64     buildonly-randconfig-002-20260820    gcc-14
x86_64     buildonly-randconfig-003-20260820    clang-22
x86_64     buildonly-randconfig-003-20260820    gcc-14
x86_64     buildonly-randconfig-004-20260820    clang-22
x86_64     buildonly-randconfig-004-20260820    gcc-14
x86_64     buildonly-randconfig-005-20260820    clang-22
x86_64     buildonly-randconfig-005-20260820    gcc-14
x86_64     buildonly-randconfig-006-20260820    clang-22
x86_64     buildonly-randconfig-006-20260820    gcc-14
x86_64                                 kexec    clang-22
x86_64                        randconfig-001    gcc-14
x86_64               randconfig-001-20260820    clang-22
x86_64               randconfig-001-20260820    gcc-14
x86_64               randconfig-002-20260820    clang-22
x86_64               randconfig-002-20260820    gcc-14
x86_64               randconfig-003-20260820    clang-22
x86_64               randconfig-003-20260820    gcc-14
x86_64               randconfig-004-20260820    clang-22
x86_64               randconfig-004-20260820    gcc-14
x86_64               randconfig-005-20260820    clang-22
x86_64               randconfig-005-20260820    gcc-14
x86_64               randconfig-006-20260820    clang-22
x86_64               randconfig-006-20260820    gcc-14
x86_64               randconfig-011-20260820    clang-22
x86_64               randconfig-011-20260821    gcc-14
x86_64               randconfig-012-20260820    clang-22
x86_64               randconfig-012-20260821    gcc-14
x86_64               randconfig-013-20260820    clang-22
x86_64               randconfig-013-20260820    gcc-13
x86_64               randconfig-013-20260821    gcc-14
x86_64               randconfig-014-20260820    clang-22
x86_64               randconfig-014-20260821    gcc-14
x86_64               randconfig-015-20260820    clang-22
x86_64               randconfig-015-20260820    gcc-14
x86_64               randconfig-015-20260821    gcc-14
x86_64               randconfig-016-20260820    clang-22
x86_64               randconfig-016-20260821    gcc-14
x86_64               randconfig-071-20260820    clang-22
x86_64               randconfig-072-20260820    clang-22
x86_64               randconfig-073-20260820    clang-22
x86_64               randconfig-074-20260820    clang-22
x86_64               randconfig-075-20260820    clang-22
x86_64               randconfig-076-20260820    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260820    gcc-13.4.0
xtensa               randconfig-001-20260820    gcc-8.5.0
xtensa               randconfig-001-20260821    gcc-8.5.0
xtensa               randconfig-002-20260820    gcc-13.4.0
xtensa               randconfig-002-20260821    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
