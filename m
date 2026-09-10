Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B92639734A
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 06:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789021245; cv=none; b=nNWPms4NuXq46Y24YwV0EDY6kzi8BivnPl7mPgGNIaPZYXjCdokMUL9irTRD99vL32UVzaZ6zDSNac+tJrRgVl5VnPpZxlako7chdumqQjTv7ppTh8HdqpSMMXQ3Obh/FQGlWUXWwbLZZSNwe6vduXhd/kbBSLeY5AsAudhrgOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789021245; c=relaxed/simple;
	bh=o40RrjqkHQXK/DHsFMFuJqYUz3oni/RmZax3gunIa9k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hKQguypPC1q+nLYfT7N1ul9bEJh4l4H7DRlgjRC5KBJgDFIK2YrEro/6j88aPVyYHnSBhddZ0nY3XHW5ePWZVqsTBDbN9XToP/XGsLoGJl3k/RQAQqUZNT+ku0a8VSsPYac6j2iwd4mCrBG6WG74z3fsRJp2cHYnyislEU1Purw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ACVCErWK; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ACVCErWK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789021243; x=1820557243;
  h=date:from:to:cc:subject:message-id;
  bh=o40RrjqkHQXK/DHsFMFuJqYUz3oni/RmZax3gunIa9k=;
  b=ACVCErWKpp95Kva8DpNn4BKOWZgNzJT0T0a20OUpcWWa0ED75AAXVcJS
   +2iIw0d1fTW24eh2vaInzzm/wnjIMlPPPrvn4sbhYPXyr/hzvDShKr8a5
   dPHI9SK3wzSs9IYJiE7VcZ6fws+IQSo81E4pdgZFe/S5rBMSiC4pOQgd5
   D76c+/ivoUOe3+5nclryLKO5rUppNMm6HG7DWBDO9hd0fbSCNG9WgdCgk
   JKGA2bxRI4j81YX7ImZ3+4hbkzAqCuv613/3hiT+TEgp7STOfKcxIbbNK
   fcBV/238kyFFz/uGsowqG0pUW97wqQnjDlQ5SrE6SliHKu7YkmI2s+I8U
   A==;
X-CSE-ConnectionGUID: w28RnG3fRBqgQeX67Kny8w==
X-CSE-MsgGUID: IbXZ3GqoRbK/kSdLgGnF0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="88609089"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="88609089"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 23:20:41 -0700
X-CSE-ConnectionGUID: aXG0/eYZQeaewn0Rzw+oPw==
X-CSE-MsgGUID: w1VDzJGrS9eCLXtkvH99sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="296494968"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Sep 2026 23:20:39 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4Y9F-000000001SI-0WBe;
	Thu, 10 Sep 2026 06:20:37 +0000
Date: Thu, 10 Sep 2026 14:19:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 6ea92f0109dd7f86ac9787f1634ee68be1185721
Message-ID: <202609101437.9OWnUYMY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 6ea92f0109dd7f86ac9787f1634ee68be1185721  Merge tag 'thunderbolt-for-v7.3-rc3' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-linus

elapsed time: 1058m

configs tested: 55
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
