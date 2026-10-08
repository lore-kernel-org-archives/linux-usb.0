Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB6129408
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 00:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791420577; cv=none; b=P51mE8IlhgCy1cV4/VmoBDE7d5hnZYpO9XJDmW46I4hjLgJWbpWZ/xBsMNg1isMf9kKAYkOPMtkxnxy3sK04+C168jz8eFjegf9JMqTJTgGyfuosgPQZWP7OMsyJTzxl0NlobpKtaPU/XO1uigSPvHMz80ykDFgZBhJQttyLjg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791420577; c=relaxed/simple;
	bh=j92tnpnLg6JJo9JwZCtWB1vKb8oniYsD0ItsNHmqgP0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=nN7zozFI2ziNPRx7qd/QLEVttCkRvx6GDGQ3stPYTs6JYQYo0/5mzpY6FrAQ4E7PlC4XD81scSohQlKOK6YbjJqh4LWNe6I1pvexG/z1CK7LV360g/Pkl0+0MKtGaqcJZbdndSdJ9n8dhfsiY7Fi9E0wb/+CDfZBCDwZhR/qLAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k8wOCwVS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k8wOCwVS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C57B1F000FF;
	Thu,  8 Oct 2026 00:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791420575;
	bh=eGYA1cJcWg7C70Aok0GhMqKZ9KJc0sNuf1f6nv2JAZs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k8wOCwVSPhWZp7iSydoGz5hp6IrAPMejK55GQkppbnskafLgVmCRanNLyXCUX82Gi
	 T8IzKulttrCJlUkfWPKKgWDNr7Lx5viM1ej3EOskTgLHlcSlehridn+aj+ejLpLPUJ
	 /kKYXtvYzHHfGLJY9rKCgFX9EPXIc+b0GuIBqaC1xm6h3YX8N3+OAGepQzN+f3aanK
	 LXv1Wv1Dp/8N5ppwIKjlN6mlAc/vcPMR3Up5d7lv/sUg7u/PrlPQmWdVMykRxBPA/M
	 aAxveTFPLox7lmJafI5b0PGELMGjxNIF1q2PlYpDe5rXzS3/0oEWeYC3NYQq0gXwbP
	 4vm6BAtVJo/MA==
Message-ID: <sashiko-outbox-163480@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] USB: core: don't release an unbound claimed interface
 via the driver core
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nguyen Ngoc Thang" <ngocthang2710.1999@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008003431.145352-1-ngocthang2710.1999@gmail.com>
References: <20261008003431.145352-1-ngocthang2710.1999@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 00:49:35 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usb: core: incomplete fix allows KASAN null-ptr-deref via sysfs un=
bind
--

commit fd7979038e7e5e8a14bb9739dc4ce0f3b1576847
Author: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>

USB: core: don't release an unbound claimed interface via the driver core

usb_driver_claim_interface() sets dev->driver on an interface and only
calls device_bind_driver() if the interface is already registered.
Otherwise the later device_add() is expected to bind it, but with
bus drivers_autoprobe disabled bus_probe_device() skips the attach, so
the interface ends up with dev->driver set while it was never added to
the driver's klist.

Closes: https://syzkaller.appspot.com/bug?extid=3D863936f50214e843ae0c

> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index 3c3bbaf89609a..20e8e61bf6713 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -636,10 +636,11 @@ void usb_driver_release_interface(struct usb_driver=
 *driver,
>  		return;
>  	iface->condition =3D USB_INTERFACE_UNBINDING;
> =20
> -	/* Release via the driver core only if the interface
> -	 * has already been registered
> +	/* Release via the driver core only if the interface has been
> +	 * bound by it.  A claimed interface is not bound if it was
> +	 * registered with drivers_autoprobe disabled.
>  	 */
> -	if (device_is_registered(dev)) {
> +	if (device_is_bound(dev)) {

[Severity: High]
Does this change fully resolve the issue, or does the crash still trigger
via the sysfs unbind path?

If drivers_autoprobe=3D0 and the CDC NCM control interface is manually boun=
d,
usb_driver_claim_interface() sets dev->driver for the data interface without
actually binding it, leaving its klist node unattached.

This patch prevents the crash in usb_driver_release_interface() by checking
device_is_bound(), but what happens if an administrator writes the data
interface's device name to /sys/bus/usb/drivers/cdc_ncm/unbind?

The unbind_store() function in drivers/base/bus.c will call
device_driver_detach(), reaching __device_release_driver():

drivers/base/dd.c:__device_release_driver() {
        ...
        if (dev->driver) {
                ...
                klist_remove(&dev->p->knode_driver);
                ...
}

Since dev->driver is set, will this still attempt to remove the unattached
klist node and result in the same NULL pointer dereference in klist_put()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008003431.1453=
52-1-ngocthang2710.1999@gmail.com?part=3D1
