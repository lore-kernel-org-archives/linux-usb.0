Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C513644A0
	for <linux-usb@vger.kernel.org>; Sat,  5 Sep 2026 20:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788638703; cv=none; b=WxxF7NZtX/6zDGSVM2YtLi6k9dm/wbuE6CEk0l4x+WcyVf8LMGwp7HXyCiliCbYxty0w3IrdUEhz2vinw7JdEbCahWZxQLwJuVCAaaGr7D6s2O31UiTkwh8jpKxaaBPfRykhllRrkx3wt3SzL7abdhQCjhPxk30IpbEmfKS8ypo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788638703; c=relaxed/simple;
	bh=fliTPpZe+tam2LvMl29aZoRq6tal3lWntJtRhJ6XY3o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e7lyZnjWl1S8idfwnB11QBhF5zvRk6Yvuajbk6ZM7e/CkEoG87dbUsxYLZu1dfmn7AqEp0igTRBEWbHO00jHO1+LSsNyZT7yKv/QCDsMqOgR1CYjfTpROXoyp05nPnCOd4becfQyDra4cLz0IG4qJhYVe7YHVndmhwc3uWxoF4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gPVM2636; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gPVM2636"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788638702; x=1820174702;
  h=date:from:to:cc:subject:message-id;
  bh=fliTPpZe+tam2LvMl29aZoRq6tal3lWntJtRhJ6XY3o=;
  b=gPVM2636fvsVCjOwt4C3PceNh+2omBP/O8Aq6kPf3OQ++xQg9bKIfS5d
   bpSf3HOwRQ/2nYroeI9g0Z4VN+MXGo9o4W08KQysE+FDLMtNCO/KTlCRy
   Zlsun9sH1B2U2L8VbZqQ0TqFJS5I99BMOgvWJY1+g1o/TB0ahnkRGg9bO
   1m9mtxSDEAaS8pO7JU0CwF9Sf+ncqWP1ZlneFlqe4aq5maOlVPn4IA4cv
   1Mver7F6S2KAViq72vS+sBfqEE76OrJbgQmWCVZJ3InUbGG0qBYMjexp5
   Awq22858l3x254pTG/al0CV7ykyVrr+GFO4fnFMjHXqc1CLMH62P0qHdE
   g==;
X-CSE-ConnectionGUID: XxcXHADCT76g42O5EcrQlg==
X-CSE-MsgGUID: t5mYQ9VpTBiLVm95/zlBWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11897"; a="88981049"
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="88981049"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 13:05:01 -0700
X-CSE-ConnectionGUID: mrkvoZ8kTbiRTnvBGq2uEQ==
X-CSE-MsgGUID: +7R5H3DPR52WqgjtOxq0Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="268604608"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Sep 2026 13:05:01 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2wdG-0000000013r-0tZL;
	Sat, 05 Sep 2026 20:04:58 +0000
Date: Sun, 06 Sep 2026 04:04:10 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:fixes] BUILD SUCCESS
 e6df180e976fd08673214bc1305a46a8536aea9a
Message-ID: <202609060408.hKS4L03M-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git fixes
branch HEAD: e6df180e976fd08673214bc1305a46a8536aea9a  Revert "thunderbolt: xdomain: Notify peers after enumeration"

elapsed time: 2239m

configs tested: 55
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    clang-24
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    clang-24
arm           allnoconfig    gcc-16.1.0
arm          allyesconfig    clang-24
arm64        allmodconfig    clang-24
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    gcc-16.1.0
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    clang-22
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    clang-22
loongarch    allmodconfig    clang-24
loongarch     allnoconfig    gcc-16.1.0
m68k         allmodconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
m68k         allyesconfig    clang-24
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips         allmodconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
mips         allyesconfig    gcc-16.1.0
nios2        allmodconfig    clang-20
nios2         allnoconfig    clang-24
openrisc     allmodconfig    clang-20
openrisc      allnoconfig    clang-24
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc       allyesconfig    clang-17
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-17
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh           allyesconfig    clang-17
sparc         allnoconfig    clang-24
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-24
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa       allyesconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
