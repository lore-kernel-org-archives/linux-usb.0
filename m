Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A91936E47A;
	Mon, 22 Jun 2026 07:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782114147; cv=none; b=aML3VJJ9G+FR8YZsblmsypLSJzFFU7t1peBDNum4EJDIqO/CvFxrj/Cp3FWWX4FaK5l2JOJC5BVQoqsKjrRhRWVHF0bB9pZ6p57UASCpZEs363jl9l46W5/3kdw/pqTTg0Jcp8hqPRXeieAXKJ5Gwit8oeRL9V2ew/QB21rbU10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782114147; c=relaxed/simple;
	bh=1G4asYgqP6k922BhH1WX9roAPK6RW+04rKbZt+NBlM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AAdj3AMC537sYaV4E6ONaq0gV13RxCQOQWoTtGGfm7C9daI5KwfuDi4svQiW0nxm6uc4U3RZGWlk1ExR62dRfbaYM05LvfifDGBmNvFUWKBmW7VF8I4rdVUgPa6lXMeYonztyRc7iWUZ6IYmOVCxjRz7bEumeFYrVXyXPc/xsuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d3/LSa5I; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d3/LSa5I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782114146; x=1813650146;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1G4asYgqP6k922BhH1WX9roAPK6RW+04rKbZt+NBlM8=;
  b=d3/LSa5IBpYqP1/pYm03poRqfCFUY3X/IqkUKk+falw4T8NfWRaMk2od
   0F/QlqwERd4OohdC1ILaEmPTX38prA/m263iBH1rHeYpSsM+5RlU5bIFC
   fJo9Sct5sqO6SHjNUEHhq1+9wxW9eE8Ezy63B5mshnaEqBwz6X3ut27cf
   aZdl/iBSF58/BxenFdjoNrSP+oVlfs3kSXlbZp9aVnLXYhlWvkKhvJz07
   POALyOPWnxHV0RM6G1e7rmXA0vEcA9XgX92K7ZElfpGFmZrY8ICOtHn+B
   xAFR6YDF/Vkgde8KKaJSzNnIPu66mWImmBaRxjGUgqy3s6HOdazC67Dem
   g==;
X-CSE-ConnectionGUID: jAHKh5chSKmrBfTAnOmjLQ==
X-CSE-MsgGUID: nLy4K2shQwiuO1BUPGIeNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="81814969"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="81814969"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 00:42:25 -0700
X-CSE-ConnectionGUID: Ir7CV3iKQ22HozUVIih1ug==
X-CSE-MsgGUID: BnM2+8wYSY6thXH37312gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="246837027"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.88])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 00:42:23 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 44C931203D6;
	Mon, 22 Jun 2026 10:42:25 +0300 (EEST)
Date: Mon, 22 Jun 2026 10:42:25 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com
Subject: Re: [PATCH v2] usb: misc: usbio: fix disconnect UAF in client
 teardown
Message-ID: <ajjnYamyRRZ0Zotl@kekkonen.localdomain>
References: <20260618124029.3704089-1-zzzccc427@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618124029.3704089-1-zzzccc427@gmail.com>

Hi Cen,

Thanks for the patch.

On Thu, Jun 18, 2026 at 08:40:29PM +0800, Cen Zhang wrote:
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

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Kind regards,

Sakari Ailus
