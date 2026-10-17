Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DDB2D1F7B;
	Sat, 17 Oct 2026 08:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792226174; cv=none; b=ukms3MHLO+Bb6FE0MBAnbHrQhIgv1FQAMu6oYyATksZApnqc25OYFp/dP0bC5J3rScNL6O3MRscBpEbAbPTnADPiW1cfPx8DTeoSgW81iLgKe0rXtEa/fUXkZucvkf5q7JzltbDs8R3+mJFgui3vVdKy4NucZihCAuHsr46uodA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792226174; c=relaxed/simple;
	bh=bYGpXjLUH4KS9OLbia+mlVnVeZ2TUVAG+VFQXBMLXk4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=k5Ct7vD0k+jI0L2L8ocf13f9+3eqgwzigFfys7f04TBoOyhub5g1VZAsmCAwD22Epb1dkAv5W5txEhp5VTFGoAtyADDy7IWnorviJiXOaOvhijWPQSZTf7o8gvIMauOlspsOr1zBxUEBP/PeSGMH1LfukWy8pnP+3STRTbondLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZVOBm7cp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZVOBm7cp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35CDD1F000C4;
	Sat, 17 Oct 2026 08:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792226172;
	bh=dY1Gw9zF5AVsIqFIZIMkjf2AMHASwNCzf52pPYdvKa4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZVOBm7cpVrhHeqdVSvuZWnCDc2zgOjm+f8HCFZ3sRsaKEbZYM8SHaz9SVOh5yrrMO
	 G76h7BkJPOHnG/qeE12WSSPazbly0L83U+7i9OWkrHSh1p9/BQLFV5+uvjkJao5b8U
	 mGhHL/ynBSx3X6IMM+yhrpXKu5Bc1zbubCSVA/9f8s/wMWLGJsRgcJl+bJxK9AV8mQ
	 7qxLWWkrZmNkVsblWJ/6HlGBXz/DAk6+yPbZE2DWgqtYyOuhT/tc9ow9kb+qcQ/d9A
	 g4+2K6KMxDgTkom6+JUk1tAPQceUBo5zX/C8ZzOeqn80lTXI/19mRcRYifySCKUZBb
	 ywZErmaspK3Lw==
Message-ID: <sashiko-outbox-175396@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] usb: dwc3: support two connectors sharing one HS
 data bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>, linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261017081320.220525-3-xiaqinghuan@mail.ustc.edu.cn>
References: <20261017081320.220525-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261017081320.220525-3-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 08:36:11 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [Critical] usb: dwc3: uncanceled drd_work on error in dwc3_role_mux_init()
- [High] usb: dwc3: unlocked dwc3_set_mode() race in dwc3_mux_role_set()
- [High] usb: dwc3: role swap overwrites port stamp in dwc3_mux_role_set()
- [High] usb: dwc3: registering role switches on endpoint fwnodes breaks lo=
okup
- [Medium] usb: dwc3: fwnode reference leak on error in dwc3_role_mux_init()
- [Medium] usb: dwc3: unread error and desired_role fields in dwc3_role_mux
- [Medium] usb: dwc3: missing dwc3_pre_set_role() call in dwc3_mux_role_set=
()
--

commit 5d2d5ebbc56e4b5ec53011cd4401439a8ee2fdcf
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

usb: dwc3: support two connectors sharing one HS data bus

This patch adds support for DWC3 controllers where two USB connectors share=
 a
single High Speed data bus switched via a port-select GPIO. It registers a
usb_role_switch per connector endpoint, arbitrates requests between the two
switches, and flips the GPIO in __dwc3_set_mode() after tearing down the
previous role.

> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index fd5c2cd36c595..6607e65e8433d 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c

[ ... ]

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

[Severity: Medium]
In struct dwc3_role_mux (in drivers/usb/dwc3/core.h), desired_role and error
are documented as:

 * @desired_role: role requested by the connector that currently wins
 * @desired_port: index of that connector
 * @active_port: index of the connector currently driving the data lines
 * @error: sticky data-path switch error, reported to the role-switch users

In __dwc3_set_mode(), GPIO failures are stored via WRITE_ONCE(mux->error, r=
et),
and dwc3_mux_role_set() stores mux->desired_role =3D selected_role before
returning 0, but neither mux->error nor mux->desired_role is ever read
anywhere in the driver. Additionally, when gpiod_direction_output() fails,
__dwc3_set_mode() leaves mux->active_port on the previous connector while
proceeding to initialize desired_dr_role for mux_port.

Were mux->error and mux->desired_role intended to be read and reported back=
 to
the role-switch callers, or are they unused state?

> diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
> index f3e37d383627a..49104779600be 100644
> --- a/drivers/usb/dwc3/drd.c
> +++ b/drivers/usb/dwc3/drd.c
> @@ -8,6 +8,7 @@
>   */
> =20
>  #include <linux/extcon.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
> @@ -501,10 +502,199 @@ static enum usb_role dwc3_usb_role_switch_get(stru=
ct usb_role_switch *sw)
>  	return role;
>  }
> =20
> +/*
> + * Index of the connector that should own the shared data path: the olde=
st
> + * pending request wins, and the last selection is kept when neither con=
nector
> + * requests a role.
> + */
> +static int dwc3_role_mux_pick(struct dwc3_role_mux *mux)
> +{
> +	int sel =3D mux->desired_port;
> +	int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(mux->ports); i++) {
> +		if (mux->ports[i].role =3D=3D USB_ROLE_NONE)
> +			continue;
> +		if (mux->ports[sel].role =3D=3D USB_ROLE_NONE ||
> +		    time_before(mux->ports[i].stamp, mux->ports[sel].stamp))
> +			sel =3D i;
> +	}
> +
> +	return sel;
> +}
> +
> +static u32 dwc3_role_mux_mode(struct dwc3 *dwc, enum usb_role role)
> +{
> +	if (role =3D=3D USB_ROLE_HOST)
> +		return DWC3_GCTL_PRTCAP_HOST;
> +	if (role =3D=3D USB_ROLE_DEVICE)
> +		return DWC3_GCTL_PRTCAP_DEVICE;
> +	if (dwc->role_switch_default_mode =3D=3D USB_DR_MODE_HOST)
> +		return DWC3_GCTL_PRTCAP_HOST;
> +
> +	return DWC3_GCTL_PRTCAP_DEVICE;
> +}
> +
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
> +	mutex_lock(&mux->lock);
> +	spin_lock_irqsave(&dwc->lock, flags);
> +	if (role !=3D port->role && role !=3D USB_ROLE_NONE)
> +		port->stamp =3D jiffies;

[Severity: High]
When an already-active connector performs an in-place role swap (such as a =
USB
PD Data Role Swap between USB_ROLE_DEVICE and USB_ROLE_HOST without
disconnecting), won't updating port->stamp here cause it to lose ownership =
of
the shared HS data bus to the other connector?

If port 0 connects at t0 and port 1 connects later at t1 > t0, port 0 retai=
ns
the mux because time_before(t0, t1) is true in dwc3_role_mux_pick(). If por=
t 0
then swaps directly between DEVICE and HOST at t2 > t1, role !=3D port->rol=
e is
true, so port 0's stamp is overwritten with t2. dwc3_role_mux_pick() then s=
ees
time_before(t1, t2) and switches the data path away from port 0 to port 1
mid-session. Also, if a connection stays active longer than MAX_LONG jiffie=
s,
time_before() will wrap around.

Should port->stamp only be updated when transitioning out of USB_ROLE_NONE
(port->role =3D=3D USB_ROLE_NONE && role !=3D USB_ROLE_NONE)?

> +	port->role =3D role;
> +	selected =3D dwc3_role_mux_pick(mux);
> +	mux->desired_port =3D selected;
> +	selected_role =3D mux->ports[selected].role;
> +	mux->desired_role =3D selected_role;
> +	spin_unlock_irqrestore(&dwc->lock, flags);
> +	mutex_unlock(&mux->lock);
> +
> +	/*
> +	 * Same asynchronous semantics as the single-connector role switch: the
> +	 * data path and the controller are reprogrammed from __dwc3_set_mode().
> +	 */
> +	dwc3_set_mode(dwc, dwc3_role_mux_mode(dwc, selected_role));

[Severity: High]
Can releasing mux->lock and dwc->lock before calling dwc3_set_mode() desync=
hronize
mux->desired_port and dwc->desired_dr_role when both connectors change roles
concurrently?

Each port has its own struct usb_role_switch with a separate sw->lock mutex,
so two threads can enter dwc3_mux_role_set() in parallel:

Thread A (port 0)                      Thread B (port 1)
-----------------                      -----------------
mutex_lock(&mux->lock)
spin_lock_irqsave(&dwc->lock)
mux->desired_port =3D 0
selected_role =3D HOST
spin_unlock_irqrestore(&dwc->lock)
mutex_unlock(&mux->lock)
                                       mutex_lock(&mux->lock)
                                       spin_lock_irqsave(&dwc->lock)
                                       mux->desired_port =3D 1
                                       selected_role =3D DEVICE
                                       spin_unlock_irqrestore(&dwc->lock)
                                       mutex_unlock(&mux->lock)
                                       dwc3_set_mode(dwc, PRTCAP_DEVICE)
dwc3_set_mode(dwc, PRTCAP_HOST)

When __dwc3_set_mode() runs, it snapshots both fields under dwc->lock:

	spin_lock_irqsave(&dwc->lock, flags);
	desired_dr_role =3D dwc->desired_dr_role;
	if (mux)
		mux_port =3D mux->desired_port;
	spin_unlock_irqrestore(&dwc->lock, flags);

In the interleaving above (or if __dwc3_set_mode() runs between updating
mux->desired_port in dwc3_mux_role_set() and updating dwc->desired_dr_role =
in
dwc3_set_mode()), __dwc3_set_mode() switches the HS GPIO mux to port 1 while
programming the controller role for port 0.

[Severity: Medium]
Also in dwc3_mux_role_set(), should this path call
dwc3_pre_set_role(dwc, selected_role) before dwc3_set_mode() like the
single-connector dwc3_usb_role_switch_set() does?

	dwc3_pre_set_role(dwc, role);
	dwc3_set_mode(dwc, mode);

Without dwc3_pre_set_role(), glue drivers implementing glue_ops->pre_set_ro=
le
(such as dwc3-imx, dwc3-imx8mp, and dwc3-qcom) will not be notified of role
changes when port-select-gpios is used.

> +
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
> +	struct usb_role_switch_desc desc =3D {};
> +	struct dwc3_role_mux *mux;
> +	struct fwnode_handle *ep;
> +	struct gpio_desc *select;
> +	char name[64];
> +	u32 state;
> +	int ret, i;
> +
> +	select =3D devm_gpiod_get_optional(dwc->dev, "port-select", GPIOD_ASIS);
> +	if (IS_ERR(select))
> +		return PTR_ERR(select);
> +	if (!select)
> +		return 0;
> +
> +	mux =3D devm_kzalloc(dwc->dev, sizeof(*mux), GFP_KERNEL);
> +	if (!mux)
> +		return -ENOMEM;
> +
> +	ret =3D gpiod_get_value_cansleep(select);
> +	if (ret < 0)
> +		return ret;
> +
> +	mux->select =3D select;
> +	mux->desired_port =3D ret;
> +	mux->active_port =3D -1;
> +	mutex_init(&mux->lock);
> +
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

[Severity: Medium]
Does dwc3_role_mux_init() leak the mux->ports[].fwnode references if an err=
or
occurs before dwc->role_mux =3D mux is assigned?

In the endpoint loop above, each valid endpoint has its reference count
incremented with mux->ports[state].fwnode =3D fwnode_handle_get(ep). If a l=
ater
endpoint jumps to err_put_ep, or if the check for !mux->ports[i].fwnode jum=
ps
to err, dwc->role_mux is still NULL. In dwc3_role_mux_exit(dwc):

	struct dwc3_role_mux *mux =3D dwc->role_mux;
	...
	if (!mux)
		return;

it returns early without calling fwnode_handle_put() on the previously
populated mux->ports[].fwnode entries.

> +
> +	dwc->role_mux =3D mux;
> +	dwc3_set_mode(dwc, mode);
> +
> +	for (i =3D 0; i < ARRAY_SIZE(mux->ports); i++) {
> +		snprintf(name, sizeof(name), "%s-port%u", dev_name(dwc->dev), i);
> +		desc.name =3D name;
> +		desc.fwnode =3D mux->ports[i].fwnode;
> +		desc.set =3D dwc3_mux_role_set;
> +		desc.get =3D dwc3_mux_role_get;
> +		desc.driver_data =3D &mux->ports[i];
> +		mux->ports[i].sw =3D usb_role_switch_register(dwc->dev, &desc);

[Severity: High]
Will connector drivers be able to look up these role switches via
usb_role_switch_get() or fwnode_usb_role_switch_get() when desc.fwnode is s=
et
to the endpoint fwnode mux->ports[i].fwnode?

When a connector driver calls usb_role_switch_get() or
fwnode_usb_role_switch_get(), fwnode_connection_find_match() walks the OF
graph via fwnode_graph_devcon_matches():

	fwnode_graph_for_each_endpoint(fwnode, ep) {
		node =3D fwnode_graph_get_remote_port_parent(ep);
		if (!fwnode_device_is_available(node)) {
			fwnode_handle_put(node);
			continue;
		}

		ret =3D match(node, con_id, data);

fwnode_graph_get_remote_port_parent(ep) resolves to the parent DWC3 device
fwnode (dev_fwnode(dwc->dev)), not the remote endpoint fwnode. Then
usb_role_switch_match() checks dev_fwnode(dwc->dev):

	if (id && !fwnode_property_present(fwnode, id))
		return NULL;

	dev =3D class_find_device_by_fwnode(&role_class, fwnode);

	return dev ? to_role_switch(dev) : ERR_PTR(-EPROBE_DEFER);

Because dwc3_drd_init() requires "usb-role-switch" to be present on
dev_fwnode(dwc->dev) in order to call dwc3_setup_role_switch(),
fwnode_property_present(dev_fwnode(dwc->dev), "usb-role-switch") is true,
while class_find_device_by_fwnode(&role_class, dev_fwnode(dwc->dev)) returns
NULL because the switches were registered on the endpoint fwnodes instead.
Won't every consumer lookup return ERR_PTR(-EPROBE_DEFER) indefinitely?

> +		if (IS_ERR(mux->ports[i].sw)) {
> +			ret =3D PTR_ERR(mux->ports[i].sw);
> +			mux->ports[i].sw =3D NULL;
> +			goto err;
> +		}
> +	}
> +
> +	return 1;
> +
> +err:
> +	dwc3_role_mux_exit(dwc);
> +	dwc->role_mux =3D NULL;
> +	return ret;

[Severity: Critical]
If usb_role_switch_register() fails and jumps to err, can the queued
dwc->drd_work cause a use-after-free?

dwc3_set_mode(dwc, mode) is called before the registration loop, queueing
dwc->drd_work (__dwc3_set_mode) on system_freezable_wq. In addition, if por=
t 0
registers and port 1 fails, a consumer on port 0 could call
dwc3_mux_role_set() and queue dwc->drd_work before port 0 is unregistered.

The err path calls dwc3_role_mux_exit(dwc) and sets dwc->role_mux =3D NULL
without cancelling dwc->drd_work or tearing down any role already started by
__dwc3_set_mode(). When the error propagates out of dwc3_drd_init() ->
dwc3_core_init_mode() to dwc3_core_probe(), probe failure disables clocks a=
nd
frees the devm-managed mux and dwc while __dwc3_set_mode() may still be
running or pending.

Should dwc3_set_mode(dwc, mode) be deferred until after both switches are
successfully registered, and should the error path cancel dwc->drd_work if =
any
switch was registered?

> +err_put_ep:
> +	fwnode_handle_put(ep);
> +	goto err;
> +}

[ ... ]

>
>
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261017081320.2205=
25-1-xiaqinghuan@mail.ustc.edu.cn?part=3D2
