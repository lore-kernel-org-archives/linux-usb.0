Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AA33EB0E6
	for <linux-usb@vger.kernel.org>; Fri, 14 Aug 2026 21:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786743792; cv=none; b=daRxu2MMBqNzH1uuh54OFJxovBW5msclIPZdK/V3+I/reAAKfFFhAGCM44YjnwJ+Lszxu6tsQM4xyduF6Ojjw1EJazygKsQg0BoS3q9GdK375uhN+3puSCE7oGpwQML7drInCxu14iuZyYSKMZnA5qvFVvBcdu2SUtGvyQAtnsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786743792; c=relaxed/simple;
	bh=TVNK44tqeWZooNGhluUWrHVVheLEixQbcO6ypEz6/JM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q4+eiwcMhvdgEWG02YQJSwrbbosf4cUNH4KE37VlrPqRktWBY73FYng8XlUmoxiXYDO5TzYgn4cfVEjQwO5/C4MRgvpUAPGlwKjoHgyRxMqSbpnwLFa/NI2LCVa13/xcliwAnMQdK5/7GImvMJo4WfpaarrPKF6bee233thHsRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jPhflwwJ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jPhflwwJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786743790; x=1818279790;
  h=date:from:to:cc:subject:message-id;
  bh=TVNK44tqeWZooNGhluUWrHVVheLEixQbcO6ypEz6/JM=;
  b=jPhflwwJ/NhAs45EaSIqd2u/WJZG7DWMsMOLynenxpoLRydP7Z837nH6
   bXFu1+RefAwxg4ve9eqJ380s/UX2WP1atYvZphOnV3KPSHSwPNvHbPvdX
   Vtv7hbgFURkIcleyzGg5/gSH+uOwt8fDWAUt3IVALROIB+wY2qeKT+lbV
   m6mD+Wf0PkW2dg0RsJNVd6mvJNOguuwNzk3qAWoUnUCwEPv0xh9ZOAPkV
   Jy0p/3aCRNhce9nhiZiRwLGMPOKjVxPQg5hW74QfrKxSe0TWpe+aTNhu/
   IllH8HY/CEGe8DgV+fH0VkTvjczD8aYgv29IYtY8Gvw/5He4+2/xXJXBl
   A==;
X-CSE-ConnectionGUID: 68i15ACbQTCbjeeBXA6/kQ==
X-CSE-MsgGUID: DZUxoWTHRjqxRXYrPum/5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="110110771"
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="110110771"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 14:43:10 -0700
X-CSE-ConnectionGUID: MeUF3mAWTMiR5nnSuhWk8A==
X-CSE-MsgGUID: il1cmSTNQTyPTrv5otsirQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="267817351"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Aug 2026 14:43:10 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuzgB-00000000aHZ-0jHX;
	Fri, 14 Aug 2026 21:43:07 +0000
Date: Sat, 15 Aug 2026 05:42:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 3d9eeb336131bc5a174367c384fa00c15c8744fd
Message-ID: <202608150534.NS6XjvEP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: 3d9eeb336131bc5a174367c384fa00c15c8744fd  usb: xhci: Handle bogus TRB pointers in Missed Service Error events

elapsed time: 793m

configs tested: 48
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260815    gcc-11.5.0
arc                  randconfig-002-20260815    gcc-8.5.0
arm                  randconfig-001-20260815    clang-21
arm                  randconfig-002-20260815    gcc-8.5.0
arm                  randconfig-003-20260815    clang-17
arm                  randconfig-004-20260815    gcc-8.5.0
arm                          sunxi_defconfig    gcc-16.1.0
arm64                randconfig-001-20260815    clang-24
arm64                randconfig-004-20260815    clang-24
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260815    gcc-13.4.0
csky                 randconfig-002-20260815    gcc-15.2.0
i386                            allmodconfig    gcc-14
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260815    clang-18
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
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
um                   randconfig-001-20260814    gcc-14
um                   randconfig-002-20260814    clang-22
x86_64     buildonly-randconfig-002-20260815    gcc-14
x86_64     buildonly-randconfig-003-20260815    gcc-14
x86_64               randconfig-001-20260814    gcc-14
x86_64               randconfig-002-20260814    clang-22
x86_64               randconfig-003-20260814    clang-22
x86_64               randconfig-004-20260814    clang-22
x86_64               randconfig-005-20260814    gcc-14
x86_64               randconfig-006-20260814    gcc-14
xtensa               randconfig-001-20260814    gcc-9.5.0
xtensa               randconfig-002-20260814    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
