Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975130;
	b=4tF2zPmHTrIxiOkX4lzXoLr4HAskaUKwxOAhmvROZ1vzA/qhC0VKSWHb1jlVxfGrwtJR
	 gyG8YzV1aBKNL6DQTqIglkgPYpVMgxZhadssGdhYnsrMGgtNSMK80DLGpf8Wpf3JUO7wY
	 soHFKxK+R8fHelvidExXCtJ8BtCpBeW71+xZNqWaUQlBJAMsGg5Kd6yByWwyuxGtXE/6a
	 ZZnLShu2Wo+jXxI0Y7QD/nfPmq6SvhvKhX78zCuI5GGUN+teTcovwKd/cERtM+QE0h+Kg
	 xNJYEAFHkrMroj4j2e27+YQeYHBJTttryZkhQah7PkQ8a1pFsrJO+4TYWp/6Ro7d9FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975130;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CEk/UtVc6Agyn8CIkBmTHIK9+i53myER/y4rxvFxPj4=;
	b=RDK31QF0Bs7vEpopvaV0U9CFFagHJ1jdYjS3rlCfA5pIkOsoOlRJjbblxlXAS8+rB4YT
	 yhnMhhC6RLp/AzRZdP1jwMHxDIkV6rvPoT6bBBRgHLl2tm71dsjIs4+FCuvk1xZdy9dNk
	 h/u3lZ0he+uoQsnvF5qag8dx3Aa4QKHzSmgRh2rXkMOzY1LpFilA6Nlp5SVILhQvp4KWP
	 duVZ7No4ozm6l0MZyfJtOdDvPzgF2yXEP+RrY2xYJLNLQqRz9nZv2IvxXRyy7BjHyZ+9j
	 NXcgvu6OYvBR74YeF9rYo4K9WntrUroPAxzb6H1BSt4DGrJhur0BrKNHNBGYp2m7Y7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ROecydSI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06C4606EE81
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 14:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ROecydSI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3425D1F008A3;
	Fri,  6 Nov 2026 14:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793975130;
	bh=CEk/UtVc6Agyn8CIkBmTHIK9+i53myER/y4rxvFxPj4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ROecydSIy4VIhCvSx2gciWgar32JHbuG9hsTMmwuRp0oAmiGaT2XEgux6T3dAmSuZ
	 RbROCZPoNPpt2WBqTQETuXEU+6R63J3f2x2hncaRvPqiMFUIj64T0iZ+eQwhoT49+L
	 C1s6e+JZyWAzwCM1/T/rsC/AddtAZ6BpDut76q6WIY0m/U8ge4mBD4YgLkwGnwQp7p
	 8cHkMMt6O7aoA+tyiPGKZAKgX+Jn9Crc80dQnviDW3GfcittmvbeLSfaOMWPJ1YS9l
	 TSCmxH/+z5jzpGrEyoH8vnvSwAeYP+PBTQ+HKauNPMJrODAlXqXwJxTT2eNR+Nr63T
	 zDHHuOmJ3r8qA==
Message-ID: <sashiko-outbox-201574@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] usb: dwc3: remove redundant
 pm_runtime_dont_use_autosuspend() calls
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Crofts" <crofts@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106133933.1577-4-crofts@kernel.org>
References: <20261106133933.1577-1-crofts@kernel.org>
 <20261106133933.1577-4-crofts@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 14:25:29 +0000
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
- [Low] usb: dwc3: autosuspend left enabled on dwc3_core_probe() runtime
  error
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [High] usb: dwc3-am62: unchecked pm_runtime_get_sync() in
  dwc3_ti_remove() [1]
--

commit ff359600a9a87664827e5cdde0c2f86b3442fcb7
Author: Joshua Crofts <crofts@kernel.org>

usb: dwc3: remove redundant pm_runtime_dont_use_autosuspend() calls

This commit removes pm_runtime_dont_use_autosuspend() calls from the error
and removal paths in dwc3_core_probe(), dwc3_core_remove(), and
dwc3_ti_remove().

> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index fd5c2cd36c595..c4f0aa9627477 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -2431,7 +2431,6 @@ int dwc3_core_probe(const struct dwc3_probe_data *d=
ata)
>  err_allow_rpm:
>  	pm_runtime_allow(dev);
>  	pm_runtime_disable(dev);
> -	pm_runtime_dont_use_autosuspend(dev);
>  	pm_runtime_set_suspended(dev);
>  	pm_runtime_put_noidle(dev);
>  err_disable_clks:

[Severity: Low]
Can this leave dev->power.use_autosuspend enabled if dwc3_core_probe()
fails at runtime without unbinding the driver?

In drivers/usb/dwc3/dwc3-apple.c, dwc3_apple_probe() can succeed in the
DWC3_APPLE_PROBE_PENDING state without calling dwc3_core_probe(), and later
invoke dwc3_usb_role_switch_set() -> dwc3_apple_init() ->
dwc3_apple_core_init() -> dwc3_apple_core_probe() -> dwc3_core_probe() when
a cable is connected.  If dwc3_core_probe() fails after enabling
autosuspend and unwinds via err_allow_rpm, the dwc3-apple driver remains
bound so pm_runtime_reinit() does not run, leaving autosuspend enabled in
sysfs and leaking the runtime PM usage reference if a negative delay was
configured.

[ ... ]

> diff --git a/drivers/usb/dwc3/dwc3-am62.c b/drivers/usb/dwc3/dwc3-am62.c
> index d03b3950ce046..0df7e436aeb0d 100644
> --- a/drivers/usb/dwc3/dwc3-am62.c
> +++ b/drivers/usb/dwc3/dwc3-am62.c
> @@ -322,7 +322,6 @@ static void dwc3_ti_remove(struct platform_device *pd=
ev)
> =20
>  	pm_runtime_put_sync(dev);
>  	pm_runtime_disable(dev);
> -	pm_runtime_dont_use_autosuspend(dev);
>  	pm_runtime_set_suspended(dev);
>  }

[Severity: High]
This problem wasn't introduced by this patch, but can an unchecked
pm_runtime_get_sync() failure in dwc3_ti_remove() [1] cause a
synchronous external abort when accessing USBSS_MODE_CONTROL?

drivers/usb/dwc3/dwc3-am62.c:dwc3_ti_remove() {
	...
	pm_runtime_get_sync(dev);
	device_init_wakeup(dev, false);
	of_platform_depopulate(dev);

	/* Clear mode valid bit */
	reg =3D dwc3_ti_readl(am62, USBSS_MODE_CONTROL);
	...
}

If runtime resume fails during unbind, the device remains suspended with
its clocks gated while dwc3_ti_readl() and dwc3_ti_writel() access the
hardware registers.

[1] https://sashiko.dev/#/bug/linux-413fac67-663c-422c-bdfa-d64685df2b24

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106133933.1577=
-1-crofts@kernel.org?part=3D3
