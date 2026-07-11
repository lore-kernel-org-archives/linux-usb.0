Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE35E3B2FED
	for <linux-usb@vger.kernel.org>; Sat, 11 Jul 2026 12:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783774138; cv=none; b=ObqYECHpEe/hhKGUhOEWX0FSqQVbZDbmCzsRNy5LNfzXctyHsJfmqGMUtTDG3s5sQCbK91jR2Un5v9c2XZEfCdgrqQgWqsGOB2hRfnPMTws+UQrqTa9odLWXIdRNvDBVHoPYYBtKeK0zqN7cEXYeXOfHZRa7JPdTbDez/abY2XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783774138; c=relaxed/simple;
	bh=xoBbv3OifO/aCckBQJUrA3vQoiFhFecUYd4ZIoAFwTw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pv5RwI00kCfQiVaZCALyurLlOSV3dXMAv5HJEOaTta13wOYHBuozxhbj2yU4wfBZAOUhdVIrl15zIsw8J1bJKSLpHMMIfZy9h1XUsOpOoHTqR6J/ABAuqMQcAPkPcGy8BgHyXzbL5vO4zzqfIgCQmdQThLQETnSD2/kPhYa2rks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VvXIwy3y; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VvXIwy3y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783774137; x=1815310137;
  h=date:from:to:cc:subject:message-id;
  bh=xoBbv3OifO/aCckBQJUrA3vQoiFhFecUYd4ZIoAFwTw=;
  b=VvXIwy3yIrr2pNsFyN5Am2qtnykJdGIp+WSyWkFc7M2mkzhwGVtLQDIG
   1Tc5WLfJJdxzox0Q1WXOtPG9vHkAua8r/O7QX43m+ypt89504LMJ/iZdz
   ypLlONpfBaiDnDFGVs8crVI3vznGA+sE5c+JGC+SmCbwiHomg6Bks9ZLL
   wkIVI2d/Nvn7stfBaDuTM6WJFk5DALB4RqdncTFxZvcgPvDNTzmV0bsr2
   3QiE5XX6AtbNC8G1VSYU80lhJno8MHljVFsvRRH7RhlbNOZXiyerOBpS8
   zoU3EHkJJ53g5Hb82dCSBDEYVit2XZnCURT6fCF3w0bWTXKMw8xg0pW4w
   w==;
X-CSE-ConnectionGUID: QUVFYppeS2CUJIRP4jzYGA==
X-CSE-MsgGUID: FV5I/RVMTr2d0tj7TvDUsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94807642"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="94807642"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 05:48:57 -0700
X-CSE-ConnectionGUID: o20dK1EISTmUh/kRKturzA==
X-CSE-MsgGUID: eAinuB6sREuKYxduDqo2mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250707349"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 11 Jul 2026 05:48:55 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiX8T-00000000K3g-3Iw9;
	Sat, 11 Jul 2026 12:48:50 +0000
Date: Sat, 11 Jul 2026 20:47:45 +0800
From: kernel test robot <lkp@intel.com>
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: [usb:usb-next 23/66] drivers/usb/dwc3/core.c:2501: undefined
 reference to `power_supply_unreg_notifier'
Message-ID: <202607112037.tVbaUKOJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
head:   1db5c6b0b9834aee2f14e39764becfcc29d09ccf
commit: 7c87ef27af79b3f905aed2edf9f60ce2a75d38e3 [23/66] usb: dwc3: avoid probe deferral when USB power supply is not available
config: parisc-randconfig-001-20260710 (https://download.01.org/0day-ci/archive/20260711/202607112037.tVbaUKOJ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607112037.tVbaUKOJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607112037.tVbaUKOJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/usb/dwc3/core.o: in function `dwc3_core_remove':
>> drivers/usb/dwc3/core.c:2501: undefined reference to `power_supply_unreg_notifier'
   hppa-linux-ld: drivers/usb/dwc3/core.o: in function `dwc3_get_usb_power_supply':
>> drivers/usb/dwc3/core.c:2245: undefined reference to `power_supply_reg_notifier'
   hppa-linux-ld: drivers/usb/dwc3/core.o: in function `dwc3_core_probe':
   drivers/usb/dwc3/core.c:2443: undefined reference to `power_supply_unreg_notifier'


vim +2501 drivers/usb/dwc3/core.c

  2476	
  2477	void dwc3_core_remove(struct dwc3 *dwc)
  2478	{
  2479		pm_runtime_get_sync(dwc->dev);
  2480	
  2481		dwc3_core_exit_mode(dwc);
  2482		dwc3_debugfs_exit(dwc);
  2483	
  2484		dwc3_core_exit(dwc);
  2485		dwc3_ulpi_exit(dwc);
  2486	
  2487		pm_runtime_allow(dwc->dev);
  2488		pm_runtime_disable(dwc->dev);
  2489		pm_runtime_dont_use_autosuspend(dwc->dev);
  2490		pm_runtime_put_noidle(dwc->dev);
  2491		/*
  2492		 * HACK: Clear the driver data, which is currently accessed by parent
  2493		 * glue drivers, before allowing the parent to suspend.
  2494		 */
  2495		dev_set_drvdata(dwc->dev, NULL);
  2496		pm_runtime_set_suspended(dwc->dev);
  2497	
  2498		dwc3_free_event_buffers(dwc);
  2499	
  2500		if (dwc->psy_nb.notifier_call)
> 2501			power_supply_unreg_notifier(&dwc->psy_nb);
  2502	
  2503		if (dwc->usb_psy) {
  2504			cancel_work_sync(&dwc->vbus_draw_work);
  2505			power_supply_put(dwc->usb_psy);
  2506		}
  2507	}
  2508	EXPORT_SYMBOL_GPL(dwc3_core_remove);
  2509	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
