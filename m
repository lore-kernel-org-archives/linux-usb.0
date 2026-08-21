Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D73743A7FA;
	Fri, 21 Aug 2026 12:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787313966; cv=none; b=g1e4jd/DQp8Up0O7s1OmGZ6IXL9gnfB6ynmNiPV/I3ARH7vhNEbrud/f3MJDCqIXNvKbBZfC/lNYHo8x7sAzBuWDe8iFYw/Sd8VJOCsTaB9/mmOai/ZUlPGVMORxoBwhAcd092Uo7xK5WguEQs1xU1BdagT2JPQawLAdQilcdt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787313966; c=relaxed/simple;
	bh=EimKIep5NKqQ3S/tS+G7jJuIhqWPxhJwEzLvTnSW0N0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b/CVvaUZSft3DzdKU24SmsFgESS92fzEhAcQ3VsmiVFw2idDNZKOpvJhoZ2ahVhudGT656nUEMwnG+43tPoa9etP/C4nGdMx6ahrzQIdOnOLYS98aTiPg2GcjRQWC7ZzNrDUmruszkj+hdscba0zYZ5enjYD6rUtJxRBb61PrpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J4PHe8Im; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J4PHe8Im"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787313963; x=1818849963;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=EimKIep5NKqQ3S/tS+G7jJuIhqWPxhJwEzLvTnSW0N0=;
  b=J4PHe8ImnpAY9J+7Pu1Bpv/+Y9NvJMWmevdiwIqSGpGOaTKyhcLsmrUH
   Vi2vm8zeHGUGAQ6Hkwlyv0FVmIoOMbhBoTkRX5ohej45RNgMbd2anct0g
   oMCOYPNWb532rl7qqMz9JtwKvGk0xxT3PEi9ABhxuz5lg2NOHCL3dI6M5
   10sH8zhCZIt9V0/dKlWDb0IX9TV2ZT1lK6W7cQVA4nsmsTVaN8Deaf1s5
   ioN8tvp6vLDMlTI6RPMDy6HwT71D8K8iVnbVviogrk3IL+jDz/Tppw33g
   VOr9HLpDThMcFkNSOO24quU8t2Erv6nfA/5FUQIF5/TqSkqQVJqQCwm3r
   w==;
X-CSE-ConnectionGUID: aayERrn3QYuNjZ+YgfqKhw==
X-CSE-MsgGUID: J3eP8/kRSq2z+jEWvSLNzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="91675254"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="91675254"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 05:05:57 -0700
X-CSE-ConnectionGUID: k8VlhBqCQt+KFrjWTo0lTQ==
X-CSE-MsgGUID: b/rH7U2xRzWGM4V0yZA5GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="265045549"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO [10.245.245.228]) ([10.245.245.228])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 05:05:56 -0700
Message-ID: <6804ed57-8405-4310-a64f-20c400bffde0@linux.intel.com>
Date: Fri, 21 Aug 2026 15:05:53 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: Fix isochronous scheduling regression
To: Michal Pecio <michal.pecio@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260821114706.34b095b1.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260821114706.34b095b1.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/21/26 12:47, Michal Pecio wrote:
> An isoc URB without URB_ISO_ASAP should be scheduled immediately after
> the previous one, unless it's the first submission or prior URBs have
> completed without resubmitting and the endpoint became idle.
> 
> An HCD_BH driver must consider URBs pending completion in the BH queue
> in addition to its own queue. Regrettably, core doesn't provide much
> information, we can only know if we are being called by completion now.
> This issue is as old as HCD_BH, affects ehci-hcd too and has no known
> reproducible impact, as drivers generally resubmit from completion.
> 
> A recent patch tried to address it by looking at xHCI HW state instead.
> Obviously, HW has no knowledge of the BH giveback queue either, and the
> whole solution amounts to testing whether prior URBs have been unlinked
> instead of completing normally - then a new stream is assumed.
> 
> This leads to false negatives when a driver simply allows the endpoint
> to empty out and begins a new stream. New URBs are scheduled into the
> past and promptly fail with -EXDEV status, causing data loss and worse,
> because drivers get confused by premature completion, particularly when
> multiple endpoints are started at once and required to stay in sync.
> 
> snd-usb-audio underruns the OUT endpoint when userspace fails to supply
> playback data in time. If this is detected in duplex mode, IN URBs are
> unlinked and both streams restarted. OUT underruns again before IN even
> begins, another recovery is attempted and the cycle repeats.
> 
> Fix this by using the best criteria we can muster, taken from ehci-hcd.
> This brings false negative rate back to zero and false positive rate to
> less than ever before in xhci-hcd. Traditional logic was equivalent to:
> 
> 	if (list_empty(&ep_ring->td_list) ||
> 	    GET_EP_CTX_STATE(ep_ctx) != EP_STATE_RUNNING)
> 		// consider this URB a new stream
> 
> While free of false negatives, it had easily avoidable false positives:
> * no check for completion in progress when the list is empty
> * the ep_ctx check doesn't make up for it at all, but it adds a race -
>    EP state can remain "stopped" for a while after the first submission

I would still prefer:
if (list_empty(&ep_ring->td_list) && GET_EP_CTX_STATE(ep_ctx) != EP_STATE_RUNNING)
to detect the start of a new isoch stream.

It has zero false positives mid stream, and fixes the "stopped" state race case.

I can't figure out when the false negatives it introduces is an issue.

If you can show me a usecase where a driver or specification is designed to let an
isoch endpoint intentionally run dry, leaving it in running/idle, and then continue
queuing URBs expecting ASAP scheduling, then we can change it.

UAC and UVC go to altsetting 0 and drop the isoch endpoint on stop/pause (says AI)
> 
> Link: https://lore.kernel.org/linux-usb/20260813005635.34750f8c.michal.pecio@gmail.com/
> Fixes: add8469b3e00 ("xhci: fix frame id calculation and checks for isoc URBs")
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> ---
>   drivers/usb/host/xhci-ring.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index f27bc132d0e9..8b0c27d6f12d 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -4311,10 +4311,11 @@ int xhci_queue_isoc_tx_prepare(struct xhci_hcd *xhci, gfp_t mem_flags,
>   	check_interval(urb, ep_ctx);
>   
>   	/*
> -	 * Check if this starts the isoc data flow. Relies on hw setting ep ctx
> -	 * state after doorbell ring. Consider adding list_empty(td_list) check
> +	 * Schedule the URB discontiguously if all previous URBs have completed.
> +	 * XXX core can't tell if completions are pending but not running yet.
>   	 */
> -	if (GET_EP_CTX_STATE(ep_ctx) != EP_STATE_RUNNING)
> +	if (list_empty(&ep_ring->td_list) &&
> +	    !hcd_periodic_completion_in_progress(xhci_to_hcd(xhci), urb->ep))
>   		xep->next_uframe = -1;

I don't know why we intentionally should introduce the false positive case,
hiding a known issue.

At least we should add a debug message so audio/video developers can find the reason for
the glitches:

if (list_empty(&ep_ring->td_list) &&
     !hcd_periodic_completion_in_progress(xhci_to_hcd(xhci), urb->ep)) {
	if (GET_EP_CTX_STATE(ep_ctx) == EP_STATE_RUNNING)
		xhci_dbg(xhci, "Starting new isoc stream on running endpoint at uframe %d, killing sync...
	xep->next_uframe = -1;
}

Thanks
Mathias
