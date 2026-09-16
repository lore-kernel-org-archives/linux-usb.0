Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A005AEEC0
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 05:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789538042; cv=none; b=Sjjc72WI3dPAnG1t+GOjnl0G2VEU0/OdYdS+g5gwUjqB2cDvdKZXYYMMcKfHjYN2AkDNVq5ga6xTh/FuSfSqVMy5ad2oHF+72WFpll1xshaGI2+rMtg8Ki4Ch7h5imyXR+FYXJsOhWpQ0dDjZvK7X6kVYJn5VJPzXkDf7YfeCOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789538042; c=relaxed/simple;
	bh=3/JvNAlwiT0DJuJQj3ut/ATftcyqSCHeYqr681Z4Ids=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mAMP7MNmP/kFz2IKMGSOwfyl/dRxpmm33MOm3ag+FLDbmUzmj9ASB46oxzPFR/EVXZ4Jj3NlDhfNxRbJs5uMsIE5YHIx3JGoJlbmdueIyzcsBWdxfhZ6NuHV29rFrXjf4yhLBrAcnC5lLBtG6aFbzcMFJtYyetUO9gCweuZ7NnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UOlc8TcA; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UOlc8TcA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789538041; x=1821074041;
  h=date:from:to:cc:subject:message-id;
  bh=3/JvNAlwiT0DJuJQj3ut/ATftcyqSCHeYqr681Z4Ids=;
  b=UOlc8TcARV6ARoWtqzv8f7q2kvXzPuwXeXa6+82AvoePA02BXuYEjOSm
   gsTMWtpBHsRvq4e1VJ9a5Vk3WkaGteIa2iaEHcfoagJwWYyJqnCMksnr/
   jOmnt6R4yx99JQL0r4JYpnlkrMFV+MubSvruu5INfknNeVcPVlfnLEgGg
   d+3VRxXJe3TPRM1PJSjbu91Us3Ja1KLyfW1+whRw6bpOEwBKmoeZCEkMN
   4WcSpypiNw0tVLmI1InncPBOV5pwpQmtINjGmGht4z+okz0lNog2NuZDN
   CY6dimRtow1ON/Of6fs4f9cd3KOalWHdPPKX+GYqpoJSJeB0iM6EIU66R
   A==;
X-CSE-ConnectionGUID: uzNO1xKDRQOuPNm5ggwdlw==
X-CSE-MsgGUID: wUUQ3aQpRummHh8z9orGBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101426310"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101426310"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 22:54:00 -0700
X-CSE-ConnectionGUID: QjCdqYh3RN+lM0+sXqpgew==
X-CSE-MsgGUID: /XvCy/rSTUe0yGt0P78Q7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="303121558"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Sep 2026 22:53:59 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6iai-000000005ZH-1HhQ;
	Wed, 16 Sep 2026 05:53:56 +0000
Date: Wed, 16 Sep 2026 13:53:08 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:fixes] BUILD SUCCESS
 80756e263846ab694984e749e8c626897331438f
Message-ID: <202609161305.spsGnmCz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git fixes
branch HEAD: 80756e263846ab694984e749e8c626897331438f  thunderbolt: Reject oversized XDomain properties responses

elapsed time: 1102m

configs tested: 358
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
alpha                randconfig-r061-20260914    gcc-16.1.0
alpha                randconfig-r073-20260915    gcc-14.3.0
arc                              allmodconfig    clang-24
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-24
arc                                 defconfig    gcc-16.1.0
arc                 nsimosci_hs_smp_defconfig    clang-20
arc                   randconfig-001-20260916    clang-24
arc                   randconfig-002-20260916    clang-24
arc                  randconfig-r054-20260914    gcc-8.5.0
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
arm                  randconfig-r062-20260914    gcc-16.1.0
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
arm64                randconfig-r052-20260914    gcc-8.5.0
arm64                randconfig-r063-20260914    gcc-8.5.0
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
i386                  randconfig-051-20260914    gcc-14
i386                  randconfig-051-20260915    clang-22
i386                  randconfig-052-20260914    clang-22
i386                  randconfig-052-20260915    clang-22
i386                  randconfig-053-20260914    clang-22
i386                  randconfig-053-20260914    gcc-14
i386                  randconfig-053-20260915    clang-22
i386                  randconfig-054-20260914    clang-22
i386                  randconfig-054-20260914    gcc-14
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
m68k                 randconfig-r054-20260914    gcc-8.5.0
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
mips                 randconfig-r064-20260914    gcc-16.1.0
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
nios2                randconfig-r062-20260914    gcc-16.1.0
nios2                randconfig-r063-20260915    gcc-13
nios2                randconfig-r064-20260914    gcc-14
nios2                randconfig-r073-20260914    gcc-11.5.0
openrisc                         alldefconfig    clang-24
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-24
openrisc                            defconfig    gcc-16.1.0
openrisc             randconfig-r051-20260914    gcc-16.1.0
openrisc             randconfig-r052-20260914    gcc-14.3.0
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
parisc               randconfig-r064-20260914    gcc-12.5.0
parisc               randconfig-r071-20260914    gcc-13.4.0
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
powerpc              randconfig-r073-20260914    gcc-14.3.0
powerpc              randconfig-r113-20260916    gcc-12.5.0 sparse
powerpc              randconfig-r122-20260916    clang-24 sparse
powerpc                         wii_defconfig    gcc-16.1.0
powerpc64             randconfig-001-20260915    gcc-8.5.0
powerpc64             randconfig-001-20260916    clang-24
powerpc64             randconfig-002-20260915    gcc-8.5.0
powerpc64             randconfig-002-20260916    clang-24
powerpc64            randconfig-r051-20260914    gcc-8.5.0
powerpc64            randconfig-r053-20260914    gcc-8.5.0
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
sparc                randconfig-r073-20260914    gcc-15.2.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260915    gcc-13.4.0
sparc64               randconfig-001-20260916    gcc-14.3.0
sparc64               randconfig-002-20260915    gcc-13.4.0
sparc64               randconfig-002-20260916    gcc-14.3.0
sparc64              randconfig-r052-20260914    clang-22
sparc64              randconfig-r064-20260914    clang-22
sparc64              randconfig-r072-20260914    clang-24
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
x86_64               randconfig-r063-20260914    gcc-16.1.0
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
xtensa               randconfig-r053-20260914    gcc-10.5.0
xtensa               randconfig-r061-20260914    gcc-10.5.0
xtensa               randconfig-r061-20260914    gcc-16.1.0
xtensa               randconfig-r131-20260916    gcc-11.5.0 sparse
xtensa                    smp_lx200_defconfig    clang-24

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
