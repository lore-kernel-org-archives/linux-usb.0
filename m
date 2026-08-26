Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383E83B8BB6;
	Wed, 26 Aug 2026 08:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787733270; cv=none; b=AjMiNmecLxjDxUJ+eLAkpKTggVB1luJtsj50WucKFjo7TmRleAH5VreNIea0OXWalo67Rj5QpLGMl3FefvQoxUZ/x3k7jUd28Ilgf679RugbKmBQ8ZUlkVtb0IR1NUj+DZ9I+s/xt0nwymMFj2rbSUvSFgdohnDUA+R9/c14Mkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787733270; c=relaxed/simple;
	bh=bO9TehewyF3o4tIigDKshTrqsAmycKm4cNIlDOz6Ahk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gEiFN7G12gtAabPRi4lz5Fm8lB7db6NyI6ruKBK0Tvn8iB0S4VRWBaS4Gk6FkKtBaBqJwL3Dl6Gqp1Qjg3+CW9D+u/WH5uZLqIyDSqSU1blWdZsFIILEsgRs8uR583mBVZCDkzaeZBxupFvNwAuD/wfHDolEUT+zxmciSuYduw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CnYBx0qk; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CnYBx0qk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787733268; x=1819269268;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bO9TehewyF3o4tIigDKshTrqsAmycKm4cNIlDOz6Ahk=;
  b=CnYBx0qkgol0VW/Os+p+TX52M+Mh2vARM2+iXh+hAm3qrCKPJfYXw8wJ
   Z+SvbVyUwhlOdfgRw3uCZ7NSFfxrzWiOGBUFuf3gpnPbF636Z06TxwmQl
   h6EJkPT0v0I9MDkFc7O4u6dwgjYu9VTzZHeMKrn+8JZiNuHi1qm51gSHQ
   8VM1OnnwQd6RQ7LfRyG9kbzBa9PNwKn3ZvrCSn1ojoPFQQANwANVvlTDU
   RWQFF4cEQbatFc7ii44S4A2V+onLwRO8aT0FGlkqduLmkDXyZvivJCle4
   AWq2bp2BPBgOvhTQOKyvnKP9VSaiWaFUe1duE34nZFomuz0Aq1hq80Ysv
   A==;
X-CSE-ConnectionGUID: CtuJJjtyQTaRBOoEEDF7Fw==
X-CSE-MsgGUID: jzXluF6sSaG0Wi89RhBglQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="110994105"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="110994105"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 01:34:28 -0700
X-CSE-ConnectionGUID: cOcqZKrOSXq9YLoUcg6rYQ==
X-CSE-MsgGUID: BLequEZiRV+Win3FX126YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="271306338"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.245.238]) ([10.245.245.238])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 01:34:26 -0700
Message-ID: <8f84f6a0-02fb-4ba0-8da9-63433f91a542@linux.intel.com>
Date: Wed, 26 Aug 2026 11:34:15 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: Fix isochronous scheduling regression
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Michal Pecio <michal.pecio@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260821114706.34b095b1.michal.pecio@gmail.com>
 <327f6412-5d07-4bee-a51c-06f1ce5823e6@rowland.harvard.edu>
 <20260821180350.3648f011.michal.pecio@gmail.com>
 <de41d8f4-e8d2-47d6-8be2-f191b28aecd9@rowland.harvard.edu>
 <5aa2f501-6980-44c8-b7fd-77f6b3b98bd5@linux.intel.com>
 <25b021ba-338d-496b-81c3-0dc0a8777faf@rowland.harvard.edu>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <25b021ba-338d-496b-81c3-0dc0a8777faf@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/24/26 18:51, Alan Stern wrote:
> On Mon, Aug 24, 2026 at 06:21:22PM +0300, Mathias Nyman wrote:
>> On 8/22/26 05:38, Alan Stern wrote:
>>> On Fri, Aug 21, 2026 at 06:03:50PM +0200, Michal Pecio wrote:
>>>> On Fri, 21 Aug 2026 10:44:07 -0400, Alan Stern wrote:
> 
>>> Possible alternative: Make the URB_ISO_ASAP flag take precedence over
>>> the "queue is non-empty" condition.
>>
>> xhci driver does this. If URB_ISO_ASAP is set then xhci driver always sets
>> the SIA "Start Isoch ASAP" flag for the transfer blocks.
> 
> I wasn't very precise before.  I meant URB_ISO_ASAP should take
> precedence when there are no active URBs but there may still be some
> URBs being given back.  In other words, when the list_empty test
> succeeds.  If the list of queued URBs is not empty then new URBs should
> always be assigned to the next available slot -- unless we decide to
> support a new URB_USE_FRAME flag and the flag is set.
> 

URB_ISO_ASAP always takes precedence in xHC case.

xHC controller has a "SIA" flag that we set for each TD (URB frame)
in the URB when USR_ISO_ASAP is set.
If there are no active URBs mid stream, and ring underruns, then xHC will process
the next TD with SIA flag at its earliest possible slot.
So URBs with URB_ISO_ASAP flag will be out of sync and laggy, but not lose data
in underrun cases.

A frame is only dropped in SIA case if xHC fails for internal reasons to
process that transfer in time. This triggers a Missed Service Error, and xHC
moves to process the next TD (frame).

> The point here is that if the class driver wants to change the alignment
> between URBs and uframes, without worrying about the BH giveback race,
> all it has to do is set URB_ISO_ASAP.  If it doesn't care about the
> alignment (implying that it also doesn't care if some URBs are assigned
> to expired slots) then the race doesn't matter.
> 
> And of course, if the class driver wants to maintain the alignment then
> it should resubmit URBs from the completion handler, so that the queue
> doesn't empty out unless there is an underrun.  Then the BH giveback
> race won't be an issue.
> 
>> The urb->start_frame value set by xhci driver might not be correct in this
>> case.
> 
> Do you mean it might be wrong because xhci-hcd can't tell what uframe
> the xHC hardware actually selects?

xhci driver currently guesses the urb->start_frame based on current harware frame
number + a scheduling threshold. This is small inaccuracy in the start.
Not the real issue.

After this the xhci driver start_frame is just a running number during the stream,
incremented on every queued frame. urb->start_frame mid stream is based on this.

If URB_ISO_ASAP (SIA in xhci) is set then we know that every URB enqueued after a
underrun event will be delayed by at least one frame. In underrun cases where there
aren't any URBs queued yet we should set base the next urb->start_frame on hardware
frame id + scheduling threshold instead of the running number.

This is on my todo list.

Class driver can then detect lagging out of sync URB_ISO_ASAP transfers based on
the unexpected large gaps between urb->start_frame numbers

Thanks
Mathias

