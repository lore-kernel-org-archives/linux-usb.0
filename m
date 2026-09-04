Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CCD41D214
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 06:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788503112; cv=none; b=geclJ1FGsCFUJhXGKVOcLKLLU0frpP1OMEaj39E5sJ90WoxUOAX9LiUMrdsYyq3poEgdM8eIbGUv/0JMtUln8p1IxPOIRIhNsizQC22MawkXvG2OSrYJjHrppQp3DXUY5p2BbFKv5MjG/matT4sKwZSbaD1/YRFKLHE9Tu8mySY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788503112; c=relaxed/simple;
	bh=eU4BffCq8MwfruTXvzGnZzd15xmLu6ru4/G+BgmpU1E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J/PIDzMfEGz7NzL4GwgDcS9wd6Di5YYItmhrTKwQJOXpRB607G2bRw3MAngVW7JxhkWzgUCdWy8/3/a4V8yYCdOd9x+uQJf9tYYxTfQgv3G2NlA6IJ24WQ2XhIRS8j5o4opeuPAyZan4qldRBJ+biVV1L9zQNG8bEBUyU/yfj8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f/yaxniw; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f/yaxniw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788503111; x=1820039111;
  h=date:from:to:cc:subject:message-id;
  bh=eU4BffCq8MwfruTXvzGnZzd15xmLu6ru4/G+BgmpU1E=;
  b=f/yaxniw5Qw3ZMDsU8Woq7UN08mIDweYuXy42GitceftW+v1+OCMQE5W
   0veoRQpmfV2y+E/FWyMw1p4I2WS1wTVOcm7y3xfNGinGrOCY8fTqfGCRR
   AglQyyz26HRvpSXOytKjwFROM5y1Sn35WezJI4KToSSsYKYVmjASVXSVs
   gEEKmi/gwU7VWh9vOM7laCifeUrOPS3igqAEajPafTyHC5WRl3Y7RUR2O
   qKMybtPa5S7F/+B/jEZSca+DOLIOST7FJwZZbgQ1vQoO83/RQsYCG/L+W
   dGXWZfBwVU0/jw/YEvVEtP5kGST/QAunjNEdRrBXj+PRSOL6FmXRvEUUE
   w==;
X-CSE-ConnectionGUID: E49sBOHLSDCftSqNBo4TCw==
X-CSE-MsgGUID: gMa024ZkS7+1MrCY3sHGUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="92697063"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="92697063"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 23:25:08 -0700
X-CSE-ConnectionGUID: 6rVaZx3GTqWgwLkjRvp5ig==
X-CSE-MsgGUID: ZheTozs+QsiSt0aeOutQtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="273735907"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Sep 2026 23:25:07 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2NMG-000000005yC-3QcC;
	Fri, 04 Sep 2026 06:25:04 +0000
Date: Fri, 04 Sep 2026 14:24:24 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:fixes] BUILD SUCCESS
 4310c6b8e75d6a47f7548e5948fbe6318aa4440a
Message-ID: <202609041421.WvKtG9tr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git fixes
branch HEAD: 4310c6b8e75d6a47f7548e5948fbe6318aa4440a  thunderbolt: Fix NULL dereference in tb_remove_work()

elapsed time: 2816m

configs tested: 73
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    gcc-16.1.0
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    clang-24
arc          allyesconfig    gcc-16.1.0
arm           allnoconfig    clang-17
arm           allnoconfig    gcc-16.1.0
arm          allyesconfig    gcc-16.1.0
arm64        allmodconfig    clang-24
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    clang-24
hexagon      allmodconfig    gcc-16.1.0
hexagon       allnoconfig    clang-24
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    clang-22
i386          allnoconfig    gcc-14
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    clang-22
loongarch    allmodconfig    clang-19
loongarch    allmodconfig    clang-24
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
riscv        allmodconfig    clang-24
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
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-17
um            allnoconfig    clang-24
um           allyesconfig    gcc-14
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa        allnoconfig    gcc-16.1.0
xtensa       allyesconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
