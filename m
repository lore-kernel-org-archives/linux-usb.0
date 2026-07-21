Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6728E431A4E
	for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 22:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784674751; cv=none; b=dydryYDa+69V+RN6wxigz5UtncilDfu27ABJOBDHAHAID1JpwsstmD3lRfWfadMG7yX2r7t3AP2MDI2CkYc0N0dXN2aRyDRgk4XggofIC4AkgC6+HwMwQlwtfdQD/+BHjcpXJZk/CbmERgJVaJerSK26tx/spUKI31tgKC6XRSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784674751; c=relaxed/simple;
	bh=fdRDKXt7aPUrguxEjnpR9u3gKWnsxIED72l1/dxGKzk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i9bKTbdrgKJVTwNlXcpNG4y1/2ux8ICOzIfp7DIIdpSdJj586fhtlxQoKWC8My4dEIn9a8R2CeVCszgV5xbqA5Lw2XMoUqVTNo6QkafWrne0FOOL/DbXvMxQwrWH26yHVlrzuX+GwpE9Wi2ML4ko4ow8Y7ZSjygttvxqaA7cCGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HOiWO8tw; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HOiWO8tw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784674750; x=1816210750;
  h=date:from:to:cc:subject:message-id;
  bh=fdRDKXt7aPUrguxEjnpR9u3gKWnsxIED72l1/dxGKzk=;
  b=HOiWO8tw3V3zJB9AM8dH6EKojh/ebRwXwFLycRJyxOqEFSdPdPyQmwBT
   j5Jh6J7xxAtQq63Erk/wTXPqtWYOWpJjOMvBoPZExhIPGW8Bi+7JHNIS/
   hu3LOMWcRNDtVBBbaQBsHjFs99W3ZjRuRoevg6bknrtd2dJybWl0Oe3bE
   UQgf3nCr+8yGGENxaXdey9REj5bpLmMVWV1K8Y1LVNFIdSmb07w3itXNY
   88C2BSAy0D6psiNxveHg65BMX3TQCm+xvT8ENERR9N015FsMhM9KKEpdz
   i/enGpVV+0twOYDH9C/+delwMrsXvC7avOTbufEqWgmPCKuKG1DSK1umH
   Q==;
X-CSE-ConnectionGUID: Wc+PSlR7SpGESBl3A4ve4w==
X-CSE-MsgGUID: n1nog4zuTxm+OqkvotB5OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85311882"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="85311882"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 15:59:09 -0700
X-CSE-ConnectionGUID: WI5S7bPsSCSZNuuElhPpxg==
X-CSE-MsgGUID: JrIM8PybTCqoNDgR3dgK/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="258568032"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 21 Jul 2026 15:59:08 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmJQX-00000000Y8b-2Czx;
	Tue, 21 Jul 2026 22:59:05 +0000
Date: Wed, 22 Jul 2026 06:58:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 80574c40598aedbc1751c528e414d7e224bc6313
Message-ID: <202607220633.ptIwZ1Tl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 80574c40598aedbc1751c528e414d7e224bc6313  USB: phy: fsl-usb: fix missing static keywords

elapsed time: 6044m

configs tested: 15
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha        allnoconfig    gcc-16.1.0
alpha       allyesconfig    gcc-16.1.0
alpha          defconfig    gcc-16.1.0
arc         allmodconfig    gcc-16.1.0
arc         allyesconfig    gcc-16.1.0
arm     ep93xx_defconfig    clang-24
csky        allmodconfig    gcc-16.1.0
i386        allmodconfig    gcc-14
nios2       allmodconfig    gcc-11.5.0
nios2        allnoconfig    gcc-11.5.0
parisc      allmodconfig    gcc-16.1.0
parisc      allyesconfig    gcc-16.1.0
parisc         defconfig    gcc-16.1.0
sh             defconfig    gcc-16.1.0
x86_64      rhel-9.4-bpf    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
