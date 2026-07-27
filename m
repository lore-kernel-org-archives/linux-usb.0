Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D4C422E36
	for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 16:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785170587; cv=none; b=FOhhs+0lt0C9mnk1odjjC5KRegROicZ10xKpUnWY144l3VpUYfkgkn4BVSUa9dQPGHsbBsmwlRNiwzzChYJNryu8dVXo5W2RmhUMZwZBgu2srFBEZvt2rAzBg0RyJ1Rksye9l+g3pRrzvvdXMUlTT7rm9kQ9nmYzmARNralUwZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785170587; c=relaxed/simple;
	bh=9SpQBJLruHY6a/9VFB6mc1Gqmhm8ZVqOYyhnISrB2rs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jzjlyM19rGuJkMs2N1tq781Md+w1Gu4F81xW/KTukRaAJ70VGIaLK6rQ487HJZMYQd34dxvQXjtBibfqYjOvmGWjHXkwTg820/yOuN0nJUlC7CJXPJTqWbryOiIOrFpEf5K21IjeCYb+B22/4ae7Njwr6RhnsJPPA/Joo0CpPdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lNDpbLOH; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lNDpbLOH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785170585; x=1816706585;
  h=date:from:to:cc:subject:message-id;
  bh=9SpQBJLruHY6a/9VFB6mc1Gqmhm8ZVqOYyhnISrB2rs=;
  b=lNDpbLOHKXywjyTqlFT+XvcxLjxbM4cRyyIQQgnLu2hVzmh7noyl+WiI
   jIGuKh1gCmqGTjORg/m3lvSBJgJ+Oz5fogbeEqjxaarEuh2u2doIGAngP
   WLYBybQOIFARs9eFtFWJB7ubLE2A1TLNgyY49sEhVD2rXClQJw4+7pgbw
   RqNVoaCvcDQO2VINjh3B/cBcgsMe+6fAwERIz2aVSPMS7RdHzgzqrPSWw
   og0mlylVUgslf5cyqzu3x4O0xa1XnTrb6x9BiVI1R94V5kZ3OjnIfeLmR
   ENsmItVxEsaR21kNeWZxYSsGKNdxqad7K3X3l8k/QF1+3hdrENQAFv+Jr
   Q==;
X-CSE-ConnectionGUID: fyT2/sWuQLeMgOpj62BvSA==
X-CSE-MsgGUID: 9u8G2F6vQh6u5LJeFqKAng==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="111287535"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="111287535"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 09:43:04 -0700
X-CSE-ConnectionGUID: TjiVA+P4TBWE+FpRlbZvew==
X-CSE-MsgGUID: j2zsES9dTDGzKck40kokeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="256787656"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 27 Jul 2026 09:43:02 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woOPr-000000001g6-2jBY;
	Mon, 27 Jul 2026 16:42:59 +0000
Date: Mon, 27 Jul 2026 18:42:32 +0200
From: kernel test robot <lkp@intel.com>
To: Pan Chuang <panchuang@vivo.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [westeri-thunderbolt:next 7/7]
 drivers/thunderbolt/pci.c:115:24: warning: unused variable 'dev'
Message-ID: <202607271811.1izFG7s9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
head:   eef9f6d8c36f7610b5f837e196692ec34842a400
commit: eef9f6d8c36f7610b5f837e196692ec34842a400 [7/7] thunderbolt: Remove redundant dev_err_probe()
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260727/202607271811.1izFG7s9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260727/202607271811.1izFG7s9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607271811.1izFG7s9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/thunderbolt/pci.c: In function 'nhi_pci_init_msi':
>> drivers/thunderbolt/pci.c:115:24: warning: unused variable 'dev' [-Wunused-variable]
     115 |         struct device *dev = &pdev->dev;
         |                        ^~~


vim +/dev +115 drivers/thunderbolt/pci.c

e241d98e04ef05 Konrad Dybcio 2026-05-21  110  
e241d98e04ef05 Konrad Dybcio 2026-05-21  111  static int nhi_pci_init_msi(struct tb_nhi *nhi)
e241d98e04ef05 Konrad Dybcio 2026-05-21  112  {
e241d98e04ef05 Konrad Dybcio 2026-05-21  113  	struct tb_nhi_pci *nhi_pci = nhi_to_pci(nhi);
e241d98e04ef05 Konrad Dybcio 2026-05-21  114  	struct pci_dev *pdev = to_pci_dev(nhi->dev);
e241d98e04ef05 Konrad Dybcio 2026-05-21 @115  	struct device *dev = &pdev->dev;
e241d98e04ef05 Konrad Dybcio 2026-05-21  116  	int res, irq, nvec;
e241d98e04ef05 Konrad Dybcio 2026-05-21  117  
e241d98e04ef05 Konrad Dybcio 2026-05-21  118  	ida_init(&nhi_pci->msix_ida);
e241d98e04ef05 Konrad Dybcio 2026-05-21  119  
e241d98e04ef05 Konrad Dybcio 2026-05-21  120  	/*
e241d98e04ef05 Konrad Dybcio 2026-05-21  121  	 * The NHI has 16 MSI-X vectors or a single MSI. We first try to
e241d98e04ef05 Konrad Dybcio 2026-05-21  122  	 * get all MSI-X vectors and if we succeed, each ring will have
e241d98e04ef05 Konrad Dybcio 2026-05-21  123  	 * one MSI-X. If for some reason that does not work out, we
e241d98e04ef05 Konrad Dybcio 2026-05-21  124  	 * fallback to a single MSI.
e241d98e04ef05 Konrad Dybcio 2026-05-21  125  	 */
e241d98e04ef05 Konrad Dybcio 2026-05-21  126  	nvec = pci_alloc_irq_vectors(pdev, MSIX_MIN_VECS, MSIX_MAX_VECS,
e241d98e04ef05 Konrad Dybcio 2026-05-21  127  				     PCI_IRQ_MSIX);
e241d98e04ef05 Konrad Dybcio 2026-05-21  128  	if (nvec < 0) {
e241d98e04ef05 Konrad Dybcio 2026-05-21  129  		nvec = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI);
e241d98e04ef05 Konrad Dybcio 2026-05-21  130  		if (nvec < 0)
e241d98e04ef05 Konrad Dybcio 2026-05-21  131  			return nvec;
e241d98e04ef05 Konrad Dybcio 2026-05-21  132  
e241d98e04ef05 Konrad Dybcio 2026-05-21  133  		INIT_WORK(&nhi->interrupt_work, nhi_interrupt_work);
e241d98e04ef05 Konrad Dybcio 2026-05-21  134  
e241d98e04ef05 Konrad Dybcio 2026-05-21  135  		irq = pci_irq_vector(pdev, 0);
e241d98e04ef05 Konrad Dybcio 2026-05-21  136  		if (irq < 0)
e241d98e04ef05 Konrad Dybcio 2026-05-21  137  			return irq;
e241d98e04ef05 Konrad Dybcio 2026-05-21  138  
e241d98e04ef05 Konrad Dybcio 2026-05-21  139  		res = devm_request_irq(&pdev->dev, irq, nhi_msi,
e241d98e04ef05 Konrad Dybcio 2026-05-21  140  				       IRQF_NO_SUSPEND, "thunderbolt", nhi);
e241d98e04ef05 Konrad Dybcio 2026-05-21  141  		if (res)
eef9f6d8c36f76 Pan Chuang    2026-07-16  142  			return res;
e241d98e04ef05 Konrad Dybcio 2026-05-21  143  	}
e241d98e04ef05 Konrad Dybcio 2026-05-21  144  
e241d98e04ef05 Konrad Dybcio 2026-05-21  145  	return 0;
e241d98e04ef05 Konrad Dybcio 2026-05-21  146  }
e241d98e04ef05 Konrad Dybcio 2026-05-21  147  

:::::: The code at line 115 was first introduced by commit
:::::: e241d98e04ef0513b78de2d87d8d1eb2993d9d34 thunderbolt: Separate out common NHI bits

:::::: TO: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
:::::: CC: Mika Westerberg <mika.westerberg@linux.intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
