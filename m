Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793279707;
	b=IAs0+pGSCzzI3eY7HS90b89ar2yFOQzIw+av2FZe1xDU2ibVqaVsr/GkbSVnJlDdH3/X
	 nXt0t+CqK2SnJCLKqjgUoRtjlhnwKp+al7C02KuPXm8GB/1LQ1RhwHBtEmVcTyK2Hng7f
	 ZuxtSUfoYaoZeCgp68qucqGJLXhqfbw9WJ4jqNCKvDicY2/m6slxZVBFcGlv/sxjY0fCu
	 pUUAtfoPZ6GQMvK7ZF3LnqoFZmeielmJqddAffwTDbrl67Zi7AYxcnxc8rEIp4Jc6tvcm
	 W6EN6g2qLJJ4A6U1l8YlN0/amUqRfF3ERcwjJvtJBQLVIZATIvKUelYECKK1rxLHXeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793279707;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=b3TE8Jcp2CODGo9k8JlFowAH9IpJjjptaAPC+MjW3n8=;
	b=qOi+l6YMGf3cJVSuf+4qB8JjMtuMdPPqiRoZ4DUZY08Av+ENnxOOmTTqO/PQUBkXbWL0
	 88R/INqWCTgEnUeUbJRFSp0AKDV5GfdBBBSjOd3qEUCwVmN/DlWEcZ+POGonyH4GXb3mN
	 gLUoiNXinrW7lzkLgO8H21JZM6YeMAIPLDvlzGMJ8tm05s/JYmiAR52/h4U45EbWeJRwT
	 hkO/BSqLqbznVLYAp6diMPOYbcEYUlytSu2rm8Kp57wlfnWjrWeETo8StMInmMDmU4Ctp
	 kGEDT6FZwm88gyQ1ZEMMFjb/ILR2UFVX84/Azl4yte2D3VILjq/oqW29+GgNSEAV/0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="L/2o8KKL";
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132AE606A323
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 13:15:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 132AE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L/2o8KKL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793279706; x=1824815706;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=gJ41TZMRp+RYle7s/+xUhPp3GKsiYwYkTrKcSZDtUeU=;
  b=L/2o8KKLVMPIXwC+Cu2QQpDkKJMkdPCJDwVZ/kO+oIKo5Wg2McK6CpIa
   dtsKJVHmFP6l0d9IuHIHCNnCysR1j9yn62e73lSkiFTXYfXtniUDP2VD0
   PJv/9Bkkb09VNMeo2B59N/1iZyU3+dIdvfW1AKo8TQL15ykN4xNVWJNF8
   5BWB2zYwvb5LQ4YrYzGQLvus/SDbK0IsAgIcqfudDxs+PxkvwWCzPTHNj
   gQVZx1uxhwAy0lVY1QssDtieEEbWT2eL1dFG+85A8gpUh+JUY11VkH5eK
   +y8+e8VPdoZqGvcxJRCmIL7iRzcXN4UPJWmxKwLzLhkAK9KaujoUtW4zf
   A==;
X-CSE-ConnectionGUID: EvaLkSfwQ3ymnMEnFdVWUQ==
X-CSE-MsgGUID: GmnJF45MSZKx5Zzyt7Es7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1905002"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1905002"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 06:15:06 -0700
X-CSE-ConnectionGUID: g4EzdoYPQOOL0BygBXstKg==
X-CSE-MsgGUID: JpyelWWDQzy/xGBpPCmvdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5154589"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.245.98]) ([10.245.245.98])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 06:15:04 -0700
Message-ID: <28097064-79bf-4056-87d4-48bd7f707a92@linux.intel.com>
Date: Thu, 29 Oct 2026 15:15:01 +0200
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH 0/2] xhci: clean up endpoint rings after disconnect
 detect
To: Yiyu Zhou <yiyu@yiyuzhou.io>
Cc: Michal Pecio <michal.pecio@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dennis Wissel <dennis@dsine.de>, diogochaves@me.com, raoxu@uniontech.com,
 linux-usb@vger.kernel.org, regressions@lists.linux.dev
References: <20261027184117.2461065-1-yiyu@yiyuzhou.io>
 <20261027192128.386082-1-mathias.nyman@linux.intel.com>
 <20261029041854.699752-1-yiyu@yiyuzhou.io>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20261029041854.699752-1-yiyu@yiyuzhou.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>> Only Reset Endpoint and Set TR Dequeue Pointer commands are issued;
>> ep0 is not restarted while the disconnect is pending.
> 
> That is what the log shows here.  Reset Endpoint on the disconnected ep0
> completed with success, Set TR Dequeue Pointer succeeded, the control
> URB was given back with -71, and later URBs were refused until hub_wq
> re-enumerated the device.  The other endpoints were given back without a
> reset.  I saw no controller hang or command timeout, so this Intel xHC
> is fine with Reset Endpoint on a disconnected ep0 (it ran twice).
> 
>> If these patches work, they might be squashed into one before going
>> upstream.
> 
> Squashing is fine with me.  1/2 alone leaves the stale TRBs on the ep0
> ring, as the cover letter says, so I would not apply it separately.
> 
> Tested-by: Yiyu Zhou <yiyu@yiyuzhou.io>
> 
Thanks for testing, I'll squash them together and send them forward

-Mathias
