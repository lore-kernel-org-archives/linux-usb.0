Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793954929;
	b=BD/ZiXKLe2VXAuvkhPU0OwH7kfIvO9lsANw7trbx96CPVNGYzA6C7K9goctDB6Bgtl7t
	 2yyPZ+KpQpTkLwDJpEHIO6zf33HmJ7Q2VOJykZWhdrKYyof7b5sn/kGm33jgTNGaHy1t+
	 QmgS1bgFdY4lIxJL1kbiZfKzBwm50CkIT+j1f2EDdweBJWPIVeBWADju3bV2kxuofc+FO
	 rYygLD9LTf/8cZR26R8RMhVnEiCcaCOmq6MuXFeT6sZtFQSr2GTa/Pm6mVKt4Se4mhL/U
	 vAKVB1Hm1oRSStR07HEFKlwLaafcxN9iQ3KTuZe+HKDo8DfL+R44zabqxTnet3yoT3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793954929;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7q7MnvWEnGcX41XHa+pTWvOl61VfVGVeya0hMBQW9Qw=;
	b=uPBWJjeV+OgOkwyedjRX7dU9yRgJnUKwHhMeOlOZRUn6MaDhlOMwILDU6lwAGgMKfgLy
	 PhP/fYKPI+1B/hZ5IIGh4O1JgA6F/yXwmDkyYOoQNQbiMadlBKZ6PRGpGTidgCX8aCzjS
	 yl94SVgcqk6QMM1Am3DDrTttX/tzKNXaB6q2egAAsWbH7Eoq4vfNUDUQLP5ztNmSn4nKF
	 izxuWX+GioD/+9Kmggxx7OhDz3yckWa9QPsxRFUO/hSagp93WPoxNne7TEYqGXRwISxzX
	 9rcs5XZ5ItzU9LvzOKwSnJwF78aoZEmjcGCpoMNi+LryBQfI9rh0ZMTponiYjcmaoYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LI+2jXAv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3BF606A328
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 08:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LI+2jXAv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BF911F0089F;
	Fri,  6 Nov 2026 08:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793954928;
	bh=7q7MnvWEnGcX41XHa+pTWvOl61VfVGVeya0hMBQW9Qw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LI+2jXAvx16yM9U6xZJcFpIiRnI4UB2Vu6Xchf8l7t9kvE+mQ8fpZBWieOt3drcL/
	 EPW2tO0pn4m5JdiLH+Wm/DsnObbHDywUpG/DER6VYPhnN1514mDSymQQx9IwSqy1na
	 VFppdDB+zCdgclOB+h2j8rcbAokAycDY+g6e2uFnd7pAUIlMexsxCH2l4EH0tWUQxI
	 NNHsyiVEJPSYvPIT6Y0ZJxNYv5hXFv9UkQw14gQTY9BY5+Ro7Jyl7lPdhvlxRyyAIU
	 xswn1wLnZ0NuyptwGeN4VmbpzCDPiD06SWLgBfNPAmxj90OZ5TVYM4AUgnZz5/gDSA
	 ax5CGXME1Xm0w==
Message-ID: <sashiko-outbox-201088@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] usb: dwc3: qcom: pass live SS-link state into PHY
 at suspend entry
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tapas Rana" <tapas.rana@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, linux-usb@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261106082716.128968-4-tapas.rana@oss.qualcomm.com>
References: <20261106082716.128968-1-tapas.rana@oss.qualcomm.com>
 <20261106082716.128968-4-tapas.rana@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 08:48:47 +0000
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
- [High] usb: dwc3: qcom: phy_set_mode_ext() called after PHY runtime
  suspend
- [Medium] usb: dwc3: qcom: dwc3_qcom_read_ss_state() broken when
  CONFIG_USB=3Dm
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [High] usb: dwc3: qcom: NULL pointer dereference in
  dwc3_qcom_read_usb2_speed() [1]
--

commit 98eee22a6981ce3ef452cc8f9ec999a2bf823513
Author: Tapas Rana <tapas.rana@oss.qualcomm.com>

usb: dwc3: qcom: pass live SS-link state into PHY at suspend entry

This commit adds dwc3_qcom_read_ss_state() to check whether a SuperSpeed
device is attached on each port's USB3 roothub and passes that state to
phy_set_mode_ext() during dwc3_qcom_suspend().

> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index ac68b4218b56b..d4ba095e47eb0 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
[ ... ]
> @@ -251,6 +253,34 @@ static enum usb_device_speed dwc3_qcom_read_usb2_spe=
ed(struct dwc3_qcom *qcom, i
>  	return udev->speed;
>  }
> =20
> +static enum qcom_usb_ss_state dwc3_qcom_read_ss_state(struct dwc3_qcom *=
qcom, int port_index)
> +{
> +	struct usb_device *udev;
> +	struct usb_hcd __maybe_unused *hcd, *usb3_hcd;
> +	struct dwc3 *dwc =3D &qcom->dwc;
> +
> +	/*
> +	 * FIXME: Fix this layering violation.
> +	 */
> +	hcd =3D platform_get_drvdata(dwc->xhci);
> +	if (!hcd)
> +		return QCOM_USB_SS_ABSENT;

[Severity: High]
This problem wasn't introduced by this patch, but can
dwc3_qcom_read_usb2_speed() hit a NULL pointer dereference on hcd
[1] if the xHCI driver fails to probe?

dwc3_host_init() assigns dwc->xhci before platform_device_add(), and
platform_device_add() succeeds even if driver binding fails, leaving
dwc->xhci non-NULL with NULL drvdata.  During suspend,
dwc3_qcom_is_host() sees dwc->xhci and calls dwc3_qcom_read_usb2_speed()
right before dwc3_qcom_read_ss_state(), which dereferences
hcd->self.root_hub without the !hcd check added here:

drivers/usb/dwc3/dwc3-qcom.c:dwc3_qcom_read_usb2_speed() {
	...
	hcd =3D platform_get_drvdata(dwc->xhci);

#ifdef CONFIG_USB
	udev =3D usb_hub_find_child(hcd->self.root_hub, port_index + 1);
	...
}

> +
> +#ifdef CONFIG_USB
> +	usb3_hcd =3D hcd->shared_hcd ? hcd->shared_hcd : hcd;
> +	if (!usb3_hcd->self.root_hub)
> +		return QCOM_USB_SS_ABSENT;
> +
> +	udev =3D usb_hub_find_child(usb3_hcd->self.root_hub, port_index + 1);
> +#else
> +	udev =3D NULL;
> +#endif
> +	if (!udev)
> +		return QCOM_USB_SS_ABSENT;

[Severity: Medium]
Does #ifdef CONFIG_USB compile out the roothub lookup when CONFIG_USB=3Dm?
Because USB is a tristate Kconfig symbol, modular builds define
CONFIG_USB_MODULE rather than CONFIG_USB, so dwc3_qcom_read_ss_state()
always takes the #else branch and returns QCOM_USB_SS_ABSENT even when a
SuperSpeed device is attached.  Should this use IS_REACHABLE(CONFIG_USB)
or IS_ENABLED(CONFIG_USB)?

[ ... ]
> @@ -359,8 +389,12 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom,=
 bool wakeup)
>  	 * freezable workqueue.
>  	 */
>  	if (dwc3_qcom_is_host(qcom) && wakeup) {
> -		for (i =3D 0; i < qcom->num_ports; i++)
> +		for (i =3D 0; i < qcom->num_ports; i++) {
>  			qcom->ports[i].usb2_speed =3D dwc3_qcom_read_usb2_speed(qcom, i);
> +			qcom->ports[i].ss_state =3D dwc3_qcom_read_ss_state(qcom, i);
> +			phy_set_mode_ext(qcom->dwc.usb3_generic_phy[i], PHY_MODE_USB_HOST,
> +					 qcom->ports[i].ss_state);
> +		}
>  		dwc3_qcom_enable_interrupts(qcom);
>  	}

[Severity: High]
Isn't phy_set_mode_ext() called here after the USB3 PHY has already
entered runtime suspend?

Both dwc3_qcom_pm_suspend() and dwc3_qcom_runtime_suspend() call
dwc3_pm_suspend() or dwc3_runtime_suspend() before dwc3_qcom_suspend():

drivers/usb/dwc3/dwc3-qcom.c:dwc3_qcom_runtime_suspend() {
	...
	ret =3D dwc3_runtime_suspend(&qcom->dwc);
	if (ret)
		return ret;

	return dwc3_qcom_suspend(qcom, true);
}

Inside dwc3_suspend_common(), phy_pm_runtime_put_sync() drops the
runtime PM reference on dwc->usb3_generic_phy[i], which schedules
qmp_combo_runtime_suspend() on the parent QMP combo PHY device while
dwc3_qcom_suspend() sleeps in clk_bulk_disable_unprepare() and
dwc3_qcom_interconnect_disable().

Because qmp_combo_usb_set_mode() only records qmp->ss_state in memory and
QPHY_PCS_AUTONOMOUS_MODE_CTRL is programmed in
qmp_combo_runtime_suspend() -> qmp_combo_enable_autonomous_mode() before
the PHY clocks are disabled, updating ss_state here happens after the
PHY has already programmed autonomous mode with QCOM_USB_SS_UNKNOWN (or
the previous cycle's state).

[1] https://sashiko.dev/#/bug/linux-14f73483-dc6c-4250-802a-9e0e3203cc91

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106082716.1289=
68-1-tapas.rana@oss.qualcomm.com?part=3D3
