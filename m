Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D659C239567;
	Thu, 12 Feb 2026 03:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770868598; cv=none; b=vFoJ2cDIMl9Yk9m1oad/1OCDowAcv4otqarAt27m0xfzCqjbx4Cs3gZUqiLkrY6lmeihrWRSTJNBuIqQCyqS0KA5IiVyUTCw4qkey9izFh7on5ssKyk2c1evoafIKQPmfxwRMAhCrwkDgumG72gYp76k5aeCuerpUFQyGjEtbtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770868598; c=relaxed/simple;
	bh=m5FX710KFiG+MB3P345VDRHdTTue3VoIFjOCrEq7n50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nb2lLccpwygCa4rGgjJvRs61eSQzIJDFnPqL/hU7inPLyxAwZ9kgrVxw9MeRH+ziZ+27Fuj3EXOl8/tOTUcgOXga+1bbo3ilZ1TZ8YEw3jaM4jvfEcS2ctn637JQXuRtumZtiAl6TBqrAEjCU71lpfeJDKo+3sePIiI5QZdIgpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b+qGPcc8; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b+qGPcc8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770868597; x=1802404597;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m5FX710KFiG+MB3P345VDRHdTTue3VoIFjOCrEq7n50=;
  b=b+qGPcc8dEUblC2J1Are49gIvQhdRJGTwaPY5w2j1t4H9lq/Xf1QlGJB
   zflZX1PhRstxzQmHG+2RSaWrx7gStjg9XLigCfHWrWRpIoE39BUN0nlh7
   8NoIdf0WvyN+9TsodA5eogrDYG9MtkVibTbh5AXYlP2bAuJ85ZjwMgbTp
   DEp2GR+neSisDjHMbBPHL3qfdbzV2dshKzG+sOUcURW8nzFRXW7I397A1
   b5y8r6hjjsoJY40FA0JInB6h2Aq3yb5tE/xzJAf3jKDeL7/8ioT4LrN7T
   S/h+ullocDJyGI+oMJhnCJl9qVnWrb3k0/8XM1CCaTImFphknmWoNAwzh
   A==;
X-CSE-ConnectionGUID: P+U2BcGHSquaz0/34mLw3w==
X-CSE-MsgGUID: PmbFv0J/RjexNDgr7xNACA==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="72076958"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="72076958"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 19:56:37 -0800
X-CSE-ConnectionGUID: 8YKsv03FT4Oi33+hgFC3eA==
X-CSE-MsgGUID: le1ORshSScmQxXWm8fQHjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="211323652"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 11 Feb 2026 19:56:33 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqNod-000000001GL-1E4e;
	Thu, 12 Feb 2026 03:56:31 +0000
Date: Thu, 12 Feb 2026 04:56:26 +0100
From: kernel test robot <lkp@intel.com>
To: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	Kyle Tso <kyletso@google.com>, RD Babiera <rdbabiera@google.com>,
	Amit Sunil Dhamne <amitsd@google.com>
Subject: Re: [PATCH 2/2] usb: typec: tcpm: add support for Sink Cap Extended
 msg response
Message-ID: <202602120453.BOyqL3t6-lkp@intel.com>
References: <20260211-skedb-v1-2-616340426cdc@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211-skedb-v1-2-616340426cdc@google.com>

Hi Amit,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8dfce8991b95d8625d0a1d2896e42f93b9d7f68d]

url:    https://github.com/intel-lab-lkp/linux/commits/Amit-Sunil-Dhamne-via-B4-Relay/dt-bindings-connector-Add-sink-properties-to-comply-with-PD-3-1-spec/20260212-072745
base:   8dfce8991b95d8625d0a1d2896e42f93b9d7f68d
patch link:    https://lore.kernel.org/r/20260211-skedb-v1-2-616340426cdc%40google.com
patch subject: [PATCH 2/2] usb: typec: tcpm: add support for Sink Cap Extended msg response
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260212/202602120453.BOyqL3t6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602120453.BOyqL3t6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602120453.BOyqL3t6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/usb/typec/tcpm/tcpm.c:351 cannot understand function prototype: 'struct pd_identifier'
>> Warning: drivers/usb/typec/tcpm/tcpm.c:368 cannot understand function prototype: 'struct sink_caps_ext_data'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
