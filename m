Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CDD32B128;
	Thu, 18 Jun 2026 15:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781797359; cv=none; b=Egxs2GbuTQPKHSgIZEUTVauN/aF0p4deP48oLrOt2N76TDCol2U5BXx42TYKml3i6fQil0uh8kT+Ng48kREzRirAgbQW7AKA9HFG7ZmkWLK2TLv6wvBO4z3NpDUHVMq42Al0aFeV9G9Pl+7OUpZhch8D3j2Bsdjr35Kk5z26Fvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781797359; c=relaxed/simple;
	bh=UIyttgxQnsaNx8IX8XEvfuaiCL7k3bwukAaMpP16HvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=giRLaOuX8KBI8bgVJTDi0FPuAPSSUDMC4aSkjXm8sXuU3cdcUbFyoekcwb1Fs/DILfhfCSr/XsI/bPWBh3Y/Xl9qubUVuOCwIX4Kfxu3RdhDW8MBo/yJcRB30NaaRnyCnQq74O7a/L5BeAOairAX47uEPZoklVqes5QILAbMhls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P4rnFaCu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P4rnFaCu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 054041F000E9;
	Thu, 18 Jun 2026 15:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781797358;
	bh=Do1PqSQgtnm0HaODqm3TzWME9/dO05WFVtdWTunoOLg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=P4rnFaCux/VbxAqijIQECzUXT6hHri23mafLpAZGK9JtaoTvVpF1TUZefmlQ1fN3a
	 4b2QopZGxTKX2HEmeRU1nB5PRI5vxNDzb2Pmq6kweH/TRMziRhLaaV9nJwugp2hCzy
	 38WfwWvNY9wAAWIBSE9dPYYhkngumjcr8NQfUVXoSm/+2lhXVQ6c5avVDpLZFBEjKd
	 DStyhxSAQJgGN1QW13Z95b7hnyaWOcdLBy6UeJhpn0L2n9oBeu/6uAxKd7WbQ/l/T9
	 aeyoULJJ6FCGBFnxHWSg5OHcumFSW9hPT/uKb+UIWUgySbJE+RdSPNuJ/tSgMOhaac
	 MeoJDKv9iP7Bw==
Message-ID: <78da56e8-f899-4cf3-b3f9-0756152008ae@kernel.org>
Date: Thu, 18 Jun 2026 17:42:35 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: misc: usbio: fix disconnect UAF in client
 teardown
To: Cen Zhang <zzzccc427@gmail.com>,
 Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 baijiaju1990@gmail.com
References: <20260618124029.3704089-1-zzzccc427@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260618124029.3704089-1-zzzccc427@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 18-Jun-26 14:40, Cen Zhang wrote:
> usbio_disconnect() walks usbio->cli_list in reverse and uninitializes each
> auxiliary device. auxiliary_device_uninit() drops the device reference, and
> for an unbound child that can run usbio_auxdev_release() and free the
> containing struct usbio_client.
> 
> list_for_each_entry_reverse() advances after the loop body by reading
> client->link.prev. If the current client is freed by
> auxiliary_device_uninit(), the iterator dereferences freed memory.
> 
> Use list_for_each_entry_safe_reverse() so the previous client is
> cached before the body can drop the final reference. This preserves
> reverse teardown order while keeping the next iterator cursor independent
> of the current client's lifetime.
> 
> Validation reproduced this kernel report:
> BUG: KASAN: slab-use-after-free in usbio_disconnect+0x12e/0x150
> 
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x66/0xa0
>  print_report+0xce/0x630
>  ? usbio_disconnect+0x12e/0x150
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  ? __virt_addr_valid+0x188/0x320
>  ? usbio_disconnect+0x12e/0x150
>  kasan_report+0xe0/0x110
>  ? usbio_disconnect+0x12e/0x150
>  usbio_disconnect+0x12e/0x150
>  usb_unbind_interface+0xf3/0x400
>  really_probe+0x316/0x660
>  __driver_probe_device+0x106/0x240
>  driver_probe_device+0x4a/0x110
>  __device_attach_driver+0xf1/0x1a0
>  ? __pfx___device_attach_driver+0x10/0x10
>  bus_for_each_drv+0xf9/0x160
>  ? __pfx_bus_for_each_drv+0x10/0x10
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  ? trace_hardirqs_on+0x18/0x130
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  ? _raw_spin_unlock_irqrestore+0x44/0x60
>  __device_attach+0x133/0x2a0
>  ? __pfx___device_attach+0x10/0x10
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  ? do_raw_spin_unlock+0x9a/0x100
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  device_initial_probe+0x55/0x70
>  bus_probe_device+0x4a/0xd0
>  device_add+0x9b9/0xc10
>  ? __pfx_device_add+0x10/0x10
>  ? _raw_spin_unlock_irqrestore+0x44/0x60
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  ? lockdep_hardirqs_on_prepare+0xea/0x1a0
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  ? usb_enable_lpm+0x3c/0x260
>  usb_set_configuration+0xb64/0xf20
>  usb_generic_driver_probe+0x5f/0x90
>  usb_probe_device+0x71/0x1b0
>  really_probe+0x46b/0x660
>  __driver_probe_device+0x106/0x240
>  driver_probe_device+0x4a/0x110
>  __device_attach_driver+0xf1/0x1a0
>  ? __pfx___device_attach_driver+0x10/0x10
>  bus_for_each_drv+0xf9/0x160
>  ? __pfx_bus_for_each_drv+0x10/0x10
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  ? trace_hardirqs_on+0x18/0x130
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  ? _raw_spin_unlock_irqrestore+0x44/0x60
>  __device_attach+0x133/0x2a0
>  ? __pfx___device_attach+0x10/0x10
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  ? do_raw_spin_unlock+0x9a/0x100
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  device_initial_probe+0x55/0x70
>  bus_probe_device+0x4a/0xd0
>  device_add+0x9b9/0xc10
>  ? __pfx_device_add+0x10/0x10
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  ? add_device_randomness+0xb7/0xf0
>  usb_new_device+0x492/0x870
>  hub_event+0x1b10/0x29c0
>  ? __pfx_hub_event+0x10/0x10
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  ? lock_acquire+0x187/0x300
>  ? process_one_work+0x475/0xb90
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  ? lock_release+0xc8/0x290
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  process_one_work+0x4d7/0xb90
>  ? __pfx_process_one_work+0x10/0x10
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  ? __list_add_valid_or_report+0x37/0xf0
>  ? __pfx_hub_event+0x10/0x10
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  worker_thread+0x2d8/0x570
>  ? __pfx_worker_thread+0x10/0x10
>  kthread+0x1ad/0x1f0
>  ? __pfx_kthread+0x10/0x10
>  ret_from_fork+0x3c9/0x540
>  ? __pfx_ret_from_fork+0x10/0x10
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  ? __switch_to+0x2e9/0x730
>  ? __pfx_kthread+0x10/0x10
>  ret_from_fork_asm+0x1a/0x30
>  </TASK>
> 
> Fixes: 121a0f839dbb ("usb: misc: Add Intel USBIO bridge driver")
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
> v2:
> Drop the unnecessary list_del_init() per Hans de Goede; the safe reverse
> iterator is sufficient.
> 
>  drivers/usb/misc/usbio.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/misc/usbio.c b/drivers/usb/misc/usbio.c
> index 02d1e0760f0c..0e5ccd2f04d8 100644
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
> @@ -535,7 +535,7 @@ static void usbio_disconnect(struct usb_interface *intf)
>  	usb_kill_urb(usbio->urb);
>  	usb_free_urb(usbio->urb);
>  
> -	list_for_each_entry_reverse(client, &usbio->cli_list, link) {
> +	list_for_each_entry_safe_reverse(client, next, &usbio->cli_list, link) {
>  		auxiliary_device_delete(&client->auxdev);
>  		auxiliary_device_uninit(&client->auxdev);
>  	}

