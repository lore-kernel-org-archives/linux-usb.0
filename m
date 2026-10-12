Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56284A6CFD
	for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 15:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820264; cv=none; b=fS73MwSfWjL4BErdCUWVDdr1P3KL7/bsb4Ya6lMaZicN5ZjKtRHQhIJTSwvnuZYIxPMjILw/i7WLqOUJbHWAEabmqiPn2RFHj318/z0VJhax38P8QbcTA3lvsvoK510Rk/oohc91Lt1hlUjIRbIHQbWw1b4ZbdhOof66F3oRlA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820264; c=relaxed/simple;
	bh=qFcMDq0lIxZfCm5fjo1pHcxXotzlqJR0LHPDRrE9s98=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C3rKNB1dVSe5HQyDdC8MBX8SrjzmOgDACCVL3Oxtkx44lfvdoRBtnEgEEzJjezk8jUOD57eEPJMKPFlHcUGYUdnFHACEEIboccYu2XaZNE9mHXfT6Oa0EC76QazswjmVBadFJJ5oRY/N18gewow0YmyTVWAqaFe1er9UhvsJE6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=metz4ycE; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="metz4ycE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791820263; x=1823356263;
  h=date:from:to:cc:subject:message-id;
  bh=qFcMDq0lIxZfCm5fjo1pHcxXotzlqJR0LHPDRrE9s98=;
  b=metz4ycErl6r1L+yIbfbxOh3/u+dapyRNnO1h5pdv2wkMEtEftgBN0fv
   gzJ8gxfUmqqh9nsSQtvBUHPylRuG83MTxaYArV4w9RiaP6i9BFmg4HX1o
   Ifemq+O26zx7GxWtBDzVq69HEE1IBgLWelA6/Gptwl0S8Exvi0SndjQKv
   ZJ43J4XZ9r7qRaJx0KYWHAgUAqZWnTJqMBDdrCZUI2wN12S29lli+gV/r
   DgVPmHIHC53nTTRwhKj97S6jFFDF+MamLYYURNeazotZSLBHp7REIV8tS
   Za/XewqbthOWgRGVbw0gO4dBLziuAwVjetrvbJda6kHqN5LBoVVQVen42
   A==;
X-CSE-ConnectionGUID: b/5G2gZcSzqS/VgT/J6pBg==
X-CSE-MsgGUID: gdKP85khRLSj2h8Pz9gNUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="411306"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="411306"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 08:51:02 -0700
X-CSE-ConnectionGUID: veeMWWhNRHGl5UpEiJ0TUQ==
X-CSE-MsgGUID: loVjfDkcRkWJMeVWhoW4AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="863912"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Oct 2026 08:51:01 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGIIl-00000000BjX-0Wny;
	Mon, 12 Oct 2026 15:50:59 +0000
Date: Mon, 12 Oct 2026 23:50:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 bbf6b99a57b2479bf51c3c8ad0946f4b8c33ed69
Message-ID: <202610122303.QIsCO0FG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: bbf6b99a57b2479bf51c3c8ad0946f4b8c33ed69  usb: typec: ucsi_ccg: Add retry mechanism in ccg_read

elapsed time: 1156m

configs tested: 280
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2304-20261011    gcc-14.3.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261012    gcc-8.5.0
arc                   randconfig-1001-20261012    gcc-8.5.0
arc                   randconfig-2000-20261011    gcc-8.5.0
arc                   randconfig-2001-20261011    gcc-8.5.0
arc                  randconfig-r2103-20261011    gcc-8.5.0  cocci
arc                  randconfig-r2109-20261011    gcc-16.1.0 cocci
arc                  randconfig-r2311-20261011    clang-24   sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                   randconfig-1000-20261012    gcc-8.5.0
arm                   randconfig-1001-20261012    gcc-8.5.0
arm                   randconfig-1002-20261012    gcc-8.5.0
arm                   randconfig-1003-20261012    gcc-8.5.0
arm                   randconfig-2000-20261011    gcc-8.5.0
arm                   randconfig-2001-20261011    gcc-8.5.0
arm                  randconfig-r2201-20261011    gcc-13.4.0 smatch
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261012    clang-24
arm64                 randconfig-1001-20261012    clang-24
arm64                 randconfig-1002-20261012    clang-24
arm64                 randconfig-1003-20261012    clang-24
arm64                 randconfig-2000-20261011    gcc-16.1.0
arm64                 randconfig-2001-20261011    gcc-16.1.0
arm64                randconfig-r2100-20261011    gcc-16.1.0 cocci
arm64                randconfig-r2106-20261011    clang-22   cocci
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261012    clang-24
csky                  randconfig-1001-20261012    clang-24
csky                  randconfig-2000-20261011    gcc-16.1.0
csky                  randconfig-2001-20261011    gcc-16.1.0
csky                 randconfig-r2108-20261011    gcc-8.5.0  cocci
csky                 randconfig-r2202-20261011    gcc-9.5.0  smatch
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261012    clang-17
hexagon               randconfig-1001-20261012    clang-17
hexagon               randconfig-2000-20261011    gcc-16.1.0
hexagon               randconfig-2001-20261011    gcc-16.1.0
hexagon              randconfig-r2104-20261011    clang-24   cocci
hexagon              randconfig-r2308-20261011    clang-24   sparse
hexagon              randconfig-r2309-20261011    clang-24   sparse
hexagon              randconfig-r2310-20261011    clang-24   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261012    clang-22
i386        buildonly-randconfig-1001-20261012    clang-22
i386        buildonly-randconfig-1002-20261012    clang-22
i386        buildonly-randconfig-1003-20261012    clang-22
i386        buildonly-randconfig-1004-20261012    clang-22
i386        buildonly-randconfig-1005-20261012    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261012    gcc-14
i386                  randconfig-1001-20261012    gcc-14
i386                  randconfig-1002-20261012    gcc-14
i386                  randconfig-1003-20261012    gcc-14
i386                  randconfig-1004-20261012    gcc-14
i386                  randconfig-1005-20261012    gcc-14
i386                  randconfig-1006-20261012    gcc-14
i386                  randconfig-1007-20261012    clang-22
i386                  randconfig-1008-20261012    clang-22
i386                  randconfig-1009-20261012    clang-22
i386                  randconfig-1010-20261012    clang-22
i386                  randconfig-1011-20261012    clang-22
i386                  randconfig-1012-20261012    clang-22
i386                  randconfig-1013-20261012    clang-22
i386                  randconfig-2000-20261011    gcc-8.5.0
i386                  randconfig-2001-20261011    gcc-8.5.0
i386                  randconfig-2100-20261011    gcc-14     cocci
i386                  randconfig-2101-20261011    gcc-14     cocci
i386                  randconfig-2102-20261011    gcc-14     cocci
i386                  randconfig-2103-20261011    gcc-14     cocci
i386                  randconfig-2104-20261011    gcc-14     cocci
i386                  randconfig-2105-20261011    gcc-14     cocci
i386                  randconfig-2200-20261011    clang-22   smatch
i386                 randconfig-r2200-20261011    clang-22   smatch
i386                 randconfig-r2302-20261011    gcc-14.3.0 sparse
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261012    clang-17
loongarch             randconfig-1001-20261012    clang-17
loongarch             randconfig-2000-20261011    gcc-8.5.0
loongarch             randconfig-2001-20261011    gcc-8.5.0
loongarch            randconfig-r2308-20261011    clang-24   sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5329evb_defconfig    gcc-16.1.0
m68k                 randconfig-r2310-20261011    clang-24   sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2100-20261011    gcc-13.4.0 cocci
microblaze           randconfig-r2105-20261011    gcc-15.2.0 cocci
microblaze           randconfig-r2306-20261011    clang-24   sparse
microblaze           randconfig-r2309-20261011    clang-24   sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                            ip27_defconfig    gcc-16.1.0
mips                 randconfig-r2103-20261011    gcc-16.1.0 cocci
mips                 randconfig-r2106-20261011    clang-24   cocci
nios2                          10m50_defconfig    gcc-16.1.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261012    clang-17
nios2                 randconfig-1001-20261012    clang-17
nios2                 randconfig-2000-20261011    gcc-8.5.0
nios2                 randconfig-2001-20261011    gcc-8.5.0
nios2                randconfig-r2202-20261011    gcc-8.5.0  smatch
nios2                randconfig-r2307-20261011    clang-24   sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2104-20261011    clang-22   cocci
openrisc             randconfig-r2305-20261011    gcc-14.3.0 sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261012    gcc-8.5.0
parisc                randconfig-1001-20261012    gcc-8.5.0
parisc                randconfig-2000-20261011    gcc-8.5.0
parisc                randconfig-2001-20261011    gcc-8.5.0
parisc               randconfig-r2100-20261011    gcc-8.5.0  cocci
parisc               randconfig-r2201-20261011    gcc-11.5.0 smatch
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                    motionpro_defconfig    gcc-16.1.0
powerpc                  mpc837x_rdb_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261012    gcc-8.5.0
powerpc               randconfig-1001-20261012    gcc-8.5.0
powerpc               randconfig-2000-20261011    clang-22
powerpc               randconfig-2001-20261011    clang-22
powerpc              randconfig-r2101-20261011    gcc-8.5.0  cocci
powerpc              randconfig-r2306-20261011    clang-24   sparse
powerpc              randconfig-r2311-20261011    clang-24   sparse
powerpc64             randconfig-1000-20261012    gcc-8.5.0
powerpc64             randconfig-1001-20261012    gcc-8.5.0
powerpc64             randconfig-2000-20261011    clang-22
powerpc64             randconfig-2001-20261011    clang-22
powerpc64            randconfig-r2101-20261011    clang-24   cocci
powerpc64            randconfig-r2101-20261011    gcc-16.1.0 cocci
powerpc64            randconfig-r2110-20261011    clang-22   cocci
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261012    clang-24
riscv                 randconfig-1001-20261012    clang-24
riscv                 randconfig-2000-20261011    gcc-13.4.0
riscv                 randconfig-2001-20261011    gcc-13.4.0
riscv                randconfig-r2110-20261011    gcc-8.5.0  cocci
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261012    clang-24
s390                  randconfig-1001-20261012    clang-24
s390                  randconfig-2000-20261011    gcc-13.4.0
s390                  randconfig-2001-20261011    gcc-13.4.0
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261012    clang-24
sh                    randconfig-1001-20261012    clang-24
sh                    randconfig-2000-20261011    gcc-13.4.0
sh                    randconfig-2001-20261011    gcc-13.4.0
sh                   randconfig-r2108-20261011    gcc-16.1.0 cocci
sh                           rsk7203_defconfig    gcc-16.1.0
sparc                             alldefconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261012    clang-20
sparc                 randconfig-1001-20261012    clang-20
sparc                 randconfig-2000-20261011    gcc-8.5.0
sparc                 randconfig-2001-20261011    gcc-8.5.0
sparc                randconfig-r2107-20261011    gcc-8.5.0  cocci
sparc                randconfig-r2111-20261011    gcc-8.5.0  cocci
sparc                randconfig-r2200-20261011    gcc-8.5.0  smatch
sparc                randconfig-r2201-20261011    gcc-14.3.0 smatch
sparc                randconfig-r2307-20261011    clang-24   sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261012    clang-20
sparc64               randconfig-1001-20261012    clang-20
sparc64               randconfig-2000-20261011    gcc-8.5.0
sparc64               randconfig-2001-20261011    gcc-8.5.0
sparc64              randconfig-r2111-20261011    clang-22   cocci
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261012    clang-20
um                    randconfig-1001-20261012    clang-20
um                    randconfig-2000-20261011    gcc-8.5.0
um                    randconfig-2001-20261011    gcc-8.5.0
um                   randconfig-r2102-20261011    gcc-16.1.0 cocci
um                   randconfig-r2301-20261011    gcc-14.3.0 sparse
um                   randconfig-r2303-20261011    gcc-14.3.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261012    clang-22
x86_64      buildonly-randconfig-1001-20261012    clang-22
x86_64      buildonly-randconfig-1002-20261012    clang-22
x86_64      buildonly-randconfig-1003-20261012    clang-22
x86_64      buildonly-randconfig-1004-20261012    clang-22
x86_64      buildonly-randconfig-1005-20261012    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261012    clang-22
x86_64                randconfig-1001-20261012    clang-22
x86_64                randconfig-1002-20261012    clang-22
x86_64                randconfig-1003-20261012    clang-22
x86_64                randconfig-1004-20261012    clang-22
x86_64                randconfig-1005-20261012    clang-22
x86_64                randconfig-1006-20261012    clang-22
x86_64                randconfig-1007-20261012    clang-22
x86_64                randconfig-1008-20261012    clang-22
x86_64                randconfig-1009-20261012    clang-22
x86_64                randconfig-1010-20261012    clang-22
x86_64                randconfig-1011-20261012    clang-22
x86_64                randconfig-1012-20261012    gcc-14
x86_64                randconfig-1013-20261012    gcc-14
x86_64                randconfig-1014-20261012    gcc-14
x86_64                randconfig-1015-20261012    gcc-14
x86_64                randconfig-1016-20261012    gcc-14
x86_64                randconfig-1017-20261012    gcc-14
x86_64                randconfig-2000-20261011    clang-22
x86_64                randconfig-2001-20261011    clang-22
x86_64                randconfig-2100-20261011    gcc-14     cocci
x86_64                randconfig-2101-20261011    gcc-14     cocci
x86_64                randconfig-2102-20261011    gcc-14     cocci
x86_64                randconfig-2103-20261011    gcc-14     cocci
x86_64                randconfig-2104-20261011    gcc-14     cocci
x86_64                randconfig-2105-20261011    gcc-14     cocci
x86_64                randconfig-2200-20261011    clang-22   smatch
x86_64               randconfig-r2102-20261011    clang-22   cocci
x86_64               randconfig-r2107-20261011    clang-22   cocci
x86_64               randconfig-r2109-20261011    clang-22   cocci
x86_64               randconfig-r2109-20261011    gcc-8.5.0  cocci
x86_64               randconfig-r2300-20261011    gcc-14.3.0 sparse
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    clang-22
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261012    clang-20
xtensa                randconfig-1001-20261012    clang-20
xtensa                randconfig-2000-20261011    gcc-8.5.0
xtensa                randconfig-2001-20261011    gcc-8.5.0
xtensa               randconfig-r2102-20261011    gcc-8.5.0  cocci
xtensa               randconfig-r2103-20261011    gcc-8.5.0  cocci
xtensa               randconfig-r2105-20261011    clang-22   cocci

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
