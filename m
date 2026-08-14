Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5783EC689
	for <linux-usb@vger.kernel.org>; Fri, 14 Aug 2026 21:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786743853; cv=none; b=ZJtaoO6jxckYQMR7NOPxvmTtQukYeAFBJ6XSfNIjcB9XS2oqRncBLQSSGD7G+Vp0OPa2/nKg6KhKPdJk5ABz4URbYazUCyLzaIrkAhiEbtFydJ4aNVUR+g67XMepRC/kSr31VZ8U4SNotBBtjexJZCvvtDwKO6u1eH2Ym9YKKRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786743853; c=relaxed/simple;
	bh=16/4YMGZktAIgYT284uQqWTSHhuoFH6pZNa4AHhaqoI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oga6lUcguKF6+sfkAyw5P+7pmq5KmvM8PlKefc4LEHY9kZWfUJ0uR7CB90RY2Z30xyO5oz9pyShBYXdOF2rZolM+s5H4wro0+7++sXlH2Sp+T7ScXYM/3YfwJhVLrUqwF+p9yWq5uucNsaPhXJ+JJY3s+GXCWJCBL1/CD+v0Z78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HqNvZpnn; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HqNvZpnn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786743852; x=1818279852;
  h=date:from:to:cc:subject:message-id;
  bh=16/4YMGZktAIgYT284uQqWTSHhuoFH6pZNa4AHhaqoI=;
  b=HqNvZpnn1DCkqviOHUIwJGklY2NP+2uCtwAGIH0Dl8IvX688LioO9y17
   MNIkRuDG+uGXjsTO7hVPA6oFMyTLt4ALvFFskwe5mRv5bA+yf7gCfrGrU
   ZLkkjH22IPVqKHAB11IKPOFtTbjoUI1DNTaVPKtNKPaZAThsB4+VyTAl3
   rFPbqIyBY0AnxdKCQ7OwDWG1TUAuxgx4tmYy2+pE/paWZzgyKnc9BuKyn
   ZHzQzgrxYBt5A/je18JmzBVUcgJlixyK6ixlMx0/kUxb18K9fZKTVasLB
   t1vz0FGn27ppKt11Ypsl9khZG2hfXThpvwDZfs81fo2JQS77lVeVMOOyd
   g==;
X-CSE-ConnectionGUID: B+aBFngxRcmgRIBTqDgySw==
X-CSE-MsgGUID: cTRwCvrNSJC6LIp3Xz2iBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="86287512"
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="86287512"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 14:44:11 -0700
X-CSE-ConnectionGUID: pb2TbbLTRYq3LL6OQNFw5w==
X-CSE-MsgGUID: BBLvbuVSSoyT/8lFMS80sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="266323307"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Aug 2026 14:44:10 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuzh9-00000000aHs-2BSq;
	Fri, 14 Aug 2026 21:44:07 +0000
Date: Sat, 15 Aug 2026 05:44:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 bdab5605259ba5d6ff927c1a85cc83eb3ecfdacc
Message-ID: <202608150553.jUJGLwQr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: bdab5605259ba5d6ff927c1a85cc83eb3ecfdacc  usb: gadget: uvc: fix dangling pointers in uvc_function_bind() and uvc_function_unbind()

elapsed time: 794m

configs tested: 79
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260814    gcc-10.5.0
arc                  randconfig-002-20260814    gcc-12.5.0
arm                  randconfig-001-20260814    gcc-16.1.0
arm                  randconfig-002-20260814    gcc-10.5.0
arm                  randconfig-003-20260814    gcc-16.1.0
arm                  randconfig-004-20260814    clang-17
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260815    gcc-13.4.0
csky                 randconfig-002-20260815    gcc-15.2.0
hexagon              randconfig-001-20260814    clang-17
hexagon              randconfig-002-20260814    clang-19
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260814    clang-22
i386       buildonly-randconfig-002-20260814    gcc-13
i386       buildonly-randconfig-003-20260814    clang-22
i386       buildonly-randconfig-004-20260814    clang-22
i386       buildonly-randconfig-005-20260814    gcc-13
i386       buildonly-randconfig-006-20260814    gcc-14
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260814    gcc-16.1.0
loongarch            randconfig-002-20260814    clang-24
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260814    gcc-11.5.0
nios2                randconfig-002-20260814    gcc-11.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260814    gcc-15.2.0
parisc               randconfig-002-20260814    gcc-9.5.0
powerpc              randconfig-001-20260814    gcc-8.5.0
powerpc              randconfig-002-20260814    clang-18
powerpc64            randconfig-001-20260814    gcc-14.3.0
powerpc64            randconfig-002-20260814    gcc-8.5.0
riscv                randconfig-001-20260814    gcc-14.3.0
riscv                randconfig-002-20260814    clang-24
s390                 randconfig-001-20260814    gcc-11.5.0
s390                 randconfig-002-20260814    gcc-13.4.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260814    gcc-16.1.0
sh                   randconfig-002-20260814    gcc-16.1.0
sparc                randconfig-001-20260814    gcc-16.1.0
sparc                randconfig-002-20260814    gcc-15.2.0
sparc64              randconfig-001-20260814    gcc-8.5.0
sparc64              randconfig-002-20260814    clang-24
um                            i386_defconfig    gcc-14
um                   randconfig-001-20260814    gcc-14
um                   randconfig-002-20260814    clang-22
x86_64     buildonly-randconfig-001-20260815    clang-22
x86_64     buildonly-randconfig-002-20260815    gcc-14
x86_64     buildonly-randconfig-003-20260815    gcc-14
x86_64     buildonly-randconfig-004-20260815    gcc-14
x86_64     buildonly-randconfig-005-20260815    gcc-14
x86_64     buildonly-randconfig-006-20260815    clang-22
x86_64               randconfig-001-20260814    gcc-14
x86_64               randconfig-002-20260814    clang-22
x86_64               randconfig-003-20260814    clang-22
x86_64               randconfig-004-20260814    clang-22
x86_64               randconfig-005-20260814    gcc-14
x86_64               randconfig-006-20260814    gcc-14
x86_64               randconfig-011-20260814    clang-22
x86_64               randconfig-012-20260814    gcc-13
x86_64               randconfig-013-20260814    clang-22
x86_64               randconfig-014-20260814    gcc-14
x86_64               randconfig-015-20260814    gcc-14
x86_64               randconfig-016-20260814    clang-22
x86_64               randconfig-071-20260814    gcc-14
x86_64               randconfig-072-20260814    clang-22
x86_64               randconfig-073-20260814    clang-22
x86_64               randconfig-074-20260814    gcc-13
x86_64               randconfig-075-20260814    gcc-14
x86_64               randconfig-076-20260814    clang-22
xtensa               randconfig-001-20260814    gcc-9.5.0
xtensa               randconfig-002-20260814    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
