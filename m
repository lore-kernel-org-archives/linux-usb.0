Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBE9361646
	for <linux-usb@vger.kernel.org>; Tue,  3 Mar 2026 01:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772500836; cv=none; b=UYSl/APN7MiL99OblDQR2C8yhbPjfT6ensKfO+StsOmmD51mpoVxSePWzLJX6k/BFOg2ghxoqfeXwbwMA51fiClq0cLvWzws1Z2/kHlbWQ/qmQS7Afeqz9hxrP3w0J4iXXCvkU/urJ1Es6Ya61r8pAUSJI/WLnFbDgpKmQRF3uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772500836; c=relaxed/simple;
	bh=Woj/KdaSGs819OthdcPfa/5s+rx77RAOlEiDLdRxIB4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aJ5Q5sQ3fo+sKJISEWy+p9+uQokK9fWHHAfy/Lky0PpoSvjWe1hTzRc8A5+7+a0thYVxI74dW6DYiCkvFq2Dx9Y1WBbazq7NvUJBdvnx9ZRKYDGAbpkLmKFqcwy3Qq9glfarBJwchd1eLh9gdMbJbE8nWHtsiVRMKfYBQ/tfkzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iFS68eoG; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iFS68eoG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772500834; x=1804036834;
  h=date:from:to:cc:subject:message-id;
  bh=Woj/KdaSGs819OthdcPfa/5s+rx77RAOlEiDLdRxIB4=;
  b=iFS68eoG8DJnUMokmC5QYAXZG3+TTBe+j/2YV1MAvsLDaJvxovAjMCkK
   bcjyxrZk4FN3xyTz8XaFYXNK4sC5cbfAR5U4+rVmMu8fNX1whtSwEq4oV
   /XgHTS/KAGsx4cIg+P3+ANH5xkX0fF7l8+PPrTD9/QqzEPkc4j8U9AKN5
   fPnmzP5p3FpCLDywc5dvt8h/llQW2OWssxqIaSiVqDDFJ2XKol5n2tr80
   +V9+wNgxi1L1Yo87ZwCluA9Mhg1U3ATBLQZnpNnWpuKYcekc4bujn8DTy
   TbFz+5Xy1FSsxKcj3A/EGZtDi69VlUTavdnQDKtwW5rvMEcKcJdtbhq6C
   g==;
X-CSE-ConnectionGUID: h23dFeNnT56eOszKJkkEBw==
X-CSE-MsgGUID: u1WGbb2QT5GpodQIRl0xpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73565938"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="73565938"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 17:20:34 -0800
X-CSE-ConnectionGUID: t1DeRpgcRkeZuvj82IQNbg==
X-CSE-MsgGUID: NcrdBnyaTDyHYjiwlOS2pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="222496033"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 Mar 2026 17:20:32 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxER3-000000001bA-38DI;
	Tue, 03 Mar 2026 01:20:29 +0000
Date: Tue, 03 Mar 2026 09:19:50 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 59b03d12b1f6d14d936a3ebec225f8d914dc3b70
Message-ID: <202603030942.YGmuGxLs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: 59b03d12b1f6d14d936a3ebec225f8d914dc3b70  thunderbolt: Disable CLx on Titan Ridge-based devices with old firmware

elapsed time: 1104m

configs tested: 63
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-15.2.0
alpha        allyesconfig    gcc-15.2.0
arc          allmodconfig    clang-16
arc          allmodconfig    gcc-15.2.0
arc           allnoconfig    gcc-15.2.0
arc          allyesconfig    gcc-15.2.0
arm           allnoconfig    clang-23
arm          allyesconfig    clang-16
arm          allyesconfig    gcc-15.2.0
arm64        allmodconfig    clang-19
arm64         allnoconfig    gcc-15.2.0
csky         allmodconfig    gcc-15.2.0
csky          allnoconfig    gcc-15.2.0
hexagon      allmodconfig    clang-17
hexagon      allmodconfig    gcc-15.2.0
hexagon       allnoconfig    clang-23
i386         allmodconfig    gcc-14
i386          allnoconfig    gcc-14
i386         allyesconfig    gcc-14
loongarch    allmodconfig    clang-19
loongarch     allnoconfig    clang-23
m68k         allmodconfig    gcc-15.2.0
m68k          allnoconfig    gcc-15.2.0
m68k         allyesconfig    clang-16
m68k         allyesconfig    gcc-15.2.0
microblaze    allnoconfig    gcc-15.2.0
microblaze   allyesconfig    gcc-15.2.0
mips         allmodconfig    gcc-15.2.0
mips          allnoconfig    gcc-15.2.0
mips         allyesconfig    gcc-15.2.0
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    gcc-15.2.0
openrisc      allnoconfig    gcc-15.2.0
parisc       allmodconfig    gcc-15.2.0
parisc        allnoconfig    gcc-15.2.0
parisc       allyesconfig    clang-19
parisc       allyesconfig    gcc-15.2.0
powerpc      allmodconfig    gcc-15.2.0
powerpc       allnoconfig    gcc-15.2.0
riscv        allmodconfig    clang-23
riscv         allnoconfig    gcc-15.2.0
riscv        allyesconfig    clang-16
s390         allmodconfig    clang-18
s390         allmodconfig    clang-19
s390          allnoconfig    clang-23
s390         allyesconfig    gcc-15.2.0
sh           allmodconfig    gcc-15.2.0
sh            allnoconfig    gcc-15.2.0
sh           allyesconfig    clang-19
sh           allyesconfig    gcc-15.2.0
sparc         allnoconfig    gcc-15.2.0
sparc64      allmodconfig    clang-23
um           allmodconfig    clang-19
um            allnoconfig    clang-23
um           allyesconfig    gcc-14
um           allyesconfig    gcc-15.2.0
x86_64       allmodconfig    clang-20
x86_64        allnoconfig    clang-20
x86_64       allyesconfig    clang-20
x86_64      rhel-9.4-rust    clang-20
xtensa        allnoconfig    gcc-15.2.0
xtensa       allyesconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
