Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520952673AA
	for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 18:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791741827; cv=none; b=qjklVUQFU7EuF2EhnnEHlr+xbSRujwGNGTUbZMHoy62HPvWcz/OOTOpebN/1je7Ui4rnaEa+wYcE9ZGd8TtyoOSuiCrgC/yOqWIa6DdkntIS7qVPmBlw8LHowVnwknh3zhMXkR/TfkzapW8/oGSB7pDMDK8YHl90GHQfMiqXkTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791741827; c=relaxed/simple;
	bh=YmenppURcFgoiZ0pphyQQ0kdrzW3s/E1UdDWUQeh7rg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=OQw/y0v86SvJFoycF+F+kXlJ8Bf6Nx8b//i1frVE0hEegd8rBhvJGOlQd83jUYPmqqlenbhBz5hcJ3xIY3RuTS85p0RZWgMeYpOtidH+DhBHozdSbtVxq5CaozqX+VYDJpHb7+os7+H1vMkctJqQBYYTG57q/cMzBe8wZiceceE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EKVlc4zD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EKVlc4zD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A28251F0089B;
	Sun, 11 Oct 2026 18:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791741825;
	bh=LNFBn3m/8L8rOVs6Y4wZwY73jWQs7GJf0OyMO10RdtU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EKVlc4zD/2RhZE0/jCh8W9KCjbvRIhvNNJsRMqk0eG+ZvhGJweTnwdmfMx5V6H5tJ
	 K5lgMs33LD1Vq7sI7u5s4YiiPccytu5RklYh6ZqKKBRJ29Jto/vQeXZZljgEMT+Ug0
	 R17XiQmWKlapfUcceu2rTfvrJWtUejKlgKWnhonvm91QCTNZdVyImpGhQgnR9yUuKp
	 np0UDh4whRuOl7dAZ/eRcaMUxSIcJSu56eNhhwjUrbIBnq7NDIMPFIRR2grZ8bs1FO
	 umwp4qlvpA6OOAmejv30OhiJIZL2/ZzPpiJKY3cbjuc5QYs83Ys2nAPfx6X5SFptHS
	 A0+Q8pvYjqRiw==
Message-ID: <sashiko-outbox-167368@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: phy: don't overwrite a device_type the bus
 already set
Reply-To: sashiko-reviews@lists.linux.dev
To: "Palla Raghunath" <raghunathpalla.0209@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261011174853.59234-1-raghunathpalla.0209@gmail.com>
References: <20261011174853.59234-1-raghunathpalla.0209@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 18:03:45 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] usb: phy: mutated device_type suppresses unbind/remove uevents
--

commit 3154a296e918fd840b2f1b31a53c7b6b47a5a85e
Author: Palla Raghunath <raghunathpalla.0209@gmail.com>

usb: phy: don't overwrite a device_type the bus already set

usb_add_phy_dev() replaces the device_type of whatever device the PHY driver
passed in. This hurts i2c clients as they keep their release callback on the
device_type. Only take the device_type if nothing else has been set.

> diff --git a/drivers/usb/phy/phy.c b/drivers/usb/phy/phy.c
> index 5a9b9353f343d..ded18c7fe32ff 100644
> --- a/drivers/usb/phy/phy.c
> +++ b/drivers/usb/phy/phy.c
> @@ -705,7 +705,13 @@ int usb_add_phy_dev(struct usb_phy *x)
>  	if (ret)
>  		return ret;
> =20
> -	x->dev->type =3D &usb_phy_dev_type;
> +	/*
> +	 * Don't clobber a device_type the bus already set.  x->dev is the
> +	 * PHY driver's own device, and for an i2c client the release
> +	 * callback lives on the type.
> +	 */
> +	if (!x->dev->type)
> +		x->dev->type =3D &usb_phy_dev_type;

[Severity: Medium]
Will mutating the device type here suppress teardown uevents for platform
devices?

When a platform device driver unbinds, it first removes the PHY and then the
driver core emits uevents:

driver_remove()
  usb_remove_phy(x)
    list_del(&x->head);

device_unbind() / device_remove()
  kobject_uevent_env()
    dev_uevent()
      usb_phy_uevent()

Because usb_remove_phy() does not restore x->dev->type when it deletes the
PHY from phy_list, __device_to_usb_phy() will return NULL during the
teardown uevents.

usb_phy_uevent() then returns -ENODEV:

drivers/usb/phy/phy.c:usb_phy_uevent() {
	...
	spin_lock_irqsave(&phy_lock, flags);
	usb_phy =3D __device_to_usb_phy(dev);
	spin_unlock_irqrestore(&phy_lock, flags);

	if (!usb_phy)
		return -ENODEV;
	...
}

Does this -ENODEV return abort the kobject_uevent() emission entirely,
silently dropping the unbind and remove uevents?

Could this regression cause userspace tools like udev to miss device teardo=
wn
events?

> =20
>  	ATOMIC_INIT_NOTIFIER_HEAD(&x->notifier);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011174853.5923=
4-1-raghunathpalla.0209@gmail.com?part=3D1
