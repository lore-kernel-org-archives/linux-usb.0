Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5478F15FA81
	for <linux-usb@vger.kernel.org>; Wed,  8 Jul 2026 15:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522933; cv=none; b=Y5zKDZgEKIQ7VeA9lPUcAUNtDuugXNvJcSC31huR5bJ0fvKN9DQTAosemoIfU2nyqoZ8gTjw1ioGUiQqHZDptcb+pyOASirdnKeQmrEfYb1K0ZIuO80w1Siizcr2BnryrL7xC0cU42LhQ/V43qsfbE6QcMBY8um8e8eiT7jT93o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522933; c=relaxed/simple;
	bh=nLvDX1UQFpZjNefJ0VeLfcvpJfdbbKFo4GR/HFZIiJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FoYrJmOT2ZzglnDIjiUUQI36C/BnPkE2h9BLLR/yQPYYdyj/UJNzOJC1rqmkEkyOnSW4g0/ti4x7GKCtJ6pbrS2FrHatKuZ8/EoimUKD1WuQq0BRxKAJE9Dxp6Rurb8AY7fxkPJnRMDDqEZN/QAlHf2mla6Ytvw6s5f8iaKegPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=pWi++CxQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jgUEWd72; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="pWi++CxQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jgUEWd72"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 53AEE7A015E;
	Wed,  8 Jul 2026 11:02:10 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 08 Jul 2026 11:02:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1783522930; x=1783609330; bh=iNj6xBD9WT
	HReU9vEfx/v5jghCf+tMPiWCO0LDshEpM=; b=pWi++CxQdUuMT2KdZhf63VYH/B
	zYvS8uXhu1jCGaemDAar8d3HXoLClf24Dd4FpB4TfJy4rA2gtC2FD7B1zxQN+SsX
	gZuH+AO4S7svXRfLMAB9m1E+noUwMrhUYgJUd+R/fEAfrdZlQwU1FZUZrPqoamUh
	rDPE8Q1MHNf0lFsM0GYKE98NaSGm8vaJod6uQcul4L4wjysfLbLGGbmw9AlCyuj6
	YQqFTlTxYd1ZmVA+Fxlai1rygmrAqTuOEn1SpDwVS+3v3oKrV3wxuDQ6IEjDEVcv
	N+EpN2m7pDW7uxeYC2m6KYal3jkR1Lwamg5elZocvJ8Z0AxpC9YaI0XFnd1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1783522930; x=1783609330; bh=iNj6xBD9WTHReU9vEfx/v5jghCf+tMPiWCO
	0LDshEpM=; b=jgUEWd72PzzsYW8n52DqbYZI/dVY1o3T7l1/HTlK3213HxpnrcE
	D5G1l5imZUoui4fqvsc7AgkK2FSogdxzBPdMWOFJMBxCz5c6Jt4L5eqd1FdNi8gl
	S+nFQeCvPxiLA2YZGSa/SJXMfddRllhJR7Iu4N1SYNqOykzdW5v63qE/3HBoEOqJ
	CbJWdW9VP34/uWIsZOuvhHVLINsinOEDfonLq1b8B198rNU/QuYUN7p0q+lWkYvQ
	AB0K1SIYHBKhRIzeK2xpxUVLBTO9HivVa63lvC7cBTbcHEWNohUUrVqI7kK8Gzrt
	ldIg4bsTsNbdgQ2pBwrYN/jC2oO2HxRiTWQ==
X-ME-Sender: <xms:cmZOasDZEZXC6JhrwMKH02sIDj7PFNIzqZb3Pjq30ekov-fUgfpiYw>
    <xme:cmZOajvFeufRPMUHNYZAcvpWzjHD_HgIK223XSQ2x-67gDeTABAEeInR9szCbw3Ty
    LXV8u3V7b2RoW7DTfsGWqjy_dWROK3_NoMPefAUiF5sbvPQNg>
X-ME-Received: <xmr:cmZOagf6lLkiygcbGbs81ROPYK5lJ_P6A3PLVDCnMO7bTsAAA7MNFPHBvYHt5xk2EJdnUQ8SaxE57pyvg7fgVxEx4g>
X-ME-Proxy-Cause: dmFkZTFFnRG1bLo34Qr6DfFEcnz4htyGJ1C7b+U4SRJeVY1xApR1KHFEVDm2lnZBZLHJEF
    H+kwTWtFzIV6lM7HTwI1V3W/wWqrNcWogHoHA6GSjgt8Et4QDANVFZIv2CMg0kYtH0+nMj
    UaycgbPTVBIOZBnApzxG3Z88hBSiMSe2s23Q7XGgPcJk35DKHh5vUNZ4sOhQdr0ViBS57f
    GhlnCSzbTzmVmEVaf+97aH9IKfTutEQsNac61AptDGKC371Yvw9gn34Ekh+zvOOEZCjmh0
    qJS4CBWUBmmbU5siWKEWw1peNwOjcXvDsyxKDMLZu4gz9gUNtOtAKTvG99uXPT6WCXO1eg
    zCHI1KgINVFRVYIXX6Z9FqpmrwOxhfITZ/w9T1q/I5mB7earBg++AeGRh7EBoy5ZOQLvp8
    BIHZAiTsUr1eFxdBoHAtS0NomKQcNbdHult58Lh6d29LWm+7sefhcKc6nq4Xv3j24sgnoI
    XCrQbyTE6mUaTLckFmsH0wnRGYu2LDwWV4X2F/3CGlvoBDyg7LwqY66WO0589quaYxdw9R
    jAx02RgZ2pu4Oe2nwGZmQDLJ/SE9dnClBG6ve3EdwZjAxCwvMPdpD/foK6nHER/ECgMgdB
    uKtrkuVZCmYr9nKQkCh0nX8/YFFUZLXUGsb9v8lRzC+m3WdC02mJ1uCI3XPw
X-ME-Proxy: <xmx:cmZOao8PSPC0cNwMhmHW8ArCz_IWXo9qJtAq1WVueZNTWvQtIK8kTg>
    <xmx:cmZOajT6MJmi54J-CDvDLXNQDdVB-hAsGB_UcBZjXC3aN1ctFCnRMQ>
    <xmx:cmZOahoVs4Frzb28c9-Cdg_N2IyClR20kCd7gjxTnpKS3fj83sbmCw>
    <xmx:cmZOaokNuis7XG2cIGzBP8PLLtvVLpHixenjF3CILWvGEaNxETJh7g>
    <xmx:cmZOatPcG-ubZcgwXOOmqK0clmo1c33U5IgG4dVFlFazHnS2AXIFbYh2>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Jul 2026 11:02:09 -0400 (EDT)
Date: Wed, 8 Jul 2026 17:02:07 +0200
From: Greg KH <greg@kroah.com>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: Duncan Sands <duncan.sands@free.fr>, linux-usb@vger.kernel.org,
	baijiaju1990@gmail.com
Subject: Re: [PATCH] usb: atm: xusbatm: release claimed interface on
 set-interface failure
Message-ID: <2026070851-fresh-pummel-d9f0@gregkh>
References: <20260618103650.3380124-1-zzzccc427@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618103650.3380124-1-zzzccc427@gmail.com>

On Thu, Jun 18, 2026 at 06:36:50PM +0800, Cen Zhang wrote:
> xusbatm_capture_intf() claims a sibling interface before changing it to
> the requested alternate setting. usb_driver_claim_interface() binds the
> sibling interface and stores the usbatm instance as its intfdata.
> 
> If usb_set_interface() fails after that claim, xusbatm_bind() returns an
> error and usbatm_usb_probe() frees the usbatm instance without calling
> the mini-driver unbind callback. The sibling interface is left bound with
> stale intfdata, so a later disconnect can call usbatm_usb_disconnect()
> with a freed instance.
> 
> Release the just-claimed interface when usb_set_interface() fails. This
> clears intfdata before dropping the claim, matching xusbatm's existing
> release helper and leaving the caller's rollback to handle any previously
> captured interface.
> 
> Validation reproduced this kernel report:
> KASAN slab-use-after-free in __mutex_lock+0x12a/0x1980
> Workqueue: usb_hub_wq hub_event
> The buggy address is located 224 bytes inside of freed 2048-byte region
> [ffff888114339000, ffff888114339800)
> Read of size 8
> Call trace:
>   dump_stack_lvl+0x66/0xa0
>   print_report+0xce/0x630
>   __mutex_lock+0x12a/0x1980
>   srso_alias_return_thunk+0x5/0xfbef5
>   __virt_addr_valid+0x188/0x320
>   kasan_report+0xe0/0x110
>   usbatm_usb_disconnect+0x52/0x440
>   __lock_acquire+0x466/0x2260
>   rcu_is_watching+0x20/0x50
>   rpm_resume+0x705/0xab0
>   usb_unbind_interface+0xf3/0x400
>   device_release_driver_internal+0x298/0x330
>   kobject_put+0x47/0x2e0 (lib/kobject.c:730)
>   bus_remove_device+0x1c6/0x2d0
>   device_del+0x218/0x540
>   kfree+0x2f9/0x530
>   kobject_put+0xf4/0x2e0 (lib/kobject.c:730)
>   usb_disable_device+0x180/0x3b0
>   usb_set_configuration+0xab/0xf20
>   blocking_notifier_call_chain+0x5f/0x70
>   notifier_call_chain+0x60/0x1e0
>   usb_unbind_device+0x40/0xe0
>   __device_attach_driver+0xf1/0x1a0
>   bus_for_each_drv+0xf9/0x160
>   trace_hardirqs_on+0x18/0x130
>   _raw_spin_unlock_irqrestore+0x44/0x60
>   __device_attach+0x133/0x2a0
>   do_raw_spin_unlock+0x9a/0x100
>   device_add+0x9b9/0xc10
>   add_device_randomness+0xb7/0xf0
>   usb_new_device+0x492/0x870
>   hub_event+0x1b10/0x29c0
>   lock_acquire+0x187/0x300
>   process_one_work+0x475/0xb90 (kernel/workqueue.c:3200)
>   lock_release+0xc8/0x290
>   process_one_work+0x4d7/0xb90 (kernel/workqueue.c:3200)
>   __list_add_valid_or_report+0x37/0xf0
>   worker_thread+0x2d8/0x570
>   kthread+0x1ad/0x1f0
>   ret_from_fork+0x3c9/0x540
>   __switch_to+0x2e9/0x730
> 
> Fixes: 233c08e0ff30 ("[PATCH] USBATM: xusbatm rewrite")
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
> ---
>  drivers/usb/atm/xusbatm.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/atm/xusbatm.c b/drivers/usb/atm/xusbatm.c
> index 0befbf63d1cc..a9e67aa136f3 100644
> --- a/drivers/usb/atm/xusbatm.c
> +++ b/drivers/usb/atm/xusbatm.c
> @@ -35,6 +35,9 @@ static struct usbatm_driver xusbatm_drivers[XUSBATM_DRIVERS_MAX];
>  static struct usb_device_id xusbatm_usb_ids[XUSBATM_DRIVERS_MAX + 1];
>  static struct usb_driver xusbatm_usb_driver;
>  
> +static void xusbatm_release_intf(struct usb_device *usb_dev,
> +				 struct usb_interface *intf, int claimed);
> +

Why not move the function so you don't have this prototype needed?

thanks,

greg k-h
