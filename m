Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9D143CEF6;
	Tue, 14 Jul 2026 09:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784021903; cv=none; b=XYJNTKVy48oMx2WzzYtgkvJLZq91zX5+kErM85NdNh8MJjea91FQQNjpzskEA/jVRAxrfPgvNU3pTuicxeVyL1ypHXFw13QHpjwuBu3EpNfYrHAo9vvYZUYXQ3hDgqcnWpD0fmEFk/j4hpcByF6OY0kKgQigXsKQ6DtMFx7HFH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784021903; c=relaxed/simple;
	bh=aEAo2etxtkhbNnuTrnbEpJNRuK61QinYi2rCKDoMZzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZjSFct8TCqiuazW5uZmrtWOug0yPv/uCM6Mm5+Pbw315G9uj7U8zkM0h+DoRwHJHeZof8M1zveRkT60pY3pWXnq5lWzS6O1B1LrsvVnIZXdEJtkjJljqqAojFyRLbDq7hio0rkCPJbsBihKv8NU9GjSG1DviYAOE+QuxHINihY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Yv16qY55; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Yv16qY55"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 390FE1F000E9;
	Tue, 14 Jul 2026 09:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784021899;
	bh=jkt9xpq62Q7jjuEZ50ovaJ/OwIuTzoFrDq8py3bv/8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yv16qY55OlL5l8qZjUVQMtsN5Z2/RugsL0o9PzjxKp+tErRrU++9ICtHwlxUl/gRM
	 0qlxD7gj/83sJSKTdj/BbvSRRgRzGyb5ifOCXEK/OWWFEJOHnIh7PeP5nXwOAI6L4g
	 RI2lCa5CN6WNUNdRdTwMOXBteCzw7EGJw7mZcijw=
Date: Tue, 14 Jul 2026 11:38:13 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sunho Park <shpark061104@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: io_edgeport: cap received transmit credits
Message-ID: <2026071448-rigor-unspoiled-1ffd@gregkh>
References: <20260714093424.737303-1-shpark061104@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714093424.737303-1-shpark061104@gmail.com>

On Tue, Jul 14, 2026 at 06:34:24PM +0900, Sunho Park wrote:
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
>  drivers/usb/serial/io_edgeport.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/serial/io_edgeport.c b/drivers/usb/serial/io_edgeport.c
> index 34ccf7820537..503b3b5bb647 100644
> --- a/drivers/usb/serial/io_edgeport.c
> +++ b/drivers/usb/serial/io_edgeport.c
> @@ -646,7 +646,10 @@ static void edge_interrupt_callback(struct urb *urb)
>  				if (edge_port && edge_port->open) {
>  					spin_lock_irqsave(&edge_port->ep_lock,
>  							  flags);
> -					edge_port->txCredits += txCredits;
> +					edge_port->txCredits =
> +						min_t(unsigned int,

LLMs really love to use min_t() as they haven't been trained on modern
kernel code.

Please don't use it, it shouldn't be needed here, right?

thanks,

greg k-h
