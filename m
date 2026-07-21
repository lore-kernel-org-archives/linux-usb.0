Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE83E46C4C9;
	Tue, 21 Jul 2026 15:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784649122; cv=none; b=nCc4jkNoO01xX0mivkTHCdek259dGcsqev1E+88bOkiPvUy5dvQFQ9bYIoNPUs/YrW+eEt8ZgRDO8ywCNLyTivomXJeQ4J+nZCeCZ1UZ4XUyHrUGZ7XR5oW4EZOuCTwvANWnHYn+AbYGi6k/BaBhfCrX/FfMQccM1d3ds+NZkNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784649122; c=relaxed/simple;
	bh=J/sL81+K9AUsWSotR2dFtua+MERC7Qdtg+lP/wOIf50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JYcOjv7GANOjL0670RgfCwY3eBiKMWoXiizUcGVhaMQrVs9HCyTfAWBrTXLHm3mqUnw9AhtRK2S9cguw/AuzwXPniZkxno6FwaBtXGbKtTjK0WuTG2K7/JQqeBm0A+/qRwuaf41r3+iYj0vvcXf903lTeEuUXYsqW2mgREF/dZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K1cew4QO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K1cew4QO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 881C91F000E9;
	Tue, 21 Jul 2026 15:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784649120;
	bh=m+6oq14+1sciodQeq9W31jMJwmPHF/1daByVeGTs8Qg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K1cew4QOPfNGAcR8JBlWeQ4iq9RLIxp22oDZ3nZHic6jBH8K/QrJsfND4jxSPLX47
	 1BgOftwL/YvBVS3BWToCmuKgXFGlLoOrpaGBttrPW8uYHsJAtjhH5uWlJKySwwoP5E
	 sf7avMtlJQkkit1RcoGft01aVt2SNMrsYCNLSANMOK1cq1lqCDtgz73XcXm3lqtbK5
	 imQa/a9mbGtHjos3Lc/eb823uJ+wfLKr7MAlLR4UmTyRw1t1qEqkstE2Q4x2UYPQsI
	 hE6NUdhNbqgqEiqluD/P6ThxavQxkiCP1iCqNspvTcA3rjRy05gRormAYoYkdfkdLj
	 QQI2V8wYZftjA==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wmClC-000000093bV-0RY8;
	Tue, 21 Jul 2026 17:51:58 +0200
Date: Tue, 21 Jul 2026 17:51:58 +0200
From: Johan Hovold <johan@kernel.org>
To: Crescent Hsieh <crescentcy.hsieh@moxa.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	FangpingFP.Cheng@moxa.com, Epson.Chiang@moxa.com
Subject: Re: [PATCH v2 3/4] USB: serial: mxuport: handle SEND_NEXT transmit
 flow control
Message-ID: <al-VnkwqXYC7MoVG@hovoldconsulting.com>
References: <20260623080138.166398-2-crescentcy.hsieh@moxa.com>
 <20260623080138.166398-5-crescentcy.hsieh@moxa.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623080138.166398-5-crescentcy.hsieh@moxa.com>

On Tue, Jun 23, 2026 at 04:01:38PM +0800, Crescent Hsieh wrote:
> The device uses the SEND_NEXT event to pace host-to-device transmission.
> Without waiting for this event, continuous transmission on multiple
> ports can make the driver submit bulk-out URBs faster than the device
> can process them, which can result in data errors during burn-in
> testing.

Why does it matter if we're sending data for other ports? Isn't the
problem that we're sending more data than the per-port buffer can hold?

And is this an issue with all firmware versions, including the ones used
for the existing gen1 devices?
 
> Stop submitting further write URBs after requesting SEND_NEXT and resume
> transmission when the matching event is received.

How exactly does SEND_NEXT work? Is it signalled when the per-port
buffer drops below some threshold?

> This cannot be implemented by returning zero from
> prepare_write_buffer(), as the generic write implementation expects the
> callback to return a transfer length once data is available in the write
> FIFO. Add a mxuport-specific write path so that URB submission can be
> stopped and resumed explicitly.
> 
> This may reduce throughput, but avoids data errors under sustained
> transmit load.
> 
> Signed-off-by: Crescent Hsieh <crescentcy.hsieh@moxa.com>
> ---
>  drivers/usb/serial/mxuport.c | 165 +++++++++++++++++++++++++++++++++--
>  1 file changed, 156 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
> index 067c8d9752e0..f3be2b3bd95b 100644
> --- a/drivers/usb/serial/mxuport.c
> +++ b/drivers/usb/serial/mxuport.c
> @@ -147,6 +147,8 @@ static const u16 mxuport_mux50u_fw_ver_offsets[] = {
>  #define UPORT_EVENT_LSR			4 /* Line status */
>  #define UPORT_EVENT_MCR			5 /* Modem control */
>  
> +#define UPORT_REQUEST_SEND_NEXT		0x80
> +
>  /* Definitions for serial event type */
>  #define SERIAL_EV_CTS			0x0008	/* CTS changed state */
>  #define SERIAL_EV_DSR			0x0010	/* DSR changed state */
> @@ -193,6 +195,8 @@ static const u16 mxuport_mux50u_fw_ver_offsets[] = {
>  
>  /* This structure holds all of the local port information */
>  struct mxuport_port {
> +	u32 sent_payload;
> +	u8 hold_reason;
>  	u8 mcr_state;		/* Last MCR state */
>  	u8 msr_state;		/* Last MSR state */
>  	struct mutex mutex;	/* Protects mcr_state */
> @@ -276,22 +280,148 @@ MODULE_DEVICE_TABLE(usb, mxuport_idtable);
>  static int mxuport_prepare_write_buffer(struct usb_serial_port *port,
>  					void *dest, size_t size)
>  {
> +	struct mxuport_port *mxport = usb_get_serial_port_data(port);
>  	u8 *buf = dest;
> +	unsigned long flags;
> +	bool request_send_next;
>  	int count;
>  
> -	count = kfifo_out_locked(&port->write_fifo, buf + HEADER_SIZE,
> -				 size - HEADER_SIZE,
> -				 &port->lock);
> +	spin_lock_irqsave(&port->lock, flags);
> +	count = kfifo_out(&port->write_fifo, buf + HEADER_SIZE,
> +			  size - HEADER_SIZE);
> +	mxport->sent_payload += count;
> +	request_send_next = mxport->sent_payload >= port->bulk_out_size;

How big are the per-port buffers?

> +	if (request_send_next)
> +		mxport->hold_reason |= MX_WAIT_FOR_SEND_NEXT;
> +	spin_unlock_irqrestore(&port->lock, flags);
>  
>  	put_unaligned_be16(port->port_number, buf);
>  	put_unaligned_be16(count, buf + 2);
>  
> +	if (request_send_next)
> +		buf[0] |= UPORT_REQUEST_SEND_NEXT;
> +
>  	dev_dbg(&port->dev, "%s - size %zd count %d\n", __func__,
>  		size, count);
>  
>  	return count + HEADER_SIZE;
>  }
>  
> +static int mxuport_write_start(struct usb_serial_port *port, gfp_t mem_flags)
> +{
> +	struct mxuport_port *mxport = usb_get_serial_port_data(port);
> +	struct urb *urb;
> +	unsigned long flags;
> +	int i;
> +	int count;
> +	int result;
> +
> +	if (test_and_set_bit_lock(USB_SERIAL_WRITE_BUSY, &port->flags))
> +		return 0;
> +retry:
> +	spin_lock_irqsave(&port->lock, flags);
> +	if ((mxport->hold_reason & MX_WAIT_FOR_SEND_NEXT) ||
> +	    !port->write_urbs_free || !kfifo_len(&port->write_fifo)) {
> +		clear_bit_unlock(USB_SERIAL_WRITE_BUSY, &port->flags);
> +		spin_unlock_irqrestore(&port->lock, flags);
> +		return 0;
> +	}
> +
> +	i = (int)find_first_bit(&port->write_urbs_free,
> +				ARRAY_SIZE(port->write_urbs));
> +	spin_unlock_irqrestore(&port->lock, flags);
> +
> +	urb = port->write_urbs[i];
> +	count = mxuport_prepare_write_buffer(port, urb->transfer_buffer,
> +					     port->bulk_out_size);
> +	urb->transfer_buffer_length = count;
> +	usb_serial_debug_data(&port->dev, __func__, count,
> +			      urb->transfer_buffer);
> +
> +	spin_lock_irqsave(&port->lock, flags);
> +	port->tx_bytes += count;
> +	spin_unlock_irqrestore(&port->lock, flags);
> +
> +	clear_bit(i, &port->write_urbs_free);
> +	result = usb_submit_urb(urb, mem_flags);
> +	if (result) {
> +		dev_err_console(port, "%s - error submitting urb: %d\n",
> +				__func__, result);
> +		set_bit(i, &port->write_urbs_free);
> +		spin_lock_irqsave(&port->lock, flags);
> +		port->tx_bytes -= count;

> +		if (mxport->hold_reason & MX_WAIT_FOR_SEND_NEXT) {
> +			mxport->hold_reason &= ~MX_WAIT_FOR_SEND_NEXT;
> +			mxport->sent_payload = 0;
> +		}

Shouldn't you undo the effects of prepare_write_buffer() and subtract
count from sent_payload (and clear the flag) unconditionally?

> +		spin_unlock_irqrestore(&port->lock, flags);
> +
> +		clear_bit_unlock(USB_SERIAL_WRITE_BUSY, &port->flags);
> +		return result;
> +	}
> +
> +	goto retry;
> +}

This is a more or less verbatim copy of the generic write
implementation. If we go this way you should at least mention that you
copied it in the commit message, but perhaps we should try to find a way
to generalise it instead.

Also, if you really need a custom implementation to throttle writes,
then shouldn't using one URB be enough? The other one is essentially
there to allow for higher throughput which we need to give up for
correctness here anyway.

> +
> +static int mxuport_write(struct tty_struct *tty, struct usb_serial_port *port,
> +			 const unsigned char *buf, int count)
> +{
> +	int result;
> +
> +	if (!port->bulk_out_size)
> +		return -ENODEV;

This is redundant in a custom implementation.

> +
> +	if (!count)
> +		return 0;
> +
> +	count = kfifo_in_locked(&port->write_fifo, buf, count, &port->lock);
> +	result = mxuport_write_start(port, GFP_ATOMIC);
> +	if (result)
> +		return result;
> +
> +	return count;
> +}

Johan
