Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794893860;
	b=rxkJI2jpiXyoxkONalfm1Hu6jx9DScKzrH0VA3aT+YEmI3It3FJ6dhZTloBxldEzpYR6
	 rgtKRXWw6qKZeaffadVHyLXKRgaL41rFg+Czr+qF/DDzeGz4j3oWgXHhHO60CzmgQC3v8
	 WRLJKo6EAkpMERCBP2mpphu/6kVT7UHhioqQL71BofKkyOoqfFR7GxBC1tE9kY0rTnqG/
	 OF5yoeK4KPYLmJLz005Y61k9LWZD+d0vmQ84Z+oYqvfMDxdEL0d6GDH7JUc8PagWGC4IQ
	 6+01bGODaZ2RNZ2xOn5g+NAqKrMrPJCcwXo73qznZ7/hpPh4HXQa70r6WExnvgUbg1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794893860;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2fHyqSQEU0LVysgAlcuPFpGoPC4RtsPoQCQfkKxFkd8=;
	b=AK57r0YsXvAtEC1FnKF9k8yZiVmjxVxO7zlGMDh4Py662KRs7T+8OcOM+4vveJs1Dqie
	 JYbjXW8BLlRzshRi024u9stP7o2pJerauDZKRqankZFCLeKssoDTOJ3h2ltkmyi+EmSVX
	 KpJK5ChlxlEBCQuaiM4FXKV98TAXG5o7GKl1u4qlNbnwgS4GbLaLo3DLVCK1uNlR/pKhr
	 4PITUw9WYJDhSASyKDRMJ6hTmdUJQqps5QTRTvtRbdPe+/sXp0he8m4A3lHXg+NMVgcW5
	 anJKQCrihN/jtpmUlxeIcZEEzqiyHpdrEMfEjBHwkZ3ji3553cvsIyIWSX7x9EZGOjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X1ePo1bL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404DE606A31C;
	Tue, 17 Nov 2026 05:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X1ePo1bL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A571F000C4;
	Tue, 17 Nov 2026 05:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794893859;
	bh=2fHyqSQEU0LVysgAlcuPFpGoPC4RtsPoQCQfkKxFkd8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X1ePo1bL/vUM1mCEkdyFT8PkV1eK0QEDAiW8wHpk7d11fRLFVjXiLWPMaEl9wPFLD
	 iR4Mxt2xqMIwrBnBagvhJjEtjs1yKrHXN51weKouO8QI2+u86z67+AduP1egwKZdoV
	 ohpk7ph6OJvTjJkQoIwnrzB8ORLKEVHCdgTHbhXQa0dRMvFRwRwNiVUAZoJD2tn+i/
	 evmQ43Wd8tsfRC3csin1B/XUzP+8YMNIdioEJEYB+toa7Ww82/2zaGnRxIqb2DwrLH
	 XZ4W0FhHJL5bos7UTKIWRbncOYi+yEUBTKgzWN5SiN2iWb4lglGcVpmJZ/nK7+EqYy
	 RNwrjDQ99yAzw==
Message-ID: <sashiko-outbox-218216@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 3/3] usb: dwc3: select the shared HS data bus with a
 mux controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117052137.32833-4-xiaqinghuan@mail.ustc.edu.cn>
References: <20261117052137.32833-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261117052137.32833-4-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 05:37:39 +0000
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
- [High] usb: dwc3: unbalanced mux_control_deselect() in
  __dwc3_set_mode()
- [High] usb: dwc3: missing mux_control_deselect() on teardown in
  dwc3_drd_exit()
--

commit 39e198f2d73c2b8bec2fad2df66d23ccb21f5a72
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

usb: dwc3: select the shared HS data bus with a mux controller

This commit adds support for switching a shared High Speed USB data bus
between two connectors using a mux controller and per-connector USB role
switches.

> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index fd5c2cd36c595..fe8e97d0398b1 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c

[ ... ]

> @@ -233,8 +246,47 @@ static void __dwc3_set_mode(struct work_struct *work)
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
> +	if (port_switch) {
> +		/*
> +		 * mux_control_select() sleeps while waiting for the controller, so
> +		 * the switch is only done here, in the mode worker.  The mux is kept
> +		 * selected between switches: dwc3 is its only consumer and always
> +		 * drives one of the two connectors.
> +		 */
> +		mux_control_deselect(mux->ctrl);
> +		ret =3D mux_control_select(mux->ctrl, mux_port);
> +		if (ret)
> +			dev_err_ratelimited(dwc->dev,
> +					    "failed to select USB port %d: %d\n",
> +					    mux_port, ret);
> +
> +		spin_lock_irqsave(&dwc->lock, flags);
> +		if (ret)
> +			mux->ports[mux_port].errors++;
> +		else
> +			mux->active_port =3D mux_port;
> +		spin_unlock_irqrestore(&dwc->lock, flags);
> +	}

[Severity: High]
Does calling mux_control_deselect(mux->ctrl) unconditionally here cause an
unbalanced deselect on the initial mode switch?

dwc3_role_mux_init() initializes mux->active_port to -1 without selecting
mux->ctrl.  When __dwc3_set_mode() runs for the initial mode request,
port_switch is true and mux_control_deselect() runs on an unselected mux,
driving idle_state without holding mux->ctrl->lock and calling up() on its
already-unlocked semaphore.

Also, if mux_control_select() fails after deselecting a previously active
port, mux->active_port keeps the old port index even though no port is
selected, so a subsequent switch either calls mux_control_deselect() again
on the deselected mux or skips mux_control_select() when switching back to
the old port.  Only call mux_control_deselect() when mux->active_port >=3D =
0,
and reset mux->active_port to -1 when mux_control_select() fails.

> diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
> index f3e37d383627a..b6ca11e4c7b17 100644
> --- a/drivers/usb/dwc3/drd.c
> +++ b/drivers/usb/dwc3/drd.c

[ ... ]

> @@ -597,6 +888,7 @@ void dwc3_drd_exit(struct dwc3 *dwc)
>  {
>  	unsigned long flags;
> =20
> +	dwc3_role_mux_exit(dwc);
>  	if (dwc->role_sw)
>  		usb_role_switch_unregister(dwc->role_sw);

[Severity: High]
Does dwc3_drd_exit() leave mux->ctrl selected when the driver is unbound or
removed?

__dwc3_set_mode() keeps mux->ctrl selected while a port is active, and
devm_mux_control_get() only calls mux_control_put() on release without
deselecting it.  After cancel_work_sync(&dwc->drd_work) and role teardown in
dwc3_drd_exit(), mux_control_deselect(mux->ctrl) is never called when
mux->active_port >=3D 0, leaving the mux idle state unrestored and
mux->ctrl->lock held so a later re-probe or mux consumer blocks in
mux_control_select().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117052137.3283=
3-1-xiaqinghuan@mail.ustc.edu.cn?part=3D3
