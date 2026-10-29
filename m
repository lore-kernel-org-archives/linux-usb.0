Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266714;
	b=2ti5RLm6doN3OhzXeln4gdo00VT8n68T1GRrR/4fqf0ejV5ahV3r2yjjmUWBP/XDFZ0/
	 10G17iv/gD4jh1i3ZOJOomhonNQgk5qs9ozoBt6NPnZZqW+qfwTTYqtKNahon4InBruzX
	 XXdGRqiI2BfQN9BBbxpbx9eYJTq8D+HIe5wFnMheCa0TGSQGgijOATh99FZysq5iSon+Y
	 dDUCXJJBcnJM/vL8RDDfB0fNWCy196aidAEhbs/EVabewfy1+3RoxM7JM7HlGXZEO6eJN
	 arWLm26h08buMrcKJAvmPBpnwpfm2X0z5PELM5+Orxda5KLaqJW/uGDjmFWd4LSx2OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266714;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=7DRiI1vwslwstwKD74TbN8OW/TVKW+sia50+pBf12AU=;
	b=fnesurmWI/Fa3XegtQ1Zn8YPCpNEBJsOyuEDHBjcx5/VjGvtE94FUCFUZmr7I6diK7Oz
	 DRLB2H+PR3svURImp5C89QRUmDi6UTJufIcj/VPeQIrZ0rltJmvBOs+FOIpWfEp8RMxje
	 NdHKq0K94dMKFW1UWd7XKeDRwmbeFK/WcUukhTQKziXjoVjQwCiy7Gwr7rb9b+01TkmaZ
	 dfne38xwIGs/UmeD5kxf4qpEPAz9fOGZWFCeowZdix483Od4v06xb3YPHh13kajvPmSc8
	 U85ZadPO2piKSg8IxFdCfLG0MnUx81j370gpsTyMVJ+kX9xc7Atr3fPn6XueWUwPzbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Mxv+xLAX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F12606A31A
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 09:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Mxv+xLAX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925741F01825;
	Thu, 29 Oct 2026 09:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793266713;
	bh=7DRiI1vwslwstwKD74TbN8OW/TVKW+sia50+pBf12AU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mxv+xLAXz5rxsg5CzQDZcPt5anQcXuv5Ig+KpDVm3CYZF8m8e+xC11fNjLPhtSkV1
	 CN1ENRairKpo+xT3pALkEwxDt8vsC7getgV4SnrP0nSwh8ogsJ7VHdFGFsnE7QGxrx
	 6imSd9VvtlKEHeRiGgL5vCbdgA6q6HUJzS9Wr/wM=
Date: Thu, 29 Oct 2026 10:38:31 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: Josef Bacik <josef@toxicpanda.com>, linux-usb@vger.kernel.org,
	stable <stable@kernel.org>
Subject: Re: [PATCH] USB: serial: garmin_gps: queue the device reset
Message-ID: <2026102910-jawed-sweat-c4fc@gregkh>
References: <2026102733-prayer-drainer-56f3@gregkh>
 <auMEQr5QphTIqSqj@hovoldconsulting.com>
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
In-Reply-To: <auMEQr5QphTIqSqj@hovoldconsulting.com>

On Thu, Oct 29, 2026 at 09:30:58AM +0100, Johan Hovold wrote:
> On Tue, Oct 27, 2026 at 03:29:34PM +0100, Greg Kroah-Hartman wrote:
> > From: Josef Bacik <josef@toxicpanda.com>
> > 
> > A private packet with the ID PRIV_PKTID_RESET_REQ that is written to the
> > port makes garmin_write() call usb_kill_urb() and usb_reset_device().
> > Both sleep, but the write operation of a tty driver must not: a line
> > discipline may call it in atomic context, synchronous PPP for one under
> > a spinlock with bottom halves disabled.  In addition usb_reset_device()
> > has to be called with the device locked, which it is not here.
> > 
> > The reset also unbinds the driver inside the write: the disconnect hangs
> > the tty up, ppp_sync_close() calls ppp_unregister_channel(), and that
> > spins on pch->downl, which the writer holds.  The CPU is lost.
> > 
> > Unlink the URB and use usb_queue_reset_device(), which locks the device
> > and resets it from a work item.
> > 
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > Cc: stable <stable@kernel.org>
> > Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> > Johan, this was sent to me, but I really don't know if PPP is used for
> > this device to talk to the port or not.  If not, this isn't a real
> > issue, but if it is, then maybe it is?  I can't tell so I'm tossing it
> > to you :)
> 
> No, you would not use PPP with this device, but if someone tried to I
> don't believe they would be able to trigger the reset due the PPP
> packet framing not matching the garmin_gps header format.
> 
> So basically the patch is fine but the commit message is misleading.
> 
> You will still get a deadlock with the default line discipline however
> so that's enough of a motivation to fix this (even if that doesn't wedge
> a CPU).
> 
> > -	usb_kill_urb(port->interrupt_in_urb);
> > -	dev_dbg(&port->dev, "%s - usb_reset_device\n", __func__);
> > -	status = usb_reset_device(port->serial->dev);
> > -	if (status)
> > -		dev_dbg(&port->dev, "%s - usb_reset_device failed: %d\n",
> > -			__func__, status);
> > -	return status;
> > +	/* This is called by the write operation, which must not sleep */
> > +	usb_unlink_urb(port->interrupt_in_urb);
> 
> USB core will unlink (and the driver will kill) all three URBs as part
> of disconnect so I think we can just drop the interrupt-in unlink here.
> 
> > +	dev_dbg(&port->dev, "%s - usb_queue_reset_device\n", __func__);
> > +	usb_queue_reset_device(port->serial->interface);
> >  }
> 
> Josef, do you want a send a v2 of this or shall I treat this patch as a
> bug report and fix it up myself?

I'm guessing at Josef's current load, so it might just be faster for you
to fix it up yourself :)

thanks,

greg k-h
