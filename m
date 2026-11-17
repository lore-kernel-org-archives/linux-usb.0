Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936696;
	b=Xseh4DXjE0+648zxOnEAAwQ+fTxb88VioR0t/2zuaBl+TM8oipTKm1LCydpVlHMAxsSF
	 w/tm9V94deLcIFkbuSMPJNckT4Qd5f7fKe3BvoNU7x6HMggPKiltOxpVvuGWlJMfzRdmW
	 oASiMNewrfPlGAU0Lipl7ztU2GeiqarAKx04FkutEWdHQOx0WI7nwkJxjeqBH9PbkQSIA
	 WDmS8POtzdD/vKQmtAXO+1KJjrlmtiqS67WPKK7ZB4bm/dwUsKS2NGZq81IuVY9N9DDQU
	 XNXiPgIdutesF6Yc4Myy2RsuB/S1zdScU2RghMNrfKQwjUHHPN0Flc2LUI+udTw85nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936696;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=uMYIsP4Sw+Ekdm4jCO2e21wWrtncbXAq+Km+NlkrfuI=;
	b=NedL7gCxOwf3i7wQPqHGVMDn9k82pmU8/uJw2wBWL9DqOjbF+MFCAjePnZj2YqP4enzS
	 Z9VuBZVfgC0CQzzVP3MBYPGV/AXIfhLCfM1OUy/LiVCAiQPpPyz3O1O5hT4tbKe32ruKk
	 z6cUoNqJoF2R/r6f7sXtzeVDBOyf2NfJtkw3p1T/5rG8WWB3J+OsaPnsztfQxaVl02jIr
	 A/FJmJV1ThKOnfQZ5wfUllCSpmqfdOVtgFfE9BNcSsaSzyocH+FA0wJ56MIy6B88nE2az
	 PnbgEtnmwQZmuky9qKp9Y/tH1iSVfiPoONuPMyCcnxWNI0wYyevcNZawfabiMEnm+FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ouJWHoke;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BE3606A330
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 17:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ouJWHoke
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F6D11F000C6;
	Tue, 17 Nov 2026 17:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794936696;
	bh=uMYIsP4Sw+Ekdm4jCO2e21wWrtncbXAq+Km+NlkrfuI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ouJWHokeIo182yhYOI60zVad5jDQgfT4DgBBwF4APxVC97Z/Gi4FmQ570yAvk+yhL
	 X7BNQLCYLNyZJya7xBK7ktp0x6BbiKFIYfmhMk3pqb32nQREbgY0GcwzqsiUcFDYcs
	 cLeb467jB6JG80U16gM7HdMgj/jky2aqUwLBL4SisJzSBb9ZkM7ffYxWVTdCXiXVe8
	 VlNKRT8CSsNYac2BBx8qIgqEGCQ2GLkIWKgyU7m7KFXX3ao84WtYTPd/P0Q6DTX+qV
	 RYjqX5wg/wDFI4ggZEwejN2+BmV8eJSnWSrnH7EH5tiE7GTJ4j7NQvBjY9IQNXmeVW
	 zjV4h7GEelwzw==
Message-ID: <sashiko-outbox-219235@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/7] usb: dwc2: restore peripheral mode on low-level
 enable
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117-dwc2-low-power-fixes-stm32-v5-6-0f197e0e6362@foss.st.com>
References: <20261117-dwc2-low-power-fixes-stm32-v5-0-0f197e0e6362@foss.st.com>
 <20261117-dwc2-low-power-fixes-stm32-v5-6-0f197e0e6362@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 17:31:36 +0000
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
- [Medium] usb: dwc2: missing mode and role-switch restore in
  __dwc2_lowlevel_hw_enable()
--

commit 4a34cd28e14c0cab3dbb4e8a1ede5ebdce1b30e7
Author: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

usb: dwc2: restore peripheral mode on low-level enable

This commit restores the configured peripheral mode in
__dwc2_lowlevel_hw_enable() when no role switch is registered and skips
the duplicate peripheral restore in dwc2_resume().

> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
> index 3bdb889028117..5fd005e721732 100644
> --- a/drivers/usb/dwc2/platform.c
> +++ b/drivers/usb/dwc2/platform.c
> @@ -129,6 +129,14 @@ static int __dwc2_lowlevel_hw_enable(struct dwc2_hso=
tg *hsotg)
>  	if (ret)
>  		goto err_dis_clk;
> =20
> +	if (hsotg->dr_mode =3D=3D USB_DR_MODE_PERIPHERAL && !hsotg->role_sw) {
> +		/*
> +		 * Gadget code manages low-level hardware on its own. Restore
> +		 * peripheral mode after register loss while it was disabled.
> +		 */
> +		dwc2_force_dr_mode(hsotg);
> +	}
> +
>  	return 0;

[Severity: Medium]
Does excluding hsotg->role_sw here leave forced device mode and the
role-switch session override bits uninitialized after standby when
peripheral mode is used with a usb-role-switch?

dwc2_driver_probe() and dwc2_hsotg_udc_stop() disable low-level hardware
whenever dr_mode is peripheral, even when hsotg->role_sw is present.  If
the controller loses its registers during standby while no gadget driver
is bound, dwc2_resume() returns early because ll_hw_enabled is false,
skipping dwc2_drd_resume().

When a gadget driver is later bound and __dwc2_lowlevel_hw_enable() runs,
!hsotg->role_sw skips the restore here as well, and role-switch updates
do not force the mode in peripheral configurations:

drivers/usb/dwc2/drd.c:dwc2_drd_role_sw_set() {
    ...
	if (!already && hsotg->dr_mode =3D=3D USB_DR_MODE_OTG)
		/* This will raise a Connector ID Status Change Interrupt */
		dwc2_force_mode(hsotg, role =3D=3D USB_ROLE_HOST);
    ...
}

Without forcing device mode and restoring the B-session valid override,
dwc2_hsotg_core_connect() sees no valid B-session and leaves soft
disconnect asserted, breaking USB peripheral enumeration.  Calling
dwc2_drd_resume(hsotg) when hsotg->role_sw is set would restore both the
session overrides and the forced mode.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-dwc2-low-p=
ower-fixes-stm32-v5-0-0f197e0e6362@foss.st.com?part=3D6
