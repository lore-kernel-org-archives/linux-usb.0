Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83501DE8BE;
	Sat, 16 May 2026 07:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778915979; cv=none; b=hIxZibN/QhpyYLjpS+8kHYxHIPgTm0GD26g5z8zwbJ9xn9RdstxWcVx0QL7AucN4ylz8D1yhNYmH6ZsBuxrbVcyT9xiyGxvGXTnQ1t5IpG5UAj2FPf982harTSzQcJw2d93X9sRbBWzhNLxbRda0plD5ftbTggmCfhFoVUfc22U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778915979; c=relaxed/simple;
	bh=vzIMv57j00+xJjTSPAvj0Js73MLxgZuREbMSdzR0pH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uF6cwk6OOICkFf5Vjubm0RPyXPEsE8emJWRQFUpaLhgqx8K4OTKblkKP4nLY2ivKC9zosQZyzgW4u2L+ssRK3eGV8fdMUBxbXL8RYGZ1HLdtZCV1HwUqMCeF+xCz3+ACaxjKm0LEew+85WJ8LdnGjU2tQTXsFumXkeLYuha999U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DikeG/Sk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DikeG/Sk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4584C19425;
	Sat, 16 May 2026 07:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778915979;
	bh=vzIMv57j00+xJjTSPAvj0Js73MLxgZuREbMSdzR0pH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DikeG/SkUFyT5WzLVTzNfXmk0pwhf0Equ6WhYJRx0O04757bvZlnnSHgG749WFbJb
	 fOi3NbgE+lgQisosDU78C/Rj808Bqzci7PPgDaC1SvYqkGUcOqPJZx5+lvF2s/ys61
	 I8CoxTMoHMqJXvvv6laanQq0DvipOOtaZBbJERf8=
Date: Sat, 16 May 2026 09:18:53 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Matthieu CASTET <castet.matthieu@free.fr>,
	Stanislaw Gruszka <stf_xl@wp.pl>, kernel-dev@igalia.com,
	linux-atm-general@lists.sourceforge.net, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: atm: ueagle-atm: adjust 'device found' message
Message-ID: <2026051628-squatter-stature-c0e0@gregkh>
References: <20260515-ueagle-atm_cosmetic-v1-0-9a15e5e45bd7@igalia.com>
 <20260515-ueagle-atm_cosmetic-v1-1-9a15e5e45bd7@igalia.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-ueagle-atm_cosmetic-v1-1-9a15e5e45bd7@igalia.com>

On Fri, May 15, 2026 at 08:54:12PM -0300, Mauricio Faria de Oliveira wrote:
> Correct the verb form and add 'with' for clarity.
> 
> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
> ---
>  drivers/usb/atm/ueagle-atm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/atm/ueagle-atm.c b/drivers/usb/atm/ueagle-atm.c
> index f3ae72feb5bfc313ccfa1ab6a9bb40fcd8f5800a..2730e7d41c89a354e115e38d97e314f888c62137 100644
> --- a/drivers/usb/atm/ueagle-atm.c
> +++ b/drivers/usb/atm/ueagle-atm.c
> @@ -2590,7 +2590,7 @@ static int uea_probe(struct usb_interface *intf, const struct usb_device_id *id)
>  	int ret;
>  
>  	uea_enters(usb);
> -	uea_info(usb, "ADSL device founded vid (%#X) pid (%#X) Rev (%#X): %s\n",
> +	uea_info(usb, "ADSL device found with vid (%#X) pid (%#X) Rev (%#X): %s\n",
>  		le16_to_cpu(usb->descriptor.idVendor),
>  		le16_to_cpu(usb->descriptor.idProduct),
>  		le16_to_cpu(usb->descriptor.bcdDevice),

When drivers work properly, they are quiet, so that means this line
should be removed entirely.

thanks,

greg k-h
