Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0C313A258
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 22:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791586031; cv=none; b=Mnp3lTs2N5j6qt2mqUkpKfCiU7QArB0MjKs/Lp1I44MDkf6yDEEXX91F1DLxkm+bYEyKNpuptWoHC0lo4Z/NVD51glMmdCukOP38tt4OslpvgJr0FefP6J5B6GSmPYa6fAkBghvSciVUpV8LzTldkzRpG+XHXtQXWAhTYY1aDtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791586031; c=relaxed/simple;
	bh=5wi7ZJzipJpQm3rsTVf/R+Fm2rYcMtyXpJFz9CmEVg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l1L/A+eFwM3AxD8Q3weQMvPczEdJ7rk17smeM6B4mtOhN2YJs6Ze/yRtcbNMqRn3PtDl8vHpkqeZIFjTkwFZ17Db7FhvXsHSbqfMzadMV5k9Q0YPCJPgUGNc0JEQ4YNm7Xw9HoX9+LxkoqAe5E5CN1BUrVsTvryvSf8zxJzCof8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SW9hy3rt; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SW9hy3rt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791586029; x=1823122029;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5wi7ZJzipJpQm3rsTVf/R+Fm2rYcMtyXpJFz9CmEVg0=;
  b=SW9hy3rtnFFwWzBx15g4BinKRhPQRYrN2YpGIyKm32Mk+pU/bqY4+Z6D
   4FO/3RB1z64MCTjhKVe0zeQet7OIH6zKl2WuZl9xymnZrTOWmjr55y0SO
   2pzyAhpbaTP3gc18T1OHBs2Sohq5ABLAsH48vx1Fof3uj5zVBr4XQrys0
   KTtg1YUOlBE1hStUz3PKUpyMO9ZE8Nu1AbOJ9GnDiPbclLEGgYh3vbdKQ
   5oTg2YneRsZLR2L3LA+EIIg0IJbySz3y8BaxlnonP9E3fR2qYzNontX/U
   gz3/IO/uh83nptOv+bP9r574Rsmd9c7byziMUA7lknacD+lppHIWo6CUo
   Q==;
X-CSE-ConnectionGUID: dENaWlaHSu24ymYV1JSnxA==
X-CSE-MsgGUID: Rd8EX94BSMa7Zhsk7oe9ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="384893"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="384893"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 15:47:09 -0700
X-CSE-ConnectionGUID: LQ0eEaqBSBKAi1GmdrLvaw==
X-CSE-MsgGUID: Pqn6d0WuSxaRqnlidqtsrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="508263"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO [10.245.244.17]) ([10.245.244.17])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 15:47:08 -0700
Message-ID: <2b9e7969-bb78-4874-b5e0-0321d31d3beb@linux.intel.com>
Date: Sat, 10 Oct 2026 01:47:05 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] xhci: Prevent invalid vdev dereference during
 sideband unregister
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
References: <20261009151624.618967-1-mathias.nyman@linux.intel.com>
 <20261009151624.618967-12-mathias.nyman@linux.intel.com>
 <sashiko-outbox-165777@kernel.org>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <sashiko-outbox-165777@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/26 18:30, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] xhci: TOCTOU race and Use-After-Free in sideband registration
> --
> 
> commit 7085c7c59881c747b14aeec07262203621aaa8b5
> Author: Mathias Nyman <mathias.nyman@linux.intel.com>
> xhci: Prevent invalid vdev dereference during sideband unregister
> 
> This commit prevents the reallocation of the xhci virtual device in the setup
> device error path if a sideband is registered. It aims to fix a kernel oops
> caused by dereferencing a stale vdev pointer during USB audio disconnect.
> 
> Closes: https://lore.kernel.org/linux-usb/TYUPR06MB6217000B59003EDF233D7246D2B22@TYUPR06MB6217.apcprd06.prod.outlook.com/
> 
>> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
>> --- a/drivers/usb/host/xhci.c
>> +++ b/drivers/usb/host/xhci.c
>> @@ -4435,10 +4435,13 @@ static int xhci_setup_device(struct usb_hcd *hcd, struct usb_device *udev,
>>   		dev_warn(&udev->dev, "Device not responding to setup %s.\n", act);
>>   
>>   		mutex_unlock(&xhci->mutex);
>> -		ret = xhci_disable_and_free_slot(xhci, udev->slot_id);
>> -		if (!ret) {
>> -			if (xhci_alloc_dev(hcd, udev) == 1)
>> -				xhci_setup_addressable_virt_dev(xhci, udev);
>> +
>> +		if (!virt_dev->sideband) {
>> +			ret = xhci_disable_and_free_slot(xhci, udev->slot_id);
> 
> [Severity: High]
> Can this lockless check introduce a Time-Of-Check to Time-Of-Use (TOCTOU)
> race condition leading to a use-after-free?
> 
> If an asynchronous caller like snd_usb_rediscover_devices() calls
> xhci_sideband_register() concurrently, it acquires xhci->lock, reads
> xhci->devs[slot_id], and attaches the sideband.
> 
> If this lockless check evaluates to true just before the sideband is
> attached, we proceed to xhci_disable_and_free_slot() without the lock:
> 
> xhci_setup_device()
>      if (!virt_dev->sideband) {
>          xhci_disable_and_free_slot()
>              xhci_free_virt_device()
>                  xhci->devs[slot_id] = NULL;
>                  kfree(dev);
> 
> Because xhci_free_virt_device() does not hold xhci->lock, it can free the
> device immediately after xhci_sideband_register() attaches the sideband,
> leaving the sideband with a dangling pointer to a freed vdev.

Not an issue, or extremely unlikely.

This xhci_setup_device() codepath is called during usb device (re-)enumeration.
In this case problematic case is after a failed usb port resume calling reset-resume.

This means that the suspended audio class interface driver would have to register
audio sideband before the audio class interface itself resumed, and do this
while the parent port is mid resume.

Mathias
