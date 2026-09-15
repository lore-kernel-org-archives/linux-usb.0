Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A643430E0D5
	for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 03:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789444382; cv=none; b=llmF9T02g98qAOaumLwkiL1qqOkTWg+0un6tlKBC4iPPWJC8G2TtknL5Ts8Y83y492FB4C9jYEGT2c2gtWtAEsxyyyM1/2Y34h1AsMh8hB9RCGsepxXNeRr5lrK6ajHDUH/RwvuoBaU70ZlcDV3+MtIigHkUecaNub2fbfRlZZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789444382; c=relaxed/simple;
	bh=fcpj3nQVSFmThAaKPficZANZkwfqjg8qzFFIblytHfw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QTvlq2sgyYzRvKqRpmc3rb0NWwN7Bu5UiGZKaLZBrlNOU3hItoH08/WY0YnOGWgCk3tC8aBFrS2OXcfQ0A7pxFC6dhYnydm7OVLN7FqO6DYafXrd5Y6zbemS/qC7vMUREt8DOZZjDaC7lw2kT63NwZvyHPqwwXVKiLar2dIbnAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Afl0ijmj; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Afl0ijmj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789444380; x=1820980380;
  h=date:from:to:cc:subject:message-id;
  bh=fcpj3nQVSFmThAaKPficZANZkwfqjg8qzFFIblytHfw=;
  b=Afl0ijmjy28casezmPLn6sC+evLi8Jq4t0AQL9QW25pmjnxOmbQmkDT6
   L13hHMU/cSkt3MKUCmsaYQNT8HnXifmMxi+1gZVgg6dSqdTiTKNdKFaGz
   a+pwdhs+Oxj8RD6T0XLkQxlbUX0TXRxcXq64wPP7UeZOMoE9me1urCTEU
   R5E7LZenBQgu2rh7Y9FBWf1pT95Gs82rOjdE8U1P1W01qQhlN1pbRvvG9
   Qayo6HW9R0y8G1S83DzFgPF4729vfD3MYVJ8zqiGvVmzqZdTmEz3CPujH
   8Wk8mFNvOrseNSExMSU6s1kminW93a11z7D8z2zkpJd01rQ0TMd2v8kwO
   g==;
X-CSE-ConnectionGUID: IFOHpkuLRVO2/YpxYsvMzQ==
X-CSE-MsgGUID: BGzvanZoQouJjC0jK5YjfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101149688"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101149688"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 20:53:00 -0700
X-CSE-ConnectionGUID: 5cJ8RfDETHWYfI+HHXKg/A==
X-CSE-MsgGUID: REyklXeMSDKbYi97jj0fsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270194749"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Sep 2026 20:52:58 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6KE4-000000003yr-0Xap;
	Tue, 15 Sep 2026 03:52:56 +0000
Date: Tue, 15 Sep 2026 11:52:15 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: [usb:usb-testing 32/48] ld.lld: error: undefined symbol:
 ehci_setup
Message-ID: <202609151119.GW6Gq8qw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   dbe68462fa656078eac3a5a09039038dc47e08da
commit: 7dbc2e1ba8fd7793af299d8a813eae727759ecf3 [32/48] usb: fotg210: use the common EHCI core
config: s390-randconfig-r113-20260913 (https://download.01.org/0day-ci/archive/20260915/202609151119.GW6Gq8qw-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 96295a1412f9afbee9d4a3c2701e83f5a529a9cc)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609151119.GW6Gq8qw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609151119.GW6Gq8qw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: ehci_setup
   >>> referenced by fotg210-hcd.c
   >>>               drivers/usb/fotg210/fotg210-hcd.o:(fotg210_hcd_reset) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: ehci_handshake
   >>> referenced by fotg210-hcd.c
   >>>               drivers/usb/fotg210/fotg210-hcd.o:(fotg210_pre_port_reset) in archive vmlinux.a
   >>> referenced by fotg210-hcd.c
   >>>               drivers/usb/fotg210/fotg210-hcd.o:(fotg210_post_port_reset) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: ehci_init_driver
   >>> referenced by fotg210-hcd.c
   >>>               drivers/usb/fotg210/fotg210-hcd.o:(fotg210_hcd_init) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
