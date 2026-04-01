Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F151D33EAF9;
	Wed,  1 Apr 2026 19:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775071655; cv=none; b=sd73VSiKgxwwwe7ASMhehM7UZH6mxpWSq2ADqyOxW50Sz/XN45Meevznzn4jkeULV7Qwss2NOtMCHk/wcVJT/Y59s3lZtFgx5HtJUB+vQjGfic8g0H4aE0WRHDx5Zpr6ys/H8EV9LQidCRwNLjH4V1p2xI2DR2egKJ4LrZuLsHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775071655; c=relaxed/simple;
	bh=Por6Bivu3RY/etWGrApXUaxm8laHsOpvqzeH//gKASU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uom4pOOYENuI556WRjlk0nePiJLBZzX1uw49IQPjOdAZPH+WU/itbUkfelJ0OJsrinVtyn5Ueav1zeMN3arzgKh7yRBO0aD/LwUpjj/rKa+uGltwZ0ykpDBGSYsK4JvkswzmHXp4ohReSyBo5nkfRjqWMcPpU+FxAflMsooJRiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j6slyov0; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j6slyov0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775071655; x=1806607655;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Por6Bivu3RY/etWGrApXUaxm8laHsOpvqzeH//gKASU=;
  b=j6slyov0ePRopSzJzXH+9XwBKG5gpH2HUlPzNvybpZ9U1Wkq62wHOzF6
   JxRSRd6cxuett52K//n6uljuv+CAC2Y29kSKY6yi3XVLJPW/JajZBSxf4
   HaCtY2nnSTvOvH/Fpl3zog3IpIJpES/Y5Izl9aeAklcKwzJ0A2nDc/LcM
   3zgLTkxweH0prC465iHOsDzFsQNUJL6bT/iQ5YoeerHBNl5jnbKHfw0yf
   tfYJOnELuVcDHf97iTILbo4M/he+EHMTSlNj5gMGzaPZobX2gPYdm7B8A
   LFCb/ETZCwtn8/bM6BqCejK/xihUdkaZudDn2Jbqt5vnUCYlObBVCZqUA
   g==;
X-CSE-ConnectionGUID: uYH+LkuPTHCghuZyotYYbA==
X-CSE-MsgGUID: TBUbS3x9TDSv2Di194H38A==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76007790"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="76007790"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 12:27:34 -0700
X-CSE-ConnectionGUID: u5EPoVbcRZib+pUv063EyA==
X-CSE-MsgGUID: CCvJxipQSwyspH97hdNrkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="231179816"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.244.145]) ([10.245.244.145])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 12:27:32 -0700
Message-ID: <88f6d39e-5738-4a55-af75-854dfc0df094@linux.intel.com>
Date: Wed, 1 Apr 2026 22:27:29 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: Make usb_host_endpoint.hcpriv survive
 endpoint_disable()
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260331010654.269ac270.michal.pecio@gmail.com>
 <e14fb308-a003-4a76-b908-106b5271eccc@linux.intel.com>
 <20260401165205.56dcfcda.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260401165205.56dcfcda.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/1/26 17:52, Michal Pecio wrote:
> On Wed, 1 Apr 2026 17:34:37 +0300, Mathias Nyman wrote:
>> On 3/31/26 02:06, Michal Pecio wrote:
>>> xHCI hardware maintains its endpoint state between add_endpoint()
>>> and drop_endpoint() calls followed by successful check_bandwidth().
>>> So does the driver.
>>>
>>> Core may call endpoint_disable() during xHCI endpoint life, so don't
>>> clear host_ep->hcpriv then, because this breaks endpoint_reset().
>>>
>>> If a driver calls usb_set_interface(), submits URBs which make host
>>> sequence state non-zero and calls usb_clear_halt(), the device clears
>>> its sequence state but xhci_endpoint_reset() bails out. The next URB
>>> malfunctions: USB2 loses one packet, USB3 gets Transaction Error or
>>> may not complete at all on some (buggy?) HCs from ASMedia and AMD.
>>> This is triggered by uvcvideo on bulk video devices.
>>
>> Were you able to trigger a usb_clear_halt() called with ep->hcpriv == NULL,
>> causing a toggle/seq mismatch?
>>
>> The ep->hcpriv should be set back correctly in usb_set_interface():
>>
>> usb_set_interface()
>>     usb_hcd_alloc_bandwidth()
>>       hcd->driver->add_endpoint()
>>         xhci_add_endpoint()
>>           ep->hcpriv = udev;
> 
> right, and later:
> 
>       usb_disable_interface(dev, iface, true)
>         usb_disable_endpoint(dev, ..., true)
>           usb_hcd_disable_endpoint(dev, ep)
>             hcd->driver->endpoint_disable(hcd, ep)
>       usb_enable_interface(dev, iface, true)
>         usb_enable_endpoint(dev, ..., true)
>           usb_hcd_reset_endpoint(dev, ep)
>             hcd->driver->endpoint_reset(hcd, ep)
> 

True, thanks, usb_set_interface() calls usb_disable_interface() twice.
First time just to flush pending URBs, second time with reset_hardware
flag set.

Adding patch to queue

-Mathias

