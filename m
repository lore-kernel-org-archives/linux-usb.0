Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBD64195C3
	for <linux-usb@vger.kernel.org>; Thu,  9 Jul 2026 17:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783619380; cv=none; b=RJFH+6qwbd6U3fA5+/x+gMkithSbwoO0mkZ+WTWvMqlOrTf80naHvTuBBiYBPxb5ql+Pjdc6iDiyE3B8aZHeNEdBuYYmlKUOoD/SdMG1T3EIQN78Fb1C7RkcKiQvODfEXNRk0jDOUVaCHEUieBp+Fo3QgOsVnWxMPM0XAAXFDD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783619380; c=relaxed/simple;
	bh=vWN6gKB5yxQErnPfCmuKPsMpWn0lrRhtu6M736ZuDAM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Gi1NtSbjLeXc8SqkxV+pHxFSHLiZr4xq1TwEWUHgsT/aDxDKyjwh5bw412Acb84jCbrRRW6Jlym67OSw1elBY4U2tO49gPOzphaMMFdtlwp7d+5oGOnWI8k3U01zh60B+4EXUllIpstmPoHGawwN8WdXO0Vdzdo3Y6cao1/9O/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EaBDUG1e; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EaBDUG1e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783619378; x=1815155378;
  h=date:from:to:cc:subject:message-id;
  bh=vWN6gKB5yxQErnPfCmuKPsMpWn0lrRhtu6M736ZuDAM=;
  b=EaBDUG1eM9s7EXax2wVBh7eRNSvrXPJf6AlIyvJVG8WugVlN4arYzTk2
   XITS1WHwF6pG0KTOGT4u9FuhsJmaGHp5YsfWFqRxr2dxdETE9umt71Ixa
   WBIBohinOcbdLGGwDfVqHt/chH2VTjXOItVeyszHM1kMi7q5mn/unjXLV
   18c91FpYVFe8OuVzgl1XAsxVBW5nSsRDMF/RUUadREhZmK8f78WzQCotK
   bEsWbziW6jZLfrzCkF4SmJA30j7qyONtxGpffCeyhJFxZOwwhD9XYpySP
   8wSB/bzgWqwkIltLWDg+C7iC4QtpcszpS4y713H+jxWmDxNeKIeO6KGUE
   A==;
X-CSE-ConnectionGUID: 05fnr6RgReO5v8AX7uWSLg==
X-CSE-MsgGUID: 7ZKLgdWKSLafV39vhXEZtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83287691"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83287691"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 10:49:32 -0700
X-CSE-ConnectionGUID: 2KwiDXmbRHuVnT3SU1p8GA==
X-CSE-MsgGUID: 25doTPNCR+umKOYfk3dOSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="258266674"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 09 Jul 2026 10:49:31 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whssK-00000000Hxd-1mfA;
	Thu, 09 Jul 2026 17:49:28 +0000
Date: Fri, 10 Jul 2026 01:48:57 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD REGRESSION
 472ce6621e371aafc03c0704d1d940f51d8159db
Message-ID: <202607100143.XfuSEeUm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 472ce6621e371aafc03c0704d1d940f51d8159db  usb: dwc3: am62: Propagate USB2 refclk enable failures

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202607091951.ntkyb1Km-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202607092212.lINETdSF-lkp@intel.com

    ERROR: modpost: "__divdi3" [drivers/usb/typec/tcpm/tcpm.ko] undefined!
    ERROR: modpost: "__udivdi3" [drivers/usb/typec/tcpm/tcpm.ko] undefined!
    ld: tcpm.c:(.text+0x6764): undefined reference to `__udivdi3'
    tcpm.c:(.text+0x6743): undefined reference to `__udivdi3'

Error/Warning ids grouped by kconfigs:

recent_errors
|-- i386-buildonly-randconfig-005
|   |-- ld:tcpm.c:(.text):undefined-reference-to-__udivdi3
|   `-- tcpm.c:(.text):undefined-reference-to-__udivdi3
|-- i386-randconfig-015-20260709
|   `-- ERROR:__udivdi3-drivers-usb-typec-tcpm-tcpm.ko-undefined
|-- nios2-allmodconfig
|   |-- ERROR:__divdi3-drivers-usb-typec-tcpm-tcpm.ko-undefined
|   `-- ERROR:__udivdi3-drivers-usb-typec-tcpm-tcpm.ko-undefined
`-- nios2-randconfig-002
    |-- ERROR:__divdi3-drivers-usb-typec-tcpm-tcpm.ko-undefined
    `-- ERROR:__udivdi3-drivers-usb-typec-tcpm-tcpm.ko-undefined

elapsed time: 727m

configs tested: 223
configs skipped: 3

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260709    gcc-8.5.0
arc                   randconfig-002-20260709    gcc-8.5.0
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260709    gcc-8.5.0
arm                   randconfig-002-20260709    gcc-8.5.0
arm                   randconfig-003-20260709    gcc-8.5.0
arm                   randconfig-004-20260709    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260709    gcc-16.1.0
arm64                 randconfig-002-20260709    gcc-16.1.0
arm64                 randconfig-003-20260709    gcc-16.1.0
arm64                 randconfig-004-20260709    gcc-16.1.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260709    gcc-16.1.0
csky                  randconfig-002-20260709    gcc-16.1.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260709    clang-18
hexagon               randconfig-002-20260709    clang-18
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                 buildonly-randconfig-001    gcc-14
i386        buildonly-randconfig-001-20260709    gcc-14
i386                 buildonly-randconfig-002    gcc-14
i386        buildonly-randconfig-002-20260709    gcc-14
i386                 buildonly-randconfig-003    gcc-14
i386        buildonly-randconfig-003-20260709    gcc-14
i386                 buildonly-randconfig-004    gcc-14
i386        buildonly-randconfig-004-20260709    gcc-14
i386                 buildonly-randconfig-005    gcc-14
i386        buildonly-randconfig-005-20260709    gcc-14
i386                 buildonly-randconfig-006    gcc-14
i386        buildonly-randconfig-006-20260709    gcc-14
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260709    gcc-14
i386                  randconfig-002-20260709    gcc-14
i386                  randconfig-003-20260709    gcc-14
i386                  randconfig-004-20260709    gcc-14
i386                  randconfig-005-20260709    gcc-14
i386                  randconfig-006-20260709    gcc-14
i386                  randconfig-007-20260709    gcc-14
i386                           randconfig-011    gcc-14
i386                  randconfig-011-20260709    gcc-14
i386                           randconfig-012    gcc-14
i386                  randconfig-012-20260709    gcc-14
i386                           randconfig-013    gcc-14
i386                  randconfig-013-20260709    gcc-14
i386                           randconfig-014    gcc-14
i386                  randconfig-014-20260709    gcc-14
i386                           randconfig-015    gcc-14
i386                  randconfig-015-20260709    gcc-14
i386                           randconfig-016    gcc-14
i386                  randconfig-016-20260709    gcc-14
i386                           randconfig-017    gcc-14
i386                  randconfig-017-20260709    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260709    clang-18
loongarch             randconfig-002-20260709    clang-18
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                                defconfig    clang-23
m68k                      m54418evb_defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                      malta_kvm_defconfig    gcc-16.1.0
nios2                         10m50_defconfig    gcc-11.5.0
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260709    clang-18
nios2                 randconfig-002-20260709    clang-18
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260709    clang-23
parisc                randconfig-002-20260709    clang-23
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                   microwatt_defconfig    gcc-16.1.0
powerpc               randconfig-001-20260709    clang-23
powerpc               randconfig-002-20260709    clang-23
powerpc64             randconfig-001-20260709    clang-23
powerpc64             randconfig-002-20260709    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                          randconfig-001    clang-22
riscv                 randconfig-001-20260709    clang-22
riscv                          randconfig-002    clang-22
riscv                 randconfig-002-20260709    clang-22
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    clang-22
s390                  randconfig-001-20260709    clang-22
s390                           randconfig-002    clang-22
s390                  randconfig-002-20260709    clang-22
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-17
sh                                  defconfig    gcc-14
sh                             randconfig-001    clang-22
sh                    randconfig-001-20260709    clang-22
sh                             randconfig-002    clang-22
sh                    randconfig-002-20260709    clang-22
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260709    gcc-8.5.0
sparc                 randconfig-002-20260709    gcc-8.5.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260709    gcc-8.5.0
sparc64               randconfig-002-20260709    gcc-8.5.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260709    gcc-8.5.0
um                    randconfig-002-20260709    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64               buildonly-randconfig-001    clang-22
x86_64      buildonly-randconfig-001-20260709    clang-22
x86_64               buildonly-randconfig-002    clang-22
x86_64      buildonly-randconfig-002-20260709    clang-22
x86_64               buildonly-randconfig-003    clang-22
x86_64      buildonly-randconfig-003-20260709    clang-22
x86_64               buildonly-randconfig-004    clang-22
x86_64      buildonly-randconfig-004-20260709    clang-22
x86_64               buildonly-randconfig-005    clang-22
x86_64      buildonly-randconfig-005-20260709    clang-22
x86_64               buildonly-randconfig-006    clang-22
x86_64      buildonly-randconfig-006-20260709    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                         randconfig-001    clang-22
x86_64                randconfig-001-20260709    clang-22
x86_64                randconfig-001-20260709    gcc-14
x86_64                         randconfig-002    clang-22
x86_64                randconfig-002-20260709    clang-22
x86_64                randconfig-002-20260709    gcc-14
x86_64                         randconfig-003    clang-22
x86_64                randconfig-003-20260709    clang-22
x86_64                randconfig-003-20260709    gcc-14
x86_64                         randconfig-004    clang-22
x86_64                randconfig-004-20260709    clang-22
x86_64                randconfig-004-20260709    gcc-14
x86_64                         randconfig-005    clang-22
x86_64                randconfig-005-20260709    clang-22
x86_64                randconfig-005-20260709    gcc-14
x86_64                         randconfig-006    clang-22
x86_64                randconfig-006-20260709    clang-22
x86_64                randconfig-006-20260709    gcc-14
x86_64                         randconfig-011    gcc-14
x86_64                randconfig-011-20260709    gcc-14
x86_64                         randconfig-012    gcc-14
x86_64                randconfig-012-20260709    gcc-14
x86_64                         randconfig-013    gcc-14
x86_64                randconfig-013-20260709    gcc-14
x86_64                         randconfig-014    gcc-14
x86_64                randconfig-014-20260709    gcc-14
x86_64                         randconfig-015    gcc-14
x86_64                randconfig-015-20260709    gcc-14
x86_64                         randconfig-016    gcc-14
x86_64                randconfig-016-20260709    gcc-14
x86_64                         randconfig-071    clang-22
x86_64                randconfig-071-20260709    clang-22
x86_64                         randconfig-072    clang-22
x86_64                randconfig-072-20260709    clang-22
x86_64                         randconfig-073    clang-22
x86_64                randconfig-073-20260709    clang-22
x86_64                         randconfig-074    clang-22
x86_64                randconfig-074-20260709    clang-22
x86_64                         randconfig-075    clang-22
x86_64                randconfig-075-20260709    clang-22
x86_64                         randconfig-076    clang-22
x86_64                randconfig-076-20260709    clang-22
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-20
xtensa                          iss_defconfig    gcc-16.1.0
xtensa                randconfig-001-20260709    gcc-8.5.0
xtensa                randconfig-002-20260709    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
