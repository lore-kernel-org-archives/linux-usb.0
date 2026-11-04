Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793763850;
	b=k9jTwS0fnraGhfgipNQXzEUwm1J8QEggDjNzrsw4dgxxT2CPJAtYcOU/SBDdMEe6S0Gg
	 4GTTKlco5XJj/tbdsJ7+MOd1dHCFu7BrzAy9NT/Egu9tbQvrxVFFStrrQ211iV/OHs+hL
	 MCz61ZckgW8HwMxsxyFmLyogz/mAMpJgBGdkHFS0AF+P3PiRWskomPoqiDv3UXo3rCzbS
	 gkuFFOyQiNNIG8Wbe5oLUrewhDRclZ9CAREJE4E88qjqAV2tn1VzUE/0Vifo8hlUMkqUl
	 F0wlIxHk4JOIjVRIe/H8EJdUfEynC2nON2LcUlCltSjRKm9+oIELA3r38aPi0RsMKxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793763850;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fcaxj8UGs+YEMMEKn3vFhIj6c3YALyunoCEOO3lNzvU=;
	b=XcWG7AAXrSALKILeiXTW1MYgEjV3kiPMsxj1bQWmRfU6QHCSlfc9S9Fzmg6HhmWOhXUR
	 Z7p5qGkQTLLBdWZQPEU2Hv0VijZYoKuGg/eHu8qaMnnZL6nw6EW6NPaLq7OsXN0k80ThV
	 Bk660kdz26T0pYcGdBiZYuUBlwMvROuQ44QFg7taM52yqSvGEyRBRmF0PUbHanYvg7Ab2
	 OzJ3XPEB1vOuUsFqUcuuRHnlERx15ibIuPd5UFko12QCbYH+EENMRixHAFsfnyDLRUvHU
	 z+6sq24DTyZjF+0jVih8JTeWfY0/YJ+9sHuAPtJ9UlTptNT0cmoRYLtPAXqyli308UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y3uFwb60;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8386B606A31B;
	Wed,  4 Nov 2026 03:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y3uFwb60
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA5831F000C1;
	Wed,  4 Nov 2026 03:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793763850;
	bh=fcaxj8UGs+YEMMEKn3vFhIj6c3YALyunoCEOO3lNzvU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y3uFwb60yMFu7qMk9xCeUsKM5nrfnNX5AXNdoRWhQ1P6zBwUuuSQZfQUapbY95Yec
	 iE0Si94N9h4adQi5X9LqhB8DyKxnQ12nEuELkvbW5WFbNBm3kbr0SphnoXkuvhnVGV
	 YpdBZ+Hi6+Re7pRhVu0fbKIThl0Bh5q+Pu9e3NQgZAySj8qa8g/I8xREQSNnP4GtpU
	 Kj7QvNaNFbCBpNuBIHTyClyYFic7cu/OsnMzPg9vS9kJa6K/1jH43HvtyeyvKxGZ1D
	 cUGLJocMIkqYYwqpENc7QGDvEDzZ1LFH1IiQKk4OtNR0GxAy+kzM+M0iZVNCgWqaGv
	 OCAj6DXnA6YwQ==
Message-ID: <sashiko-outbox-196628@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] usb: dwc3: support two connectors sharing one HS
 data bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104032706.210042-4-xiaqinghuan@mail.ustc.edu.cn>
References: <20261104032706.210042-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261104032706.210042-4-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 03:44:09 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] usb: dwc3: race and reversed teardown order in dwc3_role_mux_init()
- [High] usb: dwc3: torn port and role state in dwc3_mux_role_set()
--

commit cac2c305bab06e293cb082a796ad2c865c932a9d
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

usb: dwc3: support two connectors sharing one HS data bus

This commit adds support for DWC3 controllers where two USB connectors share
a single High Speed data bus via a GPIO-controlled mux while using separate
Super Speed PHYs. It registers a usb_role_switch per connector endpoint and
arbitrates role requests and GPIO port selection between the two ports.

> diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
> index f3e37d383627a..53106bed3eb95 100644
> --- a/drivers/usb/dwc3/drd.c
> +++ b/drivers/usb/dwc3/drd.c

[ ... ]

> @@ -501,10 +502,254 @@ static enum usb_role dwc3_usb_role_switch_get(stru=
ct usb_role_switch *sw)

[ ... ]

> +static int dwc3_mux_role_set(struct usb_role_switch *sw, enum usb_role r=
ole)
> +{
> +	struct dwc3_role_port *port =3D usb_role_switch_get_drvdata(sw);
> +	struct dwc3 *dwc =3D port->dwc;
> +	struct dwc3_role_mux *mux =3D dwc->role_mux;
> +	unsigned long flags;
> +	enum usb_role selected_role;
> +	int selected;
> +
> +	if (role > USB_ROLE_DEVICE)
> +		return -EINVAL;
> +
> +	/*
> +	 * The request order and the mode request it implies are decided under =
one
> +	 * lock, so a second connector cannot change desired_port between the
> +	 * selection and the dwc3_set_mode() call that consumes it.
> +	 */
> +	mutex_lock(&mux->lock);
> +	spin_lock_irqsave(&dwc->lock, flags);
> +	/*
> +	 * A role change between two non-NONE roles of the same connector must =
not
> +	 * give that connector a new request ticket: it would otherwise steal t=
he
> +	 * data path from the connector that asked first.
> +	 */
> +	if (port->role =3D=3D USB_ROLE_NONE && role !=3D USB_ROLE_NONE)
> +		port->seq =3D ++mux->seq;
> +	port->role =3D role;
> +	selected =3D dwc3_role_mux_pick(mux);
> +	mux->desired_port =3D selected;
> +	selected_role =3D mux->ports[selected].role;
> +	spin_unlock_irqrestore(&dwc->lock, flags);
> +
> +	/*
> +	 * Notify the glue layer before touching the controller, in the same or=
der
> +	 * as the single-connector path.  It may sleep (the Qualcomm glue calls
> +	 * pm_runtime_resume_and_get()), so it runs outside of dwc->lock -
> +	 * dwc3_set_mode() takes that lock itself and a recursive take deadlocks
> +	 * the controller on the very first role change.
> +	 *
> +	 * Pairing with the selection above is provided by mux->lock: a second
> +	 * connector blocks in mutex_lock() until this request has been issued.
> +	 *
> +	 * Same asynchronous semantics as the single-connector role switch: the
> +	 * data path and the controller are reprogrammed from __dwc3_set_mode().
> +	 */
> +	dwc3_pre_set_role(dwc, selected_role);
> +	dwc3_set_mode(dwc, dwc3_role_mux_mode(dwc, selected_role));

[Severity: High]
Can __dwc3_set_mode() observe a torn update between mux->desired_port and
dwc->desired_dr_role here?

In dwc3_mux_role_set(), mux->desired_port is updated under dwc->lock, and
then dwc->lock is dropped across dwc3_pre_set_role() (which may sleep) befo=
re
dwc3_set_mode() re-acquires dwc->lock to update dwc->desired_dr_role.

Meanwhile, __dwc3_set_mode() in drivers/usb/dwc3/core.c does not acquire
mux->lock when snapshotting those two fields:

	mutex_lock(&dwc->mutex);
	spin_lock_irqsave(&dwc->lock, flags);
	desired_dr_role =3D dwc->desired_dr_role;
	if (mux)
		mux_port =3D mux->desired_port;
	spin_unlock_irqrestore(&dwc->lock, flags);

If dwc->drd_work is already pending on system_freezable_wq from an earlier
dwc3_set_mode() call and starts executing __dwc3_set_mode() while
dwc3_mux_role_set() is sleeping in dwc3_pre_set_role(), wouldn't
__dwc3_set_mode() read the new mux->desired_port paired with the previous
dwc->desired_dr_role, switching the port-select GPIO to the new connector
while initializing the controller in the old role before dwc3_pre_set_role()
has completed?

> +
> +	mutex_unlock(&mux->lock);
> +
> +	/*
> +	 * A data-path switch failure is reported through the console and count=
ed
> +	 * per connector; it is not returned here.  This call has already updat=
ed
> +	 * the request state, so a stale error from another connector must not =
be
> +	 * reported as the result of this (successful) request.
> +	 */
> +	return 0;
> +}

[ ... ]

> +static void dwc3_role_mux_exit(struct dwc3 *dwc)
> +{
> +	struct dwc3_role_mux *mux =3D dwc->role_mux;
> +	unsigned int i;
> +
> +	if (!mux)
> +		return;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(mux->ports); i++) {
> +		if (mux->ports[i].sw)
> +			usb_role_switch_unregister(mux->ports[i].sw);
> +		mux->ports[i].sw =3D NULL;
> +		fwnode_handle_put(mux->ports[i].fwnode);
> +		mux->ports[i].fwnode =3D NULL;
> +	}
> +}
> +
> +/* Returns 1 when the optional two-connector mux has been set up. */
> +static int dwc3_role_mux_init(struct dwc3 *dwc, u32 mode)
> +{

[ ... ]

> +	mutex_lock(&mux->lock);
> +
> +	for (i =3D 0; i < ARRAY_SIZE(mux->ports); i++) {
> +		snprintf(name, sizeof(name), "%s-port%u", dev_name(dwc->dev), i);
> +		desc.name =3D name;
> +		desc.fwnode =3D mux->ports[i].fwnode;
> +		desc.set =3D dwc3_mux_role_set;
> +		desc.get =3D dwc3_mux_role_get;
> +		desc.driver_data =3D &mux->ports[i];
> +		mux->ports[i].sw =3D usb_role_switch_register(dwc->dev, &desc);
> +		if (IS_ERR(mux->ports[i].sw)) {
> +			ret =3D PTR_ERR(mux->ports[i].sw);
> +			mux->ports[i].sw =3D NULL;
> +			mutex_unlock(&mux->lock);
> +			goto err;
> +		}
> +	}
> +
> +	/*
> +	 * The controller is only started in its default role once both switches
> +	 * are registered: before that a connector driver cannot request a role,
> +	 * so nothing can race with this initial mode request.
> +	 */
> +	dwc3_set_mode(dwc, mode);
> +
> +	mutex_unlock(&mux->lock);
> +
> +	return 1;
> +
> +err:
> +	/* A mode request queued before the failure must not run on freed state=
. */
> +	cancel_work_sync(&dwc->drd_work);
> +	dwc3_role_mux_exit(dwc);
> +	dwc->role_mux =3D NULL;
> +	return ret;

[Severity: High]
What happens if usb_role_switch_register() succeeds for port 0 and fails for
port 1 in dwc3_role_mux_init()?

Once mux->ports[0].sw is registered, port 0's connector driver can immediat=
ely
look it up and call usb_role_switch_set_role() -> dwc3_mux_role_set(). While
dwc3_role_mux_init() holds mux->lock, that call blocks on
mutex_lock(&mux->lock).

When registration of port 1 fails, dwc3_role_mux_init() unlocks mux->lock
while mux->ports[0].sw is still registered, and at the err label calls
cancel_work_sync(&dwc->drd_work) before dwc3_role_mux_exit(dwc) unregisters
mux->ports[0].sw.

Doesn't that allow a blocked or concurrent dwc3_mux_role_set() on port 0 to:

1. Queue dwc->drd_work via dwc3_set_mode() after cancel_work_sync() has
already returned, leaving __dwc3_set_mode() queued or running on devm-manag=
ed
struct dwc3 and struct dwc3_role_mux after probe fails and frees them?

2. Enter dwc3_mux_role_set() just before usb_role_switch_unregister() in
dwc3_role_mux_exit() (which does not synchronize with mux->lock) and read
dwc->role_mux after err sets dwc->role_mux =3D NULL, dereferencing a NULL m=
ux
pointer in mutex_lock(&mux->lock)?

3. Run __dwc3_set_mode() before cancel_work_sync() finishes and initialize
host or gadget mode (dwc3_host_init() / dwc3_gadget_init()), which is never
cleaned up because dwc3_core_probe() -> dwc3_core_init_mode() jumps to
err_exit_debugfs on failure without calling dwc3_core_exit_mode() or
dwc3_drd_exit()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104032706.2100=
42-1-xiaqinghuan@mail.ustc.edu.cn?part=3D3
