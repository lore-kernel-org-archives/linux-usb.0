Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795654188;
	b=XV/Czl3JBZVm6TX1i7RXVrNWOdwEiXHpOc7ZSTr6YMsvWRXNViQczF8iIIL+VUNYYAJo
	 rnKZJqH4r44gMPCZyeFXyqO0/fkTY3YQAMMhP6q+ADD0ssiSl0GqhNyEiWGTWqDxETBjR
	 8QpvzQ3JB9FVGkIDP1P2V03I5x52xk2wQnyXQwXC1NcEUquZl/v7lhOcA5D9CelMx6FC7
	 AUDL9fNrmAsoUTy1mufUhewnodR8yvQDUSVIBcM1G3cwqka2p7dwY+vA1ACtGjDfFOAWM
	 j2WZEUOVGoJNxk/hWTD/U7kFLY+DwAW/dJxeWNzKxldlye0ogdKG5IGRL0aexTN4mEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654188;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9xVMJmWJVVqcd9V4ZEXmbF+PYLd3sqe3WmQi4YQ7MGE=;
	b=KzOazQwoqV9lN8TVjwEeBtJ7FkD6u6IJxuoGFlTELID7RpAYU9wFv86DoSRdYnJqbGAI
	 Lzws1F5Gr7VZ0WyiIVsBj6NC+5QhzHdjOlZqfmvyq3KjqogLU0SKLz3sOk8ukTwxdUj1x
	 r9erMdPf93jPTZ2np5kph4bQQFJryFXPm51tZsileBNrRhqC9Pt0NHKV0peN6TdoWs/kl
	 MAZMp2f559QGr19Min9WMadpV7n994BAzBMQi97ENLgcGyN/rASEKm+dJm4ixnHuebtmm
	 GMngAFoyomwUlUg5Z3/BGUpLPpdhWbbVOuh/6ypB2nYhHuBNBaklLn7gw+clWmuz8Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RQg7j2JJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CB7606A31E
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 00:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RQg7j2JJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 453EA1F000C4;
	Thu, 26 Nov 2026 00:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795654188;
	bh=9xVMJmWJVVqcd9V4ZEXmbF+PYLd3sqe3WmQi4YQ7MGE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RQg7j2JJXmuqAr/M4TNH65eh75PlkOuLWDgn4alVJhZnzyFjt26Go2vQUjYXRjFjg
	 igtzAhx0qEdI4wawb+jnv+18iCxSXa3HsrP0motjdP9rejkK4FsaQOyfU1htDhjFZp
	 tm5Sck7FzhyqDgw8YLB9UgV8Bi3e4Q9P+uxbT2WpgiLg7rsZciExS5YvIZoLB8bH5x
	 uY7hL1Fdt+ZzFUCWRIZYe+hUtca1l3MVzKLRfID+RSitfrksqrvkWulHe7N3oIVWvZ
	 a8CXEWZlKnOWhQt6NS8R4OMiDYmJx9js/bv9eCgV6fnTEN3a9IW1k7KRY9bvCXSuej
	 xzr0m1HENkFyA==
Message-ID: <sashiko-outbox-234503@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: tcpci_rt1711h: restart DRP toggling on
 Ra/Open in TOGGLING
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ilia Snezhkov" <iasnezhkov@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261126003308.48940-1-iasnezhkov@gmail.com>
References: <20261126003308.48940-1-iasnezhkov@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 00:49:47 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Ilia Snezhkov <iasnezhkov@gmail.com>
>=20
> When a DRP port using RT1711H/RT1715 or its ETEK ET7303/ET7304
> compatible silicon is connected via an e-marked USB-C cable (for example
> to a USB-C PD charger whose own port is temporarily open), the hardware
> can stop DRP toggling during its Rp phase upon detecting a single Ra
> pull-down, reporting CC_STATUS with LOOKING4CONNECTION=3D0,
> CONNECTRESULT=3D0 (Rp), and (CC1=3DRa, CC2=3DOpen).
>=20
> In tcpm_cc_change(), case TOGGLING only transitions out of TOGGLING for
> source (Rd), sink (Rp), audio accessory (Ra+Ra), and debug accessory
> states. (Ra, Open), (Open, Ra), and (Open, Open) fall through with no
> state change and no call to tcpm_start_toggling(). Because the TCPC has
> already exited hardware toggling, the port remains permanently wedged
> presenting Rp: PD chargers never see Rd and never source VBUS, and
> [ ... ]
>=20
> Drafted with an AI coding assistant.
>=20
> Fixes: ce08eaeb6388 ("staging: typec: rt1711h typec chip driver")
> Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126003308.4894=
0-1-iasnezhkov@gmail.com?part=3D1
