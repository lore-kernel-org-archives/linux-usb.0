Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C2830BF4F;
	Mon,  3 Aug 2026 08:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785746116; cv=none; b=SE6ZoWol2ItDSa1n7veLzX1HhV2KR2mmvcNFFI3RZmN0x8mI8nie7HPk6worV4k2MmL+5OP0lygId03K+Okca0Ft80dCONJxUwl6pJ8Bdk3C+XiGiEWijmL4B69uE7HVUfqRe6c/Nn/PPTCatiUN+kZuQVgEtgyB0uOj2U6f+rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785746116; c=relaxed/simple;
	bh=3ZPBjmQF3udJNSx/O8HY3YiE1o+qRRrUYmbnmm32Z6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/DCbg4N14Co/D+4kbbS9oCteRrHfQgVkqyX7Q2gprvuqGBRHlwygP7+uZ+Z6FkgY1Fld0tCYkmWufuFEVrQmrK2WjzZA3NGQTxpScmOtGCSGZPCEksP8E8c7AJH0M74TRTwJgZcyqrP262prHtSGfJ87O7s6kOqi/52YC4SCs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oIkIqIT5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oIkIqIT5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D406F1F000E9;
	Mon,  3 Aug 2026 08:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785746114;
	bh=ZeiUjm8O3Q6bUQlLUzE6ETjL10h5QMZydvQI4QhPUUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oIkIqIT5KU+YYalGBSyOxbcle9YtCazDZp/qpg9EqpfrnMZk2HFjeZrnRZkLR8dUA
	 1KCYQpxTaLQr7tWKglJYdVY5N2sztjKDsKlF/YtL4gCo2aCo29Of5fXmD3mGhvn1r6
	 5SSHzCxy2p8Hpml+UuuuIgh+xD5rH/GlOJybgiSQwpEIW1ezY0G1CdHN0BcBQbiUD2
	 Sogaac81x0VSSvkusqHSlTw6e0MDXp7t1pcTxoTfKDnAI4FfSwFhU4L6ym6SfDxVAc
	 pd0Fg47n1lK8oVIzmaym1DquM9srk89CqDNk+4RbF5QQuwObNqcTqU2cF+347GpD6e
	 vn1AVJLJHL+Pg==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wqo8e-00000002jmj-2qEi;
	Mon, 03 Aug 2026 10:35:12 +0200
Date: Mon, 3 Aug 2026 10:35:12 +0200
From: Johan Hovold <johan@kernel.org>
To: Crescent Hsieh <crescentcy.hsieh@moxa.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	FangpingFP.Cheng@moxa.com, Epson.Chiang@moxa.com
Subject: Re: [PATCH v2 3/4] USB: serial: mxuport: handle SEND_NEXT transmit
 flow control
Message-ID: <anBSwNnnFrZLqOwO@hovoldconsulting.com>
References: <20260623080138.166398-2-crescentcy.hsieh@moxa.com>
 <20260623080138.166398-5-crescentcy.hsieh@moxa.com>
 <al-VnkwqXYC7MoVG@hovoldconsulting.com>
 <amcyubnG9N8ZI0ro@moxa-ThinkCentre-M90t>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amcyubnG9N8ZI0ro@moxa-ThinkCentre-M90t>

On Mon, Jul 27, 2026 at 06:28:09PM +0800, Crescent Hsieh wrote:
> On Tue, Jul 21, 2026 at 05:51:58PM +0200, Johan Hovold wrote:
> > On Tue, Jun 23, 2026 at 04:01:38PM +0800, Crescent Hsieh wrote:

> > > @@ -276,22 +280,148 @@ MODULE_DEVICE_TABLE(usb, mxuport_idtable);
> > >  static int mxuport_prepare_write_buffer(struct usb_serial_port *port,
> > >  					void *dest, size_t size)
> > >  {
> > > +	struct mxuport_port *mxport = usb_get_serial_port_data(port);
> > >  	u8 *buf = dest;
> > > +	unsigned long flags;
> > > +	bool request_send_next;
> > >  	int count;
> > >  
> > > -	count = kfifo_out_locked(&port->write_fifo, buf + HEADER_SIZE,
> > > -				 size - HEADER_SIZE,
> > > -				 &port->lock);
> > > +	spin_lock_irqsave(&port->lock, flags);
> > > +	count = kfifo_out(&port->write_fifo, buf + HEADER_SIZE,
> > > +			  size - HEADER_SIZE);
> > > +	mxport->sent_payload += count;
> > > +	request_send_next = mxport->sent_payload >= port->bulk_out_size;
> > 
> > How big are the per-port buffers?
> 
> The size depends on the device. The G2 and Platform UART firmware have
> a 4096-byte buffer per port, while the G1 per-port buffer ranges from
> 32 KiB to 256 KiB depending on the number of ports.
> 
> The bulk_out_size threshold is not derived from the firmware buffer
> size. It is used as a simple and conservative pacing interval that
> works across the device families without requiring family-specific
> buffer sizes in the driver. This results in more frequent
> SEND_NEXT waits and may reduce throughput.

Thanks for the details. So there may be some room for optimisation later
here by taking the buffer sizes into account. Not sure if it's worth it
though (and draining 32k at low line speeds will take quite some time).

> > > +static int mxuport_write_start(struct usb_serial_port *port, gfp_t mem_flags)
> > > +{
> > > +	struct mxuport_port *mxport = usb_get_serial_port_data(port);
> > > +	struct urb *urb;
> > > +	unsigned long flags;
> > > +	int i;
> > > +	int count;
> > > +	int result;
> > > +
> > > +	if (test_and_set_bit_lock(USB_SERIAL_WRITE_BUSY, &port->flags))
> > > +		return 0;
> > > +retry:
> > > +	spin_lock_irqsave(&port->lock, flags);
> > > +	if ((mxport->hold_reason & MX_WAIT_FOR_SEND_NEXT) ||
> > > +	    !port->write_urbs_free || !kfifo_len(&port->write_fifo)) {
> > > +		clear_bit_unlock(USB_SERIAL_WRITE_BUSY, &port->flags);
> > > +		spin_unlock_irqrestore(&port->lock, flags);
> > > +		return 0;
> > > +	}
> > > +
> > > +	i = (int)find_first_bit(&port->write_urbs_free,
> > > +				ARRAY_SIZE(port->write_urbs));
> > > +	spin_unlock_irqrestore(&port->lock, flags);
> > > +
> > > +	urb = port->write_urbs[i];
> > > +	count = mxuport_prepare_write_buffer(port, urb->transfer_buffer,
> > > +					     port->bulk_out_size);
> > > +	urb->transfer_buffer_length = count;
> > > +	usb_serial_debug_data(&port->dev, __func__, count,
> > > +			      urb->transfer_buffer);
> > > +
> > > +	spin_lock_irqsave(&port->lock, flags);
> > > +	port->tx_bytes += count;
> > > +	spin_unlock_irqrestore(&port->lock, flags);
> > > +
> > > +	clear_bit(i, &port->write_urbs_free);
> > > +	result = usb_submit_urb(urb, mem_flags);
> > > +	if (result) {
> > > +		dev_err_console(port, "%s - error submitting urb: %d\n",
> > > +				__func__, result);
> > > +		set_bit(i, &port->write_urbs_free);
> > > +		spin_lock_irqsave(&port->lock, flags);
> > > +		port->tx_bytes -= count;
> > 
> > > +		if (mxport->hold_reason & MX_WAIT_FOR_SEND_NEXT) {
> > > +			mxport->hold_reason &= ~MX_WAIT_FOR_SEND_NEXT;
> > > +			mxport->sent_payload = 0;
> > > +		}
> > 
> > Shouldn't you undo the effects of prepare_write_buffer() and subtract
> > count from sent_payload (and clear the flag) unconditionally?
> > 
> > > +		spin_unlock_irqrestore(&port->lock, flags);
> > > +
> > > +		clear_bit_unlock(USB_SERIAL_WRITE_BUSY, &port->flags);
> > > +		return result;
> > > +	}
> > > +
> > > +	goto retry;
> > > +}
> > 
> > This is a more or less verbatim copy of the generic write
> > implementation. If we go this way you should at least mention that you
> > copied it in the commit message, but perhaps we should try to find a way
> > to generalise it instead.
> > 
> > Also, if you really need a custom implementation to throttle writes,
> > then shouldn't using one URB be enough? The other one is essentially
> > there to allow for higher throughput which we need to give up for
> > correctness here anyway.
> 
> Agreed, the custom write path is largely based on the generic write
> implementation. In v1, I attempted to implement the throttling in
> prepare_write_buffer() to avoid changing the generic path, but
> returning zero caused the generic implementation to submit a
> zero-length URB. In v2, I therefore added a custom write path so that
> submission could be stopped before preparing another URB.

Yeah, we probably want a custom implementation for this. Making the
generic implementation handle drivers returning 0 from
prepare_write_buffer() is straightforward, but then you also need to
notify them if URB submission failed (e.g. to prevent stalled writes).

But then again, if that's all that's needed it doesn't sound too bad.

> I will investigate whether this can instead be generalised through a
> small driver callback that allows the generic write path to check
> whether another URB may be submitted. This would avoid duplicating the
> generic implementation while preserving the behaviour of other
> USB-to-serial drivers.

I think we may have other drivers that could benefit from this too.

> I will also describe the SEND_NEXT behaviour in more detail in the v3
> commit message.

Sounds good, thanks.

Johan
