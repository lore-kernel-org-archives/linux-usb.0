Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011292EDD7D;
	Wed,  8 Jul 2026 15:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523744; cv=none; b=ByyK0RBeqJULZdUOLFljKUKR0p34hKRM6oudLw+5jhBUCxo6vjAUYFPGFbwrySq1W8G8+CBZIErj308TH7g+92K+zj2SCY6oTId6bvbQayBFnscqj4bK9KOvehDz2LjBarhxTel3g944yevF9BKFISoi+CUwSno9b7SUj6kUUZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523744; c=relaxed/simple;
	bh=+4EZTeF5BW5YflPcYoUu1MdtONk9/06IRJLQwo8OQLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQPBkwUiE445oP3Hw1/RE9Yqx/4UURCyMzm6CS6Wh0flWc6HGRFO7uoFzKM+5u6wAIkwTxjYyo1LiTKABwhYqay01GHlfFPE/l96KHZSAPCypFQvscB733Ehrv4zT5Jik0R0ZnMZIXvzIXO008snGuw1HRSNVmjmWFSG3R25hak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=v6p2R4Un; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="v6p2R4Un"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3481F000E9;
	Wed,  8 Jul 2026 15:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783523742;
	bh=uUrbf42V+Bi6dowechLi9Sb+kJ/YGLOEY+GITQKzYiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=v6p2R4UnUv4qgc1vuvDoQhMedXBQBd75LPNeJB+Ua5vEqn4DHkc4wQpQitefbh2pR
	 OA4FCFo02pDqTvffk8NOq/7ArYkVPQ2k0jqpRpR1hPibgQ7Q3JPuYMkx2edFRc/g9X
	 a1LHzqEVr3AdDBA3dg0n0SSX+MDb28dnBkOQc2RA=
Date: Wed, 8 Jul 2026 17:15:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Keshav Verma <iganschel@gmail.com>
Cc: johan@kernel.org, kees@kernel.org, o.bock@fh-wolfenbuettel.de,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: misc: cypress_cy7c63: check control transfer status
Message-ID: <2026070835-thorn-doable-8c28@gregkh>
References: <20260618203053.4725-1-iganschel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618203053.4725-1-iganschel@gmail.com>

On Fri, Jun 19, 2026 at 02:00:53AM +0530, Keshav Verma wrote:
> read_port() currently ignores errors from vendor_command() and always
> returns the cached port value. This can report stale data when the USB
> control transfer fails or returns a short response.
> 
> Return the underlying error for failed transfers and report -EIO if the
> device returns fewer bytes than required.
> 
> Fixes: 9189bfc2df0f ("[PATCH] USB: rename Cypress CY7C63xxx driver to proper name and fix up some tiny things")
> Signed-off-by: Keshav Verma <iganschel@gmail.com>
> ---
>  drivers/usb/misc/cypress_cy7c63.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/misc/cypress_cy7c63.c b/drivers/usb/misc/cypress_cy7c63.c
> index 4a7f955ba85b..8601ee0a1ea3 100644
> --- a/drivers/usb/misc/cypress_cy7c63.c
> +++ b/drivers/usb/misc/cypress_cy7c63.c
> @@ -177,6 +177,10 @@ static ssize_t read_port(struct device *dev, struct device_attribute *attr,
>  	result = vendor_command(cyp, CYPRESS_READ_PORT, read_id, 0);
>  
>  	dev_dbg(&cyp->udev->dev, "Result of vendor_command: %d\n\n", result);
> +	if (result < 0)
> +		return result;
> +	if (result < 2)
> +		return -EIO;
>  
>  	return sprintf(buf, "%d", cyp->port[port_num]);
>  }

You only changed one call to vendor_command() here, why?  Why not fix
this all up by changing vendor_command() to use a better function that
will give you a sane error value, and then check that?

Start with this patch:


diff --git a/drivers/usb/misc/cytherm.c b/drivers/usb/misc/cytherm.c
index d26f460ecdbc..86c4678e23b3 100644
--- a/drivers/usb/misc/cytherm.c
+++ b/drivers/usb/misc/cytherm.c
@@ -51,12 +51,10 @@ static int vendor_command(struct usb_device *dev, unsigned char request,
 			  unsigned char value, unsigned char index,
 			  void *buf, int size)
 {
-	return usb_control_msg(dev, usb_rcvctrlpipe(dev, 0),
-			       request, 
-			       USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_OTHER,
-			       value, 
-			       index, buf, size,
-			       USB_CTRL_GET_TIMEOUT);
+	return usb_control_msg_recv(dev, 0, request,
+				    USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_OTHER,
+				    value, index, buf, size,
+				    USB_CTRL_GET_TIMEOUT, GFP_KERNEL);
 }
 

And go from there!

thanks,

greg k-h
