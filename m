Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3213B42D776;
	Thu,  6 Aug 2026 22:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054592; cv=none; b=b3XkcLtyw4eDY6rC/kwPaYk35Ba+kD6FcGf3ylGt1R1laI7gXn+c55AJWmnR5oR5h1Eug9Tr6/XHw+VXjI7OlMIAT5SnvlyKPBTQcbTgnzjYx2GRiIcpLQot9Cp1bKaHBi9j7jiXCU+yF+EQnDe3Urk6saSyUj2zRNnYPUI3Y4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054592; c=relaxed/simple;
	bh=HEpEm+/bpSpk7PiDNN2L2/AjCx0Q7kZ3a/UCPP91sMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vD1OZgZf/rMiiz6T5efHWR5d1LZcwoWP1JfbbdDz68ffXvjTOgS/uGyfiYYedwbFn/ahKUgzjYxYC0qntW1DyP5oVRRvy256ZFPpM1d55uaZqV/VtT2kME03HrTtyDvSsrHzyqGzpQ57iJCtfikurbEvoFfbwxElofjRZt4eJak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eMVsRRlW; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eMVsRRlW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786054588; x=1817590588;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HEpEm+/bpSpk7PiDNN2L2/AjCx0Q7kZ3a/UCPP91sMc=;
  b=eMVsRRlWWLsOAUIQ8frosPprSYBIdUQRp5uii1bBd+hSVumsSlle4ikA
   ScIkrgiBd9fWVM5HyOsAN3KpUV+8SgUG7dwoRMDu5FP/bgZy1ApgTv6MV
   efJSplRIz4uOVJZbfID6UByfVzYrVPupLlNULvZQoBibSwxBt8Njxf+dE
   dfB8rTnXvnSFgbWrbkwQzG8Sb38GGQQL9nNROWROZPozY+8KoyPJakixv
   +JS7Zpd/Qn/9KNrLO+Sllx7Q0GNymRSaVNJ6W5moJe8z2iAeenImU959U
   DIX+m576SmJ3CUE9o7Mu82UYTljz7Hnp8dzuCWoFA15WLnKr0BTc3ds95
   g==;
X-CSE-ConnectionGUID: 2WkfgJg7SdqiEbn6Mlw9kQ==
X-CSE-MsgGUID: comqtbY+SfagYc894wjnpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="98171395"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="98171395"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 15:16:26 -0700
X-CSE-ConnectionGUID: hot3QNhATtaaPrOTNzqiRQ==
X-CSE-MsgGUID: t9aAE3NrT2+OUP+cSOd/nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="266453764"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.244.235]) ([10.245.244.235])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 15:16:24 -0700
Message-ID: <1b9df974-69ce-47d7-a17a-bc723dd8c2c1@linux.intel.com>
Date: Fri, 7 Aug 2026 01:16:21 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] usb: xhci: Rework and improve the TD matching and
 skipping logic
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bart Nagel
 <bart@tremby.net>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260804120110.01bda0e2.michal.pecio@gmail.com>
 <20260804120537.5c30554e.michal.pecio@gmail.com>
 <d017215b-3e91-4786-9c41-f5685e5c19e0@linux.intel.com>
 <20260805213028.78a73f18.michal.pecio@gmail.com>
 <20260806130022.77401337.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260806130022.77401337.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/6/26 14:00, Michal Pecio wrote:
>> On Wed, 5 Aug 2026 20:39:12 +0300, Mathias Nyman wrote:
>> If the event points to a valid trb ahead of last trb in td, but
>> before the enqueue pointer, then we know hardware has passed this td
>> and we can give it back.
> 
> Actually, we don't, because of a race condition (and driver bug).
> 
> A very long TD completes with Short Packet on the first TRB.
> We give back the TD and advance ep_ring->dequeue past it (bug).
> Some event is generated later in the TD but we don't know yet.
> We queue a lot of TRBs and move enqueue into the completed TD.
> 
> We handle the event and it appears to be "before" enqueue. But
> the HW not only hasn't passed, it hasn't even begun executing
> any TD after the initially completed one.
> 
> We give them back and later get their events, or IOMMU faults.
> 

This isn't a realistic scenario.

Ring expansion needs to fail and class driver need to fill entire
ring buffer in the extremely short time between the short transfer
event mid TD, and the final completion event for the same TD.

xHC isn't really processing the rest of the TD's TRBs (no data
transfer) after a short transfer event.
A second event for that TD will likely point to the last TRB as
it has the IOC flag set, and that event will come almost instantly,
probably so close that both events are handled during one interrupt
handler call.

We would already now see severe issues if this could happen.
Queuing TRBs beyond hw dequeue on a full ring would overwrite the
cycle bit and hardware would likely just stop processing any TRBs

I do support changing the software dequeue to better match hardware
dequeue.

Thanks
Mathias



