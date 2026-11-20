Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170046;
	b=L/8/FFlE9yRZXh4h1z/Es87y8bBpU0qCIf+VJUN51gF+Zhlv9MnjGZyEdmU6eIOlUza3
	 6U6sxdHXwuvpGacNcP7QFyx5vPWjoKKZrp8X5k3EXTPdaYPjBCe+gFoe+OrcwGteraCoj
	 hTDpZqHk5EddcaXUU8hwYYITTjA0X7cFY4HcCK8VnMQICCQuLENeGGmTCtbcvwj3HG+tN
	 1ssc596q911i862iypWAAKLwqgbgCEPwAQnxkv6Huqoi2FfTUgF4sgyvPDPrwZmp03QBg
	 P+zy0iwvHdSDtyvJrg4HoiOTJ5O5snmqw3WA22cxztjurLrUfv5RaP9VHRc9RREYP5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170046;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=SGZlAYo30n7ugrkp77p7kIW+vxH8Rz6hFbVLThg8cbE=;
	b=mmQcql5GrhBsAV/MgoR9mtFNoMV/bLVtuIsCG08aFDdgNQqyg5UiyuHVmJMfUgHLw7eF
	 1nK6Ml7M9sX1mBTWyTsck0gCC6hnNGMxdJ7O8Hp1TtHw8qafzWtZWAdXLqTymTtS+1tX5
	 yp4Yp0rwtZ9X7xgmhMSxPNuOlLW8tvEz1orejUv72t3VYHLhiVPQYC+VgfOlvjqMyjVQM
	 SJztV2gMsZhDwuqu+7CGOI4QBM8MqF3wSa/XT+HorLasEXxp8zJIXDrCqZWZoWhtgZSA0
	 IxzEbeGAcyh5ENxnBwmf6dTaCXirRAC0WjCdrSAFaI5VXPr2ZPjCCJPneDpxMhq9cfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=DJzwCWoI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A89E606A320
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 10:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=DJzwCWoI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 899221F000C0;
	Fri, 20 Nov 2026 10:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795170046;
	bh=SGZlAYo30n7ugrkp77p7kIW+vxH8Rz6hFbVLThg8cbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DJzwCWoId5DFHNuCa28szMfoXTPzK0DMUH1O1Rpd95DnUGvl+yIslbpAfciQkKQiJ
	 6hFHaRhqJjEAQTvjrsOmmGDO1Zgf/Yb3Drbhat0eXyy+xdvpkNn0IgHDYghSIVsJFA
	 fWRiw92AIN635CuUjnkc0zqTjxUAUxbrzsIvPnW4=
Date: Fri, 20 Nov 2026 11:20:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ingo Rohloff <ingo.rohloff@lauterbach.com>
Cc: viro@zeniv.linux.org.uk, nkapron@google.com, me@samcday.com,
	nuno.sa@analog.com, michael.bommarito@gmail.com,
	prostitisgabriel@gmail.com, kees@kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_fs: Fix synchronous read() behavior
Message-ID: <2026112059-prodigal-cultivate-3ba7@gregkh>
References: <20260903153737.58087-1-ingo.rohloff@lauterbach.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903153737.58087-1-ingo.rohloff@lauterbach.com>

On Thu, Sep 03, 2026 at 05:37:37PM +0200, Ingo Rohloff wrote:
> To provide consistent read() behavior, USB requests submitted to the UDC
> for OUT endpoints must always have a length that is a multiple of the OUT
> endpoint's max_packet_size.
> 
> Consider a UDC where usb_ep_align_maybe() aligns the request length.

What does this sentence mean?

> If a request completes with more data than was requested by the read()
> call, the excess data is buffered and is returned by the next read() call
> via __ffs_epfile_read_buffered().
> 
> The buffered excess data has at most "max_packet_size-1" bytes.  This
> happens if read() requests "n*max_packet_size+1" bytes and the USB host
> sends "(n+1)*max_packet_size" bytes.
> 
> However, if usb_ep_align_maybe() does not align the request length to a
> multiple of max_packet_size, the behavior is different.  For example, with a
> max_packet_size of 512 bytes (USB HighSpeed), a read() request for 512+128
> bytes may be completed by an OUT transfer containing 512+256 bytes.  The
> kernel returns 512+128 bytes to userspace, while the remaining 128 bytes are
> discarded by the UDC instead of being buffered.  The next read() call then
> blocks until the USB host submits another OUT transfer.
> 
> The former behavior is the expected one.  Enforce it by using
> usb_ep_align() instead of usb_ep_align_maybe().
> 
> Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>
> ---
>  drivers/usb/gadget/function/f_fs.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 43962e05eacf..d31a6330d6a0 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -1078,11 +1078,12 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
>  		}
>  		data_len = iov_iter_count(&io_data->data);
>  		/*
> -		 * Controller may require buffer size to be aligned to
> -		 * maxpacketsize of an out endpoint.
> +		 * To expose a stream like interface for read(), make sure
> +		 * the enqueued read request is a multiple of the maxpacketsize
> +		 * of an out endpoint.
>  		 */
>  		if (io_data->read)
> -			data_len = usb_ep_align_maybe(gadget, ep->ep, data_len);
> +			data_len = usb_ep_align(ep->ep, data_len);

What commit id does this fix?

thanks,

greg k-h
