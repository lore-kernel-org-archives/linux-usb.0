Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987828;
	b=lfYqTO3TCLU7ji8agx0OQ0FRsSta4b8NCzjapkcIxN++H7W4I/LL89aXOd3V5XYOV6uL
	 0U6B60wb2/QK/RHJxo6Ve6KcbeNNk8r2yGnC9FDfbY8Nd8HKmlMlQf0FayxPML95iD6qJ
	 Wy/g6kWDPDfDrjQVohwY1loHkMFvf3AYxZzWggS+1MXvnrkycokznMBDwOzaiJkkPsMQ5
	 Pqi0bkkRIhtjkdwWApbAmFZKXfdgt3XtBqdauxmYvjphuPrmJbFzb28X7R6jj2p0tosh/
	 aiqqM+em281znA5uXTod4s9hzlAj8lTC4Mi5lHZsNHm6yN9QY+xuqoR+6rt71re/4Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987828;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=S678m0R0Wgo2vjSeU7tzbGlDeQOxQ+zC82Fm+uPn7/k=;
	b=I38eHo6FEJB+rfjRx/eUTISa/0lOtMlvUrkcDftixuorPt1vAodHhRr7hQT6cltfwJwC
	 ifo9+OcPhfIOEeDSrYu+5Q0z6JMK2ZPFp214kYTcRq9BHbU5CubEiI4G8/lVY8HNCj+oL
	 CRuibr0B9LjOuGVCNIx6DavMhi3yBI3rQhfuyuRR4Tc/koDjJcmbDJlMbUb42TY+4Yc3L
	 s4sRm72dYmOKc4uyfZ33b5FscW5UR9PDS4sIvXXHUt8kzYvXFiAshdLRKScmY1gDC3RVn
	 jJfUld5TvzDoYlOdVwm7Vs7dY/czl+rD21PMO4y4RKMGvFIHAleYGhzU9Hcj/P9SONg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="dmf3OT/C";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A206606A329
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 17:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dmf3OT/C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D232D1F0089F;
	Fri,  6 Nov 2026 17:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793987828;
	bh=S678m0R0Wgo2vjSeU7tzbGlDeQOxQ+zC82Fm+uPn7/k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dmf3OT/CyG0+6A6VMicu37nbw9d3vOSXbZF3zwnInf4QlmShyv8L5DzEszTBPVAv0
	 V0mcuPdr1fuoLxfO5f5rDJ3TQHPE81JYBSBbbYkoIPeKwmnslLCgJUaII3EbpMM/bW
	 /fGper595Nj/+htTDMqBpgJAQYOQSPkLr8IGLE2xVUdthN8XAV2hKnHB1UmjNURedx
	 aw7RAzb7aEcR0DX99CErQSimvC/yx6D6cXyXMRHQBne8stwrdAwyELDMctSJSC9VeC
	 QqiU/cVVQs+YDwjE77AdB18OEQbeEyFG1TIq1IUz3wFZuoT3bVqQo7qo5XJZ2l8xXq
	 XzNrYpZcaBbTg==
Message-ID: <sashiko-outbox-201979@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/6] usb: dwc2: hcd: don't disable/enable external
 vbus by system suspend/resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-dwc2-low-power-fixes-stm32-v3-5-68d2a0e9bab6@foss.st.com>
References: <20261106-dwc2-low-power-fixes-stm32-v3-0-68d2a0e9bab6@foss.st.com>
 <20261106-dwc2-low-power-fixes-stm32-v3-5-68d2a0e9bab6@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 17:57:07 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] usb: dwc2: _dwc2_hcd_resume() overwrites ret and drops
  power-down exit errors
- [Medium] usb: dwc2: hcd: unbalanced vbus_supply enable count in
  dwc2_vbus_supply_restore()
- [Medium] usb: dwc2: unbalanced regulator disable on _dwc2_hcd_resume()
  error
--

commit 2a0c5651a5a725562a5298484a61afb5e8674602
Author: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

usb: dwc2: hcd: don't disable/enable external vbus by system suspend/resume

This commit stops disabling the external VBUS supply in _dwc2_hcd_suspend()
and replaces the unconditional dwc2_vbus_supply_init() in
_dwc2_hcd_resume() with dwc2_vbus_supply_restore() to avoid unbalanced
regulator enable counts across system suspend and resume.

> diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
> index cae9d7e13d47d..54e3b5698642f 100644
> --- a/drivers/usb/dwc2/hcd.c
> +++ b/drivers/usb/dwc2/hcd.c
> @@ -147,6 +147,20 @@ static int dwc2_vbus_supply_exit(struct dwc2_hsotg *=
hsotg)
>  	return 0;
>  }
> =20
> +static int dwc2_vbus_supply_restore(struct dwc2_hsotg *hsotg)
> +{
> +	int ret;
> +
> +	if (!hsotg->vbus_supply)
> +		return 0;
> +
> +	ret =3D regulator_is_enabled(hsotg->vbus_supply);
> +	if (!ret)
> +		return regulator_enable(hsotg->vbus_supply);
> +
> +	return ret < 0 ? ret : 0;
> +}

[Severity: Medium]
Can checking regulator_is_enabled() here desynchronize the consumer enable
count on hsotg->vbus_supply from HPRT0_PWR?

The driver tracks whether this consumer enabled hsotg->vbus_supply via
HPRT0_PWR, calling dwc2_vbus_supply_exit() in _dwc2_hcd_stop() and
ClearPortFeature(USB_PORT_FEAT_POWER) whenever HPRT0_PWR is set.
regulator_is_enabled() queries the physical or shared regulator state rather
than this consumer handle's enable_count, returning 1 for always-on
regulators, regulators without an is_enabled() op, or regulators kept on by
another consumer.

If port power was cleared via ClearPortFeature(USB_PORT_FEAT_POWER) before
suspend, hsotg->vbus_supply has enable_count =3D=3D 0.  When _dwc2_hcd_resu=
me()
takes the HPRT0_CONNSTS =3D=3D 0 path, dwc2_vbus_supply_restore() sees
regulator_is_enabled() > 0 and skips regulator_enable(), while
_dwc2_hcd_resume() still sets HPRT0_PWR.  A later _dwc2_hcd_stop() then sees
HPRT0_PWR set and calls regulator_disable() with enable_count =3D=3D 0,
triggering a kernel warning.  Conversely, if hsotg->vbus_supply remained
enabled across suspend but the physical regulator output dropped so
is_enabled() returns 0, regulator_enable() increments enable_count to 2 and
leaks a reference.

[ ... ]

> @@ -4500,9 +4510,14 @@ static int _dwc2_hcd_resume(struct usb_hcd *hcd)
>  		spin_lock_irqsave(&hsotg->lock, flags);
>  	}
> =20
> -	/* Enable external vbus supply after resuming the port. */
>  	spin_unlock_irqrestore(&hsotg->lock, flags);
> -	dwc2_vbus_supply_init(hsotg);
> +	/*
> +	 * Restore external vbus supply after resuming the port.
> +	 * Keeps vbus_supply in sync with HPRT0_PWR set here after.
> +	 */
> +	ret =3D dwc2_vbus_supply_restore(hsotg);

[Severity: Medium]
Does assigning to ret here overwrite an earlier error from
dwc2_exit_partial_power_down() or dwc2_exit_hibernation()?

Those calls store their failure in ret so _dwc2_hcd_resume() can return it
at the end of the function.  When dwc2_vbus_supply_restore() succeeds, ret
is reset to 0 and the controller resume failure is hidden from
hcd_bus_resume().

> +	if (ret)
> +		return ret;

[Severity: Medium]
If dwc2_vbus_supply_restore() fails and returns early here, can HPRT0_PWR
remain set while hsotg->vbus_supply is still disabled?

Earlier in _dwc2_hcd_resume(), dwc2_hcd_reinit() -> dwc2_core_host_init()
(in the DWC2_POWER_DOWN_PARAM_NONE path) and dwc2_exit_hibernation() ->
dwc2_host_exit_hibernation() already set HPRT0_PWR in HPRT0.  Returning
without clearing HPRT0_PWR leaves it out of sync with hsotg->vbus_supply, so
a subsequent _dwc2_hcd_stop() or ClearPortFeature(USB_PORT_FEAT_POWER) sees
HPRT0_PWR set and calls dwc2_vbus_supply_exit(), causing an unbalanced
regulator_disable().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-dwc2-low-p=
ower-fixes-stm32-v3-0-68d2a0e9bab6@foss.st.com?part=3D5
