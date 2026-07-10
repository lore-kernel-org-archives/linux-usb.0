Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFF2367B73;
	Fri, 10 Jul 2026 17:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783703700; cv=none; b=DKgrtJ7CPu3Tmgm7KP0+PLsmHJD3PIcrNhws8s3HLmcxgafM0O2QTnh/jfxMGlpjS5wTxDroIAiXCU74UY3cikUfUpoeyy+/KP4u5nGNAjSjvNSXCavkGfyXfkWx3HaGy+VnBzZ+7uZqLPKSnOXJxmAwfyjzYH3Iw12+Wj57H2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783703700; c=relaxed/simple;
	bh=UEk58ujqPzAcbcK00uYPo/5tSzpIGjm8wEJduX8C9Vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I7U5KMI+YYtsSsBssjzzNax85g1QXYkiKOOEEng+g6SECTyRCyMiKNGKxVZhkvuwXbOInvZuudKAl5cwE1H+K99IGjnQNZEpyL8zFT0h0xrJUd7RleFrAt97WcNEGOT7GSECbbIQK/LEb2Nq9gKS5fWzS1sJ4t33EvoIuAmEBU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lu6DwVRs; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lu6DwVRs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783703697; x=1815239697;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UEk58ujqPzAcbcK00uYPo/5tSzpIGjm8wEJduX8C9Vc=;
  b=lu6DwVRsDf+IPlO3Cu6qxaTwV37FziTB0zwzcw3m4qcKrnU+5j040Qch
   UhFHSMDSdPHdebq7QXYnrc5LjNezWN8w/IpUeqgszxLeeJYELDd9DhAlL
   g5zdkWJ14/QdQxByKVQl2z7H5DETSnvaBnnvIT75J4dqf/wXy/5HyGTX7
   N76MZc3W55FZSOt4qU6Xx4QpjA5IHA9VHaM3cteB0rSBKL8/JUT/tHr/D
   HAGNN6vTGu+0wNScx3tTbEJjYdscJNNwuvS21anPcWcGXIQQY4LFaycro
   jKzSDNydL/WoBkVO6dCjlw9sQ7oJ1SPPBomucjJauzLAfbnSVHjT636AC
   Q==;
X-CSE-ConnectionGUID: uk3prhlfRkmiUdqBKPUw0A==
X-CSE-MsgGUID: 8ApdRMraSw2DpP/kAmT75Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101956419"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="101956419"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 10:14:56 -0700
X-CSE-ConnectionGUID: OazDl0iMTjSvv5VarzvHHw==
X-CSE-MsgGUID: Ojf6J2zMTtql3uXyy2Jdgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="255592851"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 10 Jul 2026 10:14:54 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiEoN-00000000J9v-1u6M;
	Fri, 10 Jul 2026 17:14:51 +0000
Date: Sat, 11 Jul 2026 01:14:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, Dmitry Baryshkov <lumag@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH] usb: typec: ucsi: ucsi_glink: Prevent suspend during
 UCSI notification handling
Message-ID: <202607110115.YSVz17MH-lkp@intel.com>
References: <20260710-ucsi_glink_wakeup-v1-1-7d97ea628d92@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710-ucsi_glink_wakeup-v1-1-7d97ea628d92@oss.qualcomm.com>

Hi Jishnu,

kernel test robot noticed the following build errors:

[auto build test ERROR on 2cb6eac064c8334418a76999468f68696a8dfe71]

url:    https://github.com/intel-lab-lkp/linux/commits/Jishnu-Prakash/usb-typec-ucsi-ucsi_glink-Prevent-suspend-during-UCSI-notification-handling/20260710-182232
base:   2cb6eac064c8334418a76999468f68696a8dfe71
patch link:    https://lore.kernel.org/r/20260710-ucsi_glink_wakeup-v1-1-7d97ea628d92%40oss.qualcomm.com
patch subject: [PATCH] usb: typec: ucsi: ucsi_glink: Prevent suspend during UCSI notification handling
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260711/202607110115.YSVz17MH-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607110115.YSVz17MH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607110115.YSVz17MH-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/typec/ucsi/ucsi_glink.c: In function 'pmic_glink_ucsi_callback':
>> drivers/usb/typec/ucsi/ucsi_glink.c:352:53: error: 'struct dev_pm_info' has no member named 'wakeup'; did you mean 'can_wakeup'?
     352 |                 pm_wakeup_ws_event(ucsi->dev->power.wakeup,
         |                                                     ^~~~~~
         |                                                     can_wakeup


vim +352 drivers/usb/typec/ucsi/ucsi_glink.c

   338	
   339	static void pmic_glink_ucsi_callback(const void *data, size_t len, void *priv)
   340	{
   341		struct pmic_glink_ucsi *ucsi = priv;
   342		const struct pmic_glink_hdr *hdr = data;
   343	
   344		switch (le32_to_cpu(hdr->opcode)) {
   345		case UC_UCSI_READ_BUF_REQ:
   346			pmic_glink_ucsi_read_ack(ucsi, data, len);
   347			break;
   348		case UC_UCSI_WRITE_BUF_REQ:
   349			pmic_glink_ucsi_write_ack(ucsi, data, len);
   350			break;
   351		case UC_UCSI_USBC_NOTIFY_IND:
 > 352			pm_wakeup_ws_event(ucsi->dev->power.wakeup,
   353					   UCSI_GLINK_WAKEUP_TIMEOUT_MS, true);
   354			schedule_work(&ucsi->notify_work);
   355			break;
   356		}
   357	}
   358	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
