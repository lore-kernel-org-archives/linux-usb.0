Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A812730C177
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 02:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791254801; cv=none; b=HHGMzotQcIE0FJu/cxJYZzd6zMg4wJa0QtG//pwFrAmca9UkvwZ/Lh0m5xthO3+LaluE/wKr3LE5ZF8/98sqpdeLJK2Ve2E0BtCEtecUhJQszTKp9DmJJT38dpZteEY6GTwl0T5C6hZq7YjhKgN7PywKSgoJsfP4iaHTM5XlnZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791254801; c=relaxed/simple;
	bh=7klxKMKRnu7CQF2obfmpxO+GTG3fJ0m6Yu790/q9p3E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gYktP3Wy9YXV5/AEFwll/MgqwHXx/DaO1woPzt60Z2AaZKuMTv75SGfnxjFDSMzCLk6Innx+mF8UjF28iuQS2toDMFsIskQ2zz5ZTvLpf8V1henRV/O5+E6uf85DwjsBJipGC4mNo6F9yYpKTuSzNDsPTVQtXTQt7h3kptag6UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eIOn1emW; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eIOn1emW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791254799; x=1822790799;
  h=date:from:to:cc:subject:message-id;
  bh=7klxKMKRnu7CQF2obfmpxO+GTG3fJ0m6Yu790/q9p3E=;
  b=eIOn1emWS7KkuRE1VQJPxj38BfSPpQTB5++jIn5bAlF9nz+2hIGXafAC
   /FOZBZyPJ4OUNGRuBTMxYnOsJ8QEaYmyzGLcPeCo8RbKLuCkLwSl2rzL9
   Y+SnoUmOC3gUVFnqqAERR8Mm+Lt9kavpFchZynOFTABy5JAb5d+gA7GhS
   jl14ud9WoXrcFlQjO2dv499f4v1GGf8wVLqgQ7DOPvDZzim4JKEIe+YEx
   Lq+3NJQ5A41RkiymAnYEgRZkBXM2x0aB6ljgVC3Nv2tWHu66vvbT7Cnb/
   Y6cAuok9LeP224xDafTeIZgqaisbFrhizZwdM0By2btJrcphuuZhvS6cF
   w==;
X-CSE-ConnectionGUID: ivntAn28QCK/2vqyQ+VrMg==
X-CSE-MsgGUID: vDK/9pUgTJW1u/ZlHnnX5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="90997430"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="90997430"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 19:46:36 -0700
X-CSE-ConnectionGUID: sAUwGCNaQ3mrvfVCbxdIvQ==
X-CSE-MsgGUID: +R1JzWeYRrWrAyAQI737IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="280729517"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Oct 2026 19:46:35 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDvCK-00000000154-22yb;
	Tue, 06 Oct 2026 02:46:32 +0000
Date: Tue, 06 Oct 2026 10:45:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 5926a7da87895b1e1e1b3789ef364a11cc54d210
Message-ID: <202610061043.hgKKKHuF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: 5926a7da87895b1e1e1b3789ef364a11cc54d210  Merge 7.3-rc6 into usb-next

elapsed time: 1123m

configs tested: 427
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    clang-24
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2200-20261005    gcc-9.5.0  smatch
alpha                randconfig-r2201-20261005    gcc-15.2.0 smatch
alpha                randconfig-r2300-20261005    clang-22   sparse
alpha                randconfig-r2302-20261005    clang-24   sparse
alpha                randconfig-r2303-20261005    clang-22   sparse
alpha                randconfig-r2303-20261005    clang-24   sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                       axs103_smp_defconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                          haps_hs_defconfig    gcc-16.1.0
arc                      haps_hs_smp_defconfig    clang-24
arc                      haps_hs_smp_defconfig    gcc-16.1.0
arc                   randconfig-1000-20261005    gcc-8.5.0
arc                   randconfig-1000-20261006    clang-24
arc                   randconfig-1001-20261005    gcc-8.5.0
arc                   randconfig-1001-20261006    clang-24
arc                  randconfig-r2100-20261005    gcc-11.5.0 cocci
arc                  randconfig-r2102-20261005    gcc-11.5.0 cocci
arc                  randconfig-r2201-20261005    gcc-8.5.0  smatch
arc                  randconfig-r2202-20261005    gcc-14.3.0 smatch
arc                  randconfig-r2302-20261005    clang-22   sparse
arc                  randconfig-r2304-20261005    clang-22   sparse
arc                  randconfig-r2305-20261005    clang-22   sparse
arc                  randconfig-r2306-20261005    gcc-15.2.0 sparse
arc                  randconfig-r2306-20261005    gcc-9.5.0  sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                        multi_v4t_defconfig    gcc-16.1.0
arm                         multi_v7_defconfig    gcc-16.1.0
arm                         mvebu_v7_defconfig    clang-24
arm                              mxs_defconfig    gcc-16.1.0
arm                           pxa3xx_defconfig    clang-24
arm                           pxa3xx_defconfig    gcc-16.1.0
arm                   randconfig-1000-20261005    gcc-8.5.0
arm                   randconfig-1000-20261006    clang-24
arm                   randconfig-1001-20261005    gcc-8.5.0
arm                   randconfig-1001-20261006    clang-24
arm                   randconfig-1002-20261005    gcc-8.5.0
arm                   randconfig-1002-20261006    clang-24
arm                   randconfig-1003-20261005    gcc-8.5.0
arm                   randconfig-1003-20261006    clang-24
arm                  randconfig-r2107-20261005    clang-24   cocci
arm                  randconfig-r2201-20261005    clang-24   smatch
arm                  randconfig-r2202-20261005    gcc-8.5.0  smatch
arm                  randconfig-r2304-20261005    clang-21   sparse
arm                  randconfig-r2308-20261005    gcc-13.4.0 sparse
arm                          s5pv210_defconfig    gcc-16.1.0
arm                         shmobile_defconfig    gcc-16.1.0
arm                          socfpga_defconfig    gcc-16.1.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261005    gcc-16.1.0
arm64                 randconfig-1000-20261006    gcc-16.1.0
arm64                 randconfig-1001-20261005    gcc-16.1.0
arm64                 randconfig-1001-20261006    gcc-16.1.0
arm64                 randconfig-1002-20261005    gcc-16.1.0
arm64                 randconfig-1002-20261006    gcc-16.1.0
arm64                 randconfig-1003-20261005    gcc-16.1.0
arm64                 randconfig-1003-20261006    gcc-16.1.0
arm64                randconfig-r2103-20261005    gcc-14     cocci
arm64                randconfig-r2103-20261005    gcc-8.5.0  cocci
arm64                randconfig-r2307-20261005    gcc-14.3.0 sparse
arm64                randconfig-r2309-20261005    gcc-15.2.0 sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261005    gcc-16.1.0
csky                  randconfig-1000-20261006    gcc-16.1.0
csky                  randconfig-1001-20261005    gcc-16.1.0
csky                  randconfig-1001-20261006    gcc-16.1.0
csky                 randconfig-r2101-20261005    gcc-11.5.0 cocci
csky                 randconfig-r2105-20261005    gcc-8.5.0  cocci
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261005    gcc-16.1.0
hexagon               randconfig-1000-20261006    gcc-13.4.0
hexagon               randconfig-1001-20261005    gcc-16.1.0
hexagon               randconfig-1001-20261006    gcc-13.4.0
hexagon              randconfig-r2101-20261005    clang-22   cocci
hexagon              randconfig-r2107-20261005    gcc-14.3.0 cocci
hexagon              randconfig-r2308-20261005    gcc-15.2.0 sparse
hexagon              randconfig-r2309-20261005    clang-24   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386        buildonly-randconfig-1000-20261005    clang-22
i386        buildonly-randconfig-1000-20261006    gcc-14
i386        buildonly-randconfig-1001-20261005    clang-22
i386        buildonly-randconfig-1001-20261006    gcc-14
i386        buildonly-randconfig-1002-20261005    clang-22
i386        buildonly-randconfig-1002-20261006    gcc-14
i386        buildonly-randconfig-1003-20261005    clang-22
i386        buildonly-randconfig-1003-20261006    gcc-14
i386        buildonly-randconfig-1004-20261005    clang-22
i386        buildonly-randconfig-1004-20261006    gcc-14
i386        buildonly-randconfig-1005-20261005    clang-22
i386        buildonly-randconfig-1005-20261006    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261005    clang-22
i386                  randconfig-1000-20261006    gcc-14
i386                  randconfig-1001-20261005    clang-22
i386                  randconfig-1001-20261006    gcc-14
i386                  randconfig-1002-20261005    clang-22
i386                  randconfig-1002-20261006    gcc-14
i386                  randconfig-1003-20261005    clang-22
i386                  randconfig-1003-20261006    gcc-14
i386                  randconfig-1004-20261005    clang-22
i386                  randconfig-1004-20261006    gcc-14
i386                  randconfig-1005-20261005    clang-22
i386                  randconfig-1005-20261006    gcc-14
i386                  randconfig-1006-20261005    clang-22
i386                  randconfig-1006-20261006    gcc-14
i386                  randconfig-1007-20261006    gcc-14
i386                  randconfig-1008-20261006    gcc-14
i386                  randconfig-1009-20261006    gcc-14
i386                  randconfig-1010-20261006    gcc-14
i386                  randconfig-1011-20261006    gcc-14
i386                  randconfig-1012-20261006    gcc-14
i386                  randconfig-1013-20261006    gcc-14
i386                  randconfig-2100-20261005    gcc-14     cocci
i386                  randconfig-2101-20261005    gcc-14     cocci
i386                  randconfig-2102-20261005    gcc-14     cocci
i386                  randconfig-2103-20261005    gcc-14     cocci
i386                  randconfig-2200-20261005    gcc-14     smatch
i386                  randconfig-2300-20261005    clang-22   sparse
i386                  randconfig-2300-20261005    gcc-14     sparse
i386                  randconfig-2301-20261005    clang-22   sparse
i386                  randconfig-2301-20261005    gcc-13     sparse
i386                  randconfig-2302-20261005    clang-22   sparse
i386                 randconfig-r2103-20261005    gcc-15.2.0 cocci
i386                 randconfig-r2106-20261005    gcc-14.3.0 cocci
i386                 randconfig-r2300-20261005    gcc-13.4.0 sparse
i386                 randconfig-r2305-20261005    gcc-13.4.0 sparse
i386                 randconfig-r2308-20261005    gcc-9.5.0  sparse
i386                 randconfig-r2309-20261005    gcc-14     sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch                 loongson32_defconfig    gcc-16.1.0
loongarch             randconfig-1000-20261005    gcc-16.1.0
loongarch             randconfig-1000-20261006    gcc-13.4.0
loongarch             randconfig-1001-20261005    gcc-16.1.0
loongarch             randconfig-1001-20261006    gcc-13.4.0
loongarch            randconfig-r2100-20261005    clang-22   cocci
loongarch            randconfig-r2105-20261005    gcc-8.5.0  cocci
loongarch            randconfig-r2106-20261005    gcc-16.1.0 cocci
loongarch            randconfig-r2200-20261005    clang-24   smatch
loongarch            randconfig-r2202-20261005    gcc-16.1.0 smatch
loongarch            randconfig-r2302-20261005    clang-21   sparse
loongarch            randconfig-r2307-20261005    gcc-14     sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                           amiga_defconfig    clang-24
m68k                        bvme6000_defconfig    gcc-16.1.0
m68k                                 defconfig    clang-24
m68k                         m5407c3_defconfig    gcc-16.1.0
m68k                          nettel_defconfig    gcc-16.1.0
m68k                 randconfig-r2103-20261005    clang-22   cocci
m68k                 randconfig-r2104-20261005    gcc-14.3.0 cocci
m68k                 randconfig-r2104-20261005    gcc-8.5.0  cocci
m68k                 randconfig-r2303-20261005    clang-21   sparse
m68k                 randconfig-r2306-20261005    gcc-14.3.0 sparse
microblaze                        alldefconfig    gcc-16.1.0
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2101-20261005    gcc-14     cocci
microblaze           randconfig-r2104-20261005    gcc-16.1.0 cocci
microblaze           randconfig-r2202-20261005    gcc-9.5.0  smatch
microblaze           randconfig-r2307-20261005    gcc-9.5.0  sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                       bmips_stb_defconfig    gcc-16.1.0
mips                           eyeq6_defconfig    gcc-16.1.0
mips                            ip30_defconfig    gcc-16.1.0
mips                       loongson1_defconfig    gcc-16.1.0
mips                       maltasmvp_defconfig    gcc-16.1.0
mips                 randconfig-r2105-20261005    gcc-16.1.0 cocci
mips                 randconfig-r2107-20261005    gcc-8.5.0  cocci
mips                 randconfig-r2305-20261005    clang-21   sparse
nios2                             alldefconfig    gcc-16.1.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261005    gcc-16.1.0
nios2                 randconfig-1000-20261006    gcc-13.4.0
nios2                 randconfig-1001-20261005    gcc-16.1.0
nios2                 randconfig-1001-20261006    gcc-13.4.0
nios2                randconfig-r2101-20261005    clang-22   cocci
nios2                randconfig-r2104-20261005    clang-24   cocci
nios2                randconfig-r2106-20261005    clang-24   cocci
nios2                randconfig-r2201-20261005    gcc-11.5.0 smatch
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc          de0_nano_multicore_defconfig    gcc-16.1.0
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2104-20261005    gcc-8.5.0  cocci
openrisc             randconfig-r2107-20261005    gcc-14.3.0 cocci
openrisc             randconfig-r2300-20261005    clang-21   sparse
openrisc             randconfig-r2306-20261005    gcc-14     sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261005    gcc-8.5.0
parisc                randconfig-1000-20261006    gcc-14.3.0
parisc                randconfig-1001-20261005    gcc-8.5.0
parisc                randconfig-1001-20261006    gcc-14.3.0
parisc               randconfig-r2102-20261005    gcc-8.5.0  cocci
parisc               randconfig-r2103-20261005    gcc-11.5.0 cocci
parisc               randconfig-r2104-20261005    gcc-14.3.0 cocci
parisc               randconfig-r2200-20261005    gcc-16.1.0 smatch
parisc               randconfig-r2201-20261005    gcc-8.5.0  smatch
parisc               randconfig-r2202-20261005    gcc-8.5.0  smatch
parisc               randconfig-r2306-20261005    gcc-11.5.0 sparse
parisc               randconfig-r2308-20261005    gcc-14     sparse
parisc64                          alldefconfig    gcc-16.1.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                  canyonlands_defconfig    gcc-16.1.0
powerpc                  mpc836x_rdk_defconfig    clang-24
powerpc                       ppc44x_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261005    gcc-8.5.0
powerpc               randconfig-1000-20261006    gcc-14.3.0
powerpc               randconfig-1001-20261005    gcc-8.5.0
powerpc               randconfig-1001-20261006    gcc-14.3.0
powerpc              randconfig-r2102-20261005    gcc-15.2.0 cocci
powerpc              randconfig-r2107-20261005    gcc-16.1.0 cocci
powerpc              randconfig-r2107-20261005    gcc-8.5.0  cocci
powerpc              randconfig-r2301-20261005    gcc-13.4.0 sparse
powerpc              randconfig-r2307-20261005    clang-24   sparse
powerpc              randconfig-r2307-20261005    gcc-9.5.0  sparse
powerpc                      taishan_defconfig    gcc-16.1.0
powerpc                      tqm8548_defconfig    gcc-16.1.0
powerpc                         warp_defconfig    gcc-16.1.0
powerpc                          wii_defconfig    gcc-16.1.0
powerpc64             randconfig-1000-20261005    gcc-8.5.0
powerpc64             randconfig-1000-20261006    gcc-14.3.0
powerpc64             randconfig-1001-20261005    gcc-8.5.0
powerpc64             randconfig-1001-20261006    gcc-14.3.0
powerpc64            randconfig-r2202-20261005    gcc-12.5.0 smatch
powerpc64            randconfig-r2308-20261005    clang-17   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                     nommu_virt_defconfig    clang-24
riscv                 randconfig-1000-20261005    clang-17
riscv                 randconfig-1000-20261006    clang-24
riscv                 randconfig-1001-20261005    clang-17
riscv                 randconfig-1001-20261006    clang-24
riscv                 randconfig-2000-20261005    gcc-16.1.0
riscv                 randconfig-2001-20261005    gcc-16.1.0
riscv                randconfig-r2200-20261005    gcc-10.5.0 smatch
riscv                randconfig-r2301-20261005    clang-21   sparse
riscv                randconfig-r2304-20261005    gcc-13.4.0 sparse
riscv                randconfig-r2307-20261005    clang-24   sparse
riscv                randconfig-r2308-20261005    gcc-9.5.0  sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                           debug_defconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261005    clang-17
s390                  randconfig-1000-20261006    clang-24
s390                  randconfig-1001-20261005    clang-17
s390                  randconfig-1001-20261006    clang-24
s390                  randconfig-2000-20261005    gcc-16.1.0
s390                  randconfig-2001-20261005    gcc-16.1.0
s390                 randconfig-r2200-20261005    clang-24   smatch
s390                 randconfig-r2300-20261005    clang-24   sparse
s390                 randconfig-r2303-20261005    gcc-13.4.0 sparse
s390                 randconfig-r2308-20261005    gcc-14.3.0 sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                          ecovec24_defconfig    gcc-16.1.0
sh                           r7780mp_defconfig    gcc-16.1.0
sh                    randconfig-1000-20261005    clang-17
sh                    randconfig-1000-20261006    clang-24
sh                    randconfig-1001-20261005    clang-17
sh                    randconfig-1001-20261006    clang-24
sh                    randconfig-2000-20261005    gcc-16.1.0
sh                    randconfig-2001-20261005    gcc-16.1.0
sh                   randconfig-r2105-20261005    gcc-14.3.0 cocci
sh                   randconfig-r2301-20261005    clang-24   sparse
sh                   randconfig-r2304-20261005    clang-24   sparse
sh                   randconfig-r2309-20261005    gcc-12.5.0 sparse
sh                   randconfig-r2309-20261005    gcc-14.3.0 sparse
sh                           rsk7264_defconfig    gcc-16.1.0
sh                      sh7710voipgw_defconfig    gcc-16.1.0
sh                             shmin_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261005    clang-24
sparc                 randconfig-1000-20261006    gcc-14
sparc                 randconfig-1001-20261005    clang-24
sparc                 randconfig-1001-20261006    gcc-14
sparc                 randconfig-2000-20261005    clang-17
sparc                 randconfig-2001-20261005    clang-17
sparc                randconfig-r2100-20261005    gcc-15.2.0 cocci
sparc                randconfig-r2101-20261005    gcc-8.5.0  cocci
sparc                randconfig-r2307-20261005    gcc-15.2.0 sparse
sparc                randconfig-r2309-20261005    gcc-9.5.0  sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261005    clang-24
sparc64               randconfig-1000-20261006    gcc-14
sparc64               randconfig-1001-20261005    clang-24
sparc64               randconfig-1001-20261006    gcc-14
sparc64               randconfig-2000-20261005    clang-17
sparc64               randconfig-2001-20261005    clang-17
sparc64              randconfig-r2103-20261005    clang-22   cocci
sparc64              randconfig-r2105-20261005    clang-24   cocci
sparc64              randconfig-r2302-20261005    gcc-13.4.0 sparse
um                                alldefconfig    gcc-16.1.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                              i386_defconfig    gcc-16.1.0
um                    randconfig-1000-20261005    clang-24
um                    randconfig-1000-20261006    gcc-14
um                    randconfig-1001-20261005    clang-24
um                    randconfig-1001-20261006    gcc-14
um                    randconfig-2000-20261005    clang-17
um                    randconfig-2001-20261005    clang-17
um                   randconfig-r2101-20261005    gcc-15.2.0 cocci
um                   randconfig-r2102-20261005    gcc-14     cocci
um                   randconfig-r2106-20261005    gcc-14.3.0 cocci
um                   randconfig-r2201-20261005    gcc-14     smatch
um                   randconfig-r2301-20261005    clang-22   sparse
um                   randconfig-r2305-20261005    clang-24   sparse
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261005    gcc-13
x86_64      buildonly-randconfig-1000-20261006    gcc-14
x86_64      buildonly-randconfig-1001-20261005    gcc-13
x86_64      buildonly-randconfig-1001-20261006    gcc-14
x86_64      buildonly-randconfig-1002-20261005    gcc-13
x86_64      buildonly-randconfig-1002-20261006    gcc-14
x86_64      buildonly-randconfig-1003-20261005    gcc-13
x86_64      buildonly-randconfig-1003-20261006    gcc-14
x86_64      buildonly-randconfig-1004-20261005    gcc-13
x86_64      buildonly-randconfig-1004-20261006    gcc-14
x86_64      buildonly-randconfig-1005-20261005    gcc-13
x86_64      buildonly-randconfig-1005-20261006    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261005    gcc-14
x86_64                randconfig-1000-20261006    gcc-14
x86_64                randconfig-1001-20261005    gcc-14
x86_64                randconfig-1001-20261006    gcc-14
x86_64                randconfig-1002-20261005    gcc-14
x86_64                randconfig-1002-20261006    gcc-14
x86_64                randconfig-1003-20261005    gcc-14
x86_64                randconfig-1003-20261006    gcc-14
x86_64                randconfig-1004-20261005    gcc-14
x86_64                randconfig-1004-20261006    gcc-14
x86_64                randconfig-1005-20261005    gcc-14
x86_64                randconfig-1005-20261006    gcc-14
x86_64                randconfig-1006-20261005    gcc-14
x86_64                randconfig-1006-20261006    gcc-14
x86_64                randconfig-1007-20261005    gcc-14
x86_64                randconfig-1007-20261006    gcc-14
x86_64                randconfig-1008-20261005    gcc-14
x86_64                randconfig-1008-20261006    gcc-14
x86_64                randconfig-1009-20261005    gcc-14
x86_64                randconfig-1009-20261006    gcc-14
x86_64                randconfig-1010-20261005    gcc-14
x86_64                randconfig-1010-20261006    gcc-14
x86_64                randconfig-1011-20261005    gcc-14
x86_64                randconfig-1011-20261006    gcc-14
x86_64                randconfig-1012-20261006    gcc-14
x86_64                randconfig-1013-20261006    gcc-14
x86_64                randconfig-1014-20261006    gcc-14
x86_64                randconfig-1015-20261006    gcc-14
x86_64                randconfig-1016-20261006    gcc-14
x86_64                randconfig-1017-20261006    gcc-14
x86_64                randconfig-2100-20261005    clang-22   cocci
x86_64                randconfig-2101-20261005    clang-22   cocci
x86_64                randconfig-2102-20261005    clang-22   cocci
x86_64                randconfig-2103-20261005    clang-22   cocci
x86_64                randconfig-2200-20261005    clang-22   smatch
x86_64                randconfig-2300-20261005    clang-22   sparse
x86_64                randconfig-2301-20261005    clang-22   sparse
x86_64                randconfig-2301-20261005    gcc-14     sparse
x86_64                randconfig-2302-20261005    clang-22   sparse
x86_64               randconfig-r2100-20261005    gcc-14     cocci
x86_64               randconfig-r2102-20261005    clang-22   cocci
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
xtensa                 generic_kc705_defconfig    gcc-16.1.0
xtensa                randconfig-1000-20261005    clang-24
xtensa                randconfig-1000-20261006    gcc-14
xtensa                randconfig-1001-20261005    clang-24
xtensa                randconfig-1001-20261006    gcc-14
xtensa                randconfig-2000-20261005    clang-17
xtensa                randconfig-2001-20261005    clang-17
xtensa               randconfig-r2100-20261005    clang-22   cocci
xtensa               randconfig-r2100-20261005    gcc-8.5.0  cocci
xtensa               randconfig-r2106-20261005    gcc-8.5.0  cocci
xtensa               randconfig-r2306-20261005    gcc-9.5.0  sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
