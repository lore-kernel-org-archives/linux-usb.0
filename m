Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434656;
	b=FeV1rO0bOwPgnWas+BoEuBULWfs9WmRSiew5RdI97gSlNDVKmL2TpIOZnhlZOM497Vo+
	 sVkPI+K3WGB9HvSXKPj6916VQHCyF4my/xqCWM2+KJpwcD5fg81OSS20KFiMrzFC3EiZO
	 oM0fp79nU8GHYU1CNj2xHqgMbZebbUbg/gvmjX8kGtYPQOIzRGVcybV7X9ITDNqh9Titq
	 s9cs+pxRQ42aUPtSmsY0d3s6r2EnDaQSuRPXnpE+Rgvx2hMxVw75tUlAEv/mrHPT+DVzS
	 T6ITRN1y1nDdLFy8tzIooB3LRXL8k037QM5Fag5XrQiaZF2WYPY4xzUg0xErWZvHqbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434656;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Chx82LJUkzMD/HltP55OCxteXpcxj4C6GwbrRzCeb6o=;
	b=jyWPwLdxoZ7eSOOsY9EhxjuunVgk22jEHRTvJBfZxtouGR85/79l3HC/9PaVGHB+DlOU
	 cVZwX3xwC76107PJ/OsY0GgcnfzjSI9AxLFnT44qJGrq5b1rjtpi6Mf+6MYClEaSDBrfd
	 yGzjKEQ8aKiZfZwrBsTr8uXucowi9+YJKMFxsjViR2rgTJK6UFu3gCjM1VA633YPXymxV
	 +NbssJNXQwjisAGJ5lwqC0bMG4w5mRHXo5PWbtrAqKxkWIdJLS3+HC34NRxjKb+Nae+4s
	 ZTRW50lOr7JhtcE4CCq9Vwzn3PPL5YQbSBWBvMfoYWomat6wY9BbwNH/7y55Y7egSDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ei39C7sl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DD4606A326
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 22:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ei39C7sl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9979C1F00A05;
	Wed, 11 Nov 2026 22:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794434655;
	bh=Chx82LJUkzMD/HltP55OCxteXpcxj4C6GwbrRzCeb6o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ei39C7sl7Odc5lehCQ4qP//WCoHrkohMMOjY3NWY45Druqq+RmHxKr9fLlFoP/r4Z
	 TnX0uKf3raHPbYH7q980RAuCxvufcj92qmapxHwtxDIQKqWXcycR/B8TPZfoRDpcir
	 Z75pe27PoqKL1dYbnIjPt9ebGEC84NkLYH/dYXVLGV0obqEE+bKkLT6Cs6wtKGA4AI
	 +UCwCVe8W5ptgu4kG7+kXOvz1e+9y0gm6zQJw5kDFiNly6vROH9JRUumDyN04lGfEX
	 ycp+XZnq7aeGBfDgqMGzF+x3GD0jnYce8z4J0wllTgK93JE+nhukL4lYyo2YCYEL3n
	 cHXcQMo58iXEA==
Message-ID: <sashiko-outbox-209739@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] Input: yealink - remove driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261111215723.3802209-3-dmitry.torokhov@gmail.com>
References: <20261111215723.3802209-1-dmitry.torokhov@gmail.com>
 <20261111215723.3802209-3-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 22:04:15 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The Yealink USB-P1K (0x6993:0xb001) is a mid-2000s USB 1.1 telephone
> handset with a segmented LCD, keypad, and ringer marketed as a
> "USB phone for Skype" and desktop VoIP/SIP softphones, where audio was
> handled by snd-usb-audio and the yealink driver drove the keypad,
> segmented LCD, and tones via custom sysfs attributes.
>=20
> Operating the handset required dedicated userspace bridge software such
> as usbb2k-api / kb2kskype (targeting the defunct legacy Skype desktop
> API and KDE3/Qt3) or yeaphone (an archived 2000s liblinphone wrapper).
> The entire userspace ecosystem has been unmaintained for over 15 years,
> the legacy Skype API it was built around is gone, and modern USB
> telephony devices rely on standard USB HID telephony usages instead of
> custom sysfs display drivers.
>=20
> The driver has had no functional changes, hardware testing, or new
> device IDs since 2008, while continuing to generate syzbot USB fuzzing
> reports and drive-by cleanup churn. Remove the driver, its
> documentation, Kconfig and Makefile entries, the MAINTAINERS section,
> and the HID ignore-list entry that only existed to prevent usbhid from
> binding ahead of yealink.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111215723.3802=
209-1-dmitry.torokhov@gmail.com?part=3D2

