Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB9D3BB69D
	for <linux-usb@vger.kernel.org>; Mon,  1 Jun 2026 14:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780324886; cv=none; b=BfYlcvjwW0jDyrRMsAGg3aPxiD220eAOZy1mrWwW59tnGDbrwr8WlFs4Ppt1VF2TWGahzxg4alXdNJa8UYIcoN0/y59P/nRp7V0XV5r+SqaTTHt2f+6P5AOL0jBi3GhbQV9E3qira/hB1K36u0HNGHvwOhOkGi3HtmU/F7KOFIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780324886; c=relaxed/simple;
	bh=qxStdVO0HHK7xhY0M/pWc7rYQr3yQ/82IkaYQM+zeMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EVHEWkvqLfUSqO6hwfYudxo9x+IoUcFiYG77It8EJGmDj/IGJd8lxG5te3eRHDRbsszrVcB4XE3VRoWXIBJx9kpjKp9kORiLJLFEPyqgnUnHa1r1YSSwGnHKogPzqzTUeQGyGTKndTMRapejLcR7zdawDPZc8WGl/AKkWVGIMe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Hnb8jl3X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Hnb8jl3X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56C371F00893;
	Mon,  1 Jun 2026 14:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1780324885;
	bh=5fVYfxu4iBPp9cWOx6zGGw7y+NusVdBS/iqGHDvWmrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hnb8jl3X3SgHZ1zZbi7+s9Bif+/wB1IjcpYBDS9kgvccV4Kp8+liKAKxmepiE9ZlR
	 +gV2433nEE2ZGiqG1Uuk9sOWf9UEsVSqMXxl8rFOyaWdtIg+6OfOyj0QkPmi0CIlzV
	 Q00/R4/zbTffPvCnUBvBTqYIy1ph+bgkuxrUYAi4=
Date: Mon, 1 Jun 2026 16:40:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Junzhe Li <ginger.jzllee@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: misc: ldusb: fix ordering of usb_deregister_dev()
 and usb_set_intfdata()
Message-ID: <2026060140-cornhusk-cabana-9ade@gregkh>
References: <20260601075524.136957-1-ginger.jzllee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601075524.136957-1-ginger.jzllee@gmail.com>

On Mon, Jun 01, 2026 at 03:55:24PM +0800, Junzhe Li wrote:
> In ld_usb_disconnect(), usb_set_intfdata(interface, NULL) was called before
> usb_deregister_dev(interface, &ld_usb_class).
> This opens a race window with usb_open() in the USB core:
> 
>   T0 (ld_usb_disconnect)               T1 (usb_open)
>   --------------------------           -------------------------
>                                        fops = usb_minors[minor]  [t0]
>                                        /* fops still valid here */
>                                        file->f_op->open(inode, file)
>                                          ld_usb_open()
>                                            dev = usb_get_intfdata() [t1]
>                                            if (!dev)
>                                              return -ENODEV;
>   usb_set_intfdata(iface, NULL) [t2]
>                                            access dev->mutex [t3]
>                                            /* dev is NULL! */
>   usb_deregister_dev()
>     usb_minors[minor] = NULL   [t4]
> 
> Because t0 precedes t1 precedes t2 precedes t3 precedes t4, T1 can obtain
> the file_operations pointer for the device (t0, while the minor is still
> registered), then continue into ld_usb_open() where it calls
> usb_get_intfdata() and gets NULL back, leading to a NULL dereference.
> 
> The intuition is that the global exposure to the 'usb_minors' should be 
> disabled first, so that subsequent nullification of the interface data 
> pointer can be regarded as a local cleanup.
> 
> Fix the race by calling usb_deregister_dev() first, which removes the
> device from usb_minors[] before the interface data pointer is cleared.
> Any concurrent usb_open() that arrives after usb_deregister_dev()
> returns will fail to look up the fops and will never reach ld_usb_open().
> 
> Reported-by: Junzhe Li <ginger.jzllee@gmail.com>

When you author a patch, no neeed for reported-by.

> Closes: https://lore.kernel.org/linux-usb/2026060157-pettiness-corporal-05eb@gregkh/

No, I said if this is actually an issue, send a patch, not that this is
an issue :)

> Signed-off-by: Junzhe Li <ginger.jzllee@gmail.com>

What commit id does this "fix"?

thanks,

greg k-h
