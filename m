Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998B43321C2;
	Thu, 12 Mar 2026 05:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773291751; cv=none; b=oB9QqU3Meme4VJQH6Wc4Ldm38yGqpqu0X/av/zhPV89zZBue1y1wCHMak5GB7yQw4Q8VY9OhA7vC/G0GUsPjPjOlQQNeNsgYAbBlwZvxrp8KW7ubdmntXY+C36pcszLQU1sy8KuvKRJG5ZvbVeW9YeK0a+Ixi+EFoeLU4OnYols=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773291751; c=relaxed/simple;
	bh=g53hMssjnMeh1aZWKLwdb8tf3VHkoC5iHEZzLKB4aIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o4qh8IWGU9h37KWkil++vkTZ+ThA0tDwmrVzvQmlaphHDYQegAzRRsAk5QMB5ZfPk40r8IzVL9DX9ZQCKTCkyoqKnnNajWdwhWI0+ESxNidjWyll189WF4/jj+CusxKMVxa4rEIykkr+2sSKLivdZvVVTIKT4wskdlS1PfqTMPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cmy+d9pW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cmy+d9pW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 924D0C4CEF7;
	Thu, 12 Mar 2026 05:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773291751;
	bh=g53hMssjnMeh1aZWKLwdb8tf3VHkoC5iHEZzLKB4aIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cmy+d9pWH3nON1ZDa0cfauLiJxYYWUhrURf6br63BXQJnsAejsshSNw84PMLpg3LZ
	 ql7RoxLWQ/0sZ5843/nhK5E31wrr4+dgx2mcPkU8GkK8kOxSCw6J2IFD2P4uZ1WWyl
	 5uxIEjD7Y4VDQrQsbZ0v5vkv0DLo2aZmRvEeyLh8=
Date: Thu, 12 Mar 2026 06:02:25 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: bence98@sch.bme.hu
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: core: Use `krealloc()` in `usb_cache_string()`
Message-ID: <2026031209-shawl-unshackle-f4eb@gregkh>
References: <20260312-usb-krealloc-v1-1-f76b92b92402@sch.bme.hu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260312-usb-krealloc-v1-1-f76b92b92402@sch.bme.hu>

On Thu, Mar 12, 2026 at 12:06:35AM +0100, Bence Csókás via B4 Relay wrote:
> From: Bence Csókás <bence98@sch.bme.hu>
> 
> Instead of "shrinking" the allocation by `kmalloc()`ing a new, smaller
> buffer, utilize `krealloc()` to shrink the existing allocation. This saves
> a `memcpy()`, as well as guards against `smallbuf` allocation failure.
> 
> Signed-off-by: Bence Csókás <bence98@sch.bme.hu>
> ---
> Using `krealloc()` makes this code from 2005 more readable as well as
> robust. Nested `if`s were also unrolled.

How is it more "robust" now?

> ---
>  drivers/usb/core/message.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

Same number of lines. Well, not quite, because I'm going to ask you to
remove the ?: stuff below...

> diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
> index ea970ddf8879..dfe61d8b913b 100644
> --- a/drivers/usb/core/message.c
> +++ b/drivers/usb/core/message.c
> @@ -1005,7 +1005,7 @@ int usb_string(struct usb_device *dev, int index, char *buf, size_t size)
>  }
>  EXPORT_SYMBOL_GPL(usb_string);
>  
> -/* one UTF-8-encoded 16-bit character has at most three bytes */
> +/* one 16-bit character, when UTF-8-encoded, has at most three bytes */

Why change this?

>  #define MAX_USB_STRING_SIZE (127 * 3 + 1)
>  
>  /**
> @@ -1026,17 +1026,17 @@ char *usb_cache_string(struct usb_device *udev, int index)
>  		return NULL;
>  
>  	buf = kmalloc(MAX_USB_STRING_SIZE, GFP_NOIO);
> -	if (buf) {
> -		len = usb_string(udev, index, buf, MAX_USB_STRING_SIZE);
> -		if (len > 0) {
> -			smallbuf = kmalloc(++len, GFP_NOIO);
> -			if (!smallbuf)
> -				return buf;
> -			memcpy(smallbuf, buf, len);
> -		}
> +	if (!buf)
> +		return NULL;
> +
> +	len = usb_string(udev, index, buf, MAX_USB_STRING_SIZE);
> +	if (len <= 0) {
>  		kfree(buf);
> +		return NULL;
>  	}
> -	return smallbuf;
> +
> +	smallbuf = krealloc(buf, len + 1, GFP_NOIO);
> +	return smallbuf ? : buf;

I hate ? : except where it can only be used (i.e. in function
arguments), so please spell it out exactly what you are doing here.

Also, how was this tested?

thanks,

greg k-h
