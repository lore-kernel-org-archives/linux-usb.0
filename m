Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E51B3955E3
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 03:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792294032; cv=none; b=MwJDvIgvXWZq+ZKk8LabnO8+zqot7vfaE5DY54PwfhFDbmPwdWh9o4K14p3HoM/Rsvcy3YePqM3P9XwtLZKNNisdoW1SujOKZo1lm/Q90nQEt3Prx2/og1Yru4k1VBolMxaZ5V60ilyHJ1ysOzbVAzKl40LWE/b5yvPxIkvEKCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792294032; c=relaxed/simple;
	bh=aiQjsP95Bw2HtaURnfx69W56/4iz49Am/pn7AXPE2WE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=L8tRv+Imw6P3S1iR5XsO4q7+bFhn4/ZvddnVS0mujaMXme1S7dvHU/Q1H4Zg2ilakaMb0TCYpYFARzftu5amYCNwPUm2Vd4gVGOtCvVIOpqXLuXh2+mqX/1mCTscUsVYeTVfS2lgIXvszMmU4zjDaBp2QRpuVt+kae98hF/79SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cxJdY9ru; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cxJdY9ru"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50B4C1F000C5;
	Sun, 18 Oct 2026 03:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792294025;
	bh=8c7U8zEIAEtHOpaE03ZXQ9RBNjL9a/8HAA/DugtqfRY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cxJdY9ruyxHb3ztlUnONZqyVD45uGhFPsUefLtxr4GwYh1PKzBV8BkPXbMbFzbEEt
	 GObTsfaQukl0zeUW80Z44joD6V8YA+wj8lLx18LRkk/D/GfvN2CNKRsYex+erjBIDS
	 4gL16gSSkclljvgQ2wDnnmwxDMWybS6zHcJjBS/1rJauTtptVpRwErLb4D6/YU97O/
	 384sKg0ywUewBc7vpufOk4jzQ3JTNVgmUdxCL2NOEW0VjznPx2/0LRLtxa6A3/FL1Q
	 g6ftYnB+/caI9yleOiGDpGozu1Qljc4Fn93abilML8gKg9u7l7J2bSETJM6cTcLKez
	 OK4wOuNjeIxmw==
Message-ID: <sashiko-outbox-175906@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: isp1760: shut down the VBUS timer before
 unregistering the UDC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Myeonghun Pak" <mhun512@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <179229341115.3942822.5484449075463010207.isp1760@gmail.com>
References: <179229341115.3942822.5484449075463010207.isp1760@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 03:27:04 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usb: isp1760: vbus_timer rearming in isp1760_udc_stop() causes NUL=
L deref
--

commit fa23f41e78ec14a6b9fcdbfcc740696149d64aa0
Author: Myeonghun Pak <mhun512@gmail.com>

usb: isp1760: shut down the VBUS timer before unregistering the UDC

This commit adds timer_shutdown_sync() calls for vbus_timer in
isp1760_udc_unregister() and the error path of isp1760_udc_register() to
prevent the timer from remaining pending after the UDC is unregistered.

> diff --git a/drivers/usb/isp1760/isp1760-udc.c b/drivers/usb/isp1760/isp1=
760-udc.c
> index e45a54c4a5609..7b60bd9069bc2 100644
> --- a/drivers/usb/isp1760/isp1760-udc.c
> +++ b/drivers/usb/isp1760/isp1760-udc.c

[ ... ]

> @@ -1593,6 +1594,9 @@ void isp1760_udc_unregister(struct isp1760_device *=
isp)
>  	if (!udc->isp)
>  		return;
> =20
> +	/* The IRQ handler can rearm the timer until free_irq() below. */
> +	timer_shutdown_sync(&udc->vbus_timer);
> +
>  	usb_del_gadget_udc(&udc->gadget);
> =20
>  	free_irq(udc->irq, udc);

[Severity: High]
What happens if the same race in isp1760_udc_stop() occurs when a gadget
driver is unbound or disconnected via sysfs without unregistering the UDC?

In drivers/usb/isp1760/isp1760-udc.c, isp1760_udc_stop() remains unchanged:

	timer_delete_sync(&udc->vbus_timer);

	isp1760_reg_write(udc->regs, mode_reg, 0);

	spin_lock_irqsave(&udc->lock, flags);
	udc->driver =3D NULL;
	spin_unlock_irqrestore(&udc->lock, flags);

When isp1760_udc_stop() is called without isp1760_udc_unregister() (for
example via gadget_unbind_driver() or soft_connect_store()), vbus_timer is
not shut down. If isp1760_udc_irq() handles ISP176x_DC_IEVBUS after
timer_delete_sync() completes, isp1760_udc_connect() runs under udc->lock
without checking udc->driver:

	usb_gadget_set_state(&udc->gadget, USB_STATE_POWERED);
	mod_timer(&udc->vbus_timer, jiffies + ISP1760_VBUS_POLL_INTERVAL);

isp1760_udc_stop() then clears udc->driver =3D NULL and returns while
vbus_timer is still pending.

When vbus_timer fires, isp1760_udc_vbus_poll() calls
isp1760_udc_disconnect() if DC_VBUSSTAT is not set:

	if (!(isp1760_udc_is_set(udc, DC_VBUSSTAT)))
		isp1760_udc_disconnect(udc);

And isp1760_udc_disconnect() dereferences udc->driver without checking for
NULL because udc->gadget.state was set back to USB_STATE_POWERED:

	if (udc->driver->disconnect)
		udc->driver->disconnect(&udc->gadget);

Could this trigger a NULL pointer dereference of udc->driver in softirq
timer context? Should isp1760_udc_stop() also prevent isp1760_udc_irq()
from rearming vbus_timer (or cancel the timer after disabling interrupts
and clearing udc->driver)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179229341115.394282=
2.5484449075463010207.isp1760@gmail.com?part=3D1
