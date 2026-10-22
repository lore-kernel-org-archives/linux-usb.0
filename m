Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792649760;
	b=ktb1uuhiJ2As+uHyOjhjN+FK4HwDgLxx1ZVPYyNg0K9+yTSoKK8s5SnBJY2glhqedx5N
	 MZlOgOSNcYZn6cdn5yXxGA47KOnAEvrwg2uwhtZIX/5FRbYJ1TmHZTc/ffmmElBxJRaVe
	 i1Izq5IcMsr18m6S0rZqd7s93FQ9XTh7cy/Y87CwHWnAlr7gDNrJ3BO88ZtA4/5asQdYA
	 WE72AL03/WBI6KCacxnv1g9h8numETdlXUvUyM7Cmwr8KrFiB6Id/C00MrbLLamzFLQxm
	 Z3Ro6uxD57FMx4xVO4kX7Dn+3y4CZnAlChOk2QVC8xtKG+/2qTfAp/Pt0+jFZiBmx1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792649760;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Fvv040Yt3X6Tncl9PyddasEpSaYQNZJ3YnveAkKzmjw=;
	b=oneoetq38yg5s7E8wwo2sJI13S6lDPoYU05HMzOZOiNOI5QPq2a0P8ZGTvdCmEJsaTkb
	 pSKb5JUYRTVl3dp6g1FmEf67pGCmrIvgTHZbMQORoUP9+9g77y+FJxsiUduvyPfRJ9E7l
	 eOLG9gEfSXwPR7VRGtvnuMEFZLvDmCQGF+inhcMwsiuT1PNvIDWbiPZIrgZfaLurxuoXM
	 BnJPiETOsANSi3fjj/DSHGrEjorXLMRVcY9PR6R+uCAUU9WugNk9j6Ol9HBGBd4bC4nLU
	 pZZsmNtQWEMt8gVCSUZBuOTyosWNEWOdvelwZMZUkAElXYdsqpUtRykXh1nEePX1Yig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VQWIJ4Q0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A23606A319
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 06:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VQWIJ4Q0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 405831F000C1;
	Thu, 22 Oct 2026 06:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792649759;
	bh=Fvv040Yt3X6Tncl9PyddasEpSaYQNZJ3YnveAkKzmjw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VQWIJ4Q0uGNmUQCm6Iv5Pn6fmMQl6w63kI8c0gukClXuwTCLaxyG4dYUpk8n+yHnP
	 oNNDSjWG9142OtWaXyhf7ghkB8Bgh9nxhTIjH9WWQscWR2DidZdPSCHvNQUggTDRn5
	 suxsfRqWMxV1lDpb6iJ/NvnJWkb3AbTE1M+MeNnT46bpThlfk+aeYJuejRWOnvKf+g
	 mBDLL0upRxguRr98cu4bdx9WngDJMt6G0G0Crh0UAjriTcbi3JbMyz2HxoeM0f9tv8
	 bT6iJnnwmCG5YwqFv9CkDRjIbg3N1aoyD92P97NfgYGUnbpsC8Jm3JT1Zra0SKidBL
	 C6oyhY31mbVvg==
Message-ID: <sashiko-outbox-181069@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] USB: quirks: add DEVICE_QUALIFIER quirk for Mobapad C2
 Lite gamepad
Reply-To: sashiko-reviews@lists.linux.dev
To: "Danny Zimmer" <dzimmer50@googlemail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261022061214.3497578-1-dzimmer50@googlemail.com>
References: <20261022061214.3497578-1-dzimmer50@googlemail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 06:15:58 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The Mobapad C2 Lite gamepad in its "Xbox 360 Controller for Windows" mode
> (USB ID 2345:e06e) fails to enumerate on Linux and enters an endless
> connect/reset loop. A USB trace shows the device returns its device
> descriptor, but then stalls the Device_Qualifier request and stops
> answering any further control transfers, so the host resets it and the
> cycle repeats indefinitely.
>=20
> The device works on Windows, which does not issue a Device_Qualifier
> request. Setting USB_QUIRK_DEVICE_QUALIFIER so the host skips that request
> lets the device enumerate normally; the configuration descriptor is then
> read at its usual size without problems and the controller binds as an
> xpad gamepad.
>=20
> Tested on two hosts (x86_64/xhci and Raspberry Pi 3B/dwc_otg).
>=20
> Signed-off-by: Danny Zimmer <dzimmer50@googlemail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022061214.3497=
578-1-dzimmer50@googlemail.com?part=3D1

