Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A2F2F8EAC
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 21:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791495571; cv=none; b=d3P/7ENg1EgXk4HtBKnMyY4hXbhgn5EDZpCd3vggI/JQeqPVihQMhZHOBjl+hpvbpSZzG0MsQ50iOna0fs6wXkp3Am8kmJHaSLZRFNZK1TOJpMUsRjgxs1Sd2GsP002LFwiW3sjBB5I1L/DzON44h5Kp7Wm3jM1UCdvHIoS6aCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791495571; c=relaxed/simple;
	bh=6xdklrE1pcAvEvtvM8I+u5ZV6MQzIhRGSC1vTTy4GlQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=o5RvjMS1avwKds9v1oXaITU8hOs/kX/1MzKJIMAg+tAe8h/I7dFtBrYKZK/7vqHkATkcckvcx5XKB9b0qv25FuyrPIGAj/2y59qK1yxo34a8Rt5Rua1lOL3+a3mkLdixKWkZP/Hmwo7WTd1xhxN0XMXR3bNZru2qutFDeNQh0Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j1k+2nmz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j1k+2nmz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A8871F00899;
	Thu,  8 Oct 2026 21:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791495570;
	bh=vZRF9Dh9LBr/BhJK/q7XsI1pxo+Pt9ZXpQqcDICnpGU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j1k+2nmzuf4in1dpqoL8ELmyn0ftp+xBfVa9Z/mS+U5zb2Q6iVu9cAN+3nq8b+FPi
	 39W9n6v5bpY5+FmOp4E9x7StAbNLqSTxWs4yskRPcTLHnd8c0WYPYu4pqw8Fc1sIao
	 1PatFDSaDZDNdga0UBojEZWPi1A7iejse6c6MIczaQL6Fc5sRruoFz3Y0GO+BHuFaQ
	 L+kbkl4HFThB+RJ8POgKxjmSevEWYs66KfbMZgzMhFtFpfeJZt0mmfsbgmkTYqWrra
	 d/25UZDJgQ210fI6bQJX+T0mOKqklKIkMV/0SzebTmLYBU8vooaJw11nvXSFYqCtuA
	 R8EBPGW2SzDzw==
Message-ID: <sashiko-outbox-164614@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] driver core: complete deferred binds when
 drivers_autoprobe is off
Reply-To: sashiko-reviews@lists.linux.dev
To: mosafer <mohsafer@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008213320.268141-1-mosafer@node0.quickhttpnode15.cloudfaas-pg0.wisc.cloudlab.us>
References: <sashiko-outbox-164361@kernel.org>
 <20261008213320.268141-1-mosafer@node0.quickhttpnode15.cloudfaas-pg0.wisc.cloudlab.us>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 21:39:29 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Mohammad Mosafer <mohsafer@gmail.com>
>=20
> device_add() registers a device and then runs the bus's initial probe
> via bus_probe_device() -> device_initial_probe().  With
> drivers_autoprobe disabled for the bus, device_initial_probe() skipped
> __device_attach() entirely.
>=20
> That is correct for automatic *matching* against the bus's driver list,
> but __device_attach() also doubles as "complete a bind that a driver
> already initiated": when dev->driver has been pre-assigned outside the
> normal match/probe path, it finishes the bind by calling
> device_bind_driver() under the device lock, bypassing probe().
>=20
> With autoprobe off, that second duty was skipped too.  USB depends on
> it: usb_driver_claim_interface() pre-sets dev->driver on an interface
> [ ... ]
> Reported-by: syzbot+863936f50214e843ae0c@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D863936f50214e843ae0c
> Fixes: b8c5cec23d5c ("Driver core: udev triggered device-<>driver binding=
")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mohammad Mosafer <mohsafer@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008213320.2681=
41-1-mosafer@node0.quickhttpnode15.cloudfaas-pg0.wisc.cloudlab.us?part=3D1

