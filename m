Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D63D371860;
	Sun,  2 Aug 2026 06:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785653414; cv=none; b=ggyVHV+jQHxRCWPjwp2Jt0naIfNRDjbtlaVWgge8sYd4n9Z5hxRA09EhsLdAlJP6nTNRHnyqpffjAqMs/QMFSMrqLZtWfb3439CJ3l20rQRzEyTODOXCIj8EGwlDIEEuZGmveTv79xH20LTOw3K5K9lE8Y8PJ2pm3MBLygzopiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785653414; c=relaxed/simple;
	bh=M6pAKNX50XXG1YLuYhXHjLBW2ZPTRPi1nw8Ar1PPog0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TWi4GkXdyoWT1FIG6lVkh3NvuTAeaXIr6WdqPHIcKkBLQ5a5wMdgqxcl+R8utOIRZmLK/7FgxPux30Mxc17SPG7DUEf9lw3BZRuzHtTHFMlKPTHoIRlsi7gYJLebfhRqMRTu3h01JpjEFR1KKPL4Sdt0R0ICnCwEfAaHtIcADME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=p/U/I4qE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="p/U/I4qE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C0961F00AC4;
	Sun,  2 Aug 2026 06:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785653413;
	bh=2ms8peD3gBhGpckea1Q+PxSxIjsDsIoXRur8ga0rlkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=p/U/I4qEaylIvGlTEOuwiTXIGj+wS1vfLLG7uZ8Wu7qKuZGL/bZi7G6Bhqfng/ov/
	 rNCuBThMi7f3RcKTsv6/BAJw94hXQPQn5Bvb2AU2CNzUF70HZdkwdZT63d7X3eAAKh
	 dPtW3tp1+18/2Spdb+K/DzLw57E+1OMtznOrtt8Q=
Date: Sun, 2 Aug 2026 08:48:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rituparna Warwatkar <rwarwatkar@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	syzbot+54927260acba030187a6@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: gadget: uvc: don't pack struct
 uvcg_extension_unit_descriptor
Message-ID: <2026080223-turbojet-unsold-7290@gregkh>
References: <20260801163747.82910-1-rwarwatkar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801163747.82910-1-rwarwatkar@gmail.com>

On Sat, Aug 01, 2026 at 06:37:47PM +0200, Rituparna Warwatkar wrote:
> kmemleak reports the baSourceID and bmControls arrays allocated by the
> UVC extension-unit configfs attributes as leaked, e.g.:
> 
>   BUG: memory leak
>   unreferenced object 0xffff888114fee2c0 (size 8):
>     __kmalloc_noprof
>     uvcg_extension_ba_source_id_store
>     configfs_write_iter
>     vfs_write
>     ksys_write
> 
> The arrays are not actually leaked: they are reachable through
> xu->desc.baSourceID / xu->desc.bmControls and are freed when the
> extension unit is removed.  The problem is that struct
> uvcg_extension_unit_descriptor is marked __packed, so these two heap
> pointers are stored at unaligned offsets (22 and 31).  kmemleak only
> scans memory on pointer-aligned boundaries, so it never sees the
> pointers and reports the arrays as unreferenced.
> 
> Unlike the UAPI struct uvc_extension_unit_descriptor, this is a purely
> in-memory staging structure: baSourceID and bmControls are pointers,
> not inline arrays, and the wire descriptor is assembled field by field
> in UVC_COPY_XU_DESCRIPTOR().  Nothing relies on the packed layout, so
> the __packed attribute is unnecessary and only serves to misalign the
> pointers.
> 
> Drop __packed so the pointers are naturally aligned and visible to
> kmemleak, silencing the false positive.
> 
> Fixes: 0525210c9840 ("usb: gadget: uvc: Allow definition of XUs in configfs")
> Reported-by: syzbot+54927260acba030187a6@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=54927260acba030187a6
> Signed-off-by: Rituparna Warwatkar <rwarwatkar@gmail.com>
> ---
>  drivers/usb/gadget/function/uvc_configfs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc_configfs.h b/drivers/usb/gadget/function/uvc_configfs.h
> index 9391614135e..5a882afbce4 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.h
> +++ b/drivers/usb/gadget/function/uvc_configfs.h
> @@ -176,7 +176,7 @@ struct uvcg_extension_unit_descriptor {
>         u8 bControlSize;
>         u8 *bmControls;
>         u8 iExtension;
> -} __packed;
> +};

Why not rearrange the structure so that there is no space in it now
instead?

thanks,

greg k-h
