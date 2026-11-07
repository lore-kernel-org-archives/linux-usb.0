Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794037228;
	b=afJwkqJqgH/49jElYNwb72OMYhcC4pTwsVDIrteGbQiwJf5howkGkhs7MhQLDMcbaTbh
	 fkbLZ8em+rhnOThDNf9E+elOO1x7FUBYLoYGd3cjdBVkoKbADYoWgCoufQXYo/m0Xkato
	 tt6wyiHvmelq/QS6FCyv/EO2WDR93Kdf2ivy7SJbB5RV9JKP33pI6fwBIITQKfWlpPyfU
	 ZRR9C+YhKmTcDaB6pEoduhNH0HBFCKpykeHJFm2VDopGJ00hNNE1l9kepFHcgOYNUvJ+R
	 CVkHw6EBLIyrDbYz5QqePLlioSeR1xUQR0Q65rclF8bFqJh2RrfA18zXz8b4YeR+HzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794037228;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SxDEgCfFZYz/5AzLVtmbvCzkGpqWE8DnXtMrMLDq2Qo=;
	b=umcOjyDRO1l5bINQMRVMtLSGDbfploF/qoPuC+xbimSL0YYFa1g8yjt5CiqNzBfKzpWX
	 dhteMH5i4ho7/o7Cs3rpv0K3cEDe1cCCRulKcLKGM2JcP0SiEeNtsGjQRxvjALXxzW6eN
	 VhmXs06GGlKCZAHRxxAtUB5R9YuCpxXojDb6b6Pb3hh9xIsxsYTIfa7x0/Kw7BKRb0hh4
	 q5tzEm/49UaBOjGpWadUOly0RepKPJ/qviznZIhdzkz2Z31rAqShN/ZGQacIKmnJYVBWt
	 9KMC1HbP7yjakUe/FAP6scy8iiv8CYMV50W3iPUbB6mU+Ufr2JLLgmbEkEiqRIVJrOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="POv/y8O6";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9726C606A326
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 07:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=POv/y8O6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 244E71F0089F;
	Sat,  7 Nov 2026 07:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794037227;
	bh=SxDEgCfFZYz/5AzLVtmbvCzkGpqWE8DnXtMrMLDq2Qo=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=POv/y8O6gV08O5IFacdkQCKIwZQ18gfrRkWsaXWKxReufcKbo0tRREC2aZNtZe+pX
	 nB60WSZYDmDCvF/sHdX9eOvaOSKW5qQ15K4hv+vbEJ5vXlGA/vw8ZMlEkrJxDjtIBQ
	 /5ty/0RLfq74AJNKAIuRjXldXhUlVMg7u39W4huQ9bXDR+gfxpjlttEDWt9Y2IhGzr
	 1MS3SD94pXXV0w2wHg3JDuFKOMX3ONn7bVvqLhPUs9j7bOHQ4DSVCayUKJMQDirRqz
	 fkwXkA1d9mlj9Y+liTvbnKjTi5lprJ3L+0OP0uInn6hnY4dWmSurrmxVUO4q1AC2TF
	 RoAidTuaBbzNA==
Message-ID: <sashiko-outbox-202721@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] usb: gadget: pch_udc: drain vbus GPIO works before
 freeing the device
Reply-To: sashiko-reviews@lists.linux.dev
To: hyunjungg <hj351016@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261107072501.3434465-1-hj351016@gmail.com>
References: <20261107072501.3434465-1-hj351016@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 07:40:26 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] usb: gadget: pch_udc: draining VBUS works after
  pch_udc_exit() reconnects UDC
--

commit bc23ff65679fc10c4adf2dee6fb5da7b1af32d41
Author: Hyunjung Ko <hj351016@gmail.com>

usb: gadget: pch_udc: drain vbus GPIO works before freeing the device

This commit masks UDC device interrupts, synchronizes the PCI interrupt,
and cancels the VBUS GPIO work items during device removal before devres
frees the device structure.

> diff --git a/drivers/usb/gadget/udc/pch_udc.c b/drivers/usb/gadget/udc/pc=
h_udc.c
> index 99b3ce28210f9..a22bf91e0bfc4 100644
> --- a/drivers/usb/gadget/udc/pch_udc.c
> +++ b/drivers/usb/gadget/udc/pch_udc.c
> @@ -1406,8 +1406,12 @@ static int pch_vbus_gpio_init(struct pch_udc_dev *=
dev)
>   */
>  static void pch_vbus_gpio_free(struct pch_udc_dev *dev)
>  {
> -	if (dev->vbus_gpio.intr)
> +	if (dev->vbus_gpio.intr) {
>  		free_irq(dev->vbus_gpio.intr, dev);
> +		cancel_work_sync(&dev->vbus_gpio.irq_work_rise);
> +	}
> +	if (dev->vbus_gpio.port)
> +		cancel_work_sync(&dev->vbus_gpio.irq_work_fall);
>  }
> =20
>  /**
> @@ -3010,9 +3014,17 @@ static void pch_udc_remove(struct pci_dev *pdev)
>  		dma_unmap_single(&dev->pdev->dev, dev->dma_addr,
>  				 UDC_EP0OUT_BUFF_SIZE * 4, DMA_FROM_DEVICE);
> =20
> -	pch_vbus_gpio_free(dev);
> -
> +	/*
> +	 * irq_work_fall can be queued from pch_udc_dev_isr() (UDC_DEVINT_US)
> +	 * when no VBUS GPIO interrupt is in use, and the PCI interrupt is only
> +	 * released by devres after this function returns. Mask the UDC device
> +	 * interrupts and wait for any in-flight handler before draining the
> +	 * VBUS GPIO works, so the interrupt can no longer re-queue them.
> +	 */
>  	pch_udc_exit(dev);
> +	synchronize_irq(dev->pdev->irq);
> +
> +	pch_vbus_gpio_free(dev);
>  }

[Severity: Medium]
Can an in-flight VBUS work undo pch_udc_exit(dev) while
pch_vbus_gpio_free() waits for it?

Both pch_vbus_gpio_work_rise() and pch_vbus_gpio_work_fall() call
pch_udc_reconnect(dev), which soft-resets the controller, clears
UDC_DEVCTL_SD, and unmasks UDC_DEVINT_UR | UDC_DEVINT_ENUM:

drivers/usb/gadget/udc/pch_udc.c:pch_udc_reconnect() {
	pch_udc_init(dev);

	/* enable device interrupts */
	/* pch_udc_enable_interrupts() */
	pch_udc_bit_clr(dev, UDC_DEVIRQMSK_ADDR,
			UDC_DEVINT_UR | UDC_DEVINT_ENUM);

	/* Clear the disconnect */
	pch_udc_bit_set(dev, UDC_DEVCTL_ADDR, UDC_DEVCTL_RES);
	pch_udc_bit_clr(dev, UDC_DEVCTL_ADDR, UDC_DEVCTL_SD);
...
}

If either work is already running (or queued by pch_vbus_gpio_irq() before
free_irq()) when pch_udc_remove() moves pch_udc_exit() ahead of
pch_vbus_gpio_free(), the controller is re-enabled and left connected while
dev->pdev->irq is still active:

CPU0                                  kworker
pch_udc_remove()
  dma_pool_destroy(dev->stp_requests)
  pch_udc_exit(dev)
  synchronize_irq(dev->pdev->irq)
  pch_vbus_gpio_free(dev)
    cancel_work_sync(...)
                                      pch_vbus_gpio_work_rise()
                                        pch_udc_reconnect(dev)
  /* UDC left connected with UDC_DEVINT_ENUM unmasked */
  <hardirq>
  pch_udc_isr()
    pch_udc_dev_isr()
      pch_udc_svc_enum_interrupt()
        pch_udc_activate_control_ep()
          *dev->ep[...].td_stp =3D ...  <-- use-after-free

pch_udc_svc_enum_interrupt() also unmasks UDC_DEVINT_US again, allowing
pch_udc_dev_isr() to re-queue irq_work_fall after cancel_work_sync() has
returned.  Calling pch_udc_exit(dev) and synchronize_irq(dev->pdev->irq)
before dma_pool_destroy() and again after pch_vbus_gpio_free(dev) would
ensure the hardware stays masked and disconnected.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107072501.3434=
465-1-hj351016@gmail.com?part=3D1
