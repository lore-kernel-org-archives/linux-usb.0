Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC45836A352;
	Mon, 24 Aug 2026 15:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584893; cv=none; b=QB25pofiPlIP6WY0GJvisW6ebHTvMRBAMgQ5UEz2dXkHNHvm12aJYk0mrVBMvj7hdONn+2E5hIp2Xu1/aa324LNkFKByAgHwaUZs+5JbgMeJ0y37T4BbXCparahPpLZM2Jh7LhpVJu65OkDcjtqTVjG6TmnwwGIozpp9DLbYZBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584893; c=relaxed/simple;
	bh=feTEMZNd0n25YUYoGeIyA1qZoA9W8Kp7zp+W6RwxA0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MrJvFekDv4SiPiVC0x2dsMv+AYaSdxK4kJKmGATmCeUID8fjHD8E5+N3/32NjmYsH3tAO6JBuT8Tvku7OurWRT71QB2pFzsBQ1CZgUwtTSBRTJP1XayAQsMjbRaYpZS0tVC/aLOszyJV99YCq5NTjp5QW5Qkm+uCtFP2F9dY7oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VZOtm6oi; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VZOtm6oi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787584891; x=1819120891;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=feTEMZNd0n25YUYoGeIyA1qZoA9W8Kp7zp+W6RwxA0Y=;
  b=VZOtm6oifDv167tFVzToAr1IMZdnUS6L2+f6zL52UdYfRm+INs9dqkNj
   SLjWhcl++9THnqIvXkF79+6Yv8KY+D8x2q40/OW/j0PvYSkwprYFBVO8y
   EDG3pZOHvh7k62QuvhkfESbzNkClr064jqVOGMQLlb/gv6H3y5JsCs9qu
   dC3UxptjmBVIkZf5ZwQkPGIgVosYn6c8n0CmKxqNmWy3YovLwiOMMkeCM
   LJWTTROiEWNGB6QScfjxztTm1KHgfhLsU8uTu2rwtRveu8F0BULAdbnlh
   3uOnU8ue/K9BXFw4TzjZB7LelPsyPZwjcnYdhmx46QfGWVhDnFUlj0pLQ
   w==;
X-CSE-ConnectionGUID: IPrZUTbKRjOuM6RQ01qtzw==
X-CSE-MsgGUID: EX37TEZjTjCUqi4TbQcNpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="87898342"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="87898342"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 08:21:30 -0700
X-CSE-ConnectionGUID: c3Z+WVgcS1KuPUWbNJSAEQ==
X-CSE-MsgGUID: jcAkpnPiTlmGGZs8Ohvwhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="260872564"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.244.153]) ([10.245.244.153])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 08:21:28 -0700
Message-ID: <5aa2f501-6980-44c8-b7fd-77f6b3b98bd5@linux.intel.com>
Date: Mon, 24 Aug 2026 18:21:22 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: Fix isochronous scheduling regression
To: Alan Stern <stern@rowland.harvard.edu>,
 Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260821114706.34b095b1.michal.pecio@gmail.com>
 <327f6412-5d07-4bee-a51c-06f1ce5823e6@rowland.harvard.edu>
 <20260821180350.3648f011.michal.pecio@gmail.com>
 <de41d8f4-e8d2-47d6-8be2-f191b28aecd9@rowland.harvard.edu>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <de41d8f4-e8d2-47d6-8be2-f191b28aecd9@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/22/26 05:38, Alan Stern wrote:
> On Fri, Aug 21, 2026 at 06:03:50PM +0200, Michal Pecio wrote:
>> On Fri, 21 Aug 2026 10:44:07 -0400, Alan Stern wrote:
>>> Maybe it's time to correct the hcd_periodic_completion_in_progress()
>>> implementation.
>>>
>>> For instance, we could add an atomic giveback_count field to the
>>> usb_host_endpoint struct.  The HCD would increment the field (while
>>> still holding its private lock) before doing a giveback, and
>>> __usb_hcd_giveback_urb() would decrement the field after calling the
>>> completion handler.
>>>
>>> What do you think?
>>
>> I would go as far as incrementing it on successful usb_submit_urb() and
>> completely doing away with those list_empty(td_list) checks in HCDs.

This sounds like a good idea.

Regarding theoretical race conditions:  If URBs for some odd and unknown
reason are submitted by several callers to the same endpoint (no idea why
or how this would happen) then, usb_hcd_submit_urb() could theoretically call
hcd->driver->urb_enqueue(hcd) for the second URB right when .urb_enqueue(hcd)
returned for the first URB, but _before_ increasing the atomic counter.

In this case hcd would incorrectly assume both first and second URB start a
new isoc stream. This would be avoided by hcd still checking list_empty(td_list)

Anyway, suggested solution still sounds like an improvement compared to what
we currently have.

>>
>> I wrote an xhci-only (less compilation and module reloading) prototype
>> which relies on hijacking completions of isoc URBs for counting, it
>> worked, results identical as with the standard solution in a few test
>> runs with snd-usb-audio.
>>
>> Theoretical race condition: it seems we can't prevent new submissions
>> after completion releases its lock and class driver considers the pipe
>> idle, but before the counter is decremented to zero. That would be
>> another case of "scheduling to the past" unexpectedly.
>>
>> Seems low probability, but this type of bug hasn't existed so far, we
>> generally have the opposite problem.
>>
>> Or does it exist in non-BH HCDs?
> 
> It does.  It's impossible for a non-BH HCD to reacquire its private lock
> exactly when the completion handler returns, so somewhere around that
> time the class driver and the HCD will inevitably have differing
> opinions about whether the iso queue is empty.
> 
>> Maybe the documented API guarantee just isn't feasible?
> 
> I'm not averse to your proposed solution.  As for that race, just update
> the API documentation to take it into account.  Seriously -- it's an
> unavoidable defect and that's all we can do about it.
> 
> Possible alternative: Make the URB_ISO_ASAP flag take precedence over
> the "queue is non-empty" condition.

xhci driver does this. If URB_ISO_ASAP is set then xhci driver always sets
the SIA "Start Isoch ASAP" flag for the transfer blocks.

The urb->start_frame value set by xhci driver might not be correct in this
case.
Thanks
Mathias
