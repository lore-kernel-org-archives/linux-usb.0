Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F162A377016;
	Thu, 20 Aug 2026 15:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787238384; cv=none; b=WfvNxNEBY2axx9GNRYQRk8EIm1NGe4YNZXsVjZCdwk3NocD1H0YKnvsEZwEOJDldvZLo2SNmT3dBJqMFIrI4//DgGujjHifUHRYsTTMLZb7Z0DqXdn0s3MHSaq2+YaEvL5hKQgcKwsiLRkZWkYXQo4NeDbxfVN2A7eiu4Y+8YhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787238384; c=relaxed/simple;
	bh=OK075fbvyzFBmdxE3zJxM/SSx/2jFJHNtew3k1VAlTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L+MEELrxlWg5IqwCwo6hCPqirAOEHUbXTlMucnQ2OPZ7p4Pp05bn9WIYqMdlX4Cleiov529NNV2H4O9l+ddj+lWDGm9+aCNX48yIDxtb5FKDRk0/ClzN3kILM/T8TzT5Sl+jb+lmpTk3Y2BUjiizjLT6PtpEw6jSeYHQ2GTSsxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TNfcPz6p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TNfcPz6p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C71161F000E9;
	Thu, 20 Aug 2026 15:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787238382;
	bh=uSUsIcj6WNnIkriGHz3yHzXEn+/jzq+qZhTFhtyayUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TNfcPz6p3o2GOq6KUcdJjTUwnwImJqg/WVblRwkh1Oa/jnvraX1KIkUHukN76iJOT
	 dg/p0Au08QsNCODD5j9gO1PUp3fh6UPZthFa7xPXcOWBw7sNVO3PXY0qJ6WyYnpdFV
	 9A+w2tX5FOjz7T2+WwZM0zcSZARw0vuxc2pIM8DiwOtFLNmX+33dIU7GNZbLfF0rFK
	 EM/t2wluFhVEh1LEqcfBMFy56JgpE+AWaYF1brTteLtCzugwDZgfIFRGXJVXn/Mx34
	 HVl0j9Iky8BuXWUiRtupfPMw8r7fKW9Jl7KIz6qqCfR/t0dmK+n9jyyjhczGGrkfqA
	 5gTYE5FFfSVTA==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wx4LU-00000001pGJ-1mj9;
	Thu, 20 Aug 2026 17:06:20 +0200
Date: Thu, 20 Aug 2026 17:06:20 +0200
From: Johan Hovold <johan@kernel.org>
To: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+e5e28c3e953b2eebb16e@syzkaller.appspotmail.com
Subject: Re: [PATCH usb-next v1] USB: serial: keyspan: Fixing use-after-free
 in usa49_glocont_callback()
Message-ID: <aocX7F-v_ymLDWbi@hovoldconsulting.com>
References: <20260820070621.3286443-1-rafad900@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820070621.3286443-1-rafad900@gmail.com>

On Thu, Aug 20, 2026 at 12:06:21AM -0700, Rafael Alejandro Diaz Cruz wrote:
> usa49_glocont_callback() obtains the private data from all
> ports of a serial device using usb_get_serial_port_data().
> This can happen during keyspan_port_remove() which frees
> the private data which can cause UAF.
> 
> Fix this by calling usb_set_serial_port_data(port, NULL)
> inside keyspan_port_remove() right before kfree() of
> private data. This in turn allows "if (!p_priv) continue;"
> condition within usa49_glocont_callback() to execute
> properly.
> 
> Reported-by: syzbot+e5e28c3e953b2eebb16e@syzkaller.appspotmail.com

Please include a Link to the report as well (and a Fixes tag).

> Signed-off-by: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
> ---
>  drivers/usb/serial/keyspan.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/serial/keyspan.c b/drivers/usb/serial/keyspan.c
> index 4d3746c7a94e..0e08acb99970 100644
> --- a/drivers/usb/serial/keyspan.c
> +++ b/drivers/usb/serial/keyspan.c
> @@ -2997,6 +2997,8 @@ static void keyspan_port_remove(struct usb_serial_port *port)
>  	for (i = 0; i < ARRAY_SIZE(p_priv->in_buffer); ++i)
>  		kfree(p_priv->in_buffer[i]);
>  
> +	usb_set_serial_port_data(port, NULL);
> +

This doesn't work as nothing prevents the completion handler from
loading the pointer just before you set it to NULL here.

>  	kfree(p_priv);
>  }

The UAF syzbot reported is a symptom of a general problem with the
disconnect handling. I've just sent a fix to address this here:

	https://lore.kernel.org/all/20260820145402.434447-2-johan@kernel.org/

Johan
