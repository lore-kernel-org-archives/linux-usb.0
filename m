Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6AF30EF8F;
	Wed, 25 Mar 2026 08:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774429122; cv=none; b=GpVYEIoCARY0xt5pw1RZKM6+Lc83r/wVR565rC4v1bCB80Mh92jIJf4yk39Nj5ksVnpb9lqRWjAkhKx3EDDVxw86cOijUach4AM6zhkUMTAVV5vZBIWRRSt2TKdv8+y09z15lWwB02naCcgg2gWg+q7t3RqPP8uaAzbBl4K3yA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774429122; c=relaxed/simple;
	bh=P+zMYdFrOJAMjMhKyxgO+hEaGDEema5aSlYv75pcZ/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aBjRk9PrWAD4dKZ2NjhygOdKFPgzk27XKGjbbiMq8seH+hjHBAQFvRkSrWsPpQtsOmCcIe8Mf0gLtItc1tPwO3r+oZqBrd9OooEr4bejGMOgB7neCAXi3gSFLfVwvvJvd5PtmEY2mW5hgsqCtsLxtSHT2l9GHyTn96eVh+nH/B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vVop+6zk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vVop+6zk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAA65C4CEF7;
	Wed, 25 Mar 2026 08:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774429122;
	bh=P+zMYdFrOJAMjMhKyxgO+hEaGDEema5aSlYv75pcZ/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vVop+6zk9+AFI8EHOaVgvxuwaCNquno1kZg8zzHp8itHXBMSbWKV+VIO9CvFAFxzA
	 GUUHNzFQKomVAKGBifR9sAVvFLYeqHzTzNsDZegzEqXjzQvXU7M5c3raF4unG7iwvD
	 Wj8VNyynGXnBqCIsryhQ5whNhS9yAt6vAweYA+jI=
Date: Wed, 25 Mar 2026 09:58:19 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zongmin Zhou <min_halo@163.com>
Cc: skhan@linuxfoundation.org, i@zenithal.me, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, valentina.manea.m@gmail.com,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: Re: [PATCH v2] usbip: tools: Add usbip host driver availability check
Message-ID: <2026032555-headrest-example-af16@gregkh>
References: <29c03d8b-c73b-4393-95ff-bbf5c31df86e@linuxfoundation.org>
 <20260325022634.279624-1-min_halo@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325022634.279624-1-min_halo@163.com>

On Wed, Mar 25, 2026 at 10:26:34AM +0800, Zongmin Zhou wrote:
> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
> 
> Currently, usbip_generic_driver_open() doesn't verify that the required
> kernel module (usbip-host or usbip-vudc) is actually loaded.
> The function returns success even when no driver is present,
> leading to usbipd daemon run success without driver loaded.
> 
> So add a check function to ensure usbip host driver has been loaded.
> 
> Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
> ---
> Changes in v2:
> - Use system calls directly instead of checking sysfs dir.
> 
>  tools/usb/usbip/libsrc/usbip_device_driver.c | 7 +++++--
>  tools/usb/usbip/libsrc/usbip_host_driver.c   | 8 ++++++--
>  2 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/usb/usbip/libsrc/usbip_device_driver.c b/tools/usb/usbip/libsrc/usbip_device_driver.c
> index 927a151fa9aa..45ab647ef241 100644
> --- a/tools/usb/usbip/libsrc/usbip_device_driver.c
> +++ b/tools/usb/usbip/libsrc/usbip_device_driver.c
> @@ -136,10 +136,13 @@ static int usbip_device_driver_open(struct usbip_host_driver *hdriver)
>  	hdriver->ndevs = 0;
>  	INIT_LIST_HEAD(&hdriver->edev_list);
>  
> -	ret = usbip_generic_driver_open(hdriver);
> -	if (ret)
> +	if (system("/sbin/lsmod | grep -q usbip_vudc")){

What happens if the module is built into the kernel?

>  		err("please load " USBIP_CORE_MOD_NAME ".ko and "
>  		    USBIP_DEVICE_DRV_NAME ".ko!");
> +		return -1;
> +	}
> +
> +	ret = usbip_generic_driver_open(hdriver);
>  
>  	return ret;
>  }
> diff --git a/tools/usb/usbip/libsrc/usbip_host_driver.c b/tools/usb/usbip/libsrc/usbip_host_driver.c
> index 573e73ec36bd..f0ac941d4f6e 100644
> --- a/tools/usb/usbip/libsrc/usbip_host_driver.c
> +++ b/tools/usb/usbip/libsrc/usbip_host_driver.c
> @@ -31,10 +31,14 @@ static int usbip_host_driver_open(struct usbip_host_driver *hdriver)
>  	hdriver->ndevs = 0;
>  	INIT_LIST_HEAD(&hdriver->edev_list);
>  
> -	ret = usbip_generic_driver_open(hdriver);
> -	if (ret)
> +	if (system("/sbin/lsmod | grep -q usbip_host")){

Same here, what happens if it is built in?

thanks,

greg k-h
