Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371798;
	b=LTl4lCA6EblDV6tD2JClHXPqXS8ds9U3BLpVYTuNN4v6uTDQxRnq3lho6OgY8tcjWeGm
	 S6qJAXkVlH+2IC3JbDb5C3OIG+1vNS53izZWCBB71zes6dmsTBqpz5eeD0J3yX1ur9b56
	 9CIs6l6g5NmV75LmrrNZcWdTXXyelUhj/1b5jOaIf+pqR3mVmwfIBIAfbnr063NhIOEKJ
	 i3njZO0I0/WS6NMHduMaTsfE8+7WfC6N+whKBQ2UNwPIsbP6XJriNTQVeFFxUzKPmf3GM
	 0u7TdhgdCjGyFIov5HS0w5tWWhWvGti/jX9X7B/pHnzvnirZ/7KLHHjtU4DM/KARNAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371798;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=V+sLkg6FqKbFiDQ/mI0fGWWbk5vuMTZduQrJi/RlUuc=;
	b=huvY7rzNIevOH2BOw8viTDQ6SykYBGA0dvQLU7iGiZRe/ywQSB731R/19G85eVDf70jC
	 EtgHdiESzjENZZIbdy9KHG0wtbDV4Yj2WNaL0QiogGuNQN1qid02lCaEXcnHAT2U+S4Ev
	 71AtiGmlgT06/TjaS+w+J6NIUOcmmd8QMS4DYew6EEJ8SbokcQH3ZNPiKVJ8D5VV6SHQo
	 BsRmlOLEGJSxiRT9ja7tC5kVCUV63nFV9U8ga/557OxnLthq5bvZjO1kvSQhqlzxdj7FQ
	 OIZGHbJKHMKqv4VxlZxn5HtNdvYlPeMdjqNd9yenpWIMWc7z2INCsfplntp0Z+Qk9xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i8uNoOmV;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DFF606A320
	for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 18:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72DFF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i8uNoOmV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795371796; x=1826907796;
  h=date:from:to:cc:subject:message-id;
  bh=W6KLK6rtGIYQXsZoX7AM2IgAshDbawAKp9BMxm6mYAg=;
  b=i8uNoOmVV4lf4cpQU3lEVE4VCL6N81+iddDXW4CzYNqyEeZsKVkN8+rY
   k9jXDRl51lRaU2SllvDzHzVedkB+3+5tc91ttWeH12gwVSzVy+zTO1zVN
   FfzmAIcEXvEN5qhZl62c2TdZKn2ReHUnOhYTerzzqxpUS9KYnwupWcGsi
   bQSzL6Y6L1XQxdu/J9fiAYl+jvJwMowirWE8NMhmUiqkEK85NvlHRY5JZ
   fDe/q32FoXnsPsx17/l+DynE4leWyPKcXcnKklRY6w1BRoYobM0IGYsRO
   NDpl51tYKxNMXrjpIr8ISM9v+Dvr2L19nbujZya9zokyi3hWZmuvLUySB
   Q==;
X-CSE-ConnectionGUID: 1T7i+OOTTBGzoqGvOw+Ubg==
X-CSE-MsgGUID: PPrPTIOxQvqzuvCNsIGKzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4095194"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4095194"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 10:23:16 -0800
X-CSE-ConnectionGUID: l9J18JC3S2GIE0ORyxhH1A==
X-CSE-MsgGUID: 1f7i4LDbS4uomrGwJMXM6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11691632"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Nov 2026 10:23:14 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVCDX-00000001LuI-3FhH;
	Sun, 22 Nov 2026 18:23:11 +0000
Date: Mon, 23 Nov 2026 02:22:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 b0baaf6cbb16bc773d0c76916aac17c44a6cd557
Message-ID: <20261123022240.pOTJSZGk-lkp@intel.com>
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
branch HEAD: b0baaf6cbb16bc773d0c76916aac17c44a6cd557  usb: typec: ucsi: acpi: Add DMI quirk for Dell XPS platforms

elapsed time: 1281m

configs tested: 580
configs skipped: 16

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261120    gcc-15.3.0
alpha                 randconfig-2000-20261121    gcc-14.4.0
alpha                 randconfig-2000-20261122    gcc-8.5.0
alpha                 randconfig-2001-20261120    gcc-15.3.0
alpha                 randconfig-2001-20261121    gcc-14.4.0
alpha                 randconfig-2001-20261122    gcc-8.5.0
alpha                 randconfig-2200-20261120    gcc-15.3.0 smatch
alpha                 randconfig-2200-20261121    gcc-10.5.0 smatch
alpha                randconfig-r2106-20261121    gcc-11.5.0 cocci
alpha                randconfig-r2304-20261122    clang-24   sparse
alpha                randconfig-r2308-20261122    gcc-13.5.0 sparse
alpha                randconfig-r2309-20261121    gcc-11.5.0 sparse
arc                               allmodconfig    clang-24
arc                               allmodconfig    gcc-16.2.0
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261122    clang-17
arc                   randconfig-1001-20261122    clang-17
arc                   randconfig-2000-20261120    gcc-11.5.0
arc                   randconfig-2000-20261121    gcc-8.5.0
arc                   randconfig-2001-20261120    gcc-11.5.0
arc                   randconfig-2001-20261121    gcc-8.5.0
arc                   randconfig-2002-20261120    gcc-11.5.0
arc                   randconfig-2002-20261121    gcc-8.5.0
arc                   randconfig-2003-20261120    gcc-11.5.0
arc                   randconfig-2003-20261121    gcc-8.5.0
arc                   randconfig-2004-20261120    gcc-11.5.0
arc                   randconfig-2004-20261121    gcc-8.5.0
arc                   randconfig-2005-20261120    gcc-11.5.0
arc                   randconfig-2005-20261121    gcc-8.5.0
arc                   randconfig-2200-20261120    gcc-15.3.0 smatch
arc                   randconfig-2200-20261121    gcc-14.4.0 smatch
arc                  randconfig-r2109-20261120    gcc-8.5.0  cocci
arc                  randconfig-r2110-20261120    gcc-8.5.0  cocci
arc                  randconfig-r2111-20261121    gcc-14.4.0 cocci
arc                  randconfig-r2300-20261121    clang-24   sparse
arc                  randconfig-r2303-20261121    clang-24   sparse
arc                  randconfig-r2304-20261120    clang-24   sparse
arc                  randconfig-r2309-20261120    clang-24   sparse
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                   randconfig-1000-20261122    clang-17
arm                   randconfig-1001-20261122    clang-17
arm                   randconfig-1002-20261122    clang-17
arm                   randconfig-1003-20261122    clang-17
arm                   randconfig-2000-20261120    gcc-8.5.0
arm                   randconfig-2000-20261121    clang-24
arm                   randconfig-2001-20261120    gcc-8.5.0
arm                   randconfig-2001-20261121    clang-24
arm                   randconfig-2002-20261120    gcc-8.5.0
arm                   randconfig-2002-20261121    clang-24
arm                   randconfig-2200-20261120    clang-17   smatch
arm                   randconfig-2200-20261121    clang-19   smatch
arm                  randconfig-r2105-20261120    gcc-14     cocci
arm                  randconfig-r2106-20261120    gcc-8.5.0  cocci
arm                  randconfig-r2111-20261120    gcc-16.2.0 cocci
arm                  randconfig-r2302-20261122    gcc-11.5.0 sparse
arm                  randconfig-r2309-20261120    gcc-8.5.0  sparse
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261122    gcc-8.5.0
arm64                 randconfig-1001-20261122    gcc-8.5.0
arm64                 randconfig-1002-20261122    gcc-8.5.0
arm64                 randconfig-1003-20261122    gcc-8.5.0
arm64                 randconfig-2000-20261120    gcc-8.5.0
arm64                 randconfig-2000-20261121    clang-24
arm64                 randconfig-2001-20261120    gcc-8.5.0
arm64                 randconfig-2001-20261121    clang-24
arm64                 randconfig-2002-20261120    gcc-8.5.0
arm64                 randconfig-2002-20261121    clang-24
arm64                 randconfig-2200-20261120    clang-17   smatch
arm64                 randconfig-2200-20261121    clang-22   smatch
arm64                randconfig-r2101-20261120    gcc-14     cocci
arm64                randconfig-r2102-20261120    clang-24   cocci
arm64                randconfig-r2300-20261120    clang-24   sparse
arm64                randconfig-r2301-20261120    gcc-8.5.0  sparse
arm64                randconfig-r2305-20261120    gcc-9.5.0  sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261122    gcc-8.5.0
csky                  randconfig-1001-20261122    gcc-8.5.0
csky                  randconfig-2000-20261120    gcc-16.2.0
csky                  randconfig-2000-20261121    gcc-16.2.0
csky                  randconfig-2001-20261120    gcc-16.2.0
csky                  randconfig-2001-20261121    gcc-16.2.0
csky                  randconfig-2200-20261120    gcc-15.3.0 smatch
csky                  randconfig-2200-20261121    gcc-16.2.0 smatch
csky                 randconfig-r2100-20261121    gcc-10.5.0 cocci
csky                 randconfig-r2101-20261122    gcc-14     cocci
csky                 randconfig-r2105-20261120    gcc-16.2.0 cocci
csky                 randconfig-r2105-20261122    gcc-14     cocci
csky                 randconfig-r2109-20261121    gcc-11.5.0 cocci
csky                 randconfig-r2111-20261121    clang-24   cocci
csky                 randconfig-r2306-20261120    gcc-14.4.0 sparse
csky                 randconfig-r2307-20261121    gcc-11.5.0 sparse
csky                 randconfig-r2309-20261120    gcc-14.4.0 sparse
csky                 randconfig-r2309-20261122    gcc-13.5.0 sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-2000-20261120    gcc-16.2.0
hexagon               randconfig-2000-20261121    gcc-16.2.0
hexagon               randconfig-2001-20261120    gcc-16.2.0
hexagon               randconfig-2001-20261121    gcc-16.2.0
hexagon               randconfig-2200-20261120    clang-17   smatch
hexagon               randconfig-2200-20261121    clang-24   smatch
hexagon              randconfig-r2102-20261122    gcc-14     cocci
hexagon              randconfig-r2106-20261120    clang-17   cocci
hexagon              randconfig-r2108-20261120    gcc-16.2.0 cocci
hexagon              randconfig-r2108-20261120    gcc-8.5.0  cocci
hexagon              randconfig-r2108-20261121    gcc-14.4.0 cocci
hexagon              randconfig-r2305-20261122    gcc-11.5.0 sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261122    gcc-14
i386        buildonly-randconfig-1001-20261122    gcc-14
i386        buildonly-randconfig-1002-20261122    gcc-14
i386        buildonly-randconfig-1003-20261122    gcc-14
i386        buildonly-randconfig-1004-20261122    gcc-14
i386        buildonly-randconfig-1005-20261122    gcc-14
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261122    gcc-14
i386                  randconfig-1001-20261122    gcc-14
i386                  randconfig-1002-20261122    gcc-14
i386                  randconfig-1003-20261122    gcc-14
i386                  randconfig-1004-20261122    gcc-14
i386                  randconfig-1005-20261122    gcc-14
i386                  randconfig-1006-20261122    gcc-14
i386                  randconfig-1007-20261122    gcc-14
i386                  randconfig-1008-20261122    gcc-14
i386                  randconfig-1009-20261122    gcc-14
i386                  randconfig-1010-20261122    gcc-14
i386                  randconfig-1011-20261122    gcc-14
i386                  randconfig-1012-20261122    gcc-14
i386                  randconfig-1013-20261122    gcc-14
i386                  randconfig-2000-20261120    clang-22
i386                  randconfig-2000-20261121    gcc-14
i386                  randconfig-2001-20261120    clang-22
i386                  randconfig-2001-20261121    gcc-14
i386                  randconfig-2002-20261120    clang-22
i386                  randconfig-2002-20261121    gcc-14
i386                  randconfig-2003-20261120    clang-22
i386                  randconfig-2003-20261121    gcc-14
i386                  randconfig-2004-20261120    clang-22
i386                  randconfig-2004-20261121    gcc-14
i386                  randconfig-2005-20261120    clang-22
i386                  randconfig-2005-20261121    gcc-14
i386                  randconfig-2100-20261120    gcc-14     cocci
i386                  randconfig-2100-20261121    clang-22   cocci
i386                  randconfig-2101-20261120    gcc-14     cocci
i386                  randconfig-2101-20261121    clang-22   cocci
i386                  randconfig-2102-20261120    gcc-14     cocci
i386                  randconfig-2102-20261121    clang-22   cocci
i386                  randconfig-2103-20261120    gcc-14     cocci
i386                  randconfig-2103-20261121    clang-22   cocci
i386                  randconfig-2104-20261120    gcc-14     cocci
i386                  randconfig-2104-20261121    clang-22   cocci
i386                  randconfig-2105-20261120    gcc-14     cocci
i386                  randconfig-2105-20261121    clang-22   cocci
i386                  randconfig-2200-20261120    clang-22   smatch
i386                  randconfig-2200-20261121    clang-22   smatch
i386                  randconfig-2300-20261120    clang-22   sparse
i386                  randconfig-2300-20261121    gcc-14     sparse
i386                  randconfig-2301-20261120    clang-22   sparse
i386                  randconfig-2301-20261121    gcc-14     sparse
i386                  randconfig-2302-20261120    clang-22   sparse
i386                  randconfig-2302-20261121    gcc-14     sparse
i386                 randconfig-r2100-20261120    gcc-14     cocci
i386                 randconfig-r2103-20261121    gcc-10.5.0 cocci
i386                 randconfig-r2104-20261122    gcc-14     cocci
i386                 randconfig-r2110-20261120    clang-17   cocci
i386                 randconfig-r2111-20261120    clang-17   cocci
i386                 randconfig-r2301-20261122    gcc-11.5.0 sparse
i386                 randconfig-r2302-20261120    gcc-8.5.0  sparse
i386                 randconfig-r2306-20261122    gcc-13.5.0 sparse
i386                 randconfig-r2311-20261122    gcc-13.5.0 sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-2000-20261120    clang-24
loongarch             randconfig-2000-20261121    clang-22
loongarch             randconfig-2001-20261120    clang-24
loongarch             randconfig-2001-20261121    clang-22
loongarch             randconfig-2200-20261120    clang-18   smatch
loongarch             randconfig-2200-20261121    gcc-16.2.0 smatch
loongarch            randconfig-r2101-20261120    clang-24   cocci
loongarch            randconfig-r2103-20261120    clang-24   cocci
loongarch            randconfig-r2104-20261120    clang-24   cocci
loongarch            randconfig-r2109-20261120    clang-17   cocci
loongarch            randconfig-r2110-20261120    gcc-8.5.0  cocci
loongarch            randconfig-r2111-20261120    gcc-8.5.0  cocci
loongarch            randconfig-r2111-20261121    gcc-11.5.0 cocci
loongarch            randconfig-r2304-20261122    gcc-11.5.0 sparse
loongarch            randconfig-r2305-20261120    clang-20   sparse
loongarch            randconfig-r2307-20261122    gcc-13.5.0 sparse
loongarch            randconfig-r2310-20261120    gcc-8.5.0  sparse
loongarch            randconfig-r2311-20261120    clang-24   sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                              allyesconfig    gcc-16.2.0
m68k                          amcore_defconfig    gcc-16.2.0
m68k                                 defconfig    clang-24
m68k                  randconfig-2000-20261120    gcc-15.3.0
m68k                  randconfig-2000-20261121    gcc-14.4.0
m68k                  randconfig-2000-20261122    gcc-8.5.0
m68k                  randconfig-2001-20261120    gcc-15.3.0
m68k                  randconfig-2001-20261121    gcc-14.4.0
m68k                  randconfig-2001-20261122    gcc-8.5.0
m68k                  randconfig-2200-20261120    gcc-14.4.0 smatch
m68k                  randconfig-2200-20261121    gcc-8.5.0  smatch
m68k                 randconfig-r2101-20261120    clang-24   cocci
m68k                 randconfig-r2104-20261120    clang-24   cocci
m68k                 randconfig-r2105-20261120    clang-24   cocci
m68k                 randconfig-r2110-20261120    gcc-16.2.0 cocci
m68k                 randconfig-r2301-20261120    gcc-9.5.0  sparse
m68k                 randconfig-r2310-20261121    gcc-11.5.0 sparse
m68k                 randconfig-r2310-20261122    gcc-13.5.0 sparse
m68k                 randconfig-r2311-20261121    gcc-11.5.0 sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261120    gcc-15.3.0
microblaze            randconfig-2000-20261121    gcc-14.4.0
microblaze            randconfig-2000-20261122    gcc-8.5.0
microblaze            randconfig-2001-20261120    gcc-15.3.0
microblaze            randconfig-2001-20261121    gcc-14.4.0
microblaze            randconfig-2001-20261122    gcc-8.5.0
microblaze            randconfig-2200-20261120    gcc-11.5.0 smatch
microblaze            randconfig-2200-20261121    gcc-8.5.0  smatch
microblaze           randconfig-r2102-20261121    gcc-10.5.0 cocci
microblaze           randconfig-r2103-20261120    gcc-14     cocci
microblaze           randconfig-r2105-20261121    gcc-10.5.0 cocci
microblaze           randconfig-r2106-20261120    gcc-16.2.0 cocci
microblaze           randconfig-r2109-20261121    clang-24   cocci
microblaze           randconfig-r2300-20261120    gcc-8.5.0  sparse
microblaze           randconfig-r2306-20261120    gcc-8.5.0  sparse
microblaze           randconfig-r2311-20261121    gcc-11.5.0 sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                         bcm47xx_defconfig    gcc-16.2.0
mips                        bmips_be_defconfig    gcc-16.2.0
mips                         qi_lb60_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261120    gcc-9.5.0
mips                  randconfig-2000-20261121    gcc-16.2.0
mips                  randconfig-2001-20261120    gcc-9.5.0
mips                  randconfig-2001-20261121    gcc-16.2.0
mips                  randconfig-2002-20261120    gcc-9.5.0
mips                  randconfig-2002-20261121    gcc-16.2.0
mips                  randconfig-2200-20261120    clang-24   smatch
mips                  randconfig-2200-20261121    clang-21   smatch
mips                 randconfig-r2101-20261120    gcc-16.2.0 cocci
mips                 randconfig-r2103-20261120    gcc-16.2.0 cocci
mips                 randconfig-r2104-20261120    gcc-14     cocci
mips                 randconfig-r2107-20261120    gcc-8.5.0  cocci
mips                 randconfig-r2108-20261120    gcc-8.5.0  cocci
mips                 randconfig-r2110-20261121    gcc-14.4.0 cocci
mips                 randconfig-r2302-20261120    clang-24   sparse
mips                 randconfig-r2304-20261121    clang-24   sparse
mips                 randconfig-r2308-20261120    gcc-8.5.0  sparse
nios2                             allmodconfig    clang-20
nios2                             allmodconfig    gcc-11.5.0
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-2000-20261120    clang-24
nios2                 randconfig-2000-20261121    clang-22
nios2                 randconfig-2001-20261120    clang-24
nios2                 randconfig-2001-20261121    clang-22
nios2                 randconfig-2200-20261120    gcc-11.5.0 smatch
nios2                 randconfig-2200-20261121    gcc-10.5.0 smatch
nios2                randconfig-r2103-20261120    clang-24   cocci
nios2                randconfig-r2104-20261121    gcc-10.5.0 cocci
nios2                randconfig-r2107-20261121    gcc-11.5.0 cocci
nios2                randconfig-r2300-20261122    gcc-11.5.0 sparse
nios2                randconfig-r2303-20261122    gcc-11.5.0 sparse
nios2                randconfig-r2304-20261120    gcc-9.5.0  sparse
nios2                randconfig-r2306-20261120    clang-24   sparse
openrisc                          allmodconfig    clang-20
openrisc                          allmodconfig    gcc-11.5.0
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261120    gcc-9.5.0
openrisc              randconfig-2000-20261121    gcc-16.2.0
openrisc              randconfig-2001-20261120    gcc-9.5.0
openrisc              randconfig-2001-20261121    gcc-16.2.0
openrisc              randconfig-2002-20261120    gcc-9.5.0
openrisc              randconfig-2002-20261121    gcc-16.2.0
openrisc              randconfig-2200-20261120    gcc-11.5.0 smatch
openrisc              randconfig-2200-20261121    gcc-14.4.0 smatch
openrisc              randconfig-2200-20261122    gcc-16.2.0 smatch
openrisc             randconfig-r2102-20261120    gcc-14     cocci
openrisc             randconfig-r2110-20261121    clang-24   cocci
openrisc             randconfig-r2302-20261122    clang-24   sparse
openrisc             randconfig-r2305-20261120    clang-24   sparse
openrisc             randconfig-r2305-20261120    gcc-8.5.0  sparse
openrisc             randconfig-r2311-20261120    gcc-14.4.0 sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261122    clang-24
parisc                randconfig-1001-20261122    clang-24
parisc                randconfig-2000-20261120    clang-24
parisc                randconfig-2000-20261121    clang-22
parisc                randconfig-2001-20261120    clang-24
parisc                randconfig-2001-20261121    clang-22
parisc                randconfig-2200-20261120    gcc-8.5.0  smatch
parisc                randconfig-2200-20261121    gcc-16.2.0 smatch
parisc               randconfig-r2101-20261121    gcc-10.5.0 cocci
parisc               randconfig-r2108-20261121    gcc-11.5.0 cocci
parisc               randconfig-r2109-20261120    gcc-16.2.0 cocci
parisc               randconfig-r2306-20261121    gcc-11.5.0 sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                       cm5200_defconfig    gcc-16.2.0
powerpc                  mpc837x_rdb_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261122    clang-24
powerpc               randconfig-1001-20261122    clang-24
powerpc               randconfig-2000-20261120    clang-24
powerpc               randconfig-2000-20261121    clang-24
powerpc               randconfig-2001-20261120    clang-24
powerpc               randconfig-2001-20261121    clang-24
powerpc               randconfig-2002-20261120    clang-24
powerpc               randconfig-2002-20261121    clang-24
powerpc               randconfig-2200-20261120    clang-17   smatch
powerpc               randconfig-2200-20261121    gcc-11.5.0 smatch
powerpc              randconfig-r2100-20261120    clang-24   cocci
powerpc              randconfig-r2102-20261120    gcc-16.2.0 cocci
powerpc              randconfig-r2300-20261120    gcc-9.5.0  sparse
powerpc              randconfig-r2301-20261120    clang-20   sparse
powerpc              randconfig-r2301-20261121    clang-24   sparse
powerpc              randconfig-r2301-20261122    clang-24   sparse
powerpc              randconfig-r2303-20261122    clang-24   sparse
powerpc              randconfig-r2304-20261120    clang-20   sparse
powerpc              randconfig-r2305-20261122    clang-24   sparse
powerpc              randconfig-r2308-20261120    clang-24   sparse
powerpc              randconfig-r2310-20261120    gcc-14.4.0 sparse
powerpc                      tqm8540_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261122    clang-24
powerpc64             randconfig-1001-20261122    clang-24
powerpc64             randconfig-2000-20261120    clang-24
powerpc64             randconfig-2000-20261121    clang-24
powerpc64             randconfig-2001-20261120    clang-24
powerpc64             randconfig-2001-20261121    clang-24
powerpc64             randconfig-2002-20261120    clang-24
powerpc64             randconfig-2002-20261121    clang-24
powerpc64             randconfig-2200-20261120    gcc-16.2.0 smatch
powerpc64             randconfig-2200-20261121    gcc-10.5.0 smatch
powerpc64            randconfig-r2100-20261120    clang-24   cocci
powerpc64            randconfig-r2109-20261121    gcc-14.4.0 cocci
powerpc64            randconfig-r2302-20261120    clang-20   sparse
powerpc64            randconfig-r2303-20261120    gcc-8.5.0  sparse
powerpc64            randconfig-r2307-20261121    gcc-11.5.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261122    gcc-9.5.0
riscv                 randconfig-1001-20261122    gcc-9.5.0
riscv                 randconfig-2000-20261120    clang-24
riscv                 randconfig-2000-20261121    gcc-9.5.0
riscv                 randconfig-2001-20261120    clang-24
riscv                 randconfig-2001-20261121    gcc-9.5.0
riscv                 randconfig-2002-20261120    clang-24
riscv                 randconfig-2002-20261121    gcc-9.5.0
riscv                 randconfig-2003-20261120    clang-24
riscv                 randconfig-2003-20261121    gcc-9.5.0
riscv                 randconfig-2004-20261120    clang-24
riscv                 randconfig-2004-20261121    gcc-9.5.0
riscv                 randconfig-2005-20261120    clang-24
riscv                 randconfig-2005-20261121    gcc-9.5.0
riscv                 randconfig-2200-20261120    gcc-8.5.0  smatch
riscv                 randconfig-2200-20261121    clang-24   smatch
riscv                randconfig-r2102-20261120    clang-24   cocci
riscv                randconfig-r2107-20261121    clang-24   cocci
riscv                randconfig-r2108-20261120    clang-17   cocci
riscv                randconfig-r2300-20261120    clang-20   sparse
riscv                randconfig-r2307-20261120    gcc-14.4.0 sparse
riscv                randconfig-r2310-20261120    clang-24   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261122    gcc-9.5.0
s390                  randconfig-1001-20261122    gcc-9.5.0
s390                  randconfig-2000-20261120    clang-24
s390                  randconfig-2000-20261121    clang-22
s390                  randconfig-2001-20261120    clang-24
s390                  randconfig-2001-20261121    clang-22
s390                  randconfig-2002-20261120    clang-24
s390                  randconfig-2002-20261121    clang-22
s390                  randconfig-2003-20261120    clang-24
s390                  randconfig-2003-20261121    clang-22
s390                  randconfig-2004-20261120    clang-24
s390                  randconfig-2004-20261121    clang-22
s390                  randconfig-2005-20261120    clang-24
s390                  randconfig-2005-20261121    clang-22
s390                  randconfig-2200-20261120    clang-17   smatch
s390                  randconfig-2200-20261121    gcc-8.5.0  smatch
s390                 randconfig-r2106-20261121    gcc-14.4.0 cocci
s390                 randconfig-r2108-20261121    clang-24   cocci
s390                 randconfig-r2110-20261121    gcc-11.5.0 cocci
s390                 randconfig-r2305-20261121    clang-24   sparse
s390                 randconfig-r2306-20261121    gcc-11.5.0 sparse
s390                 randconfig-r2307-20261120    clang-24   sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261122    gcc-9.5.0
sh                    randconfig-1001-20261122    gcc-9.5.0
sh                    randconfig-2000-20261120    gcc-11.5.0
sh                    randconfig-2000-20261121    gcc-16.2.0
sh                    randconfig-2000-20261122    gcc-13.5.0
sh                    randconfig-2001-20261120    gcc-11.5.0
sh                    randconfig-2001-20261121    gcc-16.2.0
sh                    randconfig-2001-20261122    gcc-13.5.0
sh                    randconfig-2002-20261120    gcc-11.5.0
sh                    randconfig-2002-20261121    gcc-16.2.0
sh                    randconfig-2002-20261122    gcc-13.5.0
sh                    randconfig-2003-20261120    gcc-11.5.0
sh                    randconfig-2003-20261121    gcc-16.2.0
sh                    randconfig-2003-20261122    gcc-13.5.0
sh                    randconfig-2004-20261120    gcc-11.5.0
sh                    randconfig-2004-20261121    gcc-16.2.0
sh                    randconfig-2004-20261122    gcc-13.5.0
sh                    randconfig-2005-20261120    gcc-11.5.0
sh                    randconfig-2005-20261121    gcc-16.2.0
sh                    randconfig-2005-20261122    gcc-13.5.0
sh                    randconfig-2200-20261120    gcc-11.5.0 smatch
sh                    randconfig-2200-20261121    gcc-10.5.0 smatch
sh                   randconfig-r2303-20261120    clang-20   sparse
sh                   randconfig-r2311-20261120    gcc-8.5.0  sparse
sparc                             alldefconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261122    clang-24
sparc                 randconfig-1001-20261122    clang-24
sparc                 randconfig-2000-20261120    gcc-8.5.0
sparc                 randconfig-2000-20261121    gcc-8.5.0
sparc                 randconfig-2001-20261120    gcc-8.5.0
sparc                 randconfig-2001-20261121    gcc-8.5.0
sparc                 randconfig-2200-20261120    gcc-11.5.0 smatch
sparc                 randconfig-2200-20261121    gcc-8.5.0  smatch
sparc                randconfig-r2107-20261121    gcc-14.4.0 cocci
sparc                randconfig-r2302-20261120    gcc-9.5.0  sparse
sparc                randconfig-r2307-20261120    gcc-8.5.0  sparse
sparc                randconfig-r2310-20261121    gcc-11.5.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261122    clang-24
sparc64               randconfig-1001-20261122    clang-24
sparc64               randconfig-2000-20261120    gcc-8.5.0
sparc64               randconfig-2000-20261121    gcc-8.5.0
sparc64               randconfig-2001-20261120    gcc-8.5.0
sparc64               randconfig-2001-20261121    gcc-8.5.0
sparc64               randconfig-2200-20261120    gcc-14.4.0 smatch
sparc64               randconfig-2200-20261121    clang-20   smatch
sparc64              randconfig-r2106-20261121    clang-24   cocci
sparc64              randconfig-r2107-20261120    clang-17   cocci
sparc64              randconfig-r2111-20261120    gcc-8.5.0  cocci
sparc64              randconfig-r2300-20261122    clang-24   sparse
sparc64              randconfig-r2302-20261121    clang-24   sparse
sparc64              randconfig-r2308-20261120    gcc-14.4.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261122    clang-24
um                    randconfig-1001-20261122    clang-24
um                    randconfig-2000-20261120    gcc-8.5.0
um                    randconfig-2000-20261121    gcc-8.5.0
um                    randconfig-2001-20261120    gcc-8.5.0
um                    randconfig-2001-20261121    gcc-8.5.0
um                    randconfig-2200-20261120    clang-24   smatch
um                    randconfig-2200-20261121    gcc-14     smatch
um                   randconfig-r2104-20261120    gcc-16.2.0 cocci
um                   randconfig-r2105-20261120    clang-24   cocci
um                   randconfig-r2301-20261120    clang-24   sparse
um                   randconfig-r2303-20261120    clang-24   sparse
um                   randconfig-r2308-20261121    gcc-11.5.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261122    gcc-14
x86_64                randconfig-1001-20261122    gcc-14
x86_64                randconfig-1002-20261122    gcc-14
x86_64                randconfig-1003-20261122    gcc-14
x86_64                randconfig-1004-20261122    gcc-14
x86_64                randconfig-1005-20261122    gcc-14
x86_64                randconfig-1006-20261122    gcc-14
x86_64                randconfig-1007-20261122    gcc-14
x86_64                randconfig-1008-20261122    gcc-14
x86_64                randconfig-1009-20261122    gcc-14
x86_64                randconfig-1010-20261122    gcc-14
x86_64                randconfig-1011-20261122    gcc-14
x86_64                randconfig-1012-20261122    clang-22
x86_64                randconfig-1013-20261122    clang-22
x86_64                randconfig-1014-20261122    clang-22
x86_64                randconfig-1015-20261122    clang-22
x86_64                randconfig-1016-20261122    clang-22
x86_64                randconfig-1017-20261122    clang-22
x86_64                randconfig-2000-20261120    clang-22
x86_64                randconfig-2000-20261121    gcc-14
x86_64                randconfig-2001-20261120    clang-22
x86_64                randconfig-2001-20261121    gcc-14
x86_64                randconfig-2002-20261120    clang-22
x86_64                randconfig-2002-20261121    gcc-14
x86_64                randconfig-2003-20261120    clang-22
x86_64                randconfig-2003-20261121    gcc-14
x86_64                randconfig-2004-20261120    clang-22
x86_64                randconfig-2004-20261121    gcc-14
x86_64                randconfig-2005-20261120    clang-22
x86_64                randconfig-2005-20261121    gcc-14
x86_64                randconfig-2100-20261120    gcc-14     cocci
x86_64                randconfig-2100-20261121    gcc-14     cocci
x86_64                randconfig-2101-20261120    gcc-14     cocci
x86_64                randconfig-2101-20261121    gcc-14     cocci
x86_64                randconfig-2102-20261120    gcc-14     cocci
x86_64                randconfig-2102-20261121    gcc-14     cocci
x86_64                randconfig-2103-20261120    gcc-14     cocci
x86_64                randconfig-2103-20261121    gcc-14     cocci
x86_64                randconfig-2104-20261120    gcc-14     cocci
x86_64                randconfig-2104-20261121    gcc-14     cocci
x86_64                randconfig-2105-20261120    gcc-14     cocci
x86_64                randconfig-2105-20261121    gcc-14     cocci
x86_64                randconfig-2200-20261120    clang-22   smatch
x86_64                randconfig-2200-20261121    gcc-14     smatch
x86_64                randconfig-2300-20261120    clang-22   sparse
x86_64                randconfig-2300-20261121    gcc-14     sparse
x86_64                randconfig-2301-20261120    clang-22   sparse
x86_64                randconfig-2301-20261121    gcc-14     sparse
x86_64                randconfig-2302-20261120    clang-22   sparse
x86_64                randconfig-2302-20261121    gcc-14     sparse
x86_64               randconfig-r2100-20261120    gcc-16.2.0 cocci
x86_64               randconfig-r2103-20261122    gcc-14     cocci
x86_64               randconfig-r2106-20261120    gcc-8.5.0  cocci
x86_64               randconfig-r2107-20261120    gcc-8.5.0  cocci
x86_64               randconfig-r2303-20261120    gcc-9.5.0  sparse
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
xtensa                randconfig-1000-20261122    clang-24
xtensa                randconfig-1001-20261122    clang-24
xtensa                randconfig-2000-20261120    gcc-16.2.0
xtensa                randconfig-2000-20261121    gcc-16.2.0
xtensa                randconfig-2001-20261120    gcc-16.2.0
xtensa                randconfig-2001-20261121    gcc-16.2.0
xtensa                randconfig-2200-20261120    gcc-9.5.0  smatch
xtensa                randconfig-2200-20261121    gcc-12.5.0 smatch
xtensa                randconfig-2200-20261122    gcc-11.5.0 smatch
xtensa               randconfig-r2100-20261122    gcc-14     cocci
xtensa               randconfig-r2107-20261120    gcc-16.2.0 cocci
xtensa               randconfig-r2109-20261120    gcc-8.5.0  cocci
xtensa               randconfig-r2304-20261120    gcc-8.5.0  sparse
xtensa               randconfig-r2308-20261121    gcc-11.5.0 sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
