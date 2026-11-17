Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937370;
	b=uPPL0IIKdQLwMrjfWmXXHVRfAA1mQT6p1KcL+Khztpor6qO5JK38I4F9iWUXuOeIlYSr
	 NL2LWFbikR/vhWExIOowWzzAm3aEyKLdPK1U2rVnDSaJOxsfk2vGuR48lz6onvRIV4p8g
	 fR6pRNiT5MJ9+1jGjIDWaO19uZ8tU1OGIHXWu8FS1garVnnXX9vPunAJzpuqbpBWxJ2lK
	 Hwi+/6Mne3LGrxXz1Hs+FbPFjxrj8/JWRI0+TvbIJO7h96OYVzSgpBQ+mU7IGcSPJox0O
	 MSzZICbGJgrHwsTOgcPS5+9B0zaMemoJ5YX9UPKNcje/H3TMdUBcQHM7oYk19rVv2kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937370;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/2pp9IkT63rr520Q4I5I3pQ+GW1waaEK56MB5Y5K8ms=;
	b=DvmGHBiOZS0csUJODkLMFIDVNBs/8VP5c4f0XrEWVFtnxwoJuIppFaTfGU6A/hge2TrT
	 FXEvarVD30286J2c2LHqgo6P32aG324ClG8Gyq0c+AS3uoULH9T5wDnJRcsnaAyJZiBqv
	 Ob1CFY3yPA3aNk8S7lM3muV/r+iq/4xOtfSoWwCkkVQqhnhApfO3b82yUPU22Uk0EJVTh
	 ZwBbgiLEYvLS6ztIfobqCFwyuGLZ+3XSCpfGvjak4h88jNfPQz3RMF8LwXfhoXkFSnjRM
	 cQdpLUFh/kXy/AjSyyguhwRsq5btTvXRj8vXgKZLHQncb6ixu8qrOXUGBgbmLLBqxoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cXDraww4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD3E606A31C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 17:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cXDraww4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A0CF1F000C7;
	Tue, 17 Nov 2026 17:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794937370;
	bh=/2pp9IkT63rr520Q4I5I3pQ+GW1waaEK56MB5Y5K8ms=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cXDraww44CNJZ1zS2fuFyE4s+Xk7S7vAwboUgCBaNsW0aGvLjd/vAz5UJQptSrvQA
	 WynADwravP2rfeAdTTgk2fpYv7tfRu0hgh7qV3ZpSSUjWxPgK6XETQvJk3RvBx3jgt
	 USwwnpn0YQS97VrC0rvM55CYki+T93t/UUKYRy4nftfwsjLjVZx/mH+UIOeqcE8mML
	 HzYW+dOScuFdFv+svhNwhnmak+vmkAR0pCD+Llxn+d624OH9sLdsiMaB+gg3gCzjG4
	 9ctqA8zt/VphMWiP29Jpfigade18J/nbYkPB9lHTaHnLsaJHWGKM21M0cGzZNlogWW
	 PBsQR4YVx9rGA==
Message-ID: <sashiko-outbox-219256@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/7] usb: dwc2: fix recovery after PM domain off
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117-dwc2-low-power-fixes-stm32-v5-1-0f197e0e6362@foss.st.com>
References: <20261117-dwc2-low-power-fixes-stm32-v5-0-0f197e0e6362@foss.st.com>
 <20261117-dwc2-low-power-fixes-stm32-v5-1-0f197e0e6362@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 17:42:49 +0000
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
- [Medium] usb: dwc2: GUSBCFG_TOUTCAL canary unset or cleared before
  dwc2_resume()
- [Medium] usb: dwc2: stale role state in dwc2_resume() if OTG mode
  changes in suspend
--

commit f376168d518b0027023927337bdb68e136a8890b
Author: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

usb: dwc2: fix recovery after PM domain off

This commit replaces critical register backup and restore during system
suspend/resume with a GUSBCFG_TOUTCAL check on resume that reinitializes
the controller and cleans up host or gadget state when registers were lost.

> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
> index ef0d730770347..7dec3842ba2c6 100644
> --- a/drivers/usb/dwc2/platform.c
> +++ b/drivers/usb/dwc2/platform.c

[ ... ]

> @@ -786,8 +749,30 @@ static int __maybe_unused dwc2_resume(struct device =
*dev)
>  		dwc2_drd_resume(dwc2);
>  	}
> =20
> +	/*
> +	 * During suspend it's possible that the power domain for the
> +	 * DWC2 controller is disabled and all register values get lost.
> +	 * In case the GUSBCFG register is not initialized, it's clear the
> +	 * registers must be restored. So invoke here the necessary init
> +	 * as done by dwc2_hcd_init() during probe.
> +	 */
> +	need_restore =3D !(dwc2_readl(dwc2, GUSBCFG) & GUSBCFG_TOUTCAL_MASK);

[Severity: Medium]
Can GUSBCFG_TOUTCAL still be zero here even when the power domain stayed on,
causing a false-positive need_restore and an unnecessary controller reset on
every resume?

GUSBCFG_TOUTCAL is only programmed in dwc2_core_host_init() and
dwc2_hsotg_core_init_disconnected(), not in dwc2_core_init() or
dwc2_gusbcfg_init().  In dual-role device mode with no gadget driver bound
(hsotg->driver is NULL), neither _dwc2_hcd_start() nor dwc2_hsotg_resume()
calls those functions, so GUSBCFG_TOUTCAL remains 0 after probe and after
resume.

In addition, dwc2_hsotg_core_init_disconnected() writes GUSBCFG_TOUTCAL(7)
before calling dwc2_phy_init(hsotg, true):

drivers/usb/dwc2/gadget.c:dwc2_hsotg_core_init_disconnected() {
    ...
	usbcfg =3D dwc2_readl(hsotg, GUSBCFG);
	usbcfg &=3D ~GUSBCFG_TOUTCAL_MASK;
	usbcfg |=3D GUSBCFG_TOUTCAL(7);
    ...
	dwc2_writel(hsotg, usbcfg, GUSBCFG);

	dwc2_phy_init(hsotg, true);
    ...
}

In peripheral-only mode (dr_mode =3D=3D USB_DR_MODE_PERIPHERAL), dwc2_core_=
init()
has not run beforehand; if dwc2_phy_init() changes the PHY selection bits in
GUSBCFG from their power-on defaults, it issues dwc2_core_reset(), which
clears GUSBCFG_TOUTCAL back to 0.

> +	if (need_restore) {
> +		if (dwc2->dr_mode !=3D USB_DR_MODE_PERIPHERAL) {
> +			if (dwc2_is_device_mode(dwc2)) {
> +				ret =3D dwc2_core_init(dwc2, true);
> +				if (ret)
> +					return ret;
> +			} else {
> +				ret =3D dwc2_hcd_restore(dwc2);
> +				if (ret)
> +					return ret;
> +			}
> +		}
> +	}
> +
>  	if (dwc2_is_device_mode(dwc2))
> -		ret =3D dwc2_hsotg_resume(dwc2);
> +		ret =3D dwc2_hsotg_resume(dwc2, need_restore);

[Severity: Medium]
What happens if the OTG ID pin changes while the system is suspended and the
power domain is powered off?

dwc2_resume() branches only on the post-resume dwc2_is_device_mode(dwc2), a=
nd
dwc2_core_init() clears GINTSTS (including GINTSTS_CONIDSTSCHNG) in
dwc2_enable_common_interrupts() and overwrites hsotg->op_state with the new
mode.  If the controller was in device mode with hsotg->lx_state =3D=3D DWC=
2_L2
before suspend (so dwc2_hsotg_suspend() returned early) and resumes in host
mode, dwc2_hsotg_resume() is skipped: the gadget is never disconnected,
non-EP0 endpoints stay enabled in hsotg->fifo_map, and later calls to
dwc2_hsotg_ep_disable() fail with -EINVAL because hsotg->op_state is now
OTG_STATE_A_HOST.  Conversely, if the controller was in host mode before
suspend and resumes in device mode, both dwc2_hcd_restore() and
_dwc2_hcd_resume() are skipped, leaving HCD_FLAG_HW_ACCESSIBLE cleared and
host state unrecovered.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-dwc2-low-p=
ower-fixes-stm32-v5-0-0f197e0e6362@foss.st.com?part=3D1
