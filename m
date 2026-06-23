Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8034222E3F0;
	Tue, 23 Jun 2026 11:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782214963; cv=none; b=NNgXpIJ4Pne5GPvSwsvawQ7juy2eX/NNPc2hNzatcjRsixmIJMNBBDh7uq7/0eOkTZCdLMEToWb+jbOIExfQkP+MuXZc7LYV76a3PUy1wUHqKYzVRblfoHy9Ruoqv0k7RB0PL/pGM4o8c8J1mYZfJq0DQrVwU9A18k8oo51fqlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782214963; c=relaxed/simple;
	bh=qk9bjfRGos+O4n6swuh9Npk07MjZbR//otHx48tuGxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jyxhZSccY5Pw1h3D61BiMVSFvONiJ57oMnmmxkVwx/Wvxn/s28M8wV2DgYfGN0ZOVjyIgf0n4PPq2MBcw8lBSsVgTpVw4tZv7Dex7vSTbREs22YDgRmuDuvLMnhbWzYEm89Cc1rz4v9HAflNMQWtPV+3Yq+3SNwNIPv4jLd3Ark=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=husrEPyQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="husrEPyQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DC6C1F000E9;
	Tue, 23 Jun 2026 11:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782214962;
	bh=T+2LJtkZOo7zVvvD1fwQYUjIghWRLRNZtms8N1waA6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=husrEPyQ2uYygUyC/f+DdU6YkHNgkUoAcJ53B3wKd+OCJZtia4DvbvHWZobWxUG00
	 qCc4mxz07jLBpIkSGfCugsFmL5+n6eAPwR2uICfYLiO5mNhDVp9v3BQ1BN8JvIrxwE
	 YEbOWWSzigFk8cCUNb0mnTBqIjoRlmwwlHJn+Hfg=
Date: Tue, 23 Jun 2026 13:41:31 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: dwc3: imx8mp: make dwc3_imx_glue_ops static and
 rename to imx8mp
Message-ID: <2026062313-poker-closable-d9d0@gregkh>
References: <20260623101043.748359-1-ben.dooks@codethink.co.uk>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623101043.748359-1-ben.dooks@codethink.co.uk>

On Tue, Jun 23, 2026 at 11:10:43AM +0100, Ben Dooks wrote:
> The dwc3_imx_glue_ops is not used outside this file, and technically this
> is the dwc3-imx8mp driver so whilst making this static to avoid the
> following warning, rename it dwc3_imx8mp_glue_ops to distinguish it from
> the other driver which also has dwc3_imx_glue_ops.
> 
> Fixes:
> drivers/usb/dwc3/dwc3-imx8mp.c:176:22: warning: symbol 'dwc3_imx_glue_ops' was not declared. Should it be static?
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  drivers/usb/dwc3/dwc3-imx8mp.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
> index 1cf96540b66e..de8c17bc940d 100644
> --- a/drivers/usb/dwc3/dwc3-imx8mp.c
> +++ b/drivers/usb/dwc3/dwc3-imx8mp.c
> @@ -158,7 +158,7 @@ static irqreturn_t dwc3_imx8mp_interrupt(int irq, void *_dwc3_imx)
>  	return IRQ_HANDLED;
>  }
>  
> -static void dwc3_imx_pre_set_role(struct dwc3 *dwc, enum usb_role role)
> +static void dwc3_imx8mp_pre_set_role(struct dwc3 *dwc, enum usb_role role)
>  {
>  	if (role == USB_ROLE_HOST)
>  		/*
> @@ -173,8 +173,8 @@ static void dwc3_imx_pre_set_role(struct dwc3 *dwc, enum usb_role role)
>  		pm_runtime_use_autosuspend(dwc->dev);
>  }
>  
> -struct dwc3_glue_ops dwc3_imx_glue_ops = {
> -	.pre_set_role   = dwc3_imx_pre_set_role,
> +static struct dwc3_glue_ops dwc3_imx8mp_glue_ops = {
> +	.pre_set_role   = dwc3_imx8mp_pre_set_role,
>  };
>  
>  static int dwc3_imx8mp_probe(struct platform_device *pdev)
> @@ -266,7 +266,7 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
>  		goto put_dwc3;
>  	}
>  
> -	dwc3->glue_ops = &dwc3_imx_glue_ops;
> +	dwc3->glue_ops = &dwc3_imx8mp_glue_ops;
>  
>  	if (dwc3->dr_mode == USB_DR_MODE_HOST)
>  		pm_runtime_dont_use_autosuspend(dwc3->dev);
> -- 
> 2.37.2.352.g3c44437643
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
