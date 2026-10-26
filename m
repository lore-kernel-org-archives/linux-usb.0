Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793027604;
	b=dRkidyvn3mTbtwSS3VjEQUoqM+UAIoZ70rnUtW12Wg1y1kUX/14YoDlEZX7TqJJrMPdO
	 2FFOavw5+n3uW+9AU0dDT143hmZIQsHPy6P2q1KtfRBLz+KbFzFXdCYpsms4ZldWQhX1W
	 D/1bdVwT4jHTgmLkrp653imfjEcsK/axHFy8t3fQBCPT7j/QJlwx7BSDbZ0zBDRVmrkf5
	 wfVrAu5laUjCS2OVLnsRmiV4M1rHPPHroTFwM2KSHeQBt7kOvwTgIxAG70udPcNg7MIrM
	 +t+7fbDBQHBV2648y9nhxuWyxSDuKgyiAB2iTFEq7M8wyf5BZO/Njb8UBcRTYXH0aOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027604;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YM+wwlFuss0sRaFQq6tffHRpt84OtguTA7vHRrZ9DK4=;
	b=5LKR9jz8lxsUZnMk2ksRoydT8CuThAypl2tLUV3iA57sZcMfsTMDBoYgk/x2cGVTyav0
	 wHlpKP8oAycCmuHOvKKsQ+HZ3C0W7MlZ3tB0oFrHxjB1uAJHZIvowGUB/CiTQ3zF+YWHG
	 VLDogVXLdmmaDckzgPb7oB63Z3Xe063pl/t4eY1IctoKmI0Dh/T8A3BuPzPnVNWe/Um1a
	 jHhxNIf+FuZr+q3jgmWusmmAl7Wc/QKEzNUcnw7pFTYDgiPms3G7pzp9jfc3+Hldvqnfm
	 M0CUUdS57fpO64OmHQw15jdQhKEL51GvSNYKkUlA7QSvkKLHQQmvPaRVuU7XRY65i0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NG912cux;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DB8606A31A
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 15:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NG912cux
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 029A21F01825;
	Mon, 26 Oct 2026 15:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793027604;
	bh=YM+wwlFuss0sRaFQq6tffHRpt84OtguTA7vHRrZ9DK4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NG912cuxb1Rf4lup78whk8Ghn8PrJFQrrQ2Azffbh81lB+aYX9X2uKALM923b07In
	 71462vl2w5MABJENE+JlDpkaCtXIHv3V49554LoRmYYYM54AVm7Vh/lr5EXHxl9g3g
	 xbYs+dUbdoqEFgWL9psb5/2ywErTWnpAKn9IueKa2K6STEiwl1lDKQzL947oC8m8mt
	 ZSaza1sBxao3FCNjuua1mmTCqdqM3/TGKHK1HXorM+de1MTRpfShPIzTV2nAm/xhY1
	 l3NLEKjB/ke8ZOpcoqTQNkWrZSLAmiH+b0ozuQ7GgFGO6zoCKe8b38ouMwmw2QTUGr
	 PwCV3EF8/SyvA==
Message-ID: <sashiko-outbox-185425@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: core: quirks: Skip device qualifier for BEITONG
 BTP-PG01A
Reply-To: sashiko-reviews@lists.linux.dev
To: "Weiqin Zhu" <zwq939681378@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261026151003.16869-1-zwq939681378@gmail.com>
References: <20261026151003.16869-1-zwq939681378@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 15:13:23 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The BEITONG BTP-PG01A wireless controller dongle initially enumerates as
> 4131:800c. Device qualifier requests fail with -EPIPE, followed by
> failures to read the configuration descriptor. After port recovery,
> the dongle can enumerate as 045e:028e with only two interfaces, leaving
> the vendor configuration software unusable in a Windows guest.
>=20
> Add USB_QUIRK_DEVICE_QUALIFIER for 4131:800c to skip device qualifier
> requests. The dongle then enumerates as 20bc:5162 with five interfaces,
> including three HID interfaces, and the vendor software works through
> USB passthrough to a Windows VM.
>=20
> Tested both usbcore.quirks=3D4131:800c:i and the built-in entry on an xHCI
> host. The patched kernel was tested without a dynamic usbcore.quirks
> entry. The configuration-request size quirk alone did not resolve the
> enumeration failure.
>=20
> Signed-off-by: Weiqin Zhu <zwq939681378@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026151003.1686=
9-1-zwq939681378@gmail.com?part=3D1

