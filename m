Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A986517A305
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 11:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791544626; cv=none; b=nqeKeKU+ZAZ/JsQ+vaQOMQOlbcN86nTXy5VyItu3LW8z2PTNR0J5HSc/xdQ5et0GOXR8rLYmuutsrd9WXO+IWXgV/gKtjCfzv0JoUqu0JdxW7v1L+r2inexIxAlDKxnFcW7gQOq7Fqi150Cl/iKWQE/XGdVIwpne18wjDeRgXu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791544626; c=relaxed/simple;
	bh=rKnEt/5t7axs0dNmAQU+XhBPGxTjZv1QWxgnjF4wNbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DNxQu9pCnlxG0HTdj3dFWZ8+AV52u401x6Iunz+lvrJwVhQyRcz+yTuw3FqEpK01uqexS0XN9Fv14D5JX34drDdqCoGh690iuu1Zf18FUxrdo2yCrWPYFfg25OHetprqGzzrw3oDPdFWZyd6WtcOXgsXVRcSGb6JP9KFI03ualk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aC7uU3J5; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aC7uU3J5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791544610; x=1823080610;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=rKnEt/5t7axs0dNmAQU+XhBPGxTjZv1QWxgnjF4wNbM=;
  b=aC7uU3J5jBeBUP+bZpDQZkwHSgTWDta2JHiESauzTYNSXqw5Tl3s7B/P
   jLpqPah0eGVnfZhm8b5BPFUwEjWtfU0Q+rjxXADvsaAJccyWhaRdh64yO
   6/9M79RL9w6Zyzoanx3WFADY+1gQisgowv278JJDcrAak36SrZrGOLyca
   8eyHVThBNwX6mAPKwD4/x+FoIGsRRcKBYc4iUiVpNzygb6ARn8Gq2mVoe
   8409BM+8jRrzxcpZVkwphiCEaIJuqWGnlt3u1z5KLUsOAepj9Yl7rTbkt
   1qSMWTr/QQgNJxR0pHnQk/CzWbI4AOnMN8KuNZBtfG/XeXUm73aGhktXR
   g==;
X-CSE-ConnectionGUID: 9QkRBVG4Sa2dW5qrSuPIJw==
X-CSE-MsgGUID: e9M3kenVTHmG1xbnBbhZbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="357617"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="357617"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 04:16:49 -0700
X-CSE-ConnectionGUID: rIiJA5pFR3SQiQwTQiXu7A==
X-CSE-MsgGUID: N1ROrs+wSAGXzDi4Ab/Pgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="230949"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO [10.245.244.17]) ([10.245.244.17])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 04:16:47 -0700
Message-ID: <85fc10ab-d718-4a94-bf46-fb60ac2dfbbe@linux.intel.com>
Date: Fri, 9 Oct 2026 14:16:44 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/14] xhci: dbc: lock the minor IDR on registration
 failure
To: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Sang-Hoon Choi <csh0052@gmail.com>, Changyul Lee <lcy8047@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>
References: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
 <20261009095834.561578-7-mathias.nyman@linux.intel.com>
 <sashiko-outbox-165207@kernel.org> <2026100949-scuttle-cradling-0371@gregkh>
 <2026100958-simple-evasion-4048@gregkh>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <2026100958-simple-evasion-4048@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/26 13:52, Greg KH wrote:
> Resending with the proper people in cc...
> 
> On Fri, Oct 09, 2026 at 12:51:41PM +0200, Greg KH wrote:
>> On Fri, Oct 09, 2026 at 10:13:10AM +0000, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>>> - [High] usb: xhci: dbc: UAF due to premature IDR exposure and missing TTY hangup on error path
>>> --
>>>
>>> commit 99c18a1b8449e8389ccac896ceadcc979dbd6a57
>>> Author: Sang-Hoon Choi <csh0052@gmail.com>
>>>
>>> xhci: dbc: lock the minor IDR on registration failure
>>>
>>> This commit fixes a race condition during DbC TTY registration failure
>>> by adding mutex protection around the removal of the minor IDR entry.
>>>
>>>> diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
>>>> index 3d51e8d82659d..2249cc16800cc 100644
>>>> --- a/drivers/usb/host/xhci-dbgtty.c
>>>> +++ b/drivers/usb/host/xhci-dbgtty.c
>>>> @@ -535,7 +535,9 @@ static int xhci_dbc_tty_register_device(struct xhci_dbc *dbc)
>>>>   err_free_fifo:
>>>>   	kfifo_free(&port->port.xmit_fifo);
>>>>   err_exit_port:
>>>> +	mutex_lock(&dbc_tty_minors_lock);
>>>>   	idr_remove(&dbc_tty_minors, port->minor);
>>>> +	mutex_unlock(&dbc_tty_minors_lock);
>>>>   err_idr:
>>>>   	xhci_dbc_tty_exit_port(port);
>>>
>>> [Severity: High]
>>> Does this error path leave concurrent TTY sessions pointing to freed memory?
>>>
>>> Earlier in xhci_dbc_tty_register_device(), the port is added to the globally
>>> visible dbc_tty_minors IDR before internal structures are fully allocated:
>>>
>>> 	mutex_lock(&dbc_tty_minors_lock);
>>> 	port->minor = idr_alloc(&dbc_tty_minors, port, 0, 64, GFP_KERNEL);
>>> 	mutex_unlock(&dbc_tty_minors_lock);
>>>
>>> A concurrent open() on the device node routes to dbc_tty_install(), which
>>> retrieves the port and installs the TTY without verifying port->registered:
>>
>> I don't think we need to worry about "concurrent open()" for this as
>> that's not a real use case that I know of and this _should_ be root only
>> accessable, right?
>>
>> Or can normal users open this device node?
>>
No risk of concurrent open as the tty device node is not yet created in this error
path.

This error path is taken if tty_port_register_device() fails, of some other failure
before it

-Mathias
