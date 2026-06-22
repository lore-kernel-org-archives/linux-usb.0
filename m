Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D773A5427;
	Mon, 22 Jun 2026 10:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782123552; cv=none; b=soS/t2Vqoibylw6ID2uaFC/4BIl5+cCjTmmXaKrwS96XQ03k2x6LVAiWGOGIDXA4JJi0EQsrC2myk3mlc2foyNMG6MFJPlQFdp6C+nL/x37azrtLTUeDvTh0S1OemzoPVYal6zjgd8FZRtgTdPfjFzZzq8C//F0Qy41NP6QWHzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782123552; c=relaxed/simple;
	bh=TBib9yrjbEVNkBNQ9HnbdPTUbAcEeTcjo9cyl3zcGqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sSnRMc6yv+H/B6Dn6JsBawMUZLIu+pywu86VzWsKqxJYaJ3Uv5UFmDL1tM2o3aKZckHfXEuj07RMzTlsMHnKkCRY/Sc47q39mX15f5J3W3mEaHIZZeI65Mq5kRSLmWUnEqalxb1+LSE9w0dBaG8eaY3/pBMcm5S4Mu8dCIULLTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=a+7yORkF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="a+7yORkF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 401BF1F000E9;
	Mon, 22 Jun 2026 10:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782123550;
	bh=Ga6CI1r6bXomO84NvP5HZfg2FS17Ih03Ve30Psn0Osw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a+7yORkFBge+bZYoIpFn67SbnXmbKpOlbULfBvtQ/4O/gx3Ofn3ZaBb1yZSaDvYHL
	 EKfNQmTc/kDwT5+7dcbnLgmC5BFUopw4ZKcSWZ03QnT9YRuvQ5UjFLePYIy4uNbloP
	 9qaKN1yxf8kn8WEut9PxbtYSh9Jfb0ojapY67Xqk=
Date: Mon, 22 Jun 2026 12:19:25 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chinna Mopurigari Naveen Kumar Reddy <naveen.reddy@ftdichip.com>
Cc: Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arun Pappan <arun.pappan@ftdichip.com>
Subject: Re: [PATCH v2 2/2] USB: serial: ftdi_sio: make explicit
 latency_timer sysfs write authoritative
Message-ID: <2026062200-tamer-gallows-b8ad@gregkh>
References: <cover.1781744946.git.naveen.reddy@ftdichip.com>
 <cover.1782121274.git.naveen.reddy@ftdichip.com>
 <180003edbd4fb3f6ef2b87551499698927b1191d.1782121274.git.naveen.reddy@ftdichip.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <180003edbd4fb3f6ef2b87551499698927b1191d.1782121274.git.naveen.reddy@ftdichip.com>

On Mon, Jun 22, 2026 at 05:43:40PM +0800, Chinna Mopurigari Naveen Kumar Reddy wrote:
> write_latency_timer() clamps the value programmed into the FT chip's
> per-channel latency_timer register to 1 whenever ASYNC_LOW_LATENCY is
> set in priv->flags.  ASYNC_LOW_LATENCY is set by userspace via
> TIOCSSERIAL, used by setserial(8), libftdi and certain tcsetattr
> paths.  The interaction with the existing sysfs latency_timer
> attribute is surprising: once any of those tools has set the flag, a
> later write of "16" (or any other value) to
> /sys/bus/usb-serial/devices/ttyUSBx/latency_timer is silently
> clamped to 1 and never reaches the chip.
> 
> The store path is the most explicit way userspace can ask for a
> particular latency_timer value; treat it as authoritative.  On an
> explicit sysfs write, clear ASYNC_LOW_LATENCY before calling
> write_latency_timer() so the requested value is what the chip
> register actually receives.  Emit a dev_info() so the override is
> visible.
> 
> Reads continue to honour ASYNC_LOW_LATENCY (returning "1") so any
> userspace that previously inspected the attribute to confirm
> low-latency mode keeps working until it does its own explicit write.
> 
> Signed-off-by: Chinna Mopurigari Naveen Kumar Reddy <naveen.reddy@ftdichip.com>
> ---
>  drivers/usb/serial/ftdi_sio.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
> index 7aaa7fc1be71..e7f13eca7ae6 100644
> --- a/drivers/usb/serial/ftdi_sio.c
> +++ b/drivers/usb/serial/ftdi_sio.c
> @@ -1683,6 +1683,23 @@ static ssize_t latency_timer_store(struct device *dev,
>  	if (kstrtou8(valbuf, 10, &v))
>  		return -EINVAL;
>  
> +	/*
> +	 * An explicit sysfs write wins over the legacy ASYNC_LOW_LATENCY
> +	 * tty-flag override.  Without this, if any userspace tool
> +	 * (setserial(8), libftdi, certain tcsetattr paths) had set
> +	 * ASYNC_LOW_LATENCY via TIOCSSERIAL, write_latency_timer() would
> +	 * silently clamp the chip register to 1 regardless of what was
> +	 * written to sysfs.  Clearing the flag here makes sysfs the
> +	 * authoritative source so the next chip-side write uses exactly
> +	 * the value the caller asked for.
> +	 */
> +	if (priv->flags & ASYNC_LOW_LATENCY) {
> +		dev_info(&port->dev,
> +			 "explicit latency_timer=%u clears ASYNC_LOW_LATENCY flag\n",
> +			 v);

When drivers work properly, they are quiet.  Make this a debugging
message at the most please.

thanks,

greg k-h
