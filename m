Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03614388885
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 09:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365341; cv=none; b=H928SHyPoGPwSu+JUInjhgR1p9E89ujPbZcQFrQOLdukzW4aQr4Obt4TtlU1cks0OBGJnJ82QpvK82ZvTaglknkGh690U73Vveb+iqcZioVF5g8TXLKnqip4IfQAUA+Duh/uzr7/SMSSixYY0PhrffJZZL632jMXavuXIUUHrnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365341; c=relaxed/simple;
	bh=Cyhd8R/qzhAM0ja6F/U9hHo2j7T1FYIkGddsfzrSOGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S2tz/a9DBXUjZbbkAqfQryAyCRYCVTHUTXUm1T9DCBGfp5rqKTDT9kS5hUzwpyLMI9402sQ1e2At2nDdJRCplETA8TisI+f3xSU+Q6mg1TkWIhcuwpmoLCv1WKX8tfYfiN3Llx07xU2l/T2dPopXwypwMN83ZHl+sLwWDeA8b7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dj0t3Na2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dj0t3Na2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791365325; x=1822901325;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Cyhd8R/qzhAM0ja6F/U9hHo2j7T1FYIkGddsfzrSOGg=;
  b=dj0t3Na2OUijIQOrPlZBKaH/AqDyWr4mOfudkLusuFBAv6iIRWnwT+6d
   RUazd0UMCvO3VXzfCEFYAXpiq1ofG4GMOelBdXDQWzCPoZ6MqF90tJFGZ
   pH+tIKJ17jmqUuxM5FbS/wQwwu+MMPQKak4g/ay79j5P4ctxR0vUhPw0Z
   tUFJlPpu28uAnvHS/k1g6n0M4NhjE34HAxm6TeTeG7HtAZ+PtXwzpr1iK
   O0wApt9qTUjHBODxtcnaO88hEATcJQyAOVqNAowqes6O2oGidLiAtbl9R
   p/6/cxZN1OWZ4qDANXd868lO3tz+gxakHku2U2w4ElmsNX4TknzA0jBeY
   A==;
X-CSE-ConnectionGUID: Po/pyZRWQc+jGOTSDoujGQ==
X-CSE-MsgGUID: 41iE4jxBTXKIv/FG2LJTiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="121209"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="121209"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 02:28:44 -0700
X-CSE-ConnectionGUID: DWEDqjbMRz2qlhP4c8Nf0A==
X-CSE-MsgGUID: +ETgHZjxSKiy+wowz48eig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="282205917"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.246.22.148]) ([10.246.22.148])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 02:28:42 -0700
Message-ID: <36ec399c-46ad-46db-aeaa-c12354261dc1@linux.intel.com>
Date: Wed, 7 Oct 2026 12:28:34 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] usb: xhci: correct num_active_eps accounting on
 allocation failure
To: Michal Pecio <michal.pecio@gmail.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
References: <20261006152427.3735383-1-niklas.neronin@linux.intel.com>
 <20261006152427.3735383-3-niklas.neronin@linux.intel.com>
 <20261006183301.7a1875c3.michal.pecio@gmail.com>
 <20261006230207.0faaac31.michal.pecio@gmail.com>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <20261006230207.0faaac31.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 07/10/2026 0.02, Michal Pecio wrote:
> On Tue, 6 Oct 2026 18:33:01 +0200, Michal Pecio wrote:
>> On Tue,  6 Oct 2026 17:24:24 +0200, Niklas Neronin wrote:
>>> Some host controllers have a global endpoint limit across all slots,
>>> tracked by 'xhci->num_active_eps' when XHCI_EP_LIMIT_QUIRK is set.
>>>
>>> During device allocation, EP0 resources are reserved before
>>> xhci_alloc_virt_device() is called, and 'num_active_eps' is
>>> incremented accordingly. If xhci_alloc_virt_device() subsequently
>>> fails, the slot is disabled but the reserved endpoint resource is
>>> not released, leaving 'num_active_eps' permanently increased.
>>>
>>> Decreasing 'num_active_eps' happens in
>>> xhci_handle_cmd_disable_slot(), which is called upon a Disable Slot
>>> completion command.  
>>
>> Why is 'num_active_eps' not decremented if the slot is disabled and
>> Disable Slot completion handler is supposed to decrement it?
>>
>> Does this bug really exist? Can you reproduce it by forcing the quirk
>> with module parameter and simulating vdev allocation failure here?
> 
> Never mind, the bug is real and reproducible. Still, commit message
> could include a few words of explanation to prevent such questions.
> 
> I think it would be cleaner to fix this by allocating vdev before
> ep0 reservation, because allocation is easier to undo:

That's a good point. I found this while working on a separate series
that splits 'vdev' allocation and slot enabling. That series was not
ready for this merge window, so I decided to submit only the simpler
fixes first to keep the future series smaller and less cluttered.
As you suggested, that series moves 'vdev' allocation before EP
reservation.

> 
> 1. we have a helper for this, no need to dig in xhci members manually
> 2. we are the only user of this slot_id, so locking is not required
> 
> Downside: larger diff. But less code in the end.
> 
> And there is another bug: disable_slot uses udev->slot_id, which is
> uninitialized in this path. Should use the local slot_id variable.

Good catch. I found the same issue but apparently forgot to include the
fix in this patch set.

Probably best if this patch is not added to this merge window,
instead I'll re-submit it with all the virtual device changes.

Thanks,
Niklas

> 
> So overall,
> 
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index e5b39be04b92..9beb8b4b485f 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -4308,27 +4308,29 @@ int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev)
>  
>  	xhci_free_command(xhci, command);
>  
> +	/* Use GFP_NOIO, since this function can be called from
> +	 * xhci_discover_or_reset_device(), which may be called as part of
> +	 * mass storage driver error handling.
> +	 */
> +	if (!xhci_alloc_virt_device(xhci, slot_id, udev, GFP_NOIO)) {
> +		xhci_warn(xhci, "Could not allocate xHCI USB device data structures\n");
> +		goto disable_slot;
> +	}
> +	vdev = xhci->devs[slot_id];
> +
>  	if ((xhci->quirks & XHCI_EP_LIMIT_QUIRK)) {
>  		spin_lock_irqsave(&xhci->lock, flags);
>  		ret = xhci_reserve_host_control_ep_resources(xhci);
> +		spin_unlock_irqrestore(&xhci->lock, flags);
>  		if (ret) {
> -			spin_unlock_irqrestore(&xhci->lock, flags);
>  			xhci_warn(xhci, "Not enough host resources, "
>  					"active endpoint contexts = %u\n",
>  					xhci->num_active_eps);
> +			xhci_free_virt_device(xhci, vdev, slot_id);
> +			/* without vdev disable slot won't free ep0 resources */
>  			goto disable_slot;
>  		}
> -		spin_unlock_irqrestore(&xhci->lock, flags);
>  	}
> -	/* Use GFP_NOIO, since this function can be called from
> -	 * xhci_discover_or_reset_device(), which may be called as part of
> -	 * mass storage driver error handling.
> -	 */
> -	if (!xhci_alloc_virt_device(xhci, slot_id, udev, GFP_NOIO)) {
> -		xhci_warn(xhci, "Could not allocate xHCI USB device data structures\n");
> -		goto disable_slot;
> -	}
> -	vdev = xhci->devs[slot_id];
>  	slot_ctx = xhci_get_slot_ctx(xhci, vdev->out_ctx);
>  	trace_xhci_alloc_dev(slot_ctx);
>  
> @@ -4348,7 +4350,7 @@ int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev)
>  	return 1;
>  
>  disable_slot:
> -	xhci_disable_and_free_slot(xhci, udev->slot_id);
> +	xhci_disable_slot(xhci, slot_id);
>  
>  	return 0;
>  }

