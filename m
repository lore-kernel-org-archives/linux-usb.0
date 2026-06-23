Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784B130F938
	for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 10:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209249; cv=none; b=QJqzqhtslzfBwe9yXaliMu3AX+aI4B1LVQVm9FKHV25Z5hF9M4E1t2DYMjuL0cGf2dtexCb/+iljhrLYZLEi1NzBlDrJJvDWWMfFegOGjh9gfzuLutIUQBKtLywZo6WDGAk/Y+fTI/1zECng6oXzojmlrAlqBlFxC9ZkRIz9NyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209249; c=relaxed/simple;
	bh=6tQ4RWcIVTFgd+Dixy34Xj/6HGUJ6RpLIoqpiAJpWAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=HRG15P1wQ3zqQnXUcUOzFMpc08Bl6p2UP+wSQb6oiSrLuH+MdJbeCPBfEF57OziAVPp5SaPKGKelQuDeKE51ovWsYK7F4/W5xSXf1K4VDh58LpkyDnSoKw+DsvkklyUQ6eIv34NsrPTJ+kOKfM1Q7c++xtWAs2S+SokpyRogWtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1wby2D-0002tm-Be; Tue, 23 Jun 2026 12:07:13 +0200
Message-ID: <39a5d53d-2eb9-4f72-aca9-95def11edf25@pengutronix.de>
Date: Tue, 23 Jun 2026 12:07:11 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: imx8mp: make dwc3_imx_glue_ops static and
 rename to imx8mp
To: Ben Dooks <ben.dooks@codethink.co.uk>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260623100554.735080-1-ben.dooks@codethink.co.uk>
Content-Language: en-US, de-DE, de-BE
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20260623100554.735080-1-ben.dooks@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org



On 6/23/26 12:05 PM, Ben Dooks wrote:
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
>  drivers/usb/dwc3/dwc3-imx8mp.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
> index 1cf96540b66e..bc61a89b66b1 100644
> --- a/drivers/usb/dwc3/dwc3-imx8mp.c
> +++ b/drivers/usb/dwc3/dwc3-imx8mp.c
> @@ -173,8 +173,8 @@ static void dwc3_imx_pre_set_role(struct dwc3 *dwc, enum usb_role role)
>  		pm_runtime_use_autosuspend(dwc->dev);
>  }
>  
> -struct dwc3_glue_ops dwc3_imx_glue_ops = {
> -	.pre_set_role   = dwc3_imx_pre_set_role,
> +statc struct dwc3_glue_ops dwc3_imx8mp_glue_ops = {

Typo


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

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |

