Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3AE369D40
	for <linux-usb@vger.kernel.org>; Mon, 14 Sep 2026 17:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789408048; cv=none; b=IjYMQvDy3ezn+mkWiTIuYqX7h5HfJywFoFpOfnEXs/bACpDUxQAX8GXtlX8V143cmuqRUEfiF8vFLLqfTRZ6ySSvcA+pAJgjQXo6rj4HaHRZuTCRNxlCHdCP5ReoGwhuBHKI3ZZBpL/PF9MK1nn0LboCFWxCPa8Spql0vzx8WPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789408048; c=relaxed/simple;
	bh=cm4fBkgNI2HZSquFuDlM9iUJK427TuP2WFhjUOl5ed0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I1nRcW1SDf0V2sCarP0ZtTmYBNP1woEUcKc32/53BHfFeVHOtOtPEklSrTtkal5hDz/l83GaBCehMbRgZCsnlvJ83r5OfUOToigJO1D6YOaS7eJYopyx8w6Dr/6dSVymeCCI5A7+N+o08svWq4NyckR2iHjo22fiI/HR40SrzbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h2NdOOGx; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h2NdOOGx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789408046; x=1820944046;
  h=date:from:to:cc:subject:message-id;
  bh=cm4fBkgNI2HZSquFuDlM9iUJK427TuP2WFhjUOl5ed0=;
  b=h2NdOOGxZSVb3G0DR208YxAyJsYSwnAQ5vv4gDU+tJCLauxRpMtfEyVM
   DmBouRgZjr+r8oerUQ9WaEk+Vg/i3PJwUnDEt6b1j7uuSAMHJFScT8klS
   3ofUjuHeUnTzqOAO00eloqKDQnaXzwKOsmMq13dMyutQPACv9fMuw4XSz
   hkZU0np2NwXum0EPebLeW82rWVoDN+57vMxWS5oN0Nv0qkil/+NKdHtmT
   3HUCZpcHz9l/AHatKQAOi8EB67NGXkBfhJVndktnFKhCcsj8Wn/ZhaO8o
   EusZVjcuWWyvYhOrHj03NaeKp02S+eQRfv0fFEq2ymFZKFmq5hfaHcYqc
   w==;
X-CSE-ConnectionGUID: oC55O+bnR9ud71JsEAHvhw==
X-CSE-MsgGUID: uNKyYt6ATvWT6PwmYAOFMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89894939"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89894939"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 10:47:26 -0700
X-CSE-ConnectionGUID: BJY2cO4sS1SLAawEKAXUdg==
X-CSE-MsgGUID: QRRehVxERfm4Z+wp6RW5dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269024770"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Sep 2026 10:47:25 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6Am2-000000003G1-1HoU;
	Mon, 14 Sep 2026 17:47:22 +0000
Date: Tue, 15 Sep 2026 01:47:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD REGRESSION
 dbe68462fa656078eac3a5a09039038dc47e08da
Message-ID: <202609150159.YKP5wHSf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: dbe68462fa656078eac3a5a09039038dc47e08da  usb: chipidea: ci_hdrc_imx: Fix error handling when creating IRQ name

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202609141128.DQicnuRW-lkp@intel.com

    fotg210-core.c:(.text+0x104): undefined reference to `usb_hcd_platform_shutdown'

Error/Warning ids grouped by kconfigs:

recent_errors
`-- powerpc64-randconfig-002-20260914
    `-- fotg210-core.c:(.text):undefined-reference-to-usb_hcd_platform_shutdown

elapsed time: 2609m

configs tested: 418
configs skipped: 42

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
alpha                randconfig-r121-20260914    gcc-12.5.0 sparse
arc                              allmodconfig    clang-24
arc                              allmodconfig    clang-24
arc                               allnoconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-24
arc                              allyesconfig    clang-24
arc                                 defconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                     haps_hs_smp_defconfig    gcc-16.1.0
arc                            hsdk_defconfig    gcc-16.1.0
arc                        nsim_700_defconfig    clang-17
arc                     nsimosci_hs_defconfig    gcc-16.1.0
arc                   randconfig-001-20260913    gcc-10.5.0
arc                   randconfig-001-20260914    gcc-13.4.0
arc                   randconfig-002-20260913    gcc-10.5.0
arc                   randconfig-002-20260914    gcc-13.4.0
arc                  randconfig-r123-20260914    clang-17 sparse
arc                  randconfig-r132-20260914    gcc-14 sparse
arc                        vdk_hs38_defconfig    gcc-16.1.0
arm                               allnoconfig    gcc-16.1.0
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-24
arm                              allyesconfig    clang-24
arm                                 defconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                          exynos_defconfig    gcc-16.1.0
arm                      footbridge_defconfig    gcc-16.1.0
arm                            hisi_defconfig    gcc-16.1.0
arm                           imxrt_defconfig    gcc-16.1.0
arm                        keystone_defconfig    gcc-16.1.0
arm                           omap1_defconfig    gcc-16.1.0
arm                             pxa_defconfig    gcc-16.1.0
arm                   randconfig-001-20260913    gcc-10.5.0
arm                   randconfig-001-20260914    gcc-13.4.0
arm                   randconfig-002-20260913    gcc-10.5.0
arm                   randconfig-002-20260914    gcc-13.4.0
arm                   randconfig-003-20260913    gcc-10.5.0
arm                   randconfig-003-20260914    gcc-13.4.0
arm                   randconfig-004-20260913    gcc-10.5.0
arm                   randconfig-004-20260914    gcc-13.4.0
arm                  randconfig-r113-20260914    gcc-11.5.0 sparse
arm                  randconfig-r122-20260914    clang-17 sparse
arm                  randconfig-r134-20260914    clang-22 sparse
arm                         socfpga_defconfig    gcc-16.1.0
arm                    vt8500_v6_v7_defconfig    gcc-14
arm                    vt8500_v6_v7_defconfig    gcc-16.1.0
arm64                            allmodconfig    clang-24
arm64                            allmodconfig    clang-24
arm64                             allnoconfig    gcc-16.1.0
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260913    gcc-16.1.0
arm64                 randconfig-001-20260914    gcc-9.5.0
arm64                 randconfig-002-20260913    gcc-16.1.0
arm64                 randconfig-002-20260914    gcc-9.5.0
arm64                 randconfig-003-20260913    gcc-16.1.0
arm64                 randconfig-003-20260914    gcc-9.5.0
arm64                 randconfig-004-20260913    gcc-16.1.0
arm64                 randconfig-004-20260914    gcc-9.5.0
arm64                randconfig-r113-20260914    clang-24 sparse
arm64                randconfig-r121-20260914    gcc-11.5.0 sparse
arm64                randconfig-r122-20260914    clang-24 sparse
arm64                randconfig-r131-20260914    gcc-16.1.0 sparse
arm64                randconfig-r132-20260914    gcc-14 sparse
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260913    gcc-16.1.0
csky                  randconfig-001-20260914    gcc-9.5.0
csky                  randconfig-002-20260913    gcc-16.1.0
csky                  randconfig-002-20260914    gcc-9.5.0
csky                 randconfig-r121-20260914    clang-24 sparse
csky                 randconfig-r122-20260914    gcc-12.5.0 sparse
csky                 randconfig-r131-20260914    gcc-13.4.0 sparse
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260913    clang-24
hexagon               randconfig-001-20260914    gcc-13.4.0
hexagon               randconfig-002-20260913    clang-24
hexagon               randconfig-002-20260914    gcc-13.4.0
hexagon              randconfig-r112-20260914    clang-24 sparse
hexagon              randconfig-r131-20260914    gcc-14 sparse
hexagon              randconfig-r134-20260914    gcc-14 sparse
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260914    gcc-14
i386        buildonly-randconfig-002-20260914    gcc-14
i386        buildonly-randconfig-003-20260914    gcc-14
i386        buildonly-randconfig-004-20260914    gcc-14
i386        buildonly-randconfig-005-20260914    gcc-14
i386        buildonly-randconfig-006-20260914    gcc-14
i386                                defconfig    gcc-16.1.0
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260914    clang-22
i386                  randconfig-002-20260914    clang-22
i386                  randconfig-003-20260914    clang-22
i386                  randconfig-004-20260914    clang-22
i386                  randconfig-005-20260914    clang-22
i386                  randconfig-006-20260914    clang-22
i386                  randconfig-007-20260914    clang-22
i386                  randconfig-011-20260913    gcc-14
i386                  randconfig-011-20260914    clang-22
i386                  randconfig-012-20260913    gcc-14
i386                  randconfig-012-20260914    clang-22
i386                  randconfig-013-20260913    gcc-14
i386                  randconfig-013-20260914    clang-22
i386                  randconfig-014-20260913    gcc-14
i386                  randconfig-014-20260914    clang-22
i386                  randconfig-015-20260913    gcc-14
i386                  randconfig-015-20260914    clang-22
i386                  randconfig-016-20260913    gcc-14
i386                  randconfig-016-20260914    clang-22
i386                  randconfig-017-20260913    gcc-14
i386                  randconfig-017-20260914    clang-22
i386                  randconfig-061-20260914    gcc-14 sparse
i386                  randconfig-062-20260914    gcc-14 sparse
i386                  randconfig-063-20260914    gcc-14 sparse
i386                 randconfig-r111-20260914    clang-17 sparse
i386                 randconfig-r132-20260914    gcc-13.4.0 sparse
i386                 randconfig-r134-20260914    gcc-14 sparse
loongarch                        allmodconfig    clang-24
loongarch                        allmodconfig    clang-24
loongarch                         allnoconfig    gcc-16.1.0
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-24
loongarch                           defconfig    clang-24
loongarch             randconfig-001-20260913    clang-24
loongarch             randconfig-001-20260914    gcc-13.4.0
loongarch             randconfig-002-20260913    clang-24
loongarch             randconfig-002-20260914    gcc-13.4.0
loongarch            randconfig-r111-20260914    gcc-11.5.0 sparse
loongarch            randconfig-r113-20260914    clang-17 sparse
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-24
m68k                             allyesconfig    clang-24
m68k                                defconfig    clang-24
m68k                                defconfig    clang-24
m68k                       m5249evb_defconfig    gcc-16.1.0
m68k                       m5282evb_defconfig    gcc-16.1.0
m68k                        m5407c3_defconfig    clang-17
m68k                      m54418evb_defconfig    gcc-16.1.0
m68k                        mvme16x_defconfig    gcc-14
m68k                        mvme16x_defconfig    gcc-16.1.0
m68k                 randconfig-r111-20260914    gcc-12.5.0 sparse
m68k                 randconfig-r113-20260914    gcc-12.5.0 sparse
microblaze                        allnoconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-24
microblaze                          defconfig    clang-24
microblaze           randconfig-r123-20260914    gcc-12.5.0 sparse
mips                             allmodconfig    gcc-16.1.0
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                         bigsur_defconfig    clang-17
mips                         cobalt_defconfig    gcc-16.1.0
mips                  decstation_64_defconfig    gcc-16.1.0
mips                 decstation_r4k_defconfig    gcc-16.1.0
mips                           ip22_defconfig    gcc-16.1.0
mips                           ip32_defconfig    gcc-14
mips                        omega2p_defconfig    gcc-16.1.0
mips                 randconfig-r132-20260914    gcc-16.1.0 sparse
mips                 randconfig-r134-20260914    gcc-13.4.0 sparse
mips                         rt305x_defconfig    clang-17
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-24
nios2                             allnoconfig    clang-24
nios2                             allnoconfig    gcc-16.1.0
nios2                               defconfig    clang-24
nios2                               defconfig    clang-24
nios2                 randconfig-001-20260913    clang-24
nios2                 randconfig-001-20260914    gcc-13.4.0
nios2                 randconfig-001-20260914    gcc-8.5.0
nios2                 randconfig-002-20260913    clang-24
nios2                 randconfig-002-20260914    gcc-13.4.0
nios2                 randconfig-002-20260914    gcc-8.5.0
nios2                randconfig-r133-20260914    clang-22 sparse
nios2                randconfig-r133-20260914    gcc-14 sparse
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-24
openrisc                          allnoconfig    clang-24
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
openrisc             randconfig-r112-20260914    gcc-12.5.0 sparse
openrisc             randconfig-r121-20260914    clang-17 sparse
parisc                           allmodconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-24
parisc                            allnoconfig    clang-24
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260913    gcc-8.5.0
parisc                randconfig-001-20260914    gcc-8.5.0
parisc                randconfig-002-20260913    gcc-8.5.0
parisc                randconfig-002-20260914    gcc-8.5.0
parisc               randconfig-r133-20260914    gcc-13.4.0 sparse
parisc64                            defconfig    clang-24
parisc64                            defconfig    clang-24
powerpc                          allmodconfig    gcc-16.1.0
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-24
powerpc                           allnoconfig    clang-24
powerpc                           allnoconfig    gcc-16.1.0
powerpc                      arches_defconfig    gcc-16.1.0
powerpc                        fsp2_defconfig    gcc-16.1.0
powerpc                    ge_imp3a_defconfig    gcc-14
powerpc                    ge_imp3a_defconfig    gcc-16.1.0
powerpc                     kmeter1_defconfig    gcc-16.1.0
powerpc                  mpc866_ads_defconfig    clang-17
powerpc                     powernv_defconfig    gcc-16.1.0
powerpc                         ps3_defconfig    clang-17
powerpc                         ps3_defconfig    gcc-16.1.0
powerpc               randconfig-001-20260913    gcc-8.5.0
powerpc               randconfig-001-20260914    gcc-8.5.0
powerpc               randconfig-002-20260913    gcc-8.5.0
powerpc               randconfig-002-20260914    gcc-8.5.0
powerpc              randconfig-r111-20260914    clang-24 sparse
powerpc              randconfig-r134-20260914    gcc-16.1.0 sparse
powerpc64             randconfig-001-20260913    gcc-8.5.0
powerpc64             randconfig-001-20260914    gcc-8.5.0
powerpc64             randconfig-002-20260913    gcc-8.5.0
powerpc64             randconfig-002-20260914    gcc-8.5.0
riscv                            allmodconfig    clang-24
riscv                            allmodconfig    clang-24
riscv                             allnoconfig    clang-24
riscv                             allnoconfig    clang-24
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-24
riscv                            allyesconfig    clang-24
riscv                               defconfig    gcc-16.1.0
riscv                               defconfig    gcc-16.1.0
riscv                    nommu_virt_defconfig    gcc-16.1.0
riscv                    nommu_virt_defconfig    gcc-16.1.0
riscv                 randconfig-001-20260913    gcc-14.3.0
riscv                 randconfig-001-20260914    gcc-13.4.0
riscv                 randconfig-002-20260913    gcc-14.3.0
riscv                 randconfig-002-20260914    gcc-13.4.0
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-24
s390                              allnoconfig    clang-24
s390                             allyesconfig    gcc-16.1.0
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260913    gcc-14.3.0
s390                  randconfig-001-20260914    gcc-13.4.0
s390                  randconfig-002-20260913    gcc-14.3.0
s390                  randconfig-002-20260914    gcc-13.4.0
s390                 randconfig-r122-20260914    gcc-11.5.0 sparse
s390                 randconfig-r131-20260914    gcc-14 sparse
s390                       zfcpdump_defconfig    gcc-16.1.0
sh                               alldefconfig    gcc-16.1.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-24
sh                                allnoconfig    clang-24
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                         ap325rxa_defconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-14
sh                        dreamcast_defconfig    gcc-16.1.0
sh                             espt_defconfig    gcc-16.1.0
sh                               j2_defconfig    gcc-16.1.0
sh                 kfr2r09-romimage_defconfig    gcc-16.1.0
sh                          kfr2r09_defconfig    clang-17
sh                    randconfig-001-20260913    gcc-14.3.0
sh                    randconfig-001-20260914    gcc-13.4.0
sh                    randconfig-002-20260913    gcc-14.3.0
sh                    randconfig-002-20260914    gcc-13.4.0
sh                   randconfig-r123-20260914    clang-24 sparse
sh                          rsk7264_defconfig    gcc-16.1.0
sh                           se7705_defconfig    gcc-14
sh                            shmin_defconfig    gcc-16.1.0
sparc                             allnoconfig    clang-24
sparc                             allnoconfig    clang-24
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260913    gcc-15.2.0
sparc                 randconfig-001-20260914    gcc-16.1.0
sparc                 randconfig-002-20260913    gcc-15.2.0
sparc                 randconfig-002-20260914    gcc-16.1.0
sparc                randconfig-r112-20260914    clang-17 sparse
sparc                randconfig-r123-20260914    gcc-11.5.0 sparse
sparc                randconfig-r131-20260914    clang-22 sparse
sparc                randconfig-r132-20260914    gcc-14 sparse
sparc64                          alldefconfig    clang-17
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260913    gcc-15.2.0
sparc64               randconfig-001-20260914    gcc-16.1.0
sparc64               randconfig-002-20260913    gcc-15.2.0
sparc64               randconfig-002-20260914    gcc-16.1.0
sparc64              randconfig-r112-20260914    gcc-11.5.0 sparse
um                               allmodconfig    clang-17
um                                allnoconfig    clang-24
um                                allnoconfig    clang-24
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             i386_defconfig    gcc-16.1.0
um                    randconfig-001-20260913    gcc-15.2.0
um                    randconfig-001-20260914    gcc-16.1.0
um                    randconfig-002-20260913    gcc-15.2.0
um                    randconfig-002-20260914    gcc-16.1.0
um                   randconfig-r133-20260914    gcc-14 sparse
um                           x86_64_defconfig    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           alldefconfig    gcc-16.1.0
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-24
x86_64                            allnoconfig    clang-24
x86_64                            allnoconfig    gcc-16.1.0
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260913    clang-22
x86_64      buildonly-randconfig-001-20260914    gcc-14
x86_64      buildonly-randconfig-002-20260913    clang-22
x86_64      buildonly-randconfig-002-20260914    gcc-14
x86_64      buildonly-randconfig-003-20260913    clang-22
x86_64      buildonly-randconfig-003-20260914    gcc-14
x86_64      buildonly-randconfig-004-20260913    clang-22
x86_64      buildonly-randconfig-004-20260914    gcc-14
x86_64      buildonly-randconfig-005-20260913    clang-22
x86_64      buildonly-randconfig-005-20260914    gcc-14
x86_64      buildonly-randconfig-006-20260913    clang-22
x86_64      buildonly-randconfig-006-20260914    gcc-14
x86_64                              defconfig    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260913    clang-22
x86_64                randconfig-001-20260914    gcc-14
x86_64                randconfig-002-20260913    clang-22
x86_64                randconfig-002-20260914    gcc-14
x86_64                randconfig-003-20260913    clang-22
x86_64                randconfig-003-20260914    gcc-14
x86_64                randconfig-004-20260913    clang-22
x86_64                randconfig-004-20260914    gcc-14
x86_64                randconfig-005-20260913    clang-22
x86_64                randconfig-005-20260914    gcc-14
x86_64                randconfig-006-20260913    clang-22
x86_64                randconfig-006-20260914    gcc-14
x86_64                randconfig-011-20260913    gcc-14
x86_64                randconfig-011-20260914    clang-22
x86_64                randconfig-012-20260913    gcc-14
x86_64                randconfig-012-20260914    clang-22
x86_64                randconfig-013-20260913    gcc-14
x86_64                randconfig-013-20260914    clang-22
x86_64                randconfig-014-20260913    gcc-14
x86_64                randconfig-014-20260914    clang-22
x86_64                randconfig-015-20260913    gcc-14
x86_64                randconfig-015-20260914    clang-22
x86_64                randconfig-016-20260913    gcc-14
x86_64                randconfig-016-20260914    clang-22
x86_64                randconfig-071-20260914    clang-22
x86_64                randconfig-072-20260914    clang-22
x86_64                randconfig-073-20260914    clang-22
x86_64                randconfig-074-20260914    clang-22
x86_64                randconfig-075-20260914    clang-22
x86_64                randconfig-076-20260914    clang-22
x86_64                randconfig-121-20260914    gcc-14 sparse
x86_64                randconfig-122-20260914    gcc-14 sparse
x86_64                randconfig-123-20260914    gcc-14 sparse
x86_64               randconfig-r132-20260914    clang-22 sparse
x86_64               randconfig-r133-20260914    gcc-14 sparse
x86_64               randconfig-r133-20260914    gcc-16.1.0 sparse
x86_64                               rhel-9.4    clang-22
x86_64                               rhel-9.4    clang-22
x86_64                               rhel-9.4    gcc-14
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                          rhel-9.4-func    clang-22
x86_64                          rhel-9.4-func    gcc-14
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                    rhel-9.4-kselftests    gcc-14
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-24
xtensa                            allnoconfig    clang-24
xtensa                           allyesconfig    clang-20
xtensa                generic_kc705_defconfig    gcc-16.1.0
xtensa                          iss_defconfig    gcc-16.1.0
xtensa                randconfig-001-20260913    gcc-15.2.0
xtensa                randconfig-001-20260914    gcc-16.1.0
xtensa                randconfig-002-20260913    gcc-15.2.0
xtensa                randconfig-002-20260914    gcc-16.1.0
xtensa               randconfig-r131-20260914    gcc-14 sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
