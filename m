Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794034182;
	b=fY99lGwgXxEBQjYx9G0N/0clZf0p/DhMTsXb/bavX2x2gQQ7NTRqJM/XDV0UxJlltzcs
	 qraZdzr3kAraKiXpsMH4kSOlc9wJ7+FCGfS32acKtbZoLXi4XJMl/9VIZ8CQwAz0B+5YO
	 udnVzguqHdyTdCHcZ7f/b93OSX6GS+o4zXz2NhHrtgsIKqB89DfWaaTEBLCgIo3t1bMj5
	 xO0f3S1utJ8xcfKxaA0XWnG4Rv7Q83tTZoT8E7Ik8+xwvmpBqVlqm/9BPSRNfaImrEbNf
	 jbnwGUhxl4SvUhXrbZaLVYEUuQX2eYB2xWjN5x06R5dOip+w9rlO2koGI7zz6KS28Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794034182;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CC+YJ0i5z5WPwHUcB6RlvP/vImk5DVZRxkDGkbwwvcY=;
	b=htEyTveBAwuSZbkGZBDVabi6lfPhoH6QjSAL1S8go/+RclRXe1rheuzScHLZ0OxmZLXy
	 ozTtwFaTGTxZ3pSp6pXmWMc4Vw+C0E43j5wLfJijlF4uiZXVuzU5ryWYRGHjvn/jMcFZ8
	 iNEuhYCp1Qw5j4xB408Tz1Qaj2E05eqTCpdgVq1R03nO5kcNRqD6864tH0j9gMKhsAESQ
	 4yqZhmt+fOsaNdmsQAp40tt1DghK9CTURvJTCZ2VEB6POMaliKa+0CrlumtIXZcJv2Vrk
	 bJVnMMAkD0aDi27UgTaZAkmrdySb1znrAnNA9dH3RQCW+XALn0fWCaxCzMeQz8fdezg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VEkKU9uS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78245606A32C
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 06:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VEkKU9uS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA33C1F0089F;
	Sat,  7 Nov 2026 06:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794034182;
	bh=CC+YJ0i5z5WPwHUcB6RlvP/vImk5DVZRxkDGkbwwvcY=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=VEkKU9uSDTGqYtohmAV/PxeeQrdS3B7DPKyNIRYTGXP9CbuqPYmBs6qguuLVcykbb
	 meA9Lt5OUgrXdULO+roaZ1sJY+QLxzT2P4t5qm8G0D9LUtME7vrUhlkjo68J04uUmn
	 VI6TtPgJm8Ly+NXxv+witSTJxj5wk7yQzUrjdEr1BkWibKp44YbAdXV5ZB3TgoOxaK
	 k53+AeRLISuGP7DniIFVWX8ZSQCldLkgFIIXXSqbL5A2IvVgwZzJUWdf06B1ha3sXI
	 arsaFmCLBEYTHlRBWpt6FayD9HjrRMWsBQFH+23PwxyyOhwzxI3vqFMvextEKTwtM4
	 wzA6+gvykEVkg==
Message-ID: <sashiko-outbox-202670@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: pch_udc: drain vbus GPIO works before
 freeing the device
Reply-To: sashiko-reviews@lists.linux.dev
To: hyunjungg <hj351016@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261107063652.3387873-1-hj351016@gmail.com>
References: <20261107063652.3387873-1-hj351016@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 06:49:41 +0000
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
- [Medium] usb: gadget: pch_udc: uncancelled irq_work_fall in
  pch_vbus_gpio_free()
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [High] usb: gadget: pch_udc: missing work cancellation in
  pch_udc_shutdown() [1]
--

commit 89d87fae917e9ebb35853723c8f26eea53836dd5
Author: Hyunjung Ko <hj351016@gmail.com>

usb: gadget: pch_udc: drain vbus GPIO works before freeing the device

This commit cancels dev->vbus_gpio.irq_work_fall and irq_work_rise after
free_irq() in pch_vbus_gpio_free() to prevent the VBUS GPIO work handlers
from running after dev is freed on device removal.

> diff --git a/drivers/usb/gadget/udc/pch_udc.c b/drivers/usb/gadget/udc/pc=
h_udc.c
> index 99b3ce28210f9..55310946de292 100644
> --- a/drivers/usb/gadget/udc/pch_udc.c
> +++ b/drivers/usb/gadget/udc/pch_udc.c
> @@ -1406,8 +1406,11 @@ static int pch_vbus_gpio_init(struct pch_udc_dev *=
dev)
>   */
>  static void pch_vbus_gpio_free(struct pch_udc_dev *dev)
>  {
> -	if (dev->vbus_gpio.intr)
> +	if (dev->vbus_gpio.intr) {
>  		free_irq(dev->vbus_gpio.intr, dev);
> +		cancel_work_sync(&dev->vbus_gpio.irq_work_fall);
> +		cancel_work_sync(&dev->vbus_gpio.irq_work_rise);
> +	}
>  }
> =20
>  /**

[Severity: Medium]
Can dev->vbus_gpio.irq_work_fall still be left running when
dev->vbus_gpio.port is present but dev->vbus_gpio.intr is 0?

pch_vbus_gpio_init() initializes irq_work_fall whenever a VBUS GPIO is
obtained, before gpiod_to_irq() and request_irq() set dev->vbus_gpio.intr:

drivers/usb/gadget/udc/pch_udc.c:pch_vbus_gpio_init() {
	...
	dev->vbus_gpio.port =3D gpiod;
	INIT_WORK(&dev->vbus_gpio.irq_work_fall, pch_vbus_gpio_work_fall);

	irq_num =3D gpiod_to_irq(gpiod);
	...
}

When dev->vbus_gpio.intr is 0, pch_udc_dev_isr() schedules irq_work_fall
on a USB suspend interrupt:

drivers/usb/gadget/udc/pch_udc.c:pch_udc_dev_isr() {
	...
		} else if ((dev->vbus_session =3D=3D 0)
			&& (vbus =3D=3D 1)
			&& !dev->vbus_gpio.intr)
			schedule_work(&dev->vbus_gpio.irq_work_fall);
	...
}

If gpiod_to_irq() or request_irq() fails, or if UDC_DEVINT_US fires in
pch_udc_remove() before pch_udc_exit() masks device interrupts,
pch_vbus_gpio_work_fall() can continue polling for up to 3 seconds after
pch_udc_remove() returns and devres frees dev, causing a use-after-free.

[Severity: High]
This problem wasn't introduced by this patch, but can a VBUS GPIO
transition during system shutdown re-initialize the controller after
pch_udc_shutdown() [1]?

pch_udc_shutdown() disables UDC interrupts and disconnects the pullup,
but it does not call pch_vbus_gpio_free() or otherwise disable the VBUS
GPIO interrupt and cancel irq_work_fall and irq_work_rise. If either work
runs during shutdown, pch_vbus_gpio_work_fall() or
pch_vbus_gpio_work_rise() can call pch_udc_init() or pch_udc_reconnect(),
resetting the hardware and re-enabling PCI interrupts across reboot or
kexec.

[1] https://sashiko.dev/#/bug/linux-bb1818ac-db9a-4dc2-af47-62b314381f33

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107063652.3387=
873-1-hj351016@gmail.com?part=3D1
