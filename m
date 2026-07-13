Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFBB3FE645;
	Mon, 13 Jul 2026 12:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944190; cv=none; b=msNW3k+R57Yd/R2dL7G+Il8MTT4pQ7+kVCVickB7Ig6XO8CyCURxDkN+eNOnizmiNwRBZHQz5DbSZSMmiQXuHfvgpL/MUSGrsvKgdAfywGostSaaCs0m2TuxsTTHzRu0Ll0aOrDP1dvSJmIReK97BSZHxeDS/t8erTbjEyxFeaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944190; c=relaxed/simple;
	bh=Uzu3PqqrhA7ignfKumRUHkPu2I4MtrI8j0BiJqLklRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BMVb8roGVXpmWSOKPNKVkhJhTKg6y6uJIAaj3EhiDFUXcdm9dePpkzdCQLaw5G6ZmRLmFwrg0eVCPs6JZCaZsQZAeSG39GzeV/WJt7o07xr/UKwEILW3RXseuSVA79gEQCoVNzn79hPWbwXWMJM5Y+T4GEC9rcOA82+63eXeoRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SQe8kqwb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SQe8kqwb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 500621F000E9;
	Mon, 13 Jul 2026 12:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783944188;
	bh=n+Q8pIAemSzcUgx6BLEuKGum0XzSJ4wmPKWNEfSNwQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SQe8kqwb5mumTbOPmpJMUz/rFj3b6/PRAjBCMbLK3qo2pphoawWyBwT74Cg7VcFWB
	 vvhOxTdG061jvzCk51kPH0e0DI4ZEsM1sGtg0AiWMImAsKfQhh/s51RYNYQiyY5/3S
	 VXbFfRkszmm404A+8ln21oCEsazHHlQ//8/mMxhs=
Date: Mon, 13 Jul 2026 14:03:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kanishka De Silva <kpskanna1915@gmail.com>
Cc: Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: adutux: take buflock when resetting
 read_buffer_length in adu_open()
Message-ID: <2026071330-amendment-glamour-b6e4@gregkh>
References: <CAKJ0_Ldatt+6_q_Sudg8nCnJLz5Vc8eihK9O6mwKh7tKBZm8iw@mail.gmail.com>
 <20260713075616.1625-1-kpskanna1915@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713075616.1625-1-kpskanna1915@gmail.com>

On Mon, Jul 13, 2026 at 01:26:16PM +0530, Kanishka De Silva wrote:
> dev->read_buffer_length is otherwise only ever touched under
> dev->buflock (by adu_interrupt_in_callback() and adu_read()), per the
> locking scheme documented in the comment above struct adu_device.
> adu_open() resets it to 0 without holding buflock.
> 
> In the current code this is not a reachable race. adu_open() and
> adu_release() are fully serialized by adutux_mutex, and
> adu_release_internal() calls usb_kill_urb() (via
> adu_abort_transfers()) before that mutex is dropped, which blocks
> until any in-flight adu_interrupt_in_callback() has returned. The
> write in adu_open() also precedes the urb (re)submission in program
> order, so the callback cannot observe or race with it there either.
> 
> This change brings the assignment under buflock purely so the
> field's locking is locally consistent with the driver's documented
> scheme, making the invariant easy to verify without having to reason
> across adu_open(), adu_release_internal(), and usb_kill_urb()'s
> blocking semantics. No behavioral or functional change intended.
> 
> v2:
>  - Retitled and reframed from "fix unlocked read_buffer_length write
>    in adu_open() (data race)" to a lock-discipline consistency
>    change. Discussion on the RFC (with Oliver Neukum) established
>    that adutux_mutex serialization plus usb_kill_urb()'s blocking
>    semantics rule out any runtime-reachable race here, so this is
>    no longer presented as a bugfix. (Oliver Neukum, Greg
>    Kroah-Hartman)

Version info goes below the --- line please.

> 
> Signed-off-by: Kanishka De Silva <kpskanna1915@gmail.com>
> ---
>  drivers/usb/misc/adutux.c | 3 ++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/misc/adutux.c b/drivers/usb/misc/adutux.c
> index 1111111..2222222 100644
> --- a/drivers/usb/misc/adutux.c
> +++ b/drivers/usb/misc/adutux.c
> @@ -337,7 +337,8 @@ static int adu_open(struct inode *inode, struct file *file)
>  	file->private_data = dev;
>  
>  	/* initialize in direction */
> -	dev->read_buffer_length = 0;
> +	spin_lock_irq(&dev->buflock);
> +	dev->read_buffer_length = 0;
> +	spin_unlock_irq(&dev->buflock);

This makes no sense, the single write here isn't going to need a lock,
it can't "tear" and if someone else is doing something with it it can
change right after the lock is released, right?

So what exactly is this supposed to be "fixing"?

Ah, your changelog says "not really fixing anything", so then it's not
needed at all, so why add this at all?

thanks,

greg k-h
