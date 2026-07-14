Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FEF328611;
	Tue, 14 Jul 2026 10:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784024230; cv=none; b=LXASJ4ESDL1BXW4Z5B1fsvz4YHydxm593Zvp/w4E79LhBAm65acInVjG9vfUtEY5ZoEzLS0c8eNGA/k8ayEdgyHlErfahaP7AjVPMaFFaJoBnR8qsnavE5rrgu0NF7z0nOijPAcgVnibmuP9P+9Rb2xPw4wD2N6/kX8bm0VAqFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784024230; c=relaxed/simple;
	bh=QsCb2E17hyuoED2bK4s187pjNEedfk6B0ZBT3/eEHms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=en7q72dUntXY6AQIGBAg6npNAPKrntKJEheVwaQvxpFJlBa+qPbyuWiDrwaajUQbq8xmnYP9p+zeAulId2JQWfRhRNaJWmObTVTg/0DNpnI1l62v9SzgoET4wKaOOvDfFqGVMWgEk9E/1ApDcXOyWZ4Qnr3TPa+0HflBGY+CCfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=H7Gdh7AB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="H7Gdh7AB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AF701F00A3F;
	Tue, 14 Jul 2026 10:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784024228;
	bh=qa3bY0GErY+BaizjdXZp4mkRymoPu26hARNZ+4/u6lk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H7Gdh7ABM0QSHarEHmqL9HtTLKm0E5B2Lk7ADwdrSbR5HlKBCxtKRvqvNFB/IMPEj
	 SCWpvuWOzasM9CuuZC6Gy8X9wIoKB1PmqfcTltIBoipaWuCfiaC6vA3My2KgH6liTL
	 CuxZC7huim0UzNU6KR6p5enp765UH9HvZ+Oji8TA=
Date: Tue, 14 Jul 2026 12:17:02 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sunho Park <shpark061104@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] USB: serial: io_edgeport: cap received transmit
 credits
Message-ID: <2026071447-myth-unfailing-6865@gregkh>
References: <20260714101316.823942-1-shpark061104@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714101316.823942-1-shpark061104@gmail.com>

On Tue, Jul 14, 2026 at 07:13:16PM +0900, Sunho Park wrote:
> The interrupt-status packet reports transmit credits returned by the
> device. edge_interrupt_callback() adds the 16-bit value to txCredits
> without checking maxTxCredits.
> 
> edge_write() uses txCredits minus the software FIFO count as the amount
> of data that fits. Since the FIFO is allocated with maxTxCredits bytes,
> txCredits exceeding maxTxCredits can cause OOB write in ring buffer.
> 
> Cap accumulated credits at maxTxCredits. Conforming devices should never
> hit the cap.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:GPT-5
> Signed-off-by: Sunho Park <shpark061104@gmail.com>
> ---
>  drivers/usb/serial/io_edgeport.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/serial/io_edgeport.c b/drivers/usb/serial/io_edgeport.c
> index 34ccf7820537..2ab3f8262259 100644
> --- a/drivers/usb/serial/io_edgeport.c
> +++ b/drivers/usb/serial/io_edgeport.c
> @@ -646,7 +646,9 @@ static void edge_interrupt_callback(struct urb *urb)
>  				if (edge_port && edge_port->open) {
>  					spin_lock_irqsave(&edge_port->ep_lock,
>  							  flags);
> -					edge_port->txCredits += txCredits;
> +					edge_port->txCredits =
> +						min(edge_port->txCredits + txCredits,
> +						    edge_port->maxTxCredits);
>  					spin_unlock_irqrestore(&edge_port->ep_lock,
>  							       flags);
>  					dev_dbg(dev, "%s - txcredits for port%d = %d\n",
> 
> base-commit: fad0fd120e29041b3e6cdf41bb12e3184fb524a2
> -- 
> 2.43.0
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
