Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794377909;
	b=DAOb3k9oAQrgMC765dRCzMQXNcfO0kedvB6cY90zKvW87VLBIhNpuIrxBtdgK3a1BiRr
	 3RlmmC8C6cij8Gh/6jcdthyjM0DKi23y+RWqHs+nxs0t0ZyMLtClIdondDDs1cSAcVS5R
	 wYRSPRQnf1SUg3CM0X0xr3QkstaExSMOTPALsLq5lcifoEWzjBwPgBfNAYlpkz20WsKIm
	 98pIAnB9RrSp1Pu251KbQqGomfVtFb0RApLFKpvgvb2aX9d+7stWCvQrP+TrPkh3mGKzI
	 PyqAVmy6XG7A518SIkdjBdCqV63qom+fVcT9pyXPkYWP3wlSExyqDF9Ht+hPLjb/DgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794377909;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=g+EgA92RD8lf/tQvU/wD2Vz3QapfQJCxOtGu9IipmlY=;
	b=PNP5eHJ9xEUoDPW1k7rCULO+P7l/hmJuyx5nkQSDhy06fZfP2qnk6PXfU2Snx5zeOQsk
	 8CCF8ycl/WCjHTXu53TAGcY77xpD2L9g/GpQZV3K+g1dS3L4P79lhCJ7QR8YGbGv+hQG0
	 L61xe6mn60Y5a8+BLQhktu/n8M2J8KHRYVbHYfStkz+IxV5VyXejs42fdz0mRNPnCL2Zz
	 DfPzdXdxFgU82MNlEMAAczNAGPTtLkCJbQ63gNrd20KE0BYgjPcevYjKuIAb+401YHa92
	 J/QvDw/lVv8uWLefIX0EgB54kL3wzVrokiz9ZCwzBQnwCeKzd0fZXRH3Ky7YEF4SvgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NXcD9vdt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A653606A32D
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 06:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NXcD9vdt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ADA41F00A07;
	Wed, 11 Nov 2026 06:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794377909;
	bh=g+EgA92RD8lf/tQvU/wD2Vz3QapfQJCxOtGu9IipmlY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NXcD9vdtnMe7oHL04Llw4A0G5sLMeLV8wr47kFMuHrptarsdi9LQlN3aV0ayp5zSZ
	 5dEyjFszRKzbSSbnVX03Oo7QDQzr/ClaD6z5jo7FD/okAgfyR8AAMRIDjeSYRfCaLh
	 q6anvLiMyvuTpt9JzeXapwPHxD+JtJ4q6hPfLlwj0zP5Z/lZ+wqYdu8B+iKlZfFMlN
	 BuBTyYfW0nPejhhMrRhM4dhhfEMun0hD3h6VLl628heTtzwhk2Nj571C8tp6tRei92
	 bFwk2xjacrH7ojdagyvoK1YX/ABEcGAq/LAerjCmyUK6jpv0XHJnXL6v19bJPYqglY
	 0fm0iH/UxgwoA==
Message-ID: <sashiko-outbox-208425@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] usb: dwc2: Add USB DRD support on CV1800 series
 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Inochi Amaoto" <inochiama@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261111055628.183891-4-inochiama@gmail.com>
References: <20261111055628.183891-1-inochiama@gmail.com>
 <20261111055628.183891-4-inochiama@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 06:18:28 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] usb: dwc2: BVALOVAL cleared in host mode in
  dwc2_ovr_init()/dwc2_ovr_avalid()
--

commit 5b3a06c8f6671fc6eef64472919667bd9e08400a
Author: Inochi Amaoto <inochiama@gmail.com>

usb: dwc2: Add USB DRD support on CV1800 series SoC

This commit adds a force_bvalid_in_host quirk parameter and enables it on
CV1800 series SoCs so that GOTGCTL_BVALOVAL remains set in host mode to
avoid a persistent Session End Detected interrupt storm.

> diff --git a/drivers/usb/dwc2/drd.c b/drivers/usb/dwc2/drd.c
> index 3dc194657e821..3df63c0b88d80 100644
> --- a/drivers/usb/dwc2/drd.c
> +++ b/drivers/usb/dwc2/drd.c
> @@ -28,10 +28,13 @@ static void dwc2_ovr_init(struct dwc2_hsotg *hsotg)
>  	gotgctl =3D dwc2_readl(hsotg, GOTGCTL);
>  	dwc2_ovr_gotgctl(gotgctl);
>  	gotgctl &=3D ~(GOTGCTL_BVALOVAL | GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL);
> -	if (hsotg->role_sw_default_mode =3D=3D USB_DR_MODE_HOST)
> +	if (hsotg->role_sw_default_mode =3D=3D USB_DR_MODE_HOST) {
>  		gotgctl |=3D GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL;
> -	else if (hsotg->role_sw_default_mode =3D=3D USB_DR_MODE_PERIPHERAL)
> +		if (hsotg->params.force_bvalid_in_host)
> +			gotgctl |=3D GOTGCTL_BVALOVAL;
> +	} else if (hsotg->role_sw_default_mode =3D=3D USB_DR_MODE_PERIPHERAL) {
>  		gotgctl |=3D GOTGCTL_BVALOVAL | GOTGCTL_VBVALOVAL;
> +	}
>  	dwc2_writel(hsotg, gotgctl, GOTGCTL);
> =20
>  	spin_unlock_irqrestore(&hsotg->lock, flags);
> @@ -45,18 +48,26 @@ static int dwc2_ovr_avalid(struct dwc2_hsotg *hsotg, =
bool valid)
>  	u32 gotgctl =3D dwc2_readl(hsotg, GOTGCTL);
> =20
>  	/* Check if A-Session is already in the right state */
> -	if ((valid && (gotgctl & GOTGCTL_ASESVLD)) ||
> +	if ((valid && (gotgctl & GOTGCTL_ASESVLD) &&
> +	     (!hsotg->params.force_bvalid_in_host ||
> +	      (dwc2_is_host_mode(hsotg) && (gotgctl & GOTGCTL_BVALOVAL) &&
> +	       (gotgctl & GOTGCTL_AVALOVAL)))) ||
>  	    (!valid && !(gotgctl & GOTGCTL_ASESVLD)))
>  		return -EALREADY;
> =20
>  	/* Always enable overrides to handle the resume case */
>  	dwc2_ovr_gotgctl(gotgctl);
> =20
> -	gotgctl &=3D ~GOTGCTL_BVALOVAL;
> -	if (valid)
> +	if (valid) {
>  		gotgctl |=3D GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL;
> -	else
> -		gotgctl &=3D ~(GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL);
> +		if (hsotg->params.force_bvalid_in_host)
> +			gotgctl |=3D GOTGCTL_BVALOVAL;
> +		else
> +			gotgctl &=3D ~GOTGCTL_BVALOVAL;
> +	} else {
> +		gotgctl &=3D ~(GOTGCTL_BVALOVAL | GOTGCTL_AVALOVAL |
> +			     GOTGCTL_VBVALOVAL);
> +	}
>  	dwc2_writel(hsotg, gotgctl, GOTGCTL);
> =20
>  	return 0;

[Severity: High]
Can dwc2_ovr_avalid(hsotg, false) and dwc2_ovr_init() still clear
GOTGCTL_BVALOVAL while the controller is in host mode, triggering the
GOTGINT_SES_END_DET interrupt storm this patch aims to prevent?

When switching from USB_ROLE_HOST to USB_ROLE_NONE, dwc2_drd_role_sw_set()
calls dwc2_ovr_avalid(hsotg, false) and drops hsotg->lock before
dwc2_force_mode() switches the controller out of host mode:

drivers/usb/dwc2/drd.c:dwc2_drd_role_sw_set() {
	...
		} else {
			dwc2_ovr_avalid(hsotg, false);
		}
	}

	spin_unlock_irqrestore(&hsotg->lock, flags);

	if (!already && hsotg->dr_mode =3D=3D USB_DR_MODE_OTG)
		/* This will raise a Connector ID Status Change Interrupt */
		dwc2_force_mode(hsotg, role =3D=3D USB_ROLE_HOST);
}

Because dwc2_ovr_avalid(hsotg, false) clears GOTGCTL_BVALOVAL while the
controller is still in host mode, interrupts are re-enabled at
spin_unlock_irqrestore() before dwc2_force_mode() switches to device mode
(and if dr_mode is USB_DR_MODE_HOST, dwc2_force_mode() is not called at
all).

Similarly, dwc2_ovr_init() forces host mode at the end of the function
whenever hsotg->dr_mode =3D=3D USB_DR_MODE_HOST or hsotg->role_sw_default_m=
ode
=3D=3D USB_DR_MODE_HOST, but only sets GOTGCTL_BVALOVAL when
role_sw_default_mode =3D=3D USB_DR_MODE_HOST. If dr_mode is USB_DR_MODE_HOST
and role_sw_default_mode is not, dwc2_ovr_init() enters host mode with
GOTGCTL_BVALOVAL cleared.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111055628.1838=
91-1-inochiama@gmail.com?part=3D3
