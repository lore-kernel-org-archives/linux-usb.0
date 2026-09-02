Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5582A275AEB
	for <linux-usb@vger.kernel.org>; Wed,  2 Sep 2026 17:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788369945; cv=none; b=UsaMZU50qikN+DCIWQHDlDdNxQKj5ON+ajFhlu7n4KX5APtIssj/Eok7Udft/kyp31whuNTpALPFNvwF1ElIzYOxdKEreDcjH3c4CMwEVyicPWLCe2s3Dx68eVA2IrkLpLgZn/6SuhzL3XXdZxpGSbglFJXbiyYY5oACqxEl2tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788369945; c=relaxed/simple;
	bh=8w9MPWbOhiAdS6saH5kBPU6pnhSnnmKOwWwjZbD3RVM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FcjwmjmeeHLS2g212MGUZ5f1r0wAqiSoqDqxJZViD720WDoTKqK3s+vkPwbgn4T4uj+LjBAvpt2Kp/+benpj3WrNwqh5RbmhM6rMraatdeh2eQWm/8K0g3oS/3yMlrSq58K3ZFXIOSQMHlMU0RpkzLWNoNNE7ThI9T4D7bcC6ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C3bQ1qhh; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C3bQ1qhh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788369943; x=1819905943;
  h=date:from:to:cc:subject:message-id;
  bh=8w9MPWbOhiAdS6saH5kBPU6pnhSnnmKOwWwjZbD3RVM=;
  b=C3bQ1qhhYMKgA0fZVYJjbthszE4uEPoBOavueKX68s+NC0whnMMnoS/e
   uGV9mscvXh9KLLO4CO5Ki1L6RjT59wsHuGd6HDNfVw7zCJ7T/YgVC/o/L
   1VR8ENolOCGtCCGMyRAT4lGxnny2z+HUw4ZuYxrnR3xt7FYlcQ2NVBVFb
   g1WGuYpVDa/tZIxZdoXPDS6/PqVd0XHTqoUKlSXaK0lKTtAsEwSHtOa0q
   eYFrniLGXqFs6Lm0QVNvQWDMYqKmha6kQ+37eWTdvDOSniNP2Ep4FobhL
   BTGytEomMf6mh4T105/VvUNVgMelaCQcZBjysJhA/h4gR8V2TqEbnyWZz
   Q==;
X-CSE-ConnectionGUID: folW5sUVS22rMQ1LWXA0AQ==
X-CSE-MsgGUID: m51nVEDQS2qokhruuLvNoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88888359"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="88888359"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 10:25:42 -0700
X-CSE-ConnectionGUID: BujLTBAqRXeEpr+y7Hatxg==
X-CSE-MsgGUID: wOdN6DSETUKjZN2NZWvSew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="268152378"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Sep 2026 10:25:40 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1oiQ-0000000033s-2J0q;
	Wed, 02 Sep 2026 17:25:38 +0000
Date: Thu, 03 Sep 2026 01:25:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 edc1518454f6439e50a9220e9a3ba09044ea8d8b
Message-ID: <202609030116.VrqxglMF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: edc1518454f6439e50a9220e9a3ba09044ea8d8b  usb: typec: hd3ss3220: Add support for supply regulators

elapsed time: 1588m

configs tested: 60
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
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    clang-20
openrisc      allnoconfig    gcc-16.1.0
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    gcc-16.1.0
parisc       allyesconfig    clang-17
parisc       allyesconfig    gcc-16.1.0
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    gcc-16.1.0
riscv        allmodconfig    clang-24
riscv         allnoconfig    gcc-16.1.0
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-17
s390         allmodconfig    clang-24
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    gcc-16.1.0
sh           allyesconfig    clang-17
sh           allyesconfig    gcc-16.1.0
sparc         allnoconfig    gcc-16.1.0
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-17
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-22
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    gcc-16.1.0
xtensa       allyesconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
