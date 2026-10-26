Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021838;
	b=JO/yPY1RZBd9D3xfnLHVIySJzu11nYiMyqeQctV1x0HEuEujAb5k2W6Sjx4yfjdLpptC
	 6qt8AaOvyeGHIogNkkah+RCL0oQJIpP03DPXqVHaI4a3gMzoCt+sdvbqxIzMnCgisCOOP
	 ijuCtxovLg+q4/ut2b9Xh1fl0Yy1zFIuuAcIAZkyZPDWO+WnrGTM5nC7fdWs/e01uAjQ9
	 s620zeNLbk3voohbXglYp21bpsCgtC0Rib8kMrab1t1h4YK8Xi+zS06FzzEXKMFtsMMj6
	 Y/g8ogUb9c8bdA6UjgUM1sLfqtSvfa7c5YLsWHbDDYLKuhNdcxCuvR3i/Dp6EnqCj0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021838;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/UyLaNDJqZQFegb1fvj+/sQkkrK0yxS+Ja0wSP904Es=;
	b=DKtDU/oXUKDxnwCufy761aWIT0bRcHCNBtcygyIej4NwC6e0zVJgL4NCHcUtYAnTnBTg
	 kcpOI9SoXz0vb0q02+s4oV6O7sSYUsa9Thl/m5Cnq94yU8BozaoEv+Fzxs/fYg3uRLl+7
	 LQArtklnOqoIy9BrXPaTjRv05FAX/0ypDrQID880UTr0RwqWiNCBTQ/n/31/ZCZ0twnfT
	 Ba9OvkW8h2xx8M6LNF/rWhD4fm+4YsjBZkscl3u4lnrcn6Edkg5eGLfFKKgt8TSsIOfZk
	 UYAy6yBiz/gMFSFKVoAfmk2yWZEKpOFk6mT9GmT4z5nv7IHRXBNQ85C9Ilsb9yMu32g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I2SzJlA5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B04260A260A
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 13:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I2SzJlA5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E0201F01825;
	Mon, 26 Oct 2026 13:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793021837;
	bh=/UyLaNDJqZQFegb1fvj+/sQkkrK0yxS+Ja0wSP904Es=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I2SzJlA5uqTauXSAjT2lRoS+kTWzvxBd7xMXaxWwejndCiNbE4fi+sqwEPKR/Exts
	 GSaqwiQxQ2eb4gTitJ6v0dYrkhhGSGBjXWfnFXqJ8xf/4DeOd12ePflsp5vr1s9uli
	 7tCV+MtRukCvbrQgsHQaMNlQ4LY0pLuMhJVMPVDwyGTOzsvmchkzBrJDkeyGf33tUI
	 RBOfMxe0aBV7CFdgcOa46NeguyoLs5UiMXWk4b8YluTVAYexhmL+t589x+sezrGcya
	 BtfN4cfN3pBvsYSOeQ6kU/UM1Q5AGjLj8cPwfg9wa7dDAe27zo9k9uENa8VOTpM3RS
	 r20Ssav3PLyxQ==
Message-ID: <sashiko-outbox-185317@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: core: quirks: Skip device qualifier for BEITONG
 BTP-PG01A
Reply-To: sashiko-reviews@lists.linux.dev
To: ZeroNinEX <zwq939681378@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261026133448.10185-1-zwq939681378@gmail.com>
References: <20261026133448.10185-1-zwq939681378@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 13:37:17 +0000
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
> Signed-off-by: ZeroNinEX <zwq939681378@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026133448.1018=
5-1-zwq939681378@gmail.com?part=3D1

