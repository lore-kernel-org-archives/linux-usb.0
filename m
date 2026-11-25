Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625622;
	b=oK1ZkRWeLq81m7hEzt1A5DFwAOv8R4UU9fZEj1eMbBrJjnCtPSmop6kKGkENCzHIRX0R
	 iytJJ8QunHijINQH2CWp5op3BWIpRBtcaM7CmRiFQfXpioKwjMrT1QjToHiAf3Uh+1s/R
	 9tDuP5GQoUkW/p722vGk3UkYPfSQvlpMzff2wFtnFH/8VWKTkRZJB8PICpceTeEKa5i91
	 0WWr+2kG4tRq/WGBd3aiO0t+WLyaq4g3T7JvpQ1o8CuoBPoaY9TohW3cxROULjQNDXY/G
	 ElgGeSwAj8U5xXXTyihtgOz0pI5y5SY8Nne/klA6+5UUZVaF+5dWI8o9HbtukiuAe5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625622;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UlBe9UxDA65UctR68Ly2hgXryAOab5OsuGS2E3PFcYw=;
	b=rtbYofEWbiYmCqv/rGbyc3ax+bPG1Lf4HvSpo2Vk412KLkkv/D1iDK9d6/xcCP/pz5FZ
	 EXbUPIvbLJgLMnmSKc2Lx1G66STY4I+dQlodbjq63SrdsffgReQTtVo/sQ/8B9YoxSaP5
	 HDkaEoAjOZnS8UupzBexSlpnLaGwRDu/Uw2Sv0/TyImx6onJNVwa4Rcc/+pnGamtzQJcA
	 1ych0bqokXhIfLoMoi1BML9RBMS9Qxd4Nx9USJLhns1hu8HhWMXavK/8HYb8p2QHrPQ6z
	 LtzbS+H1VYG4Sy/GrLBf3dQgNwErA/5bgfea8VDi5H2Vw/r23gkISL7wHCH5mcqq03g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T6lSqZf5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD06606A326
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 16:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T6lSqZf5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B98921F000CA;
	Wed, 25 Nov 2026 16:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795625621;
	bh=UlBe9UxDA65UctR68Ly2hgXryAOab5OsuGS2E3PFcYw=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=T6lSqZf5Rp2i0Nq0g4N2TkCzIrwa2GRa3uQF+g51XZzDYd3wNGHGc+tmp/Ku62r0p
	 AwEB0e7w2+vw8oLRPddA3hyeRVlVM2LdOtlH1xPdiYQF4ouvNMY11UQVfdKSC1mbpe
	 2M2pCr9T6/Czda9GiLhjOQGGG1Nbum+TX8eEvUZnvtcWHOElMpgnizSLl+37BK8Ba7
	 Pke1sR7KjNOVO9HkqjglvEQK/Fp3XC4bkNWpEC3d5HD91VdM0CY/vdzPUklm9gzJQ3
	 UVVJzf8fvjbt2QYLm91RZ8H87yHiPHUKkN/WND6XiviaxvkdAqeksuH6Jjau54DZhQ
	 amhM1O3w9p1Gg==
Message-ID: <sashiko-outbox-233784@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH] USB: cdc-acm: skip the Creative Sound Blaster X3
 ACM interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Flavio Giacchetti" <flv.giacchetti@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <CACKiate5HP20D6StbQk9S2Z4bdLne=FBtOPLh8-SK8529L7EoQ@mail.gmail.com>
References: <CACKiatc1Bj2et4kcXDJiYx28XXxoo6iHPc9nYt3GhTCxUmdnsA@mail.gmail.com>
 <CACKiate5HP20D6StbQk9S2Z4bdLne=FBtOPLh8-SK8529L7EoQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 16:53:41 +0000
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
- [High] usb: cdc-acm: IGNORE_DEVICE breaks Sound Blaster X3 ttyACM
  interface
--

commit 031eaf0ae47f33bbc04133335678328f17e43215
Author: Flavio Giacchetti <flv.giacchetti@gmail.com>

USB: cdc-acm: skip the Creative Sound Blaster X3 ACM interface

This commit adds an IGNORE_DEVICE entry to acm_ids[] for interface 1 of
the Creative Sound Blaster X3 (041e:3264) so cdc-acm does not bind to it.

> diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
> index 4a0c7806fc0b4..b58d061f270af 100644
> --- a/drivers/usb/class/cdc-acm.c
> +++ b/drivers/usb/class/cdc-acm.c
> @@ -1774,6 +1774,11 @@ static int acm_pre_reset(struct usb_interface *int=
f)
> =20
>  static const struct usb_device_id acm_ids[] =3D {
>  	/* quirky and broken devices */
> +	/* Creative Sound Blaster X3 */
> +	{ USB_DEVICE_INTERFACE_NUMBER(0x041e, 0x3264, 1),
> +	  .driver_info =3D IGNORE_DEVICE,
> +	},

[Severity: High]
Does setting IGNORE_DEVICE here permanently disable the /dev/ttyACM*
control interface for all Creative Sound Blaster X3 users?

With IGNORE_DEVICE set, acm_probe() returns -ENODEV unconditionally,
removing userspace access to the serial channel used for vendor DSP
controls and firmware updates.  Since audio worked with cdc-acm bound on
7.3.3, could the regression between 7.3.3 and 7.3.4 be bisected and fixed
directly (or handled with a non-destructive control quirk if a specific
CDC-ACM request collides with audio initialization) instead of disabling
the interface?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/CACKiate5HP20D6StbQ=
k9S2Z4bdLne=3DFBtOPLh8-SK8529L7EoQ@mail.gmail.com?part=3D1
