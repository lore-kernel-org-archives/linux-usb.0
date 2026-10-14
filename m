Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AB052D2C9
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 17:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000749; cv=none; b=d7szV/1z7Y6uB+XUJCZJHtEfBjOt5jppoSDSeYWuwrbC/tJkdSUmUjgekD/Gf0aAECvVgzQdpCOfXrQdSjQwMJya9rtkApkMe9ON0cLuqMjfNuuUXerapwi7tSplG6SFpxAoxr3errh4sEQ5fTzAhxC8XjHcjqN6dRcHHjJ2l+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000749; c=relaxed/simple;
	bh=4zeFCfZyWVqAyLj/ULKRCgHVtSZbDg8PeqE0lomWcGM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=PJNxzBoSyaN+BLzahOJg2HBrQReQOHep89T4qcpAxoIMHR2wQLbPrGInT9agFwezNhcVqP3A65MBPWbe2faV/lPUcJwYFrI98sIrOCA9RLMfF4SCIOq8BVPPiPIgWFu27bqljTCNTwLeUldM9cxoaKyAJbTuIHZT4W+gjPwQDUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KAWnPbV0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KAWnPbV0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB231F000C6;
	Wed, 14 Oct 2026 17:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792000747;
	bh=p1VYqFdMxGa5HgHjk3TJmAFfZ8YP73gtEg7wyoNe2TM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KAWnPbV0XySK6oS5YAxhNVa2QfiEEF0MPuuPznNqZ2q5uSsRvRF65wnJae8lnvXV6
	 vrFUsLGBmjrbgJg3w0C+WD7ga4JE1ezoMFxdBbZEMf6pc70hnW0rfy05s8gnXE9A/G
	 escOsBaWG3C1gclYpdSWb5gJEm8eiO0v1fXRrnwr3jsKRt+AnW+KYoT+j26XXuo2Vu
	 HfeVJTxW578ExgZi2z/ytxANuqhMvFntaprVtxoFSWyEpVqlIHZy+njSR244xjpKLZ
	 Ocv+WNYqEFxiumwZIxzb8qgWi4a/O3NaydjC/NPVO6pDCPMe28wznlJ5O8Yo3z3FYT
	 Bp52Ph9HLj80A==
Message-ID: <sashiko-outbox-171639@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: musb: musb_dsps: Wait for controller reset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ettore Chimenti" <ettore.chimenti@linaro.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261014-patch-ektor5-dm8168-usb-v1-1-9670414271d6@linaro.org>
References: <20261014-patch-ektor5-dm8168-usb-v1-1-9670414271d6@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 17:59:06 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] usb: musb: dsps: PHY resource leak on reset timeout error path
--

commit dd6538e5ce8a20102c268b6b495d88356ce426bd
Author: Andrew Goodbody <andrew.goodbody@linaro.org>

usb: musb: musb_dsps: Wait for controller reset

This commit introduces a polling delay after soft resetting the USB control=
ler
to ensure it completes before setting the controller mode. It uses a timeou=
t of
5000us with read_poll_timeout to verify the controller reaches a sane state.

> diff --git a/drivers/usb/musb/musb_dsps.c b/drivers/usb/musb/musb_dsps.c
> index e3935f18dd56c..d909c45c253d4 100644
> --- a/drivers/usb/musb/musb_dsps.c
> +++ b/drivers/usb/musb/musb_dsps.c

[ ... ]

> @@ -466,7 +468,13 @@ static int dsps_musb_init(struct musb *musb)
>  	timer_setup(&musb->dev_timer, otg_timer, 0);
> =20
>  	/* Reset the musb */
> -	musb_writel(reg_base, wrp->control, (1 << wrp->reset));
> +	musb_writel(reg_base, wrp->control, BIT(wrp->reset));
> +	read_poll_timeout(musb_readl, val, !(val & BIT(wrp->reset)), 2, 5000,
> +			  false, reg_base, wrp->control);
> +	if (val & BIT(wrp->reset))
> +		return -ENODEV;

[Severity: Medium]
If the controller reset times out here, does this leak the previously
initialized PHY?

Looking earlier in dsps_musb_init(), the PHY is initialized and powered on:

        ret =3D phy_init(musb->phy);
        if (ret < 0)
                return ret;
        ret =3D phy_power_on(musb->phy);
        if (ret) {
                phy_exit(musb->phy);
                return ret;
        }

If the hardware reset does not complete within 5000us, this new polling loop
times out and the function returns -ENODEV directly. This skips calling
phy_power_off() and phy_exit() to tear the PHY down.

Should we be adding cleanup for musb->phy on this error path?

> +
> +	dsps_musb_set_mode(musb, musb->port_mode);
> =20
>  	musb->isr =3D dsps_interrupt;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-patch-ekto=
r5-dm8168-usb-v1-1-9670414271d6@linaro.org?part=3D1
