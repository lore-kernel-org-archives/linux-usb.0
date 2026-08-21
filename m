Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843553A545E;
	Fri, 21 Aug 2026 11:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787310168; cv=none; b=rdEL9OrSl8vwE6Zul8DRYXP6O5Yxd9Uk6Dr2iAYo2ipdyQ0iQah7wKs8Xq1lmjrX7zkYTlIdYVVaMm/RAbenHs/D+qX7umkUaJfBd6qxMx8c+w1EZl3HnpWY/FweM7uSNnJ2TQhxcXkKyd2ZU5u+QPcEgqcf5Q09oEwy+QEJ79E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787310168; c=relaxed/simple;
	bh=ZT0Wb3qqCKiYP8RJ2yWqNsswt44R4koT2UBn9HauzeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YaJnwwIV3qS+L6H6FpUGZimfjEb2+vPQ1MT2qfk2RfF6xVUFC+sFrMMUxh7a3h3e4Aq2GsQMkGu1zM7oHFij+f8CaymegCH/EeXgcD0d0sXhV3f1IJK2MCGw7XpSTK90RM1kK/fpxhcoM/DFB1sXnzFOie09UlRMNO46LIZYJ5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FgLS9Pqu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FgLS9Pqu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F6731F0155A;
	Fri, 21 Aug 2026 11:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787310165;
	bh=YCPSaOdXVlY/TgrPkTaNMPv+mvN9l+vkp5HfGALBxDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FgLS9PquXSfXJ57JdjR6SysxN6v2KuDEIA9FueVGLxPyMMFN9nR7zVJh8rxU4dCeS
	 fpbZrbJ1JH3UEzlKOZYZA7m2cpYM72j7W0HSKZ6gxL9BJAOSXH01I6m6OnwINDrKTW
	 FkwbFxHFvihODL5E/kj29HZtc2/EfUIZnFj9N8R0=
Date: Fri, 21 Aug 2026 13:01:06 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Haofeng Li <lihaofeng@kylinos.cn>
Cc: Kees Cook <kees@kernel.org>, Melbin K Mathew <mlbnkm1@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Xu Rao <raoxu@uniontech.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Haofeng Li <13266079573@163.com>
Subject: Re: [PATCH] usb: gadget: f_printer: prevent OOB write in
 GET_DEVICE_ID
Message-ID: <2026082154-estrogen-spoon-0a9e@gregkh>
References: <20260821083428.3234295-1-lihaofeng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821083428.3234295-1-lihaofeng@kylinos.cn>

On Fri, Aug 21, 2026 at 04:34:28PM +0800, Haofeng Li wrote:
> printer_func_setup() services the Printer Class GET_DEVICE_ID request
> by echoing the PnP string previously stored in the gadget's configfs
> pnp_string attribute:
> 
> 	value = strlen(*dev->pnp_string);
> 	buf[0] = (value >> 8) & 0xFF;
> 	buf[1] = value & 0xFF;
> 	memcpy(buf + 2, *dev->pnp_string, value);
> 
> The EP0 response buffer is exactly USB_COMP_EP0_BUFSIZ (4096) bytes,
> allocated once by composite_dev_prepare():
> 
> 	cdev->req->buf = kzalloc(USB_COMP_EP0_BUFSIZ, GFP_KERNEL);
> 
> The two-byte length prefix plus the string body must therefore fit
> into 4096 bytes.  pnp_string is stored via kstrndup(page, len,
> GFP_KERNEL) in f_printer_opts_pnp_string_store(); configfs passes at
> most PAGE_SIZE - 1 (4095) bytes down to the store callback, so a
> 4095-byte string combined with the 2-byte length field makes the
> memcpy() write buf[2..4096], one byte past the end of the allocation.
> 
> Attack chain (USB Printer gadget on the victim device):
> 
>   1. pnp_string is set to a 4095-byte value through the gadget's
>      configfs attribute
>      (~/config/usb_gadget/<gadget>/functions/printer.usb0/pnp_string);
>      configfs accepts up to PAGE_SIZE - 1 bytes (fs/configfs/file.c).
>   2. The printer function is enabled and the gadget is bound to its
>      UDC.  An attacker in control of the connecting USB host sends a
>      Printer Class GET_DEVICE_ID request (bmRequestType=0xA1,
>      bRequest=0x00, wIndex pointing at the printer interface); the
>      usblp host driver also issues this request on enumeration.
>   3. composite_setup() -> printer_func_setup() -> memcpy(buf + 2,
>      pnp_string, 4095) performs a 4097-byte write into the 4096-byte
>      EP0 response buffer, overflowing the heap object by one byte and
>      potentially corrupting adjacent slab objects or allocator
>      metadata (CWE-787).
> 
> With KASAN enabled the overflow is reliably reported (this is
> reproducible end to end with a configfs gadget + dummy_hcd):
> 
> 	BUG: KASAN: slab-out-of-bounds in printer_func_setup+0x2ec/0x3c0
> 	Write of size 4095 at addr ffff88818e461002
> 
> Fix it at both ends:
> 
>   - clamp the string length to USB_COMP_EP0_BUFSIZ - 2 in
>     printer_func_setup() so the copy can never exceed the EP0 buffer,
>     and
>   - reject pnp_string values longer than USB_COMP_EP0_BUFSIZ - 2 in
>     f_printer_opts_pnp_string_store() so an oversized string is never
>     stored in the first place.
> 
> Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
> ---
>  drivers/usb/gadget/function/f_printer.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)

Did you forget an Assisted-by: tag here?
