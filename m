Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6923B995E
	for <linux-usb@vger.kernel.org>; Wed,  9 Sep 2026 08:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942060; cv=none; b=O4RZMFs5dA+LsjYysX9Svp+CjZ4nSQgLPAdTrLT+h1jIb8nONzOOO9rSYbif/3OdzrrAxtKVDTGxq658wCiRKx6F09PISZ1KqcxQ+wpJh7T3H9FC0LltVsH/Xvnvdm8UCeivY/Xe6XLRyMOfQjfjsLKDGfbj0VDrbIO58orUEa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942060; c=relaxed/simple;
	bh=0Y6uydjNaQTjpyuSibgww4lSOn5K9ewAMhEtF30Jw6s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GggXzKF5AAgSVec8Bf+xeX0vKf7HIpjT65c/ZkH0KfAg9w23dqhusBaCnmYYjdr8KSPt7aRbP7XfpSTkiKyUfYHsfxg6utIcSi+SMnArZ5bw9RlRmJv/dMMGEBUh7JDWNQq8n9U3cUk0XpELbaP9rgY4vGSfaRwt2F/CYQT8Uz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M4PloJpA; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M4PloJpA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788942060; x=1820478060;
  h=date:from:to:cc:subject:message-id;
  bh=0Y6uydjNaQTjpyuSibgww4lSOn5K9ewAMhEtF30Jw6s=;
  b=M4PloJpAmHMQ0YckdO5+2wGxtB49bGSzbuY+kTFrjKUB9xP8hXE9FING
   vf3sXma0sLKqNNwAfvn8eURxKoMmdti7K9g2KbTEOIqmEThLIeYI98T39
   ukfZXvJuDx+aIM0OB8+SmrHuV745iXdhxZHt6YFH9R/GOjTPg8Y3DYexF
   XpBJZh9n5IqefvpdCyC7lqYe1kNBfro7ZKkc54CRwuiXEujIRhHCXHllZ
   i0FFZW9UrmdJz3lSNRyOxgTT1/OHG0qQqDLXrdR5qCcwFGRh6uLU21UZR
   K6o7d1GXbmjHXDn+KA3JS4zpFA/wp+zG5SsHt3xV2E15kUAWvyb684Y/1
   g==;
X-CSE-ConnectionGUID: wsa7FNloQ3GTj33bZyL8pg==
X-CSE-MsgGUID: ixNi5ANaRoWRY4uQuSOKxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89118523"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89118523"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 01:20:58 -0700
X-CSE-ConnectionGUID: x0DYVtVmTO62D7qQQIPXeg==
X-CSE-MsgGUID: M4YZNhGlRY678dFwG6SHRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="266954495"
Received: from lkp-server02.sh.intel.com (HELO cdbc6ec9b517) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 09 Sep 2026 01:20:56 -0700
Received: from kbuild by cdbc6ec9b517 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4DY5-0000000007r-3kAJ;
	Wed, 09 Sep 2026 08:20:53 +0000
Date: Wed, 09 Sep 2026 16:13:42 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 319d216d6546b2db9de5a818039a65ed62f0a7fd
Message-ID: <202609091638.QkMWLRTj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: 319d216d6546b2db9de5a818039a65ed62f0a7fd  thunderbolt: Fix typo "forwared" in comment

elapsed time: 1344m

configs tested: 61
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    gcc-16.1.0
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    gcc-16.1.0
arm           allnoconfig    clang-17
arm           allnoconfig    gcc-16.1.0
arm          allyesconfig    gcc-16.1.0
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    clang-24
hexagon       allnoconfig    clang-24
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    gcc-14
i386          allnoconfig    gcc-14
i386          allnoconfig    gcc-16.1.0
loongarch     allnoconfig    clang-20
loongarch     allnoconfig    gcc-16.1.0
m68k         allmodconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
m68k         allyesconfig    gcc-16.1.0
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips         allmodconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
mips         allyesconfig    gcc-16.1.0
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    clang-24
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    gcc-16.1.0
openrisc      allnoconfig    clang-24
openrisc      allnoconfig    gcc-16.1.0
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc        allnoconfig    gcc-16.1.0
parisc       allyesconfig    gcc-16.1.0
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
powerpc       allnoconfig    gcc-16.1.0
riscv         allnoconfig    clang-24
riscv         allnoconfig    gcc-16.1.0
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-24
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh            allnoconfig    gcc-16.1.0
sh           allyesconfig    gcc-16.1.0
sparc         allnoconfig    clang-24
sparc         allnoconfig    gcc-16.1.0
um           allmodconfig    clang-17
um            allnoconfig    clang-17
um            allnoconfig    clang-24
um           allyesconfig    gcc-14
x86_64        allnoconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa        allnoconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
