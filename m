Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7A23C819E
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 05:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789538102; cv=none; b=hhJwn8cOTDS0HfZ5K8RElXzByGgZQXQJkqu7DywIjbV6lLnbVAhJBRSGYPY69c7iL5cBb3hWSw21YWWUEF7zSCEehnex1i+CWKZofAOHDSRG+FwNdsplMkD+sKSA8RI7Oao57BDlFXZkp89ookCI2xBOqjr6zsN9hY76jzd31H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789538102; c=relaxed/simple;
	bh=1ALNzuom0DpjmnS2E0O4YHnfd/GVdogvLzXC7/GLYtI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F80e9a6na6c/ZP4XbAuYKcfljIiNBPGMh/gjfhjAUO2wX0DZgncpVqqDMfQFFrh242qptruJLFiH+/ZZDmcJrFs3KgAzIevqVwzOfALZTVv8hfPGf3D6GSMOYSbkE4cnVJxx0qLGI4KBA7jTy3qSgZb3X362PAwxCl45fJV9hNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Of8QzxiA; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Of8QzxiA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789538101; x=1821074101;
  h=date:from:to:cc:subject:message-id;
  bh=1ALNzuom0DpjmnS2E0O4YHnfd/GVdogvLzXC7/GLYtI=;
  b=Of8QzxiAjy8XRPMeQB90XHC8r4zGDohC9tfsRLNvX1j0GrEn6XVZKXJQ
   LCQQQB1aNt2CxPF0mxXBAPAhcpr+tgsYw3EkqMIiLoO5WkEudIO1XlEov
   4TklgQNNMRig6OLklxTbgBHqcADIiKh1SeMncz8GZduFrn0Y1gsE6uTWa
   bJofSaQOlSv9no8Sp+kinJxODfPu7XMcblS5pXtLWFbOnMNEHlRVeNvIE
   MHiBHNjqvXzVj6Ry7gNWArzhPnMgubjso+mjJBuaz3nxYP2XgyWPDEiLh
   3KEb2TuE6N0rXZxmstRmU6Dx5qJMLMi/wJsBlTX2uBEe0bL0EppmRE3Ik
   w==;
X-CSE-ConnectionGUID: NtziAbqkSFeC3/KcwRMsoA==
X-CSE-MsgGUID: paPgmOy5RBi/v9nJwPQQrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89045669"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89045669"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 22:55:00 -0700
X-CSE-ConnectionGUID: sQA3vnsCQfWmh5M4oJEX0w==
X-CSE-MsgGUID: 13RHs7OIQnOUnhQ/n4YKeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="278477511"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 15 Sep 2026 22:54:59 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6ibg-000000005ZP-1aSh;
	Wed, 16 Sep 2026 05:54:56 +0000
Date: Wed, 16 Sep 2026 13:54:26 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 5da91c3694b8060b651aab5d95b2e4729c6e2b56
Message-ID: <202609161322.B13f1Wua-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: 5da91c3694b8060b651aab5d95b2e4729c6e2b56  thunderbolt: stream: Check the Rx ring before task starts sleeping

elapsed time: m

configs tested: 336
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
alpha                randconfig-r073-20260915    gcc-14.3.0
arc                              allmodconfig    clang-24
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-24
arc                                 defconfig    gcc-16.1.0
arc                 nsimosci_hs_smp_defconfig    clang-20
arc                   randconfig-001-20260916    clang-24
arc                   randconfig-002-20260916    clang-24
arc                  randconfig-r071-20260915    gcc-14.3.0
arc                  randconfig-r132-20260915    gcc-12.5.0 sparse
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-24
arm                                 defconfig    gcc-16.1.0
arm                           h3600_defconfig    gcc-16.1.0
arm                            mps2_defconfig    clang-24
arm                       multi_v4t_defconfig    clang-24
arm                         nhk8815_defconfig    clang-24
arm                   randconfig-001-20260916    clang-24
arm                   randconfig-002-20260916    clang-24
arm                   randconfig-003-20260916    clang-24
arm                   randconfig-004-20260916    clang-24
arm                  randconfig-r053-20260914    clang-17
arm                  randconfig-r061-20260915    clang-22
arm                  randconfig-r111-20260916    clang-22 sparse
arm                  randconfig-r133-20260916    gcc-16.1.0 sparse
arm                           tegra_defconfig    clang-20
arm64                            allmodconfig    clang-24
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260916    gcc-16.1.0
arm64                 randconfig-002-20260916    gcc-16.1.0
arm64                 randconfig-003-20260916    gcc-16.1.0
arm64                 randconfig-004-20260916    gcc-16.1.0
arm64                randconfig-r064-20260915    clang-22
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260916    gcc-16.1.0
csky                  randconfig-002-20260916    gcc-16.1.0
csky                 randconfig-r052-20260914    clang-17
csky                 randconfig-r054-20260914    gcc-14
csky                 randconfig-r054-20260915    gcc-15.2.0
csky                 randconfig-r063-20260914    gcc-16.1.0
csky                 randconfig-r073-20260914    gcc-11.5.0
csky                 randconfig-r111-20260916    clang-24 sparse
csky                 randconfig-r121-20260916    clang-22 sparse
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260916    gcc-16.1.0
hexagon               randconfig-002-20260916    gcc-16.1.0
hexagon              randconfig-r061-20260914    clang-22
hexagon              randconfig-r071-20260914    clang-24
i386                              allnoconfig    gcc-16.1.0
i386        buildonly-randconfig-001-20260916    clang-22
i386        buildonly-randconfig-002-20260916    clang-22
i386        buildonly-randconfig-003-20260916    clang-22
i386        buildonly-randconfig-004-20260916    clang-22
i386        buildonly-randconfig-005-20260916    clang-22
i386        buildonly-randconfig-006-20260916    clang-22
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260916    gcc-14
i386                  randconfig-002-20260916    gcc-14
i386                  randconfig-003-20260916    gcc-14
i386                  randconfig-004-20260916    gcc-14
i386                  randconfig-005-20260916    gcc-14
i386                  randconfig-006-20260916    gcc-14
i386                  randconfig-007-20260916    gcc-14
i386                  randconfig-011-20260916    clang-22
i386                  randconfig-012-20260916    clang-22
i386                  randconfig-013-20260916    clang-22
i386                  randconfig-014-20260916    clang-22
i386                  randconfig-015-20260916    clang-22
i386                  randconfig-016-20260916    clang-22
i386                  randconfig-017-20260916    clang-22
i386                  randconfig-051-20260914    clang-22
i386                  randconfig-051-20260915    clang-22
i386                  randconfig-052-20260914    clang-22
i386                  randconfig-052-20260915    clang-22
i386                  randconfig-053-20260914    clang-22
i386                  randconfig-053-20260915    clang-22
i386                  randconfig-054-20260914    clang-22
i386                  randconfig-054-20260915    clang-22
i386                  randconfig-061-20260915    gcc-14 sparse
i386                  randconfig-062-20260915    gcc-14 sparse
i386                  randconfig-063-20260915    gcc-14 sparse
i386                  randconfig-141-20260914    gcc-14
i386                  randconfig-141-20260915    clang-22
i386                 randconfig-r054-20260914    clang-22
i386                 randconfig-r062-20260914    gcc-14
i386                 randconfig-r072-20260914    clang-22
i386                 randconfig-r131-20260916    gcc-16.1.0 sparse
loongarch                        allmodconfig    clang-24
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-24
loongarch             randconfig-001-20260916    gcc-16.1.0
loongarch             randconfig-002-20260916    gcc-16.1.0
loongarch            randconfig-r051-20260914    gcc-15.2.0
loongarch            randconfig-r052-20260915    gcc-15.2.0
loongarch            randconfig-r054-20260915    clang-22
loongarch            randconfig-r062-20260914    gcc-16.1.0
loongarch            randconfig-r062-20260915    gcc-13
loongarch            randconfig-r063-20260914    gcc-14
loongarch            randconfig-r071-20260914    clang-19
loongarch            randconfig-r072-20260914    clang-24
loongarch            randconfig-r073-20260914    clang-22
loongarch            randconfig-r111-20260916    gcc-12.5.0 sparse
loongarch            randconfig-r121-20260916    gcc-12.5.0 sparse
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-24
m68k                                defconfig    clang-24
m68k                       m5329evb_defconfig    clang-20
m68k                 randconfig-r063-20260914    gcc-14
m68k                 randconfig-r064-20260915    gcc-13
m68k                 randconfig-r071-20260914    gcc-14.3.0
m68k                 randconfig-r072-20260914    gcc-8.5.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-24
microblaze           randconfig-r053-20260915    clang-22
microblaze           randconfig-r122-20260916    clang-22 sparse
microblaze           randconfig-r134-20260915    gcc-12.5.0 sparse
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                           ip22_defconfig    gcc-16.1.0
mips                 randconfig-r051-20260914    clang-22
mips                 randconfig-r113-20260916    clang-24 sparse
mips                 randconfig-r123-20260916    gcc-12.5.0 sparse
mips                           rs90_defconfig    gcc-16.1.0
mips                        vocore2_defconfig    clang-20
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-24
nios2                               defconfig    clang-24
nios2                 randconfig-001-20260916    gcc-16.1.0
nios2                 randconfig-002-20260916    gcc-16.1.0
nios2                randconfig-r053-20260914    clang-22
nios2                randconfig-r053-20260914    gcc-15.2.0
nios2                randconfig-r063-20260915    gcc-13
nios2                randconfig-r064-20260914    gcc-14
nios2                randconfig-r073-20260914    gcc-11.5.0
openrisc                         alldefconfig    clang-24
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-24
openrisc                            defconfig    gcc-16.1.0
openrisc             randconfig-r133-20260915    gcc-12.5.0 sparse
openrisc             randconfig-r134-20260916    gcc-16.1.0 sparse
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-24
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260915    gcc-8.5.0
parisc                randconfig-001-20260916    clang-24
parisc                randconfig-002-20260915    gcc-8.5.0
parisc                randconfig-002-20260916    clang-24
parisc               randconfig-r072-20260915    gcc-8.5.0
parisc               randconfig-r122-20260916    gcc-12.5.0 sparse
parisc               randconfig-r123-20260916    clang-22 sparse
parisc               randconfig-r132-20260916    gcc-11.5.0 sparse
parisc64                         alldefconfig    clang-20
parisc64                            defconfig    clang-24
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-24
powerpc                        cell_defconfig    gcc-16.1.0
powerpc                   currituck_defconfig    clang-20
powerpc                 linkstation_defconfig    gcc-16.1.0
powerpc                     mpc512x_defconfig    clang-20
powerpc                 mpc836x_rdk_defconfig    clang-24
powerpc               randconfig-001-20260915    gcc-8.5.0
powerpc               randconfig-001-20260916    clang-24
powerpc               randconfig-002-20260915    gcc-8.5.0
powerpc               randconfig-002-20260916    clang-24
powerpc              randconfig-r053-20260915    gcc-15.2.0
powerpc              randconfig-r054-20260914    gcc-15.2.0
powerpc              randconfig-r063-20260914    clang-22
powerpc              randconfig-r113-20260916    gcc-12.5.0 sparse
powerpc              randconfig-r122-20260916    clang-24 sparse
powerpc                         wii_defconfig    gcc-16.1.0
powerpc64             randconfig-001-20260915    gcc-8.5.0
powerpc64             randconfig-001-20260916    clang-24
powerpc64             randconfig-002-20260915    gcc-8.5.0
powerpc64             randconfig-002-20260916    clang-24
powerpc64            randconfig-r112-20260916    clang-22 sparse
powerpc64            randconfig-r112-20260916    gcc-12.5.0 sparse
riscv                            allmodconfig    clang-24
riscv                             allnoconfig    clang-24
riscv                            allyesconfig    clang-24
riscv                               defconfig    gcc-16.1.0
riscv             nommu_k210_sdcard_defconfig    clang-24
riscv                 randconfig-001-20260916    gcc-16.1.0
riscv                 randconfig-002-20260916    gcc-16.1.0
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-24
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260916    gcc-16.1.0
s390                  randconfig-002-20260916    gcc-16.1.0
s390                 randconfig-r051-20260915    gcc-15.2.0
s390                 randconfig-r063-20260915    clang-22
s390                 randconfig-r064-20260914    gcc-14
s390                 randconfig-r072-20260915    gcc-9.5.0
s390                 randconfig-r133-20260916    gcc-11.5.0 sparse
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-24
sh                               allyesconfig    clang-17
sh                                  defconfig    gcc-14
sh                          lboxre2_defconfig    gcc-16.1.0
sh                    randconfig-001-20260916    gcc-16.1.0
sh                    randconfig-002-20260916    gcc-16.1.0
sh                   randconfig-r051-20260914    clang-17
sh                   randconfig-r051-20260915    clang-22
sh                   randconfig-r052-20260914    gcc-14
sh                   randconfig-r054-20260914    clang-17
sh                   randconfig-r123-20260916    clang-24 sparse
sh                          sdk7786_defconfig    clang-20
sh                           se7751_defconfig    gcc-16.1.0
sparc                             allnoconfig    clang-24
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260915    gcc-13.4.0
sparc                 randconfig-001-20260916    gcc-14.3.0
sparc                 randconfig-002-20260915    gcc-13.4.0
sparc                 randconfig-002-20260916    gcc-14.3.0
sparc                randconfig-r052-20260914    gcc-15.2.0
sparc                randconfig-r062-20260914    gcc-14
sparc                randconfig-r064-20260914    gcc-16.1.0
sparc                randconfig-r071-20260914    gcc-8.5.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260915    gcc-13.4.0
sparc64               randconfig-001-20260916    gcc-14.3.0
sparc64               randconfig-002-20260915    gcc-13.4.0
sparc64               randconfig-002-20260916    gcc-14.3.0
sparc64              randconfig-r052-20260914    clang-22
sparc64              randconfig-r064-20260914    clang-22
sparc64              randconfig-r073-20260914    clang-24
sparc64              randconfig-r112-20260916    clang-24 sparse
sparc64              randconfig-r134-20260916    gcc-11.5.0 sparse
um                               allmodconfig    clang-17
um                                allnoconfig    clang-24
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260915    gcc-13.4.0
um                    randconfig-001-20260916    gcc-14.3.0
um                    randconfig-002-20260915    gcc-13.4.0
um                    randconfig-002-20260916    gcc-14.3.0
um                   randconfig-r053-20260914    gcc-14
um                   randconfig-r121-20260916    clang-24 sparse
um                   randconfig-r131-20260915    gcc-12.5.0 sparse
um                   randconfig-r132-20260916    gcc-16.1.0 sparse
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-24
x86_64      buildonly-randconfig-001-20260915    clang-22
x86_64      buildonly-randconfig-002-20260915    clang-22
x86_64      buildonly-randconfig-003-20260915    clang-22
x86_64      buildonly-randconfig-004-20260915    clang-22
x86_64      buildonly-randconfig-005-20260915    clang-22
x86_64      buildonly-randconfig-006-20260915    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260915    clang-22
x86_64                randconfig-001-20260916    clang-22
x86_64                randconfig-002-20260915    clang-22
x86_64                randconfig-002-20260916    clang-22
x86_64                randconfig-003-20260915    clang-22
x86_64                randconfig-003-20260916    clang-22
x86_64                randconfig-004-20260915    clang-22
x86_64                randconfig-004-20260916    clang-22
x86_64                randconfig-005-20260915    clang-22
x86_64                randconfig-005-20260916    clang-22
x86_64                randconfig-006-20260915    clang-22
x86_64                randconfig-006-20260916    clang-22
x86_64                randconfig-011-20260915    gcc-14
x86_64                randconfig-011-20260916    gcc-14
x86_64                randconfig-012-20260915    gcc-14
x86_64                randconfig-012-20260916    gcc-14
x86_64                randconfig-013-20260915    gcc-14
x86_64                randconfig-013-20260916    gcc-14
x86_64                randconfig-014-20260915    gcc-14
x86_64                randconfig-014-20260916    gcc-14
x86_64                randconfig-015-20260915    gcc-14
x86_64                randconfig-015-20260916    gcc-14
x86_64                randconfig-016-20260915    gcc-14
x86_64                randconfig-016-20260916    gcc-14
x86_64                randconfig-071-20260916    gcc-14
x86_64                randconfig-072-20260916    gcc-14
x86_64                randconfig-073-20260916    gcc-14
x86_64                randconfig-074-20260916    gcc-14
x86_64                randconfig-075-20260916    gcc-14
x86_64                randconfig-076-20260916    gcc-14
x86_64                randconfig-101-20260914    gcc-14
x86_64                randconfig-101-20260915    clang-22
x86_64                randconfig-102-20260914    gcc-14
x86_64                randconfig-102-20260915    clang-22
x86_64                randconfig-103-20260914    gcc-14
x86_64                randconfig-103-20260915    clang-22
x86_64                randconfig-104-20260914    gcc-14
x86_64                randconfig-104-20260915    clang-22
x86_64                randconfig-121-20260915    gcc-14 sparse
x86_64                randconfig-122-20260915    gcc-14 sparse
x86_64                randconfig-123-20260915    gcc-14 sparse
x86_64                randconfig-161-20260914    clang-22
x86_64                randconfig-161-20260915    clang-22
x86_64               randconfig-r051-20260914    gcc-14
x86_64               randconfig-r052-20260915    clang-22
x86_64               randconfig-r061-20260914    gcc-14
x86_64               randconfig-r061-20260915    gcc-13
x86_64               randconfig-r062-20260914    clang-22
x86_64               randconfig-r062-20260915    clang-22
x86_64               randconfig-r071-20260915    clang-22
x86_64               randconfig-r113-20260916    clang-22 sparse
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    clang-22
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-24
xtensa                           allyesconfig    clang-20
xtensa                          iss_defconfig    clang-24
xtensa                randconfig-001-20260915    gcc-13.4.0
xtensa                randconfig-001-20260916    gcc-14.3.0
xtensa                randconfig-002-20260915    gcc-13.4.0
xtensa                randconfig-002-20260916    gcc-14.3.0
xtensa               randconfig-r061-20260914    gcc-16.1.0
xtensa               randconfig-r131-20260916    gcc-11.5.0 sparse
xtensa                    smp_lx200_defconfig    clang-24

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
