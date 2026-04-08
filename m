Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303DD19D8A8;
	Wed,  8 Apr 2026 05:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775625854; cv=none; b=fOgY318vnflizqlt3esvdWl0qUifAR2+f1C52iKcwzy+FoZ0CHViywwO98bPSaVhlTIcpN3jA2sPYNgnjorsmqOTmzqxIrfReKo8ZKgu0YeJduvpMDEdDGPGqgod1nj9Az0RZ3dWx7ldIbXlUEhDYAbMCHWlR/JQj2roDS2X7e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775625854; c=relaxed/simple;
	bh=wBc4gl2asjXums88OrFtUc3nzEZ7PDFnuSG8zQepTvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=thviCGK3163XNDEHbpqvb7im5Ug1LH6IbIFxjT0jqNQDFRgQX3FpUk/eEul/ZQ8JpGVayTdhQM22wPPWme79DdHHcjSxfdFXAuTwXRkJiritNmqOyUA+h6qhmjEmfBQIyV5OUcQAd9fI2cgsFea2ejdjixYgyEe3jy2XoQI7COM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YiMXMr13; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YiMXMr13"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B11BC19424;
	Wed,  8 Apr 2026 05:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775625853;
	bh=wBc4gl2asjXums88OrFtUc3nzEZ7PDFnuSG8zQepTvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YiMXMr13/fSnMfwvYpqG0JFUceNG//gaT8+7WAqldIq6DuEKQsPpNtAtP+fd8xFHh
	 0QeoPCvhDfV/RONDSxq66GccmJ4/h3vjKsLAsNiKMy15mz6R99mFXOftZSEiJrMJwJ
	 Pn8Ef0e/dUjh7DxcS1CgLNiXvQtRiCZ1Y3C9LTDjOcfc0e5VzWeA5qLlkwuc7ddZDY
	 L3cXwXlxhI60385/SbgwL3ibZAoplVKmOH9MmpjbWN72HwShvfnBksooAdhix44n1u
	 zq13Wh2DNmKwmhcjtoVYOTRrr80vyYyBRYuxZwu+UUxomnY5XtfcfKFsoRtNQURa73
	 ZpgnHH1pBzxLQ==
Date: Wed, 8 Apr 2026 13:24:09 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, jun.li@nxp.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/3] usb: chipidea: core: refactor
 ci_usb_role_switch_set()
Message-ID: <adXmeZoRuOrR7T6w@nchen-desktop>
References: <20260402071457.2516021-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260402071457.2516021-1-xu.yang_2@nxp.com>

On 26-04-02 15:14:55, Xu Yang wrote:
> Current code is redundant, refactor the code, no function change.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> 
> ---
> Changes in v2:
>  - new patch
> ---
>  drivers/usb/chipidea/core.c | 29 +++++++----------------------
>  1 file changed, 7 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index fac11f20cf0a..87be716dff3e 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -618,28 +618,13 @@ static int ci_usb_role_switch_set(struct usb_role_switch *sw,
>  	struct ci_hdrc *ci = usb_role_switch_get_drvdata(sw);
>  	struct ci_hdrc_cable *cable;
>  
> -	if (role == USB_ROLE_HOST) {
> -		cable = &ci->platdata->id_extcon;
> -		cable->changed = true;
> -		cable->connected = true;
> -		cable = &ci->platdata->vbus_extcon;
> -		cable->changed = true;
> -		cable->connected = false;
> -	} else if (role == USB_ROLE_DEVICE) {
> -		cable = &ci->platdata->id_extcon;
> -		cable->changed = true;
> -		cable->connected = false;
> -		cable = &ci->platdata->vbus_extcon;
> -		cable->changed = true;
> -		cable->connected = true;
> -	} else {
> -		cable = &ci->platdata->id_extcon;
> -		cable->changed = true;
> -		cable->connected = false;
> -		cable = &ci->platdata->vbus_extcon;
> -		cable->changed = true;
> -		cable->connected = false;
> -	}
> +	cable = &ci->platdata->id_extcon;
> +	cable->changed = true;
> +	cable->connected = (role == USB_ROLE_HOST);
> +
> +	cable = &ci->platdata->vbus_extcon;
> +	cable->changed = true;
> +	cable->connected = (role == USB_ROLE_DEVICE);
>  
>  	ci_irq(ci);
>  	return 0;
> -- 
> 2.34.1
> 

-- 

Best regards,
Peter
