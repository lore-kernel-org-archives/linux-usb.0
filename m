Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E15F4E2F30
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 13:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791985255; cv=none; b=SeeHBWpKI2o1pM5D8h5Tp3sYJkgRc4Fy9krRGZAM6Vuv2VdvmnguHORl9jt5QZ9lr/xazN/oeImWIV7lAdAPfgd6Yb7csN5umqRGjfUlCn0ApG2CzBy3P3LBuCuc2jjtwY2ZVQUo32nDwTHiPS6JZfVLIsU/TWKrZdQAXnV9OvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791985255; c=relaxed/simple;
	bh=K6AtXGm1AKROiQccZaLdrOZAVlCZ5h+c7Oom5VUayXQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=tPvdBoSFNsksgMOmBq/orTPLsIOmeXvfXfsDpKDXkPe9ZmVddtc4a+9jMmSKVOtzMcwVMMNWGQooIydIb1FNGNikbDncgBFiswI4hBCi5zuzmJzgrqiWbozMCX94do5gAF/W7M1A7+Sw3jQT5Oe3G/wYuIQ7MGmBx+mL+K20mew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LZmA5C1W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LZmA5C1W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A0EA1F000FF;
	Wed, 14 Oct 2026 13:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791985250;
	bh=obPdsNTP6GkL88XltUdgo3dzWVMDPxyDPLu1HqtJETI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LZmA5C1WmFWMXJfQt12PIM8+8VonML+J+d1POVxuk+v9WqmrCwgn8Oe38k6tC3AxV
	 LuzTQYC9nwtUCPC8jQXeE4IFlzcWtRzK7wCfndMrsIhf6svhtJeJilKRcSpRI1At5m
	 s3cCsUDQB27/MF768t3EyMTALYRQ8N1Zld1iR23z4hfSy2brjmDI8GWaNOElspcI5/
	 aPjd+A93bLLBXVC435Pa9YpJRoeVVrFjyQm8YdA5l3/LBI+2hk4uH1Y5SRnZMDydCN
	 RLLyBAj83u/zLQBvOWm/muS/8ppx6sz0u0uXB8jIi6NMVnfZgo5afwcObSjSCxZXIp
	 UViIdL3e0G/VQ==
Message-ID: <sashiko-outbox-171369@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] driver core: take parent lock in async device
 attach
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261014133109.1392265-4-johan@kernel.org>
References: <20261014133109.1392265-1-johan@kernel.org>
 <20261014133109.1392265-4-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 13:40:50 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Mario Peter <mario.peter@leica-geosystems.com>
>=20
> On buses with need_parent_lock set (only USB), probe() must run with the
> parent device locked. A synchronous attach after device_add() gets this
> from the caller, e.g. usb_set_configuration() holds the udev lock while
> adding interfaces. __device_attach_async_helper() runs the probe from an
> async worker instead, where that lock isn't held, and only takes
> device_lock(dev).
>=20
> With async probing enabled for the hub driver (e.g. driver_async_probe=3D*
> or driver_async_probe=3Dhub), this races when a multi-TT hub is
> configured. For multi-TT hubs, hub_probe() calls
> usb_set_interface(hdev, 0, 1) to select the TT-per-port altsetting, and
> usb_set_interface() creates the endpoint devices of the interface a
> second time:
> [ ... ]
>          async_schedule_dev() runs synchronously when parent lock is
> 	 held ]
> Cc: stable@vger.kernel.org	# 4.2
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014133109.1392=
265-1-johan@kernel.org?part=3D3

