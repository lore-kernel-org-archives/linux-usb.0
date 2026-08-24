Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9543F36655D
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 09:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787564458; cv=none; b=GjxDkcjz4wvW5WEyGngowZeMzj/yi9IeFM+dfhfe5Uyh+XZzQ5BoJp08sSuwc+3aQaMnzO9R6PdDHePoJkO01pCs9ZewnNjdoxerhsompDhY6h8GnLLRDOTtFWVTb4kPUGn13Dj1Wulu/j2m2G2SiHkR/ceW7g8Gw3jJV2DPNxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787564458; c=relaxed/simple;
	bh=ImQJpv/OEtoJ9A5nK5vyImd71Pav/vedIovbWZGrJCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kVqJLtMZdaFhqdjHiB5c++XlSsQXcIzS36yrMQ/Cr042Dh/U8UXvmfNPNLWHumoQ8Kx1HI3zfkmeGI12AWZImUmt1pLlYHIf1uX/xWf0N4S2fg+NQDVuFtbvqQipAbC2xSb3QFj5vU56nv5pqmzCKRPUsTkHtYZnaiF9I02EFns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oUF4d1y2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oUF4d1y2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF4F01F00A3A;
	Mon, 24 Aug 2026 09:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787564453;
	bh=6695d4kEr0RA+nFyNA7Uzh6uGeu2jzwM1kWcCFergPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oUF4d1y2BCl+3H3sTKAvC63j7pG7Ng44VYIYxvXbFMO64/UXWWL0n+mohSReyaDTx
	 /KracNQFcLYiIBHSMyJhkc+4wjz40oFIbYO+HLvCraICBq/SvHNpFQZVMvJz9jqa2P
	 J5z4BGwAj6yHLezmVQkK4FycKGDXOgF/mTMni+yo=
Date: Mon, 24 Aug 2026 11:40:49 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mikhail Zubenko <misha.zubenko.01@yandex.ru>
Cc: linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v3] usb: gadget: dummy_hcd: add tick_us module parameter
 for timer-rate tuning
Message-ID: <2026082436-foothold-domain-52ec@gregkh>
References: <178750530003.146199.10916428504166445366@yandex.ru>
 <178756274250.132278.16353756984865264330@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178756274250.132278.16353756984865264330@yandex.ru>

On Mon, Aug 24, 2026 at 09:12:22AM -0000, Mikhail Zubenko wrote:
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

As per the documentation, the changes go below the --- line, right?

thanks,

greg k-h
