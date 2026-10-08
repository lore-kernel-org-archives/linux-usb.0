Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C6F4B0E4B
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 15:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791471783; cv=none; b=Z2cARjCjh0Le49VDHrPxvAhzcPVHCylTJwAJ6s/FNCxhMrxJMhHAqVssc2+2MTGkCrfQKO6bjVlVsl/jyGlXbLQ3OqSW3ehNhH04KTZYnLkIuPaYnpO3lYjA8nwjJKHOSNUAYIsx38T96/67VmtFENXkcQxdb0owxJFU4QQ4adU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791471783; c=relaxed/simple;
	bh=aQ40IJJVxPZqMSdsAbTCXG/MHk/reqxXWJ736X4FnjU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=U/ve8fxFFltCJ2X4dPRcwgODtUf4W/9+ym6LWOlQjlFQfhgktK70spaVMLnh1obARqItklpdhxsBEbThwSLzAVJkwCzDIv5ncVOD06yTCTjXgGSrkUWT7BJOmLaI+pmkMK1c0sY/wfZ+eAy7A87aLKGB1+JTTYRD5hZeEIZy7CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bwZ9HgUj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bwZ9HgUj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C22E1F000FF;
	Thu,  8 Oct 2026 15:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791471775;
	bh=CWhzQPD5vp8TVEzMOylCQyfMJGuSfGtD7P0F2Vn3PkY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bwZ9HgUjyy9R5a4GiowYJYdu0B47fTMjZb/8i8x7TS3KD1Jbcrn+kUddhxN7dAkun
	 +3qjj1imbGhZlOho3jndCvejgOwmDmt4hhmjjdKksqpL3YuAAQw7m3cE0KD2m/FxgC
	 m+C2BU8pN6a3TtvXWCFpTB4sBceVmYD4uMQtZ/+XigHdz9XZyAQbB7FmeSW9ZJ9/aI
	 AJAiVOYrfazOTQpAHiPQc1cXgeoarVGcOevk3vLItlJBxY78TXEVOCHxRn+Pod3/5I
	 gNuShxTTjTxEFrthAZjLUG3Iul1YZKTfKBK5HR8zlX9/wcSd9eiGhXScxxNAqSr+uH
	 7wiHFP5gho85Q==
Message-ID: <sashiko-outbox-164330@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] driver core: bind a device with a preset driver even
 without autoprobe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nguyen Ngoc Thang" <ngocthang2710.1999@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008144859.25548-1-ngocthang2710.1999@gmail.com>
References: <20261008003431.145352-1-ngocthang2710.1999@gmail.com>
 <20261008144859.25548-1-ngocthang2710.1999@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 15:02:54 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] driver core: lockless TOCTOU race in device_initial_probe() bypa=
sses autoprobe=3D0
--

commit e63fcf260c7ac274ae164a5fb03accba2fcada52
Author: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>

driver core: bind a device with a preset driver even without autoprobe

When drivers_autoprobe is disabled, device_initial_probe() skipped
calling __device_attach(). This commit ensures that devices with a
preset driver still undergo binding even if autoprobe is disabled,
preventing a NULL pointer dereference in klist_remove() on unbind.

Closes: https://syzkaller.appspot.com/bug?extid=3D863936f50214e843ae0c

> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index f6525a7ee8c54..137bf1dea3333 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -1149,7 +1149,8 @@ void device_initial_probe(struct device *dev)
>  	if (!sp)
>  		return;
> =20
> -	if (sp->drivers_autoprobe)
> +	/* a device with a preset driver must still be bound */
> +	if (sp->drivers_autoprobe || dev->driver)
>  		__device_attach(dev, true);

[Severity: Medium]
Does this lockless check of dev->driver introduce a TOCTOU race that
bypasses the autoprobe disabled state?

If sp->drivers_autoprobe is disabled, this code relies on dev->driver
being non-NULL to trigger __device_attach(). However, if dev->driver is
cleared concurrently (for instance, via a hardware disconnect or a sysfs
unbind), __device_attach() will see dev->driver as NULL under the
device lock.

When __device_attach() sees dev->driver as NULL, it takes the else branch
and executes the fallback bus_for_each_drv() probe:

drivers/base/dd.c:__device_attach() {
    ...
	} else if (dev->driver) {
    ...
	} else {
		struct device_attach_data data =3D {
			.dev =3D dev,
			.check_async =3D allow_async,
			.want_async =3D false,
		};
    ...
		ret =3D bus_for_each_drv(dev->bus, NULL, &data,
					__device_attach_driver);
    ...
}

Will this cause an unintended auto-probe across all drivers on the bus,
violating the autoprobe=3D0 configuration?

> =20
>  	subsys_put(sp);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008144859.2554=
8-1-ngocthang2710.1999@gmail.com?part=3D1
