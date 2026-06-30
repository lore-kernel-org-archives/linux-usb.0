Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6731926F2B0
	for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 12:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782821968; cv=none; b=sGdHZ+jyOlBOkF9IV0x7SFyk+XR5ArsCH13OHcAnFGHU9NOwTuyl/BdZsqEYI2jCaTOkn/UidF3/5ewfIvhE1+PKcR1ljQ7CMOJqBRp7/ODY9b/Kyg+d8b4PYjcRHF8fXsp+92p6kJAaAuhsYOaDRsd1Pg2LuoL96ZwJSCkK6YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782821968; c=relaxed/simple;
	bh=fy2ZIA4bfqECbzSb1emW+G0BJNVaraB9oSf1dc2y1Ag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tlno8MElW+xzirZ5XgEiO0hBcE3bRx1KfvxfmZbcXkhsLdwSsPZd3+Mn0uUwdEikl9sPYeLwead7nzn3ry2kmCRcuuNnt+8A1bLpkw6lZD7JUH1PdyjJdYqJOTHy0SJMPoxbfYAxXz3Lc2S0eq0cgjJQT67oCdNqp5IZwDt7Jd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XCUHMmO5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XCUHMmO5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782821967; x=1814357967;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fy2ZIA4bfqECbzSb1emW+G0BJNVaraB9oSf1dc2y1Ag=;
  b=XCUHMmO5yt2IhnUizcRom8T1JWzVcNnOMFhAs5wHxSgAMTO6TdaikMO5
   /U5ISGUgqutgC7k1q0XxhZDrXlAwHQN+JM3A8O3kOpW1rVm18VmMbsDv+
   ol0+jc50PGSDExUIn7YziMartPP9Hr7sOcyQiJZ4dEbQKhyruxghWjzAc
   5YH1csmlOxpUz+CGR5iYRnXXVmqtoOU9qefiyIZZEErChHUmd6OprB0pK
   PWdtgzTSKbl87rskSAKk9GswoBEMctDAIIkqj+tdfbQpRFlvQaRLlKJSN
   vk/DMGRsm9gRbh5sJyumH8LTE/6rXMw3DMTbDsSgsS1Qz6DG7l618uyHQ
   Q==;
X-CSE-ConnectionGUID: q2b/8XB4QC6cVtRIOo9C5Q==
X-CSE-MsgGUID: eG9uOJdtQb6X5Rl/xjTwcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83590715"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="83590715"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 05:19:27 -0700
X-CSE-ConnectionGUID: /5cON3DxQNqf387muNOslQ==
X-CSE-MsgGUID: E3WkvWqLRTCNHVV1C3ypyw==
X-ExtLoop1: 1
Received: from rvuia-mobl.ger.corp.intel.com (HELO [10.245.245.197]) ([10.245.245.197])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 05:19:26 -0700
Message-ID: <0a2db9bd-027a-4810-9750-8e2041fbe32f@linux.intel.com>
Date: Tue, 30 Jun 2026 15:19:23 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH 0/3] xhci: avoid futile stop endpoint command and host
 teardown
To: Xu Rao <raoxu@uniontech.com>
Cc: linux-usb@vger.kernel.org, michal.pecio@gmail.com
References: <20260629123031.142133-1-mathias.nyman@linux.intel.com>
 <31BE5DC88420567E+20260630070611.3186010-1-raoxu@uniontech.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <31BE5DC88420567E+20260630070611.3186010-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/30/26 10:06, Xu Rao wrote:
> Hi Mathias,
> 
> I tested this series on the Renesas uPD720201 xHCI controller with the
> GenesysLogic hub and RTL8153 device behind it.
> 
> The original failure is no longer reproduced. After unplugging the hub,
> the xHCI driver no longer tears down the host, and I no longer see:
> 
>    xHCI host not responding to stop endpoint command
>    xHCI host controller not responding, assume dead
> 
> The log also shows the new EP_DROP_PENDING path is used during disconnect,
> for example cancelled TDs are invalidated directly instead of queuing a
> futile Stop Endpoint command.
> 
> 
> Tested-by: Xu Rao <raoxu@uniontech.com>

Thanks for testing.

Do you think this series is enough for the Renesas uPD720201 controller issue
and we can skip the 'Disable soft retry' patch?

Thanks
Mathias

