Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5845230F7EB
	for <linux-usb@vger.kernel.org>; Mon, 15 Jun 2026 10:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781519696; cv=none; b=btG9P5HomviMWuTuIsIw0Tim2ju2UreAGuozTLgw6oVMOxuv/hcYqjDYEVKeWeqVOyXSchALXnoIMAEwGY2rgfZD9ljncmTCwjoPgoenA5XGPIKySNir3JsZzIJaJoqb5Vfcyrz1zvpAcObaLPvFQfghVIporsVx4V5ew70tkEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781519696; c=relaxed/simple;
	bh=rrjG0k5skviO2C+5rCJftUcCIGTtk9BfRN55j2OKdtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ohrTZfmpk/zgGNhv98FEB7F7BWT1/mYW72bFLfGkbJv5bJ0xyE0WhQQZr0oavvBOIeqBhXusYECO7VxC0RxFZ/GVi1hsl9Qr+usu2QhVppktNg2zl7LhUhkCEengpmYtlOZQy3OLJlFBQqsiq9KCyKPGHKY/jsyf8aGx2ylec4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=D6b6WgEa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="D6b6WgEa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 479B61F000E9;
	Mon, 15 Jun 2026 10:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781519694;
	bh=nEYxULFf+8wnrWH0Kvi6MzPqKvH3V845mmP2dwKe1qo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D6b6WgEaPyK3sUQmbEVkDcZvSdWF6dTDP+U2/VmaGAPBXhHZUr7PseSNytbLZI2Er
	 QhfUw6QqjuA3nxTvA9TUNZNHyxTQDi8BMdN+S/MEtulya048zErGyaP6EzgYT9ljTc
	 qmO+bWHPQKihS1FhF5fr9ttatjz77T7NePNdI2+0=
Date: Mon, 15 Jun 2026 12:33:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hu Xinyao <huxinyao0011@gmail.com>
Cc: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Hongren Zheng <i@zenithal.me>, linux-usb@vger.kernel.org,
	security@kernel.org
Subject: Re: [PATCH] usbip: vudc: get vudc from endpoint in vep_dequeue
Message-ID: <2026061508-product-pliable-13cd@gregkh>
References: <2026061502-rants-doing-407e@gregkh>
 <20260615101110.1913-1-huxinyao0011@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615101110.1913-1-huxinyao0011@gmail.com>

On Mon, Jun 15, 2026 at 06:11:10PM +0800, Hu Xinyao wrote:
> vep_dequeue() looks up the virtual UDC through vrequest->udc, but
> that field is never initialized when requests are allocated or queued.
> A gadget function that dequeues a request during disconnect can
> therefore dereference a NULL vudc pointer and crash the kernel.
> 
> This was observed with a USB/IP vUDC ACM gadget. ACM is not unique here;
> it was only the tested gadget path. The bug is in the generic vUDC
> dequeue path rather than in ACM itself.
> 
> Use the endpoint to recover the vudc, as the other vUDC endpoint ops
> already do, instead of relying on the request-private field.
> 
> Fixes: b6a0ca111867 ("usbip: vudc: Add UDC specific ops")
> Cc: stable@vger.kernel.org
> Reported-by: Hu Xinyao <huxinyao0011@gmail.com>
> Signed-off-by: Hu Xinyao <huxinyao0011@gmail.com>

When you author and sign off on a patch, you don't need the reported-by
line.

Anyway, isn't this patch:
	https://lore.kernel.org/r/18A5F3B379FB205B+20260615093559.3436095-1-raoxu@uniontech.com
a better one instead?

thanks,

greg k-h
