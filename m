Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834903A6B6A;
	Thu,  7 May 2026 16:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778170829; cv=none; b=PzSTYjDEBULKzwlr0HkDsbAvxaeRXzwxUYC8gBvDZHFIaf0MJFLbz9A/FOxmADy9q8ahWDEcJyQw34ibEC4TPcNnVRAzLPu9C/sv7p0LmitBm9Uq+inZnwga9I/didWk0wZJAxxzeSclVD8n9ogbkeQW4oGm7ZyMBXGdTn3HRyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778170829; c=relaxed/simple;
	bh=Pzp4bDvhBnVZMc5QbyczfS/iS7C+4RXZkFqCBHC6K+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tm5NuX9huCc5WPeidYgPrClh4+B/N5dunAR0AOzAn0fcYwZhBjjZeQpj8J3Wh+saBl6XIXzBZCtLCQJ4OC6ws1IeXDsTwtL/lhMdYSdB+83M/0OS5AYSbA83eyf2oXNTjxU5DK9DlSApD5v5QVawznm2X9DVmZM+KVf0y0NSRVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vN9GJ62j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vN9GJ62j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3CA2C2BCB2;
	Thu,  7 May 2026 16:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778170829;
	bh=Pzp4bDvhBnVZMc5QbyczfS/iS7C+4RXZkFqCBHC6K+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vN9GJ62jrF9Io8FAK0akhncHvm2+1K2x9iHChRKUt0uTU2aXuZPhHQ2DoBHJipSa8
	 rs+BOmYKyLIT3F3MjhezjuS1Ng8NVMWD/88ReeBzHo0ZNa6Lxs6+RYPwxQGWqV6t57
	 ZGjkOo5dsQ7bu9oMWdbl6NI+ZndBuC4xv4pU9rYQ=
Date: Thu, 7 May 2026 18:20:26 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [RFC PATCH] usb: host: Default CONFIG_USB_XHCI_RCAR to module
Message-ID: <2026050732-discolor-suing-ef2d@gregkh>
References: <20260507154710.3903732-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507154710.3903732-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Thu, May 07, 2026 at 04:47:10PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> On R-Car Gen3 and RZ/G2HMNE SoCs, when CONFIG_USB_XHCI_RCAR is built-in
> and the system boots with an NFS root filesystem, the xHCI controller
> probes before firmware becomes available. As a result, the firmware
> request fails:
> 
>   xhci-renesas-hcd ee000000.usb: Direct firmware load for
>   r8a779x_usb3_v3.dlmem failed with error -2
> 
> Default CONFIG_USB_XHCI_RCAR to module on ARCH_RENESAS so that probing
> is deferred until after the root filesystem is mounted, ensuring that
> the firmware is accessible.
> 
> Configurations explicitly selecting CONFIG_USB_XHCI_RCAR=y are
> unaffected.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/usb/host/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index 0a277a07cf70..b70e019cc3ac 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -90,7 +90,7 @@ config USB_XHCI_RCAR
>  	tristate "xHCI support for Renesas R-Car SoCs"
>  	depends on USB_XHCI_PLATFORM
>  	depends on ARCH_RENESAS || COMPILE_TEST
> -	default ARCH_RENESAS
> +	default m if ARCH_RENESAS

The module type here depends on your root filesystem.  If you are using
nfs for your root, then you always know you need to properly build stuff
into the kernel for modules that need firmware, this shouldn't be a
default thing as NFS surely isn't a default system type anymore.

thanks,

greg k-h
