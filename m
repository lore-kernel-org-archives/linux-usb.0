Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BFE391845;
	Fri, 17 Jul 2026 12:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784290107; cv=none; b=N8+hX+bLDhLx5cUfc9ITpM2uHXEfpszvrgxNROnbi74wWlab1qgTn+Y8gY3etE++QyJw+eji3uxnT9qC6beyo6inzJex3h4LEifbqY2VetkmxfTwsuBADb0DIVNBFx5nznF76DtAZRS2loJa8+Ix5uLJm2LhXCdcFzlqEot9AQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784290107; c=relaxed/simple;
	bh=9cTJRJlKipjC0yew8M0TvUnzS/l6CdYkIayakG+k3yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qw0EzdGBLQp0JKPHqDz3O86YEUGtuft7mz+IM5uUPoSmMH3hLYaHast2RoSaOlk49fOqbxaGATmD+gj06Txbr+Z+HpkwpHmd7f4tHUOUzWqLezEI6srCR++J17aYHpzxWZTwvC20ul9jD2jZNrsxW7G1NfuFuivtgcknm0gkx1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZiFJaGhk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZiFJaGhk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E331F000E9;
	Fri, 17 Jul 2026 12:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784290106;
	bh=YXUGG0uc7ix9Rid2bi7JYasFamsRv3C8p4iEQHOP9tg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZiFJaGhknvzm5ZAx4iegkIxtrgTfmE6DnJIk2Z+p5izJ8P0yEYMyydCs6Q0nroNC3
	 X+d7MuEYnwlG/E0bd9Y2rlC5Lm+GTamNT/Aq8pzDx+l/X2EgS7QvHRz6HUijKylAv2
	 OTQwZyE917GoXdKQU4qK60tum0jsuCaadc6cUJOg=
Date: Fri, 17 Jul 2026 14:08:18 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Lucas Martins Alves <lucas.alves@lumal21.com.br>
Cc: "b-liu@ti.com" <b-liu@ti.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5] usb: musb: dsps: implement vbus_status and set_vbus
 platform ops
Message-ID: <2026071706-hardening-handwrite-e6de@gregkh>
References: <20260717111547.6946-1-lucas.alves@lumal21.com.br>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717111547.6946-1-lucas.alves@lumal21.com.br>

On Fri, Jul 17, 2026 at 11:16:02AM +0000, Lucas Martins Alves wrote:
> From: Lucas Martins Alves <lucas.alves@lumal21.com.br>
> 
> The DSPS glue layer (used on TI AM335x SoCs) was missing implementations
> for the vbus_status and set_vbus platform ops defined in struct
> musb_platform_ops.
> 
> Add dsps_musb_vbus_status() to report VBUS presence by reading the VBUS
> field of MUSB_DEVCTL, and dsps_musb_set_vbus() to drive the SESSION bit
> on MUSB_DEVCTL, enabling or disabling the USB session.
> 
> Register both callbacks in dsps_ops to allow the MUSB core to control
> VBUS on AM335x-based platforms. This enables the USB core to perform a
> VBUS power cycle as a recovery mechanism when a USB error condition is
> detected, and also allows userspace to control VBUS state via the
> standard USB sysfs interface.
> 
> Signed-off-by: Lucas Martins Alves <lucas.alves@lumal21.com.br>
> ---
>  drivers/usb/musb/musb_dsps.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/usb/musb/musb_dsps.c b/drivers/usb/musb/musb_dsps.c
> index e3935f18dd56..efd1f0dbb926 100644
> --- a/drivers/usb/musb/musb_dsps.c
> +++ b/drivers/usb/musb/musb_dsps.c
> @@ -618,6 +618,29 @@ static int dsps_musb_recover(struct musb *musb)
>  	return session_restart ? 0 : -EPIPE;
>  }
>  
> +static int dsps_musb_vbus_status(struct musb *musb)
> +{
> +	u8 devctl = musb_readb(musb->mregs, MUSB_DEVCTL);
> +
> +	return (devctl & MUSB_DEVCTL_VBUS) == MUSB_DEVCTL_VBUS;
> +}
> +
> +static void dsps_musb_set_vbus(struct musb *musb, int is_on)
> +{
> +	u8 devctl;
> +
> +	devctl = musb_readb(musb->mregs, MUSB_DEVCTL);
> +
> +	if (is_on) {
> +		devctl |= MUSB_DEVCTL_SESSION;
> +	} else {
> +		musb_root_disconnect(musb);
> +		devctl &= ~MUSB_DEVCTL_SESSION;
> +	}
> +
> +	musb_writeb(musb->mregs, MUSB_DEVCTL, devctl);
> +}
> +
>  /* Similar to am35x, dm81xx support only 32-bit read operation */
>  static void dsps_read_fifo32(struct musb_hw_ep *hw_ep, u16 len, u8 *dst)
>  {
> @@ -702,6 +725,8 @@ static struct musb_platform_ops dsps_ops = {
>  
>  	.set_mode	= dsps_musb_set_mode,
>  	.recover	= dsps_musb_recover,
> +	.vbus_status	= dsps_musb_vbus_status,
> +	.set_vbus	= dsps_musb_set_vbus,
>  	.clear_ep_rxintr = dsps_musb_clear_ep_rxintr,
>  };
>  
> -- 
> 2.53.0
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
