Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477361E1E12
	for <linux-usb@vger.kernel.org>; Sat, 11 Jul 2026 02:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783736086; cv=none; b=WVhy5XgAdER3b18tzLkH8wKKK+T7mAV9Jgm7OjbHrvaeHL0jpJiYhvdUPMKSn4j+Yn5lLZstR5E3BxrogpcnZs6eEtBmBco6OCEGckii/GeltJs/AzwPP4M/6/puFMkBp/Vc3LZH6b3NoKNmyRyRnZu4VZ8DduQnvyPSxdhhIvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783736086; c=relaxed/simple;
	bh=W0s5R6CT/VifdB9T8aYI0NC5vLsjHvtFKT48hLSEVeU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qxhdN8/DiLrMCsiqdfmiZxwpEp+z+eoQ7kyz4jc2Qe6iE6CYYC7g/YUevebyXM5pvg4tX/Cwru7c7wt71ubAc4jIPR+t1j/7GRzfuJR74LCvpfFoR/7jww4r5qb6bKKRWpRVK8sPmMFZ1aLipNn9BwOPde8ABMhxjEi0tdfx/Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n9zTad9u; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n9zTad9u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783736084; x=1815272084;
  h=date:from:to:cc:subject:message-id;
  bh=W0s5R6CT/VifdB9T8aYI0NC5vLsjHvtFKT48hLSEVeU=;
  b=n9zTad9ut6Eg+J6ecjjY75WkiwxXh9CJAoC93TjjeWqDi4G3Hg6xTa5C
   4ZkT93K8uHjH/CcSgc8Jvp/PolHlpq/TZRUm0EqtEWaeKBy2dyotlxN59
   +EUrM0rYBdQwiU7y7lam7JDA8GZRqxszFOmhjLYs25tuI8NLTEI9zjqI/
   rbuGIS7dlv/1m6Uz7xsnp8321bIigmWmuDwrn6SGBS/FUeDPbQ+GeqAh7
   rrf9/L8PTNbUl6PY0OZ/jbrdDay5uwgCK2itzHhopYG404E2NHBakRoYG
   7PDZTtwJUlw1INDvPP8NBnGty1WswwhtbAkLdfL4hFBaq+DYOe6iHeBsS
   Q==;
X-CSE-ConnectionGUID: 9Dpbv4jDSu6FW3fILJCyUg==
X-CSE-MsgGUID: IaXdqQBaSPysdgOPF0HZwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95948498"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95948498"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 19:14:43 -0700
X-CSE-ConnectionGUID: PEF83fB9TrWtK00w4mnhaQ==
X-CSE-MsgGUID: nbUCLX9ESbKQs6AU+dtB5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="252402626"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 10 Jul 2026 19:14:42 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiNEl-00000000Jdy-1fX2;
	Sat, 11 Jul 2026 02:14:39 +0000
Date: Sat, 11 Jul 2026 10:14:37 +0800
From: kernel test robot <lkp@intel.com>
To: Neill Kapron <nkapron@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: [usb:usb-testing 33/66]
 drivers/usb/gadget/function/f_fs.c:2428:48: warning: '_rw' directive output
 may be truncated writing 3 bytes into a region of size between 1 and 8
Message-ID: <202607111052.PRRGX3Jq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   1db5c6b0b9834aee2f14e39764becfcc29d09ccf
commit: 0f0ea552cd215a01baca1e99eec02e2f8df0c897 [33/66] usb: gadget: f_fs: Introduce rw_proxy file descriptors
config: s390-randconfig-002-20260711 (https://download.01.org/0day-ci/archive/20260711/202607111052.PRRGX3Jq-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607111052.PRRGX3Jq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607111052.PRRGX3Jq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/gadget/function/f_fs.c: In function 'ffs_ep0_write':
>> drivers/usb/gadget/function/f_fs.c:2428:48: warning: '_rw' directive output may be truncated writing 3 bytes into a region of size between 1 and 8 [-Wformat-truncation=]
       snprintf(comp->name, sizeof(comp->name), "%s_rw",
                                                   ^~~
   drivers/usb/gadget/function/f_fs.c:2428:4: note: 'snprintf' output between 4 and 11 bytes into a destination of size 8
       snprintf(comp->name, sizeof(comp->name), "%s_rw",
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         epfiles[i].name);
         ~~~~~~~~~~~~~~~~


vim +/_rw +2428 drivers/usb/gadget/function/f_fs.c

  2378	
  2379	static int ffs_epfiles_create(struct ffs_data *ffs)
  2380	{
  2381		struct ffs_epfile *epfile, *epfiles;
  2382		unsigned int i, count, epfiles_count;
  2383		int err;
  2384	
  2385		count = ffs->eps_count;
  2386		epfiles_count = count;
  2387		if (ffs->user_flags & FUNCTIONFS_RW_PROXY_EPS)
  2388			epfiles_count += count / 2;
  2389		ffs->epfiles_count = epfiles_count;
  2390	
  2391		epfiles = kzalloc_objs(*epfiles, epfiles_count);
  2392		if (!epfiles)
  2393			return -ENOMEM;
  2394	
  2395		epfile = epfiles;
  2396		for (i = 1; i <= count; ++i, ++epfile) {
  2397			epfile->ffs = ffs;
  2398			mutex_init(&epfile->mutex);
  2399			mutex_init(&epfile->dmabufs_mutex);
  2400			INIT_LIST_HEAD(&epfile->dmabufs);
  2401			if (ffs->user_flags & FUNCTIONFS_VIRTUAL_ADDR)
  2402				sprintf(epfile->name, "ep%02x", ffs->eps_addrmap[i]);
  2403			else
  2404				sprintf(epfile->name, "ep%u", i);
  2405			err = ffs_sb_create_file(ffs->sb, epfile->name,
  2406						 epfile, &ffs_epfile_operations);
  2407			if (err) {
  2408				ffs_epfiles_destroy(ffs->sb, epfiles, i - 1);
  2409				return err;
  2410			}
  2411		}
  2412	
  2413		if (ffs->user_flags & FUNCTIONFS_RW_PROXY_EPS) {
  2414			struct ffs_epfile *comp = epfiles + count;
  2415	
  2416			for (i = 0; i < count; i += 2, ++comp) {
  2417				struct ffs_epfile *ep1 = &epfiles[i];
  2418				struct ffs_epfile *ep2 = &epfiles[i + 1];
  2419				bool ep1_in = ffs->eps_addrmap[i + 1] & USB_ENDPOINT_DIR_MASK;
  2420	
  2421				comp->ffs = ffs;
  2422				comp->is_rw_proxy = true;
  2423				comp->epfile_in = ep1_in ? ep1 : ep2;
  2424				comp->epfile_out = ep1_in ? ep2 : ep1;
  2425				mutex_init(&comp->mutex);
  2426				mutex_init(&comp->dmabufs_mutex);
  2427				INIT_LIST_HEAD(&comp->dmabufs);
> 2428				snprintf(comp->name, sizeof(comp->name), "%s_rw",
  2429					 epfiles[i].name);
  2430				err = ffs_sb_create_file(ffs->sb, comp->name,
  2431							 comp, &ffs_epfile_operations);
  2432				if (err) {
  2433					ffs_epfiles_destroy(ffs->sb, epfiles, count + (i / 2));
  2434					return err;
  2435				}
  2436			}
  2437		}
  2438	
  2439		ffs->epfiles = epfiles;
  2440		return 0;
  2441	}
  2442	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
