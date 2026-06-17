Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E543DB97A;
	Wed, 17 Jun 2026 09:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781688914; cv=none; b=SgxI8NA/FDQfaBk8z2QvHZJ0nZhOZYrVTUP3gsdW0XDnbwEZNFyoDMVJuEpBw4defj2Ysxg/x3vTxIoljvwDFBAVtpc0ix/1NGyVZDYpHz4DYf784g62O8Mk9kEUJ5kkn1ygaM6w2BL6NjiCr0OgJX7IXRZsbppQyJRWzdgJIaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781688914; c=relaxed/simple;
	bh=NJ7eCuj//e7CG0gWhYt/Tl0PuEpVm0Stbq5E0XuQaXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S0vpy6oNHAB9N92RhkfJDeErJR7Jjc/9kGjXBpnWf8kSXeVMzeE2JwVzyGe0ck8stT4UETvR8oFO2ci38p+/xODA48vvYFXw94qhNbKHmEDGRQIZ6v4t3Y/2769C2Co9/y7hzckyfM4NQcUBjC2LrBQtFK0kTVKRgetmbKl9uHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=r5TcXezM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="r5TcXezM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 977F91F00AC4;
	Wed, 17 Jun 2026 09:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781688912;
	bh=Q/1SpErP2RGqstD89F90DdEGCiWD3qoqKpEoEV+oWgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=r5TcXezMbqNkD6c5uupIzV5TF4rGqK/q6LplhlVUic3kzNAvn+LMDSQ6u9sLmDBU5
	 JXzn/JIuKNxRNnS/h0xfcTjEIeqdOS9o14hz2FdpXX9mKJtuIZFEy/li3Ly3nqDXgQ
	 JX4HOLNT8YTrt048AA38dNdThwqeQOfsjPg7Rny4=
Date: Wed, 17 Jun 2026 15:04:05 +0530
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Sam Day <me@samcday.com>,
	Michael Bommarito <michael.bommarito@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Ingo Rohloff <ingo.rohloff@lauterbach.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_fs: fix __le16 of wMaxPacketSize
Message-ID: <2026061715-rift-strategy-cdec@gregkh>
References: <20260617085930.711146-1-ben.dooks@codethink.co.uk>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617085930.711146-1-ben.dooks@codethink.co.uk>

On Wed, Jun 17, 2026 at 09:59:30AM +0100, Ben Dooks wrote:
> The wMaxPacketSize is __le16 type, fix the sparse warnings by changing
> the type.
> 
> Fixes:
> 
> drivers/usb/gadget/function/f_fs.c:3346:32: warning: incorrect type in assignment (different base types)
> drivers/usb/gadget/function/f_fs.c:3346:32:    expected unsigned short [usertype] wMaxPacketSize
> drivers/usb/gadget/function/f_fs.c:3346:32:    got restricted __le16 [usertype] wMaxPacketSize
> drivers/usb/gadget/function/f_fs.c:3371:36: warning: incorrect type in assignment (different base types)
> drivers/usb/gadget/function/f_fs.c:3371:36:    expected restricted __le16 [usertype] wMaxPacketSize
> drivers/usb/gadget/function/f_fs.c:3371:36:    got unsigned short [usertype] wMaxPacketSize
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  drivers/usb/gadget/function/f_fs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 75912ce6ab55..35d885178b52 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -3332,7 +3332,7 @@ static int __ffs_func_bind_do_descs(enum ffs_entity_type type, u8 *valuep,
>  		struct usb_request *req;
>  		struct usb_ep *ep;
>  		u8 bEndpointAddress;
> -		u16 wMaxPacketSize;
> +		__le16 wMaxPacketSize;

What commit id does this fix?

thanks,

greg k-h
