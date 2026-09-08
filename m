Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2ED554087
	for <linux-usb@vger.kernel.org>; Tue,  8 Sep 2026 14:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788876559; cv=none; b=apFhPjIL3oO7Y43X+06SvWfQZ9NgBwC+FdAyD5ntJqKDOBAA4ZejuEuoBFpUj1DiBtYjKGlfxQoDWQqk/+h6Lmt0hfYoa1Ik/2HuKwJ/8jXo5kKopuCeiPAZCbKVY0Q4r1TwuA13qqBoArLl/po26ZyIrEm4c3xyATUwqVjk9WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788876559; c=relaxed/simple;
	bh=Ayflqv1XHHrnSjj0pbJSaUQpqQQPDxVmFmLJkJVGnbQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lXQgmM9+YarRUptyWKPFe/ZH6nrEloI2hktXGDHlHxSI21ATUSeOqs9y6A5rb+ergDfPjbeh/ZcTymaXVPvLQIxVCktxvcMKEbl/J4aF0GLj1lHlRIIjUNN6X21R5mry/aRJNcKJU18tBMP2z7i/m306gZbg4WaCHfP7QybV7Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IvNKsjGK; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IvNKsjGK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788876556; x=1820412556;
  h=date:from:to:cc:subject:message-id;
  bh=Ayflqv1XHHrnSjj0pbJSaUQpqQQPDxVmFmLJkJVGnbQ=;
  b=IvNKsjGK8f09mY5Ujam78HcerEiNFNT8Yg3Dl4zWm34dp9qhtWvhj58W
   HAKIw3q6RTw0h5VNh+lsAzBMIYzn+YR/d2KJe7V6J9tcdtwk4ZsJoVlBQ
   pTxZoQye3w7saeHH9fif7KDEyEojKaR1oL4UTgBemXOoROVBIHXI1z3Ci
   +WLUeXJMhHvVFRWlE80nLP/DZO0+00koIYrNrW+llePngNMPLYbw79wvm
   NyGKS9CNp8V/NFW7Q+O+/isa4td+d57LF7ABXdwK0BGLfhs2M1eB4rYVW
   tJ5EyWfjLyzxTSpyGawfb+3ghmTDJf4g6EQDGAnNDx6DrMo3ImgynrqCJ
   w==;
X-CSE-ConnectionGUID: wfAOn/BrRhWpu9V7RYE7VA==
X-CSE-MsgGUID: 8BiyKakpQ9WbUE1cT1sICw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89122028"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="89122028"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 07:07:40 -0700
X-CSE-ConnectionGUID: v0Te7xXpQhm35btj/GJyLg==
X-CSE-MsgGUID: YBx4B6zoR9yq9q7hbNUYSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="269270032"
Received: from lkp-server01.sh.intel.com (HELO dc5b8f51e05b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Sep 2026 07:07:39 -0700
Received: from kbuild by dc5b8f51e05b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3wU3-000000000Ch-3zwU;
	Tue, 08 Sep 2026 14:07:35 +0000
Date: Tue, 08 Sep 2026 22:07:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 34c9c5517033a74039a54dfab24e7bf767a4e0e4
Message-ID: <202609082202.LRj92jSK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: 34c9c5517033a74039a54dfab24e7bf767a4e0e4  Merge 7.3-rc2 into usb-next

elapsed time: 1398m

configs tested: 82
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    clang-24
arc          allmodconfig    gcc-16.1.0
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    clang-24
arc          allyesconfig    gcc-16.1.0
arm           allnoconfig    clang-17
arm           allnoconfig    gcc-16.1.0
arm          allyesconfig    clang-24
arm          allyesconfig    gcc-16.1.0
arm64        allmodconfig    clang-24
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    gcc-16.1.0
hexagon       allnoconfig    clang-24
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    clang-22
i386         allmodconfig    gcc-14
i386          allnoconfig    gcc-14
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    clang-22
i386         allyesconfig    gcc-14
loongarch    allmodconfig    clang-19
loongarch    allmodconfig    clang-24
loongarch     allnoconfig    clang-20
loongarch     allnoconfig    gcc-16.1.0
m68k         allmodconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
m68k         allyesconfig    clang-24
m68k         allyesconfig    gcc-16.1.0
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips         allmodconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
mips         allyesconfig    gcc-16.1.0
nios2        allmodconfig    clang-20
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    clang-24
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    clang-20
openrisc     allmodconfig    gcc-16.1.0
openrisc      allnoconfig    clang-24
openrisc      allnoconfig    gcc-16.1.0
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc        allnoconfig    gcc-16.1.0
parisc       allyesconfig    clang-17
parisc       allyesconfig    gcc-16.1.0
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
powerpc       allnoconfig    gcc-16.1.0
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
riscv         allnoconfig    gcc-16.1.0
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-17
s390         allmodconfig    clang-24
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh            allnoconfig    gcc-16.1.0
sh           allyesconfig    clang-17
sh           allyesconfig    gcc-16.1.0
sparc         allnoconfig    clang-24
sparc         allnoconfig    gcc-16.1.0
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-17
um            allnoconfig    clang-24
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa        allnoconfig    gcc-16.1.0
xtensa       allyesconfig    clang-20
xtensa       allyesconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
