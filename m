Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA063195FC;
	Thu, 25 Jun 2026 15:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782400431; cv=none; b=S56dV+m7/xONowQrvZ64eJ8bVAJsg+Nj32hSG3C2dzIOX0eXCsn3whVjwnR0VgC3sZyF4rTARmcVqwwBZxfQvDfBBa6YIiwZ22oCjZyNw71umn4pmzOMRmGCpkRsOV4BK3bLm5UDSsS8VuMSiIfS05tGdE+lEJWV80x3+iTwjdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782400431; c=relaxed/simple;
	bh=ycMaEOeVQxdKIIrWEjJbuZSomHZidBI8rEAYR+BgRWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g+11DgDdmoUD2UorJiorSO1EdTDx3iVYAQzut2to472o0Y5iuC2en5O8qB5kWcpmOHXHbYFVH+wQZpVA4Tf37v9tQyTX/EhgQMqOQ7V5QODUkJZkFOtjoLyyI0CEbyBfw+J/UjlfVKXBRLOIrLbKMlWdduo8dvIDCDyHw+j3xY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=08KFvH3Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="08KFvH3Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0BC01F00A3A;
	Thu, 25 Jun 2026 15:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782400430;
	bh=IrkS9WrqNbaBFJIGMPxWcjnGYNZ94EkJnWjetlLpGi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=08KFvH3ZVUchGDbWJMdY6009Mm2e0HBnVEzPqbqgMOE9WDhoMXEwu7SOCj9d0GgMC
	 /D0EqrKHr9BDYU61lG6JhsMDhiNrOVdou63Nzg+/eVMh9CXH60a0uoTP4XgxqhQTL5
	 mI9O3frcJp5SQNArS/N4tkcZ8bvg4lhAnMDkK6ec=
Date: Thu, 25 Jun 2026 16:12:38 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: me@samcday.com
Cc: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
	Krzysztof Opasiak <k.opasiak@samsung.com>,
	Igor Kotrasinski <i.kotrasinsk@samsung.com>,
	Karol Kosik <karo9@interia.eu>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usbip: vudc: fix NULL deref in vep_dequeue()
Message-ID: <2026062518-treason-styling-5185@gregkh>
References: <20260620-usbip-vudc-deque-fix-v2-1-d1913ab4611b@samcday.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260620-usbip-vudc-deque-fix-v2-1-d1913ab4611b@samcday.com>

On Sat, Jun 20, 2026 at 10:18:09AM +1000, Sam Day via B4 Relay wrote:
> From: Sam Day <me@samcday.com>
> 
> vep_alloc_request() wasn't initializing vrequest->udc, so cancellations
> on the FunctionFS AIO path were arriving in vep_dequeue without a valid
> UDC reference.
> 
> Since vrequest->udc is never actually properly used anywhere, we opt to
> remove it, and update vep_dequeue to obtain a reference to the udc with
> ep_to_vudc(), consistent with the other vep_ ops.
> 
> AFAICT this bug has existed for ~10 years. Seems that nobody has really
> stressed the FunctionFS AIO path on usbip's vudc.
> 
> I tested this fix in a QEMU aarch64 guest driving FunctionFS endpoints
> via AIO. Before the fix, running `usbip attach` from the host would
> cause the guest to oops with the following backtrace:
> 
> Call trace:
>  vep_dequeue+0x1c/0xe4 (P)
>  usb_ep_dequeue+0x14/0x20
>  ffs_aio_cancel+0x24/0x34
>  __arm64_sys_io_cancel+0xb0/0x124
>  do_el0_svc+0x68/0x100
>  el0_svc+0x18/0x5c
>  el0t_64_sync_handler+0x98/0xdc
>  el0t_64_sync+0x154/0x158
> 
> Assisted-by: opencode:openai/gpt-5.5
> Fixes: b6a0ca111867 ("usbip: vudc: Add UDC specific ops")
> Signed-off-by: Sam Day <me@samcday.com>
> ---
> Changes in v2:
> - Reworked to remove vrequest->udc entirely and a call to ep_to_vudc()
>   from vep_deqe
> - Link to v1: https://lore.kernel.org/r/20260619-usbip-vudc-deque-fix-v1-1-9021463b1903@samcday.com
> ---
>  drivers/usb/usbip/vudc.h     | 1 -
>  drivers/usb/usbip/vudc_dev.c | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/usbip/vudc.h b/drivers/usb/usbip/vudc.h
> index faf61c9c6a98..5ef0e7d9b23a 100644
> --- a/drivers/usb/usbip/vudc.h
> +++ b/drivers/usb/usbip/vudc.h
> @@ -38,7 +38,6 @@ struct vep {
>  
>  struct vrequest {
>  	struct usb_request req;
> -	struct vudc *udc;
>  	struct list_head req_entry; /* Request queue */
>  };
>  
> diff --git a/drivers/usb/usbip/vudc_dev.c b/drivers/usb/usbip/vudc_dev.c
> index c5f079c5a1ea..f0a1a44c18e3 100644
> --- a/drivers/usb/usbip/vudc_dev.c
> +++ b/drivers/usb/usbip/vudc_dev.c
> @@ -344,7 +344,7 @@ static int vep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
>  
>  	ep = to_vep(_ep);
>  	req = to_vrequest(_req);
> -	udc = req->udc;
> +	udc = ep_to_vudc(ep);

Why is "req" still needed now?  Shouldn't that variable be removed also?

thanks,

greg k-h
