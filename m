Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517DA38424C
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 14:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791468112; cv=none; b=jKHL9HeZFrekH8d7yqOPcSk5I2DnTQsstTaRZmHZqO0kw5K/D96XdWbHYKHetAnhLZOJrLBQBqkWm1hREFq6PITzl//lFClOxd/21CimqbZEPiicmqHiPQif73/7d5yN3giv1wk1earp+qazJEd2hRhgW3Sn0ktkOBnU0PBkggw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791468112; c=relaxed/simple;
	bh=wBP1I306AQZevKL+n69/gXCUQXle65BbL485Jjr0HjY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=AMLeXGMzVdJm8BzzzAfak8midQ1kbhOL6AbFIqTT1wpC6qdt2ODv3/nlEJewqO3QObueZ+qW0Za3akFrcE0/jrt6Lh8XcfVE3nsVIZRe+Mv+zMeN2QARA5uSpW07I7XOoa/MmUiPf32BjsqFzq7ca1j+up9Q02VizRdLAwoGLLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W8ISGRgJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W8ISGRgJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA45B1F000FF;
	Thu,  8 Oct 2026 14:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791468110;
	bh=ZXvWaek0e8Bwfdj7FDFBfYMoCvWehNRM9I5gQ+TgGDI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W8ISGRgJGsZMD4DzogSyJ6ODA5rykFF29WUiHiQvUeopYvub71Gr4B7zM/ISGa+5V
	 r6r33Ti4iNjDn/23VsxkhaGQs3z6ZtQXS7id7JmVnxCnqWqXNBIC83UNywGL0/oY9f
	 5j86harrzljWfrizNE/SWA9b98qeI24R9EtLf5bT5tu/qavQ4JaEyKSasfb9MnCOfr
	 KqNCpKg9abrSzcj/vmqywYRY0sNZ0z7plc1OKQfEKCmJzLtN7bsJnotUc/ee2mjvMY
	 tPfnOB50p6snfMNQnFY22GhI9VzP0TsXIGtHQNDcJ46j29lsNL6GSUzFtUIQ8+Leop
	 6y8Yh0zNRKaHg==
Message-ID: <sashiko-outbox-164260@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] usb: dwc2: hcd: fix possible successive vbus supply
 enables
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008-dwc2-low-power-fixes-stm32-v1-3-5b303df762e6@foss.st.com>
References: <20261008-dwc2-low-power-fixes-stm32-v1-0-5b303df762e6@foss.st.com>
 <20261008-dwc2-low-power-fixes-stm32-v1-3-5b303df762e6@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 14:01:50 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] usb: dwc2: regulator leak due to symmetric XOR logic
--

commit f865d013106075de51e4e0c898c2ab0fe2bc50f1
Author: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

usb: dwc2: hcd: fix possible successive vbus supply enables

External VBUS supply may have already been enabled, before entering
dwc2_hcd_reinit. This results in vbus enable count to increase every
time this occurs, and dwc2_vbus_supply_exit won't disable vbus upon
suspend request. Fix this by reading PWR bit before and after
dwc2_hcd_reinit() call.

> diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
> index d5275cd658d4c..b7b4ff466d2b5 100644
> --- a/drivers/usb/dwc2/hcd.c
> +++ b/drivers/usb/dwc2/hcd.c
> @@ -4264,9 +4264,11 @@ static int _dwc2_hcd_start(struct usb_hcd *hcd)
>  		return 0;	/* why 0 ?? */
>  	}
> =20
> +	hprt0 =3D dwc2_read_hprt0(hsotg);
> +
>  	dwc2_hcd_reinit(hsotg);
> =20
> -	hprt0 =3D dwc2_read_hprt0(hsotg);
> +	hprt0 ^=3D dwc2_read_hprt0(hsotg);
>  	/* Has vbus power been turned on in dwc2_core_host_init ? */
>  	if (hprt0 & HPRT0_PWR) {
>  		/* Enable external vbus supply before resuming root hub */
>  		spin_unlock_irqrestore(&hsotg->lock, flags);
>  		ret =3D dwc2_vbus_supply_init(hsotg);

[Severity: Medium]
Since this XOR operation is symmetric, does it also evaluate to true if
HPRT0_PWR transitions from 1 to 0?

A 1 to 0 transition seems structurally possible if the hardware
asynchronously clears the power bit (e.g. due to an overcurrent fault
HPRT0_OVRCURRCHG) during the execution window.

If this occurs, could the driver erroneously call dwc2_vbus_supply_init()
when power was lost, improperly incrementing the regulator enable count?

Later cleanup paths like dwc2_hcd_stop() or ClearPortFeature
USB_PORT_FEAT_POWER will observe HPRT0_PWR =3D=3D 0 and skip calling
dwc2_vbus_supply_exit(), which appears to lead to a permanent regulator
use count leak. The issue is not fixed in subsequent patches in the series.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-dwc2-low-p=
ower-fixes-stm32-v1-0-5b303df762e6@foss.st.com?part=3D3
