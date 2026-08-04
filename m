Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584DB4137A7
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 04:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785816342; cv=none; b=StQtZmIu/y6KfTN/y8BNyKR9NCaQAS98kSskSX96RS05CfdTJlBsftqQcZkytKYpQBi8KyYGDCYQxAVPxUbF78tF5y6notiyN/cwsUpWF6ZeUbXSBgtnaYr3zqIpeBRFfW4axysLyzzEfEhEULsE0Rjfj8OYA2cmY6k5qb7z5BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785816342; c=relaxed/simple;
	bh=6Ln14x3wdpeHq9cBZfbGYvp4hEAAD+xhC0GuLqr1N0M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JR9fmkmcjRXvUq10D0YuB4pQiMsqK6pd9wqTwkM6Ujp2Kl2EJzq6v446KRJe3PhU1tzqjqtCpVvPkEkxPvCeIJQkNqbtH05mDPO8fHciywFkKBS1C6GEHCI7Ox8+XRVBIu6BMXxJHBuU2Yqlm/HV8wdS+I7pe0QxAM75LERa1xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UsZpkLh1; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UsZpkLh1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785816340; x=1817352340;
  h=date:from:to:cc:subject:message-id;
  bh=6Ln14x3wdpeHq9cBZfbGYvp4hEAAD+xhC0GuLqr1N0M=;
  b=UsZpkLh1zvWHoQV5qJ7bRSp2Eol3S3WwFp2wcdGzkwVQZXibBZyYnbeW
   TFodiJ34PIJDPYUMn6XUFg229ZdLWES5hbocAZ+S1bn0CI6Hw8oRq2FSm
   3lftEbWvvtvUgzpaTheHAPk6i5OUyDDQmLNIewCkAs4f5CkAXhUbpYD6k
   /1+1rOlAzbxlMwQG+5V2W3nqozl+CdujUfSiGA6FPMUEs3cNEziherG4/
   gdwgUVvEQBYE4copSUCSX8DULhxErxffwTIhbHoGGdeQBgIQjdA+pxc6A
   IBBII67KXQHenemdM5FxmJ72yM4WxRTu2a5UJbjnk7gfx+eyeecUIQmtw
   g==;
X-CSE-ConnectionGUID: xjIO0y9vRmaQizoOwQhb+w==
X-CSE-MsgGUID: 7SgRmD5WTXq6ov+jYnbQbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86480319"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="86480319"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 21:05:40 -0700
X-CSE-ConnectionGUID: rZwelAmATZyWwyjuQrO+1Q==
X-CSE-MsgGUID: WNbH3bTmR4S1b3lLLTydrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="257511340"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Aug 2026 21:05:38 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wr6PI-000000008rV-193s;
	Tue, 04 Aug 2026 04:05:36 +0000
Date: Tue, 04 Aug 2026 12:04:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 f3988e68fc089f6a5883f4f807955a3825bb7d45
Message-ID: <202608041226.8Exq4JEa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: f3988e68fc089f6a5883f4f807955a3825bb7d45  usb: quirks: Add ShanWan gamepad to quirk list

elapsed time: 734m

configs tested: 95
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260804    gcc-8.5.0
arc                  randconfig-002-20260804    gcc-8.5.0
arm                     integrator_defconfig    clang-24
arm                  randconfig-001-20260804    gcc-8.5.0
arm                  randconfig-002-20260804    gcc-8.5.0
arm                  randconfig-003-20260804    gcc-8.5.0
arm                  randconfig-004-20260804    gcc-8.5.0
arm64                randconfig-001-20260804    gcc-11.5.0
arm64                randconfig-002-20260804    gcc-11.5.0
arm64                randconfig-003-20260804    gcc-11.5.0
arm64                randconfig-004-20260804    gcc-11.5.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260804    gcc-11.5.0
csky                 randconfig-002-20260804    gcc-11.5.0
hexagon              randconfig-001-20260804    gcc-16.1.0
hexagon              randconfig-002-20260804    gcc-16.1.0
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260804    gcc-14
i386       buildonly-randconfig-002-20260804    gcc-14
i386       buildonly-randconfig-003-20260804    gcc-14
i386       buildonly-randconfig-004-20260804    gcc-14
i386       buildonly-randconfig-005-20260804    gcc-14
i386       buildonly-randconfig-006-20260804    gcc-14
i386                 randconfig-001-20260804    clang-22
i386                 randconfig-001-20260804    gcc-14
i386                 randconfig-002-20260804    clang-22
i386                 randconfig-002-20260804    gcc-14
i386                 randconfig-003-20260804    clang-22
i386                 randconfig-003-20260804    gcc-14
i386                 randconfig-004-20260804    clang-22
i386                 randconfig-004-20260804    gcc-14
i386                 randconfig-005-20260804    clang-22
i386                 randconfig-005-20260804    gcc-14
i386                 randconfig-006-20260804    clang-22
i386                 randconfig-007-20260804    clang-22
i386                 randconfig-007-20260804    gcc-14
i386                 randconfig-011-20260804    gcc-13
i386                 randconfig-012-20260804    gcc-13
i386                 randconfig-013-20260804    gcc-13
i386                 randconfig-014-20260804    gcc-13
i386                 randconfig-015-20260804    gcc-13
i386                 randconfig-016-20260804    gcc-13
i386                 randconfig-017-20260804    gcc-13
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260804    gcc-16.1.0
loongarch            randconfig-002-20260804    gcc-16.1.0
m68k                         atari_defconfig    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260804    gcc-16.1.0
nios2                randconfig-002-20260804    gcc-16.1.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260804    gcc-8.5.0
parisc               randconfig-002-20260804    gcc-8.5.0
powerpc              randconfig-001-20260804    gcc-8.5.0
powerpc              randconfig-002-20260804    gcc-8.5.0
powerpc64            randconfig-001-20260804    gcc-8.5.0
powerpc64            randconfig-002-20260804    gcc-8.5.0
sh                                 defconfig    gcc-16.1.0
sparc                randconfig-001-20260804    gcc-16.1.0
sparc                randconfig-002-20260804    gcc-16.1.0
sparc64              randconfig-001-20260804    clang-24
sparc64              randconfig-002-20260804    clang-20
um                   randconfig-001-20260804    gcc-14
um                   randconfig-002-20260804    gcc-14
x86_64     buildonly-randconfig-001-20260804    gcc-14
x86_64     buildonly-randconfig-002-20260804    gcc-14
x86_64     buildonly-randconfig-003-20260804    gcc-14
x86_64     buildonly-randconfig-004-20260804    gcc-14
x86_64     buildonly-randconfig-005-20260804    gcc-14
x86_64     buildonly-randconfig-006-20260804    gcc-14
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260804    gcc-14
x86_64               randconfig-002-20260804    gcc-14
x86_64               randconfig-003-20260804    gcc-14
x86_64               randconfig-004-20260804    gcc-14
x86_64               randconfig-005-20260804    gcc-14
x86_64               randconfig-006-20260804    gcc-14
x86_64                        randconfig-071    clang-22
x86_64               randconfig-071-20260804    clang-22
x86_64               randconfig-072-20260804    clang-22
x86_64               randconfig-073-20260804    clang-22
x86_64               randconfig-074-20260804    clang-22
x86_64               randconfig-075-20260804    clang-22
x86_64               randconfig-076-20260804    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260804    gcc-8.5.0
xtensa               randconfig-002-20260804    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
