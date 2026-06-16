Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F533B27D2
	for <linux-usb@vger.kernel.org>; Tue, 16 Jun 2026 09:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781603603; cv=none; b=DwVnl+AA+re6VjkqS28A7327c6v2oHYLGomXkGrAXbcOtb2OE8xe/uJxkBGODyqbQItraGKz6UDM4kS2L2e08JIBO8Ky0Rs9Gtbk+MLBHb0KUm495TPV33ZH7IyNOW3bEsjbGtVXm9QyDw3OmbcKEapi/IEWR0HUupBmKPlVPbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781603603; c=relaxed/simple;
	bh=D7aWMnfy36Gos+iyptP1ZSkhrBep2FZNlR3NVlxWyQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eqGVM4YjOK7vmzL3vvjyeuVFpLbRu4pgNi4qS4X/oi1fyweE57u1q1u7H9S8TQ1h3fU8vFGqLRfXs1J7qDLHKbbHx2nGRHrhtN1FUi/IDdsGfHT8i3oQ5HMAQxQnSMacyn0wYLKlYcw0RxRDPcPlsZrP4MX6ITThUMNrpnBK2bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Js1OgK1/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Js1OgK1/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781603603; x=1813139603;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=D7aWMnfy36Gos+iyptP1ZSkhrBep2FZNlR3NVlxWyQ0=;
  b=Js1OgK1/Nutao4Ifz/vfGXqILmPHPKkGbQWRLlOryQ7n4mtAqkljnviz
   dQSlx+7yE3XOEYNuM11lTG3A1lPOYc5NQXOx4n9MD9NFm8Byv7943Hibo
   RClXhG0zYwPnADQ4QgpjyArxrWdbmGgiaiiYg2KnXzJDveFHfwCNSnDSw
   VL0JdctatACwP+bkamiOpZxb6QHlrBgxhP0nm8Q0ol984bnJAOYR/KOox
   5X4DZ7iknuCioR6SX/Nvgar/UTl3yhCHdz/lpj2W1Nyd4UwOSchPO5iUQ
   sMCbuPAmXR+B84P6Lqf8mivJy5BEy2NPHqKJ0LgTDoptOwlAhwVFTEMja
   Q==;
X-CSE-ConnectionGUID: Mi6/Tc5kQEac6KeCRQqj1A==
X-CSE-MsgGUID: KsojX41vQ8GrxkWjZUi5Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="84928405"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="84928405"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 02:53:21 -0700
X-CSE-ConnectionGUID: wnmnOWvcRY+kMSS2zo7SfQ==
X-CSE-MsgGUID: oVvHlaxrQ5+FP2X8AFnP3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="246609472"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.244.156]) ([10.245.244.156])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 02:53:19 -0700
Message-ID: <33357746-42dd-4953-84ca-1d8bef4511a1@linux.intel.com>
Date: Tue, 16 Jun 2026 12:53:16 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] xhci: dbc: support runtime suspend while DbC is in
 enabled state
To: Greg KH <gregkh@linuxfoundation.org>
Cc: chaitanya.kumar.borah@intel.com, linux-usb@vger.kernel.org
References: <20260616080932.2229237-1-mathias.nyman@linux.intel.com>
 <20260616080932.2229237-2-mathias.nyman@linux.intel.com>
 <2026061602-underfed-glue-19b8@gregkh>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <2026061602-underfed-glue-19b8@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/16/26 12:46, Greg KH wrote:
> On Tue, Jun 16, 2026 at 11:09:32AM +0300, Mathias Nyman wrote:
>> Allow xHC to runtime suspend if DbC is in 'enabled' state for over
>> 15 seconds without a connect.
>>
>> Idea is that every time we go to 'enabled' state we make sure DbC runtime
>> pm usage is '1' and save a timestamp. if the event loop still finds DbC in
>> enabled state 15 seconds later then it decrease DbC runtime pm usage by
>> calling pm_runtime_put().
>> Enabled state is reached either when DbC is enabled by userspace or a
>> connected/configured DbC is disconnected.
>>
>> When a connect is detected we make sure DbC usage count is 1.
>>
>> If DbC has been in 'enabled' state for 15 seconds and DbC usage is
>> decreased to 0 by pm_runtime_put, then the whole xHC controller may
>> runtime suspends to PCI D3 state if no other devices are using it
>>
>> DbC sysfs file will show 'suspended' when xHC is suspended and will wake up
>> and enable DbC at cable connect, or when user writes 'enable' to the file.
>>
>> This patch was originally part of a larger DbC series, but dropped before
>> the series was submitted to 7.2-rc1. The series has a locking issue in
>> commit 520058b73ba3 ("xhci: dbc: serialize enabling and disabling dbc")
>> which is also resolved by this patch
>>
>> Fixes: 520058b73ba3 ("xhci: dbc: serialize enabling and disabling dbc")
>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>> ---
>>   .../testing/sysfs-bus-pci-drivers-xhci_hcd    |  2 +-
>>   drivers/usb/host/xhci-dbgcap.c                | 60 ++++++++++++++++++-
>>   drivers/usb/host/xhci-dbgcap.h                |  3 +
>>   3 files changed, 62 insertions(+), 3 deletions(-)
> 
> No "reported-by:"?

I'll send v2

-Mathias
