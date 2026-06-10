Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F62E3E7151;
	Wed, 10 Jun 2026 11:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781091953; cv=none; b=fBwYSkEQLT2Iu4BVFkRJ1x1LbrZnM2nJtQBYDlIKI74E73h1xMXu6Pa2UVe6u5pCEX+/A7UASToLgMjUCkVa9aMsmcwjVpN2PplfK0HHyrPlHtAdQX/FZO2lZtBGCHY0hSKerH25rczQLZ6HYLBYRn/J4datLuXYXSgtE8ufVLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781091953; c=relaxed/simple;
	bh=hrFEQFxV2drVZq8X1bx19U54B5LI3mqfRG9KbtBs7i4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jUF9wsyX7soHSXa1UHH40hDvkI8OA0OcUfsMdaVAs98BGxmbbl0jm5KXSBmcNPbszeo6UIbvtlyeiAaot2wEWAI72Hf1G4eyJdRya0YH/RyNyWdJC78nbdWC1zas+QppJJk805mUJ5rEOX+lYIFo0AxD3ZhLVM4SB0Dg5zrjF0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=SBng9vAF; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="SBng9vAF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1781091947;
	bh=x06EGkAQraU+3g7/QufOyAMDQPgvhh3FNld33Xss7GI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=SBng9vAFXA745uxhIHrClOk55WICJFXkW6PO4pR5skEcxvS9cTQinyWUKmpDweK5F
	 oUlxG+kXGqnQmGCADLDvvGpDc/7F4hxQrXiiOw7I2DbBa3+fl0UzCvW/yfRmATF8ID
	 +c0PR9l/fX6KBatMXetfTiYrIwHAVN3mF+KhlnjrlSf06kqs9XEbkFSmFVHgS5mFOP
	 vnpVN6+Dg0Qvhn8EB23kB721IjbXdazhQ2rrTqU/SsWhRcfJQINd2Lvqd0kYhD5PRx
	 bHR5mi6vyvIaP1Eikb4SlBm9/x++dN5Ej8V7hYk7rv2ifV1cv3JeYBcM3rfuacYerA
	 jy4z2R72fzf3Q==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8EF8760A14;
	Wed, 10 Jun 2026 19:45:46 +0800 (AWST)
Message-ID: <9f2caf9887177bad39525a6713325c252ad47dcb.camel@codeconstruct.com.au>
Subject: Re: [PATCH] usb: gadget: aspeed_udc: check endpoint DMA allocation
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ruoyu Wang <ruoyuw560@gmail.com>, Neal Liu <neal_liu@aspeedtech.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 10 Jun 2026 21:15:46 +0930
In-Reply-To: <20260608081948.3-1-ruoyuw560@gmail.com>
References: <20260608081948.3-1-ruoyuw560@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-06-08 at 16:19 +0800, Ruoyu Wang wrote:
> ast_udc_probe() allocates a coherent DMA buffer used as the backing store
> for endpoint buffers. ast_udc_init_ep() derives per-endpoint buffer
> pointers from udc->ep0_buf, so a failed allocation is dereferenced during
> probe.
>=20
> Check the allocation before endpoint setup. The existing probe error path
> called ast_udc_remove(), which unregisters the gadget unconditionally and
> is not safe before usb_add_gadget_udc() succeeds. Add a local cleanup
> helper for probe failures so pre-registration failures only unwind the
> resources that were actually initialized.
>=20
> This was found by a local static analysis checker for unchecked allocator
> returns while scanning Linux 6.16. The change was checked by applying it
> to current mainline and by running checkpatch. I do not have access to
> Aspeed UDC hardware, so no runtime testing was performed.
>=20
> Fixes: 055276c13205 ("usb: gadget: add Aspeed ast2600 udc driver")
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
> ---
> Note: a 2022 patch attempted to add only a NULL check for this
> allocation:
> https://lore.kernel.org/all/20221213025120.23149-1-jiasheng@iscas.ac.cn/
>=20
> This version also fixes the probe unwind path so the clock is disabled
> on allocation failure and usb_del_gadget_udc() is not called before the
> gadget has been registered.
>=20
> diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc=
/aspeed_udc.c
> index 7fc6696b7..809a7d5b7 100644
> --- a/drivers/usb/gadget/udc/aspeed_udc.c
> +++ b/drivers/usb/gadget/udc/aspeed_udc.c
> @@ -1434,11 +1434,34 @@ static void ast_udc_init_hw(struct ast_udc_dev *u=
dc)
> =C2=A0	ast_udc_write(udc, 0, AST_UDC_EP0_CTRL);
> =C2=A0}
> =C2=A0
> +static void ast_udc_cleanup(struct platform_device *pdev)
> +{
> +	struct ast_udc_dev *udc =3D platform_get_drvdata(pdev);
> +	unsigned long flags;
> +	u32 ctrl;
> +
> +	spin_lock_irqsave(&udc->lock, flags);
> +
> +	/* Disable upstream port connection */
> +	ctrl =3D ast_udc_read(udc, AST_UDC_FUNC_CTRL) & ~USB_UPSTREAM_EN;
> +	ast_udc_write(udc, ctrl, AST_UDC_FUNC_CTRL);
> +
> +	clk_disable_unprepare(udc->clk);
> +
> +	spin_unlock_irqrestore(&udc->lock, flags);
> +
> +	if (udc->ep0_buf)
> +		dma_free_coherent(&pdev->dev,
> +				=C2=A0 AST_UDC_EP_DMA_SIZE * AST_UDC_NUM_ENDPOINTS,
> +				=C2=A0 udc->ep0_buf,
> +				=C2=A0 udc->ep0_buf_dma);
> +
> +	udc->ep0_buf =3D NULL;
> +}
> +
> =C2=A0static void ast_udc_remove(struct platform_device *pdev)
> =C2=A0{
> =C2=A0	struct ast_udc_dev *udc =3D platform_get_drvdata(pdev);
> -	unsigned long flags;
> -	u32 ctrl;
> =C2=A0
> =C2=A0	usb_del_gadget_udc(&udc->gadget);
> =C2=A0	if (udc->driver) {
> @@ -1453,23 +1476,7 @@ static void ast_udc_remove(struct platform_device =
*pdev)
> =C2=A0		return;
> =C2=A0	}
> =C2=A0
> -	spin_lock_irqsave(&udc->lock, flags);
> -
> -	/* Disable upstream port connection */
> -	ctrl =3D ast_udc_read(udc, AST_UDC_FUNC_CTRL) & ~USB_UPSTREAM_EN;
> -	ast_udc_write(udc, ctrl, AST_UDC_FUNC_CTRL);
> -
> -	clk_disable_unprepare(udc->clk);
> -
> -	spin_unlock_irqrestore(&udc->lock, flags);
> -
> -	if (udc->ep0_buf)
> -		dma_free_coherent(&pdev->dev,
> -				=C2=A0 AST_UDC_EP_DMA_SIZE * AST_UDC_NUM_ENDPOINTS,
> -				=C2=A0 udc->ep0_buf,
> -				=C2=A0 udc->ep0_buf_dma);
> -
> -	udc->ep0_buf =3D NULL;
> +	ast_udc_cleanup(pdev);
> =C2=A0}
> =C2=A0
> =C2=A0static int ast_udc_probe(struct platform_device *pdev)
> @@ -1523,6 +1530,10 @@ static int ast_udc_probe(struct platform_device *p=
dev)
> =C2=A0					=C2=A0 AST_UDC_EP_DMA_SIZE *
> =C2=A0					=C2=A0 AST_UDC_NUM_ENDPOINTS,
> =C2=A0					=C2=A0 &udc->ep0_buf_dma, GFP_KERNEL);
> +	if (!udc->ep0_buf) {
> +		rc =3D -ENOMEM;
> +		goto err_disable_clk;
> +	}
> =C2=A0
> =C2=A0	udc->gadget.speed =3D USB_SPEED_UNKNOWN;
> =C2=A0	udc->gadget.max_speed =3D USB_SPEED_HIGH;
> @@ -1553,20 +1564,20 @@ static int ast_udc_probe(struct platform_device *=
pdev)
> =C2=A0	udc->irq =3D platform_get_irq(pdev, 0);
> =C2=A0	if (udc->irq < 0) {
> =C2=A0		rc =3D udc->irq;
> -		goto err;
> +		goto err_cleanup;
> =C2=A0	}
> =C2=A0
> =C2=A0	rc =3D devm_request_irq(&pdev->dev, udc->irq, ast_udc_isr, 0,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 KBUILD_MODNAME, udc);
> =C2=A0	if (rc) {
> =C2=A0		dev_err(&pdev->dev, "Failed to request interrupt\n");
> -		goto err;
> +		goto err_cleanup;
> =C2=A0	}
> =C2=A0
> =C2=A0	rc =3D usb_add_gadget_udc(&pdev->dev, &udc->gadget);
> =C2=A0	if (rc) {
> =C2=A0		dev_err(&pdev->dev, "Failed to add gadget udc\n");
> -		goto err;
> +		goto err_cleanup;
> =C2=A0	}
> =C2=A0
> =C2=A0	dev_info(&pdev->dev, "Initialized udc in USB%s mode\n",
> @@ -1574,9 +1585,14 @@ static int ast_udc_probe(struct platform_device *p=
dev)
> =C2=A0
> =C2=A0	return 0;
> =C2=A0
> +err_disable_clk:
> +	clk_disable_unprepare(udc->clk);
> +	goto err;
> +err_cleanup:
> +	ast_udc_cleanup(pdev);
> +	goto err;
> =C2=A0err:

That last goto is unnecessary.

However, I find it unsettling that in a patch fixing resource handling
we add a mildly convoluted cleanup path, with portions jumping over
each other in this way.

The err_disable_clk label is only used once, and itself jumps down to
the err label. This is the case because beyond its goto we free udc-
>ep0_buf in ast_udc_cleanup(). I think it would make more sense to move
the call to clk_disable_unprepare() into the conditional body of the
allocation failure test, then change its goto label to 'err'. That way
the above hunk becomes:

   +err_cleanup:
   +    ast_udc_cleanup(pdev);
    err:
        ...

Which seems a bit more natural.

Andrew

> =C2=A0	dev_err(&pdev->dev, "Failed to udc probe, rc:0x%x\n", rc);
> -	ast_udc_remove(pdev);
> =C2=A0
> =C2=A0	return rc;
> =C2=A0}
