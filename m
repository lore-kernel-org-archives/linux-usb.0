Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF831D63F0;
	Wed, 22 Apr 2026 01:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776820646; cv=none; b=LECv+uHZ5QilGc3q6U3CbI8KblvwPx4sUfLhzP57BHNrBTJoTWlqmy0JzZIOmZaAaPrEHYDCUE4wneeru6usTbt/4ViBdBIf4IvtsqcyLZl+1+jXfFLwcyUm/thZ+5NthnbzGsrSPTxD1FsvoBwCuYqK1WE0MW1Q4brmu3BzBvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776820646; c=relaxed/simple;
	bh=YL+ORQbFH9eZ/775xyQgg9X5HjyunGT/EtNkkjjDprg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rbEVsiTUJpVv0mooU2K+AEhfxz1rrMwQ97dMJwp3NLog5l++u2kyiqbwOrc2VAmk0iiTA1vEmHl7p6ictxpZc9wqxbVdhSgED6Lg4x69/Zz3+A4qysOQHmib16V6jvNyDeJCXPSzrlyuosLq5IUNsK+YYKg4czKbeR3C/Fp4hcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RJUD0Fyp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RJUD0Fyp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E06C2BCB0;
	Wed, 22 Apr 2026 01:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776820646;
	bh=YL+ORQbFH9eZ/775xyQgg9X5HjyunGT/EtNkkjjDprg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RJUD0FyphzWuhQX7yceEgEEfJj4KugVomDw3InyA8jdutWZYN8wM225F3c19BmBv0
	 rwn5i20zYYvybAr0qpBE0OlW32VEUK/xrF3tyhuZJcPqH8Z3+HkwVEKhoETqw5w3ZF
	 NrkvLGpyr77MdSfJr2A9HWuKn0cFOh8mqO+W+uxZR7p8LepbvH5aIqCRUJYwyEqLTw
	 iEVq2TirjO9lowd5LuToGPhVBaZotIYnQsAfjc2ApjVjCusIsoAw+hnvGCVTMEEtU0
	 Pmt7NGDWvqDHBR5Rsbyr3VrsG+tDrGDEK0i6GV3pQXEyRYWCWNctqI+JkFZwp2YRyn
	 Xv3gVZceJqsZA==
Date: Wed, 22 Apr 2026 09:17:22 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, jun.li@nxp.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/3] usb: chipidea: udc: add a helper
 ci_udc_enable_vbus_irq()
Message-ID: <aegholg3FV38sLts@nchen-desktop>
References: <20260421082436.1264442-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260421082436.1264442-1-xu.yang_2@nxp.com>

On 26-04-21 16:24:34, Xu Yang wrote:
> The VBUS interrupt is configured in multiple places, add a helper function
> ci_udc_enable_vbus_irq() to simplify the code.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/chipidea/udc.c | 32 +++++++++++++++++---------------
>  1 file changed, 17 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index f2de86d0ce40..d4277d6611ee 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -1835,6 +1835,20 @@ static const struct usb_ep_ops usb_ep_ops = {
>   * GADGET block
>   *****************************************************************************/
>  
> +static void ci_udc_enable_vbus_irq(struct ci_hdrc *ci, bool enable)
> +{
> +	u32 reg = OTGSC_BSVIS;
> +
> +	if (!ci->is_otg)
> +		return;
> +
> +	if (enable)
> +		reg |= OTGSC_BSVIE;
> +
> +	/* Clear pending BSVIS and enable/disable BSVIE */
> +	hw_write_otgsc(ci, OTGSC_BSVIE | OTGSC_BSVIS, reg);
> +}
> +
>  static int ci_udc_get_frame(struct usb_gadget *_gadget)
>  {
>  	struct ci_hdrc *ci = container_of(_gadget, struct ci_hdrc, gadget);
> @@ -2352,23 +2366,13 @@ static int udc_id_switch_for_device(struct ci_hdrc *ci)
>  		pinctrl_select_state(ci->platdata->pctl,
>  				     ci->platdata->pins_device);
>  
> -	if (ci->is_otg)
> -		/* Clear and enable BSV irq */
> -		hw_write_otgsc(ci, OTGSC_BSVIS | OTGSC_BSVIE,
> -					OTGSC_BSVIS | OTGSC_BSVIE);
> -
> +	ci_udc_enable_vbus_irq(ci, true);
>  	return 0;
>  }
>  
>  static void udc_id_switch_for_host(struct ci_hdrc *ci)
>  {
> -	/*
> -	 * host doesn't care B_SESSION_VALID event
> -	 * so clear and disable BSV irq
> -	 */
> -	if (ci->is_otg)
> -		hw_write_otgsc(ci, OTGSC_BSVIE | OTGSC_BSVIS, OTGSC_BSVIS);
> -
> +	ci_udc_enable_vbus_irq(ci, false);
>  	ci->vbus_active = 0;
>  
>  	if (ci->platdata->pins_device && ci->platdata->pins_default)
> @@ -2395,9 +2399,7 @@ static void udc_suspend(struct ci_hdrc *ci)
>  static void udc_resume(struct ci_hdrc *ci, bool power_lost)
>  {
>  	if (power_lost) {
> -		if (ci->is_otg)
> -			hw_write_otgsc(ci, OTGSC_BSVIS | OTGSC_BSVIE,
> -					OTGSC_BSVIS | OTGSC_BSVIE);
> +		ci_udc_enable_vbus_irq(ci, true);
>  		if (ci->vbus_active)
>  			usb_gadget_vbus_disconnect(&ci->gadget);
>  	} else if (ci->vbus_active && ci->driver &&
> -- 
> 2.34.1
> 

-- 

Best regards,
Peter
