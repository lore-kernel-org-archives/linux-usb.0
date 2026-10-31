Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793419579;
	b=IMI4Hh95y5P1jDY4gzI/ju6/TM+LyqQvNdwNx07xGUCDt9IzLY/Zd6JKAxjZVfKSgcHR
	 z0BiSJH9PAYaS6XBiEu/XpHqusfi8gIx1Q305pc4mhyn/SbITHTF0gjczTfh+4rcHU2vA
	 lTIfn2Q0VVn98sTTB6T5BL3d2hMhck5o4oL30wIY3+QpnQcrUzIDljrD4hoeHC/EZ1GRo
	 a7D06CIpbJ8jd4WZ+oAiwVO83jotvTDLEnFWmSnH6/5BxAHFewXlI2WR/5XJyzC+Jnjhx
	 gJnbDe3zRxfrwSDhQhMx0Fj62y9m0YrRx92u0pJxPxf1jYAET4QfUvFPauu5/OQYghw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793419579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=d2drzBfyOi4dqr6uPeqMUIsHsOJPQ5QZohftfAKluoM=;
	b=bqgefRb7EgFvU7y/DpFWadPJqS1aEuE+vw1n2v9dG0ljL7PNQ+azYdlWyyZ+OwCb0wzb
	 v03iqZ+CYJ2ytZAxFxn5rCjFS4MEUL9GWC8vNXcKx0AmT2o1NUhxN+RwEmTNJP2D/6mvx
	 i8SCiDfO/YfkGvOw9tI7QhOEruNMZe2RKMZKYlisXUG1cXwuOAa2KQMjtqjU1ewCDO6Rt
	 s+SvOCoAOKZ9rWFSXjV5+j3M4E5DfJe17a42tMaKWm2BhAbrjh+w5toGXh/S9jL2+khQ0
	 PoKuA4AG1Re05EeFbge0WaAl24SHw73U63+ejIX6cuGEmLikIM7OUJ1IcYELpF7x/xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G4EDqyt6;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D0D606A31A
	for <linux-usb@vger.kernel.org>; Sat, 31 Oct 2026 04:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13D0D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G4EDqyt6
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a210470b49so10553045e9.2
        for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 21:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793419577; x=1794024377; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d2drzBfyOi4dqr6uPeqMUIsHsOJPQ5QZohftfAKluoM=;
        b=G4EDqyt6lxvciOLHESVLykVrOchKWhT2tAAEWO5CJfwbj6LztgWmnpa72A9BtcygFf
         +Z4ck98CQ+ohn9hpXBqVyo60R9P8ycSwpKOKf3S6SId118tk3DQxkkfqQPgRGNJwzV0I
         /zIyyTomIXJbbvJMpn0AbCrDgkXI5RoADW0LQossjKr81b+tJPv6sfY3bMDVaLq01LJT
         CGOHgYVB9/n957cyAcwqC47QhBXWMTjDYHoBmaiEBQozgelssgNXWMuWI+PlYeFpQkFw
         xmqSGzTWzE+IMbDoslOHrJ+sE0f2epHLc80uFnbQVNtUs0Oa9RdMsDvZzhAJ5RZXwizu
         3IHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793419577; x=1794024377;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d2drzBfyOi4dqr6uPeqMUIsHsOJPQ5QZohftfAKluoM=;
        b=y/PrFiWkCMBLvAHkBH9hnekHAvxXqlITXTExa0hA0AmqVFAZ2TPI5XcnsdHs0OTIOx
         T62ntHxTwq9H7D15EL5NlLyS8XRh+x9fYGvX/iIE6SbvTbhmTZN/f0TV9JcwAMUiqYoa
         nO7e32nVi7CbhKeLqe12yLDXopExqqoVZt00TLS/67LKUHt5zAwbHdDR2YqE/RU84UFI
         tA9NGXtLyRpsOUMFQTcDRWKQl1jNjMiLLqEgV3xpwAcCQuXLZHWdtgbYlLZrThVtIh1R
         Z1cLDbCln6WTkDRvk2tpu4E7rjCYUYHYGHOvdJeEf8Fwuc8OT0FLXBKGJkik1pVw6ava
         OqYg==
X-Forwarded-Encrypted: i=1; AKwUvBw7KBM2H6IGo7NgbOpaT8gLZbGaUoLAN0BOYvYtTj+Ho6m+j1Ata2T/gKmEUd+41KegWr1i5V58mxg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2rbihd3nmlsehCu2P4RGJy8zFr5i7DNJeWa9n2ytBxf36AFIY
	sVePYTMXq9kIuUMzu2tSeKn3KubJZYzGS9p8/O2hAvp9ZIoHlpffMV4t+4HVLOaI
X-Gm-Gg: AYBFou2VsOqx61MttBzWjVBrQTSciKzphOCZWf8a8/9pWdv5OoZXdo8+JzBKF5Gsa0J
	/n/4ETLqhEpfIiRWzWvA7jplNdnFfhMeoq9s5mAyyrKuMaElziMnu8le5Nx2xBsp00nsNZo7h5I
	Z/v0BUL2pT8l7FDm8p9KN10a1DESTYFfsPhbB6b9wqupJ8lEBWujlQ5f0c8BmYp6Nm7lEeDd0or
	QbVJZfyEm0RKn5sdOKvgE2Fa2o0YQ9AZsnP+F9swm3JF0FQToT2/OFaUla0ETEqMX7QXtPcKwk6
	g+I43v1Gt8RWiSrn4nCJB/yE6VPAavAmJ8tKCn0VCgQuX9j7get4hxMGRpU/jYwf+3g0B5fVzcw
	Uc1Hm70eMwRYJpYu6k4PPtJ5N8so9vf9Y53BqkKRT6IRRtgQ8ibXYSfLdlXeKRKgQXAvslw5lfl
	SnSL/S0Ww5/xLQouPPYBiZVjwSnoo9B42DmFlf04MUR2i6WA5vDm/FvUW/uNkTzvSQT6FJTeCUS
	ENQrwf6QfzXFWF1jz0dMTcWtA0KutfGAs1CgbYoFt0F+w6HRXpBAULYwxXwiSjzBSTapehFIo6u
	7JCWvHJ4dKfQ4KauJI9V0b9MTBl7yff9+J29ZA==
X-Received: by 2002:a05:600c:8b85:b0:4a1:cd83:b23e with SMTP id 5b1f17b1804b1-4ac122897a8mr112944805e9.0.1793419577347;
        Fri, 30 Oct 2026 21:06:17 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm171282185e9.2.2026.10.30.21.06.16
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 30 Oct 2026 21:06:17 -0700 (PDT)
Date: Sat, 31 Oct 2026 05:06:03 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
 regressions@lists.linux.dev, Yiyu Zhou <yiyu@yiyuzhou.io>, Dennis Wissel
 <dennis@dsine.de>
Subject: Re: [PATCH v2] xhci: give back TDs and clean up ep0 after
 disconnect
Message-ID: <20261031050603.6067d2e5.michal.pecio@gmail.com>
In-Reply-To: <20261029204324.658845-2-mathias.nyman@linux.intel.com>
References: <20261029204324.658845-1-mathias.nyman@linux.intel.com>
	<20261029204324.658845-2-mathias.nyman@linux.intel.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 29 Oct 2026 22:43:24 +0200, Mathias Nyman wrote:
> From: Yiyu Zhou <yiyu@yiyuzhou.io>
> 
> Fix a regression in v7.3 introduced by the commits in the Fixes tags.
> Those patches avoid endpoint recovery and rapid state changes after
> the root port link is lost.
> 
> This caused a regression in device enumeration.
> 
> It turns out that a subset of USB HID devices briefly disconnect during
> enumeration. USB core manages to resuscitate these devices without
> reallocating them, and thus continue using the same udev, xhci vdev and
> default control endpoint (ep0) of the device.
> xhci didn't give back or clean up halted TDs behind disconnected ports
> as it assumed that the disconnect cancels all URBs, and drops and frees
> all endpoints.
> 
> This is not the case, so cancel and give back TDs on halted endpoint
> behind disconnected ports, make sure ep0 is cleared and in a proper state
> to continue working even after a link error or disconnect is detected.
> Also prevent new URBs until device is reset.
> 
> One issue related to the TDs not being given back was seen on a PFU
> HHKB Professional HYBRID Type-S keyboard (04fe:0021).
> It drops off the bus about 300 ms after its first enumeration, while
> usbhid is still probing its third interface. The probe runs in hub_wq,
> so the disconnect is not handled until the probe returns.
> On a root port the HID descriptor request and its four retries in
> hid_get_class_descriptor() each wait for the full 5 second
> USB_CTRL_GET_TIMEOUT:
> 
>   [57685.006036] usb 3-2: new full-speed USB device number 24 using xhci_hcd
>   ...
>   [57685.291304] hid-generic 0003:04FE:0021.0017: input,hidraw1: USB HID v1.11 Keyboard [PFU Limited HHKB-Hybrid] on usb-0000:00:14.0-2/input1
>   [57711.221083] usbhid 3-2:1.2: can't add hid device: -110
>   [57711.221613] usbhid 3-2:1.2: probe with driver usbhid failed with error -110
>   [57711.221842] usb 3-2: USB disconnect, device number 24
> 
> [mn: merge EP_DROP_PENDING and link_inactive checks in xhci_urb_enqueue(),
>  return TDs and clean up ep0 on disconnect, rewrite commit message]
> 
> Fixes: 042aad8d0db6 ("xhci: prevent endpoint recovery after roothub disconnect")
> Fixes: 7e0ef4332ed9 ("xhci: avoid xHC endpoint changes after disconnect or link error.")
> Closes: https://lore.kernel.org/all/20261010071811.20483-1-yiyu@yiyuzhou.io/
> Closes: https://lore.kernel.org/linux-usb/4MjB9K-2SoiA85WbI9iEig@dsine.de/
> Tested-by: Yiyu Zhou <yiyu@yiyuzhou.io>
> Tested-by: Dennis Wissel <dennis@dsine.de>
> Signed-off-by: Yiyu Zhou <yiyu@yiyuzhou.io>
> Co-developed-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---
> 
>  v2 changes:
>  - rebase on usb-linus
>  - remove Assisted-by: LLM as suggested by latest checkpatch
> 
>  drivers/usb/host/xhci-ring.c | 73 ++++++++++++++++++++++++++++++------
>  drivers/usb/host/xhci.c      | 13 ++++---
>  2 files changed, 69 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index c23434001e9c..a1fa188680f5 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -65,6 +65,7 @@
>  static int queue_command(struct xhci_hcd *xhci, struct xhci_command *cmd,
>  			 u32 field1, u32 field2,
>  			 u32 field3, u32 field4, bool command_must_succeed);
> +static void xhci_kill_endpoint_urbs(struct xhci_hcd *xhci, int slot_id, int ep_index);
>  
>  /*
>   * Returns zero if the TRB isn't in this segment, otherwise it returns the DMA
> @@ -962,6 +963,24 @@ static void xhci_giveback_invalidated_tds(struct xhci_hcd *xhci, struct xhci_vir
>  	}
>  }
>  
> +static void xhci_cancel_ring_tds(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
> +				 struct xhci_ring *ring, int td_status)
> +{
> +	struct xhci_td *tmp_td;
> +	struct xhci_td *td;
> +
> +	/* Add all TDs on ring to cancelled td list */
> +	list_for_each_entry_safe(td, tmp_td, &ring->td_list, td_list) {
> +		if (list_empty(&td->cancelled_td_list)) {
> +			list_add_tail(&td->cancelled_td_list,
> +				      &ep->cancelled_td_list);
> +			td->cancel_status = TD_DIRTY;
> +			if (!td->status)
> +				td->status = td_status;
> +		}
> +	}
> +}
> +
>  static int xhci_reset_halted_ep(struct xhci_hcd *xhci, unsigned int slot_id,
>  				unsigned int ep_index, enum xhci_ep_reset_type reset_type)
>  {
> @@ -993,25 +1012,53 @@ static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
>  {
>  	struct xhci_port *rhub_port = ep->vdev->rhub_port;
>  	unsigned int slot_id = ep->vdev->slot_id;
> +	bool disconnected = false;
> +	struct xhci_ring *ring;
>  	int err;
>  
> -	/*
> -	 * Avoid resetting endpoint if link is inactive or device disconnected.
> -	 * Can cause host hang.
> -	 * Device will be reset to recover an inactive link, so don't do anything
> -	 */
> +	/* link is inactive or device disconnected */
>  	if (rhub_port->link_inactive || !rhub_port->connected) {
>  		ep->ep_state |= EP_DROP_PENDING;
> -		return -ENODEV;
> +		disconnected = true;
> +		if (!td && ep->ep_index != 0) {
> +			xhci_kill_endpoint_urbs(xhci, slot_id, ep->ep_index);
> +			return -ENODEV;
> +		}

The duplicate xhci_kill_endpoint_urbs() call wouldn't be necessary if
the later code which also calls it could handle this edge case.

(And my patch showed how 'disconnected' variable can be omitted too.)

>  	}
>  
> -	/* add td to cancelled list and let reset ep handler take care of it */
> -	if (reset_type == EP_HARD_RESET) {
> -		ep->ep_state |= EP_HARD_CLEAR_TOGGLE;
> +	/* Add halted td to cancelled list and let reset ep handler take care of it */
> +	if (reset_type == EP_HARD_RESET || disconnected) {
>  		if (td && list_empty(&td->cancelled_td_list)) {
>  			list_add_tail(&td->cancelled_td_list, &ep->cancelled_td_list);
>  			td->cancel_status = TD_HALTED;
> +			if (disconnected && !td->status)
> +				td->status = -EPROTO;

That's confusing (speaking from experience, heh). It could simply be

  if (reset_type == EP_SOFT_RESET)

because that's the only valid reason for td->status being 0 here.

> +		}
> +	}
> +
> +	/*
> +	 * Avoid resetting non-ep0 endpoints if link is inactive or device
> +	 * disconnected. Can cause host hang.
> +	 * Endpoints other than ep0 won't restart before the device is reset or
> +	 * the endpoint is dropped, so cancel all TDs, and give back non-ep0 TDs
> +	 * now instead of letting them time out. Ep0 can survive a short device
> +	 * disconnect during enumeration so reset ep0 normally and clean it up.

I don't think this is limited to enumeration. Indeed, probe() is not
enumeration. I see no reason why the same can't happen at any time.

> +	 */
> +	if (disconnected) {
> +		ring = td ? xhci_urb_to_transfer_ring(xhci, td->urb) : ep->ring;
> +		xhci_cancel_ring_tds(xhci, ep, ring, -ESHUTDOWN);

So that's why we bail out on (!td && ep->ep_index != 0) several lines
prior, to avoid NULL dereference. A bit complicated, this may work too:

  if (ring)
	xhci_cancel_ring_tds(...)

I think it's harmless that we could then call xhci_cancel_ring_tds()
and  xhci_process_cancelled_tds() on non-zero endpoints sometimes?
Stop EP handler also calls that stuff after setting EP_DROP_PENDING.

What Stop EP fails to do is giving back stranded URBs after setting
EP_DROP_PENDING. I have suggested how this can be done by simply
moving this code added here to elsewhere.

> +		if (ep->ep_index != 0) {
> +			xhci_dbg(xhci, "Not resetting ep %u slot %u after disconnect\n",
> +				 ep->ep_index, slot_id);
> +
> +			xhci_process_cancelled_tds(xhci, ep);
> +			xhci_kill_endpoint_urbs(xhci, slot_id, ep->ep_index);
> +			return -ENODEV;
>  		}
> +		/* hard-reset a halted disconnected ep0 */
> +		xhci_dbg(xhci, "Reset and clean up ep0 slot %u after disconnect\n",
> +			 slot_id);
> +		reset_type = EP_HARD_RESET;
>  	}
>  
>  	if (ep->ep_state & EP_HALTED) {
> @@ -1020,6 +1067,9 @@ static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
>  		return 0;
>  	}
>  
> +	if (reset_type == EP_HARD_RESET)
> +		ep->ep_state |= EP_HARD_CLEAR_TOGGLE;

Wasted opportunity to place this after actually queuing the command,
which is the only place it really belongs.

> +
>  	err = xhci_reset_halted_ep(xhci, slot_id, ep->ep_index, reset_type);
>  	if (err)
>  		return err;
> @@ -1070,8 +1120,9 @@ static int xhci_invalidate_cancelled_tds(struct xhci_hcd *xhci, struct xhci_virt
>  			continue;
>  		}
>  
> -		/* device disconnected or link error, ep will be dropped */
> -		if (ep->ep_state & EP_DROP_PENDING) {
> +		/* device disconnected or link error, non-ep0 endpoints will be dropped */
> +		if (ep->ep_state & EP_DROP_PENDING && ep->ep_index != 0) {
> +			td_to_noop(xhci, ep, td, false);
>  			td->cancel_status = TD_CLEARED;
>  			continue;

I don't like this growth of special cases and duplication in the big
loop over cancelled_td_list. Although my attempt at eliminting it did
have an issue, there has to be a better way...

>  		}
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 30ac1bc4559b..b50a582be1fb 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -1665,12 +1665,6 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
>  		goto free_priv;
>  	}
>  
> -	if (xhci->devs[slot_id]->rhub_port->link_inactive) {
> -		xhci_dbg(xhci, "Can't queue urb, port error, link inactive\n");
> -		ret = -ENODEV;
> -		goto free_priv;
> -	}
> -
>  	if (xhci->xhc_state & XHCI_STATE_DYING) {
>  		xhci_dbg(xhci, "Ep 0x%x: URB %p submitted for non-responsive xHCI host.\n",
>  			 urb->ep->desc.bEndpointAddress, urb);
> @@ -1680,6 +1674,13 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
>  
>  	ep_state = &xhci->devs[slot_id]->eps[ep_index].ep_state;
>  
> +	if (xhci->devs[slot_id]->rhub_port->link_inactive ||
> +	    *ep_state & EP_DROP_PENDING) {

Actually, what was the purpose of 'link_active' and 'connected' being
two separate flags? It seems everything treats them the same (modulo
negation), except here.

And here it doesn't matter either, right? You haven't added 'connected'
because EP_DROP_PENDING is the only one needed for correctness, and
'link_inactive' is merely an optimization to avoid queuing URBs which
will be thrown out later, preserved because it was already there.

Or at least that's what it seems, in absence of any explanation.

> +		xhci_dbg(xhci, "Can't queue urb, port disconnect or link inactive\n");
> +		ret = -ENODEV;
> +		goto free_priv;
> +	}
> +
>  	if (*ep_state & (EP_GETTING_STREAMS | EP_GETTING_NO_STREAMS)) {
>  		xhci_warn(xhci, "WARN: Can't enqueue URB, ep in streams transition state %x\n",
>  			  *ep_state);
> -- 
> 2.43.0
> 
