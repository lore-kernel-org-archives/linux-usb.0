Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264083;
	b=cwECXZQiW0ZQubNGCyH1x6YgpN/9ZytrCgPzq+uces+Hb4Nfb0/HQ0DUPrrz2MOah6wV
	 FFUpUrIG5pFvS0qDNFSpv05hwdegtwNZvcLGxIIEToB3yyfSWrvuZLC9HUvqYrX3hraV2
	 AuaURL/df571jXjgiZjQxzMbw0g2DCN8xqmSY9a4BB7pHVmP1+FckRFw2gxNRUON8f3aU
	 oUesslRKe6p4h0EK+/m2QXsi7sm2J03/7xEGbpYzyGyPSHxmtedtgxtpkAfdQQQkpYv9j
	 GYEwuyW6fDvlM5djI42zQ+xSmZzDmOW7gxfuxYwgOtTm0+hIE2+s3Kvq0L3eEIyk9Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264083;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/ffiIX+W4fGk0mNcGq8BhXcDTDb+ulx9xEQwjfcnQ/g=;
	b=hdjiuhTJWOBArnz7QXQCP27P9aIacFDOfAp9LadH6umxVpPl2dMgF+Hu6HgcAXrlwiBn
	 LmnjU5bG3u7Qe2Wd/qUpg/HFBzlGitq8UZU+JBQY4JFaGxX9LU2lKZQ5G80pWYHmcPVQf
	 W5VlB3GdYFoYqm0b7mshqir0GnD/L7fk45MnjYMIoTC8/3ddP3FaBSmcUrDZQ7BY10vwZ
	 e+INkOQcL5Nc4y97FTv1Gn/5PH92N0SIElZTSNd7SUGvjDz4ty3tgky1H1MLuE5M3k9Vf
	 jSLt/+xFOfJud6e+hDrBkagz/nvI2Tt+6TcNMk822X3WWKF0kvBg4F+QuKqMUcLNK+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F7y1QUex;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53649606A329
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 08:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F7y1QUex
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE6B61F031E2;
	Thu, 29 Oct 2026 08:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793264083;
	bh=/ffiIX+W4fGk0mNcGq8BhXcDTDb+ulx9xEQwjfcnQ/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F7y1QUexid0udmtsuO5F9yD/JfApct2x+EKX+sK+LA2EhTWVB/QPhsIfkpgz1+8kz
	 3JVcEI4BcGk3pnWz0rLt7XjDalmd+IE+Uo7GQBp1PAMqq5nmVn/1x3E8VOLb6KOOd2
	 sXsWKOnL5JJeUPG6IzWnZgxfSCXQsFNu6Bzd3C1gWOcYmk+58a+yzW3+bXQNSMgwbD
	 G4W6OEeOPPYhO3n9tlJq4h7T1SzVuLnz9zZ97+bvvsQU48uC8zM5vrdwTKEIl6tvEe
	 HJrwRCuH/gLs3o80wSlMARhImZM/fP92EzWNd1m5C0CB4IC18p8xyYAWQgUXZzq6F/
	 qnTaZqRGrL9/A==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xMLuC-00000003arq-3KOE;
	Thu, 29 Oct 2026 09:54:40 +0100
Date: Thu, 29 Oct 2026 09:54:40 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
	stable <stable@kernel.org>
Subject: Re: [PATCH] USB: serial: oti6858: fix the teardown order in close
Message-ID: <auMJ0J207SUlC6ln@hovoldconsulting.com>
References: <2026102725-congenial-profound-99ee@gregkh>
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
In-Reply-To: <2026102725-congenial-profound-99ee@gregkh>

On Tue, Oct 27, 2026 at 03:31:26PM +0100, Greg Kroah-Hartman wrote:
> From: Josef Bacik <josef@toxicpanda.com>
> 
> The driver passes a baton around: the completion handler of the
> interrupt urb either resubmits the urb, submits the read urb or
> schedules one of the two delayed works, and the works and the bulk
> completion handlers submit the interrupt urb again.
> 
> oti6858_close() cancels the works first and kills the urbs afterwards.
> An interrupt urb that completes in between schedules a work again:
> 
> 	oti6858_close()
> 	  cancel_delayed_work_sync(setup)
> 	  cancel_delayed_work_sync(write)
> 				oti6858_read_int_callback()
> 				  schedule_delayed_work(setup)
> 	  usb_kill_urb(interrupt_in_urb)	/* not in flight */
> 				setup_line()
> 				  usb_submit_urb(interrupt_in_urb)
> 
> The port is now closed with the baton still going round. The next open
> fails because the interrupt urb is already submitted, and if the device
> is unplugged, oti6858_port_remove() frees the private data while a work
> may be pending or running.
>
> Poison the interrupt urb first: that waits for the handler and makes all
> further submissions fail, so nothing schedules the works any more. Then
> cancel the works, after which only the bulk urbs are left, kill those,
> and make the interrupt urb usable again for the next open. Don't print
> an error for the submissions that fail with -EPERM in this window, as
> oti6858_read_bulk_callback() already does.
> 
> Fixes: 49cdee0ed0fc ("USB: oti6858 usb-serial driver (in Nokia CA-42 cable)")
> Cc: stable <stable@kernel.org>
> Cc: Johan Hovold <johan@kernel.org>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> Johan, another llm-found patch, seems sane, but it's not exactly obvious
> to me if this is real or not?

Yes, this all looks good. I'll queue this one for 7.4. Thanks.

Johan
