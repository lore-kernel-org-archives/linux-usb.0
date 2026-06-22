Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24AD78F2E;
	Mon, 22 Jun 2026 15:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782143346; cv=none; b=G4UV9ZbggKCiduvXRYThC/IguF7W7eO1VlAWhTmaJmmJ9txDfgYat8C0yuAtACAuV1X/it+G47upU3+p16qQODufTVCN29ktJ3G7PfmCgscUi8bEbAYBV8uTA/2vMuPf2yyYcNftMZxUj5nzBa1cBrfr7een008ngf52HjbaTrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782143346; c=relaxed/simple;
	bh=7ZWkldDtbFEpjW2NiZQi77+LMK9pgoF1gg4WrNYkLuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KIAtZ8xSGPZXQVzmx1dAlaiyv4RAi0MZHJ+LQnkhInOOMxNgls7JQojoZ2b9qwuQAZt9X9SjHwJNfU3CqiILoddsl6o+dVIFyvWIKQlfMtt/ymQPqaW6LMBFUcVF/tL7x6Uqr4gUSAR5TACup067wRNQNv7d0Cds9QmdDw2DGIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ljdERzoZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ljdERzoZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E521F000E9;
	Mon, 22 Jun 2026 15:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782143345;
	bh=k/0Dpv6bj+f98uie71GOenu5GLD1397tUeIOBTXCKQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ljdERzoZwuZ/whm1g1/7VKYhoVQbZqprS0LbKe+RbMXDDaGXjeujm2/9O1mVfEAaK
	 paC8rKGYNExf2YqG6Eut1mT/u1Xn+LQj8ErzkYXalYzK58z2QyceWuCKe7pw4qlWAA
	 Qdd0BX+PpRQavTx4EA/XWwXC/WQeZWa2prPKrwmzP8O5sj2jsjMzbJ1ghAwiEOa+Jd
	 U3ZcwOmPcS2zY5kCpjQHbeyzjdYkalmkAHOpWrQuYY9zQaRtsWpNTLP6jAQHvLcJ8/
	 dkz9u/AXkU21btcCX8YVJmz25mmBZetV2kkXumCrnivx7TPQlNin8chp/Xp9Akh1gE
	 OANuXNfyBH3AA==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wbgtT-00000000UbN-109G;
	Mon, 22 Jun 2026 17:49:03 +0200
Date: Mon, 22 Jun 2026 17:49:03 +0200
From: Johan Hovold <johan@kernel.org>
To: Yue Sun <samsun1006219@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: misc: iowarrior: fix use-after-free in release
Message-ID: <ajlZby4OXzCKECmJ@hovoldconsulting.com>
References: <20260619150340.65058-1-samsun1006219@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619150340.65058-1-samsun1006219@gmail.com>

On Fri, Jun 19, 2026 at 11:03:37PM +0800, Yue Sun wrote:
> From: Sam Sun <samsun1006219@gmail.com>
> 
> iowarrior_release() clears dev->opened while holding dev->mutex and then
> unlocks the mutex before freeing the device when it has already been
> disconnected. If iowarrior_disconnect() is waiting for the same mutex, it
> can acquire it while mutex_unlock() in release is still in progress,
> observe dev->opened == 0, and free the same object.

The above description is not correct as it seems to suggests that there
is a double-free here, which there is not.

Either release() or disconnect() will free the driver data, but the
other one may still be executing mutex_unlock() when that happens.

> This violates the
> mutex_unlock() lifetime rule because the mutex storage can be freed before
> mutex_unlock() has returned.

Indeed. Thanks for catching this.
 
> Fix this by adding a kref to struct iowarrior and holding one reference
> for the USB interface, one for each opened file, and one for each
> in-flight asynchronous write URB. Release, disconnect and write completion
> now only drop their references after they are done using the object, and
> the object is freed only after all users have released it.

You only need a reference for each open file (and one while the driver
is bound). All I/O must cease on disconnect so there is no need to keep
an additional reference for each outstanding write.

Note that there is another bug here for which the fix has not yet been
applied though:

	https://lore.kernel.org/all/20260523170523.1074563-1-johan@kernel.org/

> Reported-by: Sam Sun <samsun1006219@gmail.com>

You shouldn't add a reported-by tag for issues you fix yourself. A Link
to the syzbot report is good to have though.

> Closes: https://lore.kernel.org/r/20260618080204.38322-1-samsun1006219@gmail.com

I only saw your report last week and missed that you had posted this fix
until today when I was about to submit a series fixing this driver and a
few others that got this wrong:

	https://lore.kernel.org/all/20260622152612.116422-1-johan@kernel.org/

With the commit message fixed and the write references dropped they are
mostly equivalent.

> Signed-off-by: Sam Sun <samsun1006219@gmail.com>
> ---

> @@ -95,6 +97,10 @@ struct iowarrior {
>  	struct usb_anchor submitted;
>  };
>  
> +#define to_iowarrior_dev(d) container_of(d, struct iowarrior, kref)

I know we have a few of these in the tree already, but it's not really
needed for a single user and the "d" is a bit misleading as these macros
are typically used to cast from a struct device (not a kref).

> +
> +static void iowarrior_delete(struct kref *kref);
> +
>  /*--------------*/
>  /*    globals   */
>  /*--------------*/
> @@ -235,13 +241,16 @@ static void iowarrior_write_callback(struct urb *urb)
>  	/* tell a waiting writer the interrupt-out-pipe is available again */
>  	atomic_dec(&dev->write_busy);
>  	wake_up_interruptible(&dev->write_wait);
> +	kref_put(&dev->kref, iowarrior_delete);
>  }

> @@ -454,12 +463,14 @@ static ssize_t iowarrior_write(struct file *file,
>  			goto error;
>  		}
>  		usb_anchor_urb(int_out_urb, &dev->submitted);
> +		kref_get(&dev->kref);
>  		retval = usb_submit_urb(int_out_urb, GFP_KERNEL);
>  		if (retval) {
>  			dev_dbg(&dev->interface->dev,
>  				"submit error %d for urb nr.%d\n",
>  				retval, atomic_read(&dev->write_busy));
>  			usb_unanchor_urb(int_out_urb);
> +			kref_put(&dev->kref, iowarrior_delete);
>  			goto error;
>  		}
>  		/* submit was ok */

All outstanding writes should be stopped on disconnect (and soon will be
when the fix I mentioned above is merged), so this is not needed.

> @@ -637,6 +648,7 @@ static int iowarrior_open(struct inode *inode, struct file *file)
>  	}
>  	/* increment our usage count for the driver */
>  	++dev->opened;
> +	kref_get(&dev->kref);
>  	/* save our object in the file's private structure */
>  	file->private_data = dev;
>  	retval = 0;
> @@ -657,13 +669,13 @@ static int iowarrior_release(struct inode *inode, struct file *file)
>  	dev = file->private_data;
>  	if (!dev)
>  		return -ENODEV;
> +	file->private_data = NULL;

This looks like an unrelated change.

>  	/* lock our device */
>  	mutex_lock(&dev->mutex);
>  
>  	if (dev->opened <= 0) {
>  		retval = -ENODEV;	/* close called more than once */
> -		mutex_unlock(&dev->mutex);
>  	} else {
>  		dev->opened = 0;	/* we're closing now */
>  		retval = 0;

> @@ -918,8 +929,8 @@ static void iowarrior_disconnect(struct usb_interface *interface)
>  	} else {
>  		/* no process is using the device, cleanup now */
>  		mutex_unlock(&dev->mutex);
> -		iowarrior_delete(dev);
>  	}

The unlock should now be moved after the conditional.

> +	kref_put(&dev->kref, iowarrior_delete);
>  }
>  
>  /* usb specific object needed to register this driver with the usb subsystem */

Johan
