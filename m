Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCACA3D1A98;
	Wed, 17 Jun 2026 09:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781688937; cv=none; b=tmcS/oaAyqciy/1rmd46HLnbm/PWLPWjNfKQd6oqm+jqs81kukHaxpRE8HXkjONktsRmzf2poLhCHQz+85aXcJ9t37BQf0vk8mDDWXcdgCGxkjFSs8Ktr9UB0jc5dTP6K1u3qjSAqvecCiqLwV2wD3DiwW3/JFJOyPZl05Q65MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781688937; c=relaxed/simple;
	bh=edawixGznB+VGQhtCeS0Avqm/DizQd/jmY1jI20/cCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CUj/PsbMFWH+g+fmbL1r9hBzpfCzzT0K5CCc6JdOKxyVz3CGRaFSxNta9IrgQjvAgJ+0tCC/r+H9vEZg6ydwWxAwQljNkwBTcLoMG+HiTRJCYq/tIkq3vMIHVkLg0UYkbHwcomC3U9XCiggc+drVI+gg18DjPa+6UMKz7bM83I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rkhPeX0A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rkhPeX0A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEEF51F00ADB;
	Wed, 17 Jun 2026 09:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781688935;
	bh=lGRFrl1fA2K/vkDyLzZ3v2XS2nuwOdXrUtZtfCTKBSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=rkhPeX0AXHkv8r9UaQHrv/5eXLoR4FyxMhwIxoZLd0C3fW9hW7iTQwJqag7UCDya+
	 04zwCiwCOUkDA/v3gc05MDen8wgh0fH/ArIDGt7BqwvIWYeBzgNLRvCtQD9ImIN26B
	 iId3MwRzFJbrMxvVq2ksG3aEF8hR2+b6hZJYoSXc=
Date: Wed, 17 Jun 2026 15:04:28 +0530
From: Greg KH <gregkh@linuxfoundation.org>
To: raoxu <raoxu@uniontech.com>
Cc: mathias.nyman@intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xhci: pci: Disable soft retry for Renesas uPD720201
Message-ID: <2026061713-skinny-barbecue-c85d@gregkh>
References: <EDCDD0E72ED38009+20260617083454.2764851-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <EDCDD0E72ED38009+20260617083454.2764851-1-raoxu@uniontech.com>

On Wed, Jun 17, 2026 at 04:34:54PM +0800, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> The Renesas uPD720201 xHCI controller can fail to complete
> a Stop Endpoint command after a transaction error on an interrupt
> endpoint when soft retry is used.
> 
> This was reproduced with this setup:
> 
>   xHCI: Renesas uPD720201, PCI ID 1912:0014 rev 03
>   dev:  USB Ethernet device with an integrated Genesys Logic
>         USB3.1 hub, USB ID 05e3:0626, and a Realtek RTL8153
>         Ethernet function, USB ID 0bda:8153
> 
> Reproducer:
> 
>   1. Plug the integrated USB hub and Ethernet device into the
>      1912:0014 xHCI controller.
>   2. Let r8152 bind to the 0bda:8153 RTL8153 Ethernet function
>      behind the integrated hub.
>   3. Bring the Ethernet device up.
>   4. Hot-unplug the device.
> 
> The host reports a transaction error on the RTL8153 interrupt
> endpoint, queues a soft reset, and later times out the Stop
> Endpoint command while disconnecting the device:
> 
>   Transfer error for slot 8 ep 6 on endpoint
>   Soft-reset ep 6, slot 8
>   Ignoring reset ep completion code of 1
>   xHCI host not responding to stop endpoint command
>   xHCI host controller not responding, assume dead
>   HC died; cleaning up
> 
> The Renesas 1912:0014 controller cannot safely use the xHCI soft
> retry path. Set XHCI_NO_SOFT_RETRY for this controller so
> transaction errors use the pre-soft-retry recovery path. With
> this quirk the same hot-unplug test no longer times out the Stop
> Endpoint command and the RTL8153 remains usable and stable.
> 
> Fixes: f8f80be501aa ("xhci: Use soft retry to recover faster from transaction errors")
> 
> Signed-off-by: Xu Rao <raoxu@uniontech.com>
> ---
>  drivers/usb/host/xhci-pci.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index 585b2f3117b0..d70c6a6a64bb 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -427,6 +427,7 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
>  	if (pdev->vendor == PCI_VENDOR_ID_RENESAS &&
>  	    pdev->device == 0x0014) {
>  		xhci->quirks |= XHCI_ZERO_64B_REGS;
> +		xhci->quirks |= XHCI_NO_SOFT_RETRY;
>  	}
>  	if (pdev->vendor == PCI_VENDOR_ID_RENESAS &&
>  	    pdev->device == 0x0015) {
> --
> 2.50.1
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:


- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
