Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96A83DAADE
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 13:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898649; cv=none; b=d1Bkb5vPOO1hE99u8oJZQ7q4YvWgwHTKvZCtg3qpiLzMp6x2YJVg/+O9g5zWyEWcQIBTjiRtx18/cnF4zp6hUeotJg0uMXQx3HPRLFBK5UtfPXuunNg4kWZPMbwe/Wx7souThw1WXEme2yXbaNJKGr5cCLz1mrSERdU4QjDKplE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898649; c=relaxed/simple;
	bh=FJo9euiZzDNdq1NxK5bk1dXN0IDxAXPZhsCe6qMqN+4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=mC8mI6P4T3g670CJ9enfpXYiataHrN5FhZHDH74ErK5mH7TtJAslK0B27QwEidM/WgGgN6FSlb/lAfJhpRjBJGku9OT7+T0s5gDqFg/7/rDNvTRU+WxAS0htoF9OvBRQ2mqT6BCWFeusSQXH+JZ8WPeKW7XLqkithpbJfBSGrS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iUSINsAN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iUSINsAN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A6941F000FF;
	Tue, 13 Oct 2026 13:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791898648;
	bh=sxrWpw9eIiPt4u26FV7X9g7vM+35VOoRudhVPBCUepA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iUSINsANEfas9BXXcU3SbN1dlyMY7bjJWYv1wjV0pKxwVA0j5AGAQrgrgNY5g/UnP
	 q+16jEnQAiw1UjYMV0kweYDP0cYthpqpL8oE4nPujhq15zvvALRGPg4rZ78I11fbkW
	 +wI0zM5vnDM51HR4MN2bJfBV9/75yAJOei0Edhz/DwuWRynoz8AAxpPT1RgdK2MqgF
	 hxehxeLTU9TgKiLseKVOZQzbF5FFUujTNXux//BiXCJh5SVLM2/kq3iG2vpcv9N1M/
	 0hkzOUpVo5au/ZwTc8hdXx1p9E/AhwXqn11i+g2cykdGPtsa9upNosPuXCs/VjnbDX
	 Y10Ur1L6EsgaA==
Message-ID: <sashiko-outbox-169831@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/5] usb: dwc2: fix recovery after PM domain off
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261013-dwc2-low-power-fixes-stm32-v2-1-79865a4f1b63@foss.st.com>
References: <20261013-dwc2-low-power-fixes-stm32-v2-0-79865a4f1b63@foss.st.com>
 <20261013-dwc2-low-power-fixes-stm32-v2-1-79865a4f1b63@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 13:37:27 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] usb: dwc2: missing host registers init on resume
- [Medium] usb: dwc2: race condition in dwc2_resume between global interrup=
t enable and lx_state update
--

commit bd24950c54847e44e3eeedd3dbd8cfa4f9839041
Author: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

usb: dwc2: fix recovery after PM domain off

This commit addresses a freeze during platform low power transitions
by modifying how registers are recovered after the PM domain turns off.
Instead of backing up registers that cause hangs during clock gating,
it re-initializes the core via dwc2_core_init() and restores the canary
detection logic later in the resume sequence.

> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
> index ef0d730770347..5aa5526720783 100644
> --- a/drivers/usb/dwc2/platform.c
> +++ b/drivers/usb/dwc2/platform.c
[ ... ]
> @@ -786,6 +748,25 @@ static int __maybe_unused dwc2_resume(struct device =
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
> +	if (!(dwc2_readl(dwc2, GUSBCFG) & GUSBCFG_TOUTCAL_MASK)) {
> +		if (dwc2->dr_mode !=3D USB_DR_MODE_PERIPHERAL) {
> +			ret =3D dwc2_core_init(dwc2, true);
> +			if (ret)
> +				return ret;

[Severity: High]
Does this adequately initialize the host registers? dwc2_core_init()
only performs global initialization and doesn't configure host-specific
registers like HCFG, FIFO sizing, or the GUSBCFG_TOUTCAL canary.

While _dwc2_hcd_resume() does call dwc2_core_host_init() via
dwc2_hcd_reinit(), it unconditionally skips this step if the PHY
detects a connected device:

drivers/usb/dwc2/hcd.c:_dwc2_hcd_resume() {
    ...
    hprt0 =3D dwc2_read_hprt0(hsotg);

    /*
     * Added port connection status checking which prevents exiting from
     * Partial Power Down mode from _dwc2_hcd_resume() if not in Partial
     * Power Down mode.
     */
    if (hprt0 & HPRT0_CONNSTS) {
        set_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
        hsotg->lx_state =3D DWC2_L0;
        goto unlock;
    }
    ...
}

Will this cause host registers to never be initialized if a device is
connected during resume, potentially breaking host mode?

Also, since the GUSBCFG_TOUTCAL canary is never restored to 7, will
subsequent resumes repeatedly misinterpret the canary as missing and trigger
redundant resets?

> +			dwc2_enable_global_interrupts(dwc2);
> +		}
> +		/* Also ensure device mode resume takes place in dwc2_hsotg_resume() */
> +		if (dwc2_is_device_mode(dwc2))
> +			dwc2->lx_state =3D DWC2_L0;

[Severity: Medium]
Can this introduce a race condition? Global interrupts are unmasked before
the lockless update of lx_state to DWC2_L0.

If an interrupt fires immediately, the handler (dwc2_handle_common_intr)
could take the lock and read a stale DWC2_L2 state for dwc2->lx_state.
Could this lead to incorrect state transitions or a controller freeze?

> +	}
> +
>  	if (dwc2_is_device_mode(dwc2))

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-dwc2-low-p=
ower-fixes-stm32-v2-0-79865a4f1b63@foss.st.com?part=3D1
