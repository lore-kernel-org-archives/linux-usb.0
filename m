Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793854484;
	b=flcJWSnWjoESz1C+4hogfs5688hso+JwWQOqspLK5i4s1uGupipQEYU0fQ+jg0LfRhIQ
	 qRIuWQ3KmwUtfW0NMPWa8wpogPwnPjwPusvRH8NGbN/MQ2c4FRKqQ1FagD58jBMhL5x1N
	 jhLC4PLduclZqDJCtoE8ILvEuBgOTAZ0ESMrbb3OIlyheZljUp3BHbqCt2mbbZSOFBLE7
	 vPMVZ1IYbQWWLuT3ZqSR9axDcloWs3eBKrb09dm2+/FSAxn10vPqIdZJ6UpYy/irFN/MH
	 6Er+O4QLW1DWAr9iNjje/gT14ruLtLnj33+29u6HJaEDptsvoGFNcoWh65045KH9y8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793854484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=rnpw/Qplf1e1mjAlvFuzX+A+KTU8pa0uB9bJ3uepkt8=;
	b=i2vr2NkedQOWm93a7IlAHEld1aNoZJyT5m4DRfSxXQvRJVnKTbAizNOUYAJqIUa9xnkH
	 5WRFV2uTSB6Yn50psrJNDqKO4X4GnP3T7PFQqxfMWB7zDCevuVucCWd9lxRwgxYDzQ8PD
	 8RU3PzT1x3JxZhoYgwpt+lpFUSv3JLKa9BGzN5cH77zxqp9u3G3xigj33s23/bxNA4U/Y
	 eDaMZEFRrXvu+1TscsMfbJxGcr62bG2Lej4R9bmIOpPrF7YsUxHzqBtK2MbyW0It64At3
	 vJ67xnucxmNn5cZlC7WpMeJlHjoMaV3zKfi3wXp69pRb4fyGPNcCF4jZ2Ds1A8B/I9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=GNpZLdJG;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3548B606A326
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 04:54:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3548B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=GNpZLdJG
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93f30660e69so106405485a.0
        for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 20:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793854483; x=1794459283; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rnpw/Qplf1e1mjAlvFuzX+A+KTU8pa0uB9bJ3uepkt8=;
        b=GNpZLdJG+LTTiIlTRKwMKjhF6TnQOxOgxfa7jy1lhFpUrReYPsi0yeZXT+IzCFm1dT
         whbow8+ZzyIAYrQSqvw7l54G5BPJbhFn+TCuTi0+AWO1GPJXuTbxEvH9Q9UGJAn8KWQX
         UUaTP8bmypPC18y3ggRlCReMnMkASackE0LJy1RJE9Q44fNGKK78aqmOrjCIaX8a6IPA
         8HLWXJz0wR4hG3EWNTkd70PItozUUNemNisL3iKCOySVGuhsEu5VLbtxlOICGz3ZZXXH
         W9LqKAmXaLdw0+IdnywPay86sFYXmpXnmW8VAPFD+UGHuM18ChjULRhxdwK9kcmeKaJ3
         DCuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793854483; x=1794459283;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rnpw/Qplf1e1mjAlvFuzX+A+KTU8pa0uB9bJ3uepkt8=;
        b=nO5mpLfIrncqN0hoEVFlNwZ8N3pRB7lOB0MGR+NbAJiPA0iviiw3QlNcjEtrTanH/f
         4v1lVWJ4pPmFQB9MrZzahOKXl84vF/bqRMHaA8EW/S5Hkw8aR+E1JU6shQoqigg8JH1x
         hQ7hxkirdoSsoBpqP3B3IDF7BEbO24IuwIGfOIVEHHi3K2pSLJkIq9mxugsJB9LgskF+
         NwmGeb64Hx09W9Y+ugL3AGOn14V9S3LDt+LiH07gnWhlIs49rqEJZZxw3bMZ77sGDyeq
         p7Ujt5oyE11eOLX3fhQ5XV+PEK/KPFeaHAMCri88T+qKvYvyhbSXdowar/ZDy4RUYtFL
         pFVg==
X-Forwarded-Encrypted: i=1; AKwUvBwGyGQQ8Ea6ekzzRVOEGgbviP3jvU7ga7uG2aqw+n8V5eFVILxP+FIod4t2kz7VPYFAG7QiIxRLtug=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eKDODW1XhTOYVehzr3orHnI9z0LSRq3F/onyp2zWNdd0POL60
	KLs3Tzx8H4rgE/CkPP4GvscX4bZUP42U4EMtaLwz+93HM7xhOsy/2HvVYkjIK1K2YQ==
X-Gm-Gg: AYBFou2jsmBPqPTXp/0E8YnRohA4cAVz3mGkV8gjYEXlPtaSuaiLvlAQtWbG5ea7gJa
	Md3fUYBYwe+A1Z6p3uURwH7uYcFdaOH6PsL9VXoz0hLrVGDpalrNc22ia18ualTps0iUKHyMvdL
	SOqBKnN9N9+4G7p2J9ZF0PxKKc5vtNv1y7SDvwz1cIv6b0QWfVpf2qAJyBl1/ylhepnIyo1J3fJ
	GY/fXoxDuwQ3W59ok+qfVHhXIgS2N+Gcu7f7ChG7J+SEiXzIHPc9jgmy01GMJUscP+P1yoMwNo+
	cznjOUMVTHM3FbQd2F7gYfwGisLjVQ/pHnLLCNtPgStO1KH80CvQ3SxK0jzD8RYOX34ZSxhdnRU
	wLDfEVowDO5g3EGTcxWy88ACLP/dG3orE9veVM1050JuSHx02yrIGmP54WeieQR0NvQRSB1iMHd
	iJBnmzjGhdxhHFgidEcZwh9ZTR6up+oAGQnk0PMGkHLE+M2oGqtUfB4+Wx3VWidJwQ+BWtgbJBJ
	K9ak6yrO26qDaQp0IEDw9hkDgMwlSPjc0hdhBwMA/EKykjrgrUJqZgzSAcHsmIWcS0vkqqx3LTf
	LJvDnBK0SHnx829Dsen4vZGkanDHdg==
X-Received: by 2002:a05:620a:4515:b0:93f:2b23:481b with SMTP id af79cd13be357-944216f074fmr3225502985a.22.1793854483013;
        Wed, 04 Nov 2026 20:54:43 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d48694cfsm378985185a.36.2026.11.04.20.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 20:54:42 -0800 (PST)
Date: Wed, 4 Nov 2026 23:54:39 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: YuanZhe Liu <25031212351@stu.xidian.edu.cn>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Bin Yu <byu@xidian.edu.cn>,
	Cheng Wen <wencheng@xidian.edu.cn>
Subject: Re: [PATCH v5] usb: xhci: Fix use-after-free race in
 xhci_stop_device()
Message-ID: <d7448504-a63e-4f3a-a828-7656b1084105@rowland.harvard.edu>
References: <20261104000031.679944e7.michal.pecio@gmail.com>
 <20261104035637.3325-1-25031212351@stu.xidian.edu.cn>
 <b8ea2f8f-ff9e-4cc6-853b-114fe51173e6@rowland.harvard.edu>
 <20261104175949.71804650.michal.pecio@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104175949.71804650.michal.pecio@gmail.com>

On Wed, Nov 04, 2026 at 05:59:49PM +0100, Michal Pecio wrote:
> On Wed, 4 Nov 2026 10:02:48 -0500, Alan Stern wrote:
> > On Wed, Nov 04, 2026 at 11:56:37AM +0800, YuanZhe Liu wrote:
> > > If you think the mutual exclusion belongs higher up instead - do not
> > > let usbfs suspend a port while the hub is being unbound - I am happy to
> > > work on that; from your message it sounds like you would prefer the fix
> > > there.  
> > 
> > Don't know about Michal, but _I_ think the problem should be solved 
> > higher up in the stack.
> 
> Perhaps in userspace? Or is it expected that root hubs (or other hubs)
> receive random and conflicting requests through USBFS?

In usbfs, as I just wrote to YuanZhe.  It should not be allowed to 
send random requests to hubs while they are running.

> Do we know that the device whose port is being suspended has been
> quiesced? Is its driver even aware of anything?
> 
> What I find more disturbing is the existing protection from this race
> added by 88716a93766b - it looks like core was triggering this too.

I don't know anything about it.  That commit only touches xhci-hub.c, 
not usbcore.

> I found this usb_disconnect() code suspicious:
> 
>         if (port_dev && test_and_clear_bit(port1, hub->child_usage_bits))
>                 pm_runtime_put(&port_dev->dev);
> 
>         msleep(150);		// my addition
> 
>         hub_free_dev(udev);	// this drops xHCI device state
> 
>         put_device(&udev->dev);

I don't see how this is related to the problem at hand.  The 
pm_runtime_put() above merely undoes a pm_runtime_get_sync() earlier in 
the same routine.

> but it seems that even with the sleep, the bus only gets suspended
> after put_device(). So IDK how that panic was possible in 2016.
> 
> > It sounds like the sort of race that could  affect any HCD, not just
> > xhci-hcd.
> 
> xhci-hcd is affected because it tracks association between devices
> and ports and accesses devices on port suspend. IDK if others do.
> 
> xhci-hcd shouldn't even need to do this, becaues it's pointless if
> devices behind the port have already had their URBs unlinked. Case in
> point, nobody noticed it's only done to the immediate child :)
> 
> I would have sent a patch to nuke xhci_stop_device() altogether, if
> there weren't known cases where core leaves URBs on suspended ports.
> That stuff should probably be fixed, it caused problems before.

There should never be any outstanding URBs on suspended ports.  If you 
have any examples, they need to be fixed.

> I recall the main blocker being that core wants to setup wakeups in
> the same call which puts ports to suspend, so it cannot reject ep0
> URBs before doing this call.

The core relies on drivers to unlink outstanding URBs and not submit any 
new ones after they have been told that their devices are going into 
suspend.  I suppose we could check that there are no errant URBs still 
in progress just before putting the port into suspend, but is this 
really necessary?

Alan Stern
