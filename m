Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD943DEFFE;
	Fri, 22 May 2026 11:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779449747; cv=none; b=TDCyxWJs1MCGKszSYyRDs8LVtJQVLYKVy8TTQCbmPTsM87OwJizn9SHYYRGY5JDiuorPkEEwT8MvX+ywnbSOfwPKRTMyO5pe7a5ForZVC+ptgiFLt0JhkA3sYLC1HfPLE4p03wZTwrMZ30WGc+OxDLtY2WTfJxy71nC7+nrI0Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779449747; c=relaxed/simple;
	bh=g6okYENrRyfmKn66sLAuTKR64jeU0COyHnJ9r0tL1tU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EvWIF23cmLKN59+7KJoQRXtwgXKyVZAoMwKm0eMXHRPUmGCJcpNfqXKhgc7WjpbcbNBoiUltnCntW2sh1BOG7lSYNFfC1YferyDJcH7yNVwVPyR2+RyEZbo2Ae5d29hpUBfZO6rf3a0MXdWihmVF6dvh23sWBggU4OL/I3KsU44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=a8k47ilG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="a8k47ilG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E1C91F000E9;
	Fri, 22 May 2026 11:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779449745;
	bh=l4iXBETSSIu1SdiiwAiLXgmz1Igs6bBrt4o5hpuxfTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a8k47ilGOAOhH+O95+3bA+8aj4VVJJGVoYwQxxmsXNzcbMA9rhcEqfD0RSI15w3uA
	 7zH2ZpfxiceTEoltYjzrG+WBoPNpzidMGj/puvBi+zyMtMJcsL4b/hdfQDLtdr8JCv
	 knGVXyUa4xG963/BkzyHG8jtUaUaLQPcE90YtF/8=
Date: Fri, 22 May 2026 13:35:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: Zhang Cen <rollkingzzc@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] USB: serial: cypress_m8: fix memory corruption with
 small endpoint
Message-ID: <2026052243-playmaker-lyricist-7968@gregkh>
References: <20260522101621.927034-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522101621.927034-1-johan@kernel.org>

On Fri, May 22, 2026 at 12:16:21PM +0200, Johan Hovold wrote:
> Make sure that the interrupt-out endpoint max packet size is at least
> eight bytes to avoid user-controlled slab corruption or NULL-pointer
> dereference should a malicious device report a smaller size.
> 
> Fixes: 3416eaa1f8f8 ("USB: cypress_m8: Packet format is separate from characteristic size")
> Cc: stable@vger.kernel.org	# 2.6.26
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/usb/serial/cypress_m8.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/serial/cypress_m8.c b/drivers/usb/serial/cypress_m8.c
> index afff1a0f4298..82ba0900b399 100644
> --- a/drivers/usb/serial/cypress_m8.c
> +++ b/drivers/usb/serial/cypress_m8.c
> @@ -445,6 +445,14 @@ static int cypress_generic_port_probe(struct usb_serial_port *port)
>  		return -ENODEV;
>  	}
>  
> +	/*
> +	 * The buffer must be large enough for the one or two-byte header (and
> +	 * following data) but assume anything smaller than eight bytes is
> +	 * broken.
> +	 */
> +	if (port->interrupt_out_size < 8)
> +		return -EINVAL;
> +
>  	priv = kzalloc_obj(struct cypress_private);
>  	if (!priv)
>  		return -ENOMEM;
> -- 
> 2.53.0
> 
> 

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
