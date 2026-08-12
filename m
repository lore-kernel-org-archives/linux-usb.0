Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EC7355F22;
	Wed, 12 Aug 2026 14:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786543856; cv=none; b=OBfJ/9USw3oBCGJXYF3pWh8z+hzmUwKlXz52HiYoABQ+4Xs4A/NIaNa8MWsr+/49uZYahgFAuWBNUj0U3zTsgQy6MW5DOA1W5Yz+oufhTFVFUruMVT8xAv7NL18KR7rIqMF8gn+xYs1qcQjcg4Sl+BJdNJrnUWAb8Bnhkl6msmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786543856; c=relaxed/simple;
	bh=6qu6Q7qIRekYCeVbz13qm/FC9dFLj7bQ9lL2mKV9/jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TskrJGRqejakgjfM6PDm5DAk9ieL7f5bYr60YXRlHWZ9FXZhSaiFKf8WsGSbPhnOGRHoXXXjmvmj4vz682/3USLxsngSjX0q42DNQSp3oEA9ugu3JQCswl6AIY8tNUIk6PAOEfKhpxrOG2cWHoGWpxcBd+rzx9DBRdbOpVFEyo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lKfPac3Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lKfPac3Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EA0B1F000E9;
	Wed, 12 Aug 2026 14:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786543855;
	bh=XHZahpCICOQ0axQ0WtGK1M4sM13+Ew8usVmUBAm2Ed4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lKfPac3YV6QdQhlX7eiFyrFI6A/roj+u8EPoc/x2uaMAlcjxsiwqXvEF3fIDmPnZR
	 QVh3/OVvhqPO7u+mNl8i9oInPB5JWmFi8V8ryIjYdySzrrYdTJjc4swhH506JsJdhl
	 U/oqOlRH/pt20eHxet0CDBLAkYptOI3kpe7+7FxaOD05uB0sr4S0ijvrhWOC19Hrct
	 lr9mXMCmLIAU/Hwn2Tyct0v6cpt55gihCdQoddZUlJWhytX1DL9ZMJ1V8eQlceY32S
	 s5RZ1MEWxC6TOoa/frOHSghjjuir6MmwTAGjIsqAhjFAiDsvyIXy8/OJ09D0ABmht/
	 hb4NskCUw85bQ==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wu9fR-00000000ECB-0Rh4;
	Wed, 12 Aug 2026 16:10:53 +0200
Date: Wed, 12 Aug 2026 16:10:53 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: gadget: stop propagating controller OF nodes
Message-ID: <anx-7aOxjC2Hinxu@hovoldconsulting.com>
References: <20260702145350.109509-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702145350.109509-1-johan@kernel.org>

On Thu, Jul 02, 2026 at 04:53:50PM +0200, Johan Hovold wrote:
> Some UDC drivers propagate the controller OF node to the gadget device
> but there are no (and has never been any) users of this as the
> devicetree binding and composite driver support was never merged. [1]
> 
> Drop the unused and incomplete support for OF node propagation which if
> ever needed should be handled by UDC core.
> 
> Note that this also avoids probe failures when reusing an OF node that
> describe resources like pinctrl that are managed by driver core (cf.
> commit 48ed32482c41 ("usb: gadget: aspeed: Fix probe regression")).
> 
> Link: https://lore.kernel.org/all/1340720833-781-1-git-send-email-aletes.xgr@gmail.com/ [1]
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
> 
> This was something I stumbled over when fixing a couple of gadget device
> name leaks. This one applies on top of those fixes:
> 
> 	https://lore.kernel.org/all/20260702141536.90887-1-johan@kernel.org/

These fixes are now in 7.2-rc5 (and usb-next) so can this one be picked
up for 7.3?

Let me know if you prefer a resend.

>  drivers/usb/gadget/udc/aspeed-vhub/dev.c | 2 --
>  drivers/usb/gadget/udc/aspeed_udc.c      | 1 -
>  drivers/usb/gadget/udc/at91_udc.c        | 1 -
>  drivers/usb/gadget/udc/bcm63xx_udc.c     | 1 -
>  drivers/usb/gadget/udc/fsl_udc_core.c    | 3 ---
>  drivers/usb/gadget/udc/lpc32xx_udc.c     | 1 -
>  6 files changed, 9 deletions(-)

Johan
