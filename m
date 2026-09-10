Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2996478E57
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 19:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789069486; cv=none; b=T+vrNU4g/DVhOyGawaH7/5VR4pi+GR5OPwqGY9EwPQKHiwk3MWkKTfMR/EtK+x0WuUv1eWmeGtcuJtT9i1RyOB5lZW2vMmPTwa4dDyZXrBZqFAO9DGbvhu07kGId/fvh2DrFynP8/GhbcAd4nseLlFuiWW5pL0voDHrQzClEF7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789069486; c=relaxed/simple;
	bh=EFsO4nLGYd8NvicfaZt38YI+O0jBNM/reFO+WP1zdpQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=skY8zyPmuvtCL4bPguHt0QAtnvlKKJZXeZDa7ueHoshKeX7nBMOnya9xMvxX8m6o9ouVeTbT0m7JW0sUhDhdeZbhhK1nQjSMOjX+7UoepWYEDcUfQCssyonRAEdunFWl6qISUdGejPXQZNlBPR86gMREm/GfpCoLQugLl6H/sI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SHSSATdU; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SHSSATdU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789069485; x=1820605485;
  h=date:from:to:cc:subject:message-id;
  bh=EFsO4nLGYd8NvicfaZt38YI+O0jBNM/reFO+WP1zdpQ=;
  b=SHSSATdUfoUxgIgnyISjn7JK+KkYE0KRDzitkhHx/1iYR50gYaDDoT5M
   Ee692++fpteF1F3dek2OoMuhaSIEGTQH+4txoPw5rVGJTCZ2grvO0YV73
   vj3SkDIwBulOZ2dON699FaJR/D73FB5s1Tc8yXqGtr8IecsA2DQpSRVBr
   fWgKGY4BHVuQTjS9VOUUjalRdBNdS+zbHMhPH58VCbOglH2U2AswIemkT
   N9QcjXCWbJPEmSfjAH+SM//wh3J5IQyhn8d75pFQrHhmvKxhx5kIqCY8z
   LbD2SYmeR0JmUd7LKzTvbotNumci9oXwsPpjEYI7TLl/3Qph8cwFCW/xh
   g==;
X-CSE-ConnectionGUID: 8fFt9zB5Tw67fTVV2rCEbw==
X-CSE-MsgGUID: e5r+DvWgS/K28/XcD7DodA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="92042309"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="92042309"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 12:43:51 -0700
X-CSE-ConnectionGUID: badSZZWISyKViePRhqTa1g==
X-CSE-MsgGUID: +deBp9SxSpmLtEhEcv4Cjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="271254002"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 10 Sep 2026 12:43:50 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4kgL-000000000Uo-3nR1;
	Thu, 10 Sep 2026 19:43:39 +0000
Date: Fri, 11 Sep 2026 03:42:32 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 20bea8ceeb6ab6ab918ee8fdf5855541214907c4
Message-ID: <202609110328.GV27Fkgu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: 20bea8ceeb6ab6ab918ee8fdf5855541214907c4  thunderbolt: stream: Use polling with RX ring

elapsed time: 860m

configs tested: 64
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha               allnoconfig    gcc-16.1.0
alpha              allyesconfig    gcc-16.1.0
arc                allmodconfig    clang-24
arc                 allnoconfig    gcc-16.1.0
arc                allyesconfig    clang-24
arm                 allnoconfig    gcc-16.1.0
arm                allyesconfig    clang-24
arm64              allmodconfig    clang-24
arm64               allnoconfig    gcc-16.1.0
csky               allmodconfig    gcc-16.1.0
csky                allnoconfig    gcc-16.1.0
hexagon            allmodconfig    clang-24
hexagon            allmodconfig    gcc-16.1.0
hexagon             allnoconfig    gcc-16.1.0
i386               allmodconfig    clang-22
i386                allnoconfig    gcc-16.1.0
i386               allyesconfig    clang-22
loongarch          allmodconfig    clang-24
loongarch           allnoconfig    gcc-16.1.0
m68k               allmodconfig    gcc-16.1.0
m68k                allnoconfig    gcc-16.1.0
m68k               allyesconfig    clang-24
microblaze          allnoconfig    gcc-16.1.0
microblaze         allyesconfig    gcc-16.1.0
mips               allmodconfig    gcc-16.1.0
mips                allnoconfig    gcc-16.1.0
mips               allyesconfig    gcc-16.1.0
nios2              allmodconfig    clang-20
nios2               allnoconfig    clang-24
openrisc           allmodconfig    clang-20
openrisc            allnoconfig    clang-24
parisc             allmodconfig    gcc-16.1.0
parisc              allnoconfig    clang-24
parisc             allyesconfig    clang-17
powerpc            allmodconfig    gcc-16.1.0
powerpc             allnoconfig    clang-24
riscv              allmodconfig    clang-24
riscv               allnoconfig    clang-24
riscv              allyesconfig    clang-24
s390               allmodconfig    clang-17
s390                allnoconfig    clang-24
s390               allyesconfig    gcc-16.1.0
sh                 allmodconfig    gcc-16.1.0
sh                  allnoconfig    clang-24
sh                 allyesconfig    clang-17
sparc               allnoconfig    clang-24
sparc64            allmodconfig    clang-20
um                 allmodconfig    clang-17
um                  allnoconfig    clang-24
um                 allyesconfig    gcc-14
um                 allyesconfig    gcc-16.1.0
x86_64             allmodconfig    clang-22
x86_64              allnoconfig    clang-24
x86_64             allyesconfig    clang-22
x86_64                    kexec    clang-22
x86_64                 rhel-9.4    clang-22
x86_64             rhel-9.4-bpf    gcc-14
x86_64            rhel-9.4-func    clang-22
x86_64      rhel-9.4-kselftests    clang-22
x86_64           rhel-9.4-kunit    gcc-14
x86_64             rhel-9.4-ltp    gcc-14
x86_64            rhel-9.4-rust    clang-22
xtensa              allnoconfig    clang-24
xtensa             allyesconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
