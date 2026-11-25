Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795626574;
	b=pI4Ae4inDb+M5ENzb9SYW1MfMlCqSQziNiJKuL24e17qhHOA96WCEhis0r1avRj5kGBt
	 Q8wzT2zwz+ioJJGYySZu/XM4erMCs8cR3JCfSKGzY/0B6EvpyoSX7lZrbwx3N8Uwtk6Kd
	 f8wVN8MTMf96gJU6ODjxezpAbMBeGjcCPAkYZuoLsl3uzgMMiJJ4cxZdI/iNWWGc3nlH5
	 ZQJUoDQEarsi33JQXq5iD3stN24k5/kGpH3gMncJVgPQVUFg7pzjjznltI+TCtLVmBHRj
	 D2mRCjQHecAleR39Sn6NlngN9zKTsFc+bS5tpOxiIXsbgJfvBuoq/njGy2fUINWZokQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795626574;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fg3osFXzL+vJm5gDtemCmCe8UGrUaAiedUy3xq2Fdok=;
	b=14AbLyz2p848pmog3xlyiKagWY9b7degz5R7ZajSbcqQSN1Vbt7STQpfIDJB8ub0Kofk
	 154BIp1IhMG29R6s3jkYUMH84G4zoTRLkeHTGIQb3hLmALkqtqU874+i4xJxKM0qzQgu3
	 HJ/Zv9Isx3gVS/KfISGR4MmO1rvW3XBHPXYBwwFPicg+UJIA0iLe78bGFntSNgWNUCRkX
	 5LUIo+Z+hFmMzaafL7M2uKHRS9IYs+hvBb1HnVb+SJ3MLp8OOxYa8TJMLavNHIU5C28ZE
	 CQYiuxi82hfk8BLY4ACWfzG74WrqKvxQHkv5x0NH3rAcov15t7sHzBtPPppvNN6FzFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m2ruYxAb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3081606A31E
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 17:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m2ruYxAb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 396981F000C4;
	Wed, 25 Nov 2026 17:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795626574;
	bh=fg3osFXzL+vJm5gDtemCmCe8UGrUaAiedUy3xq2Fdok=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m2ruYxAb18S8Se1GZlQI4mv5FP03kJvlpE3drZVxjY5+y7hHdbYrfdGnCCq07TbLS
	 6os+NUPXZ8tgJAzHiNvLTk6PWu/gZk47grTahhKj/LDjSXYXzfgOob+3vMyoMM2G9u
	 3iMbAMtcAVhZer2bKrL8il14soEpxKdnYGrmeAGONuoHKJT5fAxS8JZjdDtpqSJKo5
	 PlElVc/0+H+Y/Af2FowHt4wyGJmGmY3Y9qFsdV3CCXSASW8mz287WcgO6AV0In3MsD
	 2gX4fX2QYyEMhMrkWmi7xAo5oKmHZjVID2hhKIAOPo9nInGLwJHAhCYdVLCG9BKVlv
	 s8eh3vE9hO3Ng==
Message-ID: <sashiko-outbox-233810@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 03/11] usb: dwc2: drop stale state after register
 restore on resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261125-dwc2-low-power-fixes-stm32-v6-3-d5df33b93eaf@foss.st.com>
References: <20261125-dwc2-low-power-fixes-stm32-v6-0-d5df33b93eaf@foss.st.com>
 <20261125-dwc2-low-power-fixes-stm32-v6-3-d5df33b93eaf@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 17:09:33 +0000
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
- [Medium] usb: dwc2: stale backup valid flags left set in dwc2_resume()
  when not lost
--

commit 4c1dd5f40e80c2ddc45f465c1df3b944bef53d8d
Author: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

usb: dwc2: drop stale state after register restore on resume

This commit adds dwc2_clear_lost_state() and uses it in device and host
mode resume paths to clear stale software state when register loss is
detected after a power domain off.

> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
> index 7f3436e6a1538..53c34a42f7600 100644
> --- a/drivers/usb/dwc2/platform.c
> +++ b/drivers/usb/dwc2/platform.c
> @@ -738,6 +738,7 @@ static int __maybe_unused dwc2_resume(struct device *=
dev)
>  {
>  	struct dwc2_hsotg *dwc2 =3D dev_get_drvdata(dev);
>  	unsigned long flags;
> +	bool lost;
>  	int ret =3D 0;
> =20
>  	if (!dwc2->ll_hw_enabled)
> @@ -788,16 +789,29 @@ static int __maybe_unused dwc2_resume(struct device=
 *dev)
>  	 * In case the GUSBCFG register is not initialized, it's clear the
>  	 * registers must be restored.
>  	 */
> -	if (!(dwc2_readl(dwc2, GUSBCFG) & GUSBCFG_TOUTCAL_MASK)) {
> +	lost =3D !(dwc2_readl(dwc2, GUSBCFG) & GUSBCFG_TOUTCAL_MASK);
> +	if (lost) {
>  		spin_lock_irqsave(&dwc2->lock, flags);
>  		ret =3D dwc2_restore_critical_registers(dwc2);
> +		/*
> +		 * The restore re-enables global interrupts: keep them off
> +		 * until the stale state is cleaned up below.
> +		 */
> +		if (!ret)
> +			dwc2_disable_global_interrupts(dwc2);
>  		spin_unlock_irqrestore(&dwc2->lock, flags);
>  		if (ret)
>  			return ret;
>  	}
> =20
>  	if (dwc2_is_device_mode(dwc2))
> -		ret =3D dwc2_hsotg_resume(dwc2);
> +		ret =3D dwc2_hsotg_resume(dwc2, lost);
> +	else if (lost)
> +		dwc2_hcd_lost_state(dwc2);

[Severity: Medium]
Does skipping dwc2_clear_lost_state() when lost is false leave
gr_backup.valid and dr_backup.valid (or hr_backup.valid) set after a
suspend/resume cycle where the power domain stayed on?

When the controller is not already in a low-power state at system suspend
(for instance in device mode at DWC2_L0, where dwc2_hsotg_suspend() puts
it into DWC2_L3), dwc2_suspend() backs up the registers and sets the
backup valid flags:

drivers/usb/dwc2/platform.c:dwc2_suspend() {
    ...
	gr =3D &dwc2->gr_backup;
	if (!gr->valid) {
		if (is_device_mode)
			ret =3D dwc2_gadget_backup_critical_registers(dwc2);
		else
			ret =3D dwc2_host_backup_critical_registers(dwc2);
	}
    ...
}

If the power domain is not powered off during that suspend (such as s2idle
or standby), lost is false on resume.  In device mode,
dwc2_hsotg_resume(dwc2, false) reinitializes the core to DWC2_L0 without
calling dwc2_restore_critical_registers() or dwc2_clear_lost_state(),
leaving gr_backup.valid and dr_backup.valid true.  Any subsequent
dwc2_suspend() will then see gr->valid =3D=3D true and skip backing up the
current registers, so a later suspend that does lose power will restore
stale state from the earlier cycle (or fail to restore if the OTG role
changed in between).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-dwc2-low-p=
ower-fixes-stm32-v6-0-d5df33b93eaf@foss.st.com?part=3D3
