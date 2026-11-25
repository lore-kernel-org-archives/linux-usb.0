Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625931;
	b=dpMFK5S/wneELEkhG2ouuGm9MbCcVCSO5o2lDPe3DyFDNVJVMk9iIyFSio1z9XsjKUeQ
	 RXcdlEIv49cRbWw5/VrVkY0dHd2txb2aKQhEsjuZkiBF2dBojyIkW/MZvHHvNxWYmUnqI
	 luKpO3JCxcD1PEuTMDf5mmrF+uyuk9VofIxnROqpObmH75bIgqn1evjH/qeyP+wf0NfeW
	 EHkzOLJS5UHwFB+EccK0Fiy/oTnkceH6q90D90EQ8D+xiWrbSTvo+LpL+0LrSt80TNQyH
	 DF+8FCSgOpYfAQ0vGpLxAuSs0yaD8nI+JDkaALgGMTmaYPElsR7hke/T733GXbTxeng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625931;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LbC0aquylA7OO1aT0S/TAX44UGU+GgSbqJXgn3etxNY=;
	b=doMc+7A6DdLvcrK4bK9Df/Ocshw0xOFJbNluNNzHBAScrETwM22lm2saxyviCz5eJNJH
	 D71Afi4Tgcd4O3z/j2ybjW2HTM5EkZRbVVztt8YtRx49fgDo62vdyUdhRMF0QRlpHWCzE
	 SOfntOapeMdFsfm//FNvMg4jHaAK3Ke8mv5bEJF2Un4V1ey+6UcKNMLCF+iucNFDWC6xw
	 cR4jXa/sq7ybqZtxkOy78wC5DVi6NmgXvqHG0WyyyaLfIeamuMYPIs8XlFCRcLZsiWZUC
	 2y0DyoiitfXTgHGWCx+ffF2Ev4yEno9OHTyyU9JTZB/wWm5bUwGu/Un5GtZlq+q2Q5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mwyRj7SP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE1F606A323
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 16:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mwyRj7SP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FA641F000D0;
	Wed, 25 Nov 2026 16:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795625931;
	bh=LbC0aquylA7OO1aT0S/TAX44UGU+GgSbqJXgn3etxNY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mwyRj7SPMtM1K73A6qBhnWEF23qeNQQVkgoNDGPgEdcsg1A5MWbrYtlrSUOOY6Vfr
	 109n33l6wEuBEodtw50a+X+NuhbmDd0IjQNUKGTFjpnQoaeTZ8b385bOOXcFHuo6im
	 8Z6L2WZ313UvGAUhh0cUhRYqC29WaAKbhJacK7t1WUcq8zrq/2VbEzjGbw3Yyio2ic
	 yZTINbXq7ALO6SxegVHaF0UgY2XSVFC06a0ZsnuYiCURiul54nnEvZk4Piago4K5vF
	 /u+Zl6e8XWXqI+pBZGp1+XSKTnllFPQwejHGVhQUq7SA1dg9BNbLLvajcJTURApqSq
	 Dtis9tqO3drdQ==
Message-ID: <sashiko-outbox-233789@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 01/11] usb: dwc2: fix recovery after PM domain off
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261125-dwc2-low-power-fixes-stm32-v6-1-d5df33b93eaf@foss.st.com>
References: <20261125-dwc2-low-power-fixes-stm32-v6-0-d5df33b93eaf@foss.st.com>
 <20261125-dwc2-low-power-fixes-stm32-v6-1-d5df33b93eaf@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 16:58:50 +0000
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
- [High] usb: dwc2: stale gr_backup.valid after resume without PM domain
  power loss
- [High] usb: dwc2: dwc2_restore_critical_registers() overwrites resume
  config
--

commit c2d1c8f60a77ed180c814b0a57e8097e8be203f6
Author: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

usb: dwc2: fix recovery after PM domain off

This commit backs up critical registers when entering clock gating, skips t=
he
backup in dwc2_suspend() if a valid backup already exists, and moves regist=
er
restoration in dwc2_resume() after STM32 ID/VBUS detection and dual-role
restoration.

> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
> index 3df9b198d1b22..7f3436e6a1538 100644
> --- a/drivers/usb/dwc2/platform.c
> +++ b/drivers/usb/dwc2/platform.c
> @@ -649,6 +649,8 @@ static int dwc2_driver_probe(struct platform_device *=
dev)
>  static int __maybe_unused dwc2_suspend(struct device *dev)
>  {
>  	struct dwc2_hsotg *dwc2 =3D dev_get_drvdata(dev);
> +	struct dwc2_gregs_backup *gr;
> +	unsigned long flags;
>  	bool is_device_mode;
>  	int ret =3D 0;
> =20
> @@ -692,10 +694,15 @@ static int __maybe_unused dwc2_suspend(struct devic=
e *dev)
>  		regulator_disable(dwc2->usb33d);
>  	}
> =20
> -	if (is_device_mode)
> -		ret =3D dwc2_gadget_backup_critical_registers(dwc2);
> -	else
> -		ret =3D dwc2_host_backup_critical_registers(dwc2);
> +	spin_lock_irqsave(&dwc2->lock, flags);
> +	gr =3D &dwc2->gr_backup;
> +	if (!gr->valid) {
> +		if (is_device_mode)
> +			ret =3D dwc2_gadget_backup_critical_registers(dwc2);
> +		else
> +			ret =3D dwc2_host_backup_critical_registers(dwc2);
> +	}
> +	spin_unlock_irqrestore(&dwc2->lock, flags);

[Severity: High]
Can gr->valid remain true across normal operation after a suspend/resume
cycle where the power domain is not turned off?

When dwc2_suspend() runs while the controller is not in clock gating (for
example, in device mode in DWC2_L0, in host mode with no device connected on
the root port, or when params.no_clock_gating is set), the backup here sets
gr->valid =3D true.  If the power domain stays powered during that suspend,
dwc2_resume() sees GUSBCFG_TOUTCAL_MASK still set and skips
dwc2_restore_critical_registers(), while neither
dwc2_gadget_exit_clock_gating() nor dwc2_host_exit_clock_gating() runs to
clear gr->valid.

Because gr->valid stays true in DWC2_L0, subsequent dwc2_suspend() calls sk=
ip
backing up current registers.  If a later suspend powers off the PM domain,
dwc2_resume() restores stale register values from the earlier suspend, or
restores the wrong mode's registers if an OTG role switch occurred in betwe=
en.

[ ... ]

> @@ -786,6 +782,20 @@ static int __maybe_unused dwc2_resume(struct device =
*dev)
>  		dwc2_drd_resume(dwc2);
>  	}
> =20
> +	/*
> +	 * During suspend it's possible that the power domain for the
> +	 * DWC2 controller is disabled and all register values get lost.
> +	 * In case the GUSBCFG register is not initialized, it's clear the
> +	 * registers must be restored.
> +	 */
> +	if (!(dwc2_readl(dwc2, GUSBCFG) & GUSBCFG_TOUTCAL_MASK)) {
> +		spin_lock_irqsave(&dwc2->lock, flags);
> +		ret =3D dwc2_restore_critical_registers(dwc2);
> +		spin_unlock_irqrestore(&dwc2->lock, flags);
> +		if (ret)
> +			return ret;
> +	}

[Severity: High]
Does calling dwc2_restore_critical_registers() after the STM32 ID/VBUS
detection block and dwc2_force_dr_mode() / dwc2_drd_resume() overwrite the
GOTGCTL, GINTMSK, and GUSBCFG values just configured for resume?

drivers/usb/dwc2/core.c:dwc2_restore_global_registers() {
    ...
	dwc2_writel(hsotg, gr->gotgctl, GOTGCTL);
	dwc2_writel(hsotg, gr->gintmsk, GINTMSK);
	dwc2_writel(hsotg, gr->gusbcfg, GUSBCFG);
    ...
}

In dwc2_suspend(), dwc2_drd_suspend() masks GINTSTS_CONIDSTSCHNG in GINTMSK,
and the activate_stm_id_vb_detection path forces the mode in GUSBCFG and se=
ts
session and debounce overrides in GOTGCTL before the !gr->valid backup saves
those registers into gr_backup.  When the power domain is lost, running
dwc2_restore_critical_registers() after the resume steps clobbers the resto=
red
GOTGCTL, GINTMSK, and GUSBCFG settings with the pre-suspend or suspend-time
snapshot, breaking OTG and dual-role detection after resume.

Even with commit "usb: dwc2: platform: fix stm32mp15 detection logic power
management" and commit "usb: dwc2: restore peripheral mode on low-level
enable" later in the series, dwc2_drd_suspend() still masks
GINTSTS_CONIDSTSCHNG before the backup in dwc2_suspend(), and
dwc2_force_dr_mode() and dwc2_drd_resume() still have their GUSBCFG, GOTGCT=
L,
and GINTMSK updates overwritten by dwc2_restore_global_registers().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-dwc2-low-p=
ower-fixes-stm32-v6-0-d5df33b93eaf@foss.st.com?part=3D1
