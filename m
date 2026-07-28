Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8E3224AF9
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 10:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785234515; cv=none; b=ekugGCBN3g8PrZKDnGP1K6cTORvb54DQISIlQfWLzmPCqz/R6csV8kqSGqRD/lYShjb9I5J2qY813gYIbgHQ4XIqWq1Iq4tSYyZ8kqVpp/8UXULvHIR24CCNbp7ZFNeTvg2BMRps6FtOYl3IF0T0/ieg9ort6gvI9+JkvEYZ9IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785234515; c=relaxed/simple;
	bh=WBZEq8eulA94uyKiAd6EwifwlYpNHAve+HpLJ79kSsE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=doEtTfiVWptFhr9Gfd0nMAeLDa5RqWVWAYjRjpb78UOrTmD4yWdoYIP4a5V9yZom2Bze749VrVEl+Tj4FgFhC2pJOsU4QwMYTYmWkRDceyHMdHKyHEMFJvDYHe3lB42QsHrtU4zyuRboKUssfeVWf4+9tlrfYa1V2PvNY8+S1t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HqLBYFgb; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HqLBYFgb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785234513; x=1816770513;
  h=date:from:to:cc:subject:message-id;
  bh=WBZEq8eulA94uyKiAd6EwifwlYpNHAve+HpLJ79kSsE=;
  b=HqLBYFgbHfvWhTlZWMB30462sg4TlMAp7FYs9X6u/+JMcMp24MZs0lHf
   cokmQUGX2EqkvUcYxgK5onp/EphR7yEJDDd9UGbD8Fnxjzv/Xg5zONFA/
   HdqrVhgQ6+QYTMs9M/+2lSokcvnm8aUmXArUEO+nFPh52TwBKPEzndCFk
   roOTptcBWzD8LF4sh3HlyrUjOfHkMwcZBWdkfnPnB6Skjjnuy3gY4ZoZ8
   dLzdqaDhfcibTa2FP5q2jrKBgLYUu5juuFjDdU3zGXblWJLq17zkpjvTf
   INwD5/l0ixSv1l4lIIvgRo1V/Xd9UXKLiVRxU7YSHjbo2CP8z/zHtmIF5
   A==;
X-CSE-ConnectionGUID: PLMV8cOYTy6zyKCMhBRrXw==
X-CSE-MsgGUID: /VXTCGHrSGqpHLQ52a++uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85932794"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="85932794"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 03:28:33 -0700
X-CSE-ConnectionGUID: QBjEW4CZToSORUmo/STabQ==
X-CSE-MsgGUID: OFJCNXjgRjeg8YkA+xdf2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="256324583"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 28 Jul 2026 03:28:31 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wof2z-00000000eFH-22vo;
	Tue, 28 Jul 2026 10:28:29 +0000
Date: Tue, 28 Jul 2026 18:27:40 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:fixes] BUILD SUCCESS
 e48844ece5e3ed1d1eb865f6da2b16f62cd9f86d
Message-ID: <202607281830.PVskvY02-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git fixes
branch HEAD: e48844ece5e3ed1d1eb865f6da2b16f62cd9f86d  thunderbolt: icm: Preserve USB4 proxy data-valid bit

elapsed time: 879m

configs tested: 102
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260728    gcc-8.5.0
arc                  randconfig-002-20260728    gcc-8.5.0
arm                      imx_v6_v7_defconfig    clang-24
arm                  randconfig-001-20260728    gcc-8.5.0
arm                  randconfig-002-20260728    gcc-8.5.0
arm                  randconfig-003-20260728    gcc-8.5.0
arm                  randconfig-004-20260728    gcc-8.5.0
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260728    gcc-14.3.0
arm64                randconfig-002-20260728    gcc-14.3.0
arm64                randconfig-003-20260728    gcc-14.3.0
arm64                randconfig-004-20260728    gcc-14.3.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260728    gcc-14.3.0
csky                 randconfig-002-20260728    gcc-14.3.0
hexagon              randconfig-001-20260728    gcc-11.5.0
hexagon              randconfig-002-20260728    gcc-11.5.0
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260728    gcc-14
i386       buildonly-randconfig-002-20260728    gcc-14
i386       buildonly-randconfig-003-20260728    gcc-14
i386       buildonly-randconfig-004-20260728    gcc-14
i386       buildonly-randconfig-005-20260728    gcc-14
i386       buildonly-randconfig-006-20260728    gcc-14
i386                 randconfig-001-20260728    gcc-14
i386                 randconfig-002-20260728    gcc-14
i386                 randconfig-003-20260728    gcc-14
i386                 randconfig-004-20260728    gcc-14
i386                 randconfig-005-20260728    gcc-14
i386                 randconfig-006-20260728    gcc-14
i386                 randconfig-007-20260728    gcc-14
i386                          randconfig-011    gcc-14
i386                 randconfig-011-20260728    gcc-14
i386                 randconfig-012-20260728    gcc-14
i386                 randconfig-013-20260728    gcc-14
i386                 randconfig-014-20260728    gcc-14
i386                 randconfig-015-20260728    gcc-14
i386                 randconfig-016-20260728    gcc-14
i386                 randconfig-017-20260728    gcc-14
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260728    gcc-11.5.0
loongarch            randconfig-002-20260728    gcc-11.5.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260728    gcc-11.5.0
nios2                randconfig-002-20260728    gcc-11.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260728    gcc-10.5.0
parisc               randconfig-002-20260728    gcc-10.5.0
powerpc              randconfig-001-20260728    gcc-10.5.0
powerpc              randconfig-002-20260728    gcc-10.5.0
powerpc64            randconfig-001-20260728    gcc-10.5.0
powerpc64            randconfig-002-20260728    gcc-10.5.0
riscv                randconfig-001-20260728    gcc-14.3.0
riscv                randconfig-002-20260728    gcc-14.3.0
s390                 randconfig-001-20260728    gcc-14.3.0
s390                 randconfig-002-20260728    gcc-14.3.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260728    gcc-14.3.0
sh                   randconfig-002-20260728    gcc-14.3.0
sparc                         randconfig-001    gcc-11.5.0
sparc                randconfig-001-20260728    gcc-11.5.0
sparc                randconfig-002-20260728    gcc-11.5.0
sparc64              randconfig-001-20260728    gcc-11.5.0
sparc64              randconfig-002-20260728    gcc-11.5.0
um                   randconfig-001-20260728    gcc-11.5.0
um                   randconfig-002-20260728    gcc-11.5.0
x86_64     buildonly-randconfig-001-20260728    clang-22
x86_64     buildonly-randconfig-002-20260728    clang-22
x86_64     buildonly-randconfig-003-20260728    clang-22
x86_64     buildonly-randconfig-004-20260728    clang-22
x86_64     buildonly-randconfig-005-20260728    clang-22
x86_64     buildonly-randconfig-006-20260728    clang-22
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260728    gcc-12
x86_64               randconfig-002-20260728    gcc-12
x86_64               randconfig-003-20260728    gcc-12
x86_64               randconfig-004-20260728    gcc-12
x86_64               randconfig-005-20260728    gcc-12
x86_64               randconfig-006-20260728    gcc-12
x86_64               randconfig-011-20260728    clang-22
x86_64               randconfig-012-20260728    clang-22
x86_64               randconfig-013-20260728    clang-22
x86_64               randconfig-014-20260728    clang-22
x86_64               randconfig-015-20260728    clang-22
x86_64               randconfig-016-20260728    clang-22
x86_64               randconfig-071-20260728    clang-22
x86_64               randconfig-072-20260728    clang-22
x86_64               randconfig-073-20260728    clang-22
x86_64               randconfig-074-20260728    clang-22
x86_64               randconfig-075-20260728    clang-22
x86_64               randconfig-076-20260728    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260728    gcc-11.5.0
xtensa               randconfig-002-20260728    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
