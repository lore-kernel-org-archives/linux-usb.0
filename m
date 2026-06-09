Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0CE32B137
	for <linux-usb@vger.kernel.org>; Tue,  9 Jun 2026 15:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781020599; cv=none; b=gSPNQtvRo9hAZOE/b4Tetf9COoQXSYjrXwkGPxGN8SW/VLN2zow3Ivnjf9AMOOfLK7fuFmaROMEzZh9UeJ1dt+yORkTZ0UoxxoEh5XhqIYaUG6VHzKy0JO8DP0orpnO8SkyYNDNArtH2nArUBL2C9nw/5B6oIcBXnFnMsH7Fe8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781020599; c=relaxed/simple;
	bh=hCxU4p6XFQqFfH8it1rlWXCiHJ0G2pxZzUL10rmI+k0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jaukibjPQtU6AHG1+Nnyp/0zj8Zuvs9LgIgnbw3ZOHWUC0tcil/67h29cOUbzDxGX39/VEbY9ZlHD5WKjIdRZZw3uNuhwdSmOgOdB2OmeoihsGA2wac+7HT2IP8jq6psf5pKiYQIiPf0Qn7sYA+j05juphfJOCPWwW96Dw2IfGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ly/b4H+Z; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ly/b4H+Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781020598; x=1812556598;
  h=date:from:to:cc:subject:message-id;
  bh=hCxU4p6XFQqFfH8it1rlWXCiHJ0G2pxZzUL10rmI+k0=;
  b=Ly/b4H+ZEJG4gHRSpTz2cHvS9I6QMTUbl96CGl5fRDg1UhFxt9V0Dc92
   nhPl3W3XCRANrisBVTYyogkxLYtOMSzXNQ8h2n9nYhLuW5Za4xVeS9yA0
   NH6egqhqtl3u/+cmsM5bpaTZGaAIkw2Nj8NzANemJ1SKeE3ytl2uINOXZ
   +DRsQi4vYm6NmaAvpamJCzB6rcIFoDmwq9hBoojTZJPRwer4xXuVGAglH
   sACVMuRWeKgXVhJAM6Lm/KqNWvin3oxLwMoKMvhG+++jvdgW593tL6iJo
   /OwSVsGcitgxz1WhsToCzLzR/OurV99dKKJo/teYK8Rc9KeF9fZbt7sJp
   w==;
X-CSE-ConnectionGUID: g1/GgyFUSKyxFybc+aNAhg==
X-CSE-MsgGUID: i0iVqk4GQl+meAYw1EfSYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81834186"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="81834186"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 08:56:37 -0700
X-CSE-ConnectionGUID: 6eyE7KlvQJCe6bv+UXkPwA==
X-CSE-MsgGUID: pj18qP/uS1SkxyINFB1fWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="241757838"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jun 2026 08:56:35 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wWyob-00000000KCG-2LJG;
	Tue, 09 Jun 2026 15:56:33 +0000
Date: Tue, 09 Jun 2026 23:55:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 4316acc7ddaaa4572da1a55a2bc561d341c9c2a4
Message-ID: <202606092353.CAvpXmme-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 4316acc7ddaaa4572da1a55a2bc561d341c9c2a4  Merge tag 'usb-serial-7.1-rc7' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

elapsed time: 5439m

configs tested: 113
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-16.1.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    gcc-16.1.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                          randconfig-001    gcc-14.3.0
arm64                 randconfig-001-20260609    clang-23
arm64                          randconfig-002    gcc-8.5.0
arm64                 randconfig-002-20260609    gcc-13.4.0
arm64                          randconfig-003    clang-20
arm64                 randconfig-003-20260609    gcc-15.2.0
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260609    clang-23
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                           randconfig-001    gcc-13.4.0
csky                  randconfig-001-20260609    gcc-9.5.0
csky                           randconfig-002    gcc-14.3.0
csky                  randconfig-002-20260609    gcc-11.5.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                        randconfig-001    clang-23
hexagon               randconfig-001-20260609    clang-18
hexagon                        randconfig-002    clang-23
hexagon               randconfig-002-20260609    clang-23
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    gcc-14
i386                  randconfig-011-20260609    clang-22
i386                  randconfig-012-20260609    clang-22
i386                  randconfig-013-20260609    clang-22
i386                  randconfig-014-20260609    gcc-14
i386                  randconfig-015-20260609    clang-22
i386                  randconfig-016-20260609    clang-22
i386                  randconfig-017-20260609    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                      randconfig-001    clang-23
loongarch             randconfig-001-20260609    clang-23
loongarch                      randconfig-002    gcc-16.1.0
loongarch             randconfig-002-20260609    clang-23
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260609    gcc-11.5.0
nios2                          randconfig-002    gcc-8.5.0
nios2                 randconfig-002-20260609    gcc-11.5.0
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    gcc-16.1.0
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                  randconfig-002-20260609    gcc-16.1.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    gcc-16.1.0
sh                    randconfig-002-20260609    gcc-11.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc64                          allmodconfig    clang-20
um                               allmodconfig    clang-23
um                                allnoconfig    clang-16
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260609    clang-22
x86_64      buildonly-randconfig-002-20260609    clang-22
x86_64      buildonly-randconfig-003-20260609    clang-22
x86_64      buildonly-randconfig-004-20260609    gcc-14
x86_64      buildonly-randconfig-005-20260609    clang-22
x86_64      buildonly-randconfig-006-20260609    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-16.1.0
xtensa                           allyesconfig    clang-20
xtensa                         randconfig-001    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
