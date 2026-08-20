Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FFA47ACF7
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 15:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787240843; cv=none; b=iMsEQDkkR039fNomRCJkwrsiHJJKXOXpMEsuCp/JzuIsHgUjp99f2yFOlmeI3BRp3JpxETxUOzJt/oMZeMv1i2wh0lggKDCr6Lm05ktywzJeSZdrGdWfontxCXJK1cl5AJvBEFBcgT0EXgb2ohY7QlbQ7xfSAciF1PFsDgM1Nng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787240843; c=relaxed/simple;
	bh=i7llB6OCzgl8K4xcMP+HSalE94BC4IGWAu4nFa/K7+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qFKTj2tnNdUNRNeFK5V3SFikSnLDQ5bNt8RJPivmkCKul8sSrDG/QSXZ5bfoGuXtjnKpSkXoFftk1dLnOpYs1e59GJssLFoOI5Qpz68cdLiid0K7S8ZX5SEUquZ9i5z7ssdyD/HyeVsAdWnRsGeQs1rU6n5PZ3s7vKOsYG6xA3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=EcA9QNoU; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="EcA9QNoU"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5276d598b96so12729061cf.3
        for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 08:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787240829; x=1787845629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fFQAUnoaVoRfpKF2nIQ/H52WHDVeMuXfhRa4awyUg9o=;
        b=EcA9QNoUaM3WYBPYMgYsyBUukZsfAudvnEob89rN9Z8K/m2cJwC5hoaJRzGxjUDQVI
         WmVrAu3LDM7eMFUUHzHfrH++rdzSS/L1Zd1J2VS/aY6VcwT1CtwLtFbewf1++6hj2Mxx
         4kC3udF41OVVwg7oC/BPfbV85oiKgaLTYhe0OUGJIfe9AIhyiF2ncp773YIfRFzw00FC
         uYpBUJJM0u4DYQeaHbwNpLsMdl7j7wG9tY84T2edWc96gtp6Hsd8dVWaHAyW0C0cIn86
         wPF4jqjR3aaTr0Z813VHj8HOWs1n/QV2+NP1EoIUTnkGhBCkQ+9y6O8zBgcnwzaiTqWu
         VY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787240829; x=1787845629;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fFQAUnoaVoRfpKF2nIQ/H52WHDVeMuXfhRa4awyUg9o=;
        b=pyNgMHp9z4Vgec11YRFIntvx/O+x6p0GPmypvnIGy4rg+EqgE3cU95rbK6zKb/sCj3
         +VCBZa8g2OFUG8JfUagNAuYfvWt4lpJBj0jFpVQfCxYEzPE+er82Ho7xGKVLwJyBOkG3
         Hgs6GM9xF1X+K4/hsFMPeM96F9zUCzJQx+VGkSzZvdpPCTs16ou8ATeo6tllukU1btdR
         76XNCkZI3ft+c0BwUEQxAqCO1ogAdn7iVMOZDAT4NRcZ8WY3l1YkMJ/dDWXUdY2drsKH
         dXV6CTZ1vS/AX9fbS3qZ1GGMYbmv8XbYPC8IEdJButWazgyj42tC4LJTUKNUNjGSwpiU
         6l5w==
X-Forwarded-Encrypted: i=1; AHgh+Rrn+iWBZrcTq7Jm0SPuoeABuhJGB/dICfRkY1862gfvcyaShjLx9N0nQ348VGS80muvEdAJZZRrhJA=@vger.kernel.org
X-Gm-Message-State: AOJu0YybOORxLY2Mvv1go0SUBEd56zxgUnysDj5OfU+EYvMSK2q71n/a
	kkQ9l1TfBrIaeSp3NEHcV/RwB50k8ZcW9yS9Oe+04m3EFGWNODDYJXRb4fm01gvXZQ==
X-Gm-Gg: AR+sD11S7oGJ0nbefGAADw+3sG5utpaxX3oXvh96i6e8h5F0zU0nyzdMr7GHqHyOO0k
	Yd2eSODOHvvcqALyv6P2ckakcHjvOyWPw9K4qoR+WAYu9LjNdjoVwEeIwf6Jze6zBCVG1Zf9QFL
	ZMRMpLKMnrvFgCBRFZ3PlZRnIz0GMl5er8ZEWRRKT8NVsRzPBZt7hXe0BMNI1FLXjXqcFGnzVrG
	aI+3gSrR7ECfBr0qX1KkBVmT3yRHCajRAauvR2ERVpiK3xmeXgN5AALZQhrbeLi2HTMpXwH5GLq
	Qhv6vONNFDTB/oITdsgAQrEeZkjpYQi6IbZZ2CjafHQSrOIsu8YMGAeitssxkbfFrm8Wli468QT
	zudHQhO2y3CVn2atN2DEZ/00giZP9W3E2JBqm8Adny7QUFdaNFWh+vCBI2Nc7mSs7XVcl8KTmle
	gQU/2I72oH/k/jkyFK/SZMIwc5vhCZm1GAtVBhVZQFRk0MVZ9YdRJTul/3pTozK+NA82ebhQeAa
	eYI6nSPr1UsgNHElC3i3oYOk9SrH5aN
X-Received: by 2002:a05:622a:40c4:b0:52d:7c2f:7561 with SMTP id d75a77b69052e-52dd5cbe8ecmr135816691cf.41.1787240828678;
        Thu, 20 Aug 2026 08:47:08 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52dd8598adcsm33056221cf.9.2026.08.20.08.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 08:47:08 -0700 (PDT)
Date: Thu, 20 Aug 2026 11:47:05 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] USB: serial: fix driver deregistration order
Message-ID: <2b757e10-c39d-48e5-8240-5390053f6f99@rowland.harvard.edu>
References: <20260820145402.434447-1-johan@kernel.org>
 <20260820145402.434447-3-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820145402.434447-3-johan@kernel.org>

On Thu, Aug 20, 2026 at 04:54:02PM +0200, Johan Hovold wrote:
> USB serial driver modules register one driver for the USB bus and one or
> more drivers for the ports on the USB serial bus.
> 
> When unloading a driver module, the USB driver must be deregistered
> before the USB serial bus drivers so that I/O is stopped before
> unbinding the ports to avoid use-after-free in completion handlers
> accessing port data.
> 
> Note that the order does not matter currently in the registration error
> path as the USB driver is not bound until after the USB serial drivers
> have been registered.

But __usb_serial_register_drivers() does usb_register(udriver) _before_ 
calling usb_serial_register() for the serial_drivers.  Not _after_, as 
claimed here.

And if the order in the registration error path does not matter, why 
does the patch change it?

Or did you mean something else?

Also, what about the failure mode described in 765e0ba62613?  Not to 
mention that it seems odd to register a parent device driver after a 
child device driver, rather than before.  Or to unregister them in the 
reverse order.

If the point is to avoid I/O operations completing after the device 
structure has been deallocated, why not rely on the serial-bus drivers 
to stop all their I/O when they are unbound?

If these questions don't make sense, remember that I haven't done 
serious work on this subsystem for 15 years or so and blame it on that.  
:-)

Alan Stern

> Fixes: 765e0ba62613 ("usb-serial: new API for driver registration")
> Cc: stable@vger.kernel.org	# 3.4
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/usb/serial/usb-serial.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/serial/usb-serial.c b/drivers/usb/serial/usb-serial.c
> index a4fbc849c0fa..08a9b6f8cf7d 100644
> --- a/drivers/usb/serial/usb-serial.c
> +++ b/drivers/usb/serial/usb-serial.c
> @@ -1522,9 +1522,9 @@ int __usb_serial_register_drivers(struct usb_serial_driver *const serial_drivers
>  	return 0;
>  
>  err_deregister_drivers:
> +	usb_deregister(udriver);
>  	while (sd-- > serial_drivers)
>  		usb_serial_deregister(*sd);
> -	usb_deregister(udriver);
>  err_free_driver:
>  	kfree(udriver);
>  	return rc;
> @@ -1543,9 +1543,15 @@ void usb_serial_deregister_drivers(struct usb_serial_driver *const serial_driver
>  {
>  	struct usb_driver *udriver = (*serial_drivers)->usb_driver;
>  
> +	/*
> +	 * The USB driver must be deregistered before the USB serial drivers
> +	 * so that I/O is stopped before unbinding the ports.
> +	 */
> +	usb_deregister(udriver);
> +
>  	for (; *serial_drivers; ++serial_drivers)
>  		usb_serial_deregister(*serial_drivers);
> -	usb_deregister(udriver);
> +
>  	kfree(udriver);
>  }
>  EXPORT_SYMBOL_GPL(usb_serial_deregister_drivers);
> -- 
> 2.54.0
> 
