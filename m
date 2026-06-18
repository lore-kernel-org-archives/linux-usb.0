Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53CD383C94;
	Thu, 18 Jun 2026 11:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781783; cv=none; b=gFJhIZJDfK7YuPqJjn7TAe6eDKjOHlpflJBBqbAWWNCr7kMEzI38p7ECpbwvz2K4cYR08+15Cm06c8ZhZ8c1AzMhwABabaXiVcy3rEgfoT6vml7DqrXORrv2jNBbXLcJZ4uTiIp7bn+6miSz4L6YtK4KbwLkXpqOAAo1Qay81rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781783; c=relaxed/simple;
	bh=YRVUJ7tQUULetwS37AV9ORmF1fcBWRK1WHSIMEkE44o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FVsgt5xsdLQR7ebltaJ2/yTwffu611XL1KozgbqXMlXigOINzadKF8w1/mn/PA3a0v3R+WhhurVorGQX0rkY9xCDfHkcnTl1kKBqgemV845P2vl+Z6Xdk30mI/mv/RfHb3p9t5Y4CFJ4CYWqS7KvetUw9bcmq71WrJUMbGe53iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h+aDd9YX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h+aDd9YX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 007B91F000E9;
	Thu, 18 Jun 2026 11:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781781782;
	bh=NOvz0g2r41Djn50R8ImJda6ByKd2KzzcVuwR2sbjL/Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=h+aDd9YX5t6/4eDqgTDdAUV+wm1Rq4O8tXvk5EOeyB+6bBCL6NxnJPV6hQyZfifdJ
	 ryJOSdpxTFDqh6sxd5x7muxHFuYT2BcSUJ3jWNYmWJ+zSQivE8tPkvSfmqKLzzeMZC
	 x5gMSrsl4HO0wQn2TCKslvJrqIoLdm4FFnHnkPC9lDknLwzTaHSIPM+b84Q/2scrLK
	 IJnIBBT7ofM4HiYYogQrDbqh9dautdqudMaEZJ+R1hAxmiWENkwDC+01zaf2cEjJVZ
	 js2dwewru1luGl8W4VzAL6I5ieu49sGtNaXaoG0e+GZozM92c+98RtByf7l+pOazze
	 v1Eu8Zls+78Ig==
Message-ID: <b39be4f6-e63a-43c3-9903-e4e6e0a85cd3@kernel.org>
Date: Thu, 18 Jun 2026 13:22:58 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: misc: usbio: fix disconnect UAF in client teardown
To: Cen Zhang <zzzccc427@gmail.com>,
 Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 baijiaju1990@gmail.com
References: <20260618104633.3405705-1-zzzccc427@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260618104633.3405705-1-zzzccc427@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 18-Jun-26 12:46, Cen Zhang wrote:
> usbio_disconnect() walks usbio->cli_list in reverse while each
> auxiliary_device_uninit() can drop the last device reference and run
> usbio_auxdev_release(). If that happens, the current struct usbio_client is
> freed before list_for_each_entry_reverse() advances by reading
> client->link.prev.
> 
> Use list_for_each_entry_safe_reverse()

Ack that is good.

> and delete the list node before
> uninitializing the auxiliary device.

Why I see no reason to delete the list node here ?

Regards,

Hans




> The next cursor is then captured before
> the put_device() path can free the current client, and cli_list does not retain
> stale nodes during teardown.
> 
> Validation reproduced this kernel report:
> KASAN slab-use-after-free in usbio_disconnect+0x12e/0x150
> Workqueue: usb_hub_wq hub_event
> Read of size 8
> Call trace:
>   dump_stack_lvl+0x66/0xa0
>   print_report+0xce/0x630
>   usbio_disconnect+0x12e/0x150 (drivers/usb/misc/usbio.c:518)
>   srso_alias_return_thunk+0x5/0xfbef5
>   __virt_addr_valid+0x188/0x320
>   kasan_report+0xe0/0x110
>   usb_unbind_interface+0xf3/0x400
>   __device_attach_driver+0xf1/0x1a0
>   bus_for_each_drv+0xf9/0x160
>   trace_hardirqs_on+0x18/0x130
>   _raw_spin_unlock_irqrestore+0x44/0x60
>   __device_attach+0x133/0x2a0
>   do_raw_spin_unlock+0x9a/0x100
>   device_add+0x9b9/0xc10
>   lockdep_hardirqs_on_prepare+0xea/0x1a0
>   usb_enable_lpm+0x3c/0x260
>   usb_set_configuration+0xb64/0xf20
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
>   ret_from_fork_asm+0x1a/0x30
> 
> Fixes: 121a0f839dbb ("usb: misc: Add Intel USBIO bridge driver")
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
> ---
>  drivers/usb/misc/usbio.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/misc/usbio.c b/drivers/usb/misc/usbio.c
> index 02d1e0760f0c..7dc44bbcafd2 100644
> --- a/drivers/usb/misc/usbio.c
> +++ b/drivers/usb/misc/usbio.c
> @@ -518,7 +518,7 @@ static int usbio_resume(struct usb_interface *intf)
>  static void usbio_disconnect(struct usb_interface *intf)
>  {
>  	struct usbio_device *usbio = usb_get_intfdata(intf);
> -	struct usbio_client *client;
> +	struct usbio_client *client, *next;
>  
>  	/* Wakeup any clients waiting for a reply */
>  	usbio->rxdat_len = 0;
> @@ -535,7 +535,8 @@ static void usbio_disconnect(struct usb_interface *intf)
>  	usb_kill_urb(usbio->urb);
>  	usb_free_urb(usbio->urb);
>  
> -	list_for_each_entry_reverse(client, &usbio->cli_list, link) {
> +	list_for_each_entry_safe_reverse(client, next, &usbio->cli_list, link) {
> +		list_del_init(&client->link);
>  		auxiliary_device_delete(&client->auxdev);
>  		auxiliary_device_uninit(&client->auxdev);
>  	}

