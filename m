Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B5D4C7558;
	Fri,  9 Oct 2026 10:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791543115; cv=none; b=HRTa1vQZm7SpQX7rEJ8MNpTirPh3WOKBNaMD3PN7MrFUboQuRiQ7/uv0EMA8g6mLQdWjgibHX83NFTfALtb+Ej6/6qy6NhpXOwjTgbG+s1Zg0LD5XsKUB1rZYwlgs81NKtiQOXBalQ9JYagzDIyiLxIdAb+SJ9Sx9dkm0TYJEhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791543115; c=relaxed/simple;
	bh=CDa3coz/myhiuXRwIGmen+4aBD3+j26wCcCofEoAwUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q54WY2cyD+ulpUMZjN59w1yv6VHXCdd8OI6Z0DjhiCBy0k3eWHhV18K9hPxsOhYoHzs0eVBywjsWlkb4y7rej3Sc2Gsg52M8QvHKf0OUWd785uYr3LpYQo5RuExycyx12lbrdVNPgOmhi3f7RGrHUKej5I42yfMgF0W46v6BqkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NWNbU34F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NWNbU34F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFE881F00893;
	Fri,  9 Oct 2026 10:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791543106;
	bh=Nhp6uMyLEZ87x9j/kUms7i9c8275QD5jiB9qIVFb5gs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NWNbU34FniTCPRj4QY7wj77Om64+L1JtfPzBLaWaCXr14xSIewyxoAmXQJv9nOVAz
	 2xeOaJ5Mom0oID8Qc9HUcBMGZf9bvy7V+TB7OI9ap8D0t8T0Ckm2uFH1+y0qWNuKSh
	 G+zt7MNx6Df/LwyWD/o+I5BnPUs6ejsydLLBmhx8=
Date: Fri, 9 Oct 2026 12:51:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: sashiko-reviews@lists.linux.dev
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 06/14] xhci: dbc: lock the minor IDR on registration
 failure
Message-ID: <2026100949-scuttle-cradling-0371@gregkh>
References: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
 <20261009095834.561578-7-mathias.nyman@linux.intel.com>
 <sashiko-outbox-165207@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-165207@kernel.org>

On Fri, Oct 09, 2026 at 10:13:10AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] usb: xhci: dbc: UAF due to premature IDR exposure and missing TTY hangup on error path
> --
> 
> commit 99c18a1b8449e8389ccac896ceadcc979dbd6a57
> Author: Sang-Hoon Choi <csh0052@gmail.com>
> 
> xhci: dbc: lock the minor IDR on registration failure
> 
> This commit fixes a race condition during DbC TTY registration failure
> by adding mutex protection around the removal of the minor IDR entry.
> 
> > diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
> > index 3d51e8d82659d..2249cc16800cc 100644
> > --- a/drivers/usb/host/xhci-dbgtty.c
> > +++ b/drivers/usb/host/xhci-dbgtty.c
> > @@ -535,7 +535,9 @@ static int xhci_dbc_tty_register_device(struct xhci_dbc *dbc)
> >  err_free_fifo:
> >  	kfifo_free(&port->port.xmit_fifo);
> >  err_exit_port:
> > +	mutex_lock(&dbc_tty_minors_lock);
> >  	idr_remove(&dbc_tty_minors, port->minor);
> > +	mutex_unlock(&dbc_tty_minors_lock);
> >  err_idr:
> >  	xhci_dbc_tty_exit_port(port);
> 
> [Severity: High]
> Does this error path leave concurrent TTY sessions pointing to freed memory?
> 
> Earlier in xhci_dbc_tty_register_device(), the port is added to the globally
> visible dbc_tty_minors IDR before internal structures are fully allocated:
> 
> 	mutex_lock(&dbc_tty_minors_lock);
> 	port->minor = idr_alloc(&dbc_tty_minors, port, 0, 64, GFP_KERNEL);
> 	mutex_unlock(&dbc_tty_minors_lock);
> 
> A concurrent open() on the device node routes to dbc_tty_install(), which
> retrieves the port and installs the TTY without verifying port->registered:

I don't think we need to worry about "concurrent open()" for this as
that's not a real use case that I know of and this _should_ be root only
accessable, right?

Or can normal users open this device node?

thanks,

greg k-h
