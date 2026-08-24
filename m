Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8633932ED
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 08:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787561027; cv=none; b=WwuibK7M67VkCmy/VCGnNRnwj93YUvDwO1bWgvFCoynWLPQ3Tw8gADJg8fkB+3n2XqBkdXSvwbi5CEwolj2IEUS8QPdz7nnbOTy9XHEveMEPZBWcX21gX6gWK3EebQvfSuz8ZONyhQiXWYd1tlfZCi/Y0SkWD7Rbjydf01vY1Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787561027; c=relaxed/simple;
	bh=kC7T7Xyxg/2bJZ84VElK50ruJkrRYPS79Thq+f7HYTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UvU4XCr5KVY18HsYIFs4nMPnDsS1Sv0sDdIpPkdP30kBl4LgGMYi4IglVr9NZtrXO0tQNQHvYo0uATSoFGYTOyjARmqW7bi/5ahDpaB9LxS2ry1esAMoimjHF+QH07906seoomuCl4JEwy5RxRzlcS/FRcHRbO0yKU4sODVbTQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=T7KgqQCQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="T7KgqQCQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C50591F000E9;
	Mon, 24 Aug 2026 08:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787561025;
	bh=shuoDsSLsKq+yfd1PSMhszhGJXjiFN40sW7MYffAlGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T7KgqQCQejCK6gzvJF5QHXi29EU655Otz28hXtqLCQyc45M1lAydXuLsL6+bugIfN
	 AE/8zdbE4oAsfgrm3/31wxqFd2zYxGYOXz0QlFSwI5meNv67Snw7lxQWyFGoKCj2Yw
	 mgDKmGjPvayVcmaP8c2Ya5Ugn3y+yWd5lh8aO4iU=
Date: Mon, 24 Aug 2026 10:43:32 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mikhail Zubenko <misha.zubenko.01@yandex.ru>
Cc: linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v2] usb: gadget: dummy_hcd: add tick_us module parameter
 for timer-rate tuning
Message-ID: <2026082421-release-studied-13cf@gregkh>
References: <178750530003.146199.10916428504166445366@yandex.ru>
 <178756018352.117640.8153545256442877284@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178756018352.117640.8153545256442877284@yandex.ru>

On Mon, Aug 24, 2026 at 08:29:43AM -0000, Mikhail Zubenko wrote:
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
>  drivers/usb/gadget/udc/dummy_hcd.c | 47 ++++++++++++++++++++++++++++--
>  1 file changed, 44 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
> index c0e40fa..0884090 100644
> --- a/drivers/usb/gadget/udc/dummy_hcd.c
> +++ b/drivers/usb/gadget/udc/dummy_hcd.c
> @@ -51,7 +51,6 @@
>  #define POWER_BUDGET	500	/* in mA; use 8 for low-power port testing */
>  #define POWER_BUDGET_3	900	/* in mA */
>  
> -#define DUMMY_TIMER_INT_NSECS	125000 /* 1 microframe */
>  
>  static const char	driver_name[] = "dummy_hcd";
>  static const char	driver_desc[] = "USB Host+Gadget Emulator";
> @@ -66,6 +65,31 @@ struct dummy_hcd_module_parameters {
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
> @@ -79,6 +103,9 @@ module_param_named(is_high_speed, mod_data.is_high_speed, bool, S_IRUGO);
>  MODULE_PARM_DESC(is_high_speed, "true to simulate HighSpeed connection");
>  module_param_named(num, mod_data.num, uint, S_IRUGO);
>  MODULE_PARM_DESC(num, "number of emulated controllers");
> +module_param_cb(tick_us, &tick_us_ops, &mod_data.tick_us, 0444);
> +MODULE_PARM_DESC(tick_us,
> +		"Length in microseconds of an emulated microframe (default 125 for high/super-speed emulation, 1000 for full-speed); larger values reduce the interrupt-rate pressure on the host platform");
>  /*-------------------------------------------------------------------------*/
>  
>  /* gadget side driver data structures */
> @@ -244,6 +271,7 @@ struct dummy_hcd {
>  	struct dummy			*dum;
>  	enum dummy_rh_state		rh_state;
>  	struct hrtimer			timer;
> +	ktime_t				timer_interval;	/* emulated microframe length */
>  	u32				port_status;
>  	u32				old_status;
>  	unsigned long			re_timeout;
> @@ -1329,7 +1357,7 @@ static int dummy_urb_enqueue(
>  	/* kick the scheduler, it'll do the rest */
>  	if (!dum_hcd->timer_pending) {
>  		dum_hcd->timer_pending = 1;
> -		hrtimer_start(&dum_hcd->timer, ns_to_ktime(DUMMY_TIMER_INT_NSECS),
> +		hrtimer_start(&dum_hcd->timer, dum_hcd->timer_interval,
>  				HRTIMER_MODE_REL_SOFT);
>  	}
>  
> @@ -2029,7 +2057,7 @@ return_urb:
>  			dum_hcd->rh_state == DUMMY_RH_RUNNING) {
>  		/* want a 1 msec delay here */
>  		dum_hcd->timer_pending = 1;
> -		hrtimer_start(&dum_hcd->timer, ns_to_ktime(DUMMY_TIMER_INT_NSECS),
> +		hrtimer_start(&dum_hcd->timer, dum_hcd->timer_interval,
>  				HRTIMER_MODE_REL_SOFT);
>  	}
>  
> @@ -2509,6 +2537,7 @@ static DEVICE_ATTR_RO(urbs);
>  static int dummy_start_ss(struct dummy_hcd *dum_hcd)
>  {
>  	hrtimer_setup(&dum_hcd->timer, dummy_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_SOFT);
> +	dum_hcd->timer_interval = ns_to_ktime((u64)mod_data.tick_us * NSEC_PER_USEC);
>  	dum_hcd->rh_state = DUMMY_RH_RUNNING;
>  	dum_hcd->stream_en_ep = 0;
>  	INIT_LIST_HEAD(&dum_hcd->urbp_list);
> @@ -2538,6 +2567,7 @@ static int dummy_start(struct usb_hcd *hcd)
>  
>  	spin_lock_init(&dum_hcd->dum->lock);
>  	hrtimer_setup(&dum_hcd->timer, dummy_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_SOFT);
> +	dum_hcd->timer_interval = ns_to_ktime((u64)mod_data.tick_us * NSEC_PER_USEC);
>  	dum_hcd->rh_state = DUMMY_RH_RUNNING;
>  
>  	INIT_LIST_HEAD(&dum_hcd->urbp_list);
> @@ -2828,6 +2858,17 @@ static int __init dummy_hcd_init(void)
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

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
