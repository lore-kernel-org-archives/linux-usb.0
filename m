Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB29A5695;
	Fri, 31 Jul 2026 13:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785504715; cv=none; b=fzLNX2TXsE5mHH/m0sVrIMiSoqIQ+7BRqTqu/ft/Q7+zu8DIZHokDuw56XKVkJvY66/BxfWUVwMst6J7bO2iFsQrHXqoM2zo+Yzy/abs6tBRJ2gEAZoGR9lqA2jys3fZecp8mTYzJItq1p7x03nrJpIIxP1/iC3pAATBHfsorZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785504715; c=relaxed/simple;
	bh=XEJsFqUMJdgVQw5t9ByhRqL3F4MdLLQ1VSep3LSS1e4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NOOxT3HrKHqCqFQtsEW2SecnpYiS5htsle9mGioVADeHkURBmkvr/GR3JBykHnnMq5W8JP4H/Q4jnolSgrVr4TIPCqeuhCKb8+8Wj7UaUK8233V+zKWfuzj5tTGxzBoRzUWWn1OwsHTNb7BFMReWmcjeF3hHwAZwHr1JLC7p9+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kOHPZY1g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kOHPZY1g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 845B01F00A3A;
	Fri, 31 Jul 2026 13:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785504713;
	bh=rGgwANsxUTezRZTMVGHNgPfWWWn+5m3NscRbU5PsUSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kOHPZY1gOTbhlsywYYreCcmwSTF0B3ogQ031uyhy+FZZgZgNPdedgrX+ZqDXrJdCs
	 2fBiEB0nWW5ckA08kqaaAbrdwwD1gnpEg1zvcywSpLrmYXXfIemgyp8e3sHMhgWHmK
	 e2cCZsdLWmVze7D8+oXKkVVSmUKzRe591J01o0L3pdhRzNEz/DOBDhUSymFhdYM8Ut
	 q4zKRrfW6rMLJeGNtFID696NqD8c285hmHxcn/GfsTDyxgpmOVxCKFN217VMq8+SF4
	 pfl/4t1O8f7bfFe0Vr+dWBy0bJLBU1Zoj6b7mDc0Vn9MIFOn7kax2ooIV9gsJCcaAS
	 P8GZW/pHzWPdg==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wpnL4-00000000VuS-48mA;
	Fri, 31 Jul 2026 15:31:51 +0200
Date: Fri, 31 Jul 2026 15:31:50 +0200
From: Johan Hovold <johan@kernel.org>
To: Jiale Yao <yaojiale02@163.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: serial: fix slab out-of-bounds read in interrupt
 URB callback
Message-ID: <amyjxljD7aMO75Ql@hovoldconsulting.com>
References: <20260725162751.1045657-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260725162751.1045657-1-yaojiale02@163.com>

On Sun, Jul 26, 2026 at 12:27:51AM +0800, Jiale Yao wrote:
> The interrupt URB buffer is allocated in setup_port_interrupt_in() based
> on the endpoint's wMaxPacketSize:
> 
>     buffer_size = usb_endpoint_maxp(epd);
>     port->interrupt_in_buffer = kmalloc(buffer_size, GFP_KERNEL);
> 
> When a USB device declares wMaxPacketSize = 8 on its interrupt IN
> endpoint, the buffer is allocated from kmalloc-8 cache (exactly 8 bytes).
> 
> If the device sends a short packet (actual_length < wMaxPacketSize),
> the URB completes with status == 0 and the callback proceeds to read:
> 
>     data[sizeof(struct usb_ctrlrequest)]
> 
> which evaluates to data[8], accessing 1 byte beyond the allocated 8-byte
> buffer. This results in a slab out-of-bounds read.
> 
> Fix this by splitting the bounds check into two: first verify that the

As there is no current check I changed this to "by adding the missing
bounds check".

> actual length is large enough to contain the struct usb_ctrlrequest
> header before accessing req_pkt->bRequestType and req_pkt->bRequest,
> and then verify that there is an additional byte for the modem signal
> state before reading data[sizeof(struct usb_ctrlrequest)] inside the
> conditional.  Use sizeof(*req_pkt) instead of sizeof(struct
> usb_ctrlrequest) for consistency.
 
> Changes in v2:
> - Split the bounds check into two separate checks: one for the
>   usb_ctrlrequest header (before the conditional) and one for the
>   modem signal state (inside the conditional), as requested by
>   Johan Hovold and Oliver Neukum.
> - Use sizeof(*req_pkt) instead of sizeof(struct usb_ctrlrequest),
>   as suggested by Greg Kroah-Hartman.
> - Link to v1: https://lore.kernel.org/all/20260712170012.3503601-1-yaojiale02@163.com/T/#u

The changelog should go below the --- line so that it does not end up
in the git logs.

> Assisted-by: Claude:deepseek-v4-pro
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>  drivers/usb/serial/option.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 4c4009b8a46d..caef872a3c40 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -2672,12 +2672,25 @@ static void option_instat_callback(struct urb *urb)
>  			dev_dbg(dev, "%s: NULL req_pkt\n", __func__);
>  			return;
>  		}
> +
> +		if (urb->actual_length < sizeof(*req_pkt)) {
> +			dev_dbg(dev, "%s: short packet: %u bytes\n",
> +				__func__, urb->actual_length);
> +			return;

Since we stop the reading from the endpoint this should be logged as
an error.

> +		}
> +
>  		if ((req_pkt->bRequestType == 0xA1) &&
>  				(req_pkt->bRequest == 0x20)) {
>  			int old_dcd_state;
> +			if (urb->actual_length < sizeof(*req_pkt) + 1) {
> +				dev_dbg(dev, "%s: short interrupt transfer: %u bytes\n",
> +					__func__, urb->actual_length);
> +				return;

Same here.

> +			}
> +
>  			unsigned char signals = *((unsigned char *)
>  					urb->transfer_buffer +
> -					sizeof(struct usb_ctrlrequest));
> +					sizeof(*req_pkt));

And signals now need to be declared and initialised separately to keep
the declarations at the top of the block.

>  
>  			dev_dbg(dev, "%s: signal x%x\n", __func__, signals);

I fixed up the above when applying this time (and added the missing
driver name to Subject). The end result is here:

	https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git/commit/?h=usb-next&id=885d802f544ca7bfa8f3984d94233cce715bb6b3

Johan
