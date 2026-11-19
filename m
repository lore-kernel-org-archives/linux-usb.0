Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095370;
	b=qyWD7GrzhMifHaFMoXGC83g/M2xCajkTJkl62hHA9/Fw3q5hYI1JMiaUQvPVWgqxNE3Z
	 cClpsMgpdAyWD5SgD/bQ5Uby/bROxgQDmd3hmiOci4m5LuhjU/mQ8EDRgkGHwnpTOka7K
	 abxPYMm3rbCO4hfnz04ouDTVxuFgYobpIwYbe0qc86H+HHeCSIJvUoIHFrBH6CpA2y6e3
	 pooHxw2pol2uWlOJd6d+5R02NAtdTNduqwHXSAE5llHM8Y4Z/MWuaYZiOA8ZyWFVjzM9j
	 ZBwE5+0hZXhCVAz+0+Io0QK2DrYrhJAkB9hFE8AFmeDDjbklzIKvfWuAaGcRXPueu7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095370;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5dKioVXM9a9nnki+jiYwVeeh4qalNpXY1kR2I77+DTE=;
	b=W/Ml2JnxBoyf3z1L7X0rUKLr6+yfj2QUYXJaarwWKBlZpjiknAMrRwtEeNsK3w+UQHgF
	 bCi6A2MzXDxC5OkFuiahUq/1TcquwMS4q5qIMfNpwzCbdGMrQ3a+2mZBj4K3SZ6s2One4
	 wFJVY4eSbQ6ubvYgzLxxRdlCtM1yaaqj+O5oxsuhnMcH8zW1/Y54a/pr/Yk6pAYDw0mNQ
	 1tCP4aBj4ijF1x2QUcwqgXH1z7WYTJI/oNgmpqLOskQuP2eq9T5QpK3XH6YxQdG8V8eJ2
	 FysYVx3J+XbjtG7sWDW6p4edlq36uB7xrbVltCD3Oe+StIFOHfxtD0PZgvJ5WU1syDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="IeXw/XFT";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5639606A330
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 13:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IeXw/XFT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 179751F000CB;
	Thu, 19 Nov 2026 13:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795095370;
	bh=5dKioVXM9a9nnki+jiYwVeeh4qalNpXY1kR2I77+DTE=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=IeXw/XFTG59uTgTTRSDbPtSs1VtPWtJTuOoZz0hYHwEbEYFIp5N0xJWmsdzVEaCSP
	 x62OA/6Mcwn4Rew7gbvaLBjN6XgG6fioNazkHjQyudkI/mAvkAARum2qalpjjOjg1a
	 /6UueHGTywUkxZXScbwW98OFf4KE6RxoJPjN8pfhrkseir2Ek3QMRiL0uuO5yf3fGU
	 +/+N0qUDHFuUJMXXe0tHcKy0yTmoFEAzNNh6GwX93sK1xSWX9v46NIlsCGDI1wRr+g
	 pcv3mdEXfR8v8hOAIfKzXMjPnEDh5Z0byrFXKhzLM74N75xKSpxPTCmpeyCFMwb6Lz
	 4o5jqfdSnjkUg==
Message-ID: <sashiko-outbox-223185@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net-next 1/1] net: usb: rtl8150: break cycle between
 tasklet and URB
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oliver Neukum" <oneukum@suse.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261118133550.955312-1-oneukum@suse.com>
References: <20261118133550.955312-1-oneukum@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 13:36:09 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] net: usb: rtl8150: tasklet livelock on poisoned URB in
  rx_fixup()
- [Medium] net: usb: rtl8150: URBs poisoned too late in
  rtl8150_disconnect()
--

commit 1541c4307c346b500c4b1389da4c563d28fd64b6
Author: Oliver Neukum <oneukum@suse.com>

net: usb: rtl8150: break cycle between tasklet and URB

This commit replaces unlink_all_urbs() with terminate_all_urbs() using
usb_poison_urb() in rtl8150_disconnect(), followed by a second
tasklet_kill(), to break the resubmission cycle between URBs and the
tasklet.

> diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
> index d51e43170e033..6d20f52d52efd 100644
> --- a/drivers/net/usb/rtl8150.c
> +++ b/drivers/net/usb/rtl8150.c
> @@ -353,6 +353,13 @@ static void free_all_urbs(rtl8150_t * dev)
>  	usb_free_urb(dev->intr_urb);
>  }
> =20
> +static void terminate_all_urbs(rtl8150_t *dev)
> +{
> +	usb_poison_urb(dev->rx_urb);
> +	usb_poison_urb(dev->tx_urb);
> +	usb_poison_urb(dev->intr_urb);
> +}
> +
>  static void unlink_all_urbs(rtl8150_t * dev)
>  {
>  	usb_kill_urb(dev->rx_urb);
> @@ -970,7 +977,8 @@ static void rtl8150_disconnect(struct usb_interface *=
intf)
>  		set_bit(RTL8150_UNPLUG, &dev->flags);
>  		tasklet_kill(&dev->tl);
>  		unregister_netdev(dev->netdev);
> -		unlink_all_urbs(dev);
> +		terminate_all_urbs(dev);

[Severity: Medium]
Can rx_fixup() still run during unregister_netdev() before
terminate_all_urbs() poisons the URBs?

CPU0                                    CPU1
                                        read_bulk_callback()
                                          test_bit(RTL8150_UNPLUG, ...)
rtl8150_disconnect()
  set_bit(RTL8150_UNPLUG, ...)
  tasklet_kill(&dev->tl)
  unregister_netdev(dev->netdev)
    ...
      rtl8150_close()
        unlink_all_urbs(dev)
          usb_kill_urb(dev->rx_urb)
                                          usb_submit_urb() -> -EPERM
                                          tasklet_schedule(&dev->tl)
          /* urb->reject returns to 0 */
                                        rx_fixup()
                                          usb_submit_urb(dev->rx_urb, ...)
  terminate_all_urbs(dev)

Because rtl8150_close() only uses usb_kill_urb(), dev->rx_urb is unpoisoned
again as soon as usb_kill_urb() returns.  If an in-flight
read_bulk_callback() passed the RTL8150_UNPLUG check just before
rtl8150_disconnect() set the bit, its usb_submit_urb() fails with -EPERM
while usb_kill_urb() is waiting and schedules dev->tl.  rx_fixup() can then
run before terminate_all_urbs() and either resubmit dev->rx_urb after
rtl8150_close() or, if usb_submit_urb() returns -ENODEV, call
netif_device_detach() on an unregistered net_device.

Would calling terminate_all_urbs() before the first tasklet_kill() and
unregister_netdev() avoid this window?

> +		tasklet_kill(&dev->tl);

[Severity: High]
Will tasklet_kill(&dev->tl) livelock if dev->tl is scheduled after
dev->rx_urb is poisoned?

drivers/net/usb/rtl8150.c:rx_fixup() {
	...
try_again:
	status =3D usb_submit_urb(dev->rx_urb, GFP_ATOMIC);
	if (status =3D=3D -ENODEV) {
		netif_device_detach(dev->netdev);
	} else if (status) {
		set_bit(RX_URB_FAIL, &dev->flags);
		goto tlsched;
	} else {
		clear_bit(RX_URB_FAIL, &dev->flags);
	}

	return;
tlsched:
	tasklet_schedule(&dev->tl);
}

Submitting a poisoned URB returns -EPERM (or -ENOENT once the endpoint is
disabled), not -ENODEV.  Because rx_fixup() does not check RTL8150_UNPLUG
and treats any error other than -ENODEV as retryable, it sets RX_URB_FAIL
and reschedules dev->tl on every run.  On subsequent runs RX_URB_FAIL makes
rx_fixup() jump straight to try_again, get -EPERM from the poisoned
dev->rx_urb, and call tasklet_schedule(&dev->tl) again, spinning in softirq
and hanging tasklet_kill() in rtl8150_disconnect() during driver unbind or
disconnect.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118133550.9553=
12-1-oneukum@suse.com?part=3D1
