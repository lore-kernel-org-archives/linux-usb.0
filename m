Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id C26B32E645
	for <linux-usb@vger.kernel.org>; Thu, 18 Jan 2024 20:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705610257; cv=none; b=mCergbkrRmzkcnsambnRe5xc+fQu9C4H37Kk3eQ+YxIGMEdXd9Zh9ODYVWgvJM32ETiiAytdzSM7bAkbWqWJVguFFJ582t8GEOla7ksIM4rNJrdaSSW/2pOMf60FTLFBMa+iwtPJH+RVn50fWahuOkEQ5pkqWP4Wx6ijUeGDnkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705610257; c=relaxed/simple;
	bh=DHs6SzpJxByKygJUaF0oHTl/C08Y4A/lJGT2+8bRT1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNl/CQxZA7b+V6TeDAif6RwCEH6V/bWUJK0T3RGPMgNIFVM5nvu4zoKUvNGyuEoXrja7OZiyYwwA8qX/BycbFTqKpxCGPQJVIh+w/5TZaO/kzatjZivK82qf6HO4EywNNXrRZ/alJT1SfNnIY6wBE0WT5XuNUW9OCIHcMe78BVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 17372 invoked by uid 1000); 18 Jan 2024 15:37:33 -0500
Date: Thu, 18 Jan 2024 15:37:33 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: usb_autopm_get_interface use modern helper
Message-ID: <6013fd1d-2691-4a93-ac25-5cba6e646b64@rowland.harvard.edu>
References: <20240118202300.1616-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240118202300.1616-1-oneukum@suse.com>

On Thu, Jan 18, 2024 at 09:22:55PM +0100, Oliver Neukum wrote:
> PM core now gives us a primitive that does not touch
> the counter in an error case. Use it.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>

Acked-by: Alan Stern <stern@rowland.harvard.edu>

> ---
>  drivers/usb/core/driver.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index e01b1913d02b..e02ba15f6e34 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -1710,9 +1710,7 @@ int usb_autoresume_device(struct usb_device *udev)
>  {
>  	int	status;
>  
> -	status = pm_runtime_get_sync(&udev->dev);
> -	if (status < 0)
> -		pm_runtime_put_sync(&udev->dev);
> +	status = pm_runtime_resume_and_get(&udev->dev);
>  	dev_vdbg(&udev->dev, "%s: cnt %d -> %d\n",
>  			__func__, atomic_read(&udev->dev.power.usage_count),
>  			status);
> @@ -1818,9 +1816,7 @@ int usb_autopm_get_interface(struct usb_interface *intf)
>  {
>  	int	status;
>  
> -	status = pm_runtime_get_sync(&intf->dev);
> -	if (status < 0)
> -		pm_runtime_put_sync(&intf->dev);
> +	status = pm_runtime_resume_and_get(&intf->dev);
>  	dev_vdbg(&intf->dev, "%s: cnt %d -> %d\n",
>  			__func__, atomic_read(&intf->dev.power.usage_count),
>  			status);
> -- 
> 2.43.0
> 
> 
