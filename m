Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D4E40683D
	for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 14:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781187116; cv=none; b=ojs0otMe7XecOdmuEbL4RmKuVEyG7tobQsRivUuFHNf1TTJbKzWW/bh3BHaPCQPuL7vtTp3lNjqvNGyI8+y6ZtcP8EkbO8MQpk91mIFE/978LF0FKFsvPu+gb/5Qg23BlrjK3tmdj3zSJ3f7TLyt+S01UQQjqchn2c1iB5V2Qso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781187116; c=relaxed/simple;
	bh=9CbWY5bVY3WPiB2hF0opJQ3dHD20rbFUitVIN5OFEeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ges7lddgDLJXpEk9tBytjkxARBOkUQ0n3NGhHyt+VX1fICR2rqEztbDQPHfL9hiB99hiO/D3dp/2QIOlGU+x5ArfoWPMVs4zhxYutz/NOEjDvv2JTMEKK1q6SyDcgkStw67PfACV+z+aG2TGWhO5/9XitDcn01gyf1cp6ronhPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=H4s5ga6j; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="H4s5ga6j"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8cceaacd07bso83002186d6.3
        for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 07:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1781187112; x=1781791912; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/dniOIRcqBtEvdCN2h2so0q8LhV25xoLRKWKiAUTeFA=;
        b=H4s5ga6jPjfRYeKavjHyYElldh4s4GGhzIQjeDhwF0S6cfFB/ww+Mer3b3afV4VR3U
         HcIKDtRMUHJ3QoY6Mg+nCMgu74GELhbP4xVWL8wdTKtoNEGx5URvJhxMGGzFWKxtC6Zu
         Dc8CzHABF/iw4wVtLeYec2rXssnjjAi4g3vOhhxpOI6w5loZ4BKChmnwYtT8KRiqjNza
         re4mT3HDmiORe4njGPxl3gXxrKCYEuYi2VDxVlncxoIrDbbhBsGr+bIp9NtjKz6Y7n7N
         km6f51PsjvBa540D9494dYhCbVnx/YzyxSwOPdVItg9DoN/PH6y9Qf78yhH2hbOazuS/
         ty8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781187112; x=1781791912;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/dniOIRcqBtEvdCN2h2so0q8LhV25xoLRKWKiAUTeFA=;
        b=pEjmLfba3AUX/ZLje+UYLHlf4fXc7SJxOSOW9+TZI0nvR5LeqikSiOFyzo/9be/GyQ
         /0x2FJoFnrhlHeor/2nIWnKPR9VkO70Eb7QTP0UdBliaqHZ5WTeZdPTxokCzrnjZ6CLq
         M/btMM+ETju7ko1ZToXCp0VM6e0XKDFf4ApZzmJzuROXEZii0fBXbt4pq+2Df2zCLrbY
         JtOZoFKEDq/cB1EagUVu3V3oJN3FZZ+6kw7x9QgHlbe8RUjwi3U9zwy45ZAyKZBYrbXp
         dPw3wMkACdhI71OhUtUQRtOj5dhgd0ARplBx7jvL1NSnsZnY/l9ghC789BzoOA9q9rnE
         Ck8g==
X-Forwarded-Encrypted: i=1; AFNElJ/tpCUGiEOZWnTpvb/YpdRi3xbO0fUrHRQM0Urropw3F4LjgxkdnstsPlJX69VFGs3DcvDNcXZ4cnI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgbAwWAoOAB9hJhgcYqR80uxVeTJA3GnbFtM8OSQ2KKiFFQIYy
	lf0oMYb7tSU1RHI6wiy6Sf+ApqDvOX51KpG96h90JIIGy4Z0IzytRo5FPNCH1BQiycOxpTMLs+o
	xQ6w=
X-Gm-Gg: Acq92OHk+8vSjX6L1p4PHzhiT7zszd9+3I1TX/5ehCX4l6w2ZrPKPArrWXGX9Zz8ljW
	mrLBwv0hXmzzMiiJpnKbjkRvwK9aVht/ZraiHcBvJ1mrEm6aBXoVkk5Mhy1aahwoNQsiYLQcW3W
	SCQI1MZhe0KA5cKUdIbGykcfEnMW0gpFI7fcRBjP3NCeRd0gTU1unqQPVmpFuYu6q2ATi29ZJnd
	EQYmh5O/IvKdmIhJdiszWe4R/vuCY/37A++oTb8hbNw/vk/FC+9H5kZmGais/n3zwfleGOraJmf
	wENNayFRzjyLwuUwl/F++Y83+C3FYshudBffG973UEdYq1xjvJz6kju46AVmWDjLqR7k10kbsIV
	KZpuluZldnZ7F9Qlj6dppEayPwy5QXILzAYa6YRyQI80y/nqpeao9M1BxtyWlcCStT0i+y8oW+9
	TScFEBG46+hAIVqJnYeGx8dRrQvYdeZwg8i0QkI3t3P8uPWLXxn5EdBc32f/OwkAM=
X-Received: by 2002:a05:6214:311e:b0:8cc:f3bb:e15c with SMTP id 6a1803df08f44-8d1db5ed518mr43456926d6.41.1781187112314;
        Thu, 11 Jun 2026 07:11:52 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d1eb2b40acsm18450906d6.45.2026.06.11.07.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 07:11:51 -0700 (PDT)
Date: Thu, 11 Jun 2026 10:11:49 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: WenTao Liang <vulab@iscas.ac.cn>
Cc: gregkh@linuxfoundation.org, mathias.nyman@linux.intel.com,
	khtsai@google.com, thorsten.blum@linux.dev, kees@kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] usb: hub: fix refcount leak in usb_new_device()
Message-ID: <e7077523-3558-48e9-9fd8-4e2f266437e5@rowland.harvard.edu>
References: <20260611130223.80884-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611130223.80884-1-vulab@iscas.ac.cn>

On Thu, Jun 11, 2026 at 09:02:23PM +0800, WenTao Liang wrote:
> If usb_new_device() fails after pm_runtime_get_noresume() has
> been called, it does not release the corresponding reference.
> In the successful path, the reference is properly dropped via
> pm_runtime_put_sync_autosuspend().  However, when an error
> occurs during enumeration (e.g. usb_enumerate_device() failure)
> or device registration (e.g. device_add() failure), the function
> jumps to the "fail" label.  That error cleanup path only disables
> runtime PM and marks the device as suspended, never putting the
> usage count back.  This results in a permanent imbalance of
> power.usage_count, preventing future runtime PM state transitions
> and proper device cleanup.
> 
> Fix the leak by adding a pm_runtime_put_noidle() call before
> pm_runtime_disable() in the fail error path, which releases the
> reference without queuing any suspend work and appropriately
> matches the pm_runtime_get
> 
> Cc: stable@vger.kernel.org
> Fixes: 9bbdf1e0afe7 ("USB: convert to the runtime PM framework")
> Signed-off-by: WenTao Liang <vulab@iscas.ac.cn>
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/core/hub.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 24960ba9caa9..05f1a4267aec 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -2731,6 +2731,7 @@ int usb_new_device(struct usb_device *udev)
>  	device_del(&udev->dev);
>  fail:
>  	usb_set_device_state(udev, USB_STATE_NOTATTACHED);
> +	pm_runtime_put_noidle(&udev->dev);
>  	pm_runtime_disable(&udev->dev);
>  	pm_runtime_set_suspended(&udev->dev);
>  	return err;
> -- 
> 2.50.1 (Apple Git-155)
> 
