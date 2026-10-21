Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592526;
	b=KgTIC+BKWCSD6yl6MY01iMFD9S0EaEnjv0dnW3DR05obrt72CYrawhkOKQ08Pc1mYfc7
	 b62J0yVuPxD0eAuo2sghTCJJElhOVbcG6QFYJUjQMm8hENhtppAiMSX0tId87/lInSYpQ
	 kShkj85a8SB3ieDekk9JXo/ywVv5jHib8WKRMMIozuq4DXkYkIHGpHtVIUaEx/90TK8V8
	 kv+yETphl/VAVUgzDNofZBMXRbR/Wtz4VVyJ00biByezNx95B3noxNXvk+YdRgGKmyGUj
	 T/ru8uw79blgUI8kVKZMV+6Rxd4QbbSQWqfyWt9Aamnx7+az9PJAtyo2kehA1K/dkHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592526;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VECQVwb564z2KMreThjA00DIpj386UJBcnW+9e78ZSQ=;
	b=MYd2nu+nXpX+PMQW8p6Q+7tSmZV8anGLwaEqJZWVjlMKsVhSdoKxFNyU3MZwJTTja155
	 dnZSavZa6SFeaITFF0fdSFaLhS2j9ruhfqlD/MgytAszokgozXP6khX4AwospGJPWf+lM
	 hyvgsX6SwJP+BWTgE0jzmnSUwPyirzV0apctlSJeJ3Gic04RMcjbeC3ouPExxaruzTXEN
	 3Sqsay2ngqI4IvZ0LbrdC6vxRIynN9EBvFzcXe3+B9+pkkZYE0gl1vrWKoJZM3DNQaMjm
	 eAY5X5kE/Bw09TZG1DMgkqlYd1u0GZhNdX5mWiOJ6tGw3fWXrq11jUeVkWvAQvWT8xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SNtYgyD7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B89606A32C
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 14:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SNtYgyD7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67E1A1F000C5;
	Wed, 21 Oct 2026 14:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792592525;
	bh=VECQVwb564z2KMreThjA00DIpj386UJBcnW+9e78ZSQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SNtYgyD7doDzCM6zjlE/945Gfb3IerbhXyiVDo0sLZDowFgPmlkA2+AKd0OZNwKfH
	 bpMutpnDD7c61sCCsgPywv8heUhQBWHLOZz5z944MjWGFagx6/UlNgBehd+4RPMr3I
	 MMJgnSYAq7c7SGl3KY2RXF/0dbQrF6t5SPNl1OXGE2pVSLbAhvV/RxKLpfAimZ1OBp
	 it3K98aG7s6++OGus3tTfQSWNIKWfE26IIvMGcYmBLdK2gvwM8amvcY4NQwAs+gwbV
	 hrfU1/FlUy/TClIWzE5s35FeErLFRZ+PNtKf2QO3mfOoTMozpW5GYNvB7Pb6+/YXP3
	 +jFTl8KIhgcMw==
Message-ID: <sashiko-outbox-180360@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/11] USB: serial: io_edgeport: deassert DTR/RTS on
 close() and B0
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261021141154.2324793-10-johan@kernel.org>
References: <20261021141154.2324793-1-johan@kernel.org>
 <20261021141154.2324793-10-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 14:22:05 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The modem control signals DTR and RTS should be dropped on close() if
> HUPCL is set and when requesting B0, but the driver is currently only
> asserting the signals on open().
>=20
> Implement the missing dtr_rts() callback to handle open() and close()
> while letting set_termios() handle B0 transitions.
>=20
> Signed-off-by: Johan Hovold <johan@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021141154.2324=
793-1-johan@kernel.org?part=3D9

