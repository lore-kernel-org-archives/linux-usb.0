Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143BB344D8C
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 03:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788407687; cv=none; b=tPcUjQC3Mh3X0HkHU0kFq8HDhXpzz8MBDQ8D8gioynEfE1zyIR6Al9ltEETx+Uzx3A9lWZG+cmVsf78XONpaMqRysY7cPItsuvEbxcpq3W9IPM8zMiIJX8kHnqc7PYb0yNar63LAueG7JThcepsC42mX8TjzueTNE/xM4Mg979w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788407687; c=relaxed/simple;
	bh=QsBkq0gz4WrWnEkxfLCmROSQuKuaRQoTVYOZEBWI7p8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=m2Lx6EP6c4wPn31o5Q+ICTgNYW0TXR/3DzkJvdbiq17T/BZ/w1zXX0es/8+T+3aZZogast+mdEoDAGvnIr18IhA+pjigXwKLPpvsj1RFCffg/diKXxxOE8eWEYRVM0n/+3Q66DWVLzu6trcLLNpE56b5KYy9sTQt8m1mQG2kFP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UCkMPegl; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UCkMPegl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788407686; x=1819943686;
  h=date:from:to:cc:subject:message-id;
  bh=QsBkq0gz4WrWnEkxfLCmROSQuKuaRQoTVYOZEBWI7p8=;
  b=UCkMPeglRpB4Y4EoJxH0SpkTHX+Ah/7SmUwvXaCF658eRJ4k+W7UWHqk
   Snpro+QTkoJPHHU6gDQbZntjRHva8sfkcpTYL4LMzykXRCtenHrwlm3jF
   yTqhCWsjGCwfCwQyYXhJIcc+9OCMMlWNt4BC7p2YFAs/fzFcQ4GGciWdm
   sQRlPvF5tgp7lsJ2glGFbvJbJMl2USQxS2ou1qPMheXLVr6yXqX0U8Iuj
   GZXoV7Or8UZ4GYj0o36ALailru8xKiRC96UzbbHo1y/At8wVjWNCgjA+W
   dHaBLD+V7H4MwdTndtb23iEboAwr80rxsZHk3oDbJVoAk8IleAXTKNbvB
   w==;
X-CSE-ConnectionGUID: 2+c0Eu/gRhSXUkacdxVAxA==
X-CSE-MsgGUID: 2MBXkjHmTUuIfMNYJ9wvug==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="100233346"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="100233346"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 20:54:45 -0700
X-CSE-ConnectionGUID: GXetkqO0T1ekDVTt99wZZA==
X-CSE-MsgGUID: udWmg8mrRwybWpoqLKHUew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="270145359"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 Sep 2026 20:54:44 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1yXB-000000003wW-3Ct1;
	Thu, 03 Sep 2026 03:54:41 +0000
Date: Thu, 03 Sep 2026 11:53:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 c9273c83885835dbd1e8835d5665dfb8503d65e0
Message-ID: <202609031135.C7FXGlr5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: c9273c83885835dbd1e8835d5665dfb8503d65e0  usb: typec: qcom-pmic-typec: drain cc_debounce_dwork if port_start() fails

elapsed time: 2217m

configs tested: 65
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
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    clang-20
openrisc      allnoconfig    clang-24
openrisc      allnoconfig    gcc-16.1.0
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc        allnoconfig    gcc-16.1.0
parisc       allyesconfig    clang-17
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
powerpc       allnoconfig    gcc-16.1.0
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
riscv         allnoconfig    gcc-16.1.0
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-17
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh            allnoconfig    gcc-16.1.0
sh           allyesconfig    clang-17
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

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
