Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E5F4963AA
	for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 13:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785333300; cv=none; b=j3BjrMCsyp053mlFF6wSRVnzycaWJ48sK/NN+/CFcj/k4A14KEAg0IUNIXyfdXyfMNCQiksm5qBO9/guXdyeX5zU9cYJXB5zVDqRn6nkwArHw4svVUpnQ+cE6NzcdDXRlQFm/j2hfhHfOOKTTRzXqWYtXGk1jLGEtghqEtMAMyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785333300; c=relaxed/simple;
	bh=Ha1mb5kFxDm9cD7pXy0bfXPQoZoNfTAyfFWhvydeIfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HtxwyIEitYii08YYZT1IueVuSCXqSJZns/MT+hBHWzJ89eEwqTVzgMpkeB2jZFCRMpi5ahM5tgP2v0CI1mBtus+AKMqZ24EehXZRYMKZXGYJjWGGg58DF5AgOC7I5eEXUhXX51ejTRQo+4zKas1O1/AuQKknoJZRlMgoAJj9sRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=WHfAs2b0; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="WHfAs2b0"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-930f4e5eed1so63090985a.2
        for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 06:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1785333293; x=1785938093; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5LvZ0chz+TPJ0xzzKfMEgSAWIzM2O+ULwcgXsdKslGY=;
        b=WHfAs2b0MqeNrejqbHOouVZIjQEJqBaVJlGrcEYRO4MomjAR7nygi7EO3LK1jwQbvU
         kevkRJvxaJtZ/TXpm4NHcax2qMacQ8CEJOyIVP9KeuH+VVsFwiux54zSa7n1ePNLSlaf
         JFPPVyp5p6GPs08mMhKar9BECPZjmc+4y9NQSsn8R/ifndZMZ75BfXEQ+yrlKT+6pfFk
         p517T1TuYugWjT0cLmPjLidihGqqCqejMNnFFEUuOThRy0RoWrTWUBcnUZlwO34LSR/c
         gPSFLOPcKIQGcKEJcIhDGXa7AbjvJMBtXK2wdwqVuJU8CJoQw8gkFcK2ygV3ifnJl9II
         +IbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785333293; x=1785938093;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5LvZ0chz+TPJ0xzzKfMEgSAWIzM2O+ULwcgXsdKslGY=;
        b=aYI7gzwDmgcaGGc5YAAo5olJkqrIgZvt7EpNrvxhZu8u7c7VsSe6JSSOxrdiFtZLAJ
         5MPKOBpEY7BGWfssFY+Ea/x+Xw+hgM8H2cbDjV0Kc+kKrkoa5bmKhK4cUCVpkSoMVQh5
         Qg+OK93Dj5PeZjx2KDDb4qup6xOnFtm1BQBCRPChpWh2cds6vvHpju7vM18ViveromGo
         vcRiqYHkd+tKArAfhGvyx3EfjSkxtvOAovRGIr+qigU1o8QqPg3fnl6cgdwd5Bok6Zxl
         84UgsEMYyXVq+wUyHwVNBC7yA9C1uSM9ZXmRd1hh9g+JwO5EjsUC0yiDLayYO2wnZhtz
         J2/g==
X-Forwarded-Encrypted: i=1; AHgh+RpvsVVAUYF3uk0qq1JoEADbOtaXuNnB/8eMzS5bq0j0uvvOWpzDKV1bdciv8DMYQLJ3W1UUEf6v1Vk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxwYaRQibx3A22DnFsUZ6VAcVe60Ndr8AQNap1m5J+5ZsQCVEk
	D7Rhk5XjbStAkKzZFXOjmo+GcrOa/BsRvJCBeUUkWFujr7ApB7YQQr7NwUdofoheoA==
X-Gm-Gg: AR+sD10B8s5a0ORqxcO5gKzBAaEg/mha4tWyKngnZfx3AvPRQlJqdVLJdO0Od4c8nos
	KV+iovEby5JTZxzcT9Tc5Jm/ZaqPG6pV9K+3o4vlAihtVupMOsCk73WYpsoVRsu/BvR3IT38Ljd
	4tjCOdQVwFxFylmDPfYmenxH9lXQOjeKLudqzv3BTAQgAifEjWxybVSM4UnZcV4t6Gg4CtqEPd2
	1R8GsoTx0AokEmkiiWzu3VHnCbu/algDasz7pWhKCMdYDU8snGZXV57guMb1pTefLG0XhXg338N
	QkVo/DYissagXlA5SpvXpJK/rwtA+kf7jgX2Ve2kx/FFy0YHVnLNobz3SLU36QNOoEkOIpNxyW3
	VDRG6wAqzZdUvYVZykkiED2lmeqy9MVs1aCiQUDAIbOrbHGH3TQVERuF9nWuugkB9DuanRAhTnK
	avchsOILw3jyYQxdnO1fTqtTh25CYaouolLpybrRGQNdC4f9GoPmmxxxRaWDnlhFyVbkSBZgvBN
	872Duo=
X-Received: by 2002:a05:620a:284f:b0:930:9585:e0b2 with SMTP id af79cd13be357-93302621312mr623402585a.51.1785333293093;
        Wed, 29 Jul 2026 06:54:53 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933e7361dc2sm174271185a.43.2026.07.29.06.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 06:54:52 -0700 (PDT)
Date: Wed, 29 Jul 2026 09:54:50 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot@kernel.org>
Cc: syzkaller-bugs@googlegroups.com, Aleksandr Nogikh <nogikh@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot@lists.linux.dev, wangjinchao600@gmail.com
Subject: Re: [PATCH] usb: gadget: dummy_hcd: prevent unbind via sysfs
Message-ID: <fda1c515-8075-4da4-b60e-2ad1c779820b@rowland.harvard.edu>
References: <18ec3122-7566-49e5-9964-1028857405b1@mail.kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18ec3122-7566-49e5-9964-1028857405b1@mail.kernel.org>

On Wed, Jul 29, 2026 at 12:25:27PM +0000, syzbot wrote:
> From: Aleksandr Nogikh <nogikh@google.com>
> 
> The dummy_hcd (Host Controller) and dummy_udc (Device Controller) are
> implemented as two separate platform drivers that share the same underlying
> state (struct dummy). They are designed to be created and destroyed
> together during the module's init and exit phases.
> 
> If userspace forces the dummy_hcd driver to unbind from the device via
> sysfs, dummy_hcd_remove() cleans up the host controllers and sets the
> pointers to NULL (dum->hs_hcd = NULL). However, the dummy_udc driver is
> still bound to its device, meaning the USB gadget is still registered with
> the udc-core subsystem.
> 
> If a new gadget driver is subsequently registered, it binds to the
> still-registered dummy_udc gadget, invoking the dummy_udc_start() callback.
> This callback attempts to retrieve the HCD state using
> gadget_to_dummy_hcd(), which returns NULL because of the unbind. This
> results in a null-pointer dereference:
> 
> Oops: general protection fault, probably for non-canonical address
> 0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
> KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
> ...
> RIP: 0010:dummy_udc_start+0xd0/0x1f0
> drivers/usb/gadget/udc/dummy_hcd.c:1022
> ...
> Call Trace:
>  <TASK>
>  usb_gadget_udc_start_locked drivers/usb/gadget/udc/core.c:1237 [inline]
>  gadget_bind_driver+0x3a8/0x9e0 drivers/usb/gadget/udc/core.c:1667
>  call_driver_probe drivers/base/dd.c:-1 [inline]
>  really_probe+0x254/0xae0 drivers/base/dd.c:706
>  __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
>  driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
>  __driver_attach+0x339/0x600 drivers/base/dd.c:1292
>  bus_for_each_dev+0x23b/0x2c0 drivers/base/bus.c:383
>  bus_add_driver+0x345/0x670 drivers/base/bus.c:763
>  driver_register+0x23a/0x320 drivers/base/driver.c:174
>  usb_gadget_register_driver_owner+0xf9/0x270
>  drivers/usb/gadget/udc/core.c:1752
>  raw_ioctl_run drivers/usb/gadget/legacy/raw_gadget.c:596 [inline]
>  raw_ioctl+0x1541/0x41c0 drivers/usb/gadget/legacy/raw_gadget.c:1307
> 
> Adding NULL checks to the UDC callbacks is not a robust solution because
> there is no synchronization between dummy_hcd_remove() and the UDC
> callbacks, which would result in a use-after-free race condition if the HCD
> were unbound concurrently.
> 
> Fix this by setting .suppress_bind_attrs = true in both driver definitions.
> This prevents userspace from unbinding these drivers dynamically, ensuring
> their lifecycles remain strictly synchronized with the module's load/unload
> process.
> 
> Fixes: d9b762510c18 ("[PATCH] USB dummy_hcd: Use separate pdevs for HC and UDC")
> Assisted-by: Gemini:gemini-3.5-flash Gemini:gemini-3.1-pro-preview syzbot
> Reported-by: syzbot+d270af829aca04e783fc@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=d270af829aca04e783fc
> Link: https://syzkaller.appspot.com/ai_job?id=7a763ada-c07c-458f-9fea-f7e913dc1f2f
> Signed-off-by: Aleksandr Nogikh <nogikh@google.com>
> 
> ---

In theory the driver could be rewritten to allow independent unbinding 
and rebinding of the HCD and UDC.  But that would be a much more 
intrusive change, whereas as this is a small and reasonable fix for a 
real problem.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

> diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
> index c0e40fa6d..415096835 100644
> --- a/drivers/usb/gadget/udc/dummy_hcd.c
> +++ b/drivers/usb/gadget/udc/dummy_hcd.c
> @@ -1180,6 +1180,7 @@ static struct platform_driver dummy_udc_driver = {
>  	.resume		= dummy_udc_resume,
>  	.driver		= {
>  		.name	= gadget_name,
> +		.suppress_bind_attrs = true,
>  	},
>  };
>  
> @@ -2802,6 +2803,7 @@ static struct platform_driver dummy_hcd_driver = {
>  	.resume		= dummy_hcd_resume,
>  	.driver		= {
>  		.name	= driver_name,
> +		.suppress_bind_attrs = true,
>  	},
>  };
>  
> 
> 
> base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
> -- 
> See https://goo.gle/syzbot-ai-patches for information about AI-generated patches.
> You can comment on the patch as usual, syzbot will try to address
> the comments and send a new version of the patch if necessary.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
