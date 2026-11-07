Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794035677;
	b=OjJ5pdefyzKs+saS/HIR5VNEWO3tfxVOykEQlzfJ+CQvZRCGwt18OoBjwHAeHbkK/K/Z
	 ATQlsQ1XuC2q9SvtADucoymQ7raR2XcMCBGt1l2eNzfTWeZINqExLy1gGwCyWeooL3x4S
	 XDHfBCaGQeEfVgHYDe/33TSbCmChdsXMg2kzCaUu3+SjTv8Bs6Dcd5fVkZIfdCSBcAHMK
	 NIm0UPSQKtdOmTgB1WItoFz1byX/zrlogwN7BF+IDNbOgPQkZwcGfCy6j92sTv/YKEJYd
	 kB0TmfH+UIRSCmqK7LaOee9IKzUBNOwNGdcXbzWz4NH4JU8lzQNYt1WkdXI1wTtjcUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794035677;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yGe3uJKpsbXERZgQzVc8DMOOEVnU8/x6IKSomALBvEs=;
	b=SHKi55ZWOMEoj47B+g0JvS3Qhzd+bqGzrxvSuMbu0FTjKp+dsHzz+UHLEtID6mfEwimG
	 5xd6TnwWn42ZxY/slXjwZ+gxmreSMrDHYQcrz1AXr7MDBJRs5pXUYJBOwEkIPS/cZK3zy
	 Wap2tZzFVPYPjvnPYE9iwPF4Wo9P34sXhzefehMObVy0wDpuSCXEoqoa9jBggBNFDBYnQ
	 jh4d01631BnhV5Lilzqlt0Fa4OW0nugrXThYWlGDPBwQZ8SiY31NR7zYJUHehmYguRXmL
	 cOqGf8POqsak2ffqlSZTalUwMQFgP1Hzkayy5VURhPOcg1zMMNG9KziB2GGodAXV3ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dK74L1fD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB26606A32D
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 07:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dK74L1fD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B8B31F008A1;
	Sat,  7 Nov 2026 07:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794035677;
	bh=yGe3uJKpsbXERZgQzVc8DMOOEVnU8/x6IKSomALBvEs=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=dK74L1fDx5Yi9ci/VFeFZQmxZfIYjrKaV/qF06WMc8vvh9E+Y3QoZajf8muU9qFiN
	 NVCGiOr9b2oMk2gfbryK4yd6nvyEVd28zv82JOG5rQWfJo+FKKNM3pCmDmYADddU82
	 UTQtTHy9+RvZvuDC66bXsMjDeoHK2YOwAXlpF6WdpPUyrRN807vjoEpkml183Dl+b6
	 NGl5XwUDn3eVUF6l2NTnJeHqttwz9S0mabilC7oQbRaS3C0V2+/yiiOp+0OeYIbiM/
	 199Gfb5froxIOerCKtPi5eYi3TR47CDb0lHKGUqMTXir6HxFrvxTAyNk72MeNy3/we
	 qLi7vVneTghaA==
Message-ID: <sashiko-outbox-202681@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: gadget: pch_udc: drain vbus GPIO works before
 freeing the device
Reply-To: sashiko-reviews@lists.linux.dev
To: hyunjungg <hj351016@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261107070258.3413402-1-hj351016@gmail.com>
References: <20261107070258.3413402-1-hj351016@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 07:14:36 +0000
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
- [Medium] usb: gadget: pch_udc: irq_work_fall drained before UDC IRQ is
  stopped
--

commit e559e91d2c5a51fa2b3d43db5cbba0eb72f1363b
Author: Hyunjung Ko <hj351016@gmail.com>

usb: gadget: pch_udc: drain vbus GPIO works before freeing the device

This commit calls cancel_work_sync() on irq_work_rise and irq_work_fall in
pch_vbus_gpio_free() to stop pending VBUS GPIO work items on teardown.

> diff --git a/drivers/usb/gadget/udc/pch_udc.c b/drivers/usb/gadget/udc/pc=
h_udc.c
> index 99b3ce28210f9..5351bd9316376 100644
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

[Severity: Medium]
Can pch_udc_dev_isr() re-arm irq_work_fall after cancel_work_sync() returns?

When dev->vbus_gpio.intr is 0, irq_work_fall is queued from the PCI device
interrupt handler pch_udc_isr() -> pch_udc_dev_isr() on UDC_DEVINT_US.
Unlike the GPIO interrupt, which free_irq() stops before cancel_work_sync()
runs, pch_udc_remove() calls pch_vbus_gpio_free() before pch_udc_exit()
masks UDC device interrupts, and pdev->irq is only freed by devres after
pch_udc_remove() returns:

CPU0                              CPU1
pch_udc_remove()
  usb_del_gadget_udc()
    pch_udc_stop()
                                  pch_udc_isr()
                                    pch_udc_dev_isr()
                                      spin_unlock(&dev->lock)
                                      dev->driver->suspend(...)
  pch_vbus_gpio_free()
    cancel_work_sync(
      &dev->vbus_gpio.irq_work_fall)
                                      spin_lock(&dev->lock)
                                      schedule_work(
                                        &dev->vbus_gpio.irq_work_fall)
  pch_udc_exit()
  /* devres frees dev */
                                  pch_vbus_gpio_work_fall()
                                    vbus =3D pch_vbus_gpio_get_value(dev)
                                      <-- use-after-free

Even if pch_udc_stop() masked UDC_DEVINT_MSK earlier, it does not take
dev->lock or call synchronize_irq(dev->pdev->irq), so an in-flight
pch_udc_dev_isr() or a UDC interrupt unmasked while no gadget driver was
bound can still schedule irq_work_fall after pch_vbus_gpio_free() finishes.

Also, the commit message describes the teardown call chain as
pch_udc_remove() -> pch_udc_exit() -> pch_vbus_gpio_free(), whereas
pch_udc_remove() calls pch_vbus_gpio_free() before pch_udc_exit().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107070258.3413=
402-1-hj351016@gmail.com?part=3D1
