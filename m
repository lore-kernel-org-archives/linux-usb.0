Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699F5225788
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 15:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791474830; cv=none; b=tBFvtCu8XedbLhV44pQVgkxv3K0sqFocJKxB+wBGJQuxBGI9/ZmypPPEjcqmKdLxvd87iEW72B7CxAA6c9JuG50i9rPoLUoFfVb18wRg9MapnFmY8LCZbe2Ja8zY+ujs8IauzLzKThs/mEAmdNGIqyVcbA8hkvMJTslZa2Vp/bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791474830; c=relaxed/simple;
	bh=/gwZllhBwovGJtg4ew82ObCZLIjqPemdakcVvHsRQX0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=jG2MANXiV3nL3hdwVuvTCvhxeAeRfZ6/dHy4mfMmL28mYY5cUFwmRrV6RqS8tsPUEuKyHgAiVq7l2WXLR3hiL8VTWcpbRTcnUj0u7Wfq00EvZx4Pl9OvB3X1CfqS3im60SAGuV3n3xxszgtoAjEK0fI2oL3VyHnwg4p2vIyLPGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mdHbagNI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mdHbagNI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E505F1F000FF;
	Thu,  8 Oct 2026 15:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791474829;
	bh=S+0pFLVo2gF6HDSAIiHW9g2qzDqFY7zYtN4I9qN4npk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mdHbagNIpveBCJhASe91giYRitdOKeVTjxgrjbtmXvkkSUiCZEa/A+3po4tEk3dyq
	 UIHHH6HZSB2j/F/I8e25++AU5B7V5346+J5eDVsO9uKzg4/aZj2FhJOQ7amaLRMXj6
	 hrafyaKf/qeVk0z477rDK4MwPQ5n5AisFKMek11iZUivFDQYkrhpFNa6FxBXFHAIKl
	 TDVnWsOCbAXMYMaujfn7SItjrMmsU3vhhkSyryGu23z6/ShG8zq53eDAthihwUc9KD
	 X5rc/B0GM5VRXr9lj9zD0wKddvQTzc5xdA529L54dGdo5d0OsfgvBFqpAZ3tMyagk7
	 ImU+e3K97XOaQ==
Message-ID: <sashiko-outbox-164361@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] driver core: complete deferred binds when
 drivers_autoprobe is off
Reply-To: sashiko-reviews@lists.linux.dev
To: mosafer <mohsafer@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008154105.256340-1-mosafer@node0.quickhttpnode15.cloudfaas-pg0.wisc.cloudlab.us>
References: <20261008154105.256340-1-mosafer@node0.quickhttpnode15.cloudfaas-pg0.wisc.cloudlab.us>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 15:53:48 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] driver core: TOCTOU race in device_initial_probe() causes spurio=
us autoprobe
--

commit 363268c1e7ac2e5ecc70b8f7c4762aa363c48d73
Author: Mohammad Mosafer <mohsafer@gmail.com>

driver core: complete deferred binds when drivers_autoprobe is off

This commit updates device_initial_probe() to complete deferred device binds
even when bus autoprobing is disabled. It conditionally calls
__device_attach() if dev->driver is already set, preventing a null-pointer
dereference during device teardown.

> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index f6525a7ee8c54..98315264295e4 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -1149,7 +1149,17 @@ void device_initial_probe(struct device *dev)
>  	if (!sp)
>  		return;
> =20
> -	if (sp->drivers_autoprobe)
> +	/*
> +	 * The drivers_autoprobe flag only suppresses matching the device
> +	 * against the bus drivers.  If a driver has already been assigned
> +	 * to the device (e.g. usb_driver_claim_interface() pre-setting
> +	 * dev->driver for an unregistered interface, expecting device_add()
> +	 * to complete the bind), the bind must be finished regardless of
> +	 * autoprobe: otherwise the device ends up registered with
> +	 * dev->driver set but never bound, and teardown oopses removing
> +	 * the never-attached knode_driver from the driver klist.
> +	 */
> +	if (sp->drivers_autoprobe || dev->driver)
>  		__device_attach(dev, true);

[Severity: Medium]
If sp->drivers_autoprobe is 0 but dev->driver is set, device_initial_probe()
locklessly evaluates this as true and calls __device_attach().

Before __device_attach() acquires device_lock(dev), what happens if a
concurrent operation (like a sysfs unbind or sibling device disconnect)
acquires the lock, detaches the driver, and sets dev->driver to NULL?

When __device_attach() subsequently acquires the lock, it would check
dev->driver. Finding it NULL, it would skip the pre-assigned bind logic and
fall through to the else block:

static int __device_attach(struct device *dev, bool allow_async)
{
	...
	device_lock(dev);
	if (dev->p->dead) {
		goto out_unlock;
	} else if (dev->driver) {
		...
	} else {
		...
		ret =3D bus_for_each_drv(dev->bus, NULL, &data,
					__device_attach_driver);

This else block unconditionally executes bus_for_each_drv(), which performs
a full automatic match and probe against all drivers on the bus.

Does this result in a spurious bus-wide autoprobe, directly violating the
administrator's explicit drivers_autoprobe =3D 0 policy?

> =20
>  	subsys_put(sp);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008154105.2563=
40-1-mosafer@node0.quickhttpnode15.cloudfaas-pg0.wisc.cloudlab.us?part=3D1
