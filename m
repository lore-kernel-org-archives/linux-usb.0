Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD892371056;
	Mon,  1 Jun 2026 10:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780310761; cv=none; b=kHtafk3nJvwl3wY1Ifxetqa8ZtpknU4LaBG5Wy74MzL2U5UnUIQ8avl/mkBjXQM7y0sfnzMaEXn2snV1PC9PEVtIyrSsMNOx21lio3d0ZLtgav7yPjp79En5qZsK+IjSOdL1XfWX8SDNn6KYPclWyfcSbddbYJDLK3LmP+fC2DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780310761; c=relaxed/simple;
	bh=h67ROgvcNliimocVEB3Y4ZDFc3nKP65jyFwdcTzQ8Yw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vq0oYbwU11rXZaX+ZxzE/m6SogFAAyP706fqJAs6cu8ZTRjHNVw9szlG1LdKc4ikuKDstw3P2ajbtZ+4AFf0naPbciWCjVUOsPW0Lrgn8Lm5fivmEgi9ZbQ0A4Kj0OYiZi89oij6xcpGmujssGugC509Brj/2L284z5pZV4k8Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ej/JTeQf; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ej/JTeQf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780310759; x=1811846759;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=h67ROgvcNliimocVEB3Y4ZDFc3nKP65jyFwdcTzQ8Yw=;
  b=Ej/JTeQfomLSI4aGYnEQeSSvP39bLl3YOrNEUea32hnnfUr7PnvjOZFL
   pPg0mjX24Wksil5qNcOzMruix5DUZBOSyBL5tVnqbUSupTF+/ZV1J2I9f
   PF+QgnA7rHGuWMcP6tNADuLaCyknoIrnjzTwlU/i/HkSsvWt5MHjetwAO
   OAgohj9j8KWHOOQZK5IJMoObpuvNjVVyu9KNMt1N4CS8DFznWHsbsUeC2
   L59bALu+obTDCD8I0yb4sgEBU1LDyGEBVWkCJugimiyDgNkF+bP08TdDD
   68E8YYTwhdwDtVZo+8g9ca69iNmDA+uy1tjTOP30I0cQND631RZPlvHIP
   A==;
X-CSE-ConnectionGUID: O9rBlO1zTCqg43INP5imtQ==
X-CSE-MsgGUID: v/5SsEQ4SlW8sDke5FTyRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80098571"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="80098571"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 03:45:58 -0700
X-CSE-ConnectionGUID: dq18iRklSoa6r4jyw3wlBQ==
X-CSE-MsgGUID: lRMx84i7QUGm/gEXnJ/dVg==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.110]) ([10.245.245.110])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 03:45:57 -0700
Message-ID: <fd8ed109-2183-4160-af9e-4a74bda8c020@linux.intel.com>
Date: Mon, 1 Jun 2026 13:45:37 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] usb: xhci: Simplify moving HW Dequeue Pointer past
 cancelled TDs
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250225125750.1b345e2c@foxbook>
 <20250225125939.7a248e38@foxbook>
 <b82f9543-2730-48af-81e8-1612b0d30ed9@linux.intel.com>
 <20260529125318.611b2625.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260529125318.611b2625.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/29/26 13:53, Michal Pecio wrote:
> On Tue, 25 Feb 2025 16:55:49 +0200, Mathias Nyman wrote:
>> On 25.2.2025 13.59, Michal Pecio wrote:
>>> xhci_move_dequeue_past_td() uses a relatively complex and inefficient
>>> procedure to find new dequeue position after the cancelled TD.
>>>
>>> Replace it with a simpler function which moves dequeue immediately to
>>> the first pending TD, or to enqueue if the ring is empty.
>>>
>>> The outcome should be basically equivalent, because we only clear xHC
>>> cache if it stopped or halted on some cancelled TD and moving past the
>>> TD effectively means moving to the first remaining TD, if any.
>>
>> This new way relies on td_list being in sync and up to date.
>> i.e. hardware dequeue can't be ahead of first TD in list.
>>
>> One bad scenario could be something like:
>>
>> class driver queues TD1
>> class driver queues TD2
>> Class driver cancels TD2, queue stop endpoint command
>> (Class driver cancels TD1) (optional)
>>
>> xHC hardware just completed TD1 and stop endpoint command at the same time,
>> xHC hw may have advanced the hw dequeue to TD2, write event for stop endpoint command, and
>> then write transfer event for TD1 completion. (xHC hardware may do things in odd order)
> 
> Hi,
> 
> I noticed that your xhci repository now contains a very similar patch.
> The same problem seems to still apply.
> 

True, completely forgot about this patch from February.

The one in my branch was written to solve control endpoint possibly not starting
if dequeue is moved to a no-op TRB.

Solution ends up being basically the same.

> I would say that the HW writing TD1 completion event after TD2 stopped
> event would be a blatant spec violation and I don't recall seeing it
> happen, but there is also a possibility that TD1 generates no event at
> all or the event is missed due to a bug (no IOC, broken HW, whatever).
> 
> Then we could make things works by rewinding back to TD1.
> 
> A safer approach could be to retain the 'td' argument and use td->next
> instead of list_first_entry(td_list).

This should work

> 
> Today we also have the dma_in_range() technology, so an efficient check
> can be performed whether hw_dequeue lies between td->next and enqueue.
> In such case something is clearly wrong and Set Deq seems unnecessary.

This could at least be used to print a debug message.

> 
> And one more problem: unconditionally advancing enqueue past a link TRB
> creates risk that enqueue will enter deq_seg if the queued command
> fails, which breaks ring expansion later. If we care...

Enqueue is only advanced past link TRB if ring is empty, and both are then
set to the beginning of the next segment. Ring expansion isn't an issue here.
This is done to avoid moving dequeue to a link TRB.

Thanks
Mathias

