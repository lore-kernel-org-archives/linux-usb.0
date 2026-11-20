Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795189044;
	b=WeqZ07ckfwCg8fSDMASsN6f6fKvZyNr2FB8C3gQmYfweA/vBbU2tRbREXdT3GnY59I3e
	 MnFKtqqmdmec/8k2rS9/ur+M9DZ9l1IvVA6PCzWL5Nr4XauNfytDNWRofdWl/gIf26jQV
	 tj+hODMWQPQKJywK0elRdGOclA5/rZliK4TdrLzybUcRgRBVP+pDbLjdm3UkhC+IMzBE1
	 DU/0DBAhe2SANS/wgpPgjOSP6/j1H3KA1k1j7Y0/7IvM/n0J3mtVTOECXZGWhWX0UmgVJ
	 Wh0X7u1K7Vm3NHYFgXHDnyYqvLSjLDk0GgjGomAY7qu3qi2SWksy59CzKNeU5GQjWHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795189044;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=jM2zQZj4sCA/BeUqFrGmArSxPy2PziPiafisynOVo9s=;
	b=GBiovMJk99lE+KeQYfb06zglfEKWwkBL5PvgILLREdLQqEfdeuFrExv1XXP22vTt4VNz
	 NNQPT+r94Nzfw51TTAovRrdYblqsDngzDen4EOKygNf2+OcAvIXDK2F49QQtcBl5sH89Q
	 bvZtb8oWAZQc12ipvaiqDbP9RdALf7IHH3a++5aa5D5Y1XseLoYpcSMK33cKhAm1DidYm
	 Lf3QgYmke4MCQP/kwNA8xTpyy4YKIGPfKdGwUBTEC/Q6GUGZ0d5JCPmVSgRiYyXqJWo3S
	 eRRp3wgFlC5LpT4ZboMQklQ+c+9iZf79Ujgwyh4+B8OR22GJhspfxuM88GhdnomoFgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=xYQs2WKx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BE6606A325;
	Fri, 20 Nov 2026 15:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=xYQs2WKx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8003E1F000D0;
	Fri, 20 Nov 2026 15:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795189044;
	bh=jM2zQZj4sCA/BeUqFrGmArSxPy2PziPiafisynOVo9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=xYQs2WKxWaBk/KDjQ5vSevd9VvV4biRUZIWcvCyBSyr2G+pq3UTxe7kT61aqJFxIK
	 qkkisD8rGPl6HTtZWjE3cfschy4Lurmyr5ZS8kgP/M+mwrtdxKO50Q6wpxkvEjYfqo
	 OEKf4ShPxj7xrTI9U3ArJeVDVHLvuKUKYGnJd0Go=
Date: Fri, 20 Nov 2026 16:37:21 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Guomin chen <chenguoming88s@gmail.com>
Cc: Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: cdns3: fix NULL dereference in cdns_host_resume()
Message-ID: <2026112010-raft-sandbank-869b@gregkh>
References: <20261118140513.8281-1-chenguoming88s@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118140513.8281-1-chenguoming88s@gmail.com>

On Wed, Nov 18, 2026 at 10:05:13PM +0800, Guomin chen wrote:
> From: Guoming Chen <chenguoming88s@gmail.com>
> 
> cdns_host_resume() assumes that the xhci-hcd child device is bound and
> passes platform_get_drvdata() straight to hcd_to_xhci_priv().  That is
> not guaranteed: __cdns_host_init() creates the child with
> platform_device_add(), but the child is only probed once xhci-plat
> registers.  cdns3/ is linked before host/ in drivers/usb/Makefile and
> both are module_init(), so at boot the child stays unbound until
> xhci-plat's initcall runs; when xhci-plat is a module it stays unbound
> until the module is loaded, and it is retried even later when its probe
> returns -EPROBE_DEFER.  Platforms that set
> CDNS3_DEFAULT_PM_RUNTIME_ALLOW (cdns3-imx is the only in-tree user) let
> the controller autosuspend (20 ms), so the parent may already be
> runtime-suspended by the time the child's probe actually runs.
> 
> When the child is finally probed, driver core resumes its parent before
> calling really_probe() (pm_runtime_get_sync(dev->parent) in
> __driver_probe_device()).  That runs cdns_resume() ->
> cdns_host_resume() while platform_get_drvdata() still returns NULL,
> because the drvdata is only set later, by dev_set_drvdata() in
> __usb_create_hcd() called from xhci_plat_probe().  hcd_to_xhci_priv(NULL)
> then evaluates usb_hcd_is_primary_hcd(NULL), which dereferences
> NULL + offsetof(struct usb_hcd, primary_hcd) (the offset depends on the
> configuration).  The oops faults in the first instruction of that
> helper:
> 
>   pc : usb_hcd_is_primary_hcd+0x0/0x1c
>   lr : cdns_host_resume+0x24/0x44
> 
> Return early when the host child is not available: it has either not
> been created yet or not been probed.  cdns->host_dev is also cleared by
> cdns_host_exit() while cdns_role_stop() leaves cdns->role pointing at
> the host role, so a resume after a role stop reaches this function as
> well.  Nothing is lost in either case: the child's probe initializes the
> controller from scratch, and xhci_plat_priv.power_lost is only consumed
> when an already initialized host resumes.
> 
> Fixes: 3a85c1011540 ("usb: host: cdns3: forward lost power information to xhci")
> Signed-off-by: Guoming Chen <chenguoming88s@gmail.com>
> ---
>  drivers/usb/cdns3/host.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
> index e01264dc625d..3456f065111b 100644
> --- a/drivers/usb/cdns3/host.c
> +++ b/drivers/usb/cdns3/host.c
> @@ -140,9 +140,21 @@ static void cdns_host_exit(struct cdns *cdns)
>  
>  static int cdns_host_resume(struct cdns *cdns, bool power_lost)
>  {
> -	struct usb_hcd *hcd = platform_get_drvdata(cdns->host_dev);
> -	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
> +	struct usb_hcd *hcd;
> +	struct xhci_plat_priv *priv;
> +
> +	/*
> +	 * The xhci-hcd child may not be bound yet (xhci-plat can probe it
> +	 * after cdns3 created it), or may already be gone after a role stop.
> +	 */
> +	if (!cdns->host_dev)
> +		return 0;
> +
> +	hcd = platform_get_drvdata(cdns->host_dev);
> +	if (!hcd)
> +		return 0;
>  
> +	priv = hcd_to_xhci_priv(hcd);
>  	priv->power_lost = power_lost;
>  
>  	return 0;
> -- 
> 2.43.0
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
