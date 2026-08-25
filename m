Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784A3242D88
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 01:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787622175; cv=none; b=SZ5jVjoe19i1spnAunbkrD4LjvvZ71keRdV5esDMX8Nq77bwj6bZokKxwNbqUnAH1+uFkS+4u2i+h7TqJ0aSGvS3imWgqcZNySauCRvqfYVqHazx2fLhquxZhKys6yzxdb37yOUY76yIFvGSyXOZxbYEkbAq5Jy1+CSNB1fn0xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787622175; c=relaxed/simple;
	bh=zTay8OAsDLV3vcdRBxeHUGdw3vu3+CcjcbH8DxRian0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Txu+f35BlUMC+QjwDWFdUKwX6eKi3JXh0EwLZRvQOJkaXBfpTQghWQM9rcruRlWiEQ7Yw8M2aEakRYiS3OVFWm9A26LWnaBbawWkeYDtS0xzmtaFwPCRyMjNzg5Jfj4NObgeKFGpPnB5t3KT5WiqPggtzb/w99DG4D5g9+g+2/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=p3Mii3w/; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="p3Mii3w/"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-936c02e58dfso233506085a.3
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 18:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787622172; x=1788226972; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Eifx8CZlL3+alMwC39QvRCDYUiy7mlTJnBcP0ucsqBw=;
        b=p3Mii3w/M+cMOfmQEzZOAqJLhzInMKP0Oce22LKYjlMc8cIqhSTKBJ4R+H4uZYDmx3
         do+xahVzpICW+K6n2vwgS7LVHXLxqDbVULl/WfrM/YPvx86VxBDMK9GhK5FRa4Yx2Iue
         4Ts2vPuKhKDMZiIvyPeL2V5hNvbuPoifhyWyuBbzkFr9NzftCizpzUDe5ntA4/jj8SCQ
         ++OYxXv4akFHASe4p1eEGQBjnlXxkB1grfbftFDfRG/BNcPqyZI7NNyoNgW8leE7bxo0
         hOf9BcZ35w/4ZdJJFq0p0is93UmlOIqt3t2yYgpJR5HgtJPtXduGxl0SRg+eQfXrOOTy
         9sWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787622172; x=1788226972;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eifx8CZlL3+alMwC39QvRCDYUiy7mlTJnBcP0ucsqBw=;
        b=WW6crOZYue22mCZexzjaQdQcW1o5oxBqNndI35ko9wnIaoefA5/PluNzMaMf7bCeE4
         peozXyduA0Y7RRDlrIi5rRnzJo3EbPckESHXEguWkOzgNHphnsXBjJFWjHyoBDYTVHIX
         /kXOsc+AVZigWPBYZyXbpXspcLl/dznkdKAz9L2qBcLAxT3NQzWDxXtjFwgA1FXQ2Aze
         U7Jp+KYc2QtbqeMrTh4PmlIHDLCaG33ouWRn+VexMvn3UvNta3dsqAg4bFhf0XT+hSLN
         xF1tCFmcS1lS4TIdSmaCqjwqM/CBUklYd2ZUr6lr74xssoBidQL/l2PYPzD0GsOIq6nr
         VdnQ==
X-Gm-Message-State: AFuF++myHryKQq9KpG4cPj3sTTT21aSzKek8RIX4vli4Jm7jO5IuNQpH
	ewHPTvNQHk+9sZTRsT4x5bRU45wV2VE7PYo/55tGkLAXMFF3Hn/Tk5f17+kt1wtHq1YW9Fe10wV
	BHX0YWg==
X-Gm-Gg: AR+sD12YeS/U5Oxw6eiqSsOA2uMsWT7wXR4yleVCkqMjY38Wk64Iihh4u+5KmGV6scX
	JkOvy7MRVklCXxG/OlMBANwSFBPjjLjCVj5Wj49/QRl/mmC45Fhp5lIjfmKARAw+CPlC0FHEMQc
	I0+klrNXiYNurEBWIAm+vUNwpsAwAcM/cb1IKNduFF8LDC+yq1gAiQqk9fGr9PWzED6Nh3QJ8X9
	JNzbmd++RLiEsVst6bZ6JRhbyR4qiHxjlrL+A1EUNhxRvB6elFkJJpfQmHOLrBrQl4ZZ6sEKDd9
	VtjLfx6xBlWwba6VF6jwrtE05ukyqNdMMnY3tTdJElox5NXcHvGeu7N1cFRsObOtjvWmA2Lr/IK
	COxevSDPuVKvR7rHs679zb6LcGNvzehRte62OsDKp8JnqC7JouNO1lxMizYHsabk2SwG+1n9H92
	er2rCMQAInfhBqm+uWycfGPuXY23l1O8yDHEEb4l9iSy3sS1HIxu+ZXC+pPJN8GUBy6zxRwcyh
X-Received: by 2002:a05:6214:598e:b0:8de:ca40:c3b5 with SMTP id 6a1803df08f44-90cb7c5bb53mr32012876d6.31.1787622172147;
        Mon, 24 Aug 2026 18:42:52 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c93a5a1e6sm75111646d6.39.2026.08.24.18.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 18:42:51 -0700 (PDT)
Date: Mon, 24 Aug 2026 21:42:49 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mikhail Zubenko <misha.zubenko.01@yandex.ru>
Cc: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v5] usb: gadget: dummy_hcd: add tick_us module parameter
 for timer-rate tuning
Message-ID: <24ec79bf-6b2c-4fc9-99a1-022ba19b8dcb@rowland.harvard.edu>
References: <178750530003.146199.10916428504166445366@yandex.ru>
 <178758686883.288478.6637939361965647417@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178758686883.288478.6637939361965647417@yandex.ru>

On Mon, Aug 24, 2026 at 03:54:28PM -0000, Mikhail Zubenko wrote:
> dummy_hcd services URB completions from an hrtimer callback that
> rearms itself with a fixed 125 us delay (one high-speed microframe)
> for as long as any URBs are queued.  Against a permanently polled HID
> interrupt endpoint the queue never drains, so the timer runs at ~8 kHz
> regardless of actual traffic.
> 
> On timer-rate-sensitive platforms (observed on one consumer AM4 board
> with a current BIOS and a stock kernel) this timer rate co-existing
> with a live Bluetooth session on the machine's real xHCI controller
> resulted in a hard, below-software platform hang: printk, SysRq, NMI
> and both watchdogs died in the same instant, with no panic, no MCE,
> and empty pstore.  13 occurrences over 5 days, reliably reproducible
> with that configuration (hangs within 20 min to 2.5 h of uptime).
> The same workload with the emulated microframe lengthened to 1000 us
> (this parameter) ran ~8 hours with zero hangs, and USB-cable sessions
> (identical gadget traffic, no Bluetooth co-existence) never hung.
> 
> Note that lengthening the emulated microframe makes the emulation run
> slower than a physical device would; users of the parameter trade
> that emulation fidelity for interrupt-rate headroom.
> 
> The per-frame bandwidth budget in dummy_timer() does not scale with
> the emulated microframe length; making that accounting microframe-
> correct is planned as a follow-up patch.  Otherwise nothing in the
> driver's behaviour depends on the emulated microframe length.
> 
> Default keeps the current 125 us behaviour bit-for-bit (and defaults
> to 1000 us for full-speed emulation, where the natural unit is the
> 1-ms frame).  Values below 125 are rejected.
> 
> Signed-off-by: Mikhail Zubenko <misha.zubenko.01@yandex.ru>
> ---
> Changes in v5:
> - remove a leftover blank line where the macro was (review)
> - spell "(micro)frame" in the parameter description (review)
> 
> Changes in v2 (addressing Alan Stern's review):
> - reword the description: the timer rearms while URBs are queued, not
>   an unconditional "pendulum"; drop the word entirely
> - clarify the xHCI wording: the Bluetooth session lives on the
>   machine's real xHCI controller (platform-level co-existence)
> - move tick_us into dummy_hcd_module_parameters with a custom setter
>   (module_param_cb) that rejects values < 125
> - speed-aware default: 125 us for high/super-speed, 1000 us for
>   full-speed emulation
> - reword MODULE_PARM_DESC per review ("length in microseconds of an
>   emulated microframe")
> - pre-compute the delay into a ktime_t (timer_interval) at setup;
>   remove the DUMMY_TIMER_INT_NSECS macro; explicit (u64) cast so the
>   tick_us * NSEC_PER_USEC product does not overflow on 32-bit
> - parameter is 0444 (load-time only): a runtime write would not
>   affect live controllers
> - note the emulation-fidelity tradeoff and the per-frame budget
>   follow-up in the commit message

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/gadget/udc/dummy_hcd.c | 48 +++++++++++++++++++++++++++---
>  1 file changed, 44 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
> index c0e40fa..3edc4fc 100644
> --- a/drivers/usb/gadget/udc/dummy_hcd.c
> +++ b/drivers/usb/gadget/udc/dummy_hcd.c
> @@ -51,8 +51,6 @@
>  #define POWER_BUDGET	500	/* in mA; use 8 for low-power port testing */
>  #define POWER_BUDGET_3	900	/* in mA */
>  
> -#define DUMMY_TIMER_INT_NSECS	125000 /* 1 microframe */
> -
>  static const char	driver_name[] = "dummy_hcd";
>  static const char	driver_desc[] = "USB Host+Gadget Emulator";
>  
> @@ -66,6 +64,31 @@ struct dummy_hcd_module_parameters {
>  	bool is_super_speed;
>  	bool is_high_speed;
>  	unsigned int num;
> +	unsigned int tick_us;
> +};
> +
> +/*
> + * Length in microseconds of an emulated microframe.  The default (125,
> + * one high-speed microframe) preserves the historical timer rate; larger
> + * values slow the emulated controller down and reduce its interrupt-rate
> + * pressure on the host platform.  Values below 125 are rejected.
> + */
> +static int tick_us_set(const char *val,
> +		const struct kernel_param *kp)
> +{
> +	unsigned int v;
> +	int ret = kstrtouint(val, 0, &v);
> +
> +	if (ret < 0 || v < 125) {
> +		pr_err("dummy_hcd: tick_us must be >= 125\n");
> +		return -EINVAL;
> +	}
> +	return param_set_uint(val, kp);
> +}
> +
> +static const struct kernel_param_ops tick_us_ops = {
> +	.set = tick_us_set,
> +	.get = param_get_uint,
>  };
>  
>  static struct dummy_hcd_module_parameters mod_data = {
> @@ -79,6 +102,9 @@ module_param_named(is_high_speed, mod_data.is_high_speed, bool, S_IRUGO);
>  MODULE_PARM_DESC(is_high_speed, "true to simulate HighSpeed connection");
>  module_param_named(num, mod_data.num, uint, S_IRUGO);
>  MODULE_PARM_DESC(num, "number of emulated controllers");
> +module_param_cb(tick_us, &tick_us_ops, &mod_data.tick_us, 0444);
> +MODULE_PARM_DESC(tick_us,
> +		"Length in microseconds of an emulated (micro)frame (default 125 for high/super-speed emulation, 1000 for full-speed); larger values reduce the interrupt-rate pressure on the host platform");
>  /*-------------------------------------------------------------------------*/
>  
>  /* gadget side driver data structures */
> @@ -244,6 +270,7 @@ struct dummy_hcd {
>  	struct dummy			*dum;
>  	enum dummy_rh_state		rh_state;
>  	struct hrtimer			timer;
> +	ktime_t				timer_interval;	/* emulated microframe length */
>  	u32				port_status;
>  	u32				old_status;
>  	unsigned long			re_timeout;
> @@ -1329,7 +1356,7 @@ static int dummy_urb_enqueue(
>  	/* kick the scheduler, it'll do the rest */
>  	if (!dum_hcd->timer_pending) {
>  		dum_hcd->timer_pending = 1;
> -		hrtimer_start(&dum_hcd->timer, ns_to_ktime(DUMMY_TIMER_INT_NSECS),
> +		hrtimer_start(&dum_hcd->timer, dum_hcd->timer_interval,
>  				HRTIMER_MODE_REL_SOFT);
>  	}
>  
> @@ -2029,7 +2056,7 @@ return_urb:
>  			dum_hcd->rh_state == DUMMY_RH_RUNNING) {
>  		/* want a 1 msec delay here */
>  		dum_hcd->timer_pending = 1;
> -		hrtimer_start(&dum_hcd->timer, ns_to_ktime(DUMMY_TIMER_INT_NSECS),
> +		hrtimer_start(&dum_hcd->timer, dum_hcd->timer_interval,
>  				HRTIMER_MODE_REL_SOFT);
>  	}
>  
> @@ -2509,6 +2536,7 @@ static DEVICE_ATTR_RO(urbs);
>  static int dummy_start_ss(struct dummy_hcd *dum_hcd)
>  {
>  	hrtimer_setup(&dum_hcd->timer, dummy_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_SOFT);
> +	dum_hcd->timer_interval = ns_to_ktime((u64)mod_data.tick_us * NSEC_PER_USEC);
>  	dum_hcd->rh_state = DUMMY_RH_RUNNING;
>  	dum_hcd->stream_en_ep = 0;
>  	INIT_LIST_HEAD(&dum_hcd->urbp_list);
> @@ -2538,6 +2566,7 @@ static int dummy_start(struct usb_hcd *hcd)
>  
>  	spin_lock_init(&dum_hcd->dum->lock);
>  	hrtimer_setup(&dum_hcd->timer, dummy_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_SOFT);
> +	dum_hcd->timer_interval = ns_to_ktime((u64)mod_data.tick_us * NSEC_PER_USEC);
>  	dum_hcd->rh_state = DUMMY_RH_RUNNING;
>  
>  	INIT_LIST_HEAD(&dum_hcd->urbp_list);
> @@ -2828,6 +2857,17 @@ static int __init dummy_hcd_init(void)
>  		return -EINVAL;
>  	}
>  
> +	/*
> +	 * The emulated microframe length defaults to one high-speed
> +	 * microframe (125 us).  When neither is_high_speed nor
> +	 * is_super_speed is set the emulation is full-speed, where the
> +	 * natural scheduling unit is the 1-ms frame, so default to
> +	 * 1000 us instead.
> +	 */
> +	if (!mod_data.tick_us)
> +		mod_data.tick_us = (mod_data.is_super_speed ||
> +				    mod_data.is_high_speed) ? 125 : 1000;
> +
>  	for (i = 0; i < mod_data.num; i++) {
>  		the_hcd_pdev[i] = platform_device_alloc(driver_name, i);
>  		if (!the_hcd_pdev[i]) {
> -- 
> 2.43.0
> 
> 
