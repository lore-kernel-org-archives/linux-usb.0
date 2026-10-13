Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C865013CF
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 14:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791901732; cv=none; b=RxWyuwjQy1K/nr1FkajmTgZlYP8mvtkRqfVnWI/r4ieB3iY78Lg2jOx3l5DmMVTsV6X7QSphBPzKqVvkq6Tw+tfGhF9SfbD257JygFpGaqT0d+YrWKBYeJ16UnYU5avUKPR/UgxhtHOKaQ6jwUnggRUGoLJEmV3HgOKfUZoRSyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791901732; c=relaxed/simple;
	bh=6H07UqpB34xzJkqx7O1zQ6NFdgAkEw6hBZ9Tg69ZM14=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=TckeA5wUt9QAqMHDdCUsBYx9k5xflIxMYvOhZWN3F+8aBpxbaWwWu6gB/3Vjgn94VPkWoYTa8YssOOqJLihUYvaHiYZi0cc89tdInhqvNE/6axeoAAGe+iNUu/oaZmLxdt5nWaGruFeYJEt3PYtq+8sBLtdamzQe3eHOdehvAvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ak8BgZCu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ak8BgZCu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37B251F000FF;
	Tue, 13 Oct 2026 14:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791901731;
	bh=HSM6o2I1wf2j+RPXU/6EeukipRAw0BFc7DJaav9VyV0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ak8BgZCu4qDDO5573eDw4GFVqHcc776CQBMLjVX0VywYAoIGLnwP4+5EjcJdcudS7
	 ctRQpyw1icVrXWZif7E/nS2330CjpEZV8MaDQZDtawa7z1FzCZRrycO4JEsqXm2J99
	 gjHcovvQXE9P49bIef1ky4DBT5Y7TC7WddCXGyIEOGAJxUgFie2bYNG7XBeU9qQU5L
	 lWBIOpaYotFgX2T9pQh34al/wtW7Xt60P3eb3GnlZIp27SBotgUfxzpKdmBjuUr9Xt
	 tNSSSzWUt0p30gxt5hLcFLso5j0Kh3CAJhQDODQBKBO9c62M6lPzQZ4T2fzBfpDww9
	 0pi2+MeWOkirw==
Message-ID: <sashiko-outbox-169908@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/5] usb: dwc2: hcd: don't disable/enable external
 vbus by system suspend/resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261013-dwc2-low-power-fixes-stm32-v2-4-79865a4f1b63@foss.st.com>
References: <20261013-dwc2-low-power-fixes-stm32-v2-0-79865a4f1b63@foss.st.com>
 <20261013-dwc2-low-power-fixes-stm32-v2-4-79865a4f1b63@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 14:28:50 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] usb: dwc2: state desync leaves VBUS regulator permanently off
--

commit 4667cf4d4bc9dadbb9a896c9a4811136f2ba1208
Author: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

usb: dwc2: hcd: don't disable/enable external vbus by system suspend/resume

This commit removes the disable and enable calls for the external vbus in
the bus suspend and resume routines. It aims to avoid an unbalanced regulat=
or
enable count that occurs when registers are lost during system suspend.

> diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
> index c966c08cd7d82..263713ebd4801 100644
> --- a/drivers/usb/dwc2/hcd.c
> +++ b/drivers/usb/dwc2/hcd.c

[ ... ]

> @@ -4500,10 +4496,7 @@ static int _dwc2_hcd_resume(struct usb_hcd *hcd)
>  		spin_lock_irqsave(&hsotg->lock, flags);
>  	}
> =20
> -	/* Enable external vbus supply after resuming the port. */
>  	spin_unlock_irqrestore(&hsotg->lock, flags);
> -	dwc2_vbus_supply_init(hsotg);
> -

[Severity: Medium]
Will this leave the physical regulator permanently off if the port power wa=
s=20
cleared before system suspend?

If the port is powered off by the hub driver before suspend, the external
regulator count is 0 and HPRT0_PWR is 0. During system resume, if controller
registers are lost, _dwc2_hcd_resume() unconditionally sets HPRT0_PWR to 1
further down in this function:

    dwc2_writel(hsotg, HPRT0_PWR | HPRT0_CONNDET |
                    HPRT0_ENACHG, HPRT0);

By removing the dwc2_vbus_supply_init() call here, the physical regulator
remains off, but the HPRT0_PWR bit is forced to 1, causing a state desync.

When the hub driver later tries to power on the port in dwc2_hcd_hub_contro=
l(),
it checks the current state:

    case USB_PORT_FEAT_POWER:
        ...
        hprt0 =3D dwc2_read_hprt0(hsotg);
        pwr =3D hprt0 & HPRT0_PWR;
        hprt0 |=3D HPRT0_PWR;
        dwc2_writel(hsotg, hprt0, HPRT0);
        if (!pwr)
            dwc2_vbus_supply_init(hsotg);
        break;

Since HPRT0_PWR is already 1, the check for !pwr evaluates to false, and the
external regulator is silently skipped.

Does this lock the port in an permanently unpowered state where it is unable
to detect or enumerate devices? Could this be avoided by only setting HPRT0=
_PWR
during resume if the regulator is also being enabled, or by restoring the
exact prior port power state instead of unconditionally setting it?

>  	/* Wait for controller to correctly update D+/D- level */
>  	usleep_range(3000, 5000);
>  	spin_lock_irqsave(&hsotg->lock, flags);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-dwc2-low-p=
ower-fixes-stm32-v2-0-79865a4f1b63@foss.st.com?part=3D4
