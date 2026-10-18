Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FA446F495
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 14:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792335290; cv=none; b=W6M1NF8P7SIf/Ut4IfyIzBXcQw8xJUv07Nx6DefkYKLYDbbKO9IOfHtMZ+/DtOE7dr8oHY+agySL4r9SJOshLIQi8T5I9mkENmbZEA81KCnkSX9TV74TWirFePDevX6YhpLF1qRqigMBO8g+gxWrbAiw+4ODKqIWiRpb+dsaPDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792335290; c=relaxed/simple;
	bh=x5Ui4SNF4TDS7pNQ9UzggxAsS/taTcP1vZY1T7/Q3TY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Pwaf+hn3ndfwdFGtipyGDYNBjK2ryg6NdP+I2OqWRqyhMt7hxlqE5DAqxu12o2LsWE5fT7yU9R2Z6rpfPmTQXGXrpMeH7bn6Lifb/4zBCvyhoy489d63/kpatzrDtbUUl1B3m0vQu8xEltXWc2WlVfh+SVWa4dL4NN81mlq3aDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WU/GZt7t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WU/GZt7t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC911F000C5;
	Sun, 18 Oct 2026 14:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792335288;
	bh=/G3Jx2OHcfkcGMlXu8ul9azdwrluVYJS3clb+hwS8Js=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WU/GZt7t5RzlyZaRtKtb4P4sYoCEpIbe6GHyZGhkl/rmIVBmNPvJwr/vKssbyAlnK
	 EUWi8Slssk9W/5OtsoI4nFaCmc3+v9pg0gUBnpUeaSpYNZnzqTfm+1V07UjL74O8By
	 gzPCHg5YNd7J64/ErmzEsBtkf0ssssgOaOaQEJCtsYMteJx6XnuYupxgaSY1euNlkA
	 nPu1UoqwGk0wXPeTmxhyz90LAEtwA31strizV2B5Sgky31gJTjy4jfzppkKZZiHmJr
	 u6yI1aqXwli53smzIkiCvNOd8Tsk0jNGkDAeLbbwNc+JxEioKNociq3MZUhJc0fJD5
	 pAze9xS156RkQ==
Message-ID: <sashiko-outbox-176222@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: dwc3: qcom: Defer VBUS override update during
 system suspend
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladyslav Tymoshchuk" <tvlad744@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261018143126.3978-1-tvlad744@gmail.com>
References: <20261018143126.3978-1-tvlad744@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 14:54:47 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] usb: dwc3: qcom: premature pm_suspended clear in dwc3_qcom_pm_resu=
me()
- [High] usb: dwc3: qcom: race between dwc3_qcom_set_role_notifier() and co=
re PM callbacks
- [Medium] usb: dwc3: qcom: role switch dropped or overwritten during syste=
m sleep
--

commit a81658c1fd87525e81eccc5d37bb7630d869a4d0
Author: Vladyslav Tymoshchuk <tvlad744@gmail.com>

usb: dwc3: qcom: Defer VBUS override update during system suspend

This patch serializes dwc3_qcom_set_role_notifier() against system suspend
and resume using a mutex and defers QSCRATCH VBUS override updates while
the glue is suspended for system sleep until dwc3_qcom_pm_resume() runs.

> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index ac68b4218b56b..2997479988c74 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
[ ... ]
> @@ -561,27 +567,40 @@ static int dwc3_qcom_setup_irq(struct dwc3_qcom *qc=
om, struct platform_device *p
>  static void dwc3_qcom_set_role_notifier(struct dwc3 *dwc, enum usb_role =
next_role)
>  {
>  	struct dwc3_qcom *qcom =3D to_dwc3_qcom(dwc);
> +	bool enable;
> +
> +	guard(mutex)(&qcom->role_lock);
> =20
>  	if (qcom->current_role =3D=3D next_role)
>  		return;
> =20
> +	enable =3D qcom->current_role !=3D USB_ROLE_DEVICE;
> +
> +	/*
> +	 * Not every caller of usb_role_switch_set_role() is frozen during
> +	 * system sleep, e.g. the UCSI connector work can run in the noirq
> +	 * resume phase. The glue clocks are off then and runtime PM can't
> +	 * turn them on, so leave QSCRATCH alone and let
> +	 * dwc3_qcom_pm_resume() apply the update.
> +	 */
> +	if (qcom->pm_suspended) {
> +		qcom->vbus_override_pending =3D true;
> +		qcom->vbus_override =3D enable;
> +		qcom->current_role =3D next_role;
> +		return;
> +	}
> +
>  	if (pm_runtime_resume_and_get(qcom->dev)) {
>  		dev_dbg(qcom->dev, "Failed to resume device\n");
>  		return;
>  	}

[Severity: Medium]
Can a role switch be dropped during system sleep when the PM core takes the
direct_complete path?

dwc3_qcom_dev_pm_ops wires up dwc3_qcom_prepare(), which calls
dwc3_pm_prepare() and returns 1 when the controller is runtime-suspended in
DWC3_GCTL_PRTCAP_DEVICE mode and has no pinctrl state. When no genpd
overrides .prepare and device_may_wakeup(dev) is false (for example, when
wakeup-source is not present or no gadget driver is bound), device_suspend()
takes the direct_complete path: it calls pm_runtime_disable(dev) while the
device is RPM_SUSPENDED and skips both dwc3_qcom_pm_suspend() and
dwc3_qcom_pm_resume().

In that state, qcom->pm_suspended remains false while runtime PM is disabled
and the glue clocks are off. If dwc3_qcom_set_role_notifier() runs during
system sleep, it sees qcom->pm_suspended =3D=3D false and calls
pm_runtime_resume_and_get(qcom->dev), which fails with -EACCES and returns
without updating qcom->current_role or recording the VBUS override update.

> =20
> -	if (qcom->current_role =3D=3D USB_ROLE_DEVICE)
> -		dwc3_qcom_vbus_override_enable(qcom, false);
> -	else if (qcom->current_role !=3D USB_ROLE_DEVICE)
> -		dwc3_qcom_vbus_override_enable(qcom, true);
> +	qcom->vbus_override_pending =3D false;
> +	dwc3_qcom_vbus_override_enable(qcom, enable);
> =20
>  	pm_runtime_mark_last_busy(qcom->dev);
>  	pm_runtime_put_sync(qcom->dev);
> =20
> -	/*
> -	 * Current role changes via usb_role_switch_set_role callback protected
> -	 * internally by mutex lock.
> -	 */
>  	qcom->current_role =3D next_role;
>  }
[ ... ]
> @@ -756,6 +779,8 @@ static int dwc3_qcom_pm_suspend(struct device *dev)
>  	if (ret)
>  		return ret;
> =20
> +	guard(mutex)(&qcom->role_lock);
> +
>  	ret =3D dwc3_qcom_suspend(qcom, wakeup);
>  	if (ret)
>  		return ret;

[Severity: High]
What happens if dwc3_qcom_set_role_notifier() runs while dwc3_pm_suspend()
is executing, before dwc3_qcom_pm_suspend() acquires qcom->role_lock and
sets qcom->pm_suspended =3D true?

If the device enters system suspend while already runtime-suspended
(RPM_SUSPENDED, qcom->is_suspended =3D=3D true) with direct_complete not us=
ed
(for example, when wakeup is enabled), dwc3_pm_suspend() ->
dwc3_suspend_common() sees pm_runtime_suspended(dwc->dev) in device mode
and returns 0 without suspending the gadget or exiting the core.

Because the PM core holds a runtime PM usage reference from device_prepare()
and only disables runtime PM later in device_suspend_late(), a concurrent
dwc3_qcom_set_role_notifier() running before guard(mutex)(&qcom->role_lock)
sees qcom->pm_suspended =3D=3D false and calls pm_runtime_resume_and_get().=
 That
invokes dwc3_qcom_runtime_resume(), turning on the glue clocks (setting
qcom->is_suspended =3D false) and resuming the DWC3 core, PHYs, and gadget =
via
dwc3_runtime_resume(), while the subsequent pm_runtime_put_sync() does not
suspend the device because the usage count is elevated.

dwc3_qcom_pm_suspend() then acquires qcom->role_lock and calls
dwc3_qcom_suspend(qcom, wakeup), which sees qcom->is_suspended =3D=3D false=
 and
disables the glue clocks and interconnects while the DWC3 core and PHYs
remain active.

Additionally, if the device was active in USB_ROLE_DEVICE and a role switch
to USB_ROLE_NONE runs during dwc3_pm_suspend() after dwc3_gadget_suspend(),
dwc3_qcom_set_role_notifier() sees qcom->pm_suspended =3D=3D false, clears
qcom->vbus_override_pending, and disables the VBUS override in QSCRATCH
immediately. On the subsequent dwc3_pm_resume(), dwc3_gadget_resume() ->
dwc3_qcom_run_stop_notifier(dwc, true) re-enables the VBUS override, and
dwc3_qcom_pm_resume() will not clear it because qcom->vbus_override_pending
is false.

> @@ -772,17 +797,29 @@ static int dwc3_qcom_pm_resume(struct device *dev)
>  	bool wakeup =3D device_may_wakeup(dev);
>  	int ret;
> =20
> -	ret =3D dwc3_qcom_resume(qcom, wakeup);
> -	if (ret)
> -		return ret;
> +	scoped_guard(mutex, &qcom->role_lock) {
> +		ret =3D dwc3_qcom_resume(qcom, wakeup);
> +		if (ret)
> +			return ret;
> =20
> -	qcom->pm_suspended =3D false;
> +		qcom->pm_suspended =3D false;
> +	}
> =20
>  	ret =3D dwc3_pm_resume(&qcom->dwc);
> -	if (ret)
> -		return ret;
> =20
> -	return 0;
> +	/*
> +	 * Apply a VBUS override update from a role switch that came in while
> +	 * suspended. Do it after the core has resumed, as resuming the gadget
> +	 * enables the override and the role switch is the more recent event.
> +	 */
> +	scoped_guard(mutex, &qcom->role_lock) {
> +		if (qcom->vbus_override_pending) {
> +			dwc3_qcom_vbus_override_enable(qcom, qcom->vbus_override);
> +			qcom->vbus_override_pending =3D false;
> +		}
> +	}
> +
> +	return ret;
>  }

[Severity: High]
Should qcom->pm_suspended =3D false be moved into the second scoped_guard()
block after dwc3_pm_resume(&qcom->dwc) completes?

By clearing qcom->pm_suspended and releasing qcom->role_lock before calling
dwc3_pm_resume(&qcom->dwc), a concurrent dwc3_qcom_set_role_notifier() call
that arrives while dwc3_pm_resume() is executing will see
qcom->pm_suspended =3D=3D false and take the active path instead of deferri=
ng
via qcom->vbus_override_pending:

1. If the device was in USB_ROLE_DEVICE and RPM_ACTIVE before suspend,
   pm_runtime_resume_and_get(qcom->dev) in dwc3_qcom_set_role_notifier()
   succeeds (rpm_resume() returns 1 while runtime PM is disabled in
   dwc3_pm_resume() because runtime_status and last_status are both
   RPM_ACTIVE). For a switch to USB_ROLE_NONE, dwc3_qcom_set_role_notifier()
   sets qcom->vbus_override_pending =3D false and disables the VBUS override
   in QSCRATCH. Moments later, dwc3_pm_resume() -> dwc3_resume_common() ->
   dwc3_gadget_resume() -> dwc3_gadget_soft_connect() ->
   dwc3_gadget_run_stop(dwc, true) -> dwc3_qcom_run_stop_notifier(dwc, true)
   calls dwc3_qcom_vbus_override_enable(qcom, true) without holding
   qcom->role_lock, racing on non-atomic QSCRATCH register accesses and
   re-enabling the VBUS override. When dwc3_qcom_pm_resume() reaches the
   second scoped_guard(), qcom->vbus_override_pending is false, leaving the
   VBUS override stuck enabled in QSCRATCH while qcom->current_role is
   USB_ROLE_NONE.

2. If the device was RPM_SUSPENDED before system suspend, inside
   dwc3_pm_resume():

   drivers/usb/dwc3/core.c:dwc3_pm_resume() {
       ...
       pm_runtime_disable(dev);
       ret =3D pm_runtime_set_active(dev);
       if (ret)
           goto out;

       ret =3D dwc3_resume_common(dwc, PMSG_RESUME);
       ...
   }

   pm_runtime_disable(dev) records dev->power.last_status =3D RPM_SUSPENDED,
   and pm_runtime_set_active(dev) updates runtime_status without changing
   last_status. When dwc3_qcom_set_role_notifier() calls
   pm_runtime_resume_and_get(qcom->dev) during this window, rpm_resume()
   returns -EACCES because disable_depth > 0 and last_status !=3D RPM_ACTIV=
E,
   dropping the role switch and VBUS override update.

3. If the device was RPM_SUSPENDED before system suspend and
   dwc3_qcom_set_role_notifier() runs after qcom->pm_suspended =3D false is
   set but before dwc3_pm_resume() calls pm_runtime_disable(dev),
   pm_runtime_resume_and_get(qcom->dev) will synchronously invoke
   dwc3_qcom_runtime_resume() -> dwc3_runtime_resume(&qcom->dwc)
   concurrently with dwc3_pm_resume(&qcom->dwc).

Keeping qcom->pm_suspended =3D true until the second scoped_guard() block
after dwc3_pm_resume(&qcom->dwc) finishes would ensure role switches during
dwc3_pm_resume() are also deferred and applied once the core has resumed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018143126.3978=
-1-tvlad744@gmail.com?part=3D1
