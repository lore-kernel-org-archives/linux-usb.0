Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1806C39EF2C
	for <linux-usb@vger.kernel.org>; Tue,  8 Sep 2026 07:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851467; cv=none; b=WQn2JkdTwVteiPG+ju6gUaSxRoriRZt8kdaMDDdyk95h+1syxglajctlazq1Y/Kl3vVYKkTO62KmczvIPqIRixB+MZrGNw9wBzc2u8JqbOoPvUIBmv4lRxzE4NShnnK8/BbugsqLD5kxzA7Y8EoEv1xS6OjgRrO3yRXtRDQPxsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851467; c=relaxed/simple;
	bh=jP/JnNcMgwji7Im+JeL5okznMYPecKxWpDNcYAat7wo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W6mkpexe7ZU384R2c+67nZU3eqVSGzaKIdbn8b2wuMI/ClCeSgT8RfmTpMx/r0nREE/Uz/9ohGZ5ciQMwCA4LDBjMpOoX4rKny4UBqdhDhQ3XMAO+XrD+id6aSbpvebADSxtdYDwHkyBp8ra4f6ybh2GUI6QETOnlMYZzx2Vv+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Egt3XZBN; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Egt3XZBN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788851465; x=1820387465;
  h=date:from:to:cc:subject:message-id;
  bh=jP/JnNcMgwji7Im+JeL5okznMYPecKxWpDNcYAat7wo=;
  b=Egt3XZBNrtGEqKf4iX92jR0+5dUg9e+g/HUsd1cawL3xwWP31C3oK6xc
   t3Q+9M3zd6CwDc1OT48M+6jhrRVQPwuR9+oGnqxxIH2rB6PMR1R3ttN4i
   n38FPBWo+wACAknK0wxMdWOWp/M4jtGkp1TQx19bg7x0v3yzvIfUNlOyb
   CQUxIyLrXOlQUXDgzEIZrBYkNGDqMZSKLe0Wn7M02rXjQ2D/n+1lyE2dR
   ku4FT3YR2m0t1Zltx+0Y5u0+W00ul5JS4YxoUZ7PtlsUXRwBZwOGCV8kS
   eQciIFaTTqLWhYtbM+z1uA/hq+udr0Fp3Q8xbjEqVOIRNAQtIH1lpY9fM
   w==;
X-CSE-ConnectionGUID: FaOBt8QuTvuTCIJrTxotFQ==
X-CSE-MsgGUID: aYaqAwBnSXywxBKLZXmpUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="76805218"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="76805218"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 00:11:04 -0700
X-CSE-ConnectionGUID: dH9R0hSVTHKLsD44ZA4tNA==
X-CSE-MsgGUID: 7AlmQYclSru6djGzfho8IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="272846923"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Sep 2026 00:11:03 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3pyu-000000001n9-2E5U;
	Tue, 08 Sep 2026 07:11:00 +0000
Date: Tue, 08 Sep 2026 15:10:49 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 2d8b6e38b86c4cbad9d7bdd8371c696ef34b900c
Message-ID: <202609081542.3fVFVlMf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: 2d8b6e38b86c4cbad9d7bdd8371c696ef34b900c  net: thunderbolt: Update ring indices only after all frames are queued

elapsed time: 1504m

configs tested: 57
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    clang-24
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    clang-24
arc          allyesconfig    gcc-16.1.0
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
loongarch    allmodconfig    clang-19
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
