Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9940C3ED5CD
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 18:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789928821; cv=none; b=IxK/TU48t6+NlqOYQ8GEkhkUt5hANhVRwnDV9tWRf2tTlYCLHhpCqeYbvDKt/bzlii8wOwd5PMmD7hxgZ9HMYi0xVgSltl/Q7mgT8reZjEZMXXQotUJChnnbVMT955syWnQ6+rlMtxRek+/CVaz1gp3gcQGKsU+vNRVQpGGrhQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789928821; c=relaxed/simple;
	bh=X+cpO5aoWyX5nb1sH4ROAV3kPbwW1Qzi3bqQqXWRsEU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lsKfC5TytokbVVyVnvoY8IUorC53dK2VVAWjV/L5bPJm9JELsu1Tm9RDkTMfeh9AA8jrmXcL2V5uXt5W5OYzlgB237PmEAPsPC/GOsrE+flOPVkT/fSquieGCrp6Vwp/6uI6+54vjzAPwzg57RyBXxrqBSyBw0nH9HnKikDJPaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N4OXNHPK; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N4OXNHPK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789928819; x=1821464819;
  h=date:from:to:cc:subject:message-id;
  bh=X+cpO5aoWyX5nb1sH4ROAV3kPbwW1Qzi3bqQqXWRsEU=;
  b=N4OXNHPKk2IiBE+57GdlIDEKkN34IzvmklD5ZjXgpHSkBtYjxAi6xrMW
   t5l/JO73v6m9hTdKaLjKOZ3yH2Wsrj1c7tsp80UEkGDlzJN4triMeHMQZ
   Y8bIWb1R3QN/sxifZgIqWI29/fiovWL8kFNL1o9H/ju6wzUdk7jaIioiI
   X3y8m9OPxLqX/UIgivhNqPy8tZBO1An+12ITcswrUQm2MUG94ELW4pvFL
   IjrmMEPG+aRaRsELhhGn5sAt13C6+TZUOhJYOBs6PDFK1+xSuN3aVMH2k
   Vs57pvMqh+jCmC8PTIZtOptgIJacd1DvEkQdc8VONgvwNweqTmFXVEWlB
   A==;
X-CSE-ConnectionGUID: V+AnhT3oRtybpeX3Sn7HHw==
X-CSE-MsgGUID: 8GMxCdV1TGqvYhF3uFi6NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="89558730"
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="89558730"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 11:26:58 -0700
X-CSE-ConnectionGUID: ZQWTPWteS/KKqg+0g/3nUA==
X-CSE-MsgGUID: g9avUJnNTpO6NxmqWcIIxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="271481554"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Sep 2026 11:26:57 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8MFa-00000000Chv-1hdh;
	Sun, 20 Sep 2026 18:26:54 +0000
Date: Mon, 21 Sep 2026 02:26:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 d58dffe9ee2c8883193959ff4ef995ec07932874
Message-ID: <202609210220.P53MfBQY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: d58dffe9ee2c8883193959ff4ef995ec07932874  USB: core: amend usb_get_from_anchor() kernel-doc

elapsed time: 1642m

configs tested: 182
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2103-20260917    gcc-8.5.0
arc                               allmodconfig    gcc-16.1.0
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arm                                allnoconfig    clang-17
arm                               allyesconfig    gcc-16.1.0
arm                        aspeed_g4_defconfig    clang-20
arm                                  defconfig    clang-24
arm                          orion5x_defconfig    clang-21
arm                  randconfig-r1308-20260920    clang-24   sparse
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260920    gcc-15.2.0
arm64                 randconfig-1001-20260920    clang-24
arm64                randconfig-r1303-20260920    clang-24   sparse
arm64                randconfig-r1309-20260920    clang-17   sparse
arm64                randconfig-r2202-20260917    gcc-16.1.0
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260920    gcc-12.5.0
csky                  randconfig-1001-20260920    gcc-14.3.0
csky                 randconfig-r1305-20260920    gcc-9.5.0  sparse
hexagon                           allmodconfig    clang-24
hexagon                            allnoconfig    clang-24
hexagon                              defconfig    clang-24
hexagon              randconfig-r1307-20260920    clang-24   sparse
hexagon              randconfig-r2106-20260917    clang-17
hexagon              randconfig-r2107-20260917    clang-17
i386                              allmodconfig    gcc-14
i386                               allnoconfig    gcc-14
i386                              allyesconfig    gcc-14
i386        buildonly-randconfig-1000-20260920    clang-22
i386        buildonly-randconfig-1001-20260920    clang-22
i386        buildonly-randconfig-1002-20260920    clang-22
i386        buildonly-randconfig-1003-20260920    gcc-14
i386        buildonly-randconfig-1004-20260920    clang-22
i386        buildonly-randconfig-1005-20260920    clang-22
i386                                 defconfig    clang-22
i386                  randconfig-1000-20260920    clang-22
i386                  randconfig-1001-20260920    gcc-14
i386                  randconfig-1002-20260920    gcc-14
i386                  randconfig-1003-20260920    clang-22
i386                  randconfig-1004-20260920    gcc-14
i386                  randconfig-1005-20260920    gcc-14
i386                  randconfig-1006-20260920    clang-22
i386                  randconfig-1007-20260920    gcc-12
i386                  randconfig-1009-20260920    clang-22
i386                  randconfig-1010-20260920    clang-22
i386                  randconfig-1011-20260920    gcc-14
i386                  randconfig-1012-20260920    gcc-14
i386                  randconfig-1013-20260920    clang-22
i386                 randconfig-r2200-20260917    clang-22
loongarch                         allmodconfig    clang-19
loongarch                          allnoconfig    clang-20
loongarch                            defconfig    clang-24
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    gcc-16.1.0
m68k                                 defconfig    gcc-16.1.0
m68k                         mvme16x_defconfig    gcc-16.1.0
m68k                 randconfig-r1304-20260920    gcc-14.3.0 sparse
m68k                 randconfig-r1306-20260920    gcc-14.3.0 sparse
m68k                 randconfig-r1309-20260920    gcc-16.1.0 sparse
m68k                           sun3x_defconfig    gcc-16.1.0
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    gcc-16.1.0
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                       pic32mzda_defconfig    gcc-16.1.0
nios2                             allmodconfig    gcc-11.5.0
nios2                              allnoconfig    gcc-11.5.0
nios2                                defconfig    gcc-11.5.0
openrisc                          allmodconfig    gcc-16.1.0
openrisc                           allnoconfig    gcc-16.1.0
openrisc                             defconfig    gcc-16.1.0
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    gcc-16.1.0
parisc                            allyesconfig    gcc-16.1.0
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260920    gcc-14.3.0
parisc                randconfig-1001-20260920    gcc-8.5.0
parisc64                             defconfig    gcc-16.1.0
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    gcc-16.1.0
powerpc                        ebony_defconfig    clang-24
powerpc                    microwatt_defconfig    gcc-16.1.0
powerpc                  mpc834x_itx_defconfig    clang-24
powerpc               randconfig-1000-20260920    gcc-8.5.0
powerpc               randconfig-1001-20260920    clang-24
powerpc              randconfig-r1306-20260920    clang-21   sparse
powerpc                      redwood_defconfig    clang-24
powerpc                     sam440ep_defconfig    gcc-16.1.0
powerpc                      tqm8540_defconfig    gcc-16.1.0
powerpc64             randconfig-1000-20260920    clang-24
powerpc64             randconfig-1001-20260920    clang-22
powerpc64            randconfig-r1308-20260920    clang-24   sparse
powerpc64            randconfig-r2101-20260917    gcc-8.5.0
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    gcc-16.1.0
riscv                             allyesconfig    clang-24
riscv                                defconfig    clang-24
riscv                 randconfig-1000-20260920    gcc-13.4.0
riscv                 randconfig-1001-20260920    gcc-15.2.0
riscv                 randconfig-2000-20260917    clang-24
riscv                 randconfig-2001-20260917    clang-17
riscv                randconfig-r2104-20260917    clang-24
s390                              allmodconfig    clang-24
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    clang-18
s390                  randconfig-1000-20260920    gcc-8.5.0
s390                  randconfig-1001-20260920    clang-20
s390                  randconfig-2000-20260917    clang-17
s390                  randconfig-2001-20260917    clang-24
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    gcc-16.1.0
sh                                allyesconfig    gcc-16.1.0
sh                                   defconfig    gcc-16.1.0
sh                      magicpanelr2_defconfig    gcc-16.1.0
sh                           r7785rp_defconfig    gcc-16.1.0
sh                    randconfig-1000-20260920    gcc-16.1.0
sh                    randconfig-1001-20260920    gcc-10.5.0
sh                    randconfig-2000-20260917    gcc-14.3.0
sh                    randconfig-2001-20260917    gcc-16.1.0
sh                         sh7763rdp_defconfig    gcc-16.1.0
sparc                             alldefconfig    gcc-16.1.0
sparc                              allnoconfig    gcc-16.1.0
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260920    gcc-12.5.0
sparc                 randconfig-1001-20260920    gcc-14.3.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    clang-24
sparc64               randconfig-1000-20260920    gcc-13.4.0
sparc64               randconfig-1001-20260920    clang-24
sparc64              randconfig-r2100-20260917    clang-24
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-17
um                                allyesconfig    gcc-14
um                                   defconfig    clang-24
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260920    clang-21
um                    randconfig-1001-20260920    clang-17
um                   randconfig-r1301-20260920    clang-24   sparse
um                   randconfig-r2105-20260917    gcc-14
um                            x86_64_defconfig    clang-24
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-22
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20260920    gcc-14
x86_64      buildonly-randconfig-1001-20260920    gcc-14
x86_64      buildonly-randconfig-1002-20260920    gcc-14
x86_64      buildonly-randconfig-1003-20260920    clang-22
x86_64      buildonly-randconfig-1004-20260920    clang-22
x86_64      buildonly-randconfig-1005-20260920    gcc-14
x86_64                               defconfig    gcc-14
x86_64                randconfig-1006-20260920    gcc-14
x86_64                randconfig-1007-20260920    gcc-14
x86_64                randconfig-1008-20260920    gcc-14
x86_64                randconfig-1009-20260920    gcc-14
x86_64                randconfig-1010-20260920    gcc-14
x86_64                randconfig-1011-20260920    gcc-14
x86_64                randconfig-2100-20260917    clang-22
x86_64                randconfig-2101-20260917    gcc-14
x86_64                randconfig-2102-20260917    gcc-14
x86_64                randconfig-2103-20260917    gcc-13
x86_64                randconfig-2200-20260917    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    gcc-16.1.0
xtensa                            allyesconfig    gcc-16.1.0
xtensa                randconfig-1000-20260920    gcc-10.5.0
xtensa                randconfig-1001-20260920    gcc-8.5.0
xtensa               randconfig-r1302-20260920    gcc-13.4.0 sparse
xtensa               randconfig-r2102-20260917    gcc-8.5.0
xtensa                     smp_lx200_defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
