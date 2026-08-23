Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8EA238D54
	for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 19:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787514928; cv=none; b=PeAaOODdLTQQ9fMnJJVfe+MciJVh5Dhrq2YP/ThAr33tMkiWnXXGamXTj9JpNdd7I3PRz0Yq/6oH8GCXpc0q5OyaHIxiGOKjHYZxyf8ggo+22DOt/xSA3Zx98WWeuzzUuq3hQpXJo1diILhK4hT24fJ6OZUR0Q0A67nKrKnuTlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787514928; c=relaxed/simple;
	bh=sE/AeBVT5uCAOR6H88Bpd+YsMDgwg3PiE7ny53YJmx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZTrzmsvP8s3czrcl/ZIpPHtkAvYF/DRNezeoAfruR3ep8EK5r+zkmJSrNpp0DYM1foyGBugXpfUqs5qvEU7BWkf6a8d991YpuvYjh8uWAU0ss8lhcsGpU/gfSCksk/3e9zQWXmO6ZNkxCyb6k62xSOCHC/NzVkof4/LJ7F93x7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=M4pmbu98; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="M4pmbu98"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51bfa429aa6so21465641cf.0
        for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 12:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787514926; x=1788119726; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TYDMSaZfqlke/cTNoW6dHQJ4b8R/xo2ZcKlABOWXmtk=;
        b=M4pmbu98adRisEqy4RyWrMyT6tE/PPEu9cDME2VoJc9MNySoiJ266OWr5eObQXyLx6
         Rioh+4w3nkrMjbEzF1UAy4yDviSGtrWafq6g3JIXncv8a21m5R8FlOifDYxedXfS+88S
         pDF0jBgZTmH1fD4VSoEU4oblsgwlbJf4TxdMV1YKz3pKOidrOw+zuS7kXDymlLaY9+Jl
         5/uHWpPVFVJKTAnLSO6Ah6jRT2y7Zmdeq1RUqs//OBIYEEu7C2IwNRdiJKnimyMomYo2
         CaynV/v8nM/BURrNgntzDvQdXT0FBzScUGxfXHfuNninfth8g7uNgvQkbnpGsRZrgELG
         EZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787514926; x=1788119726;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TYDMSaZfqlke/cTNoW6dHQJ4b8R/xo2ZcKlABOWXmtk=;
        b=XQB13N7+wSKp7Xbq4AKIRGEuakvEJ6UNMLdZ3PdjFMPpTTD/wlXQhGHptqO4I53HbG
         cA0VD4vIDO6P6YMZB0RPY+Uc0juC+F059T9Kp49hPKnXL7AaM6FLVr/6Vn7ma+TxTOsC
         n39tYeZn8o/wRNFa7EyH1GSEfNGpdWlqWuar6MTMscTTYWEL7Zi1PvsGkWZycO8GLTZj
         IZgTvmUS2yMpMqD+gWIPDq8W9TqZQ7fYNxTsvMV+IQ7VvV+PlurMN5DmzPVQDpmPRlS0
         R4U95zYny0TDdcE6oQCyxg/J9TihwV88jpV5pVG8bKb0VPXMBgX5Rg8gySSPHz8a79cQ
         rFAw==
X-Gm-Message-State: AFuF++nSpLbcqaNJS+tVmpwuz+hKta9LCYtaKdlp5Ixb+J/dgK/ZSGAz
	OfujaqvnX0Ha2wpXw/6FNgord2D7g4Wic648S6g5rNdJmrJE6eGLlPorXcGj0kNV6MYeLYTLNYe
	AKQpUSg==
X-Gm-Gg: AR+sD13hckzj8sMzTFBkDITtgZPsQb1hfDIScMrb8h8D+1rWCWQ2Sg+Ztq0BjEN4HyJ
	SzVAfxIepMCIPOS6pD/Z9QeG+qLTxLAXfY/OiaAt0wspzBkp/2JXEWOReoiOzcQo0IsWKvgDp94
	viacaS3ej4eXsrEUl4jPuyf0I3HHUZ5nhAZY401OslCAh1ILCuZfZb6JCiIV17TOnzJj2eS21qX
	0FrgkB9iAabLuqyMsVrX3GjK39xxTH4owJqiKbnSKHEFQi6p6LGe7c0fWIjJSM5UcuEFhVAhzil
	jUTLNiNvqz8d0TaHRV3DIcObCW32AAC5/D7tWcRvPXXOmiuGkpFTlafnBvUmDoqYW9gjZqeZC2F
	mXn9y8lNuSKwHdGzZZPFJWCSqkEWpoEqB3E/+9sUJjiTMiYMCQkyHRiCzO6X63l4ENUJvnblR6L
	R0AZAPunyEiCN175fMDF0WWyHvwbxuS729KtolxgNSt8JHWslwMDZdWttGYsG347EMKzkCWayae
	A==
X-Received: by 2002:a05:622a:4d89:b0:52d:3483:ed0a with SMTP id d75a77b69052e-52de33af2aemr300761831cf.18.1787514925931;
        Sun, 23 Aug 2026 12:55:25 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52e09aae6f4sm34470011cf.16.2026.08.23.12.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 12:55:24 -0700 (PDT)
Date: Sun, 23 Aug 2026 15:55:20 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mikhail Zubenko <misha.zubenko.01@yandex.ru>
Cc: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] usb: gadget: dummy_hcd: add tick_us module parameter for
Message-ID: <f58263d6-72bc-4a4e-9d92-1c50a31048ad@rowland.harvard.edu>
References: <178750530003.146199.10916428504166445366@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178750530003.146199.10916428504166445366@yandex.ru>

On Sun, Aug 23, 2026 at 05:15:00PM -0000, Mikhail Zubenko wrote:
> From: Mikhail Zubenko <misha.zubenko.01@yandex.ru>
> Date: Sun, 23 Aug 2026 17:12:49 +0000
> Subject: [PATCH] usb: gadget: dummy_hcd: add tick_us module parameter for
>  timer-rate tuning
> 
> The simulated controller completes URBs on a hrtimer armed at a fixed
> 125 us (one high-speed microframe). Against a permanently polled HID
> interrupt endpoint this creates a self-sustaining pendulum at ~8 kHz:
> every completion triggers an immediate resubmit, which rearms the
> timer. The rate is unconditional - it does not depend on traffic.

That is not a correct description of the situation.

The dummy_hcd timer rearms itself every time it triggers, so long as 
there are any active URBs.  The rate does depend on the traffic, in the 
sense that if there are no pending URBs (and hence no traffic) then the 
timer does not run.  But if there are any URBs, even if there is no 
actual traffic, the timer will run at the same fixed rate.

And you shouldn't call it a pendulum.  It's not a pendulum, it's a 
timer.  (The word "pendulum" implies notions of harmonic -- or nearly 
harmonic -- motion which do not apply to a timer.)

> On timer-rate-sensitive platforms (observed: one consumer AM4 board,
> BIOS current, stock kernel) this pendulum co-existing with a live
> Bluetooth session behind the same xHCI controller results in a hard,

What do you mean by "the same xHCI controller"?  dummy-hcd does not use 
any xHCI controllers.

> below-software platform hang: printk, SysRq, NMI and both watchdogs
> die in the same instant, with no panic, no MCE, and empty pstore.
> 13 occurrences over 5 days, fully reproducible; the same workload
> with the pendulum slowed to 1000 us (this parameter) ran ~8 hours
> with zero hangs, and USB-cable sessions (identical gadget traffic,
> no BT co-existence) never hung.
> 
> Nothing else in the driver's behaviour depends on the exact tick:
> the bandwidth model accounts per-frame budget regardless of how
> often frames are simulated, so a larger tick trades latency
> (1 ms added worst case at tick_us=1000) for interrupt-rate headroom.

Slowing down the timer means that the emulation will not act in real 
time at the same speed as a physical device would.  That's not 
necessarily bad; it's just something for users to be aware of.

> Default keeps the current 125 us behaviour bit-for-bit.
> 
> Signed-off-by: Mikhail Zubenko <misha.zubenko.01@yandex.ru>
> ---
>  drivers/usb/gadget/udc/dummy_hcd.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
> index c0e40fa..f185b87 100644
> --- a/drivers/usb/gadget/udc/dummy_hcd.c
> +++ b/drivers/usb/gadget/udc/dummy_hcd.c
> @@ -51,7 +51,7 @@
>  #define POWER_BUDGET	500	/* in mA; use 8 for low-power port testing */
>  #define POWER_BUDGET_3	900	/* in mA */
>  
> -#define DUMMY_TIMER_INT_NSECS	125000 /* 1 microframe */
> +#define DUMMY_TIMER_INT_NSECS	((u64)tick_us * NSEC_PER_USEC)
>  
>  static const char	driver_name[] = "dummy_hcd";
>  static const char	driver_desc[] = "USB Host+Gadget Emulator";
> @@ -79,6 +79,12 @@ module_param_named(is_high_speed, mod_data.is_high_speed, bool, S_IRUGO);
>  MODULE_PARM_DESC(is_high_speed, "true to simulate HighSpeed connection");
>  module_param_named(num, mod_data.num, uint, S_IRUGO);
>  MODULE_PARM_DESC(num, "number of emulated controllers");
> +
> +static unsigned int tick_us = 125;
> +module_param(tick_us, uint, 0644);

Why did you not follow the pattern of the other module parameters and 
make tick_us a member of the dummy_hcd_module_parameters structure?

Also, there's no reason for the timer delay to be 125 us when 
is_high_speed and is_super_speed are false.  The default delay should be 
1000 us in that case.  More generally, it should depend on the speed of 
the attached gadget.  However, this is not a very important point; 
probably nobody wants to emulate a full-speed (USB 1.1) host controller 
these days -- but as long as the is_high_speed parameter exists, we 
ought to take it into account.

Furthermore, the entire calculation of "total" (the data transfer limit) 
at the start of dummy_timer() is wrong, because the value is calculated 
for one frame, not one microframe.  Any change to the timer rate ought 
to fix this up as well.  Maybe as a second patch.

> +MODULE_PARM_DESC(tick_us,
> +		"enqueue-to-completion latency of the simulated controller, in microseconds (default 125, one high-speed microframe);"
> +		" larger values slow the internal timer pendulum and reduce its interrupt-rate pressure on the host platform");

I don't like this description.  It should be something more like "Length 
in microseconds of an emulated microframe (default is 125, larger values 
reduce the interrupt-rate pressure on the host platform)".  No need to 
mention latency or pendulums.

(In fact, it might be better to make this parameter a slow-down factor 
rather than an absolute number.  A percentage, perhaps -- 200 would mean 
that an emulated microframe elapses every 250 real us instead of 
every 125 us.  But that's purely a matter of taste.)

Don't you want to do any checking on the value of the module parameter?  
You certainly wouldn't want it to be set to 0! -- and probably not to 
any value smaller than 125.

Also, since the value will be variable rather than constant, you should 
pre-compute the delay length once and store the result for later use, 
instead of asking the computer to figure out 
ns_to_ktime(DUMMY_TIMER_INT_NSECS) over and over again.  In fact, you 
should get rid of the DUMMY_TIMER_INT_NSECS macro entirely.

Alan Stern
