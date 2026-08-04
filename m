Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B688427F84;
	Tue,  4 Aug 2026 07:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785829783; cv=none; b=dOacwmqZ8tt0G8N+1PB5SgGy1TTpmplMaKeWPBnCdOSP2/JLYIPUPJiMU5JQ3xuJdmbEAiykzQ4Vd5VIX8X16pOlW3bwsQN5FtknvLZsw9fQf/JunGR+JaC0YaPwZWUZuuxjZy5c4OmdAAmIMJIiZfO/6mLALQv66+pywiVFgYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785829783; c=relaxed/simple;
	bh=hACa1UEC9tkNcNFaB9rer7HLqo0Pnvx/7MYVwZhkhJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jdl2wf3oJL9QMkCipkgwmm+uG85LtHh/aaY1MFxcNUVnIiJH3OqdRMIIOwTZ2EmvfhLDVpEnLqn8XV8M75o8uXm5l/06tRb1lLfRLqP/MWDbuWi2RMmR/MuR0nClIRuIHzOBezlBSyty67dFf3XSF1IzOb9pXfxQJGRedfZh+Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AeDevbZW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AeDevbZW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16DFE1F000E9;
	Tue,  4 Aug 2026 07:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785829781;
	bh=7J858pPzlAPXlt2vx21ytV54ZvGQP2VSTUGFJZd8k+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AeDevbZWDMTqnrVTN3nxfre0MhBiLsps7gWcYZMN0UIX1LM4VpOtrVQgxz1je0hMG
	 c5kEMHkJMriPQAzpO9APi01dAvyAeFuJleSn/rgtE5stUzDlnoWLulu5ea0vAoszql
	 /r3Wuq/sOGzUqUhBMavRStsoeB1o6QGZvDkS6LUU=
Date: Tue, 4 Aug 2026 09:49:25 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: bolewara@gmail.com
Cc: Andrey Konovalov <andreyknvl@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+9aacea11bc70c3ddaff2@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] usb: raw_gadget: fix use-after-free when UDC is
 removed
Message-ID: <2026080451-exterior-stank-a019@gregkh>
References: <20260804-raw-gadget-ep0-uaf-v2-1-3a5ded46ab50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804-raw-gadget-ep0-uaf-v2-1-3a5ded46ab50@gmail.com>

On Tue, Aug 04, 2026 at 12:39:05PM +0530, Anuj Bolewar via B4 Relay wrote:
> From: Anuj Bolewar <bolewara@gmail.com>
> 
> When the UDC is removed (e.g. dummy_hcd unbind via sysfs) while the raw
> gadget fd is still open, usb_del_gadget() destroys the gadget device
> and its name. raw_gadget keeps a dangling pointer in dev->gadget, and
> ioctls dereference it after releasing dev->lock, leading to a
> use-after-free in dev_err() when usb_ep_queue() fails.
> 
> Take a gadget reference in gadget_bind() and drop it in dev_free() so
> the gadget device and its name stay alive for as long as the fd is open
> and an ioctl may still dereference dev->gadget. gadget_unbind() only
> marks the device as failed under dev->lock; the reference is dropped in
> dev_free(), which runs only after the fd is closed and no ioctl can be
> in flight.
> 
> Reported-by: syzbot+9aacea11bc70c3ddaff2@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=9aacea11bc70c3ddaff2
> Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface")
> Signed-off-by: Anuj Bolewar <bolewara@gmail.com>
> ---
> The gadget device embedded in the UDC is destroyed when the UDC is
> removed while the raw gadget fd is still open (e.g. unbinding dummy_hcd
> via sysfs). raw_gadget keeps a dangling pointer in dev->gadget and
> ioctls dereference it after dropping dev->lock, which KASAN reports as a
> slab use-after-free in raw_process_ep0_io() (dev_err with a freed device
> name).
> 
> Fix it by holding a gadget reference for the raw device lifetime:
> gadget_bind() takes it, gadget_unbind() only marks the device as failed
> under dev->lock, and the reference is dropped in dev_free() once the fd
> is closed and no ioctl can still be in flight.
> ---
> Changes in v2:
> - Reworked per review: the gadget reference is now held for the raw
>   device lifetime (bind until dev_free()) instead of the bind/unbind
>   window, since ioctls dereference dev->gadget after releasing dev->lock
>   and the UDC core owns the gadget's lifetime during bind/unbind.
> - gadget_unbind() now only marks the device as failed under dev->lock;
>   the reference is dropped in dev_free() after the fd is closed.
> - Dropped the now-unneeded comment and switched the spinlock to guard().
> - Link to v1: https://patch.msgid.link/20260804-raw-gadget-ep0-uaf-v1-1-07878773da15@gmail.com
> ---
>  drivers/usb/gadget/legacy/raw_gadget.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
> index 4febf8dac7c..d6341823f90 100644
> --- a/drivers/usb/gadget/legacy/raw_gadget.c
> +++ b/drivers/usb/gadget/legacy/raw_gadget.c
> @@ -226,6 +226,7 @@ static void dev_free(struct kref *kref)
>  		kfree(dev->eps[i].ep->desc);
>  		dev->eps[i].state = STATE_EP_DISABLED;
>  	}
> +	usb_put_gadget(dev->gadget);
>  	kfree(dev);
>  }
>  
> @@ -302,7 +303,7 @@ static int gadget_bind(struct usb_gadget *gadget,
>  	dev->req = req;
>  	dev->req->context = dev;
>  	dev->req->complete = gadget_ep0_complete;
> -	dev->gadget = gadget;
> +	dev->gadget = usb_get_gadget(gadget);
>  	gadget_for_each_ep(ep, dev->gadget) {
>  		dev->eps[i].ep = ep;
>  		dev->eps[i].addr = get_ep_addr(ep->name);
> @@ -329,6 +330,10 @@ static void gadget_unbind(struct usb_gadget *gadget)
>  {
>  	struct raw_dev *dev = get_gadget_data(gadget);
>  
> +	{
> +		guard(spinlock_irqsave)(&dev->lock);
> +		dev->state = STATE_DEV_FAILED;
> +	}

Please look at how scoped_guard() works.

And again, are you _SURE_ you need to call get/put on the device?  That
still feels wrong...

And you did not answer my question about the need for the Assisted-by:
tag.

greg k-h
