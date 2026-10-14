Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B29C4EFFD3
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 11:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977005; cv=none; b=iFvE/xpcuCm8OuS5ugsqUy8CsKqoKEG3MFnw87OQuBiEsyyfcFoRS8ugbKY63kHXVQIKS0VFD9qjk/ObPrl5sXwYBjYB02onLECpGMI41RWvmq9c42y7A9o1JHtCumKCZYwv39a7d+UDoYCWk2juvvTXJo9P7//jyhBFfL26pXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977005; c=relaxed/simple;
	bh=9rZ+uZGcpSXnTzSe4+VabDJPM7/q4vDTJNKcokP8dDM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=q1qJ+m/ZW7qkyOdRr8B8NPfmphcMjGINZdgELQrk2Wo+WRf0tYppxviKl2F400eeCnl2ZYeil7TmMZNgmtwRmltPZDqUq+PM/T970l72ydolKZ6UgxD50P3WdHJhcYkL2L81tY3rrbJQEZzoJ2W6Lveu1UNA4CqRIduE/rlnlwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KgGMw1fn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KgGMw1fn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1D921F000FF;
	Wed, 14 Oct 2026 11:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791977003;
	bh=9rZ+uZGcpSXnTzSe4+VabDJPM7/q4vDTJNKcokP8dDM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KgGMw1fnyJzwTVxUxfqrREg1w5raKssAu5XLbKFg3jnC42+MK8znuFPMaqZyy9Dpe
	 hz2N443wTwmBc03UiXKKdoecnwiP3ET9fj3nRolhs0wHr7UmzTtGyeW1exLlfMWhGg
	 LT/iGb/3r+zFP5m2EEqrijmeIJdHZG8YBiF8aNoQ/6p4yHGA0bXF+U9T2cYLhB+O5F
	 7RTx3XIFUSz6AFVhU0ld0eTMMyoZrXr6kI0BX4PzeJ0XqnextYCwV5pF8TEDd+BFdh
	 evay4Tu7qN5XCAEvPGGM/7yogl8XlK+5BaA8DbjDeq22YRskMr/bhYB4zWvpV75G/T
	 lbD/riEztT/VQ==
Message-ID: <sashiko-outbox-171196@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: u_ether: refuse to re-register a failed
 net_device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nicholas Velten" <nicholasfvelten@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261014-fix-gadget-netdev-reregister-v1-1-0fb91999da06@gmail.com>
References: <20261014-fix-gadget-netdev-reregister-v1-1-0fb91999da06@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 11:23:23 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Nicholas Velten <nicholasfvelten@gmail.com>
>=20
> When register_netdevice() fails in or after netdev_register_kobject(),
> it returns an error but leaves the net_device in NETREG_UNREGISTERED.
> Such a device can never be registered again; the only valid thing to do
> with it is free_netdev().
>=20
> The configfs Ethernet functions (ECM, EEM, NCM, RNDIS and subset)
> allocate their net_device once per function instance and register it
> from the bind callback, retrying on every bind for as long as the device
> is not registered (formerly tracked by a "bound" flag, now by
> device_is_registered()). After a failed registration the next bind
> therefore calls register_netdev() on an NETREG_UNREGISTERED device and
> hits the BUG_ON() at the top of register_netdevice():
>=20
> [ ... ]
> Fixes: 40d133d7f542 ("usb: gadget: f_ncm: convert to new function interfa=
ce with backward compatibility")
> Reported-by: syzbot+85ede281798faf736677@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D85ede281798faf736677
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Nicholas Velten <nicholasfvelten@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-fix-gadget=
-netdev-reregister-v1-1-0fb91999da06@gmail.com?part=3D1

