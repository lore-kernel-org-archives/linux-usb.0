Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B83184
	for <linux-usb@vger.kernel.org>; Thu, 13 Aug 2026 01:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786584181; cv=none; b=raBZyGCEb1oVznHuD4s+bhDIa5Joa0rD8pIOS2+Zt1Unu/gWpVClocSbQsE/fp3aSbNVCc3UxPZ8an+xnY2EBHVAkWRKQetPk7D/w7fo4MZPxt7IL1OBEQyjr8KUSRXrapfms8NzPm86G/e5MutNcz9bEG9zQA1uAuvCWUhhhQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786584181; c=relaxed/simple;
	bh=kTLB0tHfezHkrpVbPHZoUPqwqPkHDmWkQqHP+fN3KPU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G13/JyI1TAIb9hwoBZUHu13jlG/I32/PDKeeBlgOTTPCEMtdK8fo2x+8Djdt8lBPoHQm1alcms+S6B/obnXIYMDCPrWGAl+p0l+PngLVJ/YhAXiooOx3GZL1WQtfU8l1JAuzTelCbpRwhBj3iHJOw2DoZOQ3XNrjcoa0sW1pG6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QAveyFAL; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QAveyFAL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786584179; x=1818120179;
  h=date:from:to:cc:subject:message-id;
  bh=kTLB0tHfezHkrpVbPHZoUPqwqPkHDmWkQqHP+fN3KPU=;
  b=QAveyFALdsd4b8nOJp7Nns/svm0ktlq5DyYIFzj4vvDKvUF9xYOyUHyl
   6g1JZWGJZcNorjqSrloVLb7/+Mm7d7Ty1YkgvJhSROtgqdmpXVUenMg/z
   slDJDyWe1dupkpsgNghdOaPl6p3lpgnDyyMMU523p3mlGlWhKnEyc0Y9u
   vSBk+a7arCsASUt10U2n4T1QJ0LzqRhk8N3RwHVyZ9yp5IICH1rc5z+fx
   96sCXvFV2SrR7A5yMDs4XCs2O53LU/KqWT22JQdcUzej08hoFudpybzz6
   3jISNc5SXVAYIDCOVSsvQjGljeMaLDXHUHYPP7ftrpTq139tk/XRhLyZB
   w==;
X-CSE-ConnectionGUID: T0vC/DsSTrGwD+FnnfZYuQ==
X-CSE-MsgGUID: pVLXnMvpTnCTPr7YDYACLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86115926"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="86115926"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 18:22:58 -0700
X-CSE-ConnectionGUID: SGxuLaVgQiezuLegJ0Q76g==
X-CSE-MsgGUID: 20SlkH9pTKul63WWr2v7Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="267654817"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Aug 2026 18:22:57 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuK9n-00000000SMo-0NKw;
	Thu, 13 Aug 2026 01:22:55 +0000
Date: Thu, 13 Aug 2026 09:22:50 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 86feaba911f2f1a540a7695c8f4a98fd0fd60ac4
Message-ID: <202608130938.LXMN4jFX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: 86feaba911f2f1a540a7695c8f4a98fd0fd60ac4  thunderbolt: Clamp DMA tunnel credits to what a hop register can hold

elapsed time: 2355m

configs tested: 180
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                           randconfig-001    gcc-12.5.0
arc                           randconfig-001    gcc-13.4.0
arc                  randconfig-001-20260812    gcc-12.5.0
arc                  randconfig-001-20260813    gcc-13.4.0
arc                  randconfig-002-20260812    gcc-10.5.0
arc                  randconfig-002-20260812    gcc-12.5.0
arc                  randconfig-002-20260813    gcc-13.4.0
arm                        mv78xx0_defconfig    clang-24
arm                  randconfig-001-20260812    clang-19
arm                  randconfig-001-20260812    gcc-12.5.0
arm                  randconfig-001-20260813    gcc-13.4.0
arm                  randconfig-002-20260812    gcc-12.5.0
arm                  randconfig-002-20260813    gcc-13.4.0
arm                  randconfig-003-20260812    gcc-12.5.0
arm                  randconfig-003-20260812    gcc-14.3.0
arm                  randconfig-003-20260813    gcc-13.4.0
arm                  randconfig-004-20260812    clang-24
arm                  randconfig-004-20260812    gcc-12.5.0
arm                  randconfig-004-20260813    gcc-13.4.0
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260812    clang-24
arm64                randconfig-001-20260812    gcc-14.3.0
arm64                randconfig-001-20260813    gcc-14.3.0
arm64                randconfig-002-20260812    clang-20
arm64                randconfig-002-20260812    gcc-14.3.0
arm64                randconfig-002-20260813    gcc-14.3.0
arm64                randconfig-003-20260812    clang-17
arm64                randconfig-003-20260812    gcc-14.3.0
arm64                randconfig-003-20260813    gcc-14.3.0
arm64                randconfig-004-20260812    clang-24
arm64                randconfig-004-20260812    gcc-14.3.0
arm64                randconfig-004-20260813    gcc-14.3.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260812    gcc-10.5.0
csky                 randconfig-001-20260812    gcc-14.3.0
csky                 randconfig-001-20260813    gcc-14.3.0
csky                 randconfig-002-20260812    gcc-14.3.0
csky                 randconfig-002-20260812    gcc-16.1.0
csky                 randconfig-002-20260813    gcc-14.3.0
hexagon                       randconfig-001    gcc-11.5.0
hexagon              randconfig-001-20260812    clang-24
hexagon              randconfig-001-20260812    gcc-11.5.0
hexagon              randconfig-002-20260812    clang-17
hexagon              randconfig-002-20260812    gcc-11.5.0
i386                            allmodconfig    gcc-14
i386                buildonly-randconfig-001    clang-22
i386       buildonly-randconfig-001-20260812    clang-22
i386       buildonly-randconfig-002-20260812    clang-22
i386       buildonly-randconfig-002-20260812    gcc-14
i386       buildonly-randconfig-003-20260812    clang-22
i386       buildonly-randconfig-004-20260812    clang-22
i386       buildonly-randconfig-005-20260812    clang-22
i386       buildonly-randconfig-005-20260812    gcc-14
i386       buildonly-randconfig-006-20260812    clang-22
i386                          randconfig-001    clang-22
i386                 randconfig-001-20260812    clang-22
i386                 randconfig-001-20260812    gcc-14
i386                 randconfig-002-20260812    clang-22
i386                 randconfig-002-20260812    gcc-14
i386                 randconfig-003-20260812    clang-22
i386                 randconfig-004-20260812    clang-22
i386                 randconfig-004-20260812    gcc-14
i386                 randconfig-005-20260812    clang-22
i386                 randconfig-005-20260812    gcc-14
i386                 randconfig-006-20260812    clang-22
i386                 randconfig-007-20260812    clang-22
i386                 randconfig-007-20260812    gcc-14
i386                 randconfig-011-20260812    gcc-12
i386                 randconfig-011-20260812    gcc-14
i386                 randconfig-012-20260812    gcc-12
i386                 randconfig-013-20260812    clang-22
i386                 randconfig-013-20260812    gcc-12
i386                 randconfig-014-20260812    clang-22
i386                 randconfig-014-20260812    gcc-12
i386                 randconfig-015-20260812    clang-22
i386                 randconfig-015-20260812    gcc-12
i386                 randconfig-016-20260812    clang-22
i386                 randconfig-016-20260812    gcc-12
i386                 randconfig-017-20260812    clang-22
i386                 randconfig-017-20260812    gcc-12
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260812    clang-24
loongarch            randconfig-001-20260812    gcc-11.5.0
loongarch            randconfig-002-20260812    clang-24
loongarch            randconfig-002-20260812    gcc-11.5.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260812    gcc-11.5.0
nios2                randconfig-002-20260812    gcc-10.5.0
nios2                randconfig-002-20260812    gcc-11.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260812    clang-17
parisc               randconfig-001-20260812    gcc-8.5.0
parisc               randconfig-001-20260813    gcc-10.5.0
parisc               randconfig-002-20260812    clang-17
parisc               randconfig-002-20260812    gcc-8.5.0
parisc               randconfig-002-20260813    gcc-10.5.0
powerpc                   amigaone_defconfig    gcc-16.1.0
powerpc                     pasemi_defconfig    clang-24
powerpc              randconfig-001-20260812    clang-17
powerpc              randconfig-001-20260812    gcc-14.3.0
powerpc              randconfig-001-20260813    gcc-10.5.0
powerpc              randconfig-002-20260812    clang-17
powerpc              randconfig-002-20260812    clang-24
powerpc              randconfig-002-20260813    gcc-10.5.0
powerpc64            randconfig-001-20260812    clang-17
powerpc64            randconfig-001-20260813    gcc-10.5.0
powerpc64            randconfig-002-20260812    clang-17
powerpc64            randconfig-002-20260812    clang-24
powerpc64            randconfig-002-20260813    gcc-10.5.0
riscv                         randconfig-001    clang-24
riscv                         randconfig-001    gcc-10.5.0
riscv                randconfig-001-20260812    clang-24
riscv                randconfig-001-20260813    gcc-10.5.0
riscv                randconfig-002-20260812    clang-24
riscv                randconfig-002-20260812    gcc-8.5.0
riscv                randconfig-002-20260813    gcc-10.5.0
s390                 randconfig-001-20260812    clang-24
s390                 randconfig-001-20260812    gcc-9.5.0
s390                 randconfig-001-20260813    gcc-10.5.0
s390                 randconfig-002-20260812    clang-24
s390                 randconfig-002-20260813    gcc-10.5.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260812    clang-24
sh                   randconfig-001-20260812    gcc-14.3.0
sh                   randconfig-001-20260813    gcc-10.5.0
sh                   randconfig-002-20260812    clang-24
sh                   randconfig-002-20260813    gcc-10.5.0
sparc                         randconfig-001    gcc-16.1.0
sparc                randconfig-001-20260812    gcc-15.2.0
sparc                randconfig-002-20260812    gcc-13.4.0
sparc64              randconfig-001-20260812    gcc-15.2.0
sparc64              randconfig-002-20260812    gcc-13.4.0
um                   randconfig-001-20260812    clang-17
um                   randconfig-002-20260812    clang-20
x86_64              buildonly-randconfig-001    gcc-14
x86_64     buildonly-randconfig-001-20260812    gcc-14
x86_64     buildonly-randconfig-002-20260812    gcc-14
x86_64     buildonly-randconfig-003-20260812    clang-22
x86_64     buildonly-randconfig-003-20260812    gcc-14
x86_64     buildonly-randconfig-004-20260812    gcc-14
x86_64     buildonly-randconfig-005-20260812    gcc-14
x86_64     buildonly-randconfig-006-20260812    gcc-14
x86_64                                 kexec    clang-22
x86_64                        randconfig-001    gcc-14
x86_64               randconfig-001-20260812    clang-22
x86_64               randconfig-001-20260812    gcc-14
x86_64               randconfig-002-20260812    gcc-14
x86_64               randconfig-003-20260812    gcc-14
x86_64               randconfig-004-20260812    clang-22
x86_64               randconfig-004-20260812    gcc-14
x86_64               randconfig-005-20260812    clang-22
x86_64               randconfig-005-20260812    gcc-14
x86_64               randconfig-006-20260812    clang-22
x86_64               randconfig-006-20260812    gcc-14
x86_64               randconfig-011-20260812    clang-22
x86_64               randconfig-012-20260812    clang-22
x86_64               randconfig-013-20260812    clang-22
x86_64               randconfig-014-20260812    clang-22
x86_64               randconfig-014-20260812    gcc-14
x86_64               randconfig-015-20260812    clang-22
x86_64               randconfig-016-20260812    clang-22
x86_64               randconfig-071-20260812    clang-22
x86_64               randconfig-072-20260812    clang-22
x86_64               randconfig-073-20260812    clang-22
x86_64               randconfig-073-20260812    gcc-14
x86_64               randconfig-074-20260812    clang-22
x86_64               randconfig-075-20260812    clang-22
x86_64               randconfig-075-20260812    gcc-14
x86_64               randconfig-076-20260812    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260812    gcc-15.2.0
xtensa               randconfig-002-20260812    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
