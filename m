Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C9630EF86;
	Mon, 17 Aug 2026 06:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786948474; cv=none; b=FS0F3TlzYW/jtvrPRFTYJ8qDIM+e06F/VxiPo0ggVr6uKnC9fSvPXJb9s9zdTF3eYxgMQlv+qciEMbAXBU2g1/nuplj+Eu7+LjzAWHykrci7xw5n+0QzwdC/lV0b6gvc1bswXQIOHdn/6LMlYLIklCBQBz5oTOSpZzqxQOdojqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786948474; c=relaxed/simple;
	bh=QswajVEM2U3K1eQnfGxxhkETXRd6Ar2u6oUY0cijimk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W/GqYDlGcJbW1XpHT1mmkw8AkVO6JWYeQx5/x7YUI1ontH2CqX9e+c78kSW8+HYN1jKJ5Za+KsJMwg3CDT7l9eThaomOxfMZxHmo8PyKIxRbT1wJOn49Hu9Le1EeNLEFToViG0Z2J0GiVlpFHKmK9xanmAV9vT7rvnP8NwxefY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gYogqZ+1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gYogqZ+1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BCF81F000E9;
	Mon, 17 Aug 2026 06:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786948472;
	bh=T4F7WetRB7DBsGawY367uWyHn6q6UG7IAeFVIYb1aao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gYogqZ+1FMxMXoupnTUkviPvkGYnVIT//cT33E6i6gHgBw192TRN6SQ2VyqJW3CID
	 YrNNKAAIJVVAsUbhdo/WOxEd9bNSprexeRS2EPrkCLq6B0Q0a7Nhgvj0B27w3svtWM
	 Lp9vl1cM2v0cJpNaSPCxHKHwDZouGNCOhuJSDa94=
Date: Mon, 17 Aug 2026 08:32:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: longlong yan <yanlonglong@kylinos.cn>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: f_fs-aio-simple: add NULL checks for malloc calls
Message-ID: <2026081736-rendering-excess-0bee@gregkh>
References: <20260817062756.781-1-yanlonglong@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817062756.781-1-yanlonglong@kylinos.cn>

On Mon, Aug 17, 2026 at 02:27:56PM +0800, longlong yan wrote:
> Add NULL checks for the return values of malloc() in the aio_simple
> FFS example application. If any of the four malloc calls (buf_in,
> buf_out, iocb_in, iocb_out) fails, the subsequent code would
> dereference NULL pointers in the main loop.
> 
> Since free(NULL) is safe, the error path frees all four buffers
> unconditionally, then cleans up the remaining resources (io context,
> endpoint file descriptors) consistent with the existing cleanup at
> the end of the function.
> 
> Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
> ---
>  .../ffs-aio-example/simple/device_app/aio_simple.c  | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/tools/usb/ffs-aio-example/simple/device_app/aio_simple.c b/tools/usb/ffs-aio-example/simple/device_app/aio_simple.c
> index 96616eb4600b..07ca1f136ad7 100644
> --- a/tools/usb/ffs-aio-example/simple/device_app/aio_simple.c
> +++ b/tools/usb/ffs-aio-example/simple/device_app/aio_simple.c
> @@ -294,6 +294,19 @@ int main(int argc, char *argv[])
>  	iocb_in = malloc(sizeof(*iocb_in));
>  	iocb_out = malloc(sizeof(*iocb_out));
>  
> +	if (!buf_in || !buf_out || !iocb_in || !iocb_out) {
> +		perror("malloc");
> +		free(buf_in);
> +		free(buf_out);
> +		free(iocb_in);
> +		free(iocb_out);
> +		io_destroy(ctx);
> +		for (i = 0; i < 2; ++i)
> +			close(ep[i]);
> +		close(ep0);
> +		return 1;
> +	}

It's userspace, why not just return an error and let the kernel clean up
the memory automatically?

Or better yet, just have a goto to jump to the end of the function where
all of this code already lives?

How did you find this problem?  How was it tested?

thanks,

greg k-h
