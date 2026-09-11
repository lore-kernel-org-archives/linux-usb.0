Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D15382F03
	for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 18:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789152352; cv=none; b=axlsrWP50z5DPAyKh0SMoBCREBR15On8P4gPpX27xfnstwU+3qTfgiUk12+31u2yJOYiOStG3k0scERvpP+T6/KvUb4qDY06EZ1ML91NdJoAMj3LiEoBjIKNlwa10uKjQg22rzqyiUE0n1h5NvR9G188Bi9Xl8TPFcrkgW9QiLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789152352; c=relaxed/simple;
	bh=KZBgDGRxGD+j6ftPqKXcyk3g8eUzSym0VpRFCg4HP20=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gD7SB1mva9AhB6jKhiVPEYbeFElByNEqvHn8OjBNTQI8JJJZzcq4nMVKvRl1KKiMjHDB5sb4vr4tE6k3kf7hgc/zooBTt9aRdrE6yxB0tITJJf8snwnjrtmTRha2/M1ajQcTx0Gt9XAwzSz0TCRiDsXwvJk50XXHGoT8p9+SNJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IO3NaHV1; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IO3NaHV1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789152351; x=1820688351;
  h=date:from:to:cc:subject:message-id;
  bh=KZBgDGRxGD+j6ftPqKXcyk3g8eUzSym0VpRFCg4HP20=;
  b=IO3NaHV1GvGvrAnGoVgUdUVVPlYwacg+BjY2Lc10gbrs1XnuM1clAnBH
   h9z6FpERdAt++zPkaTz/f5gpnEcUgVklkF/jstdCU33oiS62bFv3Acs6/
   R16kDyCBhywqWmGdQdQeefM3Ss/+yZo0ii1iHuIQz1/UnJ6auZTxv5d42
   a7qCpqXasoep3ICwci/SnxWLr6iCBp3PqgD0nxBI/QCqSAhte2sDUuk9g
   ArUVuMt9MD1B+c0Z/UVuofMeu4wAHpf+bDjwj9KcfBBIPK4Jt4S9LMFsY
   H96DjYbhxctXvZYjA7s8c1ZZ+kYElFGDyEfcnUJeedNcG7it79mUIpXfE
   A==;
X-CSE-ConnectionGUID: ++1W+gpUTwe8ZProJUcOeQ==
X-CSE-MsgGUID: 2dzMqmrQR2GntOmQwHRkaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="89496964"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="89496964"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 11:45:48 -0700
X-CSE-ConnectionGUID: mggYe8oZR1K/7t4edSsmQQ==
X-CSE-MsgGUID: SVPrr4wITaqBqdTkxi3wfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="270614276"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 11 Sep 2026 11:45:47 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x56Ff-000000001xL-1ybY;
	Fri, 11 Sep 2026 18:45:34 +0000
Date: Sat, 12 Sep 2026 02:40:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 ed2050bc671b44b2c948dbd4347cc534d44ccc9f
Message-ID: <202609120214.A0vnqXsL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: ed2050bc671b44b2c948dbd4347cc534d44ccc9f  USB: Improve "New device found" printout message

elapsed time: 1550m

configs tested: 180
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-24
arc                               allnoconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260911    clang-24
arc                   randconfig-002-20260911    clang-24
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-24
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260911    clang-24
arm                   randconfig-002-20260911    clang-24
arm                   randconfig-003-20260911    clang-24
arm                   randconfig-004-20260911    clang-24
arm                           sama5_defconfig    gcc-16.1.0
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260911    gcc-16.1.0
arm64                 randconfig-002-20260911    gcc-16.1.0
arm64                 randconfig-003-20260911    gcc-16.1.0
arm64                 randconfig-004-20260911    gcc-16.1.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260911    gcc-16.1.0
csky                  randconfig-002-20260911    gcc-16.1.0
hexagon                           allnoconfig    clang-24
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260911    gcc-12.5.0
hexagon               randconfig-001-20260912    clang-24
hexagon               randconfig-002-20260911    gcc-12.5.0
hexagon               randconfig-002-20260912    clang-24
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260911    clang-22
i386        buildonly-randconfig-002-20260911    clang-22
i386        buildonly-randconfig-003-20260911    clang-22
i386        buildonly-randconfig-004-20260911    clang-22
i386        buildonly-randconfig-005-20260911    clang-22
i386        buildonly-randconfig-006-20260911    clang-22
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260911    clang-22
i386                  randconfig-002-20260911    clang-22
i386                  randconfig-003-20260911    clang-22
i386                  randconfig-004-20260911    clang-22
i386                  randconfig-005-20260911    clang-22
i386                  randconfig-006-20260911    clang-22
i386                  randconfig-007-20260911    clang-22
i386                  randconfig-011-20260911    clang-22
i386                  randconfig-012-20260911    clang-22
i386                  randconfig-013-20260911    clang-22
i386                  randconfig-014-20260911    clang-22
i386                  randconfig-015-20260911    clang-22
i386                  randconfig-016-20260911    clang-22
i386                  randconfig-017-20260911    clang-22
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-24
loongarch             randconfig-001-20260911    gcc-12.5.0
loongarch             randconfig-001-20260912    clang-24
loongarch             randconfig-002-20260911    gcc-12.5.0
loongarch             randconfig-002-20260912    clang-24
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-24
m68k                                defconfig    clang-24
m68k                       m5249evb_defconfig    gcc-16.1.0
m68k                       m5275evb_defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-24
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-24
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-24
nios2                 randconfig-001-20260911    gcc-12.5.0
nios2                 randconfig-001-20260912    clang-24
nios2                 randconfig-002-20260911    gcc-12.5.0
nios2                 randconfig-002-20260912    clang-24
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-24
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                            allnoconfig    clang-24
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260911    gcc-8.5.0
parisc                randconfig-002-20260911    gcc-8.5.0
parisc64                            defconfig    clang-24
powerpc                           allnoconfig    clang-24
powerpc                           allnoconfig    gcc-16.1.0
powerpc               randconfig-001-20260911    gcc-8.5.0
powerpc               randconfig-002-20260911    gcc-8.5.0
powerpc64             randconfig-001-20260911    gcc-8.5.0
powerpc64             randconfig-002-20260911    gcc-8.5.0
riscv                             allnoconfig    clang-24
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-24
riscv                               defconfig    gcc-16.1.0
riscv                    nommu_k210_defconfig    gcc-16.1.0
riscv                 randconfig-001-20260911    gcc-16.1.0
riscv                 randconfig-002-20260911    gcc-16.1.0
s390                              allnoconfig    clang-24
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260911    gcc-16.1.0
s390                  randconfig-002-20260911    gcc-16.1.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-24
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    gcc-16.1.0
sh                        apsh4ad0a_defconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260911    gcc-16.1.0
sh                    randconfig-002-20260911    gcc-16.1.0
sh                           se7619_defconfig    gcc-16.1.0
sh                   sh7770_generic_defconfig    gcc-16.1.0
sparc                             allnoconfig    clang-24
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260911    gcc-13.4.0
sparc                 randconfig-002-20260911    gcc-13.4.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260911    gcc-13.4.0
sparc64               randconfig-002-20260911    gcc-13.4.0
um                                allnoconfig    clang-17
um                                allnoconfig    clang-24
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260911    gcc-13.4.0
um                    randconfig-002-20260911    gcc-13.4.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-24
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260911    gcc-14
x86_64      buildonly-randconfig-002-20260911    gcc-14
x86_64      buildonly-randconfig-003-20260911    gcc-14
x86_64      buildonly-randconfig-004-20260911    gcc-14
x86_64      buildonly-randconfig-005-20260911    gcc-14
x86_64      buildonly-randconfig-006-20260911    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260911    clang-22
x86_64                randconfig-002-20260911    clang-22
x86_64                randconfig-003-20260911    clang-22
x86_64                randconfig-004-20260911    clang-22
x86_64                randconfig-005-20260911    clang-22
x86_64                randconfig-006-20260911    clang-22
x86_64                randconfig-011-20260911    gcc-14
x86_64                randconfig-012-20260911    gcc-14
x86_64                randconfig-013-20260911    gcc-14
x86_64                randconfig-014-20260911    gcc-14
x86_64                randconfig-015-20260911    gcc-14
x86_64                randconfig-016-20260911    gcc-14
x86_64                randconfig-071-20260911    gcc-14
x86_64                randconfig-072-20260911    gcc-14
x86_64                randconfig-073-20260911    gcc-14
x86_64                randconfig-074-20260911    gcc-14
x86_64                randconfig-075-20260911    gcc-14
x86_64                randconfig-076-20260911    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-24
xtensa                            allnoconfig    gcc-16.1.0
xtensa                           allyesconfig    clang-20
xtensa                generic_kc705_defconfig    gcc-16.1.0
xtensa                randconfig-001-20260911    gcc-13.4.0
xtensa                randconfig-002-20260911    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
