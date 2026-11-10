Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794295674;
	b=Zt/U7CGpMd0KO3qcXU74X2GCLMubKGiuzl/EucH4qoUOkie5tYC6zcrxmIG8oOzYXLRL
	 lGXl/MACK4UBqoLzv+Hes1vUhKti5FbW41hbKMEvpvY0ABHVFTY3Sqhkiu7Et1PSUjTR9
	 mRNIkc+H/kLuK/UqLevVK66cOKhuwj5AQSYMe2k66CjQFRwru9CRQEhQgIR/YJ4dtHvfF
	 GPj7nkl1VIQGEiFT3AvJFXNRUqooz+BmD/baRqm9iy2rxnzV2sW5ErChqshAQpjdZ/czQ
	 1bU0BrN3p1POW7Q4t/jhp+e9XuShxjc8vUAD3863ZjRj1XjmOV6eXJGMmc8HueBdcmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295674;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wDq35aBZBm9qWXTpCL7gSCH1BSKE1E0Naxdnc5m2JpE=;
	b=BDoq/UZfLrNB1PfvGtZD/ykf4FOeSUWyNkwmiHeNzvpR5GBuVn8roGE4TT1hI/8ta1v6
	 E3jXi5fEBLu6ACFK+haoVhcXY4rDhNXiqaYzXmpy9/oUO+VTh4VfMFiTZmNvLrcrROI6s
	 WSbZF6DQAjj7XFrDHmR/NTUDE1aInoTtnxEd0atL+4gz0WZ0q94HIXqbzbmuYb5qos7KC
	 wpfYaIWL4PAaRvIpRrnog9HrYU6GEHvXQuwdoyx6Uzsaygi+qEQfOWYim1At0O5AMQnbw
	 vqsg/iS8dSpk7q5uBjzBC7eHt+tLAhWp7dm9VaMkqs3sMS2xbTd/RgE2CAn/m+wSomA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YoV4R0o8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E705606A31C;
	Tue, 10 Nov 2026 07:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YoV4R0o8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6055F1F0089F;
	Tue, 10 Nov 2026 07:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295673;
	bh=wDq35aBZBm9qWXTpCL7gSCH1BSKE1E0Naxdnc5m2JpE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YoV4R0o8WdNzq1rpVKTrX6vfE7oACl5ZavkxsNuj9SeZpzrT3N+R6WU8YBWOF+aAm
	 /9aROrT/9ooZ3zUAmMxDpJHI3CUQgzFSjYe3uiI60Sk0G6g1L4AQCXgfQRhPKJbtXT
	 V0iBbiT8G/dcKJJ1waDe5reoZosaByE4oyUUYCNSmcf/Sa5kxWJO9UaG7alxw3+NL4
	 /70FO2QcgBLdEmd8SIHfVy1jg/G6mawQfY8eXRjTOdY1DQXmyCDDBAxuTFbSoesmmc
	 wPvAxH9j0amnI1mfal2dX6Mqr+NKio/k3SGN6L5xvRLGaswaFIKlTv0qoRYsAi8MqW
	 SH4oDHi1QpBzA==
Message-ID: <sashiko-outbox-206490@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] usb: dwc2: Add USB DRD support on CV1800 series SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Inochi Amaoto" <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110070627.217946-4-inochiama@gmail.com>
References: <20261110070627.217946-1-inochiama@gmail.com>
 <20261110070627.217946-4-inochiama@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 07:27:52 +0000
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
- [High] usb: dwc2: BVALOVAL cleared in host mode in
  dwc2_ovr_init()/dwc2_ovr_avalid()
- [High] usb: dwc2: inverted role_sw_default_mode check in
  dwc2_drd_init()
--

commit 46e81140c7728597dbfee9abd2cadd6fb5aee6a2
Author: Inochi Amaoto <inochiama@gmail.com>

usb: dwc2: Add USB DRD support on CV1800 series SoC

This commit adds a force_bvalid_in_host quirk parameter to keep the BVALID
override asserted in host mode and enables it on Sophgo CV1800 series SoCs
to avoid a persistent Session End Detected interrupt.

> diff --git a/drivers/usb/dwc2/drd.c b/drivers/usb/dwc2/drd.c
> index 1ad3804cbc805..4f7441a87c857 100644
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

[Severity: High]
Are the if/else branches inverted for the role_sw_default_mode check in
dwc2_drd_init() introduced by commit "usb: dwc2: drd: Sync the generic PHY
mode with role requests"?

drivers/usb/dwc2/drd.c:dwc2_drd_init() {
    ...
	if (hsotg->role_sw_default_mode !=3D USB_DR_MODE_UNKNOWN)
		is_host =3D hsotg->dr_mode =3D=3D USB_DR_MODE_HOST;
	else
		is_host =3D hsotg->role_sw_default_mode =3D=3D USB_DR_MODE_HOST;

	ret =3D phy_set_mode(hsotg->phy,
			   is_host ? PHY_MODE_USB_HOST : PHY_MODE_USB_DEVICE);
    ...
}

When dr_mode is USB_DR_MODE_OTG and role_sw_default_mode is
USB_DR_MODE_HOST, is_host evaluates to false and phy_set_mode() puts the
PHY into PHY_MODE_USB_DEVICE, while dwc2_ovr_init() then configures
GOTGCTL and forces the controller into host mode.  Likewise, when
role_sw_default_mode is USB_DR_MODE_UNKNOWN, the else branch compares
USB_DR_MODE_UNKNOWN against USB_DR_MODE_HOST, so is_host is false even
when dr_mode is USB_DR_MODE_HOST.

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
Can dwc2_ovr_avalid(hsotg, false) and dwc2_ovr_init() still leave
GOTGCTL_BVALOVAL cleared while the controller is in host mode when
force_bvalid_in_host is set?

In dwc2_drd_role_sw_set(), switching from USB_ROLE_HOST to USB_ROLE_NONE
calls dwc2_ovr_avalid(hsotg, false) and clears GOTGCTL_BVALOVAL while the
controller is still in host mode, then drops hsotg->lock and re-enables
interrupts before dwc2_force_mode() switches the controller to device mode:

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
    ...
}

On CV1800, having GOTGCTL_BVALOVAL cleared with GOTGCTL_BVALOEN enabled
while in host mode triggers the un-clearable GOTGINT_SES_END_DET interrupt
storm before dwc2_force_mode() completes (or permanently if dr_mode is
USB_DR_MODE_HOST).

Similarly, dwc2_ovr_init() forces host mode when either dr_mode or
role_sw_default_mode is USB_DR_MODE_HOST, but only sets GOTGCTL_BVALOVAL
when role_sw_default_mode is USB_DR_MODE_HOST, leaving GOTGCTL_BVALOVAL
cleared in host mode if dr_mode is USB_DR_MODE_HOST and
role_sw_default_mode is not.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110070627.2179=
46-1-inochiama@gmail.com?part=3D3
