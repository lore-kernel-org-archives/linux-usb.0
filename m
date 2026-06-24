Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5EB33BBBA
	for <linux-usb@vger.kernel.org>; Wed, 24 Jun 2026 16:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782319521; cv=none; b=CV53TbxIvC98q6MtpOtEYp00mY258NF7BEKm9NcDX5aP/4E7nK8bhKExacunK0RbCJXo1iSQ/VOIBFIVOEjt95l8ztLyusrUxMgc62IQgyQJjlGos/lnRZXDJOS9rRjGFfm19hxm1roHEouVGDxzT9XNX97Zp9RrWPbA3imrrZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782319521; c=relaxed/simple;
	bh=otxIjdiUmR0kD+MtlmLc6ccQi3ddcjPMQSKwibqykxU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fx9XzAqhxvinK7USWrAPWH2jMOpBK4d3wGidkASDGO4edNTmHfs4iiCuyOgJFLQSZ7BlYzzFT4UyfOxJBscd9r2k1l1y1i39XmWpkvhY+nph32iIrQVbkECoytQLlqV8FTE5LFacGn15/g81Xzf/ejOKmA2PPkRFq2u6sxACPQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bBNWMXez; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bBNWMXez"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782319520; x=1813855520;
  h=date:from:to:cc:subject:message-id;
  bh=otxIjdiUmR0kD+MtlmLc6ccQi3ddcjPMQSKwibqykxU=;
  b=bBNWMXezfrnx+Ts0Z1wYDj2lmcEmdB1isp6sLj+l23Nh+1cevjMsVImr
   INzXbpAgCymjBGyYNXPjXSWY8I73AVkHgviX6f34QJIC6bHlhCz8304OR
   76mR1XGZ+DV/sr2VZWxA0vtltnaGfdbwAfM83gqULfhZCJhwIVP+GvYpp
   mlaFkKzqzxwx8d2NHls5MGfbuIx6PHFR2DWTMVJLk6dAFYTpqaB50ZXHl
   0biz7ivqkp5zBzv1uA/0d6dMt0vw7exK06cvVRDhtiwubpYZgJZsRVZTd
   dIy1MRuU6SlfUkEWk8OYqudDJMERQw07e0FsFnEpWdnrwjSTunIPwxELc
   A==;
X-CSE-ConnectionGUID: xWFK0zhvTHmKjzkjjvx6tw==
X-CSE-MsgGUID: Wtu5y3B0RrGbwAFzMbHT7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="93741649"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="93741649"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 09:45:19 -0700
X-CSE-ConnectionGUID: vAbjCZtrRuCsyqgFgHFL/w==
X-CSE-MsgGUID: CvrelpsATyqZ1NjIu9frEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="274050524"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 24 Jun 2026 09:45:18 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcQix-000000003Wp-2lSL;
	Wed, 24 Jun 2026 16:45:15 +0000
Date: Thu, 25 Jun 2026 00:44:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 b95e3c7c9118c38629718e3a075ae6fbbde04122
Message-ID: <202606250022.q1ANkb2F-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: b95e3c7c9118c38629718e3a075ae6fbbde04122  xhci: dbc: support runtime suspend while DbC is in enabled state

elapsed time: 1448m

configs tested: 248
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260624    gcc-15.2.0
arc                   randconfig-002-20260624    gcc-15.2.0
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260624    gcc-15.2.0
arm                   randconfig-002-20260624    gcc-15.2.0
arm                   randconfig-003-20260624    gcc-15.2.0
arm                   randconfig-004-20260624    gcc-15.2.0
arm                           sama5_defconfig    gcc-16.1.0
arm                           tegra_defconfig    gcc-16.1.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    clang-23
arm64                 randconfig-001-20260624    clang-21
arm64                 randconfig-001-20260624    clang-23
arm64                          randconfig-002    clang-23
arm64                 randconfig-002-20260624    clang-21
arm64                 randconfig-002-20260624    clang-23
arm64                          randconfig-003    clang-23
arm64                 randconfig-003-20260624    clang-21
arm64                 randconfig-003-20260624    clang-23
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260624    clang-21
arm64                 randconfig-004-20260624    clang-23
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    clang-23
csky                  randconfig-001-20260624    clang-21
csky                  randconfig-001-20260624    clang-23
csky                           randconfig-002    clang-23
csky                  randconfig-002-20260624    clang-21
csky                  randconfig-002-20260624    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260624    gcc-11.5.0
hexagon               randconfig-001-20260624    gcc-9.5.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260624    gcc-11.5.0
hexagon               randconfig-002-20260624    gcc-9.5.0
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                 buildonly-randconfig-001    gcc-12
i386        buildonly-randconfig-001-20260624    gcc-12
i386                 buildonly-randconfig-002    gcc-12
i386        buildonly-randconfig-002-20260624    gcc-12
i386                 buildonly-randconfig-003    gcc-12
i386        buildonly-randconfig-003-20260624    gcc-12
i386                 buildonly-randconfig-004    gcc-12
i386        buildonly-randconfig-004-20260624    gcc-12
i386                 buildonly-randconfig-005    gcc-12
i386        buildonly-randconfig-005-20260624    gcc-12
i386                 buildonly-randconfig-006    gcc-12
i386        buildonly-randconfig-006-20260624    gcc-12
i386                                defconfig    gcc-16.1.0
i386                           randconfig-001    clang-22
i386                  randconfig-001-20260624    clang-22
i386                           randconfig-002    clang-22
i386                  randconfig-002-20260624    clang-22
i386                           randconfig-003    clang-22
i386                  randconfig-003-20260624    clang-22
i386                           randconfig-004    clang-22
i386                  randconfig-004-20260624    clang-22
i386                           randconfig-005    clang-22
i386                  randconfig-005-20260624    clang-22
i386                           randconfig-006    clang-22
i386                  randconfig-006-20260624    clang-22
i386                           randconfig-007    clang-22
i386                  randconfig-007-20260624    clang-22
i386                           randconfig-011    clang-22
i386                  randconfig-011-20260624    clang-22
i386                           randconfig-012    clang-22
i386                  randconfig-012-20260624    clang-22
i386                           randconfig-013    clang-22
i386                  randconfig-013-20260624    clang-22
i386                           randconfig-014    clang-22
i386                  randconfig-014-20260624    clang-22
i386                           randconfig-015    clang-22
i386                  randconfig-015-20260624    clang-22
i386                           randconfig-016    clang-22
i386                  randconfig-016-20260624    clang-22
i386                           randconfig-017    clang-22
i386                  randconfig-017-20260624    clang-22
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260624    gcc-11.5.0
loongarch             randconfig-001-20260624    gcc-9.5.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260624    gcc-11.5.0
loongarch             randconfig-002-20260624    gcc-9.5.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                                defconfig    clang-23
m68k                        stmark2_defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                           mtx1_defconfig    clang-19
mips                        omega2p_defconfig    clang-17
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-23
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260624    gcc-11.5.0
nios2                 randconfig-001-20260624    gcc-9.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260624    gcc-11.5.0
nios2                 randconfig-002-20260624    gcc-9.5.0
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                         randconfig-001    gcc-16.1.0
parisc                randconfig-001-20260624    gcc-16.1.0
parisc                         randconfig-002    gcc-16.1.0
parisc                randconfig-002-20260624    gcc-16.1.0
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                     asp8347_defconfig    clang-23
powerpc                        fsp2_defconfig    gcc-16.1.0
powerpc                          g5_defconfig    gcc-16.1.0
powerpc                        randconfig-001    gcc-16.1.0
powerpc               randconfig-001-20260624    gcc-16.1.0
powerpc                        randconfig-002    gcc-16.1.0
powerpc               randconfig-002-20260624    gcc-16.1.0
powerpc64                      randconfig-001    gcc-16.1.0
powerpc64             randconfig-001-20260624    gcc-16.1.0
powerpc64                      randconfig-002    gcc-16.1.0
powerpc64             randconfig-002-20260624    gcc-16.1.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260624    clang-18
riscv                 randconfig-002-20260624    clang-18
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260624    clang-18
s390                  randconfig-002-20260624    clang-18
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-17
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260624    clang-18
sh                    randconfig-002-20260624    clang-18
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-16.1.0
sparc                          randconfig-001    gcc-14.3.0
sparc                 randconfig-001-20260624    gcc-14.3.0
sparc                          randconfig-002    gcc-14.3.0
sparc                 randconfig-002-20260624    gcc-14.3.0
sparc                       sparc32_defconfig    gcc-16.1.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-14.3.0
sparc64               randconfig-001-20260624    gcc-14.3.0
sparc64                        randconfig-002    gcc-14.3.0
sparc64               randconfig-002-20260624    gcc-14.3.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-14.3.0
um                    randconfig-001-20260624    gcc-14.3.0
um                             randconfig-002    gcc-14.3.0
um                    randconfig-002-20260624    gcc-14.3.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64               buildonly-randconfig-001    clang-22
x86_64      buildonly-randconfig-001-20260624    clang-22
x86_64               buildonly-randconfig-002    clang-22
x86_64      buildonly-randconfig-002-20260624    clang-22
x86_64               buildonly-randconfig-003    clang-22
x86_64      buildonly-randconfig-003-20260624    clang-22
x86_64               buildonly-randconfig-004    clang-22
x86_64      buildonly-randconfig-004-20260624    clang-22
x86_64               buildonly-randconfig-005    clang-22
x86_64      buildonly-randconfig-005-20260624    clang-22
x86_64               buildonly-randconfig-006    clang-22
x86_64      buildonly-randconfig-006-20260624    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260624    clang-22
x86_64                randconfig-002-20260624    clang-22
x86_64                randconfig-003-20260624    clang-22
x86_64                randconfig-004-20260624    clang-22
x86_64                randconfig-005-20260624    clang-22
x86_64                randconfig-006-20260624    clang-22
x86_64                randconfig-011-20260624    gcc-14
x86_64                randconfig-012-20260624    gcc-14
x86_64                randconfig-013-20260624    gcc-14
x86_64                randconfig-014-20260624    gcc-14
x86_64                randconfig-015-20260624    gcc-14
x86_64                randconfig-016-20260624    gcc-14
x86_64                         randconfig-071    gcc-14
x86_64                randconfig-071-20260624    gcc-14
x86_64                         randconfig-072    gcc-14
x86_64                randconfig-072-20260624    gcc-14
x86_64                         randconfig-073    gcc-14
x86_64                randconfig-073-20260624    gcc-14
x86_64                         randconfig-074    gcc-14
x86_64                randconfig-074-20260624    gcc-14
x86_64                         randconfig-075    gcc-14
x86_64                randconfig-075-20260624    gcc-14
x86_64                         randconfig-076    gcc-14
x86_64                randconfig-076-20260624    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-20
xtensa                         randconfig-001    gcc-14.3.0
xtensa                randconfig-001-20260624    gcc-14.3.0
xtensa                         randconfig-002    gcc-14.3.0
xtensa                randconfig-002-20260624    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
