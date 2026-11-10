Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794295587;
	b=B+tKpnAPr29dXXipqrZVQNcN5QHoPbinpFdzLFcw4yaFUl6yeG84PYY4z01DX4wOvjML
	 azwshoWz4w/3VrYmpGNDggo8cvrm7hIdmffiQ7pNvPn3MQmdJ289NvVgsmdoymM7oXVbv
	 RN9N66SlTfrj/1038Ma9a5Ay9DQ2pyiAdv8rdEeejYf/jQ2R0/1g2lNnZQDd75Rrqk0eN
	 /Kb3ULcDLYGsHu1rVMvADLK3bgFbCqWZL8SKMkHsWXunv3KErrDLFjd3ociu595g/QM+A
	 M8N6x0UFC2GbXMQRoC5yEmOQrPcbTedbKM/ghiBkh4aZMMfa5JNHapX0nlsdFQG1znA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295587;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NciYdiArdtamzCSvP6nOhnp+QJN6fln0jeFwCAwtNZM=;
	b=zdL94dyY5vkWHQcaO9j6bx/mxBgmh+0YMhkdp3xNsOV/Ww+VpeY8Xz2kEHE8V9gjc/0a
	 T2IGfD2PhIxLCRlZ/caYU3TNlP6ncUKYeBjorJd0nu0Idihmr6GXZUh64hut+3SQJIxiJ
	 kRgdzaPhpnRRCH0Tl92lJmdpYF6943+SgOkVJ+6JlXgCjabapigJWxsD2Kvyaeywxi4TS
	 /rVHKtRA/xt3d5iayVigeW0YXHwQaw1yuxDuAkKwQIoEc6DyRfc9aMtOEQ+yY7ssy186L
	 5QpBSoEi6vHNNoDWbbGFbIzTOVOh3YaP+upils01P+18kiF59UbojwhHJ6caplCP2Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LgNzs+Wl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660DD606A31C;
	Tue, 10 Nov 2026 07:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LgNzs+Wl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B34BB1F0089F;
	Tue, 10 Nov 2026 07:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295586;
	bh=NciYdiArdtamzCSvP6nOhnp+QJN6fln0jeFwCAwtNZM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LgNzs+WlMibQSHXUeCNJkCPtM82CAD42PBydjFdL6Za5xadBT7yguVxb5mBWgm3i0
	 NITj7QJXhTlt/qu95fvSBfpa3fpmwjPcbr2VyCw34s1cFkncLqRlU93fflD6U+tzED
	 V9hg08TA7fJn8B3AluEHRys0YxyfLBCS9QSy91ggv4R+JNfrhBK8jrNBw0gL8KW4IL
	 oy3+cXcIoVTbxgH9itx4l7SfbadYqQNQmR8IPkh2fI7ShqrZNmUSJjIut6RGAmi2zZ
	 C0rFQZbTRQRyA/wVXa08kIKMJIqTJ719hzTSwweMCcKM0tO20oNk/VhIgm5rs8BaH4
	 yIGCu9GOi0TVA==
Message-ID: <sashiko-outbox-206485@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] usb: musb: sunxi: Unregister the extcon notifier in
 sunxi_musb_exit()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rajan Yadav" <rajanyadav0307@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20261110-musb-sunxi-unbind-v1-2-d821584fc4a4@gmail.com>
References: <20261110-musb-sunxi-unbind-v1-0-d821584fc4a4@gmail.com>
 <20261110-musb-sunxi-unbind-v1-2-d821584fc4a4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 07:26:26 +0000
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
- [Medium] usb: musb: sunxi: missing cancel_work_sync() in
  sunxi_musb_init()
--

commit b343ab879ad454784f848e3901439d97d89167a9
Author: Rajan Yadav <rajanyadav0307@gmail.com>

usb: musb: sunxi: Unregister the extcon notifier in sunxi_musb_exit()

This commit switches sunxi_musb_init() from devm_extcon_register_notifier()
to extcon_register_notifier() and unregisters the notifier in
sunxi_musb_exit() and on the sunxi_musb_init() error path.

> diff --git a/drivers/usb/musb/sunxi.c b/drivers/usb/musb/sunxi.c
> index d880c3758c91b..e9107ae9d3417 100644
> --- a/drivers/usb/musb/sunxi.c
> +++ b/drivers/usb/musb/sunxi.c
> @@ -246,15 +246,19 @@ static int sunxi_musb_init(struct musb *musb)
> =20
>  	writeb(SUNXI_MUSB_VEND0_PIO_MODE, musb->mregs + SUNXI_MUSB_VEND0);
> =20
> -	/* Register notifier before calling phy_init() */
> -	ret =3D devm_extcon_register_notifier(glue->dev, glue->extcon,
> -					EXTCON_USB_HOST, &glue->host_nb);
> +	/*
> +	 * Register notifier before calling phy_init(). It is unregistered in
> +	 * sunxi_musb_exit(), as this runs again each time the musb-hdrc child
> +	 * is bound.
> +	 */
> +	ret =3D extcon_register_notifier(glue->extcon, EXTCON_USB_HOST,
> +				       &glue->host_nb);
>  	if (ret)
>  		goto error_reset_assert;
> =20
>  	ret =3D phy_init(glue->phy);
>  	if (ret)
> -		goto error_reset_assert;
> +		goto error_unregister_notifier;
> =20
>  	musb->isr =3D sunxi_musb_interrupt;
> =20
> @@ -263,6 +267,9 @@ static int sunxi_musb_init(struct musb *musb)
> =20
>  	return 0;
> =20
> +error_unregister_notifier:
> +	extcon_unregister_notifier(glue->extcon, EXTCON_USB_HOST,
> +				   &glue->host_nb);
>  error_reset_assert:
>  	if (test_bit(SUNXI_MUSB_FL_HAS_RESET, &glue->flags))
>  		reset_control_assert(glue->rst);

[Severity: Medium]
Should the error_unregister_notifier path also call
cancel_work_sync(&glue->work) after extcon_unregister_notifier(), just like
sunxi_musb_exit() does?

An EXTCON_USB_HOST event arriving between extcon_register_notifier() and a
failing phy_init() schedules glue->work via sunxi_musb_host_notifier().
Because musb-hdrc fails to bind, unbinding the glue device in
sunxi_musb_remove() will not run sunxi_musb_exit() and devres can free
glue while glue->work is still queued or running.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-musb-sunxi=
-unbind-v1-0-d821584fc4a4@gmail.com?part=3D2
