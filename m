Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6AE3EF0AD;
	Mon, 18 May 2026 11:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779102430; cv=none; b=dn7fdhIiq85jZhUGEuebPv4oUQwRRMjzfm1DLQ1C1TzJaBD7VEbg+3qSlYnTXXLuS2ZpiSsKt3BrbNysI1AcaZ4d9GzkpJB6ZfqBq9BrUUlIyvqdXsBjpTYKti91OFkTouhChQzM6tVlOl917xowU/bv0H4EGMiqHHze54n6ZfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779102430; c=relaxed/simple;
	bh=B9+fu3Cw5cK5jlW96qcAWLM1oWEYi19QpKHZss4bAaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PCweEUwDXH69kFqYNpeiU5NdKTaXN6ixjdbGdL2fVa+c7VvB8sT7ZqlKZzg6zSLQqn7+g4LrNfQJdEXnlQzP2Dp5M4EbzQFfnOP0cOgBbDsLaJOxMXkjQmrp4QOdIwj2P8exUBFAYg9IL97quncVtb8oFJM5bea+mIu5yd8mClc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z/U+MM3c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z/U+MM3c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B265C2BCB7;
	Mon, 18 May 2026 11:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779102428;
	bh=B9+fu3Cw5cK5jlW96qcAWLM1oWEYi19QpKHZss4bAaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z/U+MM3cuaZ6DHoUMZYJY/loGhZKBA0KQSqYmCvgfO6SpGTn84p7bnQx37cXLXoOu
	 lEMCl6WQUDW/3tmY0epRaWojIaoc56W+KrbOXnmGovgaAO8Qb0F3WjnC217rLZAPFC
	 x1oxp8PttJINKdA0Gdixsygc0AKU3isCMtwebLmqav2O00PJ6mox2Gy48Fj+R51OdQ
	 +Ac83zgQVSOkPT6hO9w7w5Y+baB4DjaySqjyuAv691zfT2WZEl68G4JPN3ZEkZFufp
	 GKcpD0lwcUiLU6hj/htDcZEtrHP+MVjPh6Hiqowuc1V3EJzBS+ASJMEKav7IZNKFtp
	 bA/Gyf1VyeF8w==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wOvoP-000000017ro-27V9;
	Mon, 18 May 2026 13:07:05 +0200
Date: Mon, 18 May 2026 13:07:05 +0200
From: Johan Hovold <johan@kernel.org>
To: Zhang Cen <rollkingzzc@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	zerocling0077@gmail.com, 2045gemini@gmail.com
Subject: Re: [PATCH] USB: serial: belkin_sa: validate interrupt status length
Message-ID: <agry2e2brte8W7U0@hovoldconsulting.com>
References: <20260516042428.3777524-1-rollkingzzc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516042428.3777524-1-rollkingzzc@gmail.com>

On Sat, May 16, 2026 at 12:24:28PM +0800, Zhang Cen wrote:
> The Belkin interrupt callback treats the interrupt packet as a four-byte
> status report and reads LSR/MSR fields at offsets 2 and 3. The
> interrupt-in buffer length is derived from endpoint wMaxPacketSize,
> and short interrupt transfers may complete successfully with a smaller
> actual_length.
> 
> Do not parse interrupt status unless both the URB buffer and the completed
> packet are large enough for the status fields. This prevents devices with
> short interrupt endpoints or short successful packets from driving
> out-of-bounds or stale status-byte reads.

How was this issue found? Are you using some kind of static checker or
LLM?

> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Zhang Cen <rollkingzzc@gmail.com>
> 
> ---
>  drivers/usb/serial/belkin_sa.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/serial/belkin_sa.c b/drivers/usb/serial/belkin_sa.c
> index 38ac910b1082..a1e4173a2877 100644
> --- a/drivers/usb/serial/belkin_sa.c
> +++ b/drivers/usb/serial/belkin_sa.c
> @@ -192,6 +192,10 @@ static void belkin_sa_read_int_callback(struct urb *urb)
>  		goto exit;
>  	}
>  
> +	if (urb->actual_length < BELKIN_SA_MSR_INDEX + 1 ||
> +	    urb->transfer_buffer_length < BELKIN_SA_MSR_INDEX + 1)

You only need to verify urb->actual_length here (as actual_length <=
transfer_buffer_length).

> +		goto exit;
> +
>  	usb_serial_debug_data(&port->dev, __func__, urb->actual_length, data);
>  
>  	/* Handle known interrupt data */

Johan
