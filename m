Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792495603;
	b=Gf29askzaSrDq0ECnitPG46meeUXhdOMPqfdlcIgs+Fe/0R8nU/w+Y621ltCcEkplZld
	 if2Tsx28kzxhqKCSA2IMDCSgMXTHrEUbfz84cBgL1k7DskR6yVoKivIygwDxHi8qHZ36x
	 Y+s2j8AKYuTE6vucL5VB9Gk2nE4tCMMxqhmIre8U6Bn9MJp+FHh8neY/OuHCOGccSjYe9
	 qjW7jqzY/GHlQirvssueLEmCTetrya30uj4G9ocIzT0FaQSlUH8sGR3J92UVu1OpPIC1Y
	 ZcTAeJkop67gy3xjqDCCVwNX7pgxa1koo85swFYiMmp02yhriSW3ldZKTyRAsJw/TrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792495603;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=TZU5lWmS6GBhTtKx2myaTEUIw4yn+utBYaL4B2lviF0=;
	b=yxb12jK7pYQICS2fcY1PUbuBl37N7SGUKHcoTq8z1+JJsDhZBPZMkBfN8em5KjBXd0li
	 d3ee9Kn/IAaya4e0Ma7rgUThP9RbPo1oIjpsHiZEmngi/VUogHOySp/aWcOUzTylhXeD1
	 medfZvUL4AgQ3YUpiJVO2OWA/X+2Cfup45jnGnXSV051NjxEwwBz6lmkG/YuO97vOma3I
	 T/l9ajvE88Q2+y6QzGiQaIDN44wN6U5ISlujnxksk0IYsEMyhmUc/kFs3p60W/jsLBfXR
	 gbVmNMWCTxRfQDKZV+SARIW5Wsf2/Op0sswMmeNjVgGLA5In0cKQfl7Flh47HAFEKDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=goz3kf3z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929B3606A319
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 11:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=goz3kf3z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFB5F1F000C4;
	Tue, 20 Oct 2026 11:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792495603;
	bh=TZU5lWmS6GBhTtKx2myaTEUIw4yn+utBYaL4B2lviF0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=goz3kf3zubA9r6HyY5kkV3bAbDg3lkKIlN2qN9qaGB9fVVphQzcrI0KWzRCvyxJ3I
	 EiCEPCOXN63FrFBYfDujJ6kqCJPka9gMTDuI1hkpYOU6UmmCXO3DvyuLK+i9EZLYzS
	 K/gS60TwM63z1FLAjO+Nvf197cLjMdd95ZLiX5F58C1BFTml+VPjQksvyWyew0JBMp
	 VgJa3xVXI0e15TBrmPiQ4cRm5XnjCyNl2DOs/ZzSfJCd7RLh6wfAXPckgiLATKIKts
	 f8fUw+/nQ4Yps0tCzcgbn6qBQ2Zkw+/suyYWb0WAzCaYXmzlobEB9o975OFcRcx8FJ
	 +7jg/0WWYpjow==
Message-ID: <sashiko-outbox-178893@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] usb: xhci-plat: keep IRQ masked while HCD is
 inaccessible across system sleep
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiazi Liu" <jiazi.liu1984@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261020111035.25365-1-jiazi.liu1984@gmail.com>
References: <20261020111035.25365-1-jiazi.liu1984@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 11:26:42 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] usb: xhci-plat: xhci_plat_resume_common() unmasks IRQ on error pat=
hs
- [High] usb: xhci-plat: xhci_plat_suspend_common() skips wakeup and blocks=
 shared IRQ
--

commit 07ff10dd51b8e25e7045f365929b6001912f4351
Author: Jiazi Liu <liujiazi@amazon.com>

usb: xhci-plat: keep IRQ masked while HCD is inaccessible across system sle=
ep

This commit masks hcd->irq in xhci_plat_suspend_common() and unmasks it
in xhci_plat_resume_common() when the device is not configured as a wakeup
source, preventing an unhandled interrupt storm while HCD_FLAG_HW_ACCESSIBLE
is cleared.

> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index 6fd595f81a306..07c95f2ff32e5 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -478,13 +478,22 @@ static int xhci_plat_suspend_common(struct device *=
dev)
>  	ret =3D xhci_priv_suspend_quirk(hcd);
>  	if (ret)
>  		return ret;
> +
> +	/*
> +	 * Mask the IRQ while the HCD is not accessible. The PM core unmasks
> +	 * it before xhci_resume() runs, and a pending event on the halted
> +	 * xHC would cause an interrupt storm.
> +	 */
> +	if (!device_may_wakeup(dev))
> +		disable_irq(hcd->irq);

[Severity: High]
Does skipping disable_irq(hcd->irq) when device_may_wakeup(dev) is true
leave wakeup-enabled controllers vulnerable to the same unhandled IRQ
storm?

In drivers/usb/host/xhci.c, xhci_suspend() clears HCD_FLAG_HW_ACCESSIBLE
unconditionally regardless of do_wakeup:

    spin_lock_irq(&xhci->lock);
    clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
    if (xhci->shared_hcd)
        clear_bit(HCD_FLAG_HW_ACCESSIBLE, &xhci->shared_hcd->flags);

While HCD_FLAG_HW_ACCESSIBLE is cleared, usb_hcd_irq() in
drivers/usb/core/hcd.c returns IRQ_NONE:

    if (unlikely(HCD_DEAD(hcd) || !HCD_HW_ACCESSIBLE(hcd)))
        rc =3D IRQ_NONE;

Glue drivers such as dwc3_host_init() in drivers/usb/dwc3/host.c enable
wakeup by default on the xhci-plat device via device_init_wakeup(). During
hibernation_snapshot(), xhci_plat_freeze() calls xhci_plat_suspend_common().
Because device_may_wakeup(dev) is true on wakeup-enabled devices even
during freeze/thaw, disable_irq(hcd->irq) is skipped here and the
dpm_resume_noirq() -> dpm_resume_early() interrupt storm can still occur
before xhci_plat_thaw() runs xhci_resume(). The same window exists during
normal system resume if a pending or wakeup event asserts the halted xHC's
level-triggered interrupt line before xhci_plat_resume() runs.

Additionally, xhci_plat_probe() registers hcd->irq with IRQF_SHARED:

    ret =3D usb_add_hcd(hcd, irq, IRQF_SHARED);

Calling disable_irq(hcd->irq) masks the entire shared interrupt line at
the irqchip across suspend and resume for any other device sharing that
line. Would it be better to silence the xHC interrupter in hardware (for
example, clearing CMD_EIE or IMAN_IE in xhci_suspend() while
HCD_FLAG_HW_ACCESSIBLE is cleared) instead of calling disable_irq()?

> +
>  	/*
>  	 * xhci_suspend() needs `do_wakeup` to know whether host is allowed
>  	 * to do wakeup during suspend.
>  	 */
>  	ret =3D xhci_suspend(xhci, device_may_wakeup(dev));
>  	if (ret)
> -		return ret;
> +		goto err_enable_irq;
> =20
>  	if (!device_may_wakeup(dev) && (xhci->quirks & XHCI_SUSPEND_RESUME_CLKS=
)) {
>  		clk_disable_unprepare(xhci->clk);
> @@ -492,6 +501,12 @@ static int xhci_plat_suspend_common(struct device *d=
ev)
>  	}
> =20
>  	return 0;
> +
> +err_enable_irq:
> +	if (!device_may_wakeup(dev))
> +		enable_irq(hcd->irq);
> +
> +	return ret;
>  }
> =20
>  static int xhci_plat_suspend(struct device *dev)
> @@ -523,12 +538,12 @@ static int xhci_plat_resume_common(struct device *d=
ev, bool power_lost)
>  	if (!device_may_wakeup(dev) && (xhci->quirks & XHCI_SUSPEND_RESUME_CLKS=
)) {
>  		ret =3D clk_prepare_enable(xhci->clk);
>  		if (ret)
> -			return ret;
> +			goto enable_irq;
> =20
>  		ret =3D clk_prepare_enable(xhci->reg_clk);
>  		if (ret) {
>  			clk_disable_unprepare(xhci->clk);
> -			return ret;
> +			goto enable_irq;
>  		}
>  	}
> =20
> @@ -544,6 +559,10 @@ static int xhci_plat_resume_common(struct device *de=
v, bool power_lost)
>  	if (ret)
>  		goto disable_clks;
> =20
> +	/* The HCD is accessible again, pair with disable_irq() in suspend. */
> +	if (!device_may_wakeup(dev))
> +		enable_irq(hcd->irq);
> +
>  	pm_runtime_disable(dev);
>  	pm_runtime_set_active(dev);
>  	pm_runtime_enable(dev);
> @@ -555,6 +574,9 @@ static int xhci_plat_resume_common(struct device *dev=
, bool power_lost)
>  		clk_disable_unprepare(xhci->clk);
>  		clk_disable_unprepare(xhci->reg_clk);
>  	}
> +enable_irq:
> +	if (!device_may_wakeup(dev))
> +		enable_irq(hcd->irq);
> =20
>  	return ret;
>  }

[Severity: High]
What happens if xhci_plat_resume_common() fails and jumps to disable_clks
or enable_irq?

If clk_prepare_enable() or xhci_priv_resume_quirk() fails before
xhci_resume() is called, HCD_FLAG_HW_ACCESSIBLE is still 0 and the xHC is
still halted with any pending event unacknowledged. Calling
enable_irq(hcd->irq) on this error path immediately triggers the unhandled
IRQ storm in usb_hcd_irq().

If xhci_resume() fails after setting HCD_FLAG_HW_ACCESSIBLE in
drivers/usb/host/xhci.c:

    set_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
    if (xhci->shared_hcd)
        set_bit(HCD_FLAG_HW_ACCESSIBLE, &xhci->shared_hcd->flags);

or if xhci_priv_post_resume_quirk() fails, HCD_FLAG_HW_ACCESSIBLE remains
set because xhci_resume() does not clear it on error. Jumping to
disable_clks disables xhci->clk and xhci->reg_clk (when
XHCI_SUSPEND_RESUME_CLKS is set) and then falls through to enable_irq. Any
pending xHC interrupt or shared interrupt on hcd->irq will then pass the
HCD_HW_ACCESSIBLE(hcd) check in usb_hcd_irq() and call xhci_irq() ->
readl(&xhci->op_regs->status) while the controller clocks are disabled.

Should hcd->irq remain disabled (and HCD_FLAG_HW_ACCESSIBLE be cleared) if
xhci_plat_resume_common() fails?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020111035.2536=
5-1-jiazi.liu1984@gmail.com?part=3D1
