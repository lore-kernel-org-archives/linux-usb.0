Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CA63E49D3
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 08:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786004237; cv=none; b=aZMs7JVqJSM2xM+0C7r5KsodnNXZKThOPp3BZ9SE7xDBFLCiShSJdyD8oUSe+SwiPpiLachdYMGKcFP4SYrUnmmgQIzZwYPmGgywQfWhy1amzjSTptbzkKU0p/xVHu+wXGi1Th8absO91nE91U9hKAvgdOKJcnNvzBaSsxTZbPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786004237; c=relaxed/simple;
	bh=uCzWC2ztPFsSBvGZN3D5hI49tH2gD1qOVQFL03Fgtos=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S4OtTtHPfrVy+ONGR17goATlCMneF2QILZWodtXm3Cd0na3tliqOewodYDyLHHVkUlyyEIwJABrrowuE0bwAOofLR5Gp2CT3rzONpXrJaEF17ZPS+mIiDE5Yu+93eJgb9UzQM0RLyOXcYa3OTMWu1BDzYlhJY0w2CM/6Ywsm6Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iHpI0StG; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iHpI0StG"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f7872abb6so898772f8f.3
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 01:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786004232; x=1786609032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y1Z3+ujp5TRLFvYPpEvCWdPArp13V/FOnwrr+GSlYsw=;
        b=iHpI0StGs/qC83qwbOVSDHNEiTofT7kvnezLhIvsq/gVo9TFKazkEeY6DM2+qOlOhf
         5twtkGm3FcTCryz3kWIhNiknNLW7t+BDej8y3vJGuDHu5yQDgAWpcRzKqT1HO0tGmLkk
         R82MP5SUTz7FzDn4h4RmS9TO3KF2PCqik0PN+JdQtsddnv1VmVvIkdTwzi6+e1adQPAB
         nM5xmkV8Mp8wCU0nLOm3l65jHQsg8Xa6JHIF9XGAtQvfa4Wf/6GCRvGQejHLPOr3je20
         LjEE5IZhDenar0B5t4lJLCIOcu5/7MfQB6DYGeyLK+9VTndo0it1NGntR9sMSaCMg5LS
         wU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786004232; x=1786609032;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y1Z3+ujp5TRLFvYPpEvCWdPArp13V/FOnwrr+GSlYsw=;
        b=gOpx+EZtH90BDKU+8hp9WV0gMVWhnrQPZR7G1yWUkvG0GMP3t3BI65ZbDxbBAyMF/4
         tEpars1ecpyqhFaggz9vhuy3XWQil17I54V9qgD23njTgoB8hpfNBXC+uXZ9rs2TP4Se
         Aa+ZTLh6yx0BzUOyvqmL+ZAyBwuRZXupMU0pPvxLAc9x3Zc/5XEMcTopsG4ZYehpND+X
         IO1PwXuJmCjG6oZHUfXAzVMLkcyXZ5sqbDKBd2dgkvQxoj1cdWRAWQMR0Mw3DJibe0x3
         YWWyed6DABQqCe+Pi6/lYtwb30pIF+Gj0VCK89piRriBMoRTlDqGiMPrJD2TZwu6pwkg
         ymbg==
X-Forwarded-Encrypted: i=1; AHgh+RosyHp4gt807BkoPFXKIDU64d9oXJyhV0YH7nOjyq/p0YlsbeWVcfZ90rUKwCEocNie0D33lUKQvoY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP+UTGf43ECRjEGk0RENhfZZm/YnbqHV//HRrOo9JRTpjBCqVB
	e/Mxck3ealu9iewsG1nQPZXWKWlteJ95hhacTYwIcMz27BTCehEJWn++
X-Gm-Gg: AR+sD12CzyL/n1KJO5zPwmYRHDwqUxEXJUxmFqYc1dTfz0+dMNCTy9ykopIRKobQWy/
	1XBFYv9KcVlcJhJ0brYb9hnOZDue3Y2DKv3N+1hBeUFCg8ReIjnrYsU6DW3RLRTfcqM8A7OCPoT
	EhhGSza+3JoKQe0yrR4+xh8JVrSYqhtMeOMoltPErgNY+6TR1uMseMWRybBJZ5IHGlT2EOG7wBd
	8Fcx5lC1UihK+d69caAcocthgSUPfNaPJQ2yHJGDu/Du4JGIooqFDmLuoM7RAcqmUPt8kH7JEwh
	/sr9FGlOOenDzmyoKZTgQTA3tuamhpUvB4wxcw0Enyja42VRMK3x/1gYNzf9gVa5cl7Tqf+kqq4
	+0+0xbOaSh2hI2jXWWTUqHbIpG5/opu1LiI8MxyG2NMZMhgjtHUFTREODSpWVBma9DUOPXMnksV
	xGR937qkT850O9XDWxj0jTggH99xtL2aGza3bBeDkjUC5pQJUYjwmDUQjieVi5oM8GoxzGtYLB
X-Received: by 2002:a05:6000:3103:b0:47f:9557:8d77 with SMTP id ffacd0b85a97d-47fec4f9be5mr19928588f8f.10.1786004231537;
        Thu, 06 Aug 2026 01:17:11 -0700 (PDT)
Received: from foxbook (bgt135.neoplus.adsl.tpnet.pl. [83.28.83.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff79a7258sm4215587f8f.3.2026.08.06.01.17.10
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 06 Aug 2026 01:17:11 -0700 (PDT)
Date: Thu, 6 Aug 2026 10:17:06 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: dylan_robinson@motu.com, linux-usb@vger.kernel.org,
 mathias.nyman@intel.com, stern@rowland.harvard.edu
Subject: Re: [RFT PATCHv3 1/3] xhci: fix frame id calculation and checks for
 isoc URBs
Message-ID: <20260806101706.72a8de47.michal.pecio@gmail.com>
In-Reply-To: <20260521152715.288995-1-mathias.nyman@linux.intel.com>
References: <a67e11d4-6c80-4043-9f60-ae42a15ed0d3@linux.intel.com>
	<20260521152715.288995-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 21 May 2026 18:27:12 +0300, Mathias Nyman wrote:
> Check if the expected frame IDs for a isochronous URB submitted
> mid stream is within the valid frame time window that xHC controller
> is capable of queuing TDs.
> 
> The range only needs to be checked once per URB as the isoc TDs of an
> URB are queued in one go with spinlock held and interrupts disabled.
> 
> Calculate the valid frame window start and end frame id in frames
> instead of microframes to better match how xhci specification
> section 4.11.2.5 does it.
> 
> Don't add frame id gaps or change scheduling to SIA mid stream if
> the start frame is outside the valid frame winow.
> Only print a debug message.
> Some devices can't handle gaps in isochronous transfers.
> 
> Calculate a valid start frame for the first URB of a stream, and
> align it to a full frame, or to interval start if interval is longer
> than a frame
> 
> Set urb->start_frame value for every URB
> 
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>

Hi,

I'm back after a few months of having no time whatsoever to
look at this project.

I noticed that some variant of this patch has appeared in the
xhci/for-usb-next branch. There are problems with it.

> ---
>  drivers/usb/host/xhci-mem.c  |   1 +
>  drivers/usb/host/xhci-ring.c | 180 +++++++++++++++--------------------
>  drivers/usb/host/xhci.h      |   7 +-
>  3 files changed, 84 insertions(+), 104 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index 997fe90f54e5..58714e10773f 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -1499,6 +1499,7 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
>  		return -ENOMEM;
>  
>  	virt_dev->eps[ep_index].skip = false;
> +	virt_dev->eps[ep_index].next_uframe = -1;
>  	ep_ring = virt_dev->eps[ep_index].new_ring;
>  	xhci_ring_init(xhci, ep_ring);
>  
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index e47e644b296e..b1318515ae58 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -3977,80 +3977,79 @@ static int xhci_ist_microframes(struct xhci_hcd *xhci)
>  }
>  
>  /*
> - * Calculates Frame ID field of the isochronous TRB identifies the
> - * target frame that the Interval associated with this Isochronous
> - * Transfer Descriptor will start on. Refer to 4.11.2.5 in 1.1 spec.
> + * Check if frame is in the valid frame window, including start and end.
> + * If start > end then assume window wrapped around at a limit the frame
> + * value won't exceed.
> + */
> +static bool xhci_frame_in_range(u32 frame, u32 start, u32 end)
> +{
> +	/* frame window end wrapped around */
> +	if (start > end)
> +		return frame >= start || frame <= end;
> +
> +	return frame >= start && frame <= end;
> +}
> +
> +/*
> + * Set the urb->start_frame of the URB.
>   *
> - * Returns actual frame id on success, negative value on error.
> + * Returns microframe index of first TD
>   */
> -static int xhci_get_isoc_frame_id(struct xhci_hcd *xhci,
> -		struct urb *urb, int index)
> +static int xhci_get_isoc_start_frame(struct xhci_hcd *xhci, struct urb *urb,
> +				     struct xhci_virt_ep *ep)
>  {
> -	int start_frame, ist, ret = 0;
> -	int start_frame_id, end_frame_id, current_frame_id;
> +	u32 curr_frame, start_uframe;
> +	u32 urb_start, urb_end;
> +	u32 win_start, win_end;
> +	bool frame_unit;
> +	int uinterval;
> +	u32 mfindex;
> +	int ist;
>  
> -	if (urb->dev->speed == USB_SPEED_LOW ||
> -			urb->dev->speed == USB_SPEED_FULL)
> -		start_frame = urb->start_frame + index * urb->interval;
> -	else
> -		start_frame = (urb->start_frame + index * urb->interval) >> 3;
> +	/* check if urb uses frame units instead of microframes */
> +	frame_unit = (urb->dev->speed == USB_SPEED_FULL ||
> +		     urb->dev->speed == USB_SPEED_LOW);
> +
> +	uinterval = urb->interval;
> +	if (frame_unit)
> +		uinterval *= 8;
>  
> +	/* get current microframe index and isoc scheduling threshold */
> +	mfindex = readl(&xhci->run_regs->microframe_index);
>  	ist = xhci_ist_microframes(xhci);
>  
> -	/* Software shall not schedule an Isoch TD with a Frame ID value that
> -	 * is less than the Start Frame ID or greater than the End Frame ID,
> -	 * where:
> -	 *
> -	 * End Frame ID = (Current MFINDEX register value + 895 ms.) MOD 2048
> -	 * Start Frame ID = (Current MFINDEX register value + IST + 1) MOD 2048
> -	 *
> -	 * Both the End Frame ID and Start Frame ID values are calculated
> -	 * in microframes. When software determines the valid Frame ID value;
> -	 * The End Frame ID value should be rounded down to the nearest Frame
> -	 * boundary, and the Start Frame ID value should be rounded up to the
> -	 * nearest Frame boundary.
> -	 */
> -	current_frame_id = readl(&xhci->run_regs->microframe_index);
> -	start_frame_id = roundup(current_frame_id + ist + 1, 8);
> -	end_frame_id = rounddown(current_frame_id + 895 * 8, 8);
> +	/* calculate valid frame window, in frame units, see xhci 4.11.2.5 */
> +	curr_frame = MFINDEX_TO_FRAME(mfindex);
> +	win_start = (curr_frame + DIV_ROUND_UP_POW2(ist, 8) + 1) % MAX_FRAMES;
> +	win_end = (curr_frame + 895) % MAX_FRAMES;
>  
> -	start_frame &= 0x7ff;
> -	start_frame_id = (start_frame_id >> 3) & 0x7ff;
> -	end_frame_id = (end_frame_id >> 3) & 0x7ff;
> +	// FIXME, used to check if !list_empty(&ep_ring->td_list)), is that reliable

This doesn't look very professional :)

(Surprised to find that checkpatch doesn't warn about C++ comments...)

But most importantly, as Alan explained, list_empty() was indeed the
specific check which should be performed.

* If there are pending URBs on the endpoint, a new non-ASAP URB is
  scheduled contiguously after the last one.
* If there are no pending URBs, new non-ASAP URB is scheduled ASAP.

(The exact meaning of "pending" is a little tricky in presence of BH
giveback, but that's another issue and it also affects ehci-hcd).

>  
> -	if (start_frame_id < end_frame_id) {
> -		if (start_frame > end_frame_id ||
> -				start_frame < start_frame_id)
> -			ret = -EINVAL;
> -	} else if (start_frame_id > end_frame_id) {
> -		if ((start_frame > end_frame_id &&
> -				start_frame < start_frame_id))
> -			ret = -EINVAL;
> +	/* Is this the first URB starting the whole isoc transfer */

Nitpick: xHCI calls this "isoch data flow" and ehci-hcd "stream".

Isn't "isoc transfer", per USB spec, things that happens during one
interval? But not 100% sure about it and too lazy to check now...

> +	if (ep->next_uframe < 0) {

And where is ep->next_uframe coming from?

Besides initialization, it's made -1 if and only if xHCI endpoint
state isn't Running at the time of submission. This effectively means
that to start a new "isoch data flow" aka "stream", class driver must
unlink the last remaining URB of the previous flow. If the driver
doesn't unlink (or tries too late), the endpoint goes Running-Idle.

So you have removed the wrong condition here. It should be empty list,
not xHCI endpoint state, which drivers don't care or even know about.

Moreover, we know that Endpoint Context state is one of the least
trustworthy piecese of information, and notably it may remain Stopped
for a while after a doorbell ring. This means that multiple URBs may
be scheduled as new "streams" and get assigned the same start_frame.

I have actually seen this race sporadically with snd-usb-audio and
it may be responsible for some (but not all) of the "repeated errors
and restarts" behavior of this driver.

AFAICT testing EP state has always been bogus and my very first move
was to delete it. It seems that the author of that CFC support patch
never understood kernel USB stack rules and invented some weird ones.

> +		/* align first URB to next interval boundary, or at last to full frame */
> +		start_uframe = mfindex + ist + XHCI_CFC_DELAY;
> +		start_uframe = roundup(start_uframe, 8);
> +		start_uframe = roundup(start_uframe, uinterval) % MAX_UFRAMES;
>  	} else {
> -			ret = -EINVAL;
> -	}
> +		/* URB is mid stream and expected to handle the next frame */
> +		start_uframe = ep->next_uframe;
> +		urb_start = start_uframe / 8;
> +		urb_end = (start_uframe + urb->number_of_packets * uinterval) / 8;
> +		urb_end %= MAX_FRAMES;
>  
> -	if (index == 0) {
> -		if (ret == -EINVAL || start_frame == start_frame_id) {
> -			start_frame = start_frame_id + 1;
> -			if (urb->dev->speed == USB_SPEED_LOW ||
> -					urb->dev->speed == USB_SPEED_FULL)

Not sure if low-speed isoc is a serious concern...

> -				urb->start_frame = start_frame;
> -			else
> -				urb->start_frame = start_frame << 3;
> -			ret = 0;
> -		}
> -	}
> +		if (!xhci_frame_in_range(urb_start, win_start, win_end))
> +			xhci_dbg(xhci, "Ill-timed isoc URB %p for start frame %d, range %d-%d\n",
> +				 urb, urb_start, win_start, win_end);

It's better to distinguish between failing to meet the IST (which may
be common when running with too low latency and cause plenty of log
spam here) and exscessively long submission queue.

The latter should simply result in -EFBIG error and no need to log it.

>  
> -	if (ret) {
> -		xhci_warn(xhci, "Frame ID %d (reg %d, index %d) beyond range (%d, %d)\n",
> -				start_frame, current_frame_id, index,
> -				start_frame_id, end_frame_id);
> -		xhci_warn(xhci, "Ignore frame ID field, use SIA bit instead\n");
> -		return ret;
> +		if (!xhci_frame_in_range(urb_end, win_start, win_end))
> +			xhci_dbg(xhci, "Ill-timed isoc URB %p for end frame %d, range %d-%d\n",
> +				 urb, urb_start, win_start, win_end);
>  	}
> +	/* set urb->start_frame */
> +	urb->start_frame = frame_unit ? start_uframe / 8 : start_uframe;
>  
> -	return start_frame;
> +	return start_uframe;
>  }
>  
>  /* Check if we should generate event interrupt for a TD in an isoc URB */
> @@ -4091,6 +4090,8 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
>  	bool more_trbs_coming;
>  	struct xhci_virt_ep *xep;
>  	int frame_id;
> +	int uinterval = urb->interval;
> +	int start_uframe;
>  
>  	xep = &xhci->devs[slot_id]->eps[ep_index];
>  	ep_ring = xhci->devs[slot_id]->eps[ep_index].ring;
> @@ -4106,6 +4107,12 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
>  	start_cycle = ep_ring->cycle_state;
>  
>  	urb_priv = urb->hcpriv;
> +
> +	if (urb->dev->speed == USB_SPEED_FULL || urb->dev->speed == USB_SPEED_LOW)
> +		uinterval = urb->interval * 8;
> +
> +	start_uframe = xhci_get_isoc_start_frame(xhci, urb, xep);
> +
>  	/* Queue the TRBs for each TD, even if they are zero-length */
>  	for (i = 0; i < num_tds; i++) {
>  		unsigned int total_pkt_count, max_pkt;
> @@ -4137,14 +4144,15 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
>  			goto cleanup;
>  		}
>  		td = &urb_priv->td[i];
> +
>  		/* use SIA as default, if frame id is used overwrite it */
>  		sia_frame_id = TRB_SIA;
> -		if (!(urb->transfer_flags & URB_ISO_ASAP) &&
> -		    (xhci->hcc_params & HCC_CFC)) {
> -			frame_id = xhci_get_isoc_frame_id(xhci, urb, i);
> -			if (frame_id >= 0)
> -				sia_frame_id = TRB_FRAME_ID(frame_id);
> +		if (!(urb->transfer_flags & URB_ISO_ASAP) && (xhci->hcc_params & HCC_CFC)) {
> +			frame_id = (start_uframe + i * uinterval) / 8;
> +			frame_id %= MAX_FRAMES;
> +			sia_frame_id = TRB_FRAME_ID(frame_id);
>  		}
> +
>  		/*
>  		 * Set isoc specific data for the first TRB in a TD.
>  		 * Prevent HW from getting the TRBs by keeping the cycle state
> @@ -4223,9 +4231,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
>  		}
>  	}
>  
> -	/* store the next frame id */
> -	if (xhci->hcc_params & HCC_CFC)
> -		xep->next_frame_id = urb->start_frame + num_tds * urb->interval;
> +	xep->next_uframe = (start_uframe + num_tds * uinterval) % MAX_UFRAMES;
>  
>  	if (xhci_to_hcd(xhci)->self.bandwidth_isoc_reqs == 0) {
>  		if (xhci->quirks & XHCI_AMD_PLL_FIX)
> @@ -4272,11 +4278,9 @@ int xhci_queue_isoc_tx_prepare(struct xhci_hcd *xhci, gfp_t mem_flags,
>  	struct xhci_virt_device *xdev;
>  	struct xhci_ring *ep_ring;
>  	struct xhci_ep_ctx *ep_ctx;
> -	int start_frame;
> +	struct xhci_virt_ep *xep;
>  	int num_tds, num_trbs, i;
>  	int ret;
> -	struct xhci_virt_ep *xep;
> -	int ist;
>  
>  	xdev = xhci->devs[slot_id];
>  	xep = &xhci->devs[slot_id]->eps[ep_index];
> @@ -4302,38 +4306,8 @@ int xhci_queue_isoc_tx_prepare(struct xhci_hcd *xhci, gfp_t mem_flags,
>  	 */
>  	check_interval(urb, ep_ctx);
>  
> -	/* Calculate the start frame and put it in urb->start_frame. */
> -	if ((xhci->hcc_params & HCC_CFC) && !list_empty(&ep_ring->td_list)) {
> -		if (GET_EP_CTX_STATE(ep_ctx) ==	EP_STATE_RUNNING) {
> -			urb->start_frame = xep->next_frame_id;
> -			goto skip_start_over;
> -		}
> -	}
> -
> -	start_frame = readl(&xhci->run_regs->microframe_index);
> -	start_frame &= 0x3fff;
> -	/*
> -	 * Round up to the next frame and consider the time before trb really
> -	 * gets scheduled by hardare.
> -	 */
> -	ist = xhci_ist_microframes(xhci);
> -	start_frame += ist + XHCI_CFC_DELAY;
> -	start_frame = roundup(start_frame, 8);
> -
> -	/*
> -	 * Round up to the next ESIT (Endpoint Service Interval Time) if ESIT
> -	 * is greate than 8 microframes.
> -	 */
> -	if (urb->dev->speed == USB_SPEED_LOW ||
> -			urb->dev->speed == USB_SPEED_FULL) {
> -		start_frame = roundup(start_frame, urb->interval << 3);
> -		urb->start_frame = start_frame >> 3;
> -	} else {
> -		start_frame = roundup(start_frame, urb->interval);
> -		urb->start_frame = start_frame;
> -	}
> -
> -skip_start_over:

I think there was nothing wrong with keeping scheduling logic here,
that's what I did.

I have never sent my own patches because they were incomplete (I tried
to cover non-CFC as well), but the stuff which is covered by this patch
I already have fully covered toq.

So I can post those patches as RFC if anyone would like to see them.

Regards,
Michal

> +	if (GET_EP_CTX_STATE(ep_ctx) != EP_STATE_RUNNING)
> +		xep->next_uframe = -1;

And there we go, the only way to start a new "isoch data flow".

>  	return xhci_queue_isoc_tx(xhci, mem_flags, urb, slot_id, ep_index);
>  }
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index aeecd301f207..bcb7b8c877db 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -287,6 +287,11 @@ struct xhci_run_regs {
>  	struct xhci_intr_reg	ir_set[1024];
>  };
>  
> +/* Bits [13:3] of the microframe index equals the 1ms frame index */
> +#define MFINDEX_TO_FRAME(p)	(((p) >> 3) & 0x7ff)
> +#define MAX_FRAMES		2048
> +#define MAX_UFRAMES		(MAX_FRAMES * 8)
> +
>  /**
>   * struct doorbell_array
>   *
> @@ -696,7 +701,7 @@ struct xhci_virt_ep {
>  	struct list_head	bw_endpoint_list;
>  	unsigned long		stop_time;
>  	/* Isoch Frame ID checking storage */
> -	int			next_frame_id;
> +	int			next_uframe;
>  	/* Use new Isoch TRB layout needed for extended TBC support */
>  	bool			use_extended_tbc;
>  	/* set if this endpoint is controlled via sideband access*/
> -- 
> 2.43.0
> 
