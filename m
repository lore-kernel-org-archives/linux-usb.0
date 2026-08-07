Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C693EEACF;
	Fri,  7 Aug 2026 09:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786094409; cv=none; b=bA4YtWFDPfwNW28XviOJrhypZrlncwU4ta8KU44Bq9eGABJiA1zK5gLvb7Ssm+lX9Pj9sWgRlFCv/wU2vfFdqFkq1D6V5KenCpn5qjnnW54uVTRiHahW9093/bZSG1LxYD5qYh9aWFvosllpdIgvdZ5b9tZiXT78yYcJ+P6OaNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786094409; c=relaxed/simple;
	bh=O91JWC+AuH/DhUitk+WcZ+EvGSEJ0balaNqhRKwR9ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQwg/HwWffcoU/SdGrOY164XlK2sTn69FSEsN9tfIFxcCRxqIm9WHsTPLcsHHTSf1mx/z6ijxDNzgaeCoKVksCxGnNaONqzYZShTr97AwZmnHJTIDA/lYAtXcM5E1t6bm2Z+7NGAyBxlFmzWKXlQP5I0Qy8iNQExhSdkQAG16SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gTYw9Jw4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gTYw9Jw4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C201F000E9;
	Fri,  7 Aug 2026 09:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786094407;
	bh=E7ec1MAaLSrg+5NsLC9YQbEha+OGHi2z9xOVUn2F/yk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gTYw9Jw4rKUnWD8c1POQJDK2AIK1dgg8xDhsdQ4rnYjZ0a8y+8TBZ2vc8zxtSGEMs
	 zJQqqsKQ4sOgs73d1uIg3YNt5wXuhH6HsJHY61kNulPYCxZD7LwdO37X99F5ot+CdT
	 jo3esRV0BgDoSrTwdHVyVOPeqDH8K17XzCJVEAdmkzyJ4XkFg1bbG5SNEOtGtvUZyL
	 sM9Q79qFPKy2+4YlR9owU27d3Z43Um5WyxKxEeyFtG26zQrlP867a6A6bdKO+Xae3x
	 XY7rN9QIYQ7ZkoHiiHSu1I6mzl9/sU+9zweiRZxVhIrvZY1mBejBZevZeiInkWV+SH
	 hitxayXYEy/nQ==
Date: Fri, 7 Aug 2026 02:20:05 -0700
From: Peter Chen <peter.chen@kernel.org>
To: phucduc.bui@gmail.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-usb@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sashiko Bot <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2 2/2] usb: chipidea: ci_hdrc_imx: Fix error handling
 when creating IRQ name
Message-ID: <anWjRa2YlEKT_uJq@hu-petche-lv.qualcomm.com>
References: <20260807065619.30604-1-phucduc.bui@gmail.com>
 <20260807065619.30604-2-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807065619.30604-2-phucduc.bui@gmail.com>

On 26-08-07 13:56:19, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> devm_kasprintf() can fail when allocating the wakeup IRQ name. The error
> was logged with dev_err_probe(), but its return value was ignored and
> probe could continue with a successful return value.
> 
> Store the error returned by dev_err_probe() in ret and jump to the error
> path to propagate the failure.
> 
> Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/all/20260806065755.C9F361F000E9@smtp.kernel.org/
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
> 
>  drivers/usb/chipidea/ci_hdrc_imx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index 7387c9903e80..ec2280ae82dc 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -532,7 +532,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  	if (data->wakeup_irq > 0) {
>  		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
>  		if (!irq_name) {
> -			dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
> +			ret = dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
>  			goto err_clk;
>  		}
>  
> -- 
> 2.43.0
> 

-- 

Thanks,
Peter Chen
