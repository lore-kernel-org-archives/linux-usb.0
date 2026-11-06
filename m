Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793979773;
	b=y552hwcNMrF77O1YQc87oBtkaooXMILGBNOfWPjjTAUrE2CFP+GFgw43TsJ7907vgYPZ
	 8l+DmeoWwWs8gu2u2IZqZlANIqect1zDmofcXLSjmNyodklfKXqwvqOpDFNi7PXdkV2T+
	 EaPCqcRsPeoLQbEjoupE2bifpVpWAVBI+pm/O3hf9BnV/cu23trpXoQPybeFW1iX52WQP
	 OKfxKbbNUPxk8jgLv8RSwmA/6MO+ARf9KZECj8oNZVSi1lNxlvZb7MaZd022ep810EgAe
	 Q+Y/nQlMyFJqLV4thkA/YIxsVk31Sknqz3YEl04Gyf0Uv1otqhinsJ8kpOqoVmqHtNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979773;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=VtQMx25r3FFXPPr4F07h5y+ID2AYBGL7OcqyMl2Mqys=;
	b=3maYo31RFMHDBrs6MEK68joVDgG5Sq9YphG00dXWS1M8xYicqOoFgSGHxFdssszql98A
	 DQxcFT2M+AQbJOvqUU4Y9IaxtSn0DSwFPWzO7S2D/IVCB1K835LjX0OYWITVhiPOZzmJA
	 bUwPIyVEc4q6y088YmF+FPqOrNhgjrgx7DIGeckxrGAZwHQBIBuXyNrwUo/jp/2ESOAdA
	 RBFb7b/OeMS8mEe525SKEvdIEeSSgR5fftFVdq+fL5tf4jKiCAyRB3/V7CG6dsz776Wzu
	 cRCOEUTZAwBdUjl1lr6a0KEbT1O3k/1oQBHtbW5kaHAP+2s41/EnsjHlO1VCang513Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MpxM3SFj;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45525606A326
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 15:42:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45525606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MpxM3SFj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793979773; x=1825515773;
  h=date:from:to:cc:subject:message-id;
  bh=8DHZuRE8zA7SGmpO6WX5mVQwROYd0CVLOyA7/JEE/JE=;
  b=MpxM3SFjlzFGQWlAWqzMaLXTREjO3EeowTRDSlT+kOG9WsSlCxrnJkqO
   iqPWo4eVMaWqmVwsqHOpVKZqzZeMFuBRyb5iLDwE0Wye5DM8cwRx+2V1J
   sMf7tiHUFGCq9fwWLD0NZUzyyuCJCzTBiE/93GNvs0ZEfTNe+XG8pvU+H
   ojdCDpHdRpJrGwtab4ZctLabftuiIz8LA7AMXbANSPpReliI+1w7Y+Gre
   ELjGwGN17CWAGtAZc4lXnDs7OLpuu66VA7jMNXebR6hGhxiZHwamdgsTs
   y5Hu6I6+pEqyBONeoEXG3cQ4ZUfDRwK3uH/SA3B/U1dv3dFg/wAAQOLlg
   g==;
X-CSE-ConnectionGUID: JE+WKJjXSgSMa2hfoYscFg==
X-CSE-MsgGUID: nkv2vnWKSRaWT87WEioN2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2833821"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2833821"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 07:42:52 -0800
X-CSE-ConnectionGUID: 6pyyzCyxT0aRjDUFqxKqcQ==
X-CSE-MsgGUID: xR+LISUiQESD6dFQpes6iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7343140"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Nov 2026 07:42:50 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPM5X-00000000pS9-3pwn;
	Fri, 06 Nov 2026 15:42:47 +0000
Date: Fri, 06 Nov 2026 23:42:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 3149e8b3237f58d4dd440fc64c45c93404c4b064
Message-ID: <20261106234232.wx2eVHlC-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 3149e8b3237f58d4dd440fc64c45c93404c4b064  usb: xhci: fix 'num_active_eps' accounting on allocation failure

elapsed time: 1096m

configs tested: 468
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261105    gcc-15.3.0
alpha                 randconfig-2000-20261106    gcc-8.5.0
alpha                 randconfig-2001-20261105    gcc-15.3.0
alpha                 randconfig-2001-20261106    gcc-8.5.0
alpha                 randconfig-2200-20261106    gcc-14.4.0 smatch
alpha                randconfig-r2102-20261106    gcc-8.5.0  cocci
alpha                randconfig-r2105-20261106    gcc-11.5.0 cocci
alpha                randconfig-r2105-20261106    gcc-16.2.0 cocci
alpha                randconfig-r2106-20261106    clang-24   cocci
alpha                randconfig-r2107-20261106    clang-24   cocci
alpha                randconfig-r2110-20261106    gcc-16.2.0 cocci
alpha                randconfig-r2111-20261106    clang-24   cocci
alpha                randconfig-r2301-20261106    gcc-11.5.0 sparse
alpha                randconfig-r2304-20261106    gcc-12     sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                         nsim_700_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261106    gcc-8.5.0
arc                   randconfig-1001-20261106    gcc-8.5.0
arc                   randconfig-2000-20261106    gcc-12.5.0
arc                   randconfig-2001-20261106    gcc-12.5.0
arc                   randconfig-2002-20261106    gcc-12.5.0
arc                   randconfig-2003-20261106    gcc-12.5.0
arc                   randconfig-2004-20261106    gcc-12.5.0
arc                   randconfig-2005-20261106    gcc-12.5.0
arc                   randconfig-2200-20261106    gcc-10.5.0 smatch
arc                  randconfig-r2106-20261106    clang-24   cocci
arc                  randconfig-r2106-20261106    gcc-14.4.0 cocci
arc                  randconfig-r2107-20261106    clang-24   cocci
arc                  randconfig-r2109-20261106    clang-24   cocci
arc                  randconfig-r2302-20261106    gcc-11.5.0 sparse
arc                  randconfig-r2307-20261106    gcc-10.5.0 sparse
arc                         vdk_hs38_defconfig    gcc-16.2.0
arc                     vdk_hs38_smp_defconfig    gcc-16.2.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                         clps711x_defconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                          lpc32xx_defconfig    clang-17
arm                             mps2_defconfig    clang-24
arm                            omap1_defconfig    gcc-16.2.0
arm                        omap2plus_defconfig    gcc-16.2.0
arm                              pxa_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261106    gcc-8.5.0
arm                   randconfig-1001-20261106    gcc-8.5.0
arm                   randconfig-1002-20261106    gcc-8.5.0
arm                   randconfig-1003-20261106    gcc-8.5.0
arm                   randconfig-2000-20261106    gcc-9.5.0
arm                   randconfig-2001-20261106    gcc-9.5.0
arm                   randconfig-2002-20261106    gcc-9.5.0
arm                   randconfig-2200-20261106    clang-17   smatch
arm                  randconfig-r2104-20261106    gcc-16.2.0 cocci
arm                  randconfig-r2105-20261106    gcc-8.5.0  cocci
arm                  randconfig-r2107-20261106    gcc-16.2.0 cocci
arm                  randconfig-r2111-20261106    gcc-8.5.0  cocci
arm                              rpc_defconfig    gcc-16.2.0
arm                         spear3xx_defconfig    gcc-16.2.0
arm                            spitz_defconfig    gcc-16.2.0
arm                            tegra_defconfig    gcc-16.2.0
arm                        versatile_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261106    clang-17
arm64                 randconfig-1001-20261106    clang-17
arm64                 randconfig-1002-20261106    clang-17
arm64                 randconfig-1003-20261106    clang-17
arm64                 randconfig-2000-20261106    gcc-9.5.0
arm64                 randconfig-2001-20261106    gcc-9.5.0
arm64                 randconfig-2002-20261106    gcc-9.5.0
arm64                 randconfig-2200-20261106    clang-24   smatch
arm64                randconfig-r2100-20261106    gcc-10.5.0 cocci
arm64                randconfig-r2107-20261106    clang-24   cocci
arm64                randconfig-r2111-20261106    gcc-16.2.0 cocci
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261106    clang-17
csky                  randconfig-1001-20261106    clang-17
csky                  randconfig-2000-20261106    clang-24
csky                  randconfig-2001-20261106    clang-24
csky                  randconfig-2200-20261106    gcc-10.5.0 smatch
csky                 randconfig-r2105-20261105    clang-24   cocci
csky                 randconfig-r2108-20261106    clang-24   cocci
csky                 randconfig-r2108-20261106    gcc-8.5.0  cocci
csky                 randconfig-r2301-20261105    gcc-14     sparse
hexagon                           alldefconfig    clang-24
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261106    gcc-14.4.0
hexagon               randconfig-1001-20261106    gcc-14.4.0
hexagon               randconfig-2000-20261106    clang-24
hexagon               randconfig-2001-20261106    clang-24
hexagon               randconfig-2200-20261106    clang-24   smatch
hexagon              randconfig-r2102-20261105    clang-24   cocci
hexagon              randconfig-r2106-20261106    gcc-16.2.0 cocci
hexagon              randconfig-r2106-20261106    gcc-8.5.0  cocci
hexagon              randconfig-r2109-20261106    gcc-14.4.0 cocci
hexagon              randconfig-r2110-20261106    clang-24   cocci
hexagon              randconfig-r2308-20261106    clang-22   sparse
i386                               allnoconfig    gcc-16.2.0
i386        buildonly-randconfig-1000-20261106    clang-22
i386        buildonly-randconfig-1001-20261106    clang-22
i386        buildonly-randconfig-1002-20261106    clang-22
i386        buildonly-randconfig-1003-20261106    clang-22
i386        buildonly-randconfig-1004-20261106    clang-22
i386        buildonly-randconfig-1005-20261106    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261106    gcc-14
i386                  randconfig-1001-20261106    gcc-14
i386                  randconfig-1002-20261106    gcc-14
i386                  randconfig-1003-20261106    gcc-14
i386                  randconfig-1004-20261106    gcc-14
i386                  randconfig-1005-20261106    gcc-14
i386                  randconfig-1006-20261106    gcc-14
i386                  randconfig-1007-20261106    gcc-14
i386                  randconfig-1008-20261106    gcc-14
i386                  randconfig-1010-20261106    gcc-14
i386                  randconfig-1011-20261106    gcc-14
i386                  randconfig-1012-20261106    gcc-14
i386                  randconfig-1013-20261106    gcc-14
i386                  randconfig-2000-20261106    gcc-14
i386                  randconfig-2001-20261106    gcc-14
i386                  randconfig-2002-20261106    gcc-14
i386                  randconfig-2003-20261106    gcc-14
i386                  randconfig-2004-20261106    gcc-14
i386                  randconfig-2005-20261106    gcc-14
i386                  randconfig-2100-20261105    gcc-14     cocci
i386                  randconfig-2100-20261106    clang-22   cocci
i386                  randconfig-2101-20261105    gcc-14     cocci
i386                  randconfig-2101-20261106    clang-22   cocci
i386                  randconfig-2102-20261105    gcc-14     cocci
i386                  randconfig-2102-20261106    clang-22   cocci
i386                  randconfig-2103-20261105    gcc-14     cocci
i386                  randconfig-2103-20261106    clang-22   cocci
i386                  randconfig-2104-20261105    gcc-14     cocci
i386                  randconfig-2104-20261106    clang-22   cocci
i386                  randconfig-2105-20261105    gcc-14     cocci
i386                  randconfig-2105-20261106    clang-22   cocci
i386                  randconfig-2200-20261106    clang-22   smatch
i386                  randconfig-2300-20261105    clang-22   sparse
i386                  randconfig-2300-20261106    clang-22   sparse
i386                  randconfig-2301-20261105    clang-22   sparse
i386                  randconfig-2301-20261106    clang-22   sparse
i386                  randconfig-2302-20261105    clang-22   sparse
i386                  randconfig-2302-20261106    clang-22   sparse
i386                 randconfig-r2109-20261106    gcc-8.5.0  cocci
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261106    gcc-14.4.0
loongarch             randconfig-1001-20261106    gcc-14.4.0
loongarch             randconfig-2000-20261106    clang-19
loongarch             randconfig-2001-20261106    clang-19
loongarch             randconfig-2200-20261106    clang-24   smatch
loongarch            randconfig-r2106-20261106    clang-24   cocci
loongarch            randconfig-r2305-20261105    gcc-14     sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                         m5272c3_defconfig    gcc-16.2.0
m68k                        m5329evb_defconfig    clang-24
m68k                          nettel_defconfig    gcc-16.2.0
m68k                  randconfig-2000-20261105    gcc-15.3.0
m68k                  randconfig-2000-20261106    gcc-8.5.0
m68k                  randconfig-2001-20261105    gcc-15.3.0
m68k                  randconfig-2001-20261106    gcc-8.5.0
m68k                  randconfig-2200-20261106    gcc-11.5.0 smatch
m68k                 randconfig-r2103-20261106    gcc-10.5.0 cocci
m68k                 randconfig-r2104-20261106    gcc-10.5.0 cocci
m68k                 randconfig-r2110-20261106    gcc-8.5.0  cocci
m68k                 randconfig-r2305-20261106    gcc-11.5.0 sparse
m68k                 randconfig-r2306-20261106    gcc-10.5.0 sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261105    gcc-15.3.0
microblaze            randconfig-2000-20261106    gcc-8.5.0
microblaze            randconfig-2001-20261105    gcc-15.3.0
microblaze            randconfig-2001-20261106    gcc-8.5.0
microblaze            randconfig-2200-20261106    gcc-14.4.0 smatch
microblaze           randconfig-r2100-20261106    gcc-11.5.0 cocci
microblaze           randconfig-r2102-20261106    gcc-16.2.0 cocci
microblaze           randconfig-r2105-20261106    gcc-10.5.0 cocci
microblaze           randconfig-r2108-20261106    gcc-14.4.0 cocci
microblaze           randconfig-r2309-20261106    gcc-10.5.0 sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                        bmips_be_defconfig    gcc-16.2.0
mips                   cavium_octeon_defconfig    gcc-16.2.0
mips                          db1xxx_defconfig    gcc-16.2.0
mips                            ip28_defconfig    gcc-16.2.0
mips                       loongson3_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261106    gcc-8.5.0
mips                  randconfig-2001-20261106    gcc-8.5.0
mips                  randconfig-2002-20261106    gcc-8.5.0
mips                  randconfig-2200-20261106    clang-17   smatch
mips                 randconfig-r2104-20261106    gcc-11.5.0 cocci
mips                 randconfig-r2110-20261106    clang-24   cocci
mips                 randconfig-r2304-20261106    gcc-11.5.0 sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261106    gcc-14.4.0
nios2                 randconfig-1001-20261106    gcc-14.4.0
nios2                 randconfig-2000-20261106    clang-19
nios2                 randconfig-2001-20261106    clang-19
nios2                 randconfig-2200-20261106    gcc-10.5.0 smatch
nios2                randconfig-r2100-20261106    gcc-8.5.0  cocci
nios2                randconfig-r2102-20261106    gcc-10.5.0 cocci
nios2                randconfig-r2108-20261106    clang-24   cocci
nios2                randconfig-r2111-20261106    clang-24   cocci
nios2                randconfig-r2300-20261106    gcc-12     sparse
nios2                randconfig-r2303-20261106    gcc-11.5.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                    de0_nano_defconfig    gcc-16.2.0
openrisc                             defconfig    gcc-16.2.0
openrisc                   or1klitex_defconfig    clang-24
openrisc                   or1klitex_defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261106    gcc-8.5.0
openrisc              randconfig-2001-20261106    gcc-8.5.0
openrisc              randconfig-2002-20261106    gcc-8.5.0
openrisc              randconfig-2200-20261106    gcc-16.2.0 smatch
openrisc             randconfig-r2102-20261106    gcc-11.5.0 cocci
openrisc             randconfig-r2106-20261106    clang-24   cocci
openrisc             randconfig-r2304-20261105    gcc-14     sparse
openrisc             randconfig-r2310-20261106    gcc-10.5.0 sparse
openrisc                  simple_smp_defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261106    clang-19
parisc                randconfig-1001-20261106    clang-19
parisc                randconfig-2000-20261106    clang-19
parisc                randconfig-2001-20261106    clang-19
parisc                randconfig-2200-20261105    gcc-15.3.0 smatch
parisc                randconfig-2200-20261106    gcc-12.5.0 smatch
parisc               randconfig-r2104-20261106    gcc-8.5.0  cocci
parisc               randconfig-r2109-20261106    clang-24   cocci
parisc               randconfig-r2300-20261106    gcc-11.5.0 sparse
parisc               randconfig-r2308-20261106    gcc-10.5.0 sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                      ep8248e_defconfig    clang-24
powerpc                       ep88xc_defconfig    clang-17
powerpc                      kmeter1_defconfig    gcc-16.2.0
powerpc                       mgcoge_defconfig    clang-17
powerpc                      mpc512x_defconfig    gcc-16.2.0
powerpc                       pcm030_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261106    clang-19
powerpc               randconfig-1001-20261106    clang-19
powerpc               randconfig-2000-20261106    gcc-8.5.0
powerpc               randconfig-2001-20261106    gcc-8.5.0
powerpc               randconfig-2002-20261106    gcc-8.5.0
powerpc               randconfig-2200-20261105    clang-17   smatch
powerpc               randconfig-2200-20261106    clang-24   smatch
powerpc              randconfig-r2101-20261106    gcc-11.5.0 cocci
powerpc              randconfig-r2108-20261106    clang-24   cocci
powerpc              randconfig-r2111-20261106    gcc-14.4.0 cocci
powerpc                      redwood_defconfig    gcc-16.2.0
powerpc                     sam440ep_defconfig    gcc-16.2.0
powerpc                      tqm8560_defconfig    gcc-16.2.0
powerpc                  xes_mpc85xx_defconfig    clang-17
powerpc64             randconfig-1000-20261106    clang-19
powerpc64             randconfig-1001-20261106    clang-19
powerpc64             randconfig-2000-20261106    gcc-8.5.0
powerpc64             randconfig-2001-20261106    gcc-8.5.0
powerpc64             randconfig-2002-20261106    gcc-8.5.0
powerpc64             randconfig-2200-20261106    gcc-8.5.0  smatch
powerpc64            randconfig-r2101-20261106    gcc-16.2.0 cocci
powerpc64            randconfig-r2302-20261105    gcc-14     sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261106    gcc-14.4.0
riscv                 randconfig-1001-20261106    gcc-14.4.0
riscv                 randconfig-2000-20261106    gcc-13.5.0
riscv                 randconfig-2001-20261106    gcc-13.5.0
riscv                 randconfig-2002-20261106    gcc-13.5.0
riscv                 randconfig-2003-20261106    gcc-13.5.0
riscv                 randconfig-2004-20261106    gcc-13.5.0
riscv                 randconfig-2005-20261106    gcc-13.5.0
riscv                 randconfig-2200-20261106    gcc-11.5.0 smatch
riscv                randconfig-r2305-20261106    gcc-12     sparse
s390                              alldefconfig    clang-17
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261106    gcc-14.4.0
s390                  randconfig-1001-20261106    gcc-14.4.0
s390                  randconfig-2000-20261106    gcc-8.5.0
s390                  randconfig-2001-20261106    gcc-8.5.0
s390                  randconfig-2002-20261106    gcc-8.5.0
s390                  randconfig-2003-20261106    gcc-8.5.0
s390                  randconfig-2004-20261106    gcc-8.5.0
s390                  randconfig-2005-20261106    gcc-8.5.0
s390                  randconfig-2200-20261105    clang-24   smatch
s390                  randconfig-2200-20261106    clang-18   smatch
s390                 randconfig-r2101-20261106    gcc-8.5.0  cocci
s390                 randconfig-r2109-20261106    clang-24   cocci
s390                 randconfig-r2303-20261105    gcc-14     sparse
s390                 randconfig-r2307-20261106    clang-22   sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                  kfr2r09-romimage_defconfig    clang-17
sh                             migor_defconfig    clang-24
sh                    randconfig-1000-20261106    gcc-14.4.0
sh                    randconfig-1001-20261106    gcc-14.4.0
sh                    randconfig-2000-20261105    gcc-16.2.0
sh                    randconfig-2000-20261106    gcc-16.2.0
sh                    randconfig-2001-20261105    gcc-16.2.0
sh                    randconfig-2001-20261106    gcc-16.2.0
sh                    randconfig-2002-20261105    gcc-16.2.0
sh                    randconfig-2002-20261106    gcc-16.2.0
sh                    randconfig-2003-20261105    gcc-16.2.0
sh                    randconfig-2003-20261106    gcc-16.2.0
sh                    randconfig-2004-20261105    gcc-16.2.0
sh                    randconfig-2004-20261106    gcc-16.2.0
sh                    randconfig-2005-20261105    gcc-16.2.0
sh                    randconfig-2005-20261106    gcc-16.2.0
sh                    randconfig-2200-20261105    gcc-13.5.0 smatch
sh                    randconfig-2200-20261106    gcc-16.2.0 smatch
sh                   randconfig-r2101-20261105    clang-24   cocci
sh                   randconfig-r2103-20261106    gcc-11.5.0 cocci
sh                   randconfig-r2108-20261106    gcc-16.2.0 cocci
sh                            se7619_defconfig    gcc-16.2.0
sh                         sh7757lcr_defconfig    gcc-16.2.0
sh                              shx3_defconfig    clang-17
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261106    gcc-15.3.0
sparc                 randconfig-1001-20261106    gcc-15.3.0
sparc                 randconfig-2000-20261106    gcc-8.5.0
sparc                 randconfig-2001-20261106    gcc-8.5.0
sparc                 randconfig-2200-20261106    gcc-8.5.0  smatch
sparc                randconfig-r2107-20261106    gcc-14.4.0 cocci
sparc                randconfig-r2110-20261106    gcc-14.4.0 cocci
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261106    gcc-15.3.0
sparc64               randconfig-1001-20261106    gcc-15.3.0
sparc64               randconfig-2000-20261106    gcc-8.5.0
sparc64               randconfig-2001-20261106    gcc-8.5.0
sparc64               randconfig-2200-20261105    gcc-8.5.0  smatch
sparc64               randconfig-2200-20261106    gcc-8.5.0  smatch
sparc64              randconfig-r2100-20261105    clang-24   cocci
sparc64              randconfig-r2103-20261106    gcc-8.5.0  cocci
sparc64              randconfig-r2104-20261105    clang-24   cocci
sparc64              randconfig-r2109-20261106    clang-24   cocci
sparc64              randconfig-r2302-20261106    gcc-12     sparse
sparc64              randconfig-r2309-20261106    clang-22   sparse
sparc64              randconfig-r2311-20261106    clang-22   sparse
sparc64              randconfig-r2311-20261106    gcc-10.5.0 sparse
um                                alldefconfig    gcc-16.2.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261106    gcc-15.3.0
um                    randconfig-1001-20261106    gcc-15.3.0
um                    randconfig-2000-20261106    gcc-8.5.0
um                    randconfig-2001-20261106    gcc-8.5.0
um                    randconfig-2200-20261105    clang-19   smatch
um                    randconfig-2200-20261106    gcc-13     smatch
um                   randconfig-r2101-20261106    gcc-10.5.0 cocci
um                   randconfig-r2103-20261105    clang-24   cocci
um                   randconfig-r2103-20261106    gcc-16.2.0 cocci
um                   randconfig-r2108-20261106    clang-24   cocci
um                   randconfig-r2109-20261106    gcc-16.2.0 cocci
um                   randconfig-r2110-20261106    clang-24   cocci
um                   randconfig-r2300-20261105    gcc-14     sparse
um                   randconfig-r2303-20261106    gcc-12     sparse
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261106    gcc-13
x86_64      buildonly-randconfig-1001-20261106    gcc-13
x86_64      buildonly-randconfig-1002-20261106    gcc-13
x86_64      buildonly-randconfig-1003-20261106    gcc-13
x86_64      buildonly-randconfig-1004-20261106    gcc-13
x86_64      buildonly-randconfig-1005-20261106    gcc-13
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261106    clang-22
x86_64                randconfig-1001-20261106    clang-22
x86_64                randconfig-1002-20261106    clang-22
x86_64                randconfig-1003-20261106    clang-22
x86_64                randconfig-1004-20261106    clang-22
x86_64                randconfig-1005-20261106    clang-22
x86_64                randconfig-1006-20261106    clang-22
x86_64                randconfig-1007-20261106    clang-22
x86_64                randconfig-1008-20261106    clang-22
x86_64                randconfig-1009-20261106    clang-22
x86_64                randconfig-1010-20261106    clang-22
x86_64                randconfig-1011-20261106    clang-22
x86_64                randconfig-1012-20261106    gcc-14
x86_64                randconfig-1013-20261106    gcc-14
x86_64                randconfig-1014-20261106    gcc-14
x86_64                randconfig-1015-20261106    gcc-14
x86_64                randconfig-1016-20261106    gcc-14
x86_64                randconfig-1017-20261106    gcc-14
x86_64                randconfig-2000-20261106    gcc-14
x86_64                randconfig-2001-20261106    gcc-14
x86_64                randconfig-2002-20261106    gcc-14
x86_64                randconfig-2003-20261106    gcc-14
x86_64                randconfig-2004-20261106    gcc-14
x86_64                randconfig-2005-20261106    gcc-14
x86_64                randconfig-2100-20261105    gcc-14     cocci
x86_64                randconfig-2100-20261106    clang-22   cocci
x86_64                randconfig-2101-20261105    gcc-14     cocci
x86_64                randconfig-2101-20261106    clang-22   cocci
x86_64                randconfig-2102-20261105    gcc-14     cocci
x86_64                randconfig-2102-20261106    clang-22   cocci
x86_64                randconfig-2103-20261105    gcc-14     cocci
x86_64                randconfig-2103-20261106    clang-22   cocci
x86_64                randconfig-2104-20261105    gcc-14     cocci
x86_64                randconfig-2104-20261106    clang-22   cocci
x86_64                randconfig-2105-20261105    gcc-14     cocci
x86_64                randconfig-2105-20261106    clang-22   cocci
x86_64                randconfig-2200-20261106    gcc-14     smatch
x86_64                randconfig-2300-20261105    clang-22   sparse
x86_64                randconfig-2300-20261106    clang-22   sparse
x86_64                randconfig-2301-20261105    clang-22   sparse
x86_64                randconfig-2301-20261106    clang-22   sparse
x86_64                randconfig-2302-20261105    clang-22   sparse
x86_64                randconfig-2302-20261106    clang-22   sparse
x86_64               randconfig-r2107-20261106    clang-24   cocci
x86_64               randconfig-r2107-20261106    gcc-8.5.0  cocci
x86_64               randconfig-r2301-20261106    gcc-12     sparse
x86_64               randconfig-r2306-20261106    clang-22   sparse
x86_64               randconfig-r2310-20261106    clang-22   sparse
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    clang-22
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                   nommu_kc705_defconfig    clang-24
xtensa                randconfig-1000-20261106    gcc-15.3.0
xtensa                randconfig-1001-20261106    gcc-15.3.0
xtensa                randconfig-2000-20261106    clang-24
xtensa                randconfig-2001-20261106    clang-24
xtensa                randconfig-2200-20261106    gcc-8.5.0  smatch
xtensa               randconfig-r2100-20261106    gcc-16.2.0 cocci
xtensa               randconfig-r2111-20261106    clang-24   cocci
xtensa                     xip_kc705_defconfig    clang-17

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
