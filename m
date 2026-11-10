Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311754;
	b=ZoZdXevXiFgS7Fh7cRkuM0+zfhFa+NkdhijUhOYV2vm0icjXCq8t2jKtUESWwYDdbhzU
	 f98LKUtCMkg2wwsrXrPVU/YacA2dMT4V4QE7O/yoSJtFazJisWUkU+WTNCTPglBIfyWYI
	 aZzs0AOVztAXmZEpSTmb35iY+rKHlQn+SILzPYsJufX7eddaN5NExqJ0zccucrfl3P2BM
	 wPoiCXKYl+cORzKsfAfOLhnOToIfJKhtJZAidXLNrghp8y9pmtcU107EYoaP7ONWzMs2O
	 aK3aLbkFuZniaxgMf9gpAoK2hjeyLn1KeFSyOQ/spREZ4H5qV+4rJVHhxLC/lhXbN2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311754;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MMaYMqebqS7g5yXzaOQHv1VR8fHAK30XVGcqYOAKA6Q=;
	b=nlDrM15r43QZMZ8SdlWdZuZ/QUNyuUlnDoB8FZq0850yHyDJCVMipaA3Hs4WdBhck8EE
	 wIgqKGso4UKrQXBsU29hgo8TAjVYYOCK+ybAa0sOed6LtNSFFIZcG5kj7zckkzln9Z5Uw
	 80YpMEPfvlPhhMNsfh09HgLbyQISupKHpocVf3kln1Sf9Jstxx28CmGMkbe6hK6Od4avN
	 20U45cSjnMI0QNYPqiiJTiRz+iXKmv5Zrili7q+jeX2nOZR2bp6FS5oxpHPVXqcXJOwZW
	 UORiDlHBJ/kzxcfB8Py5UiXxim15QbLjHKP1qNgJK5ECLWwGFJbo9mDDh0Av34lD5aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VDaysPIV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961D2606A31C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 11:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VDaysPIV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED0CE1F0089F;
	Tue, 10 Nov 2026 11:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794311754;
	bh=MMaYMqebqS7g5yXzaOQHv1VR8fHAK30XVGcqYOAKA6Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VDaysPIVXTiWruxxp8a0agJJvpWiO5mDEvc4G3xJqqZXicKhV4a5R4n9usCf8/iYl
	 o1LS93PZjVs8kmEJ+HTdvugu8Fc1P2dyJL6seG6WNgUe0jsoqOrXiUWDeZ3wa1Gwnz
	 pSUlgFb6pC7gK3kb6mwIFBEzRglKOkLVNYu/IHxEgicU7+GN4wcAFqvTIjw1sqP8ec
	 bacrltqyNmJnKtvu4VVfgka4OnqN9WNztbUlZnGI/y49manIVBQCVfawXua1Tp+lpa
	 UzYnF8BSOsWJODw2CDYOGdRuvbq4gLWaxxsya4oxi9amQxtCoxkGLcEDi0P8+Q5GpV
	 oMaPo2l7hMP7w==
Message-ID: <sashiko-outbox-206965@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: lpc32xx_udc: drain the pullup work on
 removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hyunjung Ko" <hj351016@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110114351.2524921-1-hj351016@gmail.com>
References: <20261110114351.2524921-1-hj351016@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 11:55:53 +0000
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
- [Medium] usb: gadget: lpc32xx_udc: cancel_work_sync() skips
  pullup_work() on remove
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Medium] usb: gadget: lpc32xx_udc: incorrect work struct scheduled in
  udc_handle_dev() [1]
--

commit 4049fdca943c63a00b8c69476b8030baf97607c6
Author: Hyunjung Ko <hj351016@gmail.com>

usb: gadget: lpc32xx_udc: drain the pullup work on removal

This commit cancels udc->pullup_job in lpc32xx_udc_remove() before releasing
the devm-allocated udc and its isp1301 i2c client.

> diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/ud=
c/lpc32xx_udc.c
> index 94355d3d930fd..210fa1f886c8a 100644
> --- a/drivers/usb/gadget/udc/lpc32xx_udc.c
> +++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
> @@ -3187,6 +3187,13 @@ static void lpc32xx_udc_remove(struct platform_dev=
ice *pdev)
>  	udc_disable(udc);
>  	pullup(udc, 0);
> =20
> +	/*
> +	 * pullup() schedules pullup_job to do the slow isp1301 i2c access; the
> +	 * work dereferences udc, so drain it before the devm-allocated udc (and
> +	 * the isp1301 i2c client it uses) are released.
> +	 */
> +	cancel_work_sync(&udc->pullup_job);

[Severity: Medium]
Does cancel_work_sync(&udc->pullup_job) skip disabling the ISP1301 D+
pull-up on removal?

pullup(udc, 0) calls isp1301_pullup_enable(udc, 0, 0) with block =3D 0, whi=
ch
sets udc->pullup =3D 0 and queues udc->pullup_job so pullup_work() ->
isp1301_pullup_set() clears OTG1_DP_PULLUP over I2C:

drivers/usb/gadget/udc/lpc32xx_udc.c:isp1301_pullup_enable() {
	if (en_pullup =3D=3D udc->pullup)
		return;

	udc->pullup =3D en_pullup;
	if (block)
		isp1301_pullup_set(udc);
	else
		/* defer slow i2c pull up setting */
		schedule_work(&udc->pullup_job);
}

Canceling udc->pullup_job right after scheduling it prevents pullup_work()
from running if it has not started yet, leaving OTG1_DP_PULLUP asserted in
the transceiver after the UDC is disabled and unbound.  Using flush_work()
here would let the queued pull-up disable complete before tearing down udc.

[Severity: Medium]
This problem wasn't introduced by this patch, but udc_handle_dev() schedules
udc->pullup_job instead of udc->power_job when handling suspend and resume
events [1]:

drivers/usb/gadget/udc/lpc32xx_udc.c:udc_handle_dev() {
    ...
				/* Power down transceiver */
				udc->poweron =3D 0;
				schedule_work(&udc->pullup_job);
				uda_resm_susp_event(udc, 1);
			}
		} else if ((udc->gadget.speed !=3D USB_SPEED_UNKNOWN) &&
			   udc->driver && udc->vbus) {
			uda_resm_susp_event(udc, 0);
			/* Power up transceiver */
			udc->poweron =3D 1;
			schedule_work(&udc->pullup_job);
		}
}

Because pullup_work() ignores udc->poweron and udc->power_job is never
scheduled anywhere else, power_work() never runs and the ISP1301 transceiver
never transitions power states across suspend and resume.

[1] https://sashiko.dev/#/bug/linux-931b6f24-8f05-4e96-9acb-90ce7f88f38f

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110114351.2524=
921-1-hj351016@gmail.com?part=3D1
