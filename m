Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24E04E433E;
	Tue, 13 Oct 2026 11:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889379; cv=none; b=Sqjz2B+iKqUe/c0AtPfeEdbsXaqia0CekIkLGgiyyKTxJXcijooKZRGPm2wYzZr7djd00gZK8zlYq6uJn1fxfyKo43SBa2XSLUjbdO2yVgykVvXfkaqPY1+IKcYkj8MEu7YFkcYG7zIAoPeDvomjuLlVs65tFLkvE/ukYwcaIKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889379; c=relaxed/simple;
	bh=khZy8G+ddVaAT3HvhrjDcU+keeqnhSYGZ9XC9Lp0t9U=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=eXC4cqXTgkl2vPRp2c8w2OCUPgwVNweEcTHsDCYwlSO1c3udIVOVGqkLc8VA5CvG8fr4c6a2RLY4DkDhGR7rAmPTDGxzeYx4mGc2emriKfSDXicY+ksKHvhcWb4Bole1qdpcNRKDySeBFUOj19lSfrgagG6lp+AoH4WjkaDpyHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WG+enJqi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WG+enJqi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 420DC1F000FF;
	Tue, 13 Oct 2026 11:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791889376;
	bh=idGREc6NDyEeeJGqLze0dq+b6mawm4228d+0QxdBOf8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WG+enJqiyobqPxyYJnuqgByU/T+/5k7QwwtBWEOl/GuMxpnyWHJoKgSQ0EJVsncV9
	 pJannoJlLrpGtslmB8aPg8WzTBnMsnkl63uaLQLzJf1xOtqS2awJRF0SxAbrmXaR9g
	 srmPyLJo48mf9lJrzzSgv4tlV6ZDNDFDdrM7hk0e7WOSadUT4W1iL9NLLFrEQQ0v9d
	 uyfGLLBuB2FO6RRmVDVkWvBpUX2BGATd4VNOytjs2HTrn03fJMbcS1QuCZR7bOFS2n
	 FLPYXgJQWJcTnlbg0Ux6rWcG0S8C5mDZz3R7ZwnPT9xkKEJqHrjtsq8H+Aq37Cn482
	 2i9Hne4jmXqjg==
Message-ID: <sashiko-outbox-169577@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] usb: dwc3: support two connectors sharing one HS
 data bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>, linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261013102927.1141696-4-xiaqinghuan@mail.ustc.edu.cn>
References: <20261013102927.1141696-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261013102927.1141696-4-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 11:02:55 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] pm: Unbalanced pm_runtime_put_autosuspend on error path in __dwc3_=
set_mode
- [High] usb: dwc3: Double-free/UAF of gadget/host resources on GPIO failur=
e in __dwc3_set_mode
- [High] usb: dwc3: deadlock during suspend due to flush_work() on freezabl=
e wq
- [Medium] usb: dwc3: Role selection logic implements static priority, cont=
radicting "oldest wins" design
--

commit e9f771770a6e130d4f1859d1ec3e53526b8f1f97
Author: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
Subject: usb: dwc3: support two connectors sharing one HS data bus

This commit introduces support for a single DWC3 controller to drive two
receptacles by muxing the High Speed data lines. It registers one USB role
switch per connector and serializes requests using a mutex, intending to
grant the role to the oldest connector.

> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index fd5c2cd36c595..76e9e5d1808f0 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -174,8 +178,15 @@ static void __dwc3_set_mode(struct work_struct *work)
>  	mutex_lock(&dwc->mutex);
>  	spin_lock_irqsave(&dwc->lock, flags);
>  	desired_dr_role =3D dwc->desired_dr_role;
> +	if (mux) {
> +		mux_port =3D mux->desired_port;
> +		mux_role =3D mux->desired_role;
> +	}
>  	spin_unlock_irqrestore(&dwc->lock, flags);
> =20
> +	if (mux && READ_ONCE(mux->error))
> +		goto out;

[Severity: High]
If this early error check evaluates to true, it jumps to the out label
before pm_runtime_get_sync() is called. The out label then unconditionally
calls pm_runtime_put_autosuspend().=20

Does this drop a Runtime PM reference that was never acquired, potentially
underflowing the usage count and powering down hardware that is still
actively in use?

> +
>  	pm_runtime_get_sync(dwc->dev);
> =20
>  	if (dwc->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_OTG)

[ ... ]

> @@ -233,6 +245,22 @@ static void __dwc3_set_mode(struct work_struct *work)
>  		dwc3_writel(dwc, DWC3_GCTL, reg);
>  	}
> =20
> +	/*
> +	 * The previous host/gadget has been torn down above, so it is safe to
> +	 * move the shared HS data path to the requesting connector.
> +	 */
> +	if (mux && mux_port !=3D mux->active_port) {
> +		ret =3D gpiod_direction_output(mux->select, mux_port);
> +		if (ret) {
> +			WRITE_ONCE(mux->error, ret);
> +			goto out;

[Severity: High]
When gpiod_direction_output() fails, this jumps to the out label after
tearing down the current role, but before dwc3_set_prtcap() is called to
update dwc->current_dr_role.

During subsequent role switches or driver removal, will dwc->current_dr_role
still evaluate to the old role? If so, this could cause dwc3_gadget_exit()
or dwc3_host_exit() to execute a second time, resulting in a double-free of
setup buffers or a use-after-free on device structures.

> +		}
> +
> +		spin_lock_irqsave(&dwc->lock, flags);

[ ... ]

> diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
> index f3e37d383627a..4bf0497e902a7 100644
> --- a/drivers/usb/dwc3/drd.c
> +++ b/drivers/usb/dwc3/drd.c
> @@ -501,10 +502,178 @@ static enum usb_role dwc3_usb_role_switch_get(stru=
ct usb_role_switch *sw)
>  	return role;
>  }
> =20
> +static int dwc3_mux_role_set(struct usb_role_switch *sw, enum usb_role r=
ole)
> +{
> +	struct dwc3_role_port *port =3D usb_role_switch_get_drvdata(sw);
> +	struct dwc3 *dwc =3D port->dwc;
> +	struct dwc3_role_mux *mux =3D dwc->role_mux;
> +	enum usb_role selected_role;
> +	unsigned long flags;
> +	int selected, ret;
> +	u32 mode;
> +
> +	if (role < USB_ROLE_NONE || role > USB_ROLE_DEVICE)
> +		return -EINVAL;
> +
> +	mutex_lock(&mux->lock);
> +	if (mux->stopping) {
> +		ret =3D -ESHUTDOWN;
> +		goto out;
> +	}
> +	if (READ_ONCE(mux->error)) {
> +		ret =3D READ_ONCE(mux->error);
> +		goto out;
> +	}
> +
> +	port->role =3D role;
> +	if (mux->ports[0].role !=3D USB_ROLE_NONE)
> +		selected =3D 0;
> +	else if (mux->ports[1].role !=3D USB_ROLE_NONE)
> +		selected =3D 1;

[Severity: Medium]
The commit message states that "requests from the two switches are
serialised by a mutex, the oldest connector holding a role wins".

However, this static conditional structure seems to prioritize port 0.
If port 1 is the oldest connector actively holding a role, and port 0
subsequently requests a role, won't this check evaluate port 0 first?
Setting selected =3D 0 here appears to abruptly preempt port 1 and give
the role to the newer connector, breaking the intended arbitration logic.

> +	else
> +		selected =3D mux->desired_port;
> +	selected_role =3D mux->ports[selected].role;
> +	if (selected =3D=3D mux->desired_port && selected_role =3D=3D mux->desi=
red_role) {
> +		ret =3D 0;
> +		goto out;
> +	}
> +
> +	if (selected_role =3D=3D USB_ROLE_HOST ||
> +	    (selected_role =3D=3D USB_ROLE_NONE &&
> +	     dwc->role_switch_default_mode =3D=3D USB_DR_MODE_HOST))
> +		mode =3D DWC3_GCTL_PRTCAP_HOST;
> +	else
> +		mode =3D DWC3_GCTL_PRTCAP_DEVICE;
> +
> +	spin_lock_irqsave(&dwc->lock, flags);
> +	mux->desired_port =3D selected;
> +	mux->desired_role =3D selected_role;
> +	dwc->desired_dr_role =3D mode;
> +	spin_unlock_irqrestore(&dwc->lock, flags);
> +	queue_work(system_freezable_wq, &dwc->drd_work);
> +	flush_work(&dwc->drd_work);

[Severity: High]
This code queues drd_work on system_freezable_wq and synchronously blocks
on it using flush_work().

Since role switch events can be triggered from non-freezable contexts
(such as ucsi_handle_connector_change running on a non-freezable workqueue),
what happens if a role switch occurs during system suspend after freezable
workqueues have been frozen?

Could flush_work() block indefinitely since drd_work cannot run, leading to
a complete system suspend deadlock?

> +	ret =3D READ_ONCE(mux->error);
> +out:
> +	mutex_unlock(&mux->lock);
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013102927.1141=
696-1-xiaqinghuan@mail.ustc.edu.cn?part=3D3
