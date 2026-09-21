Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A65C459AF9
	for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 08:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789980845; cv=none; b=fiSTzT8aGbAsQH9DYHwriuINgSFWFOnflnCHg35Hj3obXulDM2DaaawgKlRGom3cq1LsrAKf1/LfLmNLjBgIG/5PjEUddzqkJ3TCOxLRHdQtoPx68f70gr3WX+xqezmH2F/dqYjGwp5dMAu5GaPflyI23RBPzyekXEDJt17lIBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789980845; c=relaxed/simple;
	bh=v6YgM3BcMQIWNoCmJVPTDTmH4Z4RbJ/YOYx9ku0xT/I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NmHGOUGNOtRXQr5VEkBFa8ORcE5y/1pFt88+/B+0SMPC0aKXGR1osGfAnyrNQjomxQhXfYsv7yPZ6mr2y9yGCJgs7hRki6akQVv+EXrh7s1BDaV+pUz6Dr20vTMDmC+YoyIoVwDRDXrN1lyICBbesF2yDST2M95q9fFweu/G7WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gDZeDTsT; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gDZeDTsT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789980842; x=1821516842;
  h=date:from:to:cc:subject:message-id;
  bh=v6YgM3BcMQIWNoCmJVPTDTmH4Z4RbJ/YOYx9ku0xT/I=;
  b=gDZeDTsTkFOmX5U2dssb0Sfuk7xEShH/ucQJ4w6zwv6O/blhfzmCob42
   OyRijqGSWSXHVRr7F5O6tN1LDz2v1iisHJN2zJRZ3UJ72sQY5qLVuwjpR
   hjIXvjujNkNLsth2THaEH2qS8pl7Is1KW12pmDyaAdW25eioxRyjAR2kQ
   SOtP1iCAcKviA3sooGWt789GyF31MZieW1rsromOII8Edsf3RAVt25LrE
   Zhuh/IesWsypJOs4bMOQ2cZUfUzwJ+fbCl7SsAn/Qj8uvqFMNsowU/uwJ
   62sH6Out3KTeKjoLMN0qZtY2sESC3GL8hiE0o/0f2CknTnNd6WvN7v8LR
   g==;
X-CSE-ConnectionGUID: DrOk+HskQPywkkx0D9epgg==
X-CSE-MsgGUID: iiNk+WAURAybtXVIRnw/qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="94306402"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="94306402"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 01:54:01 -0700
X-CSE-ConnectionGUID: Y41fmFvFTT+Fx0Xz97whSA==
X-CSE-MsgGUID: pKFsWmWPRfWFEqRBXnd+5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="272033214"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Sep 2026 01:54:00 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8Zmf-00000000DWj-1cuZ;
	Mon, 21 Sep 2026 08:53:57 +0000
Date: Mon, 21 Sep 2026 16:53:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 abc36cbda29d8f19cf3a580cd86ca9e865186a41
Message-ID: <202609211612.8kbvNTFE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: abc36cbda29d8f19cf3a580cd86ca9e865186a41  Merge tag 'usb-serial-7.3-rc4' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

elapsed time: 2508m

configs tested: 189
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2106-20260918    gcc-9.5.0
arc                               allmodconfig    gcc-16.1.0
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20260921    gcc-9.5.0
arc                   randconfig-1001-20260921    gcc-15.2.0
arc                  randconfig-r1309-20260920    gcc-15.2.0 sparse
arm                                allnoconfig    clang-17
arm                               allyesconfig    gcc-16.1.0
arm                        aspeed_g4_defconfig    clang-20
arm                                  defconfig    clang-24
arm                             hisi_defconfig    gcc-16.1.0
arm                   randconfig-1000-20260921    clang-24
arm                   randconfig-1001-20260921    gcc-13.4.0
arm                   randconfig-1002-20260921    gcc-15.2.0
arm                   randconfig-1003-20260921    clang-24
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260921    clang-24
arm64                 randconfig-1001-20260921    clang-24
arm64                 randconfig-1002-20260921    clang-24
arm64                 randconfig-1003-20260921    gcc-16.1.0
arm64                randconfig-r2105-20260918    clang-21
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260921    gcc-9.5.0
csky                  randconfig-1001-20260921    gcc-11.5.0
hexagon                           allmodconfig    clang-24
hexagon                            allnoconfig    clang-24
hexagon                              defconfig    clang-24
hexagon               randconfig-1000-20260921    clang-18
hexagon               randconfig-1001-20260921    clang-17
hexagon              randconfig-r1302-20260921    clang-18   sparse
hexagon              randconfig-r1307-20260920    clang-24   sparse
i386                               allnoconfig    gcc-14
i386        buildonly-randconfig-1000-20260920    clang-22
i386        buildonly-randconfig-1001-20260920    clang-22
i386        buildonly-randconfig-1002-20260920    clang-22
i386        buildonly-randconfig-1003-20260920    gcc-14
i386        buildonly-randconfig-1004-20260920    clang-22
i386        buildonly-randconfig-1005-20260920    clang-22
i386                                 defconfig    clang-22
i386                  randconfig-2100-20260918    clang-22
i386                  randconfig-2101-20260918    gcc-14
i386                  randconfig-2102-20260918    clang-22
i386                  randconfig-2103-20260918    clang-22
i386                  randconfig-2200-20260918    clang-22
i386                 randconfig-r1305-20260921    gcc-14     sparse
i386                 randconfig-r1306-20260920    gcc-14     sparse
i386                 randconfig-r2100-20260918    clang-22
loongarch                         allmodconfig    clang-19
loongarch                          allnoconfig    clang-20
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20260921    clang-18
loongarch             randconfig-1001-20260921    gcc-16.1.0
loongarch            randconfig-r1300-20260921    clang-19   sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    gcc-16.1.0
m68k                           atari_defconfig    gcc-16.1.0
m68k                                 defconfig    gcc-16.1.0
m68k                         m5307c3_defconfig    gcc-16.1.0
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    gcc-16.1.0
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                            ip30_defconfig    gcc-16.1.0
nios2                             allmodconfig    gcc-11.5.0
nios2                              allnoconfig    gcc-11.5.0
nios2                                defconfig    gcc-11.5.0
nios2                 randconfig-1000-20260921    gcc-8.5.0
nios2                 randconfig-1001-20260921    gcc-11.5.0
nios2                randconfig-r1303-20260921    gcc-8.5.0  sparse
openrisc                          allmodconfig    gcc-16.1.0
openrisc                           allnoconfig    gcc-16.1.0
openrisc                    de0_nano_defconfig    gcc-16.1.0
openrisc                             defconfig    gcc-16.1.0
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    gcc-16.1.0
parisc                            allyesconfig    gcc-16.1.0
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260920    gcc-14.3.0
parisc                randconfig-1001-20260920    gcc-8.5.0
parisc               randconfig-r2102-20260918    gcc-8.5.0
parisc               randconfig-r2103-20260918    gcc-10.5.0
parisc64                             defconfig    gcc-16.1.0
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    gcc-16.1.0
powerpc               randconfig-1000-20260920    gcc-8.5.0
powerpc               randconfig-1001-20260920    clang-24
powerpc              randconfig-r2101-20260918    gcc-12.5.0
powerpc64             randconfig-1000-20260920    clang-24
powerpc64             randconfig-1001-20260920    clang-22
powerpc64            randconfig-r2107-20260918    clang-24
powerpc64            randconfig-r2201-20260918    clang-24
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    gcc-16.1.0
riscv                             allyesconfig    clang-24
riscv                                defconfig    clang-24
riscv                 randconfig-1000-20260920    gcc-13.4.0
riscv                 randconfig-1001-20260920    gcc-15.2.0
riscv                 randconfig-2000-20260918    gcc-12.5.0
riscv                 randconfig-2001-20260918    clang-24
riscv                randconfig-r2200-20260918    clang-21
s390                              allmodconfig    clang-24
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    clang-18
s390                  randconfig-1000-20260920    gcc-8.5.0
s390                  randconfig-1001-20260920    clang-20
s390                  randconfig-2000-20260918    gcc-8.5.0
s390                  randconfig-2001-20260918    clang-17
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    gcc-16.1.0
sh                                allyesconfig    gcc-16.1.0
sh                                   defconfig    gcc-16.1.0
sh                    randconfig-1000-20260920    gcc-16.1.0
sh                    randconfig-1001-20260920    gcc-10.5.0
sh                    randconfig-2000-20260918    gcc-13.4.0
sh                    randconfig-2001-20260918    gcc-11.5.0
sh                            se7751_defconfig    gcc-16.1.0
sh                            sh2007_defconfig    gcc-16.1.0
sparc                              allnoconfig    gcc-16.1.0
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260921    gcc-8.5.0
sparc                 randconfig-1001-20260921    gcc-11.5.0
sparc                 randconfig-2000-20260918    gcc-8.5.0
sparc                 randconfig-2001-20260918    gcc-11.5.0
sparc                randconfig-r1301-20260921    gcc-8.5.0  sparse
sparc                randconfig-r1304-20260921    gcc-11.5.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    clang-24
sparc64               randconfig-1000-20260921    clang-21
sparc64               randconfig-1001-20260921    clang-22
sparc64               randconfig-2000-20260918    gcc-8.5.0
sparc64               randconfig-2001-20260918    clang-20
sparc64              randconfig-r2202-20260918    clang-24
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-17
um                                allyesconfig    gcc-14
um                                   defconfig    clang-24
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260921    gcc-14
um                    randconfig-1001-20260921    gcc-14
um                    randconfig-2000-20260918    gcc-14
um                    randconfig-2001-20260918    gcc-14
um                            x86_64_defconfig    clang-24
x86_64                             allnoconfig    clang-22
x86_64      buildonly-randconfig-1000-20260921    clang-22
x86_64      buildonly-randconfig-1001-20260921    gcc-13
x86_64      buildonly-randconfig-1002-20260921    clang-22
x86_64      buildonly-randconfig-1003-20260921    clang-22
x86_64      buildonly-randconfig-1004-20260921    clang-22
x86_64      buildonly-randconfig-1005-20260921    clang-22
x86_64                               defconfig    gcc-14
x86_64                randconfig-1006-20260921    gcc-14
x86_64                randconfig-1007-20260921    clang-22
x86_64                randconfig-1008-20260921    clang-22
x86_64                randconfig-1009-20260921    clang-22
x86_64                randconfig-1010-20260921    gcc-14
x86_64                randconfig-1011-20260921    clang-22
x86_64                randconfig-1012-20260921    clang-22
x86_64                randconfig-1013-20260921    clang-22
x86_64                randconfig-1014-20260921    clang-22
x86_64                randconfig-1015-20260921    clang-22
x86_64                randconfig-1016-20260921    clang-22
x86_64                randconfig-1017-20260921    gcc-12
x86_64                randconfig-2100-20260918    clang-22
x86_64                randconfig-2101-20260918    clang-22
x86_64                randconfig-2102-20260918    gcc-14
x86_64                randconfig-2103-20260918    clang-22
x86_64                randconfig-2200-20260918    gcc-14
x86_64               randconfig-r2104-20260918    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    gcc-16.1.0
xtensa                            allyesconfig    gcc-16.1.0
xtensa                randconfig-1000-20260921    gcc-11.5.0
xtensa                randconfig-1001-20260921    gcc-9.5.0
xtensa                randconfig-2000-20260918    gcc-8.5.0
xtensa                randconfig-2001-20260918    gcc-13.4.0
xtensa               randconfig-r1308-20260920    gcc-9.5.0  sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
