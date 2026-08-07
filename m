Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C042542F70E
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 11:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786101042; cv=none; b=UCfK8HXL7fVB/EArq5fTwmCMWa79pnxEqPhQj3R/5z4zo5UVamXzXZDLPTb7njtTjDQ9MykSsDPpkX/ASgak//b6URGMRFC6ZRHLydJOebBsANhfEkPfRhI/OaCKk0DKKa3OVVIy8/1HF4u2EAChUMBwzAAW3bfkygQqdBsYSug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786101042; c=relaxed/simple;
	bh=h6NBU84xhTihWY/u5TxxJ2qcxOUUxbNMTSMqOkWPupc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OT8wPs+lkLBU3vaTzVR7wtOlaeMxuzyPIZLqUFkXgMTY3y4um2uuxJRrQ/wgn4h7hVtlO/KzqpMkK+qNsvVOadMjNDJofqAVhYjZO12bCRnlUGSeXieah/flLnUfiW9PYOxYJ88fWnrY8bp/64Eg04z5Juf7xp60nAsowJyCPqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K56/K/xg; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K56/K/xg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786101040; x=1817637040;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=h6NBU84xhTihWY/u5TxxJ2qcxOUUxbNMTSMqOkWPupc=;
  b=K56/K/xgyIYBYXlZc6/GRJ3xw0b+Zu2Bc7QGb5iAIr6Oivpx/mAnf+eY
   QUIx96U3ig/xJUsC1UPNByTMAyVQriTsL2N2Njzzlce5d+wfQmkqo7VhE
   Zy7o4uPZ9adczhrc9L1QCW40ncwX9u/5K+LQq3fAZ4sdr52+qmFiC0dpd
   EpqahcWFhZ9K0YmEBQpIkSWo+lLp4bgWTbzw8l3R+Euf1Kr71fHTqLLzx
   HiLMwATjRxlGlDYDrgYzyP5NQp46b53+XuvdrPr3ChfFMURTXpKKx0FhV
   VnKhrR0iUvGiONSRPJqpDi4LbH0cWMxw8aI7iJo9Fz2syfXxuj9/BcOI3
   g==;
X-CSE-ConnectionGUID: 9rDon+8xSsmCXdSGHAduQg==
X-CSE-MsgGUID: 9UORO4csSTmtPv5leLbfvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="97301868"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="97301868"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 04:10:40 -0700
X-CSE-ConnectionGUID: d8VSj8PeQwyXnc8eYSdvvQ==
X-CSE-MsgGUID: ddAmB+wxTXmIJFSO6gZ9/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="266614526"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.245.88]) ([10.245.245.88])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 04:10:38 -0700
Message-ID: <310ccfe5-0212-4c8b-9213-891a7340e2f4@linux.intel.com>
Date: Fri, 7 Aug 2026 14:10:35 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCHv3 1/3] xhci: fix frame id calculation and checks for
 isoc URBs
To: Michal Pecio <michal.pecio@gmail.com>
Cc: dylan_robinson@motu.com, linux-usb@vger.kernel.org,
 mathias.nyman@intel.com, stern@rowland.harvard.edu
References: <a67e11d4-6c80-4043-9f60-ae42a15ed0d3@linux.intel.com>
 <20260521152715.288995-1-mathias.nyman@linux.intel.com>
 <20260806101706.72a8de47.michal.pecio@gmail.com>
 <0e2f28f5-aa38-4401-8287-b55aab577243@linux.intel.com>
 <20260807000155.2960c741.michal.pecio@gmail.com>
 <e3c66325-0291-40f9-a87e-1bb337ce4427@linux.intel.com>
 <20260807102604.5f649db2.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260807102604.5f649db2.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/7/26 11:26, Michal Pecio wrote:
> On Fri, 7 Aug 2026 03:07:08 +0300, Mathias Nyman wrote:
>> On 8/7/26 01:01, Michal Pecio wrote:
>>> On Thu, 6 Aug 2026 16:25:15 +0300, Mathias Nyman wrote:
>>>> On 8/6/26 11:17, Michal Pecio wrote:
>>>>> Besides initialization, it's made -1 if and only if xHCI endpoint
>>>>> state isn't Running at the time of submission. This effectively
>>>>> means that to start a new "isoch data flow" aka "stream", class
>>>>> driver must unlink the last remaining URB of the previous flow. If
>>>>> the driver doesn't unlink (or tries too late), the endpoint goes
>>>>> Running-Idle.
>>>>
>>>> If class driver doesn't unlink remaining urbs then list won't be
>>>> empty and you have the exact same situation.
>>>
>>> Obviously not, it can simply stop resubmitting and wait. Or there
>>> may be no URBs left to unlink at all, when recovering from ring
>>> underrun.
>>>
>>> Then HW endpoint state will still be Running, not Stopped, and new
>>> URBs will be scheduled into the past, doomed to complete with
>>> -EXDEV.
>>
>> Isn't this exactly what we want?
> 
> This was discussed all the way back in Bugzilla - usb_submit_urb()
> kerneldoc spells out what we want and Alan was clear that it reflects
> what HCDs have been doing for 20 years:
> 

I'm doing exactly what kerneldoc and comments in bugzilla state.
If queue empties out we schedule the next TD based on URB_ISO_ASAP flag.

The logic is from Alan's bugzilla comment. I'll quote the beginning here:

"When the queue underruns is exactly when URB_ISO_ASAP is supposed to matter.
  If the flag is set in the new URB then that URB should be scheduled for the
  first slot in the future, leaving a logical gap in the queue.
  If the flag is clear then the new URB is supposed to be scheduled for the slot
  that follows the preceding URB, which means that some of its packets will
  never be sent because their slots have already expired.
  This will still leave a physical gap in the queue, of course -- no way to
  avoid that -- but it will maintain the logical alignment of URBs and frames.

  Thus by submitting all URBs with URB_ISO_ASAP clear, drivers can help ensure
  that the queue remains synchronized to within the limits imposed by the host
  controller driver.
  If xhci-hcd doesn't behave this way then it should be changed."

So I changed it to behave this way.

>   * If the driver is unable to keep up and the queue empties out, the
>   * behavior for new submissions is governed by the URB_ISO_ASAP flag.
>   * If the flag is set, or if the queue is idle, then the URB is always
>   * assigned to the first available (and not yet expired) slot in the
>   * endpoint's schedule.

> 
> "If the queue is idle" means all completions have already returned.

That's an odd interpretation of "queue is idle"

This would mean that an URB queued after "queue runs out" (underrun)
should always be treated as USB_ISO_ASAP case, making the flag useless.

Isn't it more likely that 'queue is idle' means 'not yet started' than
'class driver intentionally left it to dry out and underrun in order
to later restart it, assuming it will restart ASAP on next URB enqueue
without setting URB_ISO_ASAP flag?'

Thanks
Mathias
