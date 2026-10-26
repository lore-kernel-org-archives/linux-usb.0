Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020831;
	b=YBBc7Ks7fSvsXSQxgY8XD3ePbflFb6e/3TqdqxcvOpe7q5XGZwe+6P7Y9mnRZY/pGvok
	 H8AQ8aNslImH+izWITGPTQmXeWNrWnn4z263z+q5Y2hzeD/suNlkzY6FSd00FRSCjOKGR
	 wxxPagubEjbTadDWm/HNom48G+VGIAvVFlG+PZ/huqaHUna/Rk/M6q+UId/PMHCzQ8fwQ
	 AWW83gmxwKQsUnHNU3nfUpj6nI9Qajwpjfy6NHIkBEX0RAg1uOJqITtdxSZnwf2u7z+mH
	 xDBo3zr5sgpKlEQUYuN77xSvdPOQAD9ojehwB4rTF25S3jL7ejZ5/+yEpy0kpxXFJPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020831;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yrxU/JJn2MA2oMFZ67k13g1KnGeI3lgz4FHH9M9yMXI=;
	b=4BZD1c3RWQsxh/h92rO4V3GLyo1lxDON8DRzwKrn7XK6wb7Y+TcgZ+eI/fMoTOFHDyeG
	 7T4ZiU5m6Z37eOLxwyjn+k1WcTmjikAolIjljZe3sgrwDPQF2eMCjCEfYTIohup0OiROU
	 Z7zf3e7+lUD6HHAzm/tfVWO8vZZvwod0Ng61FwTV5WYbAvPGKgOixApx/pylZwIWmek6S
	 7crtWe/CC4aKxonFxEJyOc3tBZaWIeJYEpa+ntb160C7YhVfGxrnWx63LhglmWXydqp5b
	 iJ0SOSs0lNfOkWMq6hocVQnaNJE2L4dXwzPEZCYN2Xw0hQUMPdrIETKnnLqh7Yp5JEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lsc7kGq4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50921606A31B;
	Mon, 26 Oct 2026 13:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lsc7kGq4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B61CD1F01825;
	Mon, 26 Oct 2026 13:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793020831;
	bh=yrxU/JJn2MA2oMFZ67k13g1KnGeI3lgz4FHH9M9yMXI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lsc7kGq45ESpG0qwmwtFlzhRFeEOakjT1DEvfGO1Oe7lzYbj5by4O1cs90CQFOVRq
	 UT03uP2paeNKuGuQbWrXBkDW5fdtcy30NZtdwPVbi/1ZotttbUjP6m0AAXewbKS/jk
	 4bTkMaKgLTEAcEtA72S+065yx4pW4UWK95LyIISFiM71/f7eUegHmTF8VZL95p1YLh
	 wjpT+Kx98Q+kaZVJizUl5+RUXDalSHvsMWcYrblzY13e46zX3QYcWzoYXJqQNTlXX3
	 SbZWKcsFtEAlciP7qilY/YSE/lmMtNw/mLwgzriCn8JBOvh4D51bFE37hcpuWXFry0
	 hfqxQ0EL8yORw==
Message-ID: <sashiko-outbox-185299@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] usb: dwc3: support two connectors sharing one HS
 data bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261026123211.243224-4-xiaqinghuan@mail.ustc.edu.cn>
References: <20261026123211.243224-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261026123211.243224-4-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 13:20:30 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] usb: dwc3: recursive spinlock deadlock on dwc->lock in dwc3_mux_ro=
le_set()
- [High] usb: dwc3: role mux unreachable without controller usb-role-switch=
 property
- [High] usb: dwc3: init race and missing mode cleanup in dwc3_role_mux_ini=
t()
- [High] usb: dwc3: SUSPHY not cleared in dwc3_set_prtcap() on same-role mu=
x switch
- [High] usb: dwc3: dwc3_mux_role_get() hides pending role on inactive port
- [Medium] usb: dwc3: fwnode_handle leak on error path in dwc3_role_mux_ini=
t()
- [Medium] usb: dwc3: broken and racy mux->error reporting in dwc3_mux_role=
_set()
- [Medium] usb: dwc3: missing dwc3_pre_set_role() call in dwc3_mux_role_set=
()
--

commit 39b70abd190f294a50ef9e95121a523aa5bca7ff
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

usb: dwc3: support two connectors sharing one HS data bus

This commit adds support for a single DWC3 controller servicing two
connectors that share a muxed High Speed data bus via a port-select GPIO.
It registers a separate usb_role_switch for each connector endpoint and
serializes role and data-path transitions through __dwc3_set_mode().

> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index fd5c2cd36c595..6607e65e8433d 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c

[ ... ]

> @@ -184,7 +189,8 @@ static void __dwc3_set_mode(struct work_struct *work)
>  	if (!desired_dr_role)
>  		goto out;
> =20
> -	if (desired_dr_role =3D=3D dwc->current_dr_role)
> +	if (desired_dr_role =3D=3D dwc->current_dr_role &&
> +	    (!mux || mux_port =3D=3D mux->active_port))
>  		goto out;
> =20
>  	if (desired_dr_role =3D=3D DWC3_GCTL_PRTCAP_OTG && dwc->edev)
> @@ -233,6 +239,27 @@ static void __dwc3_set_mode(struct work_struct *work)
>  		dwc3_writel(dwc, DWC3_GCTL, reg);
>  	}
> =20
> +	/*
> +	 * The previous host or gadget instance has been torn down above, so the
> +	 * shared High Speed data path can now be moved to the requesting
> +	 * connector.  A failure here must not abort the mode change half-way:
> +	 * the controller would be left with a torn-down role and a stale
> +	 * current_dr_role, which the next request would tear down a second tim=
e.
> +	 */
> +	if (mux && mux_port !=3D mux->active_port) {
> +		ret =3D gpiod_direction_output(mux->select, mux_port);
> +		if (ret) {
> +			WRITE_ONCE(mux->error, ret);
> +			dev_err_ratelimited(dwc->dev,
> +					    "failed to select USB port %d: %d\n",
> +					    mux_port, ret);
> +		} else {
> +			spin_lock_irqsave(&dwc->lock, flags);
> +			mux->active_port =3D mux_port;
> +			spin_unlock_irqrestore(&dwc->lock, flags);
> +		}
> +	}
> +
>  	spin_lock_irqsave(&dwc->lock, flags);
> =20
>  	dwc3_set_prtcap(dwc, desired_dr_role, false);

[Severity: High]
When switching between the two mux ports while keeping the same DRD role
(desired_dr_role =3D=3D dwc->current_dr_role and mux_port !=3D mux->active_=
port),
__dwc3_set_mode() tears down the previous role via dwc3_gadget_exit() or
dwc3_host_exit(), both of which call dwc3_enable_susphy(dwc, true) to set
GUSB3PIPECTL.SUSPENDENABLE and GUSB2PHYCFG.SUSPHY.

However, dwc3_set_prtcap() only clears SUSPHY when the PRTCAP mode actually
changes:

drivers/usb/dwc3/core.c:dwc3_set_prtcap() {
    ...
	hw_mode =3D DWC3_GHWPARAMS0_MODE(dwc->hwparams.hwparams0);
	if (hw_mode =3D=3D DWC3_GHWPARAMS0_MODE_DRD && !ignore_susphy) {
		if (DWC3_GCTL_PRTCAP(reg) !=3D mode)
			dwc3_enable_susphy(dwc, false);
	}
    ...
}

Because DWC3_GCTL_PRTCAP(reg) already equals mode during a same-role port
switch, dwc3_enable_susphy(dwc, false) is skipped, and __dwc3_set_mode()
proceeds to run dwc3_core_soft_reset() and dwc3_gadget_init() or
dwc3_host_init() with PHY suspend still enabled.  Won't leaving SUSPHY
enabled across soft reset and re-initialization cause PHY clock
synchronization and DCTL.CSFTRST timeouts on same-role connector switches?

> diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
> index f3e37d383627a..20821d6505114 100644
> --- a/drivers/usb/dwc3/drd.c
> +++ b/drivers/usb/dwc3/drd.c

[ ... ]

> @@ -501,10 +502,219 @@ static enum usb_role dwc3_usb_role_switch_get(stru=
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
> +	int selected, ret;
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
> +	/*
> +	 * Same asynchronous semantics as the single-connector role switch: the
> +	 * data path and the controller are reprogrammed from __dwc3_set_mode().
> +	 * dwc3_set_mode() only queues that work, so the mux lock may be held.
> +	 */
> +	dwc3_set_mode(dwc, dwc3_role_mux_mode(dwc, selected_role));

[Severity: High]
Doesn't calling dwc3_set_mode() while holding dwc->lock deadlock on the
first role switch request?

dwc3_mux_role_set() acquires spin_lock_irqsave(&dwc->lock, flags) above and
then calls dwc3_set_mode(), which acquires dwc->lock again:

drivers/usb/dwc3/core.c:dwc3_set_mode() {
	unsigned long flags;

	if (dwc->dr_mode !=3D USB_DR_MODE_OTG)
		return;

	spin_lock_irqsave(&dwc->lock, flags);
	dwc->desired_dr_role =3D mode;
	spin_unlock_irqrestore(&dwc->lock, flags);

	queue_work(system_freezable_wq, &dwc->drd_work);
}

[Severity: Medium]
Should dwc3_mux_role_set() also notify glue drivers via
dwc3_pre_set_role(dwc, selected_role) before calling dwc3_set_mode(), just
as dwc3_usb_role_switch_set() does?

Without dwc3_pre_set_role(), glue drivers implementing glue_ops->pre_set_ro=
le
(such as dwc3-qcom, dwc3-imx, and dwc3-imx8mp) will not update their VBUS
override or runtime PM autosuspend state when roles change through the mux.
Note that dwc3_pre_set_role() must be called outside dwc->lock because
dwc3_qcom_set_role_notifier() calls pm_runtime_resume_and_get().

> +	ret =3D mux->error;
> +	mux->error =3D 0;
> +	spin_unlock_irqrestore(&dwc->lock, flags);
> +	mutex_unlock(&mux->lock);
> +
> +	return ret;
> +}

[Severity: Medium]
Does returning a previous request's mux->error from dwc3_mux_role_set()
work as expected with usb_role_switch_set_role()?

In dwc3_mux_role_set(), port->role, mux->desired_port, and dwc3_set_mode()
have already been updated and queued for the new request, but if mux->error
was set by an earlier gpiod_direction_output() failure in __dwc3_set_mode(),
returning that non-zero value causes usb_role_switch_set_role() to treat
the newly queued transition as failed:

drivers/usb/roles/class.c:usb_role_switch_set_role() {
    ...
	ret =3D sw->set(sw, role);
	if (!ret) {
		sw->role =3D role;
		kobject_uevent(&sw->dev.kobj, KOBJ_CHANGE);
	}
    ...
}

In addition, because mux->error is a single field shared by both ports, an
asynchronous GPIO failure caused by one port is reported back to whichever
port happens to call usb_role_switch_set_role() next, and __dwc3_set_mode()
writes mux->error without holding dwc->lock or mux->lock, which can race
with the non-atomic read-and-clear here.

> +
> +static enum usb_role dwc3_mux_role_get(struct usb_role_switch *sw)
> +{
> +	struct dwc3_role_port *port =3D usb_role_switch_get_drvdata(sw);
> +	struct dwc3 *dwc =3D port->dwc;
> +	struct dwc3_role_mux *mux =3D dwc->role_mux;
> +	unsigned long flags;
> +	enum usb_role role =3D USB_ROLE_NONE;
> +
> +	/*
> +	 * A connector only reports its own role while it owns the shared data
> +	 * path, so the connector drivers never fight over the controller.
> +	 */
> +	spin_lock_irqsave(&dwc->lock, flags);
> +	if (mux->active_port =3D=3D port->state)
> +		role =3D port->role;
> +	spin_unlock_irqrestore(&dwc->lock, flags);
> +
> +	return role;
> +}

[Severity: High]
What happens when a connector driver queries usb_role_switch_get_role() on
disconnect while the other port owns the mux (or while __dwc3_set_mode() is
still queued)?

For example, if port 0 is active (mux->active_port =3D=3D 0) and port 1 con=
nects
and requests a role, dwc3_mux_role_set() records mux->ports[1].role and
assigns mux->ports[1].seq while mux->active_port remains 0.  If port 1 is
then unplugged before port 0, connector drivers that check the current role
before clearing it=E2=80=94such as cd321x_update_work() in
drivers/usb/typec/tipd/core.c:

drivers/usb/typec/tipd/core.c:cd321x_update_work() {
    ...
	enum usb_role old_role =3D usb_role_switch_get_role(tps->role_sw);
    ...
	if (old_role !=3D USB_ROLE_NONE && (new_role !=3D old_role || was_disconne=
cted))
		usb_role_switch_set_role(tps->role_sw, USB_ROLE_NONE);
    ...
	if (!new_connected)
		return;
}

will receive USB_ROLE_NONE from dwc3_mux_role_get() and skip calling
usb_role_switch_set_role(sw, USB_ROLE_NONE).  Won't that leave
mux->ports[1].role and mux->ports[1].seq permanently set to the unplugged
request, causing dwc3_role_mux_pick() to switch to the disconnected port 1
once port 0 disconnects and starve any subsequent connection on port 0?

> +
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

> +	fwnode_graph_for_each_endpoint(dev_fwnode(dwc->dev), ep) {
> +		if (!fwnode_property_present(ep, "usb-role-switch"))
> +			continue;
> +
> +		ret =3D fwnode_property_read_u32(ep, "mux-state", &state);
> +		if (ret || state >=3D ARRAY_SIZE(mux->ports)) {
> +			ret =3D -EINVAL;
> +			goto err_put_ep;
> +		}
> +		if (mux->ports[state].fwnode) {
> +			ret =3D -EINVAL;
> +			goto err_put_ep;
> +		}
> +
> +		mux->ports[state].fwnode =3D fwnode_handle_get(ep);
> +		mux->ports[state].state =3D state;
> +		mux->ports[state].dwc =3D dwc;
> +	}
> +
> +	for (i =3D 0; i < ARRAY_SIZE(mux->ports); i++) {
> +		if (!mux->ports[i].fwnode) {
> +			ret =3D -EINVAL;
> +			goto err;
> +		}
> +	}
> +
> +	dwc->role_mux =3D mux;

[Severity: Medium]
If the first endpoint succeeds and takes a reference via
mux->ports[state].fwnode =3D fwnode_handle_get(ep), but a subsequent endpoi=
nt
fails validation (or one of the ports is missing) before dwc->role_mux =3D =
mux
is assigned here, doesn't jumping to err_put_ep or err leak
mux->ports[state].fwnode because dwc3_role_mux_exit(dwc) sees
dwc->role_mux =3D=3D NULL and returns early?

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
> +	return 1;
> +
> +err:
> +	dwc3_role_mux_exit(dwc);
> +	dwc->role_mux =3D NULL;
> +	/* A mode request queued before the failure must not run on freed state=
. */
> +	cancel_work_sync(&dwc->drd_work);
> +	return ret;
> +err_put_ep:
> +	fwnode_handle_put(ep);
> +	goto err;
> +}

[Severity: High]
Can a connector driver request a role as soon as usb_role_switch_register()
publishes mux->ports[0].sw or mux->ports[1].sw, before dwc3_set_mode(dwc, m=
ode)
runs?

If a connector calls dwc3_mux_role_set() right after usb_role_switch_regist=
er()
returns, two problems can occur:

1. On the normal path, the unlocked dwc3_set_mode(dwc, mode) call here can
overwrite the connector's dwc->desired_dr_role back to the default mode whi=
le
port->role remains set to the connector's requested role.

2. On the error path (if registering ports[0].sw succeeds, port 0 queues
drd_work, and registering ports[1].sw fails), err sets dwc->role_mux =3D NU=
LL
before cancel_work_sync(&dwc->drd_work) (racing with __dwc3_set_mode()), and
if __dwc3_set_mode() already ran and initialized host or gadget mode via
dwc3_host_init() or dwc3_gadget_init(), dwc3_core_probe() jumps to
err_exit_debugfs without calling dwc3_core_exit_mode(), leaving the xHCI
device or gadget registered after probe fails.

> +
>  static int dwc3_setup_role_switch(struct dwc3 *dwc)
>  {
>  	struct usb_role_switch_desc dwc3_role_switch =3D {NULL};
>  	u32 mode;
> +	int ret;
> =20
>  	dwc->role_switch_default_mode =3D usb_get_role_switch_default_mode(dwc-=
>dev);
>  	if (dwc->role_switch_default_mode =3D=3D USB_DR_MODE_HOST) {
> @@ -513,6 +723,11 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
>  		dwc->role_switch_default_mode =3D USB_DR_MODE_PERIPHERAL;
>  		mode =3D DWC3_GCTL_PRTCAP_DEVICE;
>  	}
> +
> +	ret =3D dwc3_role_mux_init(dwc, mode);
> +	if (ret)
> +		return ret < 0 ? ret : 0;

[Severity: High]
How is dwc3_role_mux_init() reached when the Device Tree follows the
two-connector binding?

In Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml (and as chec=
ked
in dwc3_role_mux_init() above), when port-select-gpios is present, the
usb-role-switch property is placed on the child graph endpoints
(ports/port@0/endpoint@0 and endpoint@1) rather than on the controller node.

However, dwc3_setup_role_switch() is only called from dwc3_drd_init() when
the controller node itself has the usb-role-switch property:

drivers/usb/dwc3/drd.c:dwc3_drd_init() {
	if (ROLE_SWITCH &&
	    device_property_read_bool(dwc->dev, "usb-role-switch"))
		return dwc3_setup_role_switch(dwc);
    ...
}

And both dwc3_get_dr_mode() and dwc3_get_extcon() in drivers/usb/dwc3/core.c
likewise only check device_property_read_bool(dwc->dev, "usb-role-switch")
on the controller device (causing dwc3_get_dr_mode() to force dr_mode from
USB_DR_MODE_OTG to USB_DR_MODE_PERIPHERAL on DWC_usb3 >=3D 3.30a and
DWC_usb31/32).  Without top-level checks for port-select-gpios (or endpoint
usb-role-switch properties), won't dwc3_role_mux_init() be unreachable on
boards using a schema-compliant Device Tree?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026123211.2432=
24-1-xiaqinghuan@mail.ustc.edu.cn?part=3D3
