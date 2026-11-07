Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794020057;
	b=Q9+GgdhjSK8HyC2ESnuIucLbP5o0JVGk+aiQOnoXHoC62y+59RM9StZrRCTBhMzwbXvY
	 N2/Y5tPuTTZzbd+pwgQYEur5ndbA5dh0T+5a5mLetW1sSIiAyq358UGaFxktTsZoYt24v
	 2fhGBXN9hhFxWPWS4ju3z4ycDaZpnWOFEk1OmFAiK0+ODKSr2B3oPhGbvN2p1M3g7MPi3
	 alG5uDDsYY90ROVn4wCy+cu76Z/pj3O+ePfeNienAxrpYsmIxBts3KlMU4UK20SZzeizX
	 J2+a5RJR6NteH9NPIZ3EjddI77JwnaVfTi3W2LdHPZIHyHX5mDOldT+kJ0yqjowdjDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794020057;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8BcdRgrkflMqZeEL1izWfifCST4eamM8TtxJKfZXPiU=;
	b=B6Tk2LUjSCLaQqfNkkXCuEqqEF5I2sXM4pqdqWMjpoVCESE6Ub9D4FUtK1y+QxL8/zYP
	 AQk7PoH8ZIlB6CS1f9v8zZTYYRYGrJqLGD0wU5B88vL/KqxhOA+QhKUQOheW5QDAYyxkz
	 LY7mHWKvVBYGpHLWzpja4K0ZPQK34jAcvDua3VFqea//6A+eiRajFXXxtAq57vxH+3vIf
	 zWZkxmdSm+8mwIr8ZOnPO3NfAHEDYCO0++XjaczWI3Z0vO/R5ImHpFS6ONOAYMlE7MN7L
	 K8zpYzVYd1+rh+kNNTVD6OSOL5mSxD8XABxBgR82zl7YO+scJwNdBQyJKIh46wcHBsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MQbW1ET2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDF2606A32C
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 02:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MQbW1ET2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 457EC1F008A4;
	Sat,  7 Nov 2026 02:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794020057;
	bh=8BcdRgrkflMqZeEL1izWfifCST4eamM8TtxJKfZXPiU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MQbW1ET2b4rEiDzVJoWEkaAcH+E81m6vDWpeFFxRaHMJmBe9u+mvjaVm60x8rE2T/
	 okNBUz1AhYKyCROCDY0P8oVgLOV5bYOubUJwDjFuhzSkk0YCUTs4nigIwbnGOqLyk5
	 M/sHfJMmr2yqfRhytvKDV9ouLbvoT698RB+Xf+GaFCt53Ye8Eqr7YZIX7+UpP6Lrxx
	 SVyhHvB6bsZfkB7gOd/m5ER3LwJPAo0jnYBmFotvbH61dZy/gZKom4HFVP+JfOzCfN
	 dKTIo2N3qbNDHFNSYVrZowvoqDX+VmE3n6E94d9tBdZ/p4TuQfXnm2iG9xp0BeKi5i
	 2SAMnt5RTsBWQ==
Message-ID: <sashiko-outbox-202518@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] usb: misc: onboard_usb_dev: don't defer probing
 after the device is configured
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Clark" <jjc@jclark.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <e0e60a57c500ffbdb6addc268d41b7dcc4cf6c4a.1794018128.git.jjc@jclark.com>
References: <cover.1794018128.git.jjc@jclark.com>
 <e0e60a57c500ffbdb6addc268d41b7dcc4cf6c4a.1794018128.git.jjc@jclark.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 02:54:16 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> onboard_usb_dev breaks the rule that a driver must not return
> -EPROBE_DEFER from its probe after it has registered child devices (see
> commit fbc35b45f9f6 ("Add documentation on meaning of -EPROBE_DEFER")).
> Its USB device driver sets generic_subclass, so the generic probe runs
> first and registers the device's interfaces. onboard_dev_usbdev_probe()
> then returns -EPROBE_DEFER until the platform device for the onboard
> device has probed. On the BeagleY-AI, this results in a probe loop,
> which has broken booting since commit f918e3804498 ("arm64: enable
> HAVE_SHARED_GPIOS for all ARM64 platforms").
>=20
> Call the generic driver's operations from the driver itself instead of
> relying on generic_subclass, so that the probe is deferred before the
> device is configured. The device now stays unconfigured while the probe
> is deferred, including when the platform device never probes. Before, it
> was configured and unconfigured repeatedly until the platform device
> probed.
>=20
> Make onboard_dev_usbdev_match() not match a device when neither its
> node nor its peer hub's node has a platform device, so that the generic
> driver binds it instead. If the platform device goes away between match
> and probe, return -ENODEV instead of -EINVAL, so that usb_probe_device()
> falls back to the generic driver.
>=20
> Fixes: 8bc063641ceb ("usb: misc: Add onboard_usb_hub driver")
> Suggested-by: Johan Hovold <johan@kernel.org>
> Signed-off-by: James Clark <jjc@jclark.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794018128.gi=
t.jjc@jclark.com?part=3D2

