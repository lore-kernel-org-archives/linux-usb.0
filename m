Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D830C2853E0;
	Fri,  7 Aug 2026 09:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786094164; cv=none; b=hnFWrKNeAEHmWiFPOsXoJF9HPl/r8f+dEk5XfEM8cgpOd42A7Kfoz8DmB269MAtVMeK65X85nzVImAXRDK37ThpAAdS6iQZzLkq78HeJCAoN59Y93T3QmI2u/lvFo9axgnd92oD1QxZUIL3dy+tns5L+3ZdCoe0RcgUKkmuTjIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786094164; c=relaxed/simple;
	bh=mOrjxtcMUBhioDVa/xOG8fHd/y+yTOxdqxILrWkzWAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fG7ZuJ8yqtt0W8T+Z5HwVqwwEfPs+erJLrg7RSlNxek1VmIzdE/oUlWBfIDhH0pHF3SgkhFtpLRCjpzD2yNVKkg6iz749KkAxpDm/tm049flhfzzULwSd06QyNZDX1rYvNhGOWP73LtHawdsaSkNhJ9fBlcm2UCdcff2FcPg/mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gM5wq9yW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gM5wq9yW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEB321F000E9;
	Fri,  7 Aug 2026 09:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786094163;
	bh=Pg7DvMb2fYV//fTe62LkGLuRK+/Lp0wcIpkZuHVszkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gM5wq9yWQnAPYYXGTkmekit2Yfec+NkF8DmQj6QFqzcblr37D3WrOCL3ei5NX6wfn
	 /rW7Fby2QyJyna0LBd4cS+oANqbA4UcnfXGFfDiKStL3D3A20ZFpzUCE/SDk5VtK0c
	 IQn17ohFJiURPhGGd9uzfsjrejL8lYQH4VZFY8KGE4h+MoumPUa07CPASIG87MPKSb
	 lIiCbyhPzTtNKHbPOstoUanJyJY+GYlNKSdU4w+4fpvPbKkfYkyGqQxPVVmkgIzI9i
	 aM1Dn4pJ8vkpzCIs1nPNn4BWulN2lcD4eZTfk+NpTYVMM+Q7IaYveK8UZbNx5UZIiu
	 gJYLFNiR3Mq2g==
Date: Fri, 7 Aug 2026 02:16:01 -0700
From: Peter Chen <peter.chen@kernel.org>
To: phucduc.bui@gmail.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-usb@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] usb: chipidea: ci_hdrc_imx: Propagate errors from
 optional IRQ lookup
Message-ID: <anWiUSPx8t-23mJx@hu-petche-lv.qualcomm.com>
References: <20260807065619.30604-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807065619.30604-1-phucduc.bui@gmail.com>

On 26-08-07 13:56:18, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no IRQ is available, while other errors should be propagated.
> 
> Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
> probe without the IRQ.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
> 
> Link v1:
> https://lore.kernel.org/all/20260806065254.28204-1-phucduc.bui@gmail.com/
> Changes in v2:
>  - Update the commit message and error handling.
>  - Propagate all errors from platform_get_irq_optional() except -ENXIO,
>    instead of only handling -EPROBE_DEFER.
> 
>  drivers/usb/chipidea/ci_hdrc_imx.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index 56d2ba824a0b..7387c9903e80 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -525,6 +525,10 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  		data->supports_runtime_pm = true;
>  
>  	data->wakeup_irq = platform_get_irq_optional(pdev, 1);
> +	if (data->wakeup_irq < 0 && data->wakeup_irq != -ENXIO) {
> +		ret = data->wakeup_irq;
> +		goto err_clk;
> +	}
>  	if (data->wakeup_irq > 0) {
>  		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
>  		if (!irq_name) {
> -- 
> 2.43.0
> 

-- 

Thanks,
Peter Chen
