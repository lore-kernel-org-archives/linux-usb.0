Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D6033A9E9
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 13:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786022726; cv=none; b=Vf3qdS1QYP4d/S8Xhwr3+Q1WxBbk3j1gKN5wUXxsLh8GbkXPQGHf3c+ZMUVcUqrq0/sR7+YsCi9gojE/l6pVs7uGP9iDcnXOaVNNSYOuz/wNuMZgeaX2E9B6Ncvu7E+UDfokRrpnu9x72AFuQNdlKQOcPb/CQqBRVdO7NrjVeU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786022726; c=relaxed/simple;
	bh=ZBakgMkUTjQmL1N8pbPwkWoJjWo1MLK+KbrvwCMIq58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b1jmHLHk+1l5A6RyJDOOMO6aZvcPTtZFNJJEkb/WAU6mjrbB/xkvRZ8TuB7GGSlOrBOy8RDPrQLixTeXf5357ab68dGqGprugsJAOo+7AwuueW0nHyzpnCYGLC8QCk6IEGLV1c+VqXirOaljssCqbM5a7DG+e2kAj0b11emOsXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D+wdtx4V; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D+wdtx4V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786022722; x=1817558722;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ZBakgMkUTjQmL1N8pbPwkWoJjWo1MLK+KbrvwCMIq58=;
  b=D+wdtx4VoxCJM0x+7sIjoLK2JLT2ETZ2gDIlyV2oYgc6kuV5bF4D58Yt
   WlejZpBul1JbYukIbZRJqdHX34Cn7tvc5ClYnKgTr53pESByHQnFiIRFU
   kcGFHJizXxDx4zEzERpYRzwX8G++uYbzmPaOvZH6RKkaXR7kJ/IveGLPI
   7x7utktjXfwnUkxASLH9Ha5rNe3VnHE4iWxZeDPA9FXhlH1piseiWBHf1
   9QNIxOJjOU8SWB7Vf2aUMZozQjGShk7677BowV4WSujZT1mDa73Ua5gnh
   VbYmYlMjnhQmNEnNjTG1TAi5ZnNrwgY3PfjdUWIRCobq1L5ELq+Y+lXPD
   w==;
X-CSE-ConnectionGUID: 1utB3XdxTxSQ0KHrEZFNWA==
X-CSE-MsgGUID: a/OyX2AMSe+lT6H0rfOzEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="97212321"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="97212321"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 06:25:19 -0700
X-CSE-ConnectionGUID: EhhKJeqwQsWG0EeeLPSNZg==
X-CSE-MsgGUID: NClN7lRCTGid1TnALki6wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="260339903"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.244.235]) ([10.245.244.235])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 06:25:17 -0700
Message-ID: <0e2f28f5-aa38-4401-8287-b55aab577243@linux.intel.com>
Date: Thu, 6 Aug 2026 16:25:15 +0300
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
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260806101706.72a8de47.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/6/26 11:17, Michal Pecio wrote:

>> +	/* calculate valid frame window, in frame units, see xhci 4.11.2.5 */
>> +	curr_frame = MFINDEX_TO_FRAME(mfindex);
>> +	win_start = (curr_frame + DIV_ROUND_UP_POW2(ist, 8) + 1) % MAX_FRAMES;
>> +	win_end = (curr_frame + 895) % MAX_FRAMES;
>>   
>> -	start_frame &= 0x7ff;
>> -	start_frame_id = (start_frame_id >> 3) & 0x7ff;
>> -	end_frame_id = (end_frame_id >> 3) & 0x7ff;
>> +	// FIXME, used to check if !list_empty(&ep_ring->td_list)), is that reliable
> 
> This doesn't look very professional :)
> 
> (Surprised to find that checkpatch doesn't warn about C++ comments...)
> 

I'll remove that comment,  but didn't it help highlight the !list_empty
case for you :)

> But most importantly, as Alan explained, list_empty() was indeed the
> specific check which should be performed.
> 
> * If there are pending URBs on the endpoint, a new non-ASAP URB is
>    scheduled contiguously after the last one.
> * If there are no pending URBs, new non-ASAP URB is scheduled ASAP.
> 
> (The exact meaning of "pending" is a little tricky in presence of BH
> giveback, but that's another issue and it also affects ehci-hcd).
> 
>>   
>> -	if (start_frame_id < end_frame_id) {
>> -		if (start_frame > end_frame_id ||
>> -				start_frame < start_frame_id)
>> -			ret = -EINVAL;
>> -	} else if (start_frame_id > end_frame_id) {
>> -		if ((start_frame > end_frame_id &&
>> -				start_frame < start_frame_id))
>> -			ret = -EINVAL;
>> +	/* Is this the first URB starting the whole isoc transfer */
> 
> Nitpick: xHCI calls this "isoch data flow" and ehci-hcd "stream".
> 
> Isn't "isoc transfer", per USB spec, things that happens during one
> interval? But not 100% sure about it and too lazy to check now...
> 
>> +	if (ep->next_uframe < 0) {
> 
> And where is ep->next_uframe coming from?

First set in xhci_queue_isoc_tx_prepare(), and then set after every URB
enque in xhci_queue_isoc_tx()

> 
> Besides initialization, it's made -1 if and only if xHCI endpoint
> state isn't Running at the time of submission. This effectively means
> that to start a new "isoch data flow" aka "stream", class driver must
> unlink the last remaining URB of the previous flow. If the driver
> doesn't unlink (or tries too late), the endpoint goes Running-Idle.

If class driver doesn't unlink remaining urbs then list won't be empty
and you have the exact same situation.

Checking if list is empty doesn't help here.

> 
> So you have removed the wrong condition here. It should be empty list,
> not xHCI endpoint state, which drivers don't care or even know about.

> 
> Moreover, we know that Endpoint Context state is one of the least
> trustworthy piecese of information, and notably it may remain Stopped
> for a while after a doorbell ring. This means that multiple URBs may
> be scheduled as new "streams" and get assigned the same start_frame.
> 

Ok, we basically have different opinion on how to identify when a new
isoc data flow starts. You would rely on checking if list is empty, and
I'm looking at harware endpoint state.

I don't trust the 'empty list check' as I'm not convinced there can't be
cases in software where list is empty even mid isoc data flow. Something
like extreme long interval and BH delay in class driver receiving URB.

We can add empty list check as well in some places.
For example xhci_isoc_tx_prepare() could benefit from having both empty list
and hw endpoint state check when setting next_uframe = -1;

But we are late in the rc cycle and merge window opens soon, so I'm going
to submit this anyway to get things forward.

This patch is tested, solves an existing issue, and moves the frame_id code
in the right direction.

Any issues we discover later can be fixed when discovered.
We can't keep finetuning this forever to cover potential issues by broken
hardware

Thanks
Mathias

