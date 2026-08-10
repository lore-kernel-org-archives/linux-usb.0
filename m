Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559173A6B66
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 14:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371164; cv=none; b=Jf7jRgyqWk0RZifsH7AfRps5ktRYVMuYN/P6rBCMuYGCsRDex9LmgR7GlxqBX5ahPRXN5S/dRIg0yHbIEKWDWnXNC1KadIQBQZBNj5wWtKooduJpriqYI/yBIORG2IfyhfJPRxXaPJaQORABGSaB9uKhUDIn2Qpql/U03BriAVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371164; c=relaxed/simple;
	bh=jXxJIOuttykfD6pvipDdzOYLSzkM64qojJIL2XQ1xtU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WRHjWzGn0pFMIns0lP14WjFYLqMIUstF4Cxgo4x8Wa0M/xjDnlJ5IutARLSxd5fhSt9j7LMlnsnnsq4lW+pRjDbcmFrgcliaieqRpZgSqchItbuzt70StkBgBqnFR0YDPQccd2nLoO54cD8TQNq7vP8EGbOHtsUjHsu6b1HjHu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YmAkbBwg; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YmAkbBwg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786371162; x=1817907162;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jXxJIOuttykfD6pvipDdzOYLSzkM64qojJIL2XQ1xtU=;
  b=YmAkbBwgjJ4F/GTXv5OEDgTI+1eOpRMKuHAZBmi1ztGfksqM7grLlmRL
   HDeHtsl0LLSam1iwpAyL81vnX03AeLuFrtlSt331YsIxC9CBFHcOIm1Up
   K6ZnA054Uib/e8GWMKTqhb3YN0eshabSkWdwfdEoQCSnIJQaevODjTwyZ
   D+IPcibaHw9oLNQrQQM6wU4KR+K1msznJkYrs5yRJs+06Vut+Aqfcdz8U
   lK8txf873j0eZyYio6WqXboekbLnM0qJOX7SCSfWlTc3QIGKvM7NFunjn
   +FrjxMyVOoHiN97zrXbkg+x+41Tfnu4T8COAFOkHqW4EuEaMB+j6HDRNl
   A==;
X-CSE-ConnectionGUID: LIlYne3ESki2dWjRAf+dNQ==
X-CSE-MsgGUID: RbRTPW5cTryc07Aj6YELBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="104417532"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="104417532"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 07:12:42 -0700
X-CSE-ConnectionGUID: sw5YGpudR8qmuT1N5o2SxA==
X-CSE-MsgGUID: NFGjz1UHQhOlvKyja16Q6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="265041933"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.102]) ([10.245.244.102])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 07:12:40 -0700
Message-ID: <e993b7d0-c793-4d9e-b7ca-901ad46504d7@linux.intel.com>
Date: Mon, 10 Aug 2026 17:12:38 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCHv3 1/3] xhci: fix frame id calculation and checks for
 isoc URBs
To: Michal Pecio <michal.pecio@gmail.com>,
 Dylan Robinson <dylan_robinson@motu.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
 mathias.nyman@intel.com
References: <a67e11d4-6c80-4043-9f60-ae42a15ed0d3@linux.intel.com>
 <20260521152715.288995-1-mathias.nyman@linux.intel.com>
 <20260806101706.72a8de47.michal.pecio@gmail.com>
 <0e2f28f5-aa38-4401-8287-b55aab577243@linux.intel.com>
 <20260807000155.2960c741.michal.pecio@gmail.com>
 <e3c66325-0291-40f9-a87e-1bb337ce4427@linux.intel.com>
 <20260807102604.5f649db2.michal.pecio@gmail.com>
 <310ccfe5-0212-4c8b-9213-891a7340e2f4@linux.intel.com>
 <7d514c0c-cb24-4d3f-a9a6-8107cc605bad@rowland.harvard.edu>
 <CA+Df+jdCbY23h+Bq+ehKbJWMvTtwQDAOLk+hw=Y8Ne9zhJ_GOw@mail.gmail.com>
 <20260807232952.015d380b.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260807232952.015d380b.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/8/26 00:29, Michal Pecio wrote:
> On Fri, 7 Aug 2026 13:30:40 -0400, Dylan Robinson wrote:
>> On Thu, Aug 6, 2026 at 8:07 PM Mathias Nyman
>> <mathias.nyman@linux.intel.com> wrote:
>>> With the hardware ep ctx check we will set the frame_id of the late
>>> URB to point to the past, to the real time it was supposed to be
>>> played back. xHC hardware will then trigger a 'missed service
>>> event' for that TD as it was incapable of playing it at the correct
>>> time, and then fast forward with MSE until it finds a TD with a
>>> frame_id it can play, and play at the correct timeslot. Here we
>>> lost the late data but playback stays in sync, as isoc transfer are
>>> intended to work.
>>
>> I want to make sure I'm following along correctly. This is only true
>> for host controllers that support CFC. On controllers without CFC,
>> continuations are always submitted with SIA, so the controller can't
>> reject expired TDs based on their Frame ID.
> 
> Yes, we are talking about the patch fixing CFC logic. You are right,
> and you could only be more right with "because" in place of "so";
> I tried treating old chips as if they had CFC, outcomes were weird.
> 
>> On Fri, Aug 7, 2026 at 12:48 PM Alan Stern
>> <stern@rowland.harvard.edu> wrote:
>>> The point under discussion is really about what happens when an
>>> underrun occurs by accident -- for example, if the system is
>>> temporarily overloaded.  In this situation there are two logical
>>> choices of action if the class driver wants to keep the queue
>>> running: Keep the alignment of iso_packet_descriptors and
>>> (micro)frames as it was, which means assigning some new packets to
>>> times in the past, or forget about the old alignment and start
>>> fresh, which means assigning the next packet to the next available
>>> future time slot.  The URB_ISO_ASAP flag is how the driver
>>> communicates its choice to the HCD.
>>
>> How is the first choice realized when the host controller doesn't
>> support CFC?
> 
> Currently it isn't, everything goes "ASAP" on xHCI 1.0 hardware and
> underrun creates a gap. Another patch that Mathias prepared for 7.3
> would align the first URB of each new stream, but nothing more.
> 
> We get the Ring Underrun event, so we know it happened. Drivers don't
> know and they seem to have no trivial and robust way to detect it. To
> them, URBs are completing, submissions are succeeding, all looks fine.
> 
> Potential solutions I could think of:
> 
> 1. Somehow let drivers know that a fresh start is their only choice
>     (some completion status, bogus start_frame, usb_submit_urb() error,
>     callback, ...) and have them ready to deal with this (hard part).

Tune urb->start_frame to be one step closer to reality could be a first step.
Give class drivers a chance to detect a difference in expected and reported
urb->start_frame

If there are already queued TDs when we receive an underrun event then add
urb->start_frame += ESIT to every queued URB

If there are no pending URBs then set flag to calculate new urb->start_frame
for the next URB when enqueued.

This is of course only for the ASAP case.
It won't be perfect, might drift especially if URBs are enqueued before we handle
the underrun event, but not too difficult to implement and better than current
situation

Thanks
Mathias
  

