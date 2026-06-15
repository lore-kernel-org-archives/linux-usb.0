Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B61A23A562;
	Mon, 15 Jun 2026 02:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781490615; cv=none; b=SQf6ecZl8k4FzmNJjuf+eXjDYuqjlcEkBR7VoZ2CBxd9g82iRElmXhUZ58iA+RxzDyUZZhx+pMZey8SMqM3Ohz8HtdrLmDGt5dgDfo8v7BCRe9B93H1ErPFlDJb0Zl3Sk88dwIKLRJiM2CZHEpClG42BGVD73eHcS+bu5Rty4Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781490615; c=relaxed/simple;
	bh=q/cS3ir7m1lC33UUBwFbPdJD2RljfJFnX9Jn5xZKV3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oRbE/JTZyTf5XYwhTjdRfARoDfasRketeHo/Jx/FU9gDfViXPu+h+0F12miSHx7beWxrspRSMuyjX807wdk1HBlIYrWSeZd8AfcyF1XhiU+dtrCKMwXDgYK6YO0Jk2k/Q6osCUjt/WUaWB70jXpLhGeEzJsw99pk6dw3qtkTr0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=j00eUUwg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="j00eUUwg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89E701F000E9;
	Mon, 15 Jun 2026 02:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781490614;
	bh=dcuxpABPtwvCqGuHC5wGl/PX7KUgZBz1H4lSZggXdiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j00eUUwg7HhNJnrN4igpc+1UjtrKjM5rU4tE/nBiY0xHUSpM66ooKvSj6bVuryhNj
	 +mYx75z8Jj9f+Nmf9KAo4WXAuhrZQBvDd72mMhGclI48w4qdNY4YjZZfichC4FbLjo
	 a/ClIXRzcWdYE7RMCiDU0UBgZKqcTZJp/yMUy8qw=
Date: Mon, 15 Jun 2026 04:29:13 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Leonid Konontsov <lkonontsov@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: serial: replacing mutex_lock to guard(mutex)
Message-ID: <2026061540-drivable-campsite-8ba0@gregkh>
References: <20260614192337.9449-1-lkonontsov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260614192337.9449-1-lkonontsov@gmail.com>

On Sun, Jun 14, 2026 at 10:23:37PM +0300, Leonid Konontsov wrote:
> Moving from manual mutex_lock's and mutex_unlock's to guard(mutex) in
> ark3116.c file.
> 
> Signed-off-by: Leonid Konontsov <lkonontsov@gmail.com>
> ---
>  drivers/usb/serial/ark3116.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/usb/serial/ark3116.c b/drivers/usb/serial/ark3116.c
> index d974da43fba3..9cd8179de583 100644
> --- a/drivers/usb/serial/ark3116.c
> +++ b/drivers/usb/serial/ark3116.c
> @@ -237,7 +237,7 @@ static void ark3116_set_termios(struct tty_struct *tty,
>  	}
>  
>  	/* Update state: synchronize */
> -	mutex_lock(&priv->hw_lock);
> +	guard(mutex)(&priv->hw_lock);
>  
>  	/* keep old LCR_SBC bit */
>  	lcr |= (priv->lcr & UART_LCR_SBC);
> @@ -280,8 +280,6 @@ static void ark3116_set_termios(struct tty_struct *tty,
>  		ark3116_write_reg(serial, UART_LCR, lcr);
>  	}
>  
> -	mutex_unlock(&priv->hw_lock);
> -
>  	/* check for software flow control */
>  	if (I_IXOFF(tty) || I_IXON(tty)) {
>  		dev_warn(&port->dev,
> @@ -379,9 +377,8 @@ static int ark3116_tiocmget(struct tty_struct *tty)
>  	__u32 ctrl;
>  	unsigned long flags;
>  
> -	mutex_lock(&priv->hw_lock);
> +	guard(mutex)(&priv->hw_lock);
>  	ctrl = priv->mcr;
> -	mutex_unlock(&priv->hw_lock);

As "proof" you shouldn't be doing this, you just changed the logic here
and might have broken the driver :(

Did you test this change?

thanks,

greg k-h
