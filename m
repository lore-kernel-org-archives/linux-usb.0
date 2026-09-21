Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F279C30568B
	for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 14:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999553; cv=none; b=itTQjaCRjo8n49ihEz1d4Fi4z7kOi2uWqaIqndlx9StWHIYaUWw4WWAduQamYmTnWcK5XIEdrQsWeGsNe6C7a/ioHjiXsmtKfZE8tkqBxCeqeiA/j7A9R77KrGDuWF2VaTpIEGZdzCi00rMiYSAZJhXUyvARxgdroNgIH1WuQQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999553; c=relaxed/simple;
	bh=2NAoqaXBGf2L8mCmCH+BQLXGHY3MB3lAmP3o03VtLUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dx6oqk1akK2SwCyAk/nDL/JcEkfzIluSSuUpYzd6/fZ7lZej62lqqfN8OLautvhrtOrD0juqQDKTaGUQKX6DvPHvlTxOq5rh5nv58I4aEAQpi2B8+oahxGmiHbaYu7FAKLo9S0hJF+2spM9/PNfXfFLH0dCqqnBzixyow2N5Co0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pn8j1Bay; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pn8j1Bay"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789999553; x=1821535553;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2NAoqaXBGf2L8mCmCH+BQLXGHY3MB3lAmP3o03VtLUc=;
  b=Pn8j1BayOZDU1xrhMwYXM+0fcSj0/OEkupD/C5NjgQCSaNxjfyhJf6VU
   joUyji27Nm5o7P+U2BtIJCq3aEmJ7HSciFEQGsTtHYMUENXYfDbWMQcns
   hKujIpH8M9gKMRR2ru0g7d0SBlQc/R+eElyUcB5vC3CNz83CTGVIBYVQ1
   27FDoVpe4SbZRcJdWXKR0N/WW809rhFxFekuzi4GdzKQovGelNh/UaM42
   gloZ6Xk2WyEMg/dWFKYAC/7XbdRUsWElxRevvjOXEGtQTL76u7bTSlnLQ
   IZqc+UZwfjSqDIxUpP9B3cwSYg8kYadS+ngCwsMzxWocMHvF3Jk8hg6GC
   Q==;
X-CSE-ConnectionGUID: OuVZT+WrRPyucGegtLynHw==
X-CSE-MsgGUID: gwXv14pTRzej0xrdRclm/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="1021349"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="1021349"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 07:05:52 -0700
X-CSE-ConnectionGUID: TytxqtW+SHSLlupjvYAOxg==
X-CSE-MsgGUID: GHMlS1VkQsaP2shhBdyhlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="300605126"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO [10.245.244.175]) ([10.245.244.175])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 07:05:50 -0700
Message-ID: <9d4cefb6-7061-48cb-8021-3f557b133bc0@linux.intel.com>
Date: Mon, 21 Sep 2026 17:05:41 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: return an error if the host is not halted
To: Henry Tseng <henrytseng@qnap.com>, Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Michal Pecio <michal.pecio@gmail.com>
References: <20260902101510.30246-1-henrytseng@qnap.com>
 <20260918101755.18141-1-henrytseng@qnap.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260918101755.18141-1-henrytseng@qnap.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/26 13:17, Henry Tseng wrote:
> On Wed,  2 Sep 2026 18:15:10 +0800, Henry Tseng <henrytseng@qnap.com> wrote:
>> xhci_reset() returns 0 when the host is not halted, without ever writing
>> CMD_RESET. Every other path that fails to reset the host returns an
>> error, so callers that check the return value are told the reset
>> succeeded on the one path where it did not happen.
>>
>> Return -EBUSY when the reset is aborted because the host is not halted.
>>
>> Signed-off-by: Henry Tseng <henrytseng@qnap.com>
>> ---
>>   drivers/usb/host/xhci.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
>> index a9e47e178c28..2af6a7b91e55 100644
>> --- a/drivers/usb/host/xhci.c
>> +++ b/drivers/usb/host/xhci.c
>> @@ -195,7 +195,7 @@ int xhci_reset(struct xhci_hcd *xhci, u64 timeout_us)
>>   
>>   	if ((state & STS_HALT) == 0) {
>>   		xhci_warn(xhci, "Host controller not halted, aborting reset.\n");
>> -		return 0;
>> +		return -EBUSY;
>>   	}
>>   
>>   	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "// Reset the HC");
>> -- 
>> 2.43.0
>>
>>
> Hi Mathias,
> 
> A gentle ping on this one. Please let me know if the approach needs any
> changes.

Patch added to queue, thanks

Mathias

