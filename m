Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792748257;
	b=ZJ0Phgi2Th8muo38wpXwOEqf7dXFSjAVRpoPTn0wOyVuB3y1fCK6sJCFmxxevVatBeB7
	 07vYgQ6OosAl3fzPL+jSyDYvWaKoCF327EySwRqZdiHIpLKGrstuhGWkr0jWjdIoBJZ9x
	 1WGA5wSEYLgd2v/FWvv71sjiQWqNxeKbRaTY3kIHwCK8qI7cbxQwF9xlRHbGA1F4iir30
	 D/b+WpqFonTDZBwoyg3lLIyaqYwVIB9ZnvVqDCRB/dFxo3au0XbQuwMHOGv+jRvaN5Xml
	 thrBdhM42GNSvEblaicRv8GJ+vlPpBZac+maX006UVf2bnyVg2yJz7fhIKC3K/glmSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792748257;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kUL1GVyU6+/VvOaChjuSO6g1Z2QxawNreJz56P3eXV8=;
	b=seCdcb/7uuWmYlL+IY76anTegCVFCZoNj/t99NA3lPE7leaCuGNaOx5/3MowhitXZM85
	 44BOh8uNMa+7V5iNAFtJvroW9d42bYd8UuDhe8a+Uk1Z1z92f+39SQhMSf61fo6YtPEjl
	 fdWSGlKarC/flYfgguOQGPux4x8hmmqzUTw/NTblpr6Jb9IV6ebyBPHY2J0NzvAJ4zKYw
	 Up+52nlvz+Ysfl4YgivDs2yFQme9j2AjbMZ99w3uGkRKzaHP1zndKmhxs/r02Uc7ooTWb
	 3YH+EqlpnF6nnbBmxn7KDkFOL/zvp+3lv7wIcBMRSmebnQd+eW5o87mMxVMHRqNr9jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eaq3HacV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B24F606A31A
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 09:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eaq3HacV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0FA11F01825;
	Fri, 23 Oct 2026 09:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792748257;
	bh=kUL1GVyU6+/VvOaChjuSO6g1Z2QxawNreJz56P3eXV8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eaq3HacV1UZtamcm8vN9/dCPTwAPfO091IR1wIotuNQn5nu/inYQ9KEOEaHI3apxi
	 0JJ1ZlMiEzeZhttJGU9ikfQLRF23trhIk0sMNPC8irFE+ZckcuNe5ASe6QQYv0uQHK
	 KVQ/R2gwwjZpXLxnQSozJnHx/JXS3WAGrAaU7QOcwP7pQDtslqFLwrg0JWlZ2FnDSz
	 BIAE/OvTAx6xr8CR5Zs2Yc3AhEmQrx0xly8pykmOdA3wK7HlfgCgBa1Z9LLVA1fREH
	 KtfpsMIphFoDCahFnV4IDwM23ff2XOxxeTKypvpk/8HNKOnCt9gLrthLxqCJVNDUyf
	 eHdaA+Fbmzp/A==
Message-ID: <sashiko-outbox-182609@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: dwc2: gadget: Restart the gadget when a new
 session follows a session end
Reply-To: sashiko-reviews@lists.linux.dev
To: "Olivier Louvignes" <olivier@mgcrea.io>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261023091832.6765-1-olivier@mgcrea.io>
References: <20261023091832.6765-1-olivier@mgcrea.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 09:37:36 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usb: dwc2: gadget: lx_state clobber skips dwc2_hsotg_session_start=
()
--

commit da705039966ae36f7cf570e450884a50dcb8e634
Author: Olivier Louvignes <olivier@mgcrea.io>

usb: dwc2: gadget: Restart the gadget when a new session follows a session =
end

This patch restarts the dwc2 gadget on a session request interrupt
(GINTSTS_SESSREQINT) when a prior B-session end left the controller in
DWC2_L3, allowing enumeration to succeed on cable replug when no external
VBUS notifier is present.

> diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
> index 9565e6a52725a..836f123d294e7 100644
> --- a/drivers/usb/dwc2/core_intr.c
> +++ b/drivers/usb/dwc2/core_intr.c
> @@ -322,6 +322,9 @@ static void dwc2_handle_session_req_intr(struct dwc2_=
hsotg *hsotg)
>  		 * established
>  		 */
>  		dwc2_hsotg_disconnect(hsotg);
> +
> +		/* Start again if a session end left the gadget in L3. */
> +		dwc2_hsotg_session_start(hsotg);
>  	} else {
>  		/* Turn on the port power bit. */
>  		hprt0 =3D dwc2_read_hprt0(hsotg);
> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index 102169b404196..8abae65a98387 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c
> @@ -4718,6 +4718,35 @@ static int dwc2_hsotg_pullup(struct usb_gadget *ga=
dget, int is_on)
>  	return ret;
>  }
> =20
> +/**
> + * dwc2_hsotg_session_start - start the gadget again for a new session
> + * @hsotg: The driver state
> + *
> + * A session end (the B-session going invalid, as when the cable is pull=
ed)
> + * disconnects the gadget and leaves it in L3. Unless something outside =
the
> + * controller reports VBUS through usb_gadget_vbus_connect(), nothing br=
ings
> + * it back: the next USB reset does not reinitialise a gadget that is not
> + * connected, and EP0 then refuses its setup request (-EAGAIN) at every
> + * enumeration. Start it again as dwc2_hsotg_vbus_session() would.
> + *
> + * Called with hsotg->lock held, when a new session is requested.
> + */
> +void dwc2_hsotg_session_start(struct dwc2_hsotg *hsotg)
> +{
> +	if (hsotg->lx_state !=3D DWC2_L3)
> +		return;
> +
> +	dev_dbg(hsotg->dev, "%s: new session after session end\n", __func__);
> +
> +	hsotg->op_state =3D OTG_STATE_B_PERIPHERAL;
> +	dwc2_hsotg_core_init_disconnected(hsotg, false);
> +	if (hsotg->enabled) {
> +		/* Enable ACG feature in device mode, if supported */
> +		dwc2_enable_acg(hsotg);
> +		dwc2_hsotg_core_connect(hsotg);
> +	}
> +}

[Severity: High]
What happens here if the controller entered bus suspend (partial power down
or gadget clock gating) before the previous session ended?

When a connected gadget sees bus inactivity before VBUS drops below the
B-session end threshold, GINTSTS_USBSUSP transitions the controller into
partial power down (setting hsotg->in_ppd =3D 1 and hsotg->lx_state =3D DWC=
2_L2
in dwc2_gadget_enter_partial_power_down()) or gadget clock gating (setting
hsotg->bus_suspended =3D true and hsotg->lx_state =3D DWC2_L2 in
dwc2_gadget_enter_clock_gating()).

When GOTGINT_SES_END_DET then fires in dwc2_handle_otg_intr(), it calls
dwc2_hsotg_disconnect(), which sets hsotg->connected =3D 0 and
hsotg->lx_state =3D DWC2_L3, while hsotg->in_ppd or hsotg->bus_suspended
remains set.

On replug, dwc2_handle_session_req_intr() runs:

drivers/usb/dwc2/core_intr.c:dwc2_handle_session_req_intr() {
	if (dwc2_is_device_mode(hsotg)) {
		if (hsotg->lx_state !=3D DWC2_L0) {
			if (hsotg->in_ppd) {
				ret =3D dwc2_exit_partial_power_down(hsotg, 0,
								   true);
				...
			}

			/* Exit gadget mode clock gating. */
			if (hsotg->params.power_down =3D=3D
			    DWC2_POWER_DOWN_PARAM_NONE && hsotg->bus_suspended &&
			    !hsotg->params.no_clock_gating)
				dwc2_gadget_exit_clock_gating(hsotg, 0);
		}

		dwc2_hsotg_disconnect(hsotg);

		/* Start again if a session end left the gadget in L3. */
		dwc2_hsotg_session_start(hsotg);
}

Both dwc2_exit_partial_power_down() -> dwc2_gadget_exit_partial_power_down()
and dwc2_gadget_exit_clock_gating() unconditionally set:

	hsotg->lx_state =3D DWC2_L0;

And because GOTGINT_SES_END_DET already cleared hsotg->connected to 0, the
subsequent call to dwc2_hsotg_disconnect() returns immediately at:

	if (!hsotg->connected)
		return;

without setting hsotg->lx_state back to DWC2_L3.

Won't dwc2_hsotg_session_start() then see hsotg->lx_state =3D=3D DWC2_L0 and
return early without reinitializing or reconnecting the gadget, leaving
hsotg->connected =3D=3D 0 (and, in the in_ppd case, leaving stale pre-disco=
nnect
register state restored in the hardware by dwc2_exit_partial_power_down()
without a subsequent core reset)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023091832.6765=
-1-olivier@mgcrea.io?part=3D1
