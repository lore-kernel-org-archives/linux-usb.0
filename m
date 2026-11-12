Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484809;
	b=N9Wh3XYdHWiRJLA99w5SDlIFZ4NTJh9AtDMu2U3hVbR/HjWYcuGdps0LCZvlGk9KeeoB
	 +8hXjWOcrBK4/VIecK5E6GdZc/bnN49BiAF8oVsuQX7z/2kut3QF7ZBF9qy+bEcMqCjmC
	 QHzfZwnAm0mzyfK5G6Hm7Y+zMBJaUwUuF0DH+Ok8Hm2xS+Zx5QLjDQ9ZSSHaOcZPQ+lEJ
	 Hpukuxg5cIKmQVBdugOxBkKrj46Y5m/0/4JcCrXkJo7woZpY/oSOybSwSXGkmthKFueTo
	 77AgzFTPaSO/ya7CggpxT3febDu+uzr1Tp0xwbrGXrY562CMCebVYDNj9RaRSGx71pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484809;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=y3yHS9AEQqsr4Cg05GwJ241KovlI9XYEeMiW7OczNNg=;
	b=I4FScWkamQXfP7+kZY7LEpHLjSEgImQYQmWsKdRAu7UBuQsLMGzg+x0Cp6/74UyygQx1
	 4CPNYGWlpwNCmsm3y/3N5elhQg7Tx4gSpPYREr2Jx4os4lku4B5SRgO/TVSkM55xIvJfO
	 l7AQnL3XC/RiA6hBIuQXkuNR2m80gLHTgKyDd5tNds5rrx3Vo781/RyQglPPQmNRx6r3M
	 7PmDwFH0yZB+HX/EPxEy3NzsizZkvhJGZX5W624h9dF7un9eTfikPA+7kk3aKeuRKyObP
	 vlcD8JQbwJ7rZAVY6Hx26RG/wLQP/YOCbFLmAo+MSXUbAjh8clXYKpgP2jlYtChPcVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V1YgEiYL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72925606A32E
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 12:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V1YgEiYL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E04071F00A06;
	Thu, 12 Nov 2026 12:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794484809;
	bh=y3yHS9AEQqsr4Cg05GwJ241KovlI9XYEeMiW7OczNNg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V1YgEiYL+1U6KuvDaAf5U5RHEQ3PwGq0tggxGqIm2XdC0CvknT0IMWAN0qVORp0aF
	 +JwLH6DOXRA/AZpOZPJdEKOzDpjCtJEACpoMXZhPXxfkEe7En3yfqNerldw/gGENKI
	 3nrzCarFMsw4F3bODFwwbNQVdIMp7cx6SI6/wARMNfHtG26CD71zFZyXPvseUOGllc
	 Q0WzunaPnMECIBTIFsdZ0oMmno2RUCkqCxLm2IxXlyGL7FKmA6cAg0iMtmvsilOGkI
	 cPwXbW61OH1SiurLY92FsJejPuw9HKu/05ABXbOcQe39JvHjuHMYrgdZzJK0bzBFzF
	 K+fOgUGdNNrsQ==
Message-ID: <sashiko-outbox-211064@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND] usb: dwc3: tell xHCI that it lost its state when
 the core is powered off
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joonhoe Kim" <26rote@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261112114053.412-1-26rote@gmail.com>
References: <20261112114053.412-1-26rote@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 12:00:08 +0000
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
- [Medium] usb: dwc3: stale xhci_power_lost after resume in
  dwc3_xhci_resume_quirk()
- [Medium] usb: dwc3: missing xhci_power_lost set for OTG host in
  dwc3_suspend_common()
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [High] usb: dwc3: missing xhci_power_lost for OTG mode in
  dwc3_suspend_common() [1]
--

commit 1536e0b07384ff8dbfd40131768e7772947697b4
Author: Joonhoe Kim <26rote@gmail.com>

usb: dwc3: tell xHCI that it lost its state when the core is powered off

This commit records when dwc3_suspend_common() powers off the DWC3 core
during host-mode system suspend and passes that state to xhci-plat as
power_lost via a resume_quirk callback.

> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index fd5c2cd36c595..b5490b9a8474f 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -2572,8 +2572,10 @@ static int dwc3_suspend_common(struct dwc3 *dwc, p=
m_message_t msg)
>  		if (!PMSG_IS_AUTO(msg) &&
>  		    (!device_may_wakeup(dwc->dev) || dwc->needs_full_reinit)) {
>  			dwc3_core_exit(dwc);
> +			dwc->xhci_power_lost =3D 1;
>  			break;
>  		}
> +		dwc->xhci_power_lost =3D 0;

[Severity: Medium]
Does the DWC3_GCTL_PRTCAP_OTG case in dwc3_suspend_common() also need to
set dwc->xhci_power_lost?

When the controller operates in OTG mode with the host role active
(dwc->current_otg_role =3D=3D DWC3_OTG_ROLE_HOST), dwc3_otg_update() regist=
ers
the xhci-hcd device while dwc->current_dr_role stays DWC3_GCTL_PRTCAP_OTG.
On system suspend, the DWC3_GCTL_PRTCAP_OTG branch unconditionally calls
dwc3_core_exit(dwc) without setting dwc->xhci_power_lost:

drivers/usb/dwc3/core.c:dwc3_suspend_common() {
    ...
	case DWC3_GCTL_PRTCAP_OTG:
		/* do nothing during runtime_suspend */
		if (PMSG_IS_AUTO(msg))
			break;
    ...
		dwc3_otg_exit(dwc);
		dwc3_core_exit(dwc);
		break;
}

On resume, dwc3_resume_common() reinitializes the core from scratch, but
dwc3_xhci_resume_quirk() still sees xhci_power_lost =3D=3D 0 and xhci_resum=
e()
attempts to restore state onto the reset controller.

[Severity: High]
This problem wasn't introduced by this patch, but in OTG host mode
[1] does dwc3_suspend_common() power off the core via
dwc3_core_exit() without telling xhci-plat that power was lost?  When a
dual-role controller in DWC3_GCTL_PRTCAP_OTG mode is acting as host,
system suspend tears down the core in the DWC3_GCTL_PRTCAP_OTG branch while
leaving xhci_power_lost unset, so xhci_resume() tries to restore saved
registers to a reset controller and triggers unhandled IOMMU context faults
or command ring timeouts.

> diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
> index c5674161b2b08..c7143a8e3e326 100644
> --- a/drivers/usb/dwc3/host.c
> +++ b/drivers/usb/dwc3/host.c

[ ... ]

> @@ -78,7 +76,23 @@ static void dwc3_xhci_plat_start(struct usb_hcd *hcd)
>  	dwc3_enable_susphy(dwc, true);
>  }
> =20
> +/*
> + * dwc3_suspend_common() powers the core off for system suspend in host =
mode
> + * when the controller may not wake the system. The xHCI registers and i=
ts
> + * saved internal state are gone then: tell xhci-plat, so that xhci_resu=
me()
> + * resets the controller instead of restoring registers and asking it to
> + * restore a state it no longer has.
> + */
> +static int dwc3_xhci_resume_quirk(struct usb_hcd *hcd)
> +{
> +	struct dwc3 *dwc =3D dev_get_drvdata(hcd->self.controller->parent);
> +
> +	hcd_to_xhci_priv(hcd)->power_lost =3D dwc->xhci_power_lost;
> +	return 0;
> +}

[Severity: Medium]
Can dwc->xhci_power_lost remain 1 after resume and cause an unnecessary
xHCI reset on a later aborted suspend?

Neither dwc3_xhci_resume_quirk() nor dwc3_resume_common() clears
dwc->xhci_power_lost after a power-off suspend/resume cycle.  If a
subsequent system suspend aborts after the child xhci-hcd device runs
xhci_plat_suspend() but before the parent dwc3 device runs
dwc3_suspend_common(), dpm_resume() calls dwc3_xhci_resume_quirk(), which
reads the stale dwc->xhci_power_lost =3D=3D 1 and forces xhci_resume() to r=
eset
the controller and re-enumerate all attached devices even though the core
stayed powered.

[1] https://sashiko.dev/#/bug/linux-d6c3b577-381b-4dd2-a215-d44eec3c0bbf

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112114053.412-=
1-26rote@gmail.com?part=3D1
