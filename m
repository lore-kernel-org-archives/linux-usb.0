Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4357A175A6B
	for <linux-usb@vger.kernel.org>; Sun,  4 Oct 2026 04:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791088253; cv=none; b=d3itV1x74mXyf6a/8ogCeiOPDSO4qDkq9DMIZbmbj7jkQzr30EN8I9aEQyHKysc7K6/+Q72qGNgWb76DCE2v8sy+lfmESmbpfEgFCmvqXdfAv7E3LQYSq3Ws7PlTdVYxnEjz6Hy9ReN8pVzTieSgHLuZ9mBECZPs2w9S2VxHMcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791088253; c=relaxed/simple;
	bh=eLpSFlXf+LhEsV0T8x3zpYuh1PLn/Sel1lY9Og0CLxA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RAPmKwQ6+TWxKA9kM9t8rEoYaPwowc1wwHq0IwwW6ztPGU83DVpobPgrFcwdN5/Das5gkvUgjyB9LzeQjtmhiUi/IswF0pBC250c+PI36FjH0SiB3ouoPN2MNY5fTg9Pvl0uA5HadhFxXjfB0vKf4gJEBrF/OXEh7m7iNWPKVi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DHkc23cg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DHkc23cg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791088251; x=1822624251;
  h=date:from:to:cc:subject:message-id;
  bh=eLpSFlXf+LhEsV0T8x3zpYuh1PLn/Sel1lY9Og0CLxA=;
  b=DHkc23cgbEv3e+gpyH3NuPxXHsoTH0a+WiKsHT5dY9WGbHYWlvE/GMow
   Qf5vgUKz+cuVvpe+VmgQ8c/r0lmOCiE+zLjgT5iqDlQzUDo+dAeZahtqW
   xOVfyhZ4QRFPLRF/Z1APXUp1X5Y4TGQiWQVi3DodX8ur0fXs1Yc2f7iFz
   hyn2cZzvm/nZLNwx+nObqoDh23R6XQe6cG4DMuaJwW1NToHTqjCSRtCdd
   s7+sR550IbKgrBUT68jcGec7GECKTHu/n1470a4kTu6t5Ivji7s80juN8
   OROfSmBcoqjNwkoidxbuyxf6GlgP7b87Sl9ziBHVU2swVaVKO0CHKOcU7
   A==;
X-CSE-ConnectionGUID: 3uAdJsjDRQ+o1IiwCNqqxg==
X-CSE-MsgGUID: iVzkNJ1MRZmERNuYPZvr1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="94507074"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="94507074"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 21:30:48 -0700
X-CSE-ConnectionGUID: 9aVrQqdwR/OZuFFxIY6t0w==
X-CSE-MsgGUID: rMoQxal2Q36U/QUUAdWF/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="628949"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 03 Oct 2026 21:30:47 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDDs4-00000000USZ-2Uj3;
	Sun, 04 Oct 2026 04:30:44 +0000
Date: Sun, 04 Oct 2026 12:30:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 639df5d23876a548b86fe6526bed8b97edf64d96
Message-ID: <202610041238.4OJHVJZo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: 639df5d23876a548b86fe6526bed8b97edf64d96  dt-bindings: usb: qcom,snps-dwc3: Document the Nord DWC3 controller

elapsed time: 1374m

configs tested: 474
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2102-20261002    gcc-8.5.0  cocci
alpha                randconfig-r2200-20261003    gcc-8.5.0  smatch
alpha                randconfig-r2307-20261002    clang-24   sparse
arc                               alldefconfig    clang-24
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                  nsimosci_hs_smp_defconfig    gcc-16.1.0
arc                   randconfig-1000-20261003    clang-17
arc                   randconfig-1000-20261004    clang-22
arc                   randconfig-1001-20261003    clang-17
arc                   randconfig-1001-20261004    clang-22
arc                  randconfig-r2103-20261003    gcc-11.5.0 cocci
arc                  randconfig-r2107-20261002    gcc-14.3.0 cocci
arc                  randconfig-r2301-20261003    gcc-14     sparse
arc                  randconfig-r2305-20261002    gcc-8.5.0  sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                           collie_defconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                           ixp4xx_defconfig    clang-24
arm                       jornada720_defconfig    clang-24
arm                          nhk8815_defconfig    clang-24
arm                              pxa_defconfig    clang-24
arm                   randconfig-1000-20261003    clang-17
arm                   randconfig-1000-20261004    clang-22
arm                   randconfig-1001-20261003    clang-17
arm                   randconfig-1001-20261004    clang-22
arm                   randconfig-1002-20261003    clang-17
arm                   randconfig-1002-20261004    clang-22
arm                   randconfig-1003-20261003    clang-17
arm                   randconfig-1003-20261004    clang-22
arm                  randconfig-r2104-20261003    gcc-15.2.0 cocci
arm                  randconfig-r2309-20261003    gcc-8.5.0  sparse
arm                          socfpga_defconfig    clang-24
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261003    gcc-9.5.0
arm64                 randconfig-1000-20261004    gcc-16.1.0
arm64                 randconfig-1001-20261003    gcc-9.5.0
arm64                 randconfig-1001-20261004    gcc-16.1.0
arm64                 randconfig-1002-20261003    gcc-9.5.0
arm64                 randconfig-1002-20261004    gcc-16.1.0
arm64                 randconfig-1003-20261003    gcc-9.5.0
arm64                 randconfig-1003-20261004    gcc-16.1.0
arm64                randconfig-r2100-20261003    gcc-9.5.0  cocci
arm64                randconfig-r2101-20261002    clang-21   cocci
arm64                randconfig-r2104-20261003    gcc-11.5.0 cocci
arm64                randconfig-r2105-20261002    clang-24   cocci
arm64                randconfig-r2105-20261002    gcc-14.3.0 cocci
arm64                randconfig-r2107-20261002    clang-22   cocci
arm64                randconfig-r2200-20261003    gcc-16.1.0 smatch
arm64                randconfig-r2202-20261003    clang-24   smatch
arm64                randconfig-r2300-20261003    gcc-9.5.0  sparse
arm64                randconfig-r2303-20261002    gcc-16.1.0 sparse
arm64                randconfig-r2304-20261002    gcc-10.5.0 sparse
arm64                randconfig-r2305-20261002    gcc-10.5.0 sparse
arm64                randconfig-r2307-20261002    clang-24   sparse
arm64                randconfig-r2307-20261003    gcc-8.5.0  sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261003    gcc-9.5.0
csky                  randconfig-1000-20261004    gcc-16.1.0
csky                  randconfig-1001-20261003    gcc-9.5.0
csky                  randconfig-1001-20261004    gcc-16.1.0
csky                 randconfig-r2106-20261003    gcc-15.2.0 cocci
csky                 randconfig-r2201-20261003    gcc-16.1.0 smatch
csky                 randconfig-r2300-20261002    clang-22   sparse
csky                 randconfig-r2300-20261003    gcc-14     sparse
csky                 randconfig-r2301-20261003    gcc-16.1.0 sparse
csky                 randconfig-r2307-20261003    gcc-11.5.0 sparse
csky                 randconfig-r2309-20261002    clang-24   sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261003    gcc-16.1.0
hexagon               randconfig-1000-20261004    gcc-16.1.0
hexagon               randconfig-1001-20261003    gcc-16.1.0
hexagon               randconfig-1001-20261004    gcc-16.1.0
hexagon              randconfig-r2100-20261003    gcc-11.5.0 cocci
hexagon              randconfig-r2104-20261002    clang-24   cocci
hexagon              randconfig-r2104-20261002    gcc-14.3.0 cocci
hexagon              randconfig-r2105-20261003    clang-19   cocci
hexagon              randconfig-r2304-20261002    clang-24   sparse
hexagon              randconfig-r2304-20261003    gcc-14     sparse
hexagon              randconfig-r2308-20261002    clang-24   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261003    gcc-14
i386        buildonly-randconfig-1000-20261004    clang-22
i386        buildonly-randconfig-1001-20261003    gcc-14
i386        buildonly-randconfig-1001-20261004    clang-22
i386        buildonly-randconfig-1002-20261003    gcc-14
i386        buildonly-randconfig-1002-20261004    clang-22
i386        buildonly-randconfig-1003-20261003    gcc-14
i386        buildonly-randconfig-1003-20261004    clang-22
i386        buildonly-randconfig-1004-20261003    gcc-14
i386        buildonly-randconfig-1004-20261004    clang-22
i386        buildonly-randconfig-1005-20261003    gcc-14
i386        buildonly-randconfig-1005-20261004    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261003    gcc-14
i386                  randconfig-1000-20261004    gcc-14
i386                  randconfig-1001-20261003    gcc-14
i386                  randconfig-1001-20261004    gcc-14
i386                  randconfig-1002-20261003    gcc-14
i386                  randconfig-1002-20261004    gcc-14
i386                  randconfig-1003-20261003    gcc-14
i386                  randconfig-1003-20261004    gcc-14
i386                  randconfig-1004-20261003    gcc-14
i386                  randconfig-1004-20261004    gcc-14
i386                  randconfig-1005-20261003    gcc-14
i386                  randconfig-1005-20261004    gcc-14
i386                  randconfig-1006-20261003    gcc-14
i386                  randconfig-1006-20261004    gcc-14
i386                  randconfig-1007-20261003    gcc-14
i386                  randconfig-1008-20261003    gcc-14
i386                  randconfig-1009-20261003    gcc-14
i386                  randconfig-1010-20261003    gcc-14
i386                  randconfig-1011-20261003    gcc-14
i386                  randconfig-1012-20261003    gcc-14
i386                  randconfig-1013-20261003    gcc-14
i386                  randconfig-2100-20261002    gcc-14     cocci
i386                  randconfig-2100-20261003    gcc-14     cocci
i386                  randconfig-2101-20261002    gcc-14     cocci
i386                  randconfig-2101-20261003    clang-22   cocci
i386                  randconfig-2101-20261003    gcc-14     cocci
i386                  randconfig-2102-20261002    gcc-14     cocci
i386                  randconfig-2102-20261003    gcc-14     cocci
i386                  randconfig-2103-20261002    gcc-14     cocci
i386                  randconfig-2103-20261003    clang-22   cocci
i386                  randconfig-2103-20261003    gcc-14     cocci
i386                  randconfig-2200-20261002    gcc-14     smatch
i386                  randconfig-2200-20261003    gcc-14     smatch
i386                  randconfig-2300-20261002    gcc-12     sparse
i386                  randconfig-2300-20261003    clang-22   sparse
i386                  randconfig-2301-20261002    gcc-12     sparse
i386                  randconfig-2301-20261003    clang-22   sparse
i386                  randconfig-2301-20261003    gcc-14     sparse
i386                  randconfig-2302-20261002    gcc-12     sparse
i386                  randconfig-2302-20261003    clang-22   sparse
i386                  randconfig-2302-20261003    gcc-14     sparse
i386                 randconfig-r2103-20261003    gcc-13.4.0 cocci
i386                 randconfig-r2106-20261002    clang-24   cocci
i386                 randconfig-r2107-20261003    clang-21   cocci
i386                 randconfig-r2301-20261002    gcc-10.5.0 sparse
i386                 randconfig-r2306-20261003    gcc-14     sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261003    gcc-16.1.0
loongarch             randconfig-1000-20261004    gcc-16.1.0
loongarch             randconfig-1001-20261003    gcc-16.1.0
loongarch             randconfig-1001-20261004    gcc-16.1.0
loongarch            randconfig-r2102-20261003    gcc-13.4.0 cocci
loongarch            randconfig-r2102-20261003    gcc-16.1.0 cocci
loongarch            randconfig-r2201-20261002    gcc-16.1.0 smatch
loongarch            randconfig-r2201-20261003    gcc-16.1.0 smatch
loongarch            randconfig-r2307-20261003    clang-24   sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                 randconfig-r2101-20261003    gcc-12.5.0 cocci
m68k                 randconfig-r2103-20261003    gcc-12.5.0 cocci
m68k                 randconfig-r2201-20261003    gcc-9.5.0  smatch
m68k                 randconfig-r2202-20261003    gcc-11.5.0 smatch
m68k                 randconfig-r2301-20261003    gcc-14     sparse
m68k                 randconfig-r2303-20261002    gcc-10.5.0 sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2200-20261003    gcc-8.5.0  smatch
microblaze           randconfig-r2201-20261002    gcc-8.5.0  smatch
microblaze           randconfig-r2202-20261002    gcc-8.5.0  smatch
microblaze           randconfig-r2304-20261002    clang-22   sparse
microblaze           randconfig-r2305-20261003    gcc-9.5.0  sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                           eyeq6_defconfig    gcc-16.1.0
mips                            ip32_defconfig    gcc-16.1.0
mips                 malta_qemu_32r6_defconfig    gcc-16.1.0
mips                 randconfig-r2101-20261003    gcc-13.4.0 cocci
mips                 randconfig-r2102-20261002    clang-24   cocci
mips                 randconfig-r2200-20261003    clang-24   smatch
mips                 randconfig-r2300-20261002    gcc-10.5.0 sparse
mips                 randconfig-r2300-20261003    gcc-14     sparse
mips                 randconfig-r2303-20261003    gcc-9.5.0  sparse
mips                 randconfig-r2308-20261003    gcc-8.5.0  sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261003    gcc-16.1.0
nios2                 randconfig-1000-20261004    gcc-16.1.0
nios2                 randconfig-1001-20261003    gcc-16.1.0
nios2                 randconfig-1001-20261004    gcc-16.1.0
nios2                randconfig-r2104-20261003    gcc-11.5.0 cocci
nios2                randconfig-r2302-20261003    gcc-8.5.0  sparse
nios2                randconfig-r2306-20261003    gcc-8.5.0  sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2106-20261002    gcc-14.3.0 cocci
openrisc             randconfig-r2106-20261003    gcc-9.5.0  cocci
openrisc             randconfig-r2302-20261003    gcc-9.5.0  sparse
openrisc             randconfig-r2306-20261003    gcc-11.5.0 sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                 generic-32bit_defconfig    gcc-16.1.0
parisc                randconfig-1000-20261003    gcc-11.5.0
parisc                randconfig-1000-20261004    gcc-12.5.0
parisc                randconfig-1001-20261003    gcc-11.5.0
parisc                randconfig-1001-20261004    gcc-12.5.0
parisc               randconfig-r2102-20261003    gcc-12.5.0 cocci
parisc64                          alldefconfig    gcc-16.1.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                      powernv_defconfig    clang-24
powerpc               randconfig-1000-20261003    gcc-11.5.0
powerpc               randconfig-1000-20261004    gcc-12.5.0
powerpc               randconfig-1001-20261003    gcc-11.5.0
powerpc               randconfig-1001-20261004    gcc-12.5.0
powerpc              randconfig-r2104-20261002    clang-24   cocci
powerpc              randconfig-r2104-20261003    clang-21   cocci
powerpc              randconfig-r2107-20261003    gcc-11.5.0 cocci
powerpc              randconfig-r2302-20261002    gcc-10.5.0 sparse
powerpc64             randconfig-1000-20261003    gcc-11.5.0
powerpc64             randconfig-1000-20261004    gcc-12.5.0
powerpc64             randconfig-1001-20261003    gcc-11.5.0
powerpc64             randconfig-1001-20261004    gcc-12.5.0
powerpc64            randconfig-r2100-20261002    gcc-8.5.0  cocci
powerpc64            randconfig-r2106-20261002    clang-24   cocci
powerpc64            randconfig-r2106-20261003    gcc-11.5.0 cocci
powerpc64            randconfig-r2300-20261003    gcc-13.4.0 sparse
powerpc64            randconfig-r2302-20261002    gcc-12.5.0 sparse
powerpc64            randconfig-r2302-20261003    gcc-14     sparse
powerpc64            randconfig-r2309-20261003    clang-24   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261003    gcc-12.5.0
riscv                 randconfig-1000-20261004    gcc-11.5.0
riscv                 randconfig-1001-20261003    gcc-12.5.0
riscv                 randconfig-1001-20261004    gcc-11.5.0
riscv                 randconfig-2000-20261002    gcc-9.5.0
riscv                 randconfig-2000-20261003    clang-17
riscv                 randconfig-2000-20261003    gcc-16.1.0
riscv                 randconfig-2001-20261002    gcc-9.5.0
riscv                 randconfig-2001-20261003    gcc-16.1.0
riscv                 randconfig-2001-20261003    gcc-9.5.0
riscv                randconfig-r2101-20261003    clang-17   cocci
riscv                randconfig-r2102-20261003    gcc-11.5.0 cocci
riscv                randconfig-r2105-20261002    gcc-8.5.0  cocci
riscv                randconfig-r2107-20261003    clang-24   cocci
riscv                randconfig-r2301-20261002    clang-22   sparse
riscv                randconfig-r2301-20261003    gcc-9.5.0  sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261003    gcc-12.5.0
s390                  randconfig-1000-20261004    gcc-11.5.0
s390                  randconfig-1001-20261003    gcc-12.5.0
s390                  randconfig-1001-20261004    gcc-11.5.0
s390                  randconfig-2000-20261002    gcc-9.5.0
s390                  randconfig-2000-20261003    clang-24
s390                  randconfig-2000-20261003    gcc-16.1.0
s390                  randconfig-2001-20261002    gcc-9.5.0
s390                  randconfig-2001-20261003    gcc-13.4.0
s390                  randconfig-2001-20261003    gcc-16.1.0
s390                 randconfig-r2100-20261003    gcc-12.5.0 cocci
s390                 randconfig-r2103-20261003    gcc-8.5.0  cocci
s390                 randconfig-r2107-20261002    clang-24   cocci
s390                 randconfig-r2304-20261003    gcc-9.5.0  sparse
s390                 randconfig-r2305-20261003    gcc-14     sparse
s390                 randconfig-r2309-20261003    gcc-11.5.0 sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261003    gcc-12.5.0
sh                    randconfig-1000-20261004    gcc-11.5.0
sh                    randconfig-1001-20261003    gcc-12.5.0
sh                    randconfig-1001-20261004    gcc-11.5.0
sh                    randconfig-2000-20261002    gcc-9.5.0
sh                    randconfig-2000-20261003    gcc-16.1.0
sh                    randconfig-2001-20261002    gcc-9.5.0
sh                    randconfig-2001-20261003    gcc-16.1.0
sh                   randconfig-r2200-20261002    gcc-10.5.0 smatch
sh                   randconfig-r2201-20261002    gcc-12.5.0 smatch
sh                   randconfig-r2202-20261002    gcc-10.5.0 smatch
sh                   randconfig-r2301-20261002    gcc-15.2.0 sparse
sh                   randconfig-r2304-20261003    gcc-9.5.0  sparse
sh                   randconfig-r2306-20261003    clang-24   sparse
sh                            se7724_defconfig    gcc-16.1.0
sh                      sh7710voipgw_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261003    clang-17
sparc                 randconfig-1000-20261004    gcc-14
sparc                 randconfig-1001-20261003    clang-17
sparc                 randconfig-1001-20261004    gcc-14
sparc                 randconfig-2000-20261002    clang-24
sparc                 randconfig-2000-20261003    gcc-14
sparc                 randconfig-2000-20261003    gcc-16.1.0
sparc                 randconfig-2001-20261002    clang-24
sparc                 randconfig-2001-20261003    gcc-14
sparc                 randconfig-2001-20261003    gcc-16.1.0
sparc                randconfig-r2100-20261002    clang-24   cocci
sparc                randconfig-r2101-20261003    gcc-11.5.0 cocci
sparc                randconfig-r2103-20261002    gcc-14     cocci
sparc                randconfig-r2105-20261003    gcc-11.5.0 cocci
sparc                randconfig-r2306-20261002    clang-24   sparse
sparc                randconfig-r2308-20261002    clang-24   sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261003    clang-17
sparc64               randconfig-1000-20261004    gcc-14
sparc64               randconfig-1001-20261003    clang-17
sparc64               randconfig-1001-20261004    gcc-14
sparc64               randconfig-2000-20261002    clang-24
sparc64               randconfig-2000-20261003    gcc-14
sparc64               randconfig-2000-20261003    gcc-8.5.0
sparc64               randconfig-2001-20261002    clang-24
sparc64               randconfig-2001-20261003    gcc-14
sparc64               randconfig-2001-20261003    gcc-8.5.0
sparc64              randconfig-r2100-20261002    gcc-14     cocci
sparc64              randconfig-r2103-20261002    clang-22   cocci
sparc64              randconfig-r2106-20261003    clang-21   cocci
sparc64              randconfig-r2303-20261002    clang-22   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261003    clang-17
um                    randconfig-1000-20261004    gcc-14
um                    randconfig-1001-20261003    clang-17
um                    randconfig-1001-20261004    gcc-14
um                    randconfig-2000-20261002    clang-24
um                    randconfig-2000-20261003    clang-24
um                    randconfig-2000-20261003    gcc-14
um                    randconfig-2001-20261002    clang-24
um                    randconfig-2001-20261003    gcc-14
um                   randconfig-r2101-20261002    clang-24   cocci
um                   randconfig-r2103-20261002    clang-24   cocci
um                   randconfig-r2105-20261003    clang-21   cocci
um                   randconfig-r2303-20261003    gcc-14     sparse
um                   randconfig-r2304-20261003    gcc-14     sparse
um                   randconfig-r2305-20261003    gcc-14     sparse
um                   randconfig-r2308-20261003    clang-24   sparse
um                   randconfig-r2308-20261003    gcc-11.5.0 sparse
um                   randconfig-r2309-20261002    clang-24   sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-22   checkkconfigsymbols
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261003    clang-22
x86_64      buildonly-randconfig-1000-20261004    gcc-14
x86_64      buildonly-randconfig-1001-20261003    clang-22
x86_64      buildonly-randconfig-1001-20261004    gcc-14
x86_64      buildonly-randconfig-1002-20261003    clang-22
x86_64      buildonly-randconfig-1002-20261004    gcc-14
x86_64      buildonly-randconfig-1003-20261003    clang-22
x86_64      buildonly-randconfig-1003-20261004    gcc-14
x86_64      buildonly-randconfig-1004-20261003    clang-22
x86_64      buildonly-randconfig-1004-20261004    gcc-14
x86_64      buildonly-randconfig-1005-20261003    clang-22
x86_64      buildonly-randconfig-1005-20261004    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261003    clang-22
x86_64                randconfig-1000-20261004    gcc-14
x86_64                randconfig-1001-20261003    clang-22
x86_64                randconfig-1001-20261004    gcc-14
x86_64                randconfig-1002-20261003    clang-22
x86_64                randconfig-1002-20261004    gcc-14
x86_64                randconfig-1003-20261003    clang-22
x86_64                randconfig-1003-20261004    gcc-14
x86_64                randconfig-1004-20261003    clang-22
x86_64                randconfig-1004-20261004    gcc-14
x86_64                randconfig-1005-20261003    clang-22
x86_64                randconfig-1005-20261004    gcc-14
x86_64                randconfig-1006-20261003    clang-22
x86_64                randconfig-1006-20261004    clang-22
x86_64                randconfig-1007-20261003    clang-22
x86_64                randconfig-1007-20261004    clang-22
x86_64                randconfig-1008-20261003    clang-22
x86_64                randconfig-1008-20261004    clang-22
x86_64                randconfig-1009-20261003    clang-22
x86_64                randconfig-1009-20261004    clang-22
x86_64                randconfig-1010-20261003    clang-22
x86_64                randconfig-1010-20261004    clang-22
x86_64                randconfig-1011-20261003    clang-22
x86_64                randconfig-1011-20261004    clang-22
x86_64                randconfig-1012-20261003    clang-22
x86_64                randconfig-1013-20261003    clang-22
x86_64                randconfig-1014-20261003    clang-22
x86_64                randconfig-1015-20261003    clang-22
x86_64                randconfig-1016-20261003    clang-22
x86_64                randconfig-1017-20261003    clang-22
x86_64                randconfig-2100-20261002    gcc-14     cocci
x86_64                randconfig-2100-20261003    clang-22   cocci
x86_64                randconfig-2101-20261002    gcc-14     cocci
x86_64                randconfig-2101-20261003    clang-22   cocci
x86_64                randconfig-2102-20261002    gcc-14     cocci
x86_64                randconfig-2102-20261003    clang-22   cocci
x86_64                randconfig-2102-20261003    gcc-14     cocci
x86_64                randconfig-2103-20261002    gcc-14     cocci
x86_64                randconfig-2103-20261003    clang-22   cocci
x86_64                randconfig-2103-20261003    gcc-13     cocci
x86_64                randconfig-2200-20261002    clang-22   smatch
x86_64                randconfig-2200-20261003    gcc-14     smatch
x86_64                randconfig-2300-20261002    gcc-12     sparse
x86_64                randconfig-2300-20261003    clang-22   sparse
x86_64                randconfig-2300-20261003    gcc-14     sparse
x86_64                randconfig-2301-20261002    gcc-12     sparse
x86_64                randconfig-2301-20261003    clang-22   sparse
x86_64                randconfig-2301-20261003    gcc-14     sparse
x86_64                randconfig-2302-20261002    gcc-12     sparse
x86_64                randconfig-2302-20261003    clang-22   sparse
x86_64               randconfig-r2101-20261002    gcc-14     cocci
x86_64               randconfig-r2102-20261002    gcc-14     cocci
x86_64               randconfig-r2201-20261003    clang-22   smatch
x86_64               randconfig-r2202-20261003    gcc-14     smatch
x86_64               randconfig-r2300-20261002    gcc-13     sparse
x86_64               randconfig-r2302-20261002    clang-22   sparse
x86_64               randconfig-r2303-20261003    gcc-14     sparse
x86_64               randconfig-r2305-20261002    clang-22   sparse
x86_64               randconfig-r2305-20261003    gcc-14     sparse
x86_64               randconfig-r2306-20261002    clang-24   sparse
x86_64               randconfig-r2308-20261003    gcc-14     sparse
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
xtensa                randconfig-1000-20261003    clang-17
xtensa                randconfig-1000-20261004    gcc-14
xtensa                randconfig-1001-20261003    clang-17
xtensa                randconfig-1001-20261004    gcc-14
xtensa                randconfig-2000-20261002    clang-24
xtensa                randconfig-2000-20261003    gcc-14
xtensa                randconfig-2000-20261003    gcc-8.5.0
xtensa                randconfig-2001-20261002    clang-24
xtensa                randconfig-2001-20261003    gcc-10.5.0
xtensa                randconfig-2001-20261003    gcc-14
xtensa               randconfig-r2100-20261003    gcc-13.4.0 cocci
xtensa               randconfig-r2105-20261003    gcc-15.2.0 cocci
xtensa               randconfig-r2107-20261003    gcc-15.2.0 cocci
xtensa               randconfig-r2202-20261002    gcc-9.5.0  smatch
xtensa               randconfig-r2302-20261003    gcc-14     sparse
xtensa               randconfig-r2307-20261003    gcc-9.5.0  sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
