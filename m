Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0A3370D5F;
	Wed, 20 May 2026 11:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779275797; cv=none; b=i9BrOG4wCWWfguB0pFLd3lBWDc6kWUDq1U5m0PnDxlRDentX4QTlHF9g2QUjw/4MQZlVUcUvMt4FKUY55dfixOfKWk6klS+9xe/HqFL3LoTQhMOu3gX5xKCNo0IMgeI8JNlqD5D0Dl2E/h6QdX6CsGQjgBxHiAlEUia9ISVKMbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779275797; c=relaxed/simple;
	bh=KGuDkxNea97wNqoRzIN7eu7egFcyD1FJQG3XJy6lbDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X2Y7HBFfGIKisbmf3BUfPEvkZC7xZOFvp6nIW079Jgt9UcTMxgkJDPpOxZQ9T2eZ4kd1Vy43Whp9HrGRJOoh38r1YtRBt+sEr8WHWEmDeE7i1IQGy0hgxttCZjzLnse5/XUJX79Ft+eS+XlMq/3TBRe3nf6g6EP4OQTicqlM6yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Qf6nupVy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Qf6nupVy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A44191F000E9;
	Wed, 20 May 2026 11:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779275793;
	bh=++hjo+uLCm7FMgGqExIqw6QtJPgqYdyBXwD3Id3nqK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qf6nupVyV6tAdl/+E8zLaI0TAff9zU812l4uI0GqPYynbKo5HQ0PMKnvup9rfpGrt
	 ZAWyft7B0BUsG70YrcbFZqCEhi0c4F2Cfuq+QgQLbFHUa5vtoJfM9ShpVRYntx7iH6
	 MqENDokWCWEo5vLqvIpqoJ/fe3soV1wzUb0S7338=
Date: Wed, 20 May 2026 13:16:36 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] USB: serial: mct_u232: fix missing interrupt-in transfer
 sanity check
Message-ID: <2026052027-boxing-strenuous-b014@gregkh>
References: <20260520101750.657933-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520101750.657933-1-johan@kernel.org>

On Wed, May 20, 2026 at 12:17:50PM +0200, Johan Hovold wrote:
> Add the missing sanity check on the size of interrupt-in transfers to
> avoid parsing stale or uninitialised slab data (and leaking it to user
> space).
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/usb/serial/mct_u232.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/serial/mct_u232.c b/drivers/usb/serial/mct_u232.c
> index ca1530da6e77..163161881d2d 100644
> --- a/drivers/usb/serial/mct_u232.c
> +++ b/drivers/usb/serial/mct_u232.c
> @@ -544,6 +544,11 @@ static void mct_u232_read_int_callback(struct urb *urb)
>  		goto exit;
>  	}
>  
> +	if (urb->actual_length < 2) {
> +		dev_warn_ratelimited(&port->dev, "short interrupt-in packet\n");
> +		goto exit;
> +	}
> +
>  	/*
>  	 * The interrupt-in pipe signals exceptional conditions (modem line
>  	 * signal changes and errors). data[0] holds MSR, data[1] holds LSR.
> -- 
> 2.53.0
> 
> 

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
