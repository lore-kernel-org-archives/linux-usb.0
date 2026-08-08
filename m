Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5AA353EC0
	for <linux-usb@vger.kernel.org>; Sat,  8 Aug 2026 05:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786165220; cv=none; b=nkIjZmYV/33IcCMgpPYeb3Oj8T+kDXifRs213WRxVrYI0eHjNNu5wIF2fCbcywSZjkF3Z+HbcxnDFSzcDHKa0pW3SMcxO4RCtyoyyKnN6Zp41bfLNZH+yIZugoVakkEEM6+BFR4tYcnRJnHYZaGt5GqdZhyBHN/7KzZ8G6c1/X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786165220; c=relaxed/simple;
	bh=oNguuroEAZHOdD6/WdQ+AB6EyhYgUb9/PoDgN00PHus=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FN0MAVjR4XvW9OXY8Xb/EwDjWy5jyFqwBpFofef7objP2xltwIkp4BlpAoTJz/pJHLiXKQ1T14NnhMtoeZfPSRXHASCKxbXHWxFTvSPzddm7zeFozNdylgRWDD+dCEB+7E5VnLPQ2R70al4uUJTnD5a4Kr6JlnZ+9PT5ltgYgEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fnr06iae; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fnr06iae"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786165218; x=1817701218;
  h=date:from:to:cc:subject:message-id;
  bh=oNguuroEAZHOdD6/WdQ+AB6EyhYgUb9/PoDgN00PHus=;
  b=Fnr06iaeojTRAa/Y3RZZJu1WISxVEyVEu8tFl7klqp9gH0XRJpQAZxR/
   VWfx9sA1yd/S9cgT4z5INZbj0vSfS2xBbKrCyTpdkSzp5vmDwBedxAeOK
   l5GVZx9Ol4yV59yWoQNQFf1qxNzGWaVgppbWMeKcVyvit/ZEkOLuNPI12
   J7CYhuxGH7tfejPlOFcFEGjF8XJ0Dd9S0cbRHBlvDayUb9uju9XjwT/ua
   P3zImZIj4hWsp7mTU0kYewY7E9SrYeYC4XNY3Ws7DrUQy0AIZpsmKlUIv
   kUNI8eQ5oti0qljcM0vvo/DVXZQF33s3qBywxZ4KftX4LiAM+xqIwnZeo
   Q==;
X-CSE-ConnectionGUID: BhwFFcG6TXuuGdMe3ZEwxg==
X-CSE-MsgGUID: t0Vnj0dSSHOldcz4j5Dy+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="85742752"
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="85742752"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 22:00:17 -0700
X-CSE-ConnectionGUID: eTAQJVBKTD2UD0pD+AAAkA==
X-CSE-MsgGUID: 1JaZRbPVTLam1sgwAhS+JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="266823099"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Aug 2026 22:00:14 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsZAJ-00000000Jl6-2ZA0;
	Sat, 08 Aug 2026 05:00:11 +0000
Date: Sat, 08 Aug 2026 12:59:41 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 f1de1fc5f632cdeae1f5c2984572ab710d4dfcaa
Message-ID: <202608081228.rVjYhucB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: f1de1fc5f632cdeae1f5c2984572ab710d4dfcaa  thunderbolt: Add quirk to reset host interface on DMA path teardown for AMD USB4 routers

elapsed time: 813m

configs tested: 15
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha              allnoconfig    gcc-16.1.0
alpha             allyesconfig    gcc-16.1.0
alpha                defconfig    gcc-16.1.0
arc               allmodconfig    gcc-16.1.0
arc               allyesconfig    gcc-16.1.0
csky              allmodconfig    gcc-16.1.0
i386              allmodconfig    gcc-14
loongarch            defconfig    clang-24
nios2             allmodconfig    gcc-11.5.0
nios2              allnoconfig    gcc-11.5.0
parisc            allmodconfig    gcc-16.1.0
parisc            allyesconfig    gcc-16.1.0
parisc               defconfig    gcc-16.1.0
powerpc    lite5200b_defconfig    clang-24
sh                   defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
