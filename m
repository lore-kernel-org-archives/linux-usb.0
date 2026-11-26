Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795676562;
	b=ZomqyAEZArz50piCK2QvpZgH5mhe8cCIF6hfgBxQn3dJ6pvxzuKAXrKhkT6uvqgIh2uo
	 TMjep4MX3E8zc2+wW6j9w4wxxk9RxxRZA2BXAnQaoIuq8ByaNcz67oF8NhjsKpZr1DFO7
	 9kvS8x68VFjwv889mvd/0c21rxqNydX2WSrmovjJazEFmtKkk71RRo21Fw27xmsyC9jKp
	 g5ui4rait3K1nNj7vV6IOwwbov+MfZ5BdV83+Of8YWSkVv9CmerMZLuL/XGXT3cd50QOY
	 wXAEaUGFrXv3OgeXB7VFtG6wxtU8zdjR6d83x3AztCz9s7G1d82NOXC1ssqRyH/6e8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795676562;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=83lxcYsqvRybkk6wkM4fRHiAhh/UtLIHJeF3pjnCwZ4=;
	b=Kxinzse6RW1WFjD+GRiuQNTxI+pkxF7iiplorkq84v1Gi83yf/cs2aJayJ+EKYORYi1k
	 MYQat9aWGvcWk6x6bo7oXrlKCOnBDPg0iaMjAz55G5zQvheHwdWqQNUE9UZ/TL9tv9Ouz
	 LNdwQtdaOeme2fNlqboXW1xFVvcLyTZdUq9rxvKVJkOGGZmsnD7IptE27NoKabSuLbgWB
	 bEE7FiDWdb+K2z3406KhvJwxKYYp3QTTy9sbswWpeHHfBFdVpDqflQBN4y/EG6wFWXIrr
	 H5L1UjneGIzPm9TtTJ2S/sV6lBD0jURbZBOir7trhU2fWbmJIozY2FBhkinPTTXYvXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EmELnoJQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDCE606A31C
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 07:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EmELnoJQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BE281F000C4;
	Thu, 26 Nov 2026 07:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795676561;
	bh=83lxcYsqvRybkk6wkM4fRHiAhh/UtLIHJeF3pjnCwZ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EmELnoJQmTMro7Bqq6LJ6+M5laKar7ldtSHK8tisCtKmD4vrtpyAPon1tDtrtyJOi
	 s6BmS5Fo01SE6nhMSbMFJt7mu4g4CKkJcRjIzwEP/G0kHYGL3Br91aHJhNtXzGQqf0
	 80pbksSGlx98eONakPdBHqtMrbq9JRJpWO97w5DpnSZNI0MmbxfsWBmtgQdTbQOc7k
	 gIhvSBN78DSNQI0ADAfKmeOygKzO0AJZl0UxQtZJg5mnMOgJFtXBhJjV+LiXm945Cy
	 aZ4gpa9FK1R50S+s4AVbW82iVcZDjBb8IJ3m45rDBJxhiO7FMhSCQHbo2SlLWYEgTd
	 F/iGnHRNJcYRw==
Message-ID: <sashiko-outbox-234924@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: phy: twl6030: init work before comparator and
 clear comparator on teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmluIEx1byAoVW5pdmVyc2l0eSBvZiBFbGVjdHJvbmljIFNjaWVuY2Ug?=
 =?utf-8?b?YW5kIFRlY2hub2xvZ3kgb2YgQ2hpbmEp?= <luob87709@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261126065139.127-1-luob87709@gmail.com>
References: <20261126065139.127-1-luob87709@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 07:02:40 +0000
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
- [Medium] usb: phy: twl6030: unsynchronized comparator clearing in
  probe and remove
--

commit 7291457bcd76118c22b37c6b874744fe4ac3dc1c
Author: luob87709@gmail.com <luob87709@gmail.com>

usb: phy: twl6030: init work before comparator and clear comparator on tear=
down

This commit initializes twl->lock and work items in twl6030_usb_probe()
before registering &twl->comparator with omap_usb2_set_comparator(), and
clears the comparator on probe failure and in twl6030_usb_remove().

> diff --git a/drivers/usb/phy/phy-twl6030-usb.c b/drivers/usb/phy/phy-twl6=
030-usb.c
> index 9bfcb2c1dfd0e..a9da7aa5f5f14 100644
> --- a/drivers/usb/phy/phy-twl6030-usb.c
> +++ b/drivers/usb/phy/phy-twl6030-usb.c
> @@ -355,26 +355,26 @@ static int twl6030_usb_probe(struct platform_device=
 *pdev)
>  	twl->comparator.set_vbus	=3D twl6030_set_vbus;
>  	twl->comparator.start_srp	=3D twl6030_start_srp;
> =20
> +	/* init spinlock and work items before publishing comparator */
> +	spin_lock_init(&twl->lock);
> +	INIT_WORK(&twl->set_vbus_work, otg_set_vbus_work);
> +	INIT_DELAYED_WORK(&twl->get_status_work, twl6030_status_work);
> +
>  	ret =3D omap_usb2_set_comparator(&twl->comparator);
>  	if (ret =3D=3D -ENODEV) {
>  		dev_info(&pdev->dev, "phy not ready, deferring probe");
>  		return -EPROBE_DEFER;
>  	}
> =20
> -	/* init spinlock for workqueue */
> -	spin_lock_init(&twl->lock);
> -
>  	err =3D twl6030_usb_ldo_init(twl);
>  	if (err) {
>  		dev_err(&pdev->dev, "ldo init failed\n");
> -		return err;
> +		status =3D err;
> +		goto err_clear_comparator;
>  	}
> =20
>  	platform_set_drvdata(pdev, twl);
> =20
> -	INIT_WORK(&twl->set_vbus_work, otg_set_vbus_work);
> -	INIT_DELAYED_WORK(&twl->get_status_work, twl6030_status_work);
> -
>  	status =3D request_threaded_irq(twl->irq1, NULL, twl6030_usbotg_irq,
>  			IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING | IRQF_ONESHOT,
>  			"twl6030_usb", twl);
> @@ -404,6 +404,9 @@ static int twl6030_usb_probe(struct platform_device *=
pdev)
>  	free_irq(twl->irq1, twl);
>  err_put_regulator:
>  	regulator_put(twl->usb3v3);
> +err_clear_comparator:
> +	omap_usb2_set_comparator(NULL);
> +	cancel_work_sync(&twl->set_vbus_work);
> =20
>  	return status;
>  }
> @@ -412,6 +415,7 @@ static void twl6030_usb_remove(struct platform_device=
 *pdev)
>  {
>  	struct twl6030_usb *twl =3D platform_get_drvdata(pdev);
> =20
> +	omap_usb2_set_comparator(NULL);
>  	cancel_delayed_work_sync(&twl->get_status_work);
>  	twl6030_interrupt_mask(TWL6030_USBOTG_INT_MASK,
>  		REG_INT_MSK_LINE_C);

[Severity: Medium]
Can an in-flight omap_usb_set_vbus() or omap_usb_start_srp() call still
race with omap_usb2_set_comparator(NULL) on probe error or remove?

drivers/phy/ti/phy-omap-usb2.c:omap_usb_set_vbus() {
	...
	if (!phy->comparator || !phy->comparator->set_vbus)
		return -ENODEV;

	return phy->comparator->set_vbus(phy->comparator, enabled);
}

omap_usb2_set_comparator() does a plain unlocked assignment to
phy->comparator, and omap_usb_set_vbus() and omap_usb_start_srp() read and
dereference phy->comparator without locking or lifetime tracking:

CPU0                              CPU1
                                  omap_usb_set_vbus()
                                    if (!phy->comparator || ...)
twl6030_usb_remove()
  omap_usb2_set_comparator(NULL)
  ...
  cancel_work_sync(&twl->set_vbus_work)
  /* devres frees twl */
                                    twl6030_set_vbus()
                                      twl->vbus_enable =3D enabled
                                      schedule_work(&twl->set_vbus_work)
                                        <-- use-after-free

If the compiler reloads phy->comparator after the check, CPU1 can also hit
a NULL pointer dereference, and omap_usb_start_srp() -> twl6030_start_srp()
spends 100 ms in mdelay() before accessing twl while teardown does not
wait for it.  In addition, twl6030_usb_probe() still publishes
&twl->comparator before fallible steps in twl6030_usb_ldo_init() and
request_threaded_irq().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126065139.127-=
1-luob87709@gmail.com?part=3D1
