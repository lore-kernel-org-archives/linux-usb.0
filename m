Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793262661;
	b=Wz1qBIz2vwPBiojxTl/7ZLyNqjQVcaO4m5yhTlyjUArEvjut8HfAEdqmeRli6JDQRKcD
	 GHyw/PrY2ubXy38GxSK4OVAj/fk2DGs5g+tx8XN06TSgtmwGyT8cKCyvD4bD34jbZHLDU
	 SO6hrNStVJmMOtyowxhkWcXJ7pGl6ecDPNzsO/VlGcIyWZhgGbLfggUrNb8DthQSohkUM
	 P9uOfygolQ5FHHvbdIjCB8FDxYNyKzTEZcjv6CiUL3N28vKEwEhMYShvki2KMZvnC4LTu
	 wNAu83C70xnHkvq/fVvBuqMt0YLUegBDwOom9HUxvRdZEgCp2KSSW+nZ1UqXonV+Jmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793262661;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=wl6DHmnwo6IY8ATB2PYlDBTy5Kc9zrSFOWV/eT982T0=;
	b=lXV1MwPxdfccnl2d8Ue2tdpnaPQiZnG11CypjXK+G5hXNGjDAZDL2cZFqZIGiNIj7Tqd
	 ABfLYckFbFTeyUzdDi3+/4P5eHIcm72oeM94xi4D7ZMTMIDJRG+0BLhJFM1qAU++QN/Ul
	 PLxDRN+7mFSpBQGpT7Nxl+1/9GWqzDnmVng/olMY+v3dFZRx2OG2Ytonk9UDkj2APeQ+S
	 9c6JbVoRSBKboY1bF5vTHZBpjANg2Ot84wvnAz6dV0uz5/iG/+OVRtle+S1feSSqfrr6r
	 3pg20cVT1r3VogsAYMwjIl46fkrdSDl8DW4qaFdEWjPY8tc2xT4b490A5kxDvMHrvdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FGYetnwV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED732606A31E
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 08:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FGYetnwV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BEAB1F01825;
	Thu, 29 Oct 2026 08:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793262660;
	bh=wl6DHmnwo6IY8ATB2PYlDBTy5Kc9zrSFOWV/eT982T0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FGYetnwVQhaZgMS/VzlzvzsSPlP9Tb4ijLjj/2xaaLo9RZpRlIEtALMQrjyFgJVNu
	 AwYV3rKIPerYTJaD73717NL4HTtzHEfJhnFohuaL1dPIukc/uxBLOH0Ig/CKpP+HbT
	 gN6ngjjh+76LtcdY3T08uTzlyZd/8zOyb+VXYmiqCAgZVfL/Ubf1+BqcsaQ5BWL5sZ
	 UVNKAjt+ptHgYFyXWrdkne71VQDNZR2XiY6pKN+1cxJoTjij+Swh6BBunUlwZb3Qss
	 PdbkaZBtlOiXsfOPmLwXulwBV+fzes6su4x7sHSq0OGKXEhUcz4LoRjOy1JUPGmqdG
	 GPKy49hJaAk2Q==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xMLXG-00000003aVE-1aJ8;
	Thu, 29 Oct 2026 09:30:58 +0100
Date: Thu, 29 Oct 2026 09:30:58 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Josef Bacik <josef@toxicpanda.com>
Cc: linux-usb@vger.kernel.org, stable <stable@kernel.org>
Subject: Re: [PATCH] USB: serial: garmin_gps: queue the device reset
Message-ID: <auMEQr5QphTIqSqj@hovoldconsulting.com>
References: <2026102733-prayer-drainer-56f3@gregkh>
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
In-Reply-To: <2026102733-prayer-drainer-56f3@gregkh>

On Tue, Oct 27, 2026 at 03:29:34PM +0100, Greg Kroah-Hartman wrote:
> From: Josef Bacik <josef@toxicpanda.com>
> 
> A private packet with the ID PRIV_PKTID_RESET_REQ that is written to the
> port makes garmin_write() call usb_kill_urb() and usb_reset_device().
> Both sleep, but the write operation of a tty driver must not: a line
> discipline may call it in atomic context, synchronous PPP for one under
> a spinlock with bottom halves disabled.  In addition usb_reset_device()
> has to be called with the device locked, which it is not here.
> 
> The reset also unbinds the driver inside the write: the disconnect hangs
> the tty up, ppp_sync_close() calls ppp_unregister_channel(), and that
> spins on pch->downl, which the writer holds.  The CPU is lost.
> 
> Unlink the URB and use usb_queue_reset_device(), which locks the device
> and resets it from a work item.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> Johan, this was sent to me, but I really don't know if PPP is used for
> this device to talk to the port or not.  If not, this isn't a real
> issue, but if it is, then maybe it is?  I can't tell so I'm tossing it
> to you :)

No, you would not use PPP with this device, but if someone tried to I
don't believe they would be able to trigger the reset due the PPP
packet framing not matching the garmin_gps header format.

So basically the patch is fine but the commit message is misleading.

You will still get a deadlock with the default line discipline however
so that's enough of a motivation to fix this (even if that doesn't wedge
a CPU).

> -	usb_kill_urb(port->interrupt_in_urb);
> -	dev_dbg(&port->dev, "%s - usb_reset_device\n", __func__);
> -	status = usb_reset_device(port->serial->dev);
> -	if (status)
> -		dev_dbg(&port->dev, "%s - usb_reset_device failed: %d\n",
> -			__func__, status);
> -	return status;
> +	/* This is called by the write operation, which must not sleep */
> +	usb_unlink_urb(port->interrupt_in_urb);

USB core will unlink (and the driver will kill) all three URBs as part
of disconnect so I think we can just drop the interrupt-in unlink here.

> +	dev_dbg(&port->dev, "%s - usb_queue_reset_device\n", __func__);
> +	usb_queue_reset_device(port->serial->interface);
>  }

Josef, do you want a send a v2 of this or shall I treat this patch as a
bug report and fix it up myself?

Johan
