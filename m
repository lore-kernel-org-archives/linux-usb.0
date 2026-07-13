Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF1A7260D
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 06:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783924320; cv=none; b=O7uOPctiuBpo6z0a188f78L6o1puJrS+ueHn6vONh7Mo+wF2PAz873jBXizrj+kVDVi38bGbV09Kfhb7OETbLAppNggXeeOh9RwFyx80AeiNa27n0R+qNzdWvEceMVvHuNHif3aspfmwE5YkVzp40KUCeQM13TbFN5qNUrpi1ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783924320; c=relaxed/simple;
	bh=AWoABNd+aJme5m7MS3OjonUgVHgjHRt7wHTFRiRkSJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dF0gEcy9ri+hFb02HgUoZ/GWkYM4vVmnOAuK5BotI2bC4Yqo6s/KbCdRLX4f/WErRoZGLipTULev/d02i2HsMmgDvvJ3hrY6DHjBMIbgfZj6j7gzSRlxYIvw2PWMx6dDusTxuQnEhwYJ1ECOS8rwVP3a2tqiQ1BZS993gK2Kpl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SJ9c5au6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SJ9c5au6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3867D1F000E9;
	Mon, 13 Jul 2026 06:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783924318;
	bh=0xaXOIniK/DoKp5XnczCI2f/fexCxTvUZxGmYKziOAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SJ9c5au606df37CLrwgAdeg52jYBPT/GqmStjrqw+3p/kmtVDfkFZCPe8URN6sQdd
	 2q0+ujFErO7CRphSmvydxIHgUjZGE1kkCLAi5HB8qm2PoZ+aGWnvKlCv1qDQdY5rM8
	 rpB+ThCNGffGDu4A2DhcSsTxuvyuKJaN90wCxBQY=
Date: Mon, 13 Jul 2026 08:30:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiale Yao <yaojiale02@163.com>
Cc: johan@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: serial: fix slab out-of-bounds read in interrupt
 URB callback
Message-ID: <2026071325-onward-sabotage-13e8@gregkh>
References: <20260712170012.3503601-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712170012.3503601-1-yaojiale02@163.com>

On Mon, Jul 13, 2026 at 01:00:12AM +0800, Jiale Yao wrote:
> The interrupt URB buffer is allocated in setup_port_interrupt_in() based
> on the endpoint's wMaxPacketSize:
> 
>     buffer_size = usb_endpoint_maxp(epd);
>     port->interrupt_in_buffer = kmalloc(buffer_size, GFP_KERNEL);
> 
> When a USB device declares wMaxPacketSize = 8 on its interrupt IN
> endpoint, the buffer is allocated from kmalloc-8 cache (exactly 8 bytes).
> 
> If the device sends a short packet (actual_length < wMaxPacketSize),
> the URB completes with status == 0 and the callback proceeds to read:
> 
>     data[sizeof(struct usb_ctrlrequest)]
> 
> which evaluates to data[8], accessing 1 byte beyond the allocated 8-byte
> buffer. This results in a slab out-of-bounds read.
> 
> Fix this by adding a bounds check before accessing data[8], ensuring that
> the actual length is sufficient to contain a full USB control request
> header.
> 
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>  drivers/usb/serial/option.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 4c4009b8a46d..4aae54e1eacf 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -2672,6 +2672,13 @@ static void option_instat_callback(struct urb *urb)
>  			dev_dbg(dev, "%s: NULL req_pkt\n", __func__);
>  			return;
>  		}
> +
> +		if (urb->actual_length < sizeof(struct usb_ctrlrequest) + 1) {
> +			dev_dbg(dev, "%s: short interrupt transfer: %d bytes\n",
> +				__func__, urb->actual_length);
> +			return;
> +		}

Close, shouldn't this be rewritten to be:

               if (urb->actual_length < sizeof(*req_pkt) + 1) {
                       dev_dbg(dev, "%s: short packet %u\n", __func__,
                               urb->actual_length);

As that's the structure you need to care about instead?

Also, nit, dev_dbg() already has the __func__ name in it, no need to
duplicate it again (yes, the other ones in this file do that, so it is
the style here...)

thanks,

greg k-h
