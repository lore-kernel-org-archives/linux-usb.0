Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAB02F8E99
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 14:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787581636; cv=none; b=I+AInT0zU2q0N1GSw1m48kgJBFTmFXQGdmTnii82BB8mDfdFJ9mkuPUn6impLKWWQR0rfU6TuoT7u4T5IwFvhEtQ64mBQmGgUb277vHLiEXiWeZ+uLJHkv8UM2Ej5AtFea2RqvVe0r6Qr2NNMs2aEO/IH72Osc0+xuWwkdfyslQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787581636; c=relaxed/simple;
	bh=17UBZk34lPopDXmieWd2s9tscjGGcFQK0MM+CYORh1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Royjo5PX+fW368JmeCdlbz5CR81G6+5jIjDPZWzViLtSM34hBe2UTLo8zNytSGywUx/iQzZwRikxsWgozIgtF/7+AT97cb2upZAAfhbHHmZjS8caCFDOXvAIhP9bsqDHMFT6evscVrAa+QbZh2YgznIILyc8RqpsXBFGm1e7xCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=IEuUgvrv; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="IEuUgvrv"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-52d590ce5cdso24179821cf.1
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 07:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787581634; x=1788186434; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QV06IDcP1xXH3o0cLiRLxqb8ODpmEQWpU3EW3R37jNg=;
        b=IEuUgvrvmJkvOuSHV+UtJg3OXzruNr/jT/70Iw4gCbrqL4VGiWcbz1QKhALfkXov0c
         /S1cG4+MbQ0wOnbi0DIDLN+uRdUa29krlG/TTfU1q4bmGM6jneH/WOnFUPQ5NKn1RRrC
         wpFixTq7G+zTmtSF2bVQDUdu+ShfqDxYtryWB2dY9HYQIoTSdWmYhX46JEiou4HSl+Fi
         g+xK/VybJLMYDrJThX/cyP8wAJcmxm9QmusnsMWoHFEh4BMxSBIssdRbnXnbgBjPdkSf
         QQqhlcqGMXirU2dEB4FhqnA9Kdq9vPsSosZ/nfAF7Af8MnefvJ5msjc6LNK+HEFqy7bz
         pd2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787581634; x=1788186434;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QV06IDcP1xXH3o0cLiRLxqb8ODpmEQWpU3EW3R37jNg=;
        b=Xw92DCZvvqfN8FAvluw3BdP08FnQhNpTLMTmh0IjNogb5BCSPbhDitOIAMNaGq9t+o
         gCsFzHL5vpx0umP2scBKZHon0XplOxBcN2U7O/6tKyGJNRobWHcRP2fhfHiUzS2H+sNW
         Nbsj0yJFLAZtdSIjnQY/J+KikayUmrBcX678y0GGjM7bVGPAMgKJIOpdEheO54dMaHYu
         RL6P/GBKidmlOdML2kGtmVwiTozHK3fBVghRn+GL4xqcDWIjrApI8MPzgPuZ5mU11dpm
         W+v8qSeKhRiIC4u9T9TTbL/PqfkLmBhStLbL4kuQft3O/rldE/NMy4Yy5zeOtMaR6JS8
         ro+Q==
X-Gm-Message-State: AFuF++lE1xNgGoRS76Fd+tG4ysx4u0Z50rvXJSOHOfBCYdxcRFHy2eTb
	KNgpkIxytQvVh8kaEOwF7/arj1p64Rlkoa36/S+nBKhiP9ZqeNaAr9MzMXUJrYeOsA==
X-Gm-Gg: AR+sD10XbKr14eMjgzivNnmd4YDQulNzyGA9C3ctyNbV+sM3mNfmUFWz1ZunjIGAAO+
	1M/J5UTE9z3+qVBTE6Vs+Ub0oBQ2SRzzFpOhoSN17/zmmF9560fcQEvzC8HHZ/PI7LaLZvBb+Y8
	hDspq37CW7VptpQdtelP6ckkYUNL3GMenakAtNCTM6qpGzv1ydc8u8x23GckZE72OHjSwhEcJ1X
	zFNayv3PYa25oBEdYASUPq0Oj0pXOPsH9KbqGDhUZSsSjAX5uHh8Q13e68woWiUwrruwTfAbxWu
	1OjZgVmkvhuc9LXygpNa60a/iBcRJPwCrDTbWoJDk4LAP08oeUYHwhUf4K2v36amLuUY67qT8i1
	tQS4gw+tgL1CDBLt8VqmbbC0Zk02o4RhnE4x2VAlr9I0cPFNFz30cE2x1zc143hmkY8Lh8fuJxc
	MqYzcWxes8Dwj6FPG/3opn2XjlN77x1QumfQ3VhcKrgcUaFVg/0V+GI5daGWgHceEt2S+PZLuLz
	mQWEDr67N2fU2Hlqm5mR//GuqNorg==
X-Received: by 2002:a05:622a:53c7:b0:52d:9db2:791e with SMTP id d75a77b69052e-52df59fb83cmr300357541cf.21.1787581633481;
        Mon, 24 Aug 2026 07:27:13 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c9360b07csm64094056d6.17.2026.08.24.07.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 07:27:12 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:27:10 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mikhail Zubenko <misha.zubenko.01@yandex.ru>
Cc: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4] usb: gadget: dummy_hcd: add tick_us module parameter
 for timer-rate tuning
Message-ID: <e5daaf1c-8904-44af-9259-9100906c38d8@rowland.harvard.edu>
References: <178750530003.146199.10916428504166445366@yandex.ru>
 <178756815871.161372.10947114211402415920@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178756815871.161372.10947114211402415920@yandex.ru>

On Mon, Aug 24, 2026 at 10:42:38AM -0000, Mikhail Zubenko wrote:
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

Much, much better.  I have just a couple of very minor quibbles below.

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

Please remove the extra blank line as well.

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

Since the tick_us value can refer either to microframes or frames, 
depending on the speed, write this as "... (micro)frame ...".

Or, if you prefer, make the value always be microframes, with the 
default set to 125 always, and change the calculation of timer_interval 
so that it is 8 times larger when the emulator is at full speed.  In 
fact, if you decide to do it this way, you could put the change to 
timer_interval in the follow-up patch along with the change to the total 
transfer length.

Alan Stern
