Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921590;
	b=PMXj8DhqtyvrWWgtbUoWJyimMPMg12rHULR7zIIcdY+c7H1ha66sbbFiDCPaifa/ucsP
	 X8byN3aQ/IYU0p260hEVKo0MJOHbD+u/l2UuxypM7Nallr+hq8nsopXb52zGrFEnnFNvT
	 bdNZAbf9ziP4+Fn0tiduWKjQSH4GM9OIVolIBD/X0y5+5Wkq5ryaoULTahhfP2rZ6MSGJ
	 fedvaws2mnFCC4y4qsSo5ONZ8zQB6DoaJ4kXVwrCNN+sq0j6EMw06Kq4TEnbXfNRPW7D0
	 W8eyojlj+SFwiuMQXAqUylFMC8vVwUv2d2PIEfKba3CGwtv85hH6W8BMa8m5OmBunkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921590;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eNop4FDhFuQHgq2FwlKjF9IqsPr8VKmroNYJt8qzdsg=;
	b=gl0W0THi8Y/otuqcYDcZ451fVH+NUBS5+Tq/1aHuPJo4Dq31qUF3dbA9U+fhaQFT8ZeT
	 DpD/jBVrCqSJPCR8YmrRePTP6OIUc/aLzW665SuD9KDHQcHacSO0LiYIRVLVKK4/7IPel
	 0YVauSogs8N9+3E7WNUKZ0X92FQVhulZCGyyVKmjlNs+Uy63yJegLZslVzSjtVi9nO36Y
	 g4+R2CoLi91npxJ2nfuMnPVmgIJiN3xy260WT7//a2+0XNnDgo4K5/X1HGFuHa5buD3jZ
	 U1h93dCsh0/Evt2zLMJ8rLD06qZ2X2g88F8NY1ODykO5ky5gZkk8xhIQZdwCbLONcbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RyNLqibF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5B3606A31C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 13:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RyNLqibF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 636631F000C4;
	Tue, 17 Nov 2026 13:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794921589;
	bh=eNop4FDhFuQHgq2FwlKjF9IqsPr8VKmroNYJt8qzdsg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RyNLqibFxg+BjxXUFPc1OpU0wksNxQgka4FEVM3/Ci8/wtebjzA3LU8V8qxMkrv1k
	 QCjP7QF6t4Q64UJEtir8ceACS40tkwm3w1IiZv9CF0SuAVq7cl6U0icSGizlj1DblH
	 SAUSoC5kmwJ17Gztu6NGFKhbEgecZg03rp5XeZbjROSLrDp9zZW2ftL9l0UNseSgGK
	 VorqBB4/3RLQcd7HJyKs5oNNv+WYfY5lQwPY/6N1d/esWqcJxuMPcRhrqTFwF4azw9
	 aS80F47R1hK0nA5L+8LC1XJ4+kDeyH+PTT4cLTBWhV6eungXdQdQDy2t4oyYC7bo8D
	 9tiQK7TZGlH/g==
Message-ID: <sashiko-outbox-218865@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] usb: gadget: udc: Decide on connecting in one
 place
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117-udc-connect-v3-3-9413b491d213@flipper.net>
References: <20261117-udc-connect-v3-0-9413b491d213@flipper.net>
 <20261117-udc-connect-v3-3-9413b491d213@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 13:19:49 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] usb: gadget: udc: missing driver->disconnect() when
  !ops->pullup
- [Medium] usb: gadget: udc: -EOPNOTSUPP from pullup() breaks bind and
  activation
- [Medium] usb: gadget: udc: driver->disconnect() called when pullup
  disable fails
- [Low] usb: gadget: udc: unreachable !gadget->ops->pullup check in
  disconnect
--

commit f20c9b97618b74d0e27972a1d4cf419b12e02088
Author: Alexey Charkov <alchark@flipper.net>

usb: gadget: udc: Decide on connecting in one place

This commit centralizes UDC connection state evaluation in
usb_udc_update_connection_locked() so that pullup control depends on driver
binding, VBUS presence, activation state, and sysfs soft_connect.

> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index 449b303c2f813..496083045a993 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
[ ... ]
> @@ -766,26 +773,20 @@ static int usb_gadget_disconnect_locked(struct usb_=
gadget *gadget)
>  {
>  	int ret =3D 0;
> =20
> -	if (!gadget->ops->pullup) {
> -		ret =3D -EOPNOTSUPP;
> -		goto out;
> -	}
> -
>  	if (!gadget->connected)
>  		goto out;
> =20
> -	if (gadget->deactivated || !gadget->udc->started) {
> -		/*
> -		 * If gadget is deactivated we only save new state.
> -		 * Gadget will stay disconnected after activation.
> -		 */
> -		gadget->connected =3D false;
> +	if (!gadget->ops->pullup) {
> +		ret =3D -EOPNOTSUPP;
>  		goto out;
>  	}

[Severity: Low]
Is this !gadget->ops->pullup check reachable?  gadget->connected is only set
in usb_gadget_connect_locked() after checking that gadget->ops->pullup is
non-NULL, so when ops->pullup is NULL, !gadget->connected always jumps to o=
ut
first and usb_gadget_disconnect() returns 0 instead of -EOPNOTSUPP.

> =20
>  	ret =3D gadget->ops->pullup(gadget, 0);
>  	if (!ret)
>  		gadget->connected =3D 0;
> +	else if (ret !=3D -EOPNOTSUPP)
> +		dev_warn(&gadget->udc->dev, "failed to disable the pullup: %d\n",
> +			 ret);
> =20
>  	mutex_lock(&udc_lock);
>  	if (gadget->udc->driver)
>  		gadget->udc->driver->disconnect(gadget);
>  	mutex_unlock(&udc_lock);

[Severity: Medium]
Should gadget->udc->driver->disconnect(gadget) still run when
gadget->ops->pullup(gadget, 0) fails?

When disabling the pullup fails, gadget->connected stays 1 and
usb_gadget_deactivate() rolls back gadget->deactivated =3D false under the
assumption that the gadget remains connected and active.  However,
driver->disconnect() has already reset the composite configuration and
disabled the function endpoints while the hardware pullup is still enabled,
and any later retry (such as from soft_connect_store() or vbus_event_work())
will call driver->disconnect() again.

[ ... ]

> @@ -823,6 +828,34 @@ int usb_gadget_disconnect(struct usb_gadget *gadget)
>  }
>  EXPORT_SYMBOL_GPL(usb_gadget_disconnect);
> =20
> +static void usb_udc_update_allow_connect(struct usb_udc *udc)
> +	__must_hold(&udc->connect_lock)
> +{
> +	udc->allow_connect =3D udc->bound && udc->vbus &&
> +			     !udc->gadget->deactivated &&
> +			     !udc->soft_disconnected;
> +}
> +
> +/*
> + * Decide whether the gadget may connect and connect or disconnect it to=
 match.
> + * Call this after changing any of the state that
> + * usb_udc_update_allow_connect() checks.
> + */
> +static int usb_udc_update_connection_locked(struct usb_udc *udc)
> +	__must_hold(&udc->connect_lock)
> +{
> +	usb_udc_update_allow_connect(udc);
> +
> +	/* Without a pullup control there is nothing to switch */
> +	if (!udc->gadget->ops->pullup)
> +		return 0;
> +
> +	if (udc->allow_connect)
> +		return usb_gadget_connect_locked(udc->gadget);
> +
> +	return usb_gadget_disconnect_locked(udc->gadget);
> +}

[Severity: Medium]
What happens when a UDC driver defines ops->pullup, but that callback retur=
ns
-EOPNOTSUPP?

usb_gadget_connect_locked() and usb_gadget_disconnect_locked() suppress the
warning when ops->pullup() returns -EOPNOTSUPP, but still return -EOPNOTSUPP
to usb_udc_update_connection_locked().  UDC drivers such as pxa27x_udc (when
no pullup GPIO is configured) and fsl_udc_core (when VBUS is inactive, since
it does not use usb_udc_vbus_handler()) return -EOPNOTSUPP from their pullup
callbacks, which causes gadget_bind_driver(), usb_gadget_activate(), and
usb_gadget_deactivate() to fail with -EOPNOTSUPP.

[ ... ]

> @@ -1726,21 +1730,31 @@ static void gadget_unbind_driver(struct device *d=
ev)
> =20
>  	dev_dbg(&udc->dev, "unbinding gadget driver [%s]\n", driver->function);
> =20
> -	udc->allow_connect =3D false;
> -	cancel_work_sync(&udc->vbus_work);
>  	mutex_lock(&udc->connect_lock);
> -	usb_gadget_disconnect_locked(gadget);
> +	udc->bound =3D false;
> +	usb_udc_update_connection_locked(udc);
> +	/*
> +	 * The UDC stops below even if the pullup refused to switch off (some
> +	 * UDCs refuse without VBUS), so treat the gadget as disconnected from
> +	 * now on. Neither a late VBUS event nor the next driver's bind should
> +	 * act on a connection that ends with this driver.
> +	 */
> +	gadget->connected =3D false;
>  	usb_gadget_disable_async_callbacks(udc);
>  	if (gadget->irq)
>  		synchronize_irq(gadget->irq);
>  	mutex_unlock(&udc->connect_lock);
> =20
> +	/* A VBUS event can no longer connect the gadget, so just wait it out */
> +	cancel_work_sync(&udc->vbus_work);
> +
>  	udc->driver->unbind(gadget);

[Severity: High]
On a UDC without ops->pullup (such as max3420_udc or fotg210-udc), does
udc->driver->disconnect(gadget) ever get called before udc->driver->unbind()
or on VBUS loss?

With usb_udc_update_connection_locked() returning 0 early when
!udc->gadget->ops->pullup, gadget_bind_driver() now succeeds and starts the
UDC without setting gadget->connected.  Once the host enumerates and
configures the gadget, unbinding the driver (or losing VBUS in
vbus_event_work()) skips usb_gadget_disconnect_locked() and never invokes
udc->driver->disconnect(gadget).  udc->driver->unbind(gadget) then runs whi=
le
cdev->config is still active and function->disable() has never been called,
triggering WARN_ON(cdev->config) in __composite_unbind() or tearing down
active functions in configfs_composite_unbind() with enabled endpoints and
dangling function state (such as use-after-free on dev->port_usb in u_ether=
).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-udc-connec=
t-v3-0-9413b491d213@flipper.net?part=3D3
