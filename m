Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793992073;
	b=aywiZQKO5OkNGdZo64Peeab7pYZuxHpR613kLVFkLP5uQyLn/4Xq2VMTvq9ulJBa3VHO
	 wXnkmbojxNQvJ/n0H9Seb18+uao9r3JZAdPbbKnb35YPF+o2oMZI4L4Gxli69oclmagsO
	 XHCxyflj3k7Rw3ISe6bPd3tSSuzJ4Lyno1+FAp2r/tTZ1ZHpMnNivw/lK0Sqh8HEa5d8U
	 PenPOHVQgWZ2dkzCUAIrHTTmYfAkTH8gz4jxZzJXk4zxbYmaSrXSz+Pyf6qwr4YGNJtWb
	 6CfPTMwxR0YOm7nQwCCWp+3rrHqdtQp1DLqwYLYDucZqascSZA3NAX2HIsZOv27ye4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793992073;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=P07fX1QRePkjwdoUnrLtLEnGh491BsMLz2o8OoxavkU=;
	b=K1yRtHgG43ajx0X8OUAswURM9hIWFvEbJDoMR6vGhLcIgT2Lkd4crMaNYnhnVd5lSlMW
	 skffi+RQEmKuCpvQezV0jyR1uj6DPoZHb1Qtn96y2vp2DNJfetnL9Foq2VelAw+aSXmv9
	 orUbkA8gNbOxpDIRQfAxhzs7kX8d6ZheFES/6cQ2DKJhYZBUFNTn4WmgKinx3WAzEHNcM
	 ZP3zUL4GIjQbjeKbVtrQiME46b9y+kLieGUg9fowr2XLvu/fdwF1RSE+XWbCXuqsCw2qK
	 TsBdOxp1Oce0HM0JbhYxiKKsmk31Qj/cR3gMuRztR84M61aTayaxDMQO2sfPbE99IKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d8j21BF6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B55606A326
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 19:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d8j21BF6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 642431F0089F;
	Fri,  6 Nov 2026 19:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793992073;
	bh=P07fX1QRePkjwdoUnrLtLEnGh491BsMLz2o8OoxavkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d8j21BF6e2+02oNscQMK3XQRbTjU2v33Z2XkNaeBIsLq9wnPDR8ZB2bFRWbRT4h+y
	 07PDjK87xueR4EGOjtaseEX2KwgBim9ZpGNHVPifIa0glUPq66KuM/PDTfIsl4Kzsx
	 8NZhSHvdbOYKyTRw9z6w92eHpJxEqmZJLjgkU1HrFDSiaxLsttCTEC0Cw3htaFASQA
	 kewE7EIQQsswqKeoW7+eOap+gMizpaLBnTtVdjaesTZM2AWf6uI8COxZGMTIgC3BkA
	 buUAtJdjjZvEXgrbc4jBYvaz0TMeJnP6YIfN/9TBj9TgBesVe+qYS+Jb3TGfwLzOZ6
	 aTyHWv3XKTJxg==
Date: Fri, 6 Nov 2026 19:07:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-riscv@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: musb: mpfs: unregister the generic PHY device on
 remove
Message-ID: <20261106-coveting-unclip-525e1e9dec65@spud>
References: <20261104021522.1468663-1-vulab@iscas.ac.cn>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jVM147u5aDo92KWD"
Content-Disposition: inline
In-Reply-To: <20261104021522.1468663-1-vulab@iscas.ac.cn>

--jVM147u5aDo92KWD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2026 at 02:15:22AM +0000, Wentao Liang wrote:
> mpfs_probe() creates the "usb_phy_generic" platform device with
> usb_phy_generic_register() and keeps it in glue->phy, but mpfs_remove()
> hands the controller's own platform device to
> usb_phy_generic_unregister().  The generic PHY device is therefore never
> unregistered and its reference is leaked, while the controller device,
> which the driver core is in the middle of removing, is torn down a
> second time.
>=20
> Pass glue->phy, as the probe error path already does.
>=20
> Fixes: 7a96b6ea90a4 ("usb: musb: Add support for PolarFire SoC's musb con=
troller")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Isn't this a duplicate? I'd swear I acked a patch like this from a Felix
Guo months ago.

> ---
>  drivers/usb/musb/mpfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/musb/mpfs.c b/drivers/usb/musb/mpfs.c
> index 587127abd30a..6cc2909b8ae3 100644
> --- a/drivers/usb/musb/mpfs.c
> +++ b/drivers/usb/musb/mpfs.c
> @@ -357,7 +357,7 @@ static void mpfs_remove(struct platform_device *pdev)
> =20
>  	clk_disable_unprepare(glue->clk);
>  	platform_device_unregister(glue->musb);
> -	usb_phy_generic_unregister(pdev);
> +	usb_phy_generic_unregister(glue->phy);
>  }
> =20
>  #ifdef CONFIG_OF
> --=20
> 2.34.1
>=20

--jVM147u5aDo92KWD
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCau4lhQAKCRB4tDGHoIJi
0ixKAQC00+LKzozTo9PiPnk6ZQjCO/7J5xZlVgKbknNlG1wGGgD+NFBS8GaX6DBT
2OkMIvmdC7qEmK7VA2z6es6e+g/xEA8=
=0xFQ
-----END PGP SIGNATURE-----

--jVM147u5aDo92KWD--
