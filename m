Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695964;
	b=0CjeeVTIfwoiyqLpsuYDG90TrdLmw6nFroK64jFW0u3bW5tzc4D3xBQnstLrNrNHF4b7
	 U8kFvjTIlsxJJNIQ11Hyv1BgEe9zvXs2Zc1IgwwWh02Xq3zoE2jw9OpsTk/UN3iag4775
	 cio4RBC0gwro6xbwnyjPsJ8nqc4O5Y4yGTld2EhnF9GsYlRsyPe1SWUyBxXlTywJ22adT
	 VewyvhokMBs00gsyPs0fijGU5aj0UPXLrevfOb6bzW6t45LcPZV9ap3rks2w13bdDKlJH
	 6v3E91gf5vW8eti/6CNnMX3xe+S9q3Y10Uat8yul8wJESfecmMxEk87LqlvqNZX+SRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695964;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8NKbxmT5D6+15j3Qh31Z1DulT5MeYuasS69DYVQwT8I=;
	b=FfGIXQpr8BjaWQRbRHGYN41EyRgY9trmgY5dmx7xIG8wwke7PdmRXM/EfjNWuFftXxo2
	 vRqwhKQ3ATn+mUJlhwxx26sGHfZunaqSI4f7iQ990E0fNxv5AxN+A0q2xsqIa6vT+0yfx
	 BwLthEACJSwpq8OZuaE1ImrM9HvJ+kmV+yp413J5U02Qd3op6hQYbKnX900mhKOkqnW43
	 LKrYLLCz1ffflW2EdNqw38G8mHqeCz6JhVi90iViaq6ly71E0laQZV7oxVObY3A+5fdtm
	 tH7TOaVliEF+CHW09ahgQKFYh/CfdGqlIIRnpNgw0Herg7myQgEWSiPkFEFRWGimqNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PvABg98v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C9C606A321
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 12:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PvABg98v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 863D21F000C0;
	Thu, 26 Nov 2026 12:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795695963;
	bh=8NKbxmT5D6+15j3Qh31Z1DulT5MeYuasS69DYVQwT8I=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=PvABg98v/qNi9Xfb9bVRfQ3jZvidckcATA1Ve8YrMiGg6K48GJ48SHzt10EAxkegX
	 hvSPgh6LLTecWMONGW+f7ifwf6y3zBtvRiuvs05frv/0gFyz0cemkibEbVcCgiic+/
	 jJs1DfIjSn7RIQMLe8TLIxB8KP8SUSsjbYtmxrG8qrCa/uX8x+w5sPQRCw3swH9lnC
	 uwzgyn0mHWRPK3V2Kjf/iqvBAnzQQQolJn6tghF/lEhYWNov0aVbsxP+x+6APOdr5J
	 bWDOJYoZoAwgyNHHjVE+xkARqPJmHPqrPMO+K1+ZTQ34jUrMoQULvGcyNY4BjaLtfV
	 4yhXuB6pj+obg==
Message-ID: <sashiko-outbox-235500@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: host: max3421: fix the SPI thread teardown on
 remove
Reply-To: sashiko-reviews@lists.linux.dev
To: shitao <shitao@kylinos.cn>, linux-usb@vger.kernel.org
In-Reply-To: <20261126121148.1021526-1-shitao@kylinos.cn>
References: <20261126121148.1021526-1-shitao@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 12:26:03 +0000
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
- [Medium] usb: host: max3421: free_irq() races with enable_irq() in
  max3421_remove()
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Critical] usb: host: max3421-hcd: missing usb_remove_hcd() in
  max3421_probe() [1]
--

commit 360a9e2d1723c072cf5873c19d8972ab271a893c
Author: shitao <shitao@kylinos.cn>

usb: host: max3421: fix the SPI thread teardown on remove

This commit drops max3421_hcd->lock around kthread_stop() in
max3421_remove() and moves free_irq() ahead of stopping the SPI thread.

> diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-hc=
d.c
> index 11c0d0e1f48d3..e6a447b0992de 100644
> --- a/drivers/usb/host/max3421-hcd.c
> +++ b/drivers/usb/host/max3421-hcd.c
> @@ -1936,21 +1936,16 @@ max3421_remove(struct spi_device *spi)
>  {
>  	struct max3421_hcd *max3421_hcd;
>  	struct usb_hcd *hcd;
> -	unsigned long flags;
> =20
>  	max3421_hcd =3D spi_get_drvdata(spi);
>  	hcd =3D max3421_to_hcd(max3421_hcd);
> =20
>  	usb_remove_hcd(hcd);
> =20
> -	spin_lock_irqsave(&max3421_hcd->lock, flags);
> +	free_irq(spi->irq, hcd);
> =20
>  	kthread_stop(max3421_hcd->spi_thread);
> =20
> -	spin_unlock_irqrestore(&max3421_hcd->lock, flags);
> -
> -	free_irq(spi->irq, hcd);
> -
>  	usb_put_hcd(hcd);
>  }

[Severity: Medium]
Can max3421_spi_thread() still call enable_irq() during or after
free_irq()?

kthread_should_stop() does not become true until kthread_stop() runs after
free_irq(), and max3421_spi_thread() sleeps in spi_wr8() after checking
kthread_should_stop() before testing ENABLE_IRQ:

drivers/usb/host/max3421-hcd.c:max3421_spi_thread() {
	while (!kthread_should_stop()) {
		if (!i_worked) {
			...
			spi_wr8(hcd, MAX3421_REG_HIEN, max3421_hcd->hien);

			set_current_state(TASK_INTERRUPTIBLE);
			if (test_and_clear_bit(ENABLE_IRQ, &max3421_hcd->todo))
				enable_irq(spi->irq);
			schedule();
}

If an interrupt fires shortly before free_irq(), max3421_irq_handler()
disables spi->irq via disable_irq_nosync() and sets ENABLE_IRQ:

CPU0                              max3421_spi_thread
<hardirq>
  max3421_irq_handler()
    set_bit(ENABLE_IRQ, ...)
    disable_irq_nosync(spi->irq)
                                  while (!kthread_should_stop())
                                    spi_wr8(...)
max3421_remove()
  free_irq(spi->irq, hcd)
  kthread_stop(...)
                                    test_and_clear_bit(ENABLE_IRQ, ...)
                                    enable_irq(spi->irq)  <-- already freed

This either calls enable_irq() on an already-freed interrupt or, if the
thread exits the loop while ENABLE_IRQ is still pending, leaves the
disable depth from disable_irq_nosync() unbalanced.

[Severity: Critical]
This problem wasn't introduced by this patch, but in max3421_probe() right
above [1], doesn't a request_irq() failure skip usb_remove_hcd()
after usb_add_hcd() has already succeeded?

drivers/usb/host/max3421-hcd.c:max3421_probe() {
	...
	retval =3D usb_add_hcd(hcd, 0, 0);
	if (retval) {
		dev_err(&spi->dev, "failed to add HCD\n");
		goto error;
	}

	retval =3D request_irq(spi->irq, max3421_irq_handler,
			     IRQF_TRIGGER_LOW, "max3421", hcd);
	if (retval < 0) {
		dev_err(&spi->dev, "failed to request irq %d\n", spi->irq);
		goto error;
	}
	return 0;

error:
	...
	if (hcd) {
		kfree(max3421_hcd->tx);
		kfree(max3421_hcd->rx);
		if (!IS_ERR_OR_NULL(max3421_hcd->spi_thread))
			kthread_stop(max3421_hcd->spi_thread);
		usb_put_hcd(hcd);
	}
	return retval;
}

When request_irq() fails, the error path frees the transfer buffers, stops
spi_thread, and drops the reference with usb_put_hcd() while the HCD
remains registered with the USB core, leading to a use-after-free.

[1] https://sashiko.dev/#/bug/linux-234c6b25-0fde-46c3-828e-2b7e28c04092

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126121148.1021=
526-1-shitao@kylinos.cn?part=3D1
