Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA3E42B327
	for <linux-usb@vger.kernel.org>; Wed,  2 Sep 2026 18:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788375531; cv=none; b=Ipzl3299Ziepr9Gpumf/WvAx/zXpyENhLFiWRXrlCXXpROHYIda04pGAhEor9HaUP2nRvi+w+W1AfpcipP84ksTsXepdzSU/ifHJOD4k/aX4K+lRbEG/lkzG1B1ARmqb6Y1X8wMW5hNKtQMnqLVNWrYxYzPyQ7jyOz6ivnDISxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788375531; c=relaxed/simple;
	bh=zMRQUxtqcF5Qjy6L7CeVXMaYn4QXYWLyuKD8nx2TfhA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o/vFGyEtB5UtrNAztxzDCpSUE6nYZ35U18gBJYJVZbBqdN+4gz0460lJ5lZZ3Tk7CaI/7wwES91OSmPru/h21+3G46yIg5gWmZhRbKu97Dx+Ihqoni9IqrxSULtgRHVthtbhvgPxrqd8Rpyxt5psIQKcWKJRJqHpZcaOAyOaLJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AKtquh0f; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AKtquh0f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788375531; x=1819911531;
  h=date:from:to:cc:subject:message-id;
  bh=zMRQUxtqcF5Qjy6L7CeVXMaYn4QXYWLyuKD8nx2TfhA=;
  b=AKtquh0f7SqNjWkZoxcu6yM+V6LXkYz9EkpaE1AIdUYYWLAxrG6WK/WV
   cbhsFTn1JWOKbgHDnabGzX/tz4F4ZIPmTWrnKtMZIS4RAKcHbBJTguskE
   X0PoWd/0ZIc4heL7EV+1w7jbLMl1bBE9vgQQi3Cf42WSKdiDYI6qBUJju
   n8H5mIZ2Fmq7CvrKsbsihTglOzfod9Ccf80zms3PfYfEZE5OxLsWWY3hh
   wkCn/knXKetg+ww7Tu6ip4SD+80qLxlKsRZ49KNC4z86GP7d4+TqELV+z
   +nCeXotPx0lliCvL3vRL/f/v3cz4qNniaxWJNAZiJrTCaWXrcs0eEsNTp
   g==;
X-CSE-ConnectionGUID: yNavtg7zShaZqiOkmjgBMQ==
X-CSE-MsgGUID: FJUg+dDHTs+eGhlJyy04Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="114386231"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="114386231"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 11:58:50 -0700
X-CSE-ConnectionGUID: Vl4qzkZqQW+sGLsDyJG/Zg==
X-CSE-MsgGUID: Jndi59dwSUW9urS9Ia8A1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="265177294"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Sep 2026 11:58:49 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1qAY-000000003BI-1uiP;
	Wed, 02 Sep 2026 18:58:46 +0000
Date: Thu, 03 Sep 2026 02:58:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 c9273c83885835dbd1e8835d5665dfb8503d65e0
Message-ID: <202609030249.oAfhFjpY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: c9273c83885835dbd1e8835d5665dfb8503d65e0  usb: typec: qcom-pmic-typec: drain cc_debounce_dwork if port_start() fails

elapsed time: 1681m

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
