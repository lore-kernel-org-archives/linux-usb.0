Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD503AE189
	for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 08:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776070327; cv=none; b=JmhkNteZGV+KfG5LS2ExzmbYMk0yPoTn79oc3iz9wt/GcWWfFfTJ6Lm9bLFCxbNkI7eILY5A2p1hh3e+YV8tMWa7S4knsgRmEcN1Shtv98Rjz3tm8Etfp/G/6ufsePFD7SAn6tWE/kQv+Vhb366mKgAlpLtyNxq1OUHydCD82qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776070327; c=relaxed/simple;
	bh=XZmLP1+ppSiWoFMDuz1A6E1kHBrUU3vk8RmiolpleWA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g9WGzA3J8cuux5Mk/yGDwqyc6RxmX2qU+6eTT6GR1DVnwMC3YJhgAQOVfmzmGfF9QSfRS8CQAvamOhoAAdrpErJyyL4uwsvqLESkR18JYcjQsKFgW9wyQDtPWsPaAWQ8rSarVtFiAK1yKw9E4gjTNryAmFW02KS+xMusreYIyBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HZid73Vj; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HZid73Vj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776070326; x=1807606326;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=XZmLP1+ppSiWoFMDuz1A6E1kHBrUU3vk8RmiolpleWA=;
  b=HZid73VjKRqNWgmsEn6mJpzIyu6cohVRj0XcHaTVAO4J70lCX6QDJGnm
   J0LayrBsHKlg3RsuYVh2dhm08oWW9jrOtgy0fYX/5IZMF+WqjtjPBn1GB
   sZ75UL7QEtZDQj2jdEJuhX60cjwpJT7vLUy41n0SEUcxBQlNj+HgUio2s
   g+KXQ4H+bP3hJx4vtwecLAjmJ0RNswTl7sGEtHHlOb/+mOh889dLjg3P/
   uxY+sDQDT7hPYZIsMJSlvuJ0nHUKwS5YpVYP9Fe7CG/WLlWbzZ7cN0X27
   YrhG8ToblFLL4lvOLfoMm/gj4MXsW3esVDXX4YSxxARaV5Yc60k5TRtHe
   A==;
X-CSE-ConnectionGUID: 7Yasp7hVRVCrMCE+gUx0bw==
X-CSE-MsgGUID: XP5SeCNMQU6+ZzJTIPVWJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="77177813"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="77177813"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 01:52:05 -0700
X-CSE-ConnectionGUID: 104zz4vxSrO0RUUmvApBNQ==
X-CSE-MsgGUID: jn3aMheTQmKbxK4pgcpxnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="223242569"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Apr 2026 01:52:03 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCD1V-000000000Jt-0wlt;
	Mon, 13 Apr 2026 08:52:01 +0000
Date: Mon, 13 Apr 2026 16:51:58 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: intel_pmc_mux: combine kzalloc + kcalloc
Message-ID: <202604131654.9GEXISW5-lkp@intel.com>
References: <20260411023642.146890-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260411023642.146890-1-rosenp@gmail.com>

Hi Rosen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus westeri-thunderbolt/next linus/master v7.0-rc7 next-20260410]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/usb-typec-intel_pmc_mux-combine-kzalloc-kcalloc/20260412-223212
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20260411023642.146890-1-rosenp%40gmail.com
patch subject: [PATCH] usb: typec: intel_pmc_mux: combine kzalloc + kcalloc
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260413/202604131654.9GEXISW5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260413/202604131654.9GEXISW5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604131654.9GEXISW5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/typec/mux/intel_pmc_mux.c:740:3: warning: variable 'num_ports' is uninitialized when used here [-Wuninitialized]
     740 |                 num_ports++;
         |                 ^~~~~~~~~
   drivers/usb/typec/mux/intel_pmc_mux.c:735:14: note: initialize the variable 'num_ports' to silence this warning
     735 |         u8 num_ports;
         |                     ^
         |                      = '\0'
   1 warning generated.


vim +/num_ports +740 drivers/usb/typec/mux/intel_pmc_mux.c

   730	
   731	static int pmc_usb_probe(struct platform_device *pdev)
   732	{
   733		struct fwnode_handle *fwnode = NULL;
   734		struct pmc_usb *pmc;
   735		u8 num_ports;
   736		int i = 0;
   737		int ret;
   738	
   739		device_for_each_child_node(&pdev->dev, fwnode)
 > 740			num_ports++;
   741	
   742		/* The IOM microcontroller has a limitation of max 4 ports. */
   743		if (num_ports > 4) {
   744			dev_err(&pdev->dev, "driver limited to 4 ports\n");
   745			return -ERANGE;
   746		}
   747	
   748		pmc = devm_kzalloc(&pdev->dev, struct_size(pmc, port, num_ports),
   749				GFP_KERNEL);
   750		if (!pmc)
   751			return -ENOMEM;
   752	
   753		pmc->num_ports = num_ports;
   754	
   755		pmc->ipc = devm_intel_scu_ipc_dev_get(&pdev->dev);
   756		if (!pmc->ipc)
   757			return -EPROBE_DEFER;
   758	
   759		pmc->dev = &pdev->dev;
   760	
   761		ret = pmc_usb_probe_iom(pmc);
   762		if (ret)
   763			return ret;
   764	
   765		pmc->dentry = debugfs_create_dir(dev_name(pmc->dev), pmc_mux_debugfs_root);
   766	
   767		/*
   768		 * For every physical USB connector (USB2 and USB3 combo) there is a
   769		 * child ACPI device node under the PMC mux ACPI device object.
   770		 */
   771		for (i = 0; i < pmc->num_ports; i++) {
   772			fwnode = device_get_next_child_node(pmc->dev, fwnode);
   773			if (!fwnode)
   774				break;
   775	
   776			ret = pmc_usb_register_port(pmc, i, fwnode);
   777			if (ret) {
   778				fwnode_handle_put(fwnode);
   779				goto err_remove_ports;
   780			}
   781	
   782			pmc_mux_port_debugfs_init(&pmc->port[i]);
   783		}
   784	
   785		platform_set_drvdata(pdev, pmc);
   786	
   787		return 0;
   788	
   789	err_remove_ports:
   790		for (i = 0; i < pmc->num_ports; i++) {
   791			typec_switch_unregister(pmc->port[i].typec_sw);
   792			typec_mux_unregister(pmc->port[i].typec_mux);
   793			usb_role_switch_unregister(pmc->port[i].usb_sw);
   794		}
   795	
   796		acpi_dev_put(pmc->iom_adev);
   797	
   798		debugfs_remove(pmc->dentry);
   799	
   800		return ret;
   801	}
   802	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
