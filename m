Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9467BA45
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 00:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786061239; cv=none; b=DH/3xePijS+XkjQYq/d/8yK9V40NgddvAZYPy6K9Z2iOKvhmNG5yDqU/ndZeLwY107WGXY9S5k3cM6bekz/T8qosiZLKM+FGfTY/751LIQJ7EN+DY1NU2t9CUs+E7FOvRYW+ikD++04mVZoktZ1bQ4lfYyhYwF7Ja3aYC9qG0/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786061239; c=relaxed/simple;
	bh=S4RS79zxa0UBYu656T6yzEGqpFMvj3usz02vsk58z7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tZ+nqu06ILd5SzLyUVyzeHJsuDtr0DhylqaO3/WbmV/yjG8YuQTfcTbpBVO6l07d/Ytcbd68LCMp9r++6hPJ14axX3+Wzlv6V1vyC8gKd/ImG9eL4DHm1dqpuEdQmFEz8Gcp9YjVHJ5i1+K3o5RJMtdFsLrqpgGj8OXWrxFeMVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YcIckjjz; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YcIckjjz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786061236; x=1817597236;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=S4RS79zxa0UBYu656T6yzEGqpFMvj3usz02vsk58z7k=;
  b=YcIckjjzfqiGIQ58XQk9NbIzZZ0INUB2hqJdS12xXmoosi5jQVG9rrRr
   bqgrG9EN+emAgnvP3Fp7mMLF5Jc4o7TBE/AP6n1918K2Rq90exlkfTs7G
   pZnvzSfko+ukqP9WZZjTXkFy66nPy22qj41SOGQ/PLazaoH0A3Q2sCh+y
   eY/Ael1nf8EYfgbBAL+FoURBBykEDOKJZVpfjNSqeQgppZvqnMF47Le/I
   mz5j0jYBee29edqUFvik5bhnZ2ldBCM6/UVpG3x9v8xdYtVeICFeArfrU
   SQNPoD1Isa5dad8clwPHpNAI199aaAxfSOUkeXNBaVsWsPf0U+tqbI2zh
   A==;
X-CSE-ConnectionGUID: CEZycT7kRNuBotQrVpAkuA==
X-CSE-MsgGUID: FKMuth03Q9OMtq17DdgRRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="97318822"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="97318822"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 17:07:14 -0700
X-CSE-ConnectionGUID: 1SqH3BFNTUm48QeiJxKbzw==
X-CSE-MsgGUID: s0bjnOLkS/qwaefkXDXyvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="257938250"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.245.88]) ([10.245.245.88])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 17:07:12 -0700
Message-ID: <e3c66325-0291-40f9-a87e-1bb337ce4427@linux.intel.com>
Date: Fri, 7 Aug 2026 03:07:08 +0300
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
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260807000155.2960c741.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/7/26 01:01, Michal Pecio wrote:
> On Thu, 6 Aug 2026 16:25:15 +0300, Mathias Nyman wrote:
>> On 8/6/26 11:17, Michal Pecio wrote:
>>> Besides initialization, it's made -1 if and only if xHCI endpoint
>>> state isn't Running at the time of submission. This effectively
>>> means that to start a new "isoch data flow" aka "stream", class
>>> driver must unlink the last remaining URB of the previous flow. If
>>> the driver doesn't unlink (or tries too late), the endpoint goes
>>> Running-Idle.
>>
>> If class driver doesn't unlink remaining urbs then list won't be empty
>> and you have the exact same situation.
> 
> Obviously not, it can simply stop resubmitting and wait. Or there may
> be no URBs left to unlink at all, when recovering from ring underrun.
> 
> Then HW endpoint state will still be Running, not Stopped, and new
> URBs will be scheduled into the past, doomed to complete with -EXDEV.
> 

Isn't this exactly what we want?

Lets take the underrun case. Audio playback as an relatable example.

If class driver fails to queue more URBs in time mid audio stream then
the ring will trigger underrun. td_list will be empty but hardware
ep ctx will still show the more correct "running" state.

A list empty check would incorrectly assume a new stream started when
the next late URB is queued. It will be given a new future frame_id,
so instead of dropping the data we will delay playback mid stream.
Not the intention with isoc transfers.

With the hardware ep ctx check we will set the frame_id of the late URB to
point to the past, to the real time it was supposed to be played back.
xHC hardware will then trigger a 'missed service event' for that TD as it
was incapable of playing it at the correct time, and then fast forward with MSE
until it finds a TD with a frame_id it can play, and play at the correct timeslot.
Here we lost the late data but playback stays in sync, as isoc transfer are
intended to work.


>>> Moreover, we know that Endpoint Context state is one of the least
>>> trustworthy piecese of information, and notably it may remain
>>> Stopped for a while after a doorbell ring. This means that multiple
>>> URBs may be scheduled as new "streams" and get assigned the same
>>> start_frame.
>>
>> Ok, we basically have different opinion on how to identify when a new
>> isoc data flow starts. You would rely on checking if list is empty,
>> and I'm looking at harware endpoint state.
> 
> I would rely on SW state, sure.
> 
> 1. The check implemented here isn't even right - see above.
> 2. Bogosity of xHCI HW is well known - see below.
> 3. For consistency with other HCDs, which use similar SW state.
> 
>> I don't trust the 'empty list check' as I'm not convinced there can't
>> be cases in software where list is empty even mid isoc data flow.
>> Something like extreme long interval and BH delay in class driver
>> receiving URB.
> 
> Other HCDs implement a rule that resubmission from completion callback
> on the same endpoint always counts as continuation of the stream, to
> work around BH. This seems to have worked so far and is trivial to do,
> somebody submitted a patch earlier this year.
> 
>> We can add empty list check as well in some places.
>> For example xhci_isoc_tx_prepare() could benefit from having both
>> empty list and hw endpoint state check when setting next_uframe = -1;
> 
> The HW state check is bogus. Before removing it I patched to log when
> URBs are pending but HW state is still Stopped. It happens sometimes.
> 
> The only robust solution is to completely disregard EP Context state.
> xHCI 4.8.3 doesn't promise much and outright advises SW to track actual
> HW state itself, based on issued commands etc.
> 

Disagree, see underrun example above.

But we can add an empty list check in addition to checking hw ep ctx state.
This should cover both empty list mid stream cases, and slow ep ctx
state change by HW.

That's a one line change during during 7.3 rc cycle

> The Stopped => Running transition is only guaranteed to become visible
> to SW when the first service interval passes and an event is posted.
> 
>> This patch is tested, solves an existing issue, and moves the
>> frame_id code in the right direction.
> 
> To be fair, it may be that in practice it fixes more than it breaks,
> but it also strays away from documented USB subsystem rules and looks
> half-baked, so I was surprised to see it queued in such state.

It's been a year, nobody else cooked anything, it improves current situation.
And honestly, it's not that bad.
Real disagreement is one line regarding how we check if we are mid stream.

Thanks
Mathias

