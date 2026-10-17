Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BDC2139C9
	for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2026 04:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792211322; cv=none; b=pCKLdRwMmvw3kDWeiK7RN9vURSNdDTFfO07GGx2iuBj/1Mjp4dEWPAckhCFLhyoKtjNMJ6AGVsiN00SeNmvjq1gWS1xiv82xlZKBpbXM0IbbQIgoU5HkbSW3K8ipGahTEA/5AWog0i+cvRD9T2bl3Qdg++X3nL0nP+sQDfV2F9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792211322; c=relaxed/simple;
	bh=kx5BZwitKRTBeUVNAw3/gQVX9XR/mvzIH9wo71U+Qq8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rNb6tTo/pjfeCcv8VWRwrn2iOELWHmdciJBgG/NkqpLV27nlQv7fSG1ZcOskeerNTxLvwqOFsC0ZXpKNE3otpviZw9NisoHDFN+CAH7Dqu8ETSzqT2s2K9iuabsIXIMA/cIM/2LhI5kt2VRS6SqMWY4VBx5wu7AZqoH9GQHpEQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZPcsDYdp; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZPcsDYdp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792211321; x=1823747321;
  h=date:from:to:cc:subject:message-id;
  bh=kx5BZwitKRTBeUVNAw3/gQVX9XR/mvzIH9wo71U+Qq8=;
  b=ZPcsDYdpqucQuwFbmXw1mnTt1FFtct896olUsOKXodWbm7m+Ui2aYJ5R
   dYlPAnHeVtKNFTp6EAejkKvUxYLEgm/Qtop2m7gH7RQmJ6UUrb/JvbcaQ
   ap1TDaNjQycNN8O/YdV+KZbYIL1pPOfUjOEDjH0leETTyvthh74l1+pFw
   7Yi5z5/XTZizbRLAPBZfMMxQHiGTza1a9VQ+xjlM1nchAldBmrCf0Iui2
   AqpK8pzN3w8CvT/VB944+XVp5iuIrMTfvCB10rdrlagbj0B6aibUGLSbL
   7nvkWtXVvRrJt8YHenjMSNPOQK7/GUjtGR75pWFgqpdZrYz7YqCsrCvky
   Q==;
X-CSE-ConnectionGUID: 1qUUJn7KT4O/e0pLpGpdnQ==
X-CSE-MsgGUID: 0IaFJBsJRgWM1/grTW+ekw==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="1012888"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="1012888"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 21:28:40 -0700
X-CSE-ConnectionGUID: vf/k7bvxQpCO/ZwZNCFuaw==
X-CSE-MsgGUID: TPxP3CUJTZmAo+w2gvHw0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="2081083"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Oct 2026 21:28:39 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHw28-00000000J48-3L4A;
	Sat, 17 Oct 2026 04:28:36 +0000
Date: Sat, 17 Oct 2026 12:28:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 04ac7b445880b0878c83e6e89d961455cbea0427
Message-ID: <202610171205.GOtqclyj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: 04ac7b445880b0878c83e6e89d961455cbea0427  MAINTAINERS: add Neill Kapron as USB Gadget maintainer

elapsed time: 901m

configs tested: 180
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2109-20261016    gcc-12.5.0 cocci
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261017    gcc-10.5.0
arc                   randconfig-1001-20261017    gcc-10.5.0
arc                  randconfig-r2101-20261016    gcc-8.5.0  cocci
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                       footbridge_defconfig    clang-24
arm                         multi_v5_defconfig    clang-24
arm                          nhk8815_defconfig    clang-24
arm                   randconfig-1000-20261017    gcc-10.5.0
arm                   randconfig-1001-20261017    gcc-10.5.0
arm                   randconfig-1002-20261017    gcc-10.5.0
arm                   randconfig-1003-20261017    gcc-10.5.0
arm                  randconfig-r2100-20261016    clang-24   cocci
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261017    clang-24
arm64                 randconfig-1001-20261017    clang-24
arm64                 randconfig-1002-20261017    clang-24
arm64                 randconfig-1003-20261017    clang-24
arm64                 randconfig-2000-20261016    gcc-13.4.0
arm64                 randconfig-2001-20261016    clang-18
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261017    clang-24
csky                  randconfig-1001-20261017    clang-24
csky                  randconfig-2000-20261016    gcc-16.1.0
csky                  randconfig-2001-20261016    gcc-12.5.0
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261017    clang-21
hexagon               randconfig-1001-20261017    clang-21
hexagon               randconfig-2000-20261016    clang-22
hexagon               randconfig-2001-20261016    clang-22
i386                               allnoconfig    gcc-16.1.0
i386        buildonly-randconfig-1000-20261017    gcc-14
i386        buildonly-randconfig-1001-20261017    gcc-14
i386        buildonly-randconfig-1002-20261017    gcc-14
i386        buildonly-randconfig-1003-20261017    gcc-14
i386        buildonly-randconfig-1004-20261017    gcc-14
i386        buildonly-randconfig-1005-20261017    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261017    clang-22
i386                  randconfig-1001-20261017    clang-22
i386                  randconfig-1002-20261017    clang-22
i386                  randconfig-1003-20261017    clang-22
i386                  randconfig-1004-20261017    clang-22
i386                  randconfig-1005-20261017    clang-22
i386                  randconfig-1006-20261017    clang-22
i386                  randconfig-1007-20261017    clang-22
i386                  randconfig-1008-20261017    clang-22
i386                  randconfig-1009-20261017    clang-22
i386                  randconfig-1010-20261017    clang-22
i386                  randconfig-1011-20261017    clang-22
i386                  randconfig-1012-20261017    clang-22
i386                  randconfig-1013-20261017    clang-22
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261017    clang-21
loongarch             randconfig-1001-20261017    clang-21
loongarch             randconfig-2000-20261016    gcc-16.1.0
loongarch             randconfig-2001-20261016    clang-18
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                            ip30_defconfig    clang-24
mips                    sb1250_swarm_defconfig    clang-24
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261017    clang-21
nios2                 randconfig-1001-20261017    clang-21
nios2                 randconfig-2000-20261016    gcc-8.5.0
nios2                 randconfig-2001-20261016    gcc-11.5.0
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2108-20261016    gcc-13.4.0 cocci
openrisc             randconfig-r2202-20261016    gcc-16.1.0 smatch
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261017    gcc-15.2.0
parisc                randconfig-1001-20261017    gcc-15.2.0
parisc                randconfig-2000-20261016    gcc-8.5.0
parisc                randconfig-2001-20261016    gcc-10.5.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                       chrp32_defconfig    clang-24
powerpc               randconfig-1000-20261017    gcc-15.2.0
powerpc               randconfig-1001-20261017    gcc-15.2.0
powerpc              randconfig-r2102-20261016    clang-24   cocci
powerpc64             randconfig-1000-20261017    gcc-15.2.0
powerpc64             randconfig-1001-20261017    gcc-15.2.0
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261017    clang-19
riscv                 randconfig-1001-20261017    clang-19
riscv                randconfig-r2103-20261016    clang-17   cocci
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261017    clang-19
s390                  randconfig-1001-20261017    clang-19
s390                  randconfig-2001-20261016    gcc-8.5.0
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                  kfr2r09-romimage_defconfig    clang-24
sh                    randconfig-1000-20261017    clang-19
sh                    randconfig-1001-20261017    clang-19
sh                    randconfig-2001-20261016    gcc-12.5.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261017    gcc-15.2.0
sparc                 randconfig-1001-20261017    gcc-15.2.0
sparc                        sparc32_defconfig    clang-24
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261017    gcc-15.2.0
sparc64               randconfig-1001-20261017    gcc-15.2.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261017    gcc-15.2.0
um                    randconfig-1001-20261017    gcc-15.2.0
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261017    gcc-14
x86_64      buildonly-randconfig-1001-20261017    gcc-14
x86_64      buildonly-randconfig-1002-20261017    gcc-14
x86_64      buildonly-randconfig-1003-20261017    gcc-14
x86_64      buildonly-randconfig-1004-20261017    gcc-14
x86_64      buildonly-randconfig-1005-20261017    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261017    gcc-14
x86_64                randconfig-1001-20261017    gcc-14
x86_64                randconfig-1002-20261017    gcc-14
x86_64                randconfig-1003-20261017    gcc-14
x86_64                randconfig-1004-20261017    gcc-14
x86_64                randconfig-1005-20261017    gcc-14
x86_64                randconfig-2200-20261016    gcc-14     smatch
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261017    gcc-15.2.0
xtensa                randconfig-1001-20261017    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
