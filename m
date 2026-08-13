Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EBA4756CA
	for <linux-usb@vger.kernel.org>; Thu, 13 Aug 2026 13:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786627160; cv=none; b=ccPkzSYSQRIRCRJUXDsDHHWhhWaaJPbpm1u+l/EDc7L/KPENF7qMEYNGMq+u1RHxT6Mq4xWfeoGagVaSCVEIq4ZjUGxHkt5MDoRcx4FR2Wf+158OuUAEBKF2thUiZh5EsKp6wqHaze8ez2qBtGXOI9/D7heHFe8G2oLyxx+fbjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786627160; c=relaxed/simple;
	bh=UfM6zRCziGIQQzZeVb35N3Xxj11gyzNA2xPGZ0RDv9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mDWh93Lblr8RWCvg2ZomGrdYLfTTZhsG5QYxG08lhI9eB/ex6rm4sJkdWBcmtD1dntF2RCUIHUKobKNApq3j+6pgEmAbg/LmRuxpVsNLdzs6ryFT75B/Qc7dItImcbXNsYqHXiK28Jotr3sAlKNgk7r61NFikw7n3Yxh/r+PAkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qq1SNpyV; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qq1SNpyV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786627158; x=1818163158;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=UfM6zRCziGIQQzZeVb35N3Xxj11gyzNA2xPGZ0RDv9g=;
  b=Qq1SNpyVrs7fUSTiMLPA/UD/BVUNdeA0JQBeF2frzCMc5xdvLxXsyato
   tuMJKfcnLk0p8nrG7OqjM2UZ93sHtRZ5srsgHMwW1gGcYgZtn36CSxYI4
   wdxpitLVx5ZKYQCAgrZYFJTqniTiY6lWfKFCgWWmW4W8aWhW652nnpF+v
   FrHoGCgL3KkiWNC9G69qDGckm9DjUgS++tufq9an2I4u+oOHp1C5bPMXh
   oTWjFlVdBD9+WPcicuRwmATdbFFM5Lf6K+chI+AYJIofSOF7ll1Mxg3TU
   rFUvjhdktjJ+JVZ4SNfxMvf7MiIvk9yhFme3qKCziX/1fW7GMfyPUeCg2
   g==;
X-CSE-ConnectionGUID: J9gKDZAXRhen4LIvcmZpQg==
X-CSE-MsgGUID: sLSaiDKrQ1y0V54pjKR9Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87415913"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="87415913"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 06:19:18 -0700
X-CSE-ConnectionGUID: XeOOa0n0Rp6DS8PRZizrrg==
X-CSE-MsgGUID: tkPC/XybQ/2ofs970wRxdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="261309972"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO [10.245.244.72]) ([10.245.244.72])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 06:19:16 -0700
Message-ID: <27c1fc3a-6122-4658-b5df-567eeb66284f@linux.intel.com>
Date: Thu, 13 Aug 2026 16:19:13 +0300
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
 <310ccfe5-0212-4c8b-9213-891a7340e2f4@linux.intel.com>
 <20260813005635.34750f8c.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260813005635.34750f8c.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/13/26 01:56, Michal Pecio wrote:
> On Fri, 7 Aug 2026 14:10:35 +0300, Mathias Nyman wrote:
>> I'm doing exactly what kerneldoc and comments in bugzilla state.
>> If queue empties out we schedule the next TD based on URB_ISO_ASAP
>> flag.
> 
>>> "If the queue is idle" means all completions have already returned.
>>
>> That's an odd interpretation of "queue is idle"
>>
>> This would mean that an URB queued after "queue runs out" (underrun)
>> should always be treated as USB_ISO_ASAP case, making the flag
>> useless.
> 
> Well, there are HW queues and SW queues, and HW and SW underruns.
> 
> If the HW queue underruns but the SW queue still has pending URBs
> (not completed yet) then we do care about URB_ISO_ASAP. If the SW
> queue is completely empty (all completed), we aren't expected to.
> 
> 
> This does make a difference with snd-usb-audio. If I run
> 
> jackd -d alsa -d hw:... -p 24 -n 2
> 
> Ring Underrun and Missed Service are reported every now and then,
> sometimes repeatedly, and it doesn't take long to enter this loop:
> 
> 1. playback Ring Underrun (xHCI EP state is Running)
> 2. capture URB unlink (xHCI EP state is Stopped)
> 3. multiple capture URBs scheduled to the same start_frame before
>     EP state becomes Running

agree, and this needs to be fixed with something like:

-       if (GET_EP_CTX_STATE(ep_ctx) != EP_STATE_RUNNING)
+       if (list_empty(&ep_ring->td_list) &&
+           GET_EP_CTX_STATE(ep_ctx) != EP_STATE_RUNNING)

> 4. new playback URB is scheduled into a distant past due Running EP
> 5. 2 uframes later OUT endpoint reports Missed Service for all
>     those misscheduled TDs
> 6. goto 1
> 
> Changing the condition from "running endpoint" back to "empty list"
> breaks this pathological cycle. Experimental patch below.
> 

But this is different from incorrectly assuming a new stream started
mid stream just because list_empty(&ring->td_list) is true and the urb completion
workqueue isn't at this instance processing a work item belonging to
this endpoint.
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 1ff84ab9955a..8e380d1c066e 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -4303,6 +4303,12 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
>   	return ret;
>   }
>   
> +static int _ep(int ep_index)
> +{
> +	ep_index++;
> +	return ep_index / 2 + 0x80 * (ep_index & 1);
> +}
> +
>   /*
>    * Check transfer ring to guarantee there is enough room for the urb.
>    * Update ISO URB start_frame and interval.
> @@ -4348,7 +4354,22 @@ int xhci_queue_isoc_tx_prepare(struct xhci_hcd *xhci, gfp_t mem_flags,
>   	 * Check if this starts the isoc data flow. Relies on hw setting ep ctx
>   	 * state after doorbell ring. Consider adding list_empty(td_list) check
>   	 */
> -	if (GET_EP_CTX_STATE(ep_ctx) != EP_STATE_RUNNING)
> +	bool running = GET_EP_CTX_STATE(ep_ctx) == EP_STATE_RUNNING;
> +
> +	bool pending = !list_empty(&ep_ring->td_list) ||
> +		       hcd_periodic_completion_in_progress(xhci_to_hcd(xhci), urb->ep);

The 'pending' is still not reliable and may be false mid stream even when
list_empty() is true .

hcd_periodic_completion_in_progress() only returns true if workqueue is
currently handling a URB that belongs to this endpoint.

If workqueue doesn't yet handle any work item, or handles an URB belonging to any other
endpoint on this or any other device on this bus it will return false.

All periodic devices on this bus share this one workqueue.

If we incorrectly assume a new stream started mid stream then it will become
out of sync even if CFC is supported.

Thanks
Mathias
